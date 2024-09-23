@implementation NEVirtualInterfaceParameters

- (NEVirtualInterfaceParameters)initWithVirtualInterface:(NEVirtualInterface_s *)a3
{
  NEVirtualInterfaceParameters *v4;
  uint64_t v5;
  NSFileHandle *controlSocket;
  CFStringRef v7;
  NSString *name;
  int64_t v9;
  uint64_t v10;
  NSFileHandle *v11;
  NSString *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NEVirtualInterfaceParameters;
  v4 = -[NEVirtualInterfaceParameters init](&v14, sel_init);
  if (v4)
  {
    if (a3)
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", dup(*((_DWORD *)a3 + 74)), 1);
      controlSocket = v4->_controlSocket;
      v4->_controlSocket = (NSFileHandle *)v5;

      v7 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const char *)a3 + 265, 0x600u);
      name = v4->_name;
      v4->_name = &v7->isa;

      v9 = *((_QWORD *)a3 + 32);
    }
    else
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", 0xFFFFFFFFLL, 1);
      v11 = v4->_controlSocket;
      v4->_controlSocket = (NSFileHandle *)v10;

      v12 = v4->_name;
      v4->_name = 0;

      v9 = 0;
    }
    v4->_type = v9;
  }
  return v4;
}

- (NEVirtualInterfaceParameters)initWithType:(int64_t)a3 maxPendingPackets:(unint64_t)a4 ethernetAddress:(id)a5 mtu:(id)a6
{
  id v11;
  id v12;
  NEVirtualInterfaceParameters *v13;
  NEVirtualInterfaceParameters *v14;
  objc_super v16;

  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)NEVirtualInterfaceParameters;
  v13 = -[NEVirtualInterfaceParameters init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_type = a3;
    v13->_maxPendingPackets = a4;
    objc_storeStrong((id *)&v13->_ethernetAddress, a5);
    objc_storeStrong((id *)&v14->_mtu, a6);
  }

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  if (-[NEVirtualInterfaceParameters userEthernetController](self, "userEthernetController"))
    CFRelease(-[NEVirtualInterfaceParameters userEthernetController](self, "userEthernetController"));
  v3.receiver = self;
  v3.super_class = (Class)NEVirtualInterfaceParameters;
  -[NEVirtualInterfaceParameters dealloc](&v3, sel_dealloc);
}

- (NEVirtualInterface_s)createVirtualInterfaceWithQueue:(id)a3 clientInfo:(void *)a4
{
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  id v10;
  NEVirtualInterface_s *v11;
  int v12;
  NSObject *v13;
  _DWORD v15[2];
  __int16 v16;
  char *v17;
  char __strerrbuf[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NEVirtualInterfaceParameters controlSocket](self, "controlSocket");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = dup(objc_msgSend(v7, "fileDescriptor"));

  if (v8 < 0)
  {
    v12 = *__error();
    if (strerror_r(v12, __strerrbuf, 0x80uLL))
      __strerrbuf[0] = 0;
    ne_log_obj();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v15[0] = 67109378;
      v15[1] = v12;
      v16 = 2080;
      v17 = __strerrbuf;
      _os_log_fault_impl(&dword_19BD16000, v13, OS_LOG_TYPE_FAULT, "Failed to dup the interface control socket: [%d] %s", (uint8_t *)v15, 0x12u);
    }

    v11 = 0;
  }
  else
  {
    v9 = *MEMORY[0x1E0C9AE00];
    -[NEVirtualInterfaceParameters name](self, "name");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (NEVirtualInterface_s *)NEVirtualInterfaceCreateFromSocketAndName(v9, v8, objc_msgSend(v10, "UTF8String"), -[NEVirtualInterfaceParameters type](self, "type"), v6, (uint64_t)a4);

  }
  return v11;
}

- (NEVirtualInterfaceParameters)initWithCoder:(id)a3
{
  id v4;
  NEVirtualInterfaceParameters *v5;
  uint64_t v6;
  NSFileHandle *controlSocket;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  NSData *ethernetAddress;
  uint64_t v12;
  NSNumber *mtu;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NEVirtualInterfaceParameters;
  v5 = -[NEVirtualInterfaceParameters init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("controlSocket"));
    v6 = objc_claimAutoreleasedReturnValue();
    controlSocket = v5->_controlSocket;
    v5->_controlSocket = (NSFileHandle *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v5->_maxPendingPackets = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("maxPendingPackets"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ethernetAddress"));
    v10 = objc_claimAutoreleasedReturnValue();
    ethernetAddress = v5->_ethernetAddress;
    v5->_ethernetAddress = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mtu"));
    v12 = objc_claimAutoreleasedReturnValue();
    mtu = v5->_mtu;
    v5->_mtu = (NSNumber *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[NEVirtualInterfaceParameters controlSocket](self, "controlSocket");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("controlSocket"));

  -[NEVirtualInterfaceParameters name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("name"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[NEVirtualInterfaceParameters type](self, "type"), CFSTR("type"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[NEVirtualInterfaceParameters maxPendingPackets](self, "maxPendingPackets"), CFSTR("maxPendingPackets"));
  -[NEVirtualInterfaceParameters ethernetAddress](self, "ethernetAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("ethernetAddress"));

  -[NEVirtualInterfaceParameters mtu](self, "mtu");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("mtu"));

}

- (NSFileHandle)controlSocket
{
  return self->_controlSocket;
}

- (void)setControlSocket:(id)a3
{
  objc_storeStrong((id *)&self->_controlSocket, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)userEthernetController
{
  return self->_userEthernetController;
}

- (void)setUserEthernetController:(void *)a3
{
  self->_userEthernetController = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (unint64_t)maxPendingPackets
{
  return self->_maxPendingPackets;
}

- (NSData)ethernetAddress
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)mtu
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mtu, 0);
  objc_storeStrong((id *)&self->_ethernetAddress, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_controlSocket, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
