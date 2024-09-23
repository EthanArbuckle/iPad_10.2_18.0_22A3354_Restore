@implementation MSVXPCConnection

- (MSVXPCConnection)initWithMachServiceName:(id)a3 options:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  MSVXPCConnection *v11;
  void *v12;
  objc_super v14;

  v7 = a3;
  os_unfair_lock_lock(&__lock);
  objc_msgSend((id)__localListeners, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&__lock);
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVXPCConnection.m"), 63, CFSTR("MSVXPCConnection does not support nonzero NSXPCConnectionOptions"));

    goto LABEL_5;
  }
  if (!v8)
  {
LABEL_5:
    v14.receiver = self;
    v14.super_class = (Class)MSVXPCConnection;
    v11 = -[MSVXPCConnection initWithMachServiceName:options:](&v14, sel_initWithMachServiceName_options_, v7, 0);
    goto LABEL_6;
  }
  objc_msgSend(v8, "localProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endpoint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MSVXPCConnection initWithListenerEndpoint:](self, "initWithListenerEndpoint:", v10);

LABEL_6:
  return v11;
}

- (MSVXPCConnection)initWithServiceName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MSVXPCConnection *v8;
  objc_super v10;

  v4 = a3;
  os_unfair_lock_lock(&__lock);
  objc_msgSend((id)__localListeners, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&__lock);
  if (v5)
  {
    objc_msgSend(v5, "localProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endpoint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MSVXPCConnection initWithListenerEndpoint:](self, "initWithListenerEndpoint:", v7);

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MSVXPCConnection;
    v8 = -[MSVXPCConnection initWithServiceName:](&v10, sel_initWithServiceName_, v4);
  }

  return v8;
}

+ (void)registerLocalListener:(id)a3 withServiceName:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = a3;
  os_unfair_lock_lock(&__lock);
  if (registerLocalListener_withServiceName__onceToken != -1)
    dispatch_once(&registerLocalListener_withServiceName__onceToken, &__block_literal_global_5439);
  objc_msgSend((id)__localListeners, "setObject:forKey:", v6, v5);

  os_unfair_lock_unlock(&__lock);
}

+ (void)unregisterLocalListerWithName:(id)a3
{
  id v3;

  v3 = a3;
  os_unfair_lock_lock(&__lock);
  objc_msgSend((id)__localListeners, "removeObjectForKey:", v3);

  os_unfair_lock_unlock(&__lock);
}

void __58__MSVXPCConnection_registerLocalListener_withServiceName___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__localListeners;
  __localListeners = v0;

}

@end
