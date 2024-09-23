@implementation NSDate(CPLArchiver)

- (id)plistArchiveWithCPLArchiver:()CPLArchiver
{
  void *v4;

  if (objc_msgSend(a3, "forDisplay"))
  {
    objc_msgSend(a1, "description");
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1, "timeIntervalSinceReferenceDate");
    objc_msgSend(v4, "numberWithDouble:");
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)initWithCPLArchiver:()CPLArchiver
{
  id *v5;
  uint64_t v6;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
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
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_ERROR, "Incorrect number for NSDate. Found %@: '%@'", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, v13, 1083, CFSTR("Incorrect number for NSDate. Found %@: '%@'"), objc_opt_class(), v5[2]);

    abort();
  }
  objc_msgSend(v5[2], "doubleValue");
  v6 = objc_msgSend(a1, "initWithTimeIntervalSinceReferenceDate:");

  return v6;
}

@end
