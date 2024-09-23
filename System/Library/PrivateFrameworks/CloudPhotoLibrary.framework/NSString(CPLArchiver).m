@implementation NSString(CPLArchiver)

- (id)initWithCPLArchiver:()CPLArchiver
{
  id *v5;
  void *v6;
  id v7;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(a1, "init");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = (void *)objc_opt_class();
        v11 = v10;
        v12 = (void *)objc_opt_class();
        v13 = v5[2];
        *(_DWORD *)buf = 138412802;
        v19 = v10;
        v20 = 2112;
        v21 = v12;
        v22 = 2112;
        v23 = v13;
        v14 = v12;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "Invalid %@. Found %@ in archive: '%@'", buf, 0x20u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_class();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, v16, 1036, CFSTR("Invalid %@. Found %@ in archive: '%@'"), v17, objc_opt_class(), v5[2]);

    abort();
  }
  v7 = v5[2];

  return v7;
}

@end
