@implementation EKRemoteXPCConnectionFactory

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_12);
  return (id)sharedInstance_sharedInstance;
}

void __46__EKRemoteXPCConnectionFactory_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;

}

- (id)tryNewConnectionWithExportedObject:(id)a3 interruptionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend((id)objc_opt_class(), "_tryRegisterNewConnection"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.calaccessd"), 0);
    GetSharedXPCInterfaceForCADInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRemoteObjectInterface:", v9);

    GetSharedXPCInterfaceForCADClientInterface();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExportedInterface:", v10);

    objc_msgSend(v8, "setExportedObject:", v6);
    objc_msgSend(v8, "setInterruptionHandler:", v7);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __87__EKRemoteXPCConnectionFactory_tryNewConnectionWithExportedObject_interruptionHandler___block_invoke;
    v12[3] = &unk_1E4785078;
    v12[4] = self;
    objc_msgSend(v8, "setInvalidationHandler:", v12);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __87__EKRemoteXPCConnectionFactory_tryNewConnectionWithExportedObject_interruptionHandler___block_invoke()
{
  return objc_msgSend((id)objc_opt_class(), "_unregisterConnection");
}

+ (BOOL)_tryRegisterNewConnection
{
  unint64_t v2;
  BOOL v3;

  os_unfair_lock_lock((os_unfair_lock_t)&sNumberOfOpenConnectionsLock);
  v2 = sNumberOfOpenConnections;
  if ((unint64_t)sNumberOfOpenConnections <= 9)
    ++sNumberOfOpenConnections;
  v3 = v2 < 0xA;
  os_unfair_lock_unlock((os_unfair_lock_t)&sNumberOfOpenConnectionsLock);
  return v3;
}

+ (void)_unregisterConnection
{
  os_unfair_lock_lock((os_unfair_lock_t)&sNumberOfOpenConnectionsLock);
  --sNumberOfOpenConnections;
  os_unfair_lock_unlock((os_unfair_lock_t)&sNumberOfOpenConnectionsLock);
}

@end
