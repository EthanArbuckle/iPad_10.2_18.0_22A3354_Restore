@implementation ISBindableIcon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)resourceProviderWithClaim:(id)a3 typeRecord:(id)a4 fileExtension:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  __CFString *v20;
  __CFString *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  ISRecordResourceProvider *v27;
  ISGenericRecipe *v28;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    objc_msgSend(v7, "claimRecord");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "claimingBundleRecord");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    +[ISDefaults sharedInstance](ISDefaults, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "allowDocumentClaimIcons") & 1) != 0)
    {
      objc_msgSend(v7, "claimRecord");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "iconDictionary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (v16)
      {
        objc_msgSend(v7, "claimRecord");
        v17 = (id)objc_claimAutoreleasedReturnValue();
        if (!v8)
          goto LABEL_26;
LABEL_11:
        if (v17)
          goto LABEL_26;
        objc_msgSend(v11, "_IS_iconProvidingLineageForRecord:", v8);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "lastObject");
        v19 = (id)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v8, "identifier");
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "identifier");
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (UTTypeEqual(v20, v21))
          {
            v22 = objc_msgSend(v19, "_is_canProvideIconResources");

            if (v22)
              goto LABEL_24;
          }
          else
          {

          }
          if ((objc_msgSend(v8, "_is_canProvideIconResources") & 1) == 0)
          {
LABEL_24:
            v19 = v19;
            v23 = 0;
            v17 = v19;
            goto LABEL_29;
          }
LABEL_23:
          v17 = v8;
          v23 = 0;
          goto LABEL_29;
        }
        if ((objc_msgSend(v8, "_is_canProvideIconResources") & 1) != 0)
        {
LABEL_18:
          v19 = 0;
          goto LABEL_23;
        }
        goto LABEL_19;
      }
    }
    else
    {

    }
    v17 = 0;
    if (!v8)
      goto LABEL_26;
    goto LABEL_11;
  }
  if (!v8)
  {
    v19 = 0;
    v23 = 0;
    v17 = 0;
    goto LABEL_29;
  }
  if (objc_msgSend(v8, "_is_canProvideIconResources"))
    goto LABEL_18;
  isKindOfClass = 0;
LABEL_19:
  objc_msgSend(v8, "_IS_iconProvidingRecordAcceptingWildCard:", (isKindOfClass & 1) == 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v24;
  if (v24)
  {
    v11 = v24;
    v17 = v11;
  }
  else
  {
    v17 = 0;
  }
LABEL_26:

  v19 = 0;
  v23 = 0;
  if (!v17 && (isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "claimRecord");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "claimingBundleRecord");
    v17 = (id)objc_claimAutoreleasedReturnValue();

    v19 = 0;
    v23 = 1;
  }
LABEL_29:
  if ((objc_msgSend(v17, "_is_canProvideIconResources") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CA5928], "typeRecordWithIdentifier:", *MEMORY[0x1E0CA5B20]);
    v26 = objc_claimAutoreleasedReturnValue();

    v17 = (id)v26;
  }
  v27 = -[ISRecordResourceProvider initWithRecord:fileExtension:options:]([ISRecordResourceProvider alloc], "initWithRecord:fileExtension:options:", v17, v9, v23);
  -[ISResourceProvider setResourceType:](v27, "setResourceType:", 2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((objc_msgSend(v17, "conformsToTypeIdentifier:", CFSTR("com.apple.storage-removable")) & 1) != 0
     || (objc_msgSend(v17, "conformsToTypeIdentifier:", CFSTR("com.apple.storage-external")) & 1) != 0
     || objc_msgSend(v17, "conformsToTypeIdentifier:", CFSTR("com.apple.file-server"))))
  {
    v28 = objc_alloc_init(ISGenericRecipe);
    -[ISResourceProvider setSuggestedRecipe:](v27, "setSuggestedRecipe:", v28);

  }
  return v27;
}

@end
