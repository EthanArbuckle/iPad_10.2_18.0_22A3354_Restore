@implementation NSURL(CPLArchiver)

- (id)plistArchiveWithCPLArchiver:()CPLArchiver
{
  void *v4;

  if (objc_msgSend(a3, "forDisplay") && objc_msgSend(a1, "isFileURL"))
  {
    objc_msgSend(a1, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "absoluteString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (uint64_t)initWithCPLArchiver:()CPLArchiver
{
  _QWORD *v5;
  uint64_t v6;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = (void *)objc_opt_class();
        v10 = v5[2];
        *(_DWORD *)buf = 138412546;
        v15 = v9;
        v16 = 2112;
        v17 = v10;
        v11 = v9;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_ERROR, "Incorrect string for NSUUID. Found %@: '%@'", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, v13, 1129, CFSTR("Incorrect string for NSUUID. Found %@: '%@'"), objc_opt_class(), v5[2]);

    abort();
  }
  v6 = objc_msgSend(a1, "initWithString:", v5[2]);

  return v6;
}

@end
