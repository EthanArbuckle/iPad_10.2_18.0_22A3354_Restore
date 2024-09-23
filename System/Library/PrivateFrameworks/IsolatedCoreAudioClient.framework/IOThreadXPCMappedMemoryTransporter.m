@implementation IOThreadXPCMappedMemoryTransporter

- (IOThreadXPCMappedMemoryTransporter)initWithObject:(id)a3
{
  id v5;
  IOThreadXPCMappedMemoryTransporter *v6;
  IOThreadXPCMappedMemoryTransporter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IOThreadXPCMappedMemoryTransporter;
  v6 = -[IOThreadXPCMappedMemoryTransporter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_serverMemory, a3);

  return v7;
}

- (IOThreadXPCMappedMemoryTransporter)initWithCoder:(id)a3
{
  id v4;
  IOThreadXPCMappedMemoryTransporter *v5;
  id v6;
  uint64_t v7;
  OS_xpc_object *serverMemory;
  OS_xpc_object *v9;
  IOThreadXPCMappedMemoryTransporter *v10;
  objc_super v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be decoded by an NSXPCCoder."));
  v12.receiver = self;
  v12.super_class = (Class)IOThreadXPCMappedMemoryTransporter;
  v5 = -[IOThreadXPCMappedMemoryTransporter init](&v12, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_msgSend(v6, "decodeXPCObjectForKey:", CFSTR("IOThreadXPCMappedMemoryTransporter"));
    v7 = objc_claimAutoreleasedReturnValue();
    serverMemory = v5->_serverMemory;
    v5->_serverMemory = (OS_xpc_object *)v7;

    if (!v5->_serverMemory)
    {

      v10 = 0;
      goto LABEL_10;
    }
    if (MEMORY[0x24267E8A4]() == MEMORY[0x24BDACFE0])
    {
      v9 = v5->_serverMemory;
      v5->_serverMemory = 0;

    }
  }
  v10 = v5;
LABEL_10:

  return v10;
}

- (void)dealloc
{
  OS_xpc_object *serverMemory;
  objc_super v4;

  serverMemory = self->_serverMemory;
  self->_serverMemory = 0;

  v4.receiver = self;
  v4.super_class = (Class)IOThreadXPCMappedMemoryTransporter;
  -[IOThreadXPCMappedMemoryTransporter dealloc](&v4, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be decoded by an NSXPCCoder."));
  v7 = v4;
  -[IOThreadXPCMappedMemoryTransporter serverMemory](self, "serverMemory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[IOThreadXPCMappedMemoryTransporter serverMemory](self, "serverMemory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = xpc_null_create();
  }
  objc_msgSend(v7, "encodeXPCObject:forKey:", v6, CFSTR("IOThreadXPCMappedMemoryTransporter"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[IOThreadXPCMappedMemoryTransporter serverMemory](self, "serverMemory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[IOThreadXPCMappedMemoryTransporter serverMemory](self, "serverMemory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "serverMemory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v9) = xpc_equal(v7, v8);

    }
    else
    {
      objc_msgSend(v5, "serverMemory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7 == 0;
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (MappedMemory)getMappedMemory
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  size_t v8;
  MappedMemory result;

  v7 = 0;
  v8 = 0;
  -[IOThreadXPCMappedMemoryTransporter serverMemory](self, "serverMemory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[IOThreadXPCMappedMemoryTransporter serverMemory](self, "serverMemory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = xpc_shmem_map(v4, &v7);

    v5 = v7;
    v6 = v8;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (OS_xpc_object)serverMemory
{
  return self->_serverMemory;
}

- (void)setServerMemory:(id)a3
{
  objc_storeStrong((id *)&self->_serverMemory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverMemory, 0);
}

+ (id)memory:(const MappedMemory *)a3
{
  xpc_object_t v3;
  IOThreadXPCMappedMemoryTransporter *v4;

  v3 = xpc_shmem_create(a3->var0, a3->var1);
  v4 = -[IOThreadXPCMappedMemoryTransporter initWithObject:]([IOThreadXPCMappedMemoryTransporter alloc], "initWithObject:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
