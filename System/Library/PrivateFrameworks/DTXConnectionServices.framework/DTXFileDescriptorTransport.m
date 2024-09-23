@implementation DTXFileDescriptorTransport

- (DTXFileDescriptorTransport)init
{
  DTXFileDescriptorTransport *v2;
  DTXFileDescriptorTransport *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DTXFileDescriptorTransport;
  v2 = -[DTXTransport init](&v5, sel_init);
  v3 = v2;
  if (v2)
    sub_21DC9F17C(v2);
  return v3;
}

- (DTXFileDescriptorTransport)initWithIncomingFilePath:(id)a3 outgoingFilePath:(id)a4 error:(id *)a5
{
  unint64_t v8;
  unint64_t v9;
  DTXFileDescriptorTransport *v10;
  DTXFileDescriptorTransport *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  stat v18;
  objc_super v19;

  v8 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  v19.receiver = self;
  v19.super_class = (Class)DTXFileDescriptorTransport;
  v10 = -[DTXTransport init](&v19, sel_init);
  v11 = v10;
  if (v10)
  {
    sub_21DC9F17C(v10);
    if (v8)
    {
      v14 = sub_21DC9F394((void *)v8, 0x1000000, a5);
      if ((v14 & 0x80000000) == 0)
      {
        v15 = v14;
        memset(&v18, 0, sizeof(v18));
        if (fstat(v14, &v18) || !v18.st_size)
          objc_msgSend_disconnect(v11, v12, v16);
        if (!v9)
          goto LABEL_15;
LABEL_11:
        if ((sub_21DC9F394((void *)v9, 16778753, a5) & 0x80000000) != 0)
          goto LABEL_16;
LABEL_15:
        objc_msgSend_setupWithIncomingDescriptor_outgoingDescriptor_disconnectBlock_(v11, v12, v15);
        goto LABEL_17;
      }
    }
    else
    {
      if (v9)
      {
        v15 = 0xFFFFFFFFLL;
        goto LABEL_11;
      }
      if (v8 | v9)
      {
        v15 = 0xFFFFFFFFLL;
        goto LABEL_15;
      }
    }
LABEL_16:
    objc_msgSend_disconnect(v11, v12, v13);

    v11 = 0;
  }
LABEL_17:

  return v11;
}

- (DTXFileDescriptorTransport)initWithIncomingFileDescriptor:(int)a3 outgoingFileDescriptor:(int)a4 disconnectBlock:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  DTXFileDescriptorTransport *v9;
  DTXFileDescriptorTransport *v10;
  const char *v11;
  char v12;
  objc_super v14;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)DTXFileDescriptorTransport;
  v9 = -[DTXTransport init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    sub_21DC9F17C(v9);
    if ((int)(v5 & v6) < 0 != v12)
    {

      v10 = 0;
    }
    else
    {
      objc_msgSend_setupWithIncomingDescriptor_outgoingDescriptor_disconnectBlock_(v10, v11, v6, v5, v8);
    }
  }

  return v10;
}

- (void)_setupReadSource:(int)a3
{
  NSObject *v5;
  int v6;
  void *v7;
  void *v8;
  id inputReaderBlock;
  OS_dispatch_source *inputSource;
  NSObject *v11;
  _QWORD v12[5];
  int v13;

  v5 = dispatch_source_create(MEMORY[0x24BDACA00], a3, 0, (dispatch_queue_t)self->_inputQueue);
  if ((a3 & 0x80000000) == 0)
  {
    v6 = fcntl(a3, 3);
    if ((v6 & 4) == 0)
      fcntl(a3, 4, v6 | 4u);
  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_21DC9F67C;
  v12[3] = &unk_24E1AB2F8;
  v13 = a3;
  v12[4] = self;
  v7 = (void *)MEMORY[0x22079E258](v12);
  v8 = (void *)MEMORY[0x22079E258]();
  inputReaderBlock = self->_inputReaderBlock;
  self->_inputReaderBlock = v8;

  dispatch_source_set_event_handler(v5, self->_inputReaderBlock);
  inputSource = self->_inputSource;
  self->_inputSource = (OS_dispatch_source *)v5;
  v11 = v5;

  dispatch_resume(v11);
}

- (int)_createWriteKQueue:(int)a3
{
  uint64_t v3;
  int v4;
  int v5;
  int *v6;
  uint64_t v8;
  uint64_t v9;
  kevent changelist;

  v3 = *(_QWORD *)&a3;
  if (a3 < 0 || fcntl(a3, 73, 1) == -1)
  {
    v6 = __error();
    NSLog(CFSTR("Unable to disable SIGPIPE for FD %d: %d"), v3, *v6);
    return -1;
  }
  else
  {
    v4 = kqueue();
    v5 = v4;
    if (v4 < 0)
    {
      v9 = *__error();
      NSLog(CFSTR("Failed to create output kqueue(): %d"), v9);
    }
    else
    {
      changelist.ident = v3;
      *(_DWORD *)&changelist.filter = 2490366;
      memset(&changelist.fflags, 0, 20);
      if (kevent(v4, &changelist, 1, 0, 0, 0) == -1)
      {
        v8 = *__error();
        NSLog(CFSTR("Failed to handle kevent(): %d"), v8);
      }
    }
  }
  return v5;
}

- (void)setupWithIncomingDescriptor:(int)a3 outgoingDescriptor:(int)a4 disconnectBlock:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v8;
  id disconnectBlock;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  int v14;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  self->_inFD = a3;
  self->_outFD = a4;
  v8 = (void *)MEMORY[0x22079E258](a5, a2);
  disconnectBlock = self->_disconnectBlock;
  self->_disconnectBlock = v8;

  if (objc_msgSend_status(self, v10, v11) == 3)
    goto LABEL_2;
  if ((v6 & 0x80000000) != 0)
  {
    if ((v5 & 0x80000000) != 0)
    {
LABEL_2:
      objc_msgSend_disconnect(self, v12, v13);
      return;
    }
  }
  else if ((v5 & 0x80000000) != 0)
  {
    goto LABEL_9;
  }
  v14 = objc_msgSend__createWriteKQueue_(self, v12, v5);
  if (v14 < 0)
    goto LABEL_2;
  self->_outputWaitKQ = v14;
  if ((v6 & 0x80000000) == 0)
LABEL_9:
    objc_msgSend__setupReadSource_(self, v12, v6);
  objc_msgSend_setStatus_(self, v12, 1);
}

- (DTXFileDescriptorTransport)initWithXPCRepresentation:(id)a3
{
  id v4;
  DTXFileDescriptorTransport *v5;
  DTXFileDescriptorTransport *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DTXFileDescriptorTransport;
  v5 = -[DTXTransport initWithXPCRepresentation:](&v11, sel_initWithXPCRepresentation_, v4);
  v6 = v5;
  if (v5)
  {
    sub_21DC9F17C(v5);
    v7 = xpc_dictionary_dup_fd(v4, "_inFD");
    v8 = xpc_dictionary_dup_fd(v4, "_outFD");
    if ((v7 & 0x80000000) != 0 && v8 < 0)
    {

      v6 = 0;
    }
    else
    {
      objc_msgSend_setupWithIncomingDescriptor_outgoingDescriptor_disconnectBlock_(v6, v9, v7);
    }
  }

  return v6;
}

- (void)dealloc
{
  int outputWaitKQ;
  objc_super v4;

  outputWaitKQ = self->_outputWaitKQ;
  if ((outputWaitKQ & 0x80000000) == 0)
  {
    close(outputWaitKQ);
    self->_outputWaitKQ = -1;
  }
  v4.receiver = self;
  v4.super_class = (Class)DTXFileDescriptorTransport;
  -[DTXTransport dealloc](&v4, sel_dealloc);
}

- (id)serializedXPCRepresentation
{
  NSObject *outputQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_21DC9FBAC;
  v10 = sub_21DC9FBBC;
  v11 = 0;
  outputQueue = self->_outputQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_21DC9FBC4;
  v5[3] = &unk_24E1AAA28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(outputQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (unint64_t)transmit:(const void *)a3 ofLength:(unint64_t)a4
{
  unsigned int (**v7)(_QWORD);
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  kevent eventlist;
  _QWORD v14[8];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  if (objc_msgSend_status(self, a2, (uint64_t)a3) == 1)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = sub_21DC9FE48;
    v14[3] = &unk_24E1AB950;
    v14[4] = self;
    v14[5] = &v15;
    v14[6] = a3;
    v14[7] = a4;
    v7 = (unsigned int (**)(_QWORD))MEMORY[0x22079E258](v14);
    while (v7[2](v7) && v16[3] < a4)
    {
      memset(&eventlist, 0, sizeof(eventlist));
      v10 = kevent(self->_outputWaitKQ, 0, 0, &eventlist, 1, 0);
      if ((_DWORD)v10 == 1)
      {
        if ((__int16)eventlist.flags < 0)
          goto LABEL_10;
      }
      else if (*__error() != 4)
      {
        v11 = __error();
        NSLog(CFSTR("kevent failure: num events was %d (errno: %d)"), v10, *v11);
LABEL_10:
        objc_msgSend_disconnect(self, v8, v9);
        break;
      }
    }
    a4 = v16[3];

    _Block_object_dispose(&v15, 8);
  }
  return a4;
}

- (void)disconnect
{
  NSObject *inputSource;
  NSObject *inputQueue;
  uint64_t v5;
  NSObject *outputQueue;
  _QWORD v7[5];
  objc_super v8;
  _QWORD block[5];

  inputSource = self->_inputSource;
  if (inputSource)
    dispatch_source_cancel(inputSource);
  inputQueue = self->_inputQueue;
  v5 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21DCA0084;
  block[3] = &unk_24E1AAAC8;
  block[4] = self;
  dispatch_sync(inputQueue, block);
  v8.receiver = self;
  v8.super_class = (Class)DTXFileDescriptorTransport;
  -[DTXTransport disconnect](&v8, sel_disconnect);
  outputQueue = self->_outputQueue;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = sub_21DCA00D4;
  v7[3] = &unk_24E1AAAC8;
  v7[4] = self;
  dispatch_async(outputQueue, v7);
}

- (unsigned)supportedDirections
{
  int outFD;
  objc_super v4;

  outFD = self->_outFD;
  if (self->_inFD < 0)
  {
    if (outFD < 0)
    {
      v4.receiver = self;
      v4.super_class = (Class)DTXFileDescriptorTransport;
      return -[DTXTransport supportedDirections](&v4, sel_supportedDirections);
    }
    else
    {
      return 2;
    }
  }
  else if (outFD < 0)
  {
    return 1;
  }
  else
  {
    return 3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_disconnectBlock, 0);
  objc_storeStrong(&self->_inputReaderBlock, 0);
  objc_storeStrong((id *)&self->_inputSource, 0);
  objc_storeStrong((id *)&self->_outputQueue, 0);
  objc_storeStrong((id *)&self->_inputQueue, 0);
}

@end
