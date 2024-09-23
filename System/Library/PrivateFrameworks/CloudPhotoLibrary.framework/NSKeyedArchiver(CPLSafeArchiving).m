@implementation NSKeyedArchiver(CPLSafeArchiving)

+ (id)cpl_archivedDataWithRootObject:()CPLSafeArchiving
{
  id v3;
  void *v4;
  id v5;
  BOOL v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v4)
    v6 = 0;
  else
    v6 = _CPLSilentLogging == 0;
  if (v6)
  {
    __CPLArchiverOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v3;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "Failed to create archiver for %@: %@", buf, 0x16u);
    }

  }
  return v4;
}

@end
