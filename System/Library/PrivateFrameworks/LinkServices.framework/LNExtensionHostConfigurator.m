@implementation LNExtensionHostConfigurator

+ (id)extensionIdentityWithExtensionPointIdentifier:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc(MEMORY[0x1E0CAA560]);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("bundleIdentifier = %@"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithExtensionPointIdentifier:predicate:", v7, v10);

  objc_msgSend(MEMORY[0x1E0CAA568], "executeQuery:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    if ((unint64_t)objc_msgSend(v12, "count") >= 2)
    {
      getLNLogCategoryConnection();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v12, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "url");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v21 = v8;
        v22 = 2112;
        v23 = v15;

      }
    }
    objc_msgSend(v12, "firstObject");
    a5 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a5)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("LNConnectionErrorDomain"), 1100, v18);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }

  return a5;
}

+ (id)extensionProcessWithExtensionRecord:(id)a3 extensionType:(int64_t *)a4 error:(id *)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  void *v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNExtensionHostConfigurator.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extensionRecord"));

  }
  objc_msgSend(v9, "extensionPointRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.appintents-extension")))
    *a4 = 0;
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.widgetkit-extension")))
  {
    v12 = 0;
    *a4 = 1;
  }
  else if (a4)
  {
    objc_msgSend(v9, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "extensionIdentityWithExtensionPointIdentifier:bundleIdentifier:error:", v11, v13, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA550]), "initWithExtensionIdentity:", v14);
      objc_msgSend(MEMORY[0x1E0CAA548], "extensionProcessWithConfiguration:error:", v15, a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      getLNLogCategoryConnection();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = *a5;
        *(_DWORD *)buf = 138543362;
        v22 = v18;
        _os_log_impl(&dword_1A18F6000, v17, OS_LOG_TYPE_ERROR, "Unable to create extension identity: %{public}@", buf, 0xCu);
      }

      v12 = 0;
    }

  }
  else
  {
    getLNLogCategoryConnection();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v11;
      _os_log_impl(&dword_1A18F6000, v16, OS_LOG_TYPE_ERROR, "Unsupported extension point identifier %{public}@", buf, 0xCu);
    }

    v12 = 0;
  }

  return v12;
}

@end
