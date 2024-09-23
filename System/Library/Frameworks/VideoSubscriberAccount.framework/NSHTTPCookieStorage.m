@implementation NSHTTPCookieStorage

void __58__NSHTTPCookieStorage_VSAdditions__vs_sharedCookieStorage__block_invoke()
{
  uint64_t v0;
  void *v1;

  __58__NSHTTPCookieStorage_VSAdditions__vs_sharedCookieStorage__block_invoke_2();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)vs_sharedCookieStorage___vs_lazy_init_variable;
  vs_sharedCookieStorage___vs_lazy_init_variable = v0;

}

id __58__NSHTTPCookieStorage_VSAdditions__vs_sharedCookieStorage__block_invoke_2()
{
  void *v0;
  const char *v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v9;
  uint8_t buf[4];
  NSObject *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3678], "sharedHTTPCookieStorage");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v1 = (const char *)container_system_group_path_for_identifier();
  if (v1)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v1, strlen(v1), 4, 1);
    objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Library"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Caches"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("VSSharedCookies.binarycookies"));
    v5 = objc_claimAutoreleasedReturnValue();

    VSDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "Using cookie storage %@", buf, 0xCu);
    }

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3678], "_csff:", v5);
      v7 = objc_claimAutoreleasedReturnValue();

      v0 = (void *)v7;
    }
  }
  else
  {
    VSErrorLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __58__NSHTTPCookieStorage_VSAdditions__vs_sharedCookieStorage__block_invoke_2_cold_1(&v9, v5);
  }

  if (!v0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The sharedCookieStorage parameter must not be nil."));
  return v0;
}

void __58__NSHTTPCookieStorage_VSAdditions__vs_sharedCookieStorage__block_invoke_2_cold_1(_QWORD *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D2419000, a2, OS_LOG_TYPE_ERROR, "Error obtaining system group path: %@", (uint8_t *)&v4, 0xCu);

}

@end
