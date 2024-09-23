@implementation IOThreadXPCSemaphoreTransporter

- (IOThreadXPCSemaphoreTransporter)initWithSemaphores:(id)a3 :(id)a4
{
  id v7;
  id v8;
  IOThreadXPCSemaphoreTransporter *v9;
  IOThreadXPCSemaphoreTransporter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IOThreadXPCSemaphoreTransporter;
  v9 = -[IOThreadXPCSemaphoreTransporter init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientPingableSemaphore, a4);
    objc_storeStrong((id *)&v10->_clientListenableSemaphore, a3);
  }

  return v10;
}

- (IOThreadXPCSemaphoreTransporter)initWithCoder:(id)a3
{
  id v4;
  IOThreadXPCSemaphoreTransporter *v5;
  id v6;
  uint64_t v7;
  OS_xpc_object *clientPingableSemaphore;
  uint64_t v9;
  uint64_t v10;
  OS_xpc_object *v11;
  uint64_t v12;
  OS_xpc_object *clientListenableSemaphore;
  OS_xpc_object *v14;
  IOThreadXPCSemaphoreTransporter *v15;
  objc_super v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be decoded by an NSXPCCoder."));
  v17.receiver = self;
  v17.super_class = (Class)IOThreadXPCSemaphoreTransporter;
  v5 = -[IOThreadXPCSemaphoreTransporter init](&v17, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_msgSend(v6, "decodeXPCObjectForKey:", CFSTR("IOThreadXPCSemaphoreTransporterClientPingable"));
    v7 = objc_claimAutoreleasedReturnValue();
    clientPingableSemaphore = v5->_clientPingableSemaphore;
    v5->_clientPingableSemaphore = (OS_xpc_object *)v7;

    if (!v5->_clientPingableSemaphore)
      goto LABEL_12;
    v9 = MEMORY[0x24267E8A4]();
    v10 = MEMORY[0x24BDACFE0];
    if (v9 == MEMORY[0x24BDACFE0])
    {
      v11 = v5->_clientPingableSemaphore;
      v5->_clientPingableSemaphore = 0;

    }
    objc_msgSend(v6, "decodeXPCObjectForKey:", CFSTR("IOThreadXPCSemaphoreTransporterClientListenable"));
    v12 = objc_claimAutoreleasedReturnValue();
    clientListenableSemaphore = v5->_clientListenableSemaphore;
    v5->_clientListenableSemaphore = (OS_xpc_object *)v12;

    if (!v5->_clientListenableSemaphore)
    {
LABEL_12:

      v15 = 0;
      goto LABEL_13;
    }
    if (MEMORY[0x24267E8A4]() == v10)
    {
      v14 = v5->_clientListenableSemaphore;
      v5->_clientListenableSemaphore = 0;

    }
  }
  v15 = v5;
LABEL_13:

  return v15;
}

- (void)dealloc
{
  OS_xpc_object *clientPingableSemaphore;
  OS_xpc_object *clientListenableSemaphore;
  objc_super v5;

  clientPingableSemaphore = self->_clientPingableSemaphore;
  self->_clientPingableSemaphore = 0;

  clientListenableSemaphore = self->_clientListenableSemaphore;
  self->_clientListenableSemaphore = 0;

  v5.receiver = self;
  v5.super_class = (Class)IOThreadXPCSemaphoreTransporter;
  -[IOThreadXPCSemaphoreTransporter dealloc](&v5, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be decoded by an NSXPCCoder."));
  v9 = v4;
  -[IOThreadXPCSemaphoreTransporter clientPingableSemaphore](self, "clientPingableSemaphore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[IOThreadXPCSemaphoreTransporter clientPingableSemaphore](self, "clientPingableSemaphore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = xpc_null_create();
  }
  objc_msgSend(v9, "encodeXPCObject:forKey:", v6, CFSTR("IOThreadXPCSemaphoreTransporterClientPingable"));

  -[IOThreadXPCSemaphoreTransporter clientListenableSemaphore](self, "clientListenableSemaphore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[IOThreadXPCSemaphoreTransporter clientListenableSemaphore](self, "clientListenableSemaphore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = xpc_null_create();
  }
  objc_msgSend(v9, "encodeXPCObject:forKey:", v8, CFSTR("IOThreadXPCSemaphoreTransporterClientListenable"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[IOThreadXPCSemaphoreTransporter clientPingableSemaphore](self, "clientPingableSemaphore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

    }
    else
    {
      -[IOThreadXPCSemaphoreTransporter clientListenableSemaphore](self, "clientListenableSemaphore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        objc_msgSend(v5, "clientPingableSemaphore");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v7 = 0;
          goto LABEL_10;
        }
        objc_msgSend(v5, "clientListenableSemaphore");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 0;
        v7 = v10 == 0;
LABEL_9:

LABEL_10:
        goto LABEL_11;
      }
    }
    -[IOThreadXPCSemaphoreTransporter clientPingableSemaphore](self, "clientPingableSemaphore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientPingableSemaphore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (xpc_equal(v9, v10))
    {
      -[IOThreadXPCSemaphoreTransporter clientListenableSemaphore](self, "clientListenableSemaphore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientListenableSemaphore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = xpc_equal(v11, v12);

    }
    else
    {
      v7 = 0;
    }
    goto LABEL_9;
  }
  v7 = 0;
LABEL_11:

  return v7;
}

- (ClientIOThreadSynchronizerSemaphores)getSemaphores
{
  void *v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;

  -[IOThreadXPCSemaphoreTransporter clientPingableSemaphore](self, "clientPingableSemaphore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = xpc_mach_send_copy_right();

  -[IOThreadXPCSemaphoreTransporter clientListenableSemaphore](self, "clientListenableSemaphore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = xpc_mach_send_copy_right();

  return (ClientIOThreadSynchronizerSemaphores)(v4 | (unint64_t)(v6 << 32));
}

- (OS_xpc_object)clientListenableSemaphore
{
  return self->_clientListenableSemaphore;
}

- (void)setClientListenableSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_clientListenableSemaphore, a3);
}

- (OS_xpc_object)clientPingableSemaphore
{
  return self->_clientPingableSemaphore;
}

- (void)setClientPingableSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_clientPingableSemaphore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientPingableSemaphore, 0);
  objc_storeStrong((id *)&self->_clientListenableSemaphore, 0);
}

+ (id)semaphores:(const ClientIOThreadSynchronizerSemaphores *)a3
{
  void *v3;
  void *v4;
  IOThreadXPCSemaphoreTransporter *v5;

  v3 = (void *)xpc_mach_send_create();
  v4 = (void *)xpc_mach_send_create();
  v5 = -[IOThreadXPCSemaphoreTransporter initWithSemaphores::]([IOThreadXPCSemaphoreTransporter alloc], "initWithSemaphores::", v3, v4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
