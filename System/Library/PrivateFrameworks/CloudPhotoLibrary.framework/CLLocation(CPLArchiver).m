@implementation CLLocation(CPLArchiver)

- (id)plistArchiveWithCPLArchiver:()CPLArchiver
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v5, "archiveCursor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArchiveCursor:", v6);
  objc_msgSend(a1, "encodeWithCoder:", v5);
  objc_msgSend(v5, "setArchiveCursor:", v7);

  return v6;
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
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_ERROR, "Incorrect string for CLLocation. Found %@: '%@'", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, v13, 1198, CFSTR("Incorrect string for CLLocation. Found %@: '%@'"), objc_opt_class(), v5[2]);

    abort();
  }
  v6 = objc_msgSend(a1, "initWithCoder:", v5);

  return v6;
}

- (BOOL)cplSpecialIsEqual:()CPLArchiver
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _BOOL8 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;

  v4 = a3;
  if (v4 == a1)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "coordinate");
      v6 = v5;
      v8 = v7;
      objc_msgSend(v4, "coordinate");
      v10 = 0;
      if (v6 == v11)
      {
        v10 = 0;
        if (v8 == v9)
        {
          objc_msgSend(a1, "altitude");
          v13 = v12;
          objc_msgSend(v4, "altitude");
          v10 = 0;
          if (v13 == v14)
          {
            objc_msgSend(a1, "horizontalAccuracy");
            v16 = v15;
            objc_msgSend(v4, "horizontalAccuracy");
            v10 = 0;
            if (v16 == v17)
            {
              objc_msgSend(a1, "verticalAccuracy");
              v19 = v18;
              objc_msgSend(v4, "verticalAccuracy");
              v10 = 0;
              if (v19 == v20)
              {
                objc_msgSend(a1, "course");
                v22 = v21;
                objc_msgSend(v4, "course");
                v10 = 0;
                if (v22 == v23)
                {
                  objc_msgSend(a1, "speed");
                  v25 = v24;
                  objc_msgSend(v4, "speed");
                  v10 = v25 == v26;
                }
              }
            }
          }
        }
      }
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)cplSpecialHash
{
  double v1;
  double v2;

  objc_msgSend(a1, "coordinate");
  return (unint64_t)(v2 * v1);
}

@end
