@implementation DTXSocketTransport

+ (id)schemes
{
  return (id)MEMORY[0x24BEDD108](MEMORY[0x24BDBCF20], sel_setWithObject_, CFSTR("tcp"));
}

+ (id)addressForHost:(const char *)a3 port:(int)a4
{
  uint64_t v4;
  char *v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;

  v4 = *(_QWORD *)&a4;
  v6 = strnstr(a3, ":", 5uLL);
  v8 = (void *)MEMORY[0x24BDBCF48];
  v9 = "[";
  v10 = "";
  if (v6)
    v10 = "]";
  else
    v9 = "";
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v7, (uint64_t)CFSTR("%@://%s%s%s:%d"), CFSTR("tcp"), v9, a3, v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLWithString_(v8, v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_setupWithLocalPort:(int)a3
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[5];
  int v9;
  _BYTE v10[24];
  int v11;
  int v12;

  v5 = socket(30, 1, 6);
  if ((v5 & 0x80000000) != 0 || (v6 = v5, fcntl(v5, 2, 1) == -1))
    sub_21DCA0350();
  v12 = 1;
  if (setsockopt(v6, 0xFFFF, 4, &v12, 4u))
    sub_21DCA03C8();
  *(_WORD *)v10 = 7708;
  *(_WORD *)&v10[2] = bswap32(a3) >> 16;
  *(_DWORD *)&v10[4] = 0;
  *(_OWORD *)&v10[8] = *MEMORY[0x24BDAE878];
  v11 = 0;
  if (bind(v6, (const sockaddr *)v10, 0x1Cu))
    sub_21DCA03A0();
  if (listen(v6, 1))
    sub_21DCA0378();
  self->_port = sub_21DC94E40(v6);
  atomic_store(v6, (unsigned int *)&self->_socketSemProtector);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_socketAcceptedSem, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21DC94F04;
  block[3] = &unk_24E1AB2F8;
  v9 = v6;
  block[4] = self;
  dispatch_async(v7, block);

}

- (void)_setupChannelWithConnectedSocket:(int)a3 assumingOwnership:(BOOL)a4 orDisconnectBlock:(id)a5
{
  _BOOL4 v5;
  uint64_t v6;
  void (**v8)(_QWORD);
  const char *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  uint64_t v13;
  objc_super v14;
  _QWORD v15[4];
  int v16;

  v5 = a4;
  v6 = *(_QWORD *)&a3;
  v8 = (void (**)(_QWORD))a5;
  if (objc_msgSend_status(self, v9, v10) != 2)
    sub_21DCA03F0();
  self->_port = sub_21DC94E40(v6);
  if (!v8 && v5)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = sub_21DC950E0;
    v15[3] = &unk_24E1AB318;
    v16 = v6;
    v8 = (void (**)(_QWORD))MEMORY[0x22079E258](v15);
  }
  if ((v6 & 0x80000000) == 0)
  {
    v11 = fcntl(v6, 3);
    if ((v11 & 4) == 0)
    {
      fcntl(v6, 4, v11 | 4u);
LABEL_9:
      objc_msgSend__signalSocketAccepted(self, v12, v13);
      v14.receiver = self;
      v14.super_class = (Class)DTXSocketTransport;
      -[DTXFileDescriptorTransport setupWithIncomingDescriptor:outgoingDescriptor:disconnectBlock:](&v14, sel_setupWithIncomingDescriptor_outgoingDescriptor_disconnectBlock_, v6, v6, v8);
      goto LABEL_12;
    }
    if (v11 != -1)
      goto LABEL_9;
  }
  NSLog(CFSTR("Unable to set non-blocking for FD: %d"), v6);
  if (v8)
    v8[2](v8);
LABEL_12:

}

- (void)_commonSocketTransportInit
{
  OS_dispatch_semaphore *v3;
  OS_dispatch_semaphore *socketAcceptedSem;

  v3 = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
  socketAcceptedSem = self->_socketAcceptedSem;
  self->_socketAcceptedSem = v3;

  atomic_store(0xFFFFFFFF, (unsigned int *)&self->_socketSemProtector);
}

- (void)_signalSocketAccepted
{
  int *p_socketSemProtector;
  int v4;

  p_socketSemProtector = &self->_socketSemProtector;
  do
    v4 = __ldaxr((unsigned int *)p_socketSemProtector);
  while (__stlxr(0xFFFFFFFF, (unsigned int *)p_socketSemProtector));
  if (v4 != -1)
  {
    if (self->_socketAcceptedSem)
    {
      close(v4);
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_socketAcceptedSem);
    }
  }
}

- (DTXSocketTransport)initWithConnectedSocket:(int)a3 disconnectAction:(id)a4
{
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  DTXSocketTransport *v10;
  const char *v11;
  uint64_t v12;
  DTXSocketTransport *v13;
  const char *v14;
  void *v16;
  const char *v17;
  objc_super v18;

  v4 = *(_QWORD *)&a3;
  v9 = (void (**)(_QWORD))a4;
  if ((v4 & 0x80000000) != 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v7, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, self, CFSTR("DTXSocketTransport.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("socketFileDescriptor >= 0"));

  }
  v18.receiver = self;
  v18.super_class = (Class)DTXSocketTransport;
  v10 = -[DTXFileDescriptorTransport init](&v18, sel_init);
  v13 = v10;
  if (v10)
  {
    objc_msgSend__commonSocketTransportInit(v10, v11, v12);
    objc_msgSend__setupChannelWithConnectedSocket_assumingOwnership_orDisconnectBlock_(v13, v14, v4, 0, v9);
  }
  else if (v9)
  {
    v9[2](v9);
  }

  return v13;
}

- (DTXSocketTransport)initWithLocalPort:(int)a3
{
  uint64_t v3;
  DTXSocketTransport *v4;
  const char *v5;
  uint64_t v6;
  DTXSocketTransport *v7;
  const char *v8;
  objc_super v10;

  v3 = *(_QWORD *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)DTXSocketTransport;
  v4 = -[DTXFileDescriptorTransport init](&v10, sel_init);
  v7 = v4;
  if (v4)
  {
    objc_msgSend__commonSocketTransportInit(v4, v5, v6);
    objc_msgSend__setupWithLocalPort_(v7, v8, v3);
  }
  return v7;
}

- (DTXSocketTransport)initWithRemoteAddress:(id)a3
{
  id v5;
  DTXSocketTransport *v6;
  const char *v7;
  uint64_t v8;
  DTXSocketTransport *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  id v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  int v29;
  objc_class *v30;
  void *v31;
  void *v32;
  addrinfo *i;
  uint64_t v34;
  uint64_t v35;
  int *v36;
  const char *v38;
  uint64_t v39;
  NSArray *addresses;
  const char *v41;
  const char *v42;
  char *v43;
  addrinfo *v44;
  addrinfo v45;
  objc_super v46;

  v5 = a3;
  v46.receiver = self;
  v46.super_class = (Class)DTXSocketTransport;
  v6 = -[DTXTransport initWithRemoteAddress:](&v46, sel_initWithRemoteAddress_, v5);
  v9 = v6;
  if (v6)
  {
    objc_msgSend__commonSocketTransportInit(v6, v7, v8);
    memset(&v45.ai_addrlen, 0, 32);
    v45.ai_family = 0;
    v45.ai_flags = 5120;
    *(_QWORD *)&v45.ai_socktype = 0x600000001;
    v44 = 0;
    objc_msgSend_host(v5, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_port(v5, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_intValue(v15, v16, v17);

    if ((_DWORD)v18)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v19, (uint64_t)CFSTR("%d"), v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_retainAutorelease(v12);
      v24 = (const char *)objc_msgSend_UTF8String(v21, v22, v23);
      v25 = objc_retainAutorelease(v20);
      v28 = (const char *)objc_msgSend_UTF8String(v25, v26, v27);
      v29 = getaddrinfo(v24, v28, &v45, &v44);
      if (v29)
      {
        v42 = gai_strerror(v29);
        NSLog(CFSTR("error finding address %@: %s"), v5, v42);
      }
      else
      {
        for (i = v44; i; i = i->ai_next)
        {
          v34 = socket(i->ai_family, i->ai_socktype, i->ai_protocol);
          if ((v34 & 0x80000000) == 0)
          {
            v35 = v34;
            if (fcntl(v34, 2, 1) != -1 && (connect(v35, i->ai_addr, i->ai_addrlen) & 0x80000000) == 0)
            {
              freeaddrinfo(v44);
              objc_msgSend_arrayWithObject_(MEMORY[0x24BDBCE30], v38, (uint64_t)v5);
              v39 = objc_claimAutoreleasedReturnValue();
              addresses = v9->_addresses;
              v9->_addresses = (NSArray *)v39;

              objc_msgSend__setupChannelWithConnectedSocket_assumingOwnership_orDisconnectBlock_(v9, v41, v35, 1, 0);
              goto LABEL_15;
            }
            close(v35);
          }
        }
        v36 = __error();
        v43 = strerror(*v36);
        NSLog(CFSTR("Unable to connect to address: %@ (%s)"), v5, v43);
      }

    }
    else
    {
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("-[%@ %@]: Missing port in URL: %@"), v31, v32, v5);

    }
    v9 = 0;
  }
LABEL_15:

  return v9;
}

- (unint64_t)transmit:(const void *)a3 ofLength:(unint64_t)a4
{
  objc_super v8;

  if (objc_msgSend_status(self, a2, (uint64_t)a3) == 2)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_socketAcceptedSem, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_socketAcceptedSem);
  }
  v8.receiver = self;
  v8.super_class = (Class)DTXSocketTransport;
  return -[DTXFileDescriptorTransport transmit:ofLength:](&v8, sel_transmit_ofLength_, a3, a4);
}

- (void)disconnect
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend__signalSocketAccepted(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)DTXSocketTransport;
  -[DTXFileDescriptorTransport disconnect](&v4, sel_disconnect);
}

- (id)localAddresses
{
  uint64_t v2;
  NSArray **p_addresses;
  NSArray *addresses;
  void *v7;
  ifaddrs *v8;
  sockaddr *ifa_addr;
  int sa_family;
  char *v11;
  char *v12;
  char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  ifaddrs *v20;
  ifaddrs *v21;
  char v22[46];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  p_addresses = &self->_addresses;
  addresses = self->_addresses;
  if (addresses)
    return addresses;
  objc_msgSend_array(MEMORY[0x24BDBCEB8], a2, v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  if (!getifaddrs(&v21))
  {
    v8 = v21;
    if (v21)
    {
      do
      {
        ifa_addr = v8->ifa_addr;
        sa_family = ifa_addr->sa_family;
        if (sa_family == 2 || sa_family == 30 && !*(_DWORD *)&ifa_addr[1].sa_data[6])
        {
          v11 = &ifa_addr->sa_data[2];
          v12 = &ifa_addr->sa_data[6];
          if (sa_family == 2)
            v13 = v11;
          else
            v13 = v12;
          if (inet_ntop(sa_family, v13, v22, 0x2Eu) == v22)
          {
            v16 = objc_msgSend_port(self, v14, v15);
            objc_msgSend_addressForHost_port_(DTXSocketTransport, v17, (uint64_t)v22, v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v7, v19, (uint64_t)v18);

          }
        }
        v8 = v8->ifa_next;
      }
      while (v8);
      v20 = v21;
    }
    else
    {
      v20 = 0;
    }
    MEMORY[0x22079DE50](v20);
  }
  objc_storeStrong((id *)p_addresses, v7);
  return v7;
}

- (unsigned)supportedDirections
{
  return 3;
}

- (int)port
{
  return self->_port;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_socketAcceptedSem, 0);
}

@end
