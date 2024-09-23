@implementation AFInstanceContextHost

- (id)preferencesSubdomain
{
  return 0;
}

- (AFInstanceContextHost)init
{
  AFInstanceContextHost *v2;
  AFInstanceInfo *v3;
  AFInstanceInfo *info;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AFInstanceContextHost;
  v2 = -[AFInstanceContextHost init](&v6, sel_init);
  if (v2)
  {
    v3 = -[AFInstanceInfo initWithInstanceUUID:applicationType:applicationUUID:]([AFInstanceInfo alloc], "initWithInstanceUUID:applicationType:applicationUUID:", 0, 1, 0);
    info = v2->_info;
    v2->_info = v3;

  }
  return v2;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7.receiver = self;
  v7.super_class = (Class)AFInstanceContextHost;
  -[AFInstanceContextHost description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ (default)"), v4);

  return v5;
}

- (id)createXPCConnectionWithMachServiceName:(id)a3 options:(unint64_t)a4
{
  objc_class *v5;
  id v6;
  void *v7;

  v5 = (objc_class *)MEMORY[0x1E0CB3B38];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithMachServiceName:options:", v6, a4);

  return v7;
}

- (id)createXPCListenerWithMachServiceName:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CB3B58];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithMachServiceName:", v4);

  return v5;
}

- (id)createXPCConnectionForMachService:(const char *)a3 targetQueue:(id)a4 flags:(unint64_t)a5
{
  return xpc_connection_create_mach_service(a3, (dispatch_queue_t)a4, a5);
}

- (id)createXPCListenerForMachService:(const char *)a3 targetQueue:(id)a4 flags:(unint64_t)a5
{
  return xpc_connection_create_mach_service(a3, (dispatch_queue_t)a4, a5 | 1);
}

- (id)info
{
  return self->_info;
}

- (BOOL)isDefault
{
  return 1;
}

- (BOOL)isCurrent
{
  void *v2;
  char v3;

  +[AFInstanceContext currentContext](AFInstanceContext, "currentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDefault");

  return v3;
}

- (id)mediaRouteIdentifier
{
  return 0;
}

- (id)audioDeviceIdentifier
{
  return 0;
}

- (BOOL)supportsAudioPowerUpdate
{
  return 1;
}

- (BOOL)supportsProxyGroupPlayer
{
  return 0;
}

- (BOOL)supportsTelephony
{
  MGGetBoolAnswer();
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
}

+ (id)effectiveMachServiceName:(id)a3
{
  return a3;
}

@end
