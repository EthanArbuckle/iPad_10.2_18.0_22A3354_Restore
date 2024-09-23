@implementation NSHTTPCookieStorage(VSAdditions)

+ (id)vs_sharedCookieStorage
{
  if (vs_sharedCookieStorage___vs_lazy_init_predicate != -1)
    dispatch_once(&vs_sharedCookieStorage___vs_lazy_init_predicate, &__block_literal_global_20);
  return (id)vs_sharedCookieStorage___vs_lazy_init_variable;
}

- (void)vs_saveCookies
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  VSDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1, "cookies");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D2419000, v2, OS_LOG_TYPE_DEFAULT, "Will save %@ cookies.", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(a1, "_saveCookies");
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_1D2419000, v4, OS_LOG_TYPE_DEFAULT, "Did save cookies.", (uint8_t *)&v5, 2u);
  }

}

@end
