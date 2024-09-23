@implementation FBDisplayManager

+ (FBSDisplayIdentity)mainIdentity
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mainIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FBSDisplayIdentity *)v3;
}

+ (FBSDisplayConfiguration)mainConfiguration
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mainConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FBSDisplayConfiguration *)v3;
}

+ (id)sharedInstance
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__FBDisplayManager_sharedInstance__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a2;
  v3[5] = a1;
  if (sharedInstance_onceToken_7 != -1)
    dispatch_once(&sharedInstance_onceToken_7, v3);
  return (id)sharedInstance___sharedInstance_2;
}

- (FBDisplayManager)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  FBDisplayManager *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBDisplayManager *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed - call +sharedInstance instead"));
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
    v16 = CFSTR("FBDisplayManager.m");
    v17 = 1024;
    v18 = 21;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (FBDisplayManager *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (FBDisplayManager)initWithInitializationCompletion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  FBDisplayManager *result;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  FBDisplayManager *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-initWithInitializationCompletion: is not allowed - call +sharedInstance instead"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138544642;
    v12 = v7;
    v13 = 2114;
    v14 = v9;
    v15 = 2048;
    v16 = self;
    v17 = 2114;
    v18 = CFSTR("FBDisplayManager.m");
    v19 = 1024;
    v20 = 26;
    v21 = 2114;
    v22 = v6;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  result = (FBDisplayManager *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (FBDisplayManager)initWithTransformer:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  FBDisplayManager *result;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  FBDisplayManager *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-initWithTransformer: is not allowed - call +sharedInstance instead"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138544642;
    v12 = v7;
    v13 = 2114;
    v14 = v9;
    v15 = 2048;
    v16 = self;
    v17 = 2114;
    v18 = CFSTR("FBDisplayManager.m");
    v19 = 1024;
    v20 = 31;
    v21 = 2114;
    v22 = v6;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  result = (FBDisplayManager *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)invalidate
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  FBDisplayManager *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("you cannot invalidate FBDisplayManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138544642;
    v9 = v5;
    v10 = 2114;
    v11 = v7;
    v12 = 2048;
    v13 = self;
    v14 = 2114;
    v15 = CFSTR("FBDisplayManager.m");
    v16 = 1024;
    v17 = 36;
    v18 = 2114;
    v19 = v4;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

void __34__FBDisplayManager_sharedInstance__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSString *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_safeStringForKey:", CFSTR("FBDisplayManagerTransformer"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v10 = objc_alloc_init(NSClassFromString(v4));
    if ((objc_msgSend(v10, "conformsToProtocol:", &unk_1EE6DFC80) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Transformer specified must conform to <FBSDisplayTransformer>."));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        __34__FBDisplayManager_sharedInstance__block_invoke_cold_1(a1, (uint64_t)v5);
      objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A35ECAB8);
    }
  }
  else
  {
    v10 = 0;
  }
  if (UIKitLibraryCore() && (v6 = getUIApplicationClass()) != 0)
  {
    -[objc_class displayManagerObserver](v6, "displayManagerObserver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v8 = -[FBSDisplayMonitor _initWithBookendObserver:transformer:]([FBDisplayManager alloc], "_initWithBookendObserver:transformer:", v7, v10);
  v9 = (void *)sharedInstance___sharedInstance_2;
  sharedInstance___sharedInstance_2 = (uint64_t)v8;

}

- (void)dealloc
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  FBDisplayManager *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("this singleton must be not deallocated"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138544642;
    v9 = v5;
    v10 = 2114;
    v11 = v7;
    v12 = 2048;
    v13 = self;
    v14 = 2114;
    v15 = CFSTR("FBDisplayManager.m");
    v16 = 1024;
    v17 = 62;
    v18 = 2114;
    v19 = v4;
    _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

+ (FBSDisplayConfiguration)mainDisplay
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mainConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FBSDisplayConfiguration *)v3;
}

void __34__FBDisplayManager_sharedInstance__block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(*(SEL *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v8 = 138544642;
  v9 = v4;
  v10 = 2114;
  v11 = v6;
  v12 = 2048;
  v13 = v7;
  v14 = 2114;
  v15 = CFSTR("FBDisplayManager.m");
  v16 = 1024;
  v17 = 48;
  v18 = 2114;
  v19 = a2;
  _os_log_error_impl(&dword_1A359A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
