@implementation NSExtension(ExtensionKitAdditions)

+ (_EXRunningExtensionInfo)extensionInfoForCurrentProcess
{
  return +[_EXRunningExtensionInfo extensionInfoForCurrentProcess](_EXRunningExtensionInfo, "extensionInfoForCurrentProcess");
}

- (id)preferredLanguages
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_plugIn");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "preferredLanguages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)extensionRepresentedBy:()ExtensionKitAdditions error:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v15;
  uint64_t v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  void *v31;
  uint8_t buf[40];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__5;
  v28 = __Block_byref_object_dispose__5;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__5;
  v22 = __Block_byref_object_dispose__5;
  v23 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _EXDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      v16 = objc_opt_class();
      +[NSExtension(ExtensionKitAdditions) extensionRepresentedBy:error:].cold.2(v16, buf, v15);
    }

    __break(1u);
  }
  v6 = v5;
  objc_msgSend(v6, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v30 = *MEMORY[0x1E0D7D498];
    objc_msgSend(v6, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D7D420], "defaultHost");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __67__NSExtension_ExtensionKitAdditions__extensionRepresentedBy_error___block_invoke;
    v17[3] = &unk_1E2CFD688;
    v17[4] = &v24;
    v17[5] = &v18;
    objc_msgSend(v11, "discoverPlugInsForAttributes:flags:found:", v10, 1024, v17);

    if (a4)
      *a4 = objc_retainAutorelease((id)v19[5]);

  }
  else
  {
    _EXLegacyLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[NSExtension(ExtensionKitAdditions) extensionRepresentedBy:error:].cold.1((uint64_t)v6, v12);

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.extensionKit.errorDomain"), 5, MEMORY[0x1E0C9AA70]);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v13 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v13;
}

+ (uint64_t)extensionWithIdentity:()ExtensionKitAdditions error:
{
  return objc_msgSend(MEMORY[0x1E0CB35D8], "extensionRepresentedBy:error:");
}

- (_EXExtensionIdentity)extensionIdentityWithError:()ExtensionKitAdditions
{
  id v5;
  void *v6;
  void *v7;
  _EXExtensionIdentity *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc(MEMORY[0x1E0CA5848]);
  objc_msgSend(a1, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithUUID:error:", v6, a3);

  if (v7)
  {
    v8 = -[_EXExtensionIdentity initWithApplicationExtensionRecord:]([_EXExtensionIdentity alloc], "initWithApplicationExtensionRecord:", v7);
  }
  else
  {
    _EXDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = a1;
      v14 = 2112;
      v15 = v10;

    }
    v8 = 0;
  }

  return v8;
}

- (void)setPreferredLanguages:()ExtensionKitAdditions
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_plugIn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _EXLegacyLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_190C25000, v6, OS_LOG_TYPE_DEFAULT, "Setting preferred languages on %{public}@: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(v5, "setPreferredLanguages:", v4);

}

- (BOOL)requiresMacCatalystBehavior
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL8 v6;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_plugIn");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5848]), "initWithUUID:error:", v2, &v8);
  v4 = v8;
  if (v3)
  {
    objc_msgSend(v3, "extensionPointRecord");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = -[NSObject platform](v5, "platform") == 6;
  }
  else
  {
    _EXLegacyLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v10 = 0;
      v11 = 2114;
      v12 = v4;
      _os_log_impl(&dword_190C25000, v5, OS_LOG_TYPE_DEFAULT, "Extension point not found for: %{public}@ with error: %{public}@", buf, 0x16u);
    }
    v6 = 0;
  }

  return v6;
}

- (id)containingBundleIdentifier
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc(MEMORY[0x1E0CA5848]);
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithBundleIdentifier:error:", v3, 0);

  if (v4)
  {
    objc_msgSend(v4, "containingBundleRecord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)_personas
{
  return MEMORY[0x1E0C9AA60];
}

- (id)uuid
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_plugIn");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)URL
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_plugIn");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)extensionRecord
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CA5848]);
  objc_msgSend(a1, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithUUID:error:", v3, 0);

  return v4;
}

+ (void)extensionRepresentedBy:()ExtensionKitAdditions error:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_190C25000, a2, OS_LOG_TYPE_ERROR, "UUID not found for extension representation: %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)extensionRepresentedBy:()ExtensionKitAdditions error:.cold.2(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315906;
  *(_QWORD *)(buf + 4) = "[extensionRep isKindOfClass:_EXExtensionIdentity.class]";
  *((_WORD *)buf + 6) = 2080;
  *(_QWORD *)(buf + 14) = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/NSExtensi"
                          "on/NSExtensionSupport/NSExtension+ExtensionKitAdditions.m";
  *((_WORD *)buf + 11) = 1024;
  *((_DWORD *)buf + 6) = 30;
  *((_WORD *)buf + 14) = 2112;
  *(_QWORD *)(buf + 30) = a1;
}

@end
