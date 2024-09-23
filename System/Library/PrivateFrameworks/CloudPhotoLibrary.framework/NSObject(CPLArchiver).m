@implementation NSObject(CPLArchiver)

- (NSString)storedClassNameForCPLArchiver:()CPLArchiver
{
  return NSStringFromClass((Class)objc_msgSend(a1, "classForCoder"));
}

- (id)plistArchiveWithCPLArchiver:()CPLArchiver
{
  objc_class *v4;
  id *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = v5[2];
  objc_storeStrong(v5 + 2, v6);
  objc_msgSend(a1, "cplEncodePropertiesWithCoder:", v5);
  v8 = v5[2];
  v5[2] = v7;
  v9 = v7;

  return v6;
}

- (void)initWithCPLArchiver:()CPLArchiver
{
  _QWORD *v5;
  void *v6;
  void *v7;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
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
        v11 = v5[2];
        *(_DWORD *)buf = 138412546;
        v16 = v10;
        v17 = 2112;
        v18 = v11;
        v12 = v10;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "Invalid object properties dictionary. Found %@ in archive: '%@'", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, v14, 992, CFSTR("Invalid object properties dictionary. Found %@ in archive: '%@'"), objc_opt_class(), v5[2]);

    abort();
  }
  v6 = (void *)objc_msgSend(a1, "init");
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "cplDecodePropertiesFromCoder:", v5);

  return v7;
}

+ (Class)classForStoredClassName:()CPLArchiver forCPLArchiver:
{
  return NSClassFromString(aClassName);
}

@end
