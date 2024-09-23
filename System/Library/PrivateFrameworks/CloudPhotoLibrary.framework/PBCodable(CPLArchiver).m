@implementation PBCodable(CPLArchiver)

- (id)plistArchiveWithCPLArchiver:()CPLArchiver
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_encodeKey:", CFSTR("data"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, v8);
  return v6;
}

- (uint64_t)initWithCPLArchiver:()CPLArchiver
{
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
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
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_opt_class();
        v13 = v5[2];
        *(_DWORD *)buf = 138412802;
        v20 = v11;
        v21 = 2112;
        v22 = v12;
        v23 = 2112;
        v24 = v13;
        v14 = v12;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "Incorrect string for %@. Found %@: '%@'", buf, 0x20u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, v16, 1347, CFSTR("Incorrect string for %@. Found %@: '%@'"), v18, objc_opt_class(), v5[2]);

    abort();
  }
  objc_msgSend(v5, "_decodeKey:class:inDictionary:", CFSTR("data"), objc_opt_class(), v5[2]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "initWithData:", v6);

  return v7;
}

@end
