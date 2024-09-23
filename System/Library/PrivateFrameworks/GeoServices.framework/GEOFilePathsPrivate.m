@implementation GEOFilePathsPrivate

+ (id)pathForSearchPath:(int)a3 andDomain:(int)a4
{
  uint64_t v4;
  _BYTE v6[1025];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = NSStartSearchPathEnumerationPrivate();
  MEMORY[0x18D763B18](v4, v6);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v6);
}

+ (id)systemContainerLibraryPathUsingLibSystem
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "systemContainerPathUsingLibSystem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Library"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)systemContainerPathUsingLibSystem
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = container_system_path_for_identifier();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v2);
    free(v3);
    return v4;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218242;
      v7 = 1;
      v8 = 2080;
      v9 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "[ERROR] system container error %llu. system container path = '%s'", buf, 0x16u);
    }
    return 0;
  }
}

+ (id)daemonContainerLibraryPathUsingLibSystem
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "daemonContainerPathUsingLibSystem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Library"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)daemonContainerPathUsingLibSystem
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (qword_1ECDBBD30 != -1)
    dispatch_once(&qword_1ECDBBD30, &__block_literal_global_62);
  if (!_MergedGlobals_218)
    goto LABEL_8;
  v2 = container_system_group_path_for_identifier();
  if (!v2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218242;
      v7 = 1;
      v8 = 2080;
      v9 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "[ERROR] system container error %llu system container path = '%s'", buf, 0x16u);
    }
LABEL_8:
    v4 = 0;
    return v4;
  }
  v3 = (void *)v2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v2);
  free(v3);
  return v4;
}

+ (id)userContainerLibPathUsingLibSystem
{
  return (id)objc_msgSend(a1, "pathForSearchPath:andDomain:", 5, 16);
}

+ (id)userContainerCachesPathUsingLibSystem
{
  return (id)objc_msgSend(a1, "pathForSearchPath:andDomain:", 13, 16);
}

+ (id)systemContainerCachesPathUsingLibSystem
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "systemContainerLibraryPathUsingLibSystem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Caches"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)daemonContainerCachesPathUsingLibSystem
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "daemonContainerLibraryPathUsingLibSystem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Caches"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __56__GEOFilePathsPrivate_daemonContainerPathUsingLibSystem__block_invoke()
{
  char v0;
  id v1;

  +[GEOEntitlements currentProcessEntitlement:](GEOEntitlements, "currentProcessEntitlement:", CFSTR("com.apple.security.system-groups"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v0 = objc_msgSend(v1, "containsObject:", CFSTR("systemgroup.com.apple.geod"));
  else
    v0 = 0;
  _MergedGlobals_218 = v0;

}

@end
