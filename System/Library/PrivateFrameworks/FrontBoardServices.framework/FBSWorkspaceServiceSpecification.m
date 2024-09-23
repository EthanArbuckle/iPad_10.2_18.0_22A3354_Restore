@implementation FBSWorkspaceServiceSpecification

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.frontboard.workspace-service");
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)objc_msgSend(off_1E38E9E80, "userInteractive");
}

+ (BSServiceInterface)interface
{
  return (BSServiceInterface *)+[FBSWorkspaceServiceSpecification _interfaceWithInversion:]((uint64_t)FBSWorkspaceServiceSpecification, 0);
}

- (FBSWorkspaceServiceSpecification)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  FBSWorkspaceServiceSpecification *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBSWorkspaceServiceSpecification *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not available on FBSWorkspaceServiceSpecification"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("FBSWorkspaceServiceSpecification.m");
    v17 = 1024;
    v18 = 20;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (FBSWorkspaceServiceSpecification *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)_interfaceWithInversion:(uint64_t)a1
{
  uint64_t v3;
  uint64_t *v4;
  _QWORD block[5];

  v3 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__FBSWorkspaceServiceSpecification__interfaceWithInversion___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v3;
  if (_interfaceWithInversion__onceToken != -1)
    dispatch_once(&_interfaceWithInversion__onceToken, block);
  v4 = &_interfaceWithInversion____invertedInterface;
  if (!a2)
    v4 = &_interfaceWithInversion____interface;
  return (id)*v4;
}

void __60__FBSWorkspaceServiceSpecification__interfaceWithInversion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E38E9E38, "interfaceWithIdentifier:", v1);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E38E9E50, "protocolForProtocol:", &unk_1EE3C31A8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setServer:", v2);

  objc_msgSend(off_1E38E9E50, "protocolForProtocol:", &unk_1EE3B7E90);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClient:", v3);

  objc_msgSend(v8, "setClientMessagingExpectation:", 1);
  v4 = objc_msgSend(v8, "copy");
  v5 = (void *)_interfaceWithInversion____interface;
  _interfaceWithInversion____interface = v4;

  objc_msgSend((id)_interfaceWithInversion____interface, "invertInterface:", &__block_literal_global_15);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)_interfaceWithInversion____invertedInterface;
  _interfaceWithInversion____invertedInterface = v6;

}

uint64_t __60__FBSWorkspaceServiceSpecification__interfaceWithInversion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setClientMessagingExpectation:", 1);
}

+ (BSServiceInterface)invertedInterface
{
  return (BSServiceInterface *)+[FBSWorkspaceServiceSpecification _interfaceWithInversion:]((uint64_t)FBSWorkspaceServiceSpecification, 1);
}

@end
