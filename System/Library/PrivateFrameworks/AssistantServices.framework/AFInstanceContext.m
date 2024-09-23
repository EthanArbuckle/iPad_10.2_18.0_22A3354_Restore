@implementation AFInstanceContext

+ (id)currentContext
{
  if (currentContext_onceToken != -1)
    dispatch_once(&currentContext_onceToken, &__block_literal_global_1);
  return (id)currentContext_currentContext;
}

void __35__AFInstanceContext_currentContext__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AFInstanceContext defaultContext](AFInstanceContext, "defaultContext");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)currentContext_currentContext;
  currentContext_currentContext = v0;

}

+ (id)defaultContext
{
  if (defaultContext_onceToken != -1)
    dispatch_once(&defaultContext_onceToken, &__block_literal_global_14150);
  return (id)defaultContext_defaultContext;
}

void __35__AFInstanceContext_defaultContext__block_invoke()
{
  AFInstanceContextHost *v0;
  void *v1;

  v0 = objc_alloc_init(AFInstanceContextHost);
  v1 = (void *)defaultContext_defaultContext;
  defaultContext_defaultContext = (uint64_t)v0;

}

- (id)createXPCConnectionWithMachServiceName:(id)a3 options:(unint64_t)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFInstanceContext.m"), 109, CFSTR("%s is a subclass responsibility."), "-[AFInstanceContext createXPCConnectionWithMachServiceName:options:]");

  return 0;
}

- (id)createXPCListenerWithMachServiceName:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFInstanceContext.m"), 114, CFSTR("%s is a subclass responsibility."), "-[AFInstanceContext createXPCListenerWithMachServiceName:]");

  return 0;
}

- (id)createXPCConnectionForMachService:(const char *)a3 targetQueue:(id)a4 flags:(unint64_t)a5
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFInstanceContext.m"), 119, CFSTR("%s is a subclass responsibility."), "-[AFInstanceContext createXPCConnectionForMachService:targetQueue:flags:]");

  return 0;
}

- (id)createXPCListenerForMachService:(const char *)a3 targetQueue:(id)a4 flags:(unint64_t)a5
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFInstanceContext.m"), 124, CFSTR("%s is a subclass responsibility."), "-[AFInstanceContext createXPCListenerForMachService:targetQueue:flags:]");

  return 0;
}

- (AFInstanceInfo)info
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFInstanceContext.m"), 129, CFSTR("%s is a subclass responsibility."), "-[AFInstanceContext info]");

  return 0;
}

- (BOOL)isDefault
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFInstanceContext.m"), 134, CFSTR("%s is a subclass responsibility."), "-[AFInstanceContext isDefault]");

  return 0;
}

- (BOOL)isCurrent
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFInstanceContext.m"), 139, CFSTR("%s is a subclass responsibility."), "-[AFInstanceContext isCurrent]");

  return 0;
}

+ (id)effectiveMachServiceName:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("AFInstanceContext.m"), 104, CFSTR("%s is a subclass responsibility."), "+[AFInstanceContext effectiveMachServiceName:]");

  return 0;
}

- (NSString)preferencesSubdomain
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFInstanceContext.m"), 174, CFSTR("%s is a subclass responsibility."), "-[AFInstanceContext(SubsystemSupport) preferencesSubdomain]");

  return 0;
}

- (NSString)mediaRouteIdentifier
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFInstanceContext.m"), 179, CFSTR("%s is a subclass responsibility."), "-[AFInstanceContext(SubsystemSupport) mediaRouteIdentifier]");

  return 0;
}

- (NSString)audioDeviceIdentifier
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFInstanceContext.m"), 184, CFSTR("%s is a subclass responsibility."), "-[AFInstanceContext(SubsystemSupport) audioDeviceIdentifier]");

  return 0;
}

- (BOOL)supportsAudioPowerUpdate
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFInstanceContext.m"), 189, CFSTR("%s is a subclass responsibility."), "-[AFInstanceContext(SubsystemSupport) supportsAudioPowerUpdate]");

  return 0;
}

- (BOOL)supportsProxyGroupPlayer
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFInstanceContext.m"), 194, CFSTR("%s is a subclass responsibility."), "-[AFInstanceContext(SubsystemSupport) supportsProxyGroupPlayer]");

  return 0;
}

- (BOOL)supportsTelephony
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFInstanceContext.m"), 199, CFSTR("%s is a subclass responsibility."), "-[AFInstanceContext(SubsystemSupport) supportsTelephony]");

  return 0;
}

@end
