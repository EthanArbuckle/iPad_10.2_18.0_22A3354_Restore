@implementation FBSOpenApplicationServiceSpecification

void __51__FBSOpenApplicationServiceSpecification_interface__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  +[FBSOpenApplicationServiceSpecification identifier](FBSOpenApplicationServiceSpecification, "identifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E38E9E38, "interfaceWithIdentifier:", v0);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E38E9E50, "protocolForProtocol:", &unk_1EE3C3148);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServer:", v1);

  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)interface___interface;
  interface___interface = v2;

}

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.frontboard.open");
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)objc_msgSend(off_1E38E9E80, "userInitiated");
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken != -1)
    dispatch_once(&interface_onceToken, &__block_literal_global_9);
  return (BSServiceInterface *)(id)interface___interface;
}

- (FBSOpenApplicationServiceSpecification)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  FBSOpenApplicationServiceSpecification *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBSOpenApplicationServiceSpecification *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not available on FBSOpenApplicationServiceSpecification"));
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
    v16 = CFSTR("FBSOpenApplicationServiceSpecification.m");
    v17 = 1024;
    v18 = 18;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (FBSOpenApplicationServiceSpecification *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

@end
