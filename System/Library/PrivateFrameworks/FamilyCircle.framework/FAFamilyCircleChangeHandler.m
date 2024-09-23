@implementation FAFamilyCircleChangeHandler

+ (void)handleURLResponse:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _FALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v7;
    v13 = 2080;
    v14 = "+[FAFamilyCircleChangeHandler handleURLResponse:]";
    _os_log_impl(&dword_1CAEBA000, v5, OS_LOG_TYPE_DEFAULT, "%@ %s", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(v4, "allHeaderFields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", CFSTR("X-Apple-Family-Changed"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    _FALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1CAEBA000, v10, OS_LOG_TYPE_DEFAULT, "FACircleRemoteUIDelegate - Family state has changed", (uint8_t *)&v11, 2u);
    }

    objc_msgSend(a1, "_refetchFamilyWithContext:completion:", CFSTR("family_changed_header"), &__block_literal_global_1);
  }
}

+ (void)handleDidRepairFamilyWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _FALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v7;
    v10 = 2080;
    v11 = "+[FAFamilyCircleChangeHandler handleDidRepairFamilyWithCompletion:]";
    _os_log_impl(&dword_1CAEBA000, v5, OS_LOG_TYPE_DEFAULT, "%@ %s", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(a1, "_refetchFamilyWithContext:completion:", CFSTR("family_repair"), v4);

}

+ (void)handleDidSetupFamilyWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _FALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v7;
    v10 = 2080;
    v11 = "+[FAFamilyCircleChangeHandler handleDidSetupFamilyWithCompletion:]";
    _os_log_impl(&dword_1CAEBA000, v5, OS_LOG_TYPE_DEFAULT, "%@ %s", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(a1, "_refetchFamilyWithContext:completion:", CFSTR("family_setup"), v4);

}

+ (void)_refetchFamilyWithContext:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  FAFetchFamilyCircleRequest *v10;
  id v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  _FALogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v9;
    v19 = 2080;
    v20 = "+[FAFamilyCircleChangeHandler _refetchFamilyWithContext:completion:]";
    _os_log_impl(&dword_1CAEBA000, v7, OS_LOG_TYPE_DEFAULT, "%@ %s: force fetching family changes", buf, 0x16u);

  }
  v10 = objc_alloc_init(FAFetchFamilyCircleRequest);
  -[FAFetchFamilyCircleRequest setCachePolicy:](v10, "setCachePolicy:", 1000);
  -[FAFetchFamilyCircleRequest setContext:](v10, "setContext:", v6);

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__FAFamilyCircleChangeHandler__refetchFamilyWithContext_completion___block_invoke;
  v15[3] = &unk_1E8561A28;
  v16 = v5;
  v11 = v5;
  -[FAFetchFamilyCircleRequest startRequestWithCompletionHandler:](v10, "startRequestWithCompletionHandler:", v15);
  _FALogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v14;
    v19 = 2080;
    v20 = "+[FAFamilyCircleChangeHandler _refetchFamilyWithContext:completion:]";
    _os_log_impl(&dword_1CAEBA000, v12, OS_LOG_TYPE_DEFAULT, "%@ %s done", buf, 0x16u);

  }
}

uint64_t __68__FAFamilyCircleChangeHandler__refetchFamilyWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
