@implementation NEFlowDivertFileHandle

- (id)initFlowDivertControlSocket
{
  return -[NEFlowDivertFileHandle initFlowDivertControlSocketDisableAppMap:](self, "initFlowDivertControlSocketDisableAppMap:", 0);
}

- (id)initFlowDivertControlSocketDisableAppMap:(BOOL)a3
{
  return -[NEFlowDivertFileHandle initFlowDivertControlSocketWithParams:order:](self, "initFlowDivertControlSocketWithParams:order:", a3, 0x7FFFFFFFLL);
}

- (id)initFlowDivertControlSocketWithParams:(BOOL)a3 order:(int)a4
{
  uint64_t KernelControlSocket;
  int v6;
  NSNumber *v7;
  NSNumber *controlUnit;
  void *v9;
  ssize_t v10;
  NSData *v11;
  NSObject *p_super;
  NEFlowDivertFileHandle *v13;
  int *v15;
  char *v16;
  objc_super v17;
  int v18;
  uint8_t buf[4];
  char *v20;
  _BYTE __buf[256];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v18 = a4;
  KernelControlSocket = NEHelperGetKernelControlSocket();
  if ((KernelControlSocket & 0x80000000) != 0)
    goto LABEL_11;
  v6 = KernelControlSocket;
  v17.receiver = self;
  v17.super_class = (Class)NEFlowDivertFileHandle;
  self = -[NEFileHandle initWithFileDescriptor:launchOwnerWhenReadable:](&v17, sel_initWithFileDescriptor_launchOwnerWhenReadable_, KernelControlSocket, 1);
  if (!self)
    goto LABEL_10;
  -[NEFlowDivertFileHandle getUnitForSocket:](v6);
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  controlUnit = self->_controlUnit;
  self->_controlUnit = v7;

  arc4random_buf(__buf, 0x100uLL);
  v9 = (void *)NEFlowTLVMsgCreate();
  NEFlowTLVAdd();
  nelog_is_debug_logging_enabled();
  NEFlowTLVAdd();
  NEFlowTLVAdd();
  NEFlowTLVAdd();
  v10 = send(v6, v9, 0, 0);
  if (v10 < 0)
  {
    ne_log_obj();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      v15 = __error();
      v16 = strerror(*v15);
      *(_DWORD *)buf = 136315138;
      v20 = v16;
      _os_log_error_impl(&dword_19BD16000, p_super, OS_LOG_TYPE_ERROR, "Failed to send the FLOW_DIVERT_PKT_GROUP_INIT message: %s", buf, 0xCu);
    }
  }
  else
  {
    v11 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", __buf, 256);
    p_super = &self->_keyMaterial->super;
    self->_keyMaterial = v11;
  }

  if (v9)
    CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v9);
  if (v10 < 0)
  {
LABEL_11:
    v13 = 0;
  }
  else
  {
LABEL_10:
    self = self;
    v13 = self;
  }

  return v13;
}

- (id)initFlowDivertDataSocket
{
  uint64_t KernelControlSocket;
  int v4;
  NEFlowDivertFileHandle *v5;
  uint64_t v6;
  NSNumber *controlUnit;
  NEFlowDivertFileHandle *v8;
  objc_super v10;

  KernelControlSocket = NEHelperGetKernelControlSocket();
  if ((KernelControlSocket & 0x80000000) != 0)
  {
    v8 = 0;
  }
  else
  {
    v4 = KernelControlSocket;
    v10.receiver = self;
    v10.super_class = (Class)NEFlowDivertFileHandle;
    v5 = -[NEFileHandle initWithFileDescriptor:launchOwnerWhenReadable:](&v10, sel_initWithFileDescriptor_launchOwnerWhenReadable_, KernelControlSocket, 1);
    if (v5)
    {
      -[NEFlowDivertFileHandle getUnitForSocket:](v4);
      v6 = objc_claimAutoreleasedReturnValue();
      controlUnit = v5->_controlUnit;
      v5->_controlUnit = (NSNumber *)v6;

    }
    self = v5;
    v8 = self;
  }

  return v8;
}

- (id)initFromDictionary:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t uint64;
  const void *data;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  size_t length;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NEFlowDivertFileHandle;
  v5 = -[NEFileHandle initFromDictionary:](&v14, sel_initFromDictionary_, v4);
  if (v5)
  {
    uint64 = xpc_dictionary_get_uint64(v4, "control-unit");
    length = 0;
    data = xpc_dictionary_get_data(v4, "key-material", &length);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", uint64);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v5[3];
    v5[3] = v8;

    if (data)
    {
      if (length)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v5[4];
        v5[4] = v10;

      }
    }
  }

  return v5;
}

- (id)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  const void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NEFlowDivertFileHandle;
  -[NEFileHandle dictionary](&v11, sel_dictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEFlowDivertFileHandle controlUnit](self, "controlUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_uint64(v3, "control-unit", objc_msgSend(v4, "unsignedLongLongValue"));

  -[NEFlowDivertFileHandle keyMaterial](self, "keyMaterial");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    -[NEFlowDivertFileHandle keyMaterial](self, "keyMaterial");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const void *)objc_msgSend(v7, "bytes");
    -[NEFlowDivertFileHandle keyMaterial](self, "keyMaterial");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_data(v3, "key-material", v8, objc_msgSend(v9, "length"));

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NEFileHandle handle](self, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileDescriptor");
  -[NEFlowDivertFileHandle controlUnit](self, "controlUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Flow Divert socket (%d) control unit %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)type
{
  return 3;
}

- (NSNumber)controlUnit
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)keyMaterial
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyMaterial, 0);
  objc_storeStrong((id *)&self->_controlUnit, 0);
}

- (id)getUnitForSocket:(int)a1
{
  NSObject *v1;
  int *v3;
  char *v4;
  socklen_t v5;
  sockaddr v6;
  __int128 v7;
  uint8_t buf[4];
  char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = 32;
  v6 = (sockaddr)0;
  v7 = 0u;
  if (getpeername(a1, &v6, &v5))
  {
    ne_log_obj();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      v3 = __error();
      v4 = strerror(*v3);
      *(_DWORD *)buf = 136315138;
      v9 = v4;
      _os_log_error_impl(&dword_19BD16000, v1, OS_LOG_TYPE_ERROR, "getpeername on control socket failed: %s", buf, 0xCu);
    }

    return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)&v6.sa_data[6]);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

@end
