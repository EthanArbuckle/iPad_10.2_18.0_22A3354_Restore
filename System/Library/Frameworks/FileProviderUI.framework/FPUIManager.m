@implementation FPUIManager

+ (id)authenticationActionForProviderDomain:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  id v14;

  v4 = a3;
  v14 = 0;
  objc_msgSend(a1, "getExtensionRecordsForUseCase:uiExtensionRecord:nonUIExtensionRecord:forProviderDomain:", 0, &v14, 0, v4);
  v5 = v14;
  if (v5)
  {
    objc_msgSend(v5, "fpui_entitlementValueForKey:ofClass:", CFSTR("com.apple.private.fileproviderui.display-inline"), objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v5, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "providerID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = 0;
    +[FPUIManager createFPUIActionWithIdentifier:uiActionProviderIdentifier:fileProviderIdentifier:displayName:predicate:displayInline:isNonUIAction:fpProviderDomain:](FPUIManager, "createFPUIActionWithIdentifier:uiActionProviderIdentifier:fileProviderIdentifier:displayName:predicate:displayInline:isNonUIAction:fpProviderDomain:", &stru_24EFEE558, v8, v9, &stru_24EFEE558, v10, v7, v13, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)createFPUIActionWithIdentifier:(id)a3 uiActionProviderIdentifier:(id)a4 fileProviderIdentifier:(id)a5 displayName:(id)a6 predicate:(id)a7 displayInline:(BOOL)a8 isNonUIAction:(BOOL)a9 fpProviderDomain:(id)a10
{
  _BOOL8 v10;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  FPUIAction *v22;
  uint64_t v24;

  v10 = a8;
  v16 = a10;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  LOBYTE(v24) = a9;
  v22 = -[FPUIAction initWithIdentifier:uiActionProviderIdentifier:fileProviderIdentifier:displayName:predicate:displayInline:isNonUIAction:fpProviderDomain:]([FPUIAction alloc], "initWithIdentifier:uiActionProviderIdentifier:fileProviderIdentifier:displayName:predicate:displayInline:isNonUIAction:fpProviderDomain:", v21, v20, v19, v18, v17, v10, v24, v16);

  return v22;
}

+ (id)valueForKey:(id)a3 inActionPlist:(id)a4
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;

  v5 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
  }
  else
  {
    v8 = fpuiLogHandle;
    if (!fpuiLogHandle)
    {
      FPUIInitLogging();
      v8 = fpuiLogHandle;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[FPUIManager valueForKey:inActionPlist:].cold.1((uint64_t)v5, v8);
    v7 = 0;
  }

  return v7;
}

+ (id)actionsForProviderDomain:(id)a3
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  void *v11;
  CFStringRef v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  BOOL v16;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  uint64_t v34;
  id v35;
  id obj;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  __CFBundle *bundle;
  uint64_t v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  id v59;
  uint8_t v60[128];
  uint8_t buf[4];
  id v62;
  __int16 v63;
  void *v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v45 = a3;
  v3 = fpuiLogHandle;
  if (!fpuiLogHandle)
  {
    FPUIInitLogging();
    v3 = fpuiLogHandle;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    +[FPUIManager actionsForProviderDomain:].cold.1((uint64_t)v45, v3);
  v58 = 0;
  v59 = 0;
  objc_msgSend(a1, "getExtensionRecordsForUseCase:uiExtensionRecord:nonUIExtensionRecord:forProviderDomain:", 1, &v59, &v58, v45);
  v35 = v59;
  v42 = v58;
  v41 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v35)
    objc_msgSend(v4, "addObject:", v35);
  if (v42)
    objc_msgSend(v5, "addObject:", v42);
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v5;
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
  if (v38)
  {
    v37 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v55 != v37)
          objc_enumerationMutation(obj);
        v43 = *(id *)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(v43, "fpui_extensionInfoForKey:ofClass:", CFSTR("NSExtensionFileProviderActions"), objc_opt_class());
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (v40)
        {
          objc_msgSend(v43, "URL");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          bundle = (__CFBundle *)_CFBundleCreateUnique();

          if (bundle)
          {
            v52 = 0u;
            v53 = 0u;
            v50 = 0u;
            v51 = 0u;
            v44 = v40;
            v48 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
            if (!v48)
              goto LABEL_55;
            v46 = *(_QWORD *)v51;
            while (1)
            {
              v7 = 0;
              do
              {
                if (*(_QWORD *)v51 != v46)
                  objc_enumerationMutation(v44);
                v8 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v7);
                objc_msgSend(a1, "valueForKey:inActionPlist:", CFSTR("NSExtensionFileProviderActionIdentifier"), v8);
                v9 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(a1, "valueForKey:inActionPlist:", CFSTR("NSExtensionFileProviderActionName"), v8);
                v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(a1, "valueForKey:inActionPlist:", CFSTR("NSExtensionFileProviderActionActivationRule"), v8);
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                v12 = CFBundleCopyLocalizedString(bundle, v10, v10, CFSTR("Localizable"));
                v13 = (__CFString *)v12;
                if (v12)
                  v14 = (__CFString *)v12;
                else
                  v14 = v10;
                v15 = v14;

                if (v9)
                  v16 = v10 == 0;
                else
                  v16 = 1;
                if (!v16 && v11 != 0)
                {
                  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 1);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v11, "length"))
                  {
                    v19 = v11;
                    objc_msgSend(v19, "rangeOfString:", CFSTR("%"));
                    if (v20)
                      goto LABEL_33;
                    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", v19);
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v21)
                    {
                      v27 = fpuiLogHandle;
                      if (!fpuiLogHandle)
                      {
                        FPUIInitLogging();
                        v27 = fpuiLogHandle;
                      }
                      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v62 = v19;
                        _os_log_error_impl(&dword_2278C8000, v27, OS_LOG_TYPE_ERROR, "couldn't get predicate from string: %@", buf, 0xCu);
                      }
LABEL_33:
                      v21 = 0;
                    }

                  }
                  else
                  {
                    v21 = v18;
                  }
                  if (v21)
                  {
                    objc_msgSend(v43, "bundleIdentifier");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v45, "providerID");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    LOBYTE(v34) = v43 == v42;
                    +[FPUIManager createFPUIActionWithIdentifier:uiActionProviderIdentifier:fileProviderIdentifier:displayName:predicate:displayInline:isNonUIAction:fpProviderDomain:](FPUIManager, "createFPUIActionWithIdentifier:uiActionProviderIdentifier:fileProviderIdentifier:displayName:predicate:displayInline:isNonUIAction:fpProviderDomain:", v9, v22, v23, v15, v21, 0, v34, v45);
                    v24 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v41, "addObject:", v24);
                    v25 = fpuiLogHandle;
                    if (!fpuiLogHandle)
                    {
                      FPUIInitLogging();
                      v25 = fpuiLogHandle;
                    }
                    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543362;
                      v62 = v9;
                      _os_log_error_impl(&dword_2278C8000, v25, OS_LOG_TYPE_ERROR, "Found action for %{public}@", buf, 0xCu);
                    }

                  }
                  else
                  {
                    v26 = fpuiLogHandle;
                    if (!fpuiLogHandle)
                    {
                      FPUIInitLogging();
                      v26 = fpuiLogHandle;
                    }
                    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543362;
                      v62 = v9;
                      _os_log_error_impl(&dword_2278C8000, v26, OS_LOG_TYPE_ERROR, "Invalid activation rule for %{public}@", buf, 0xCu);
                    }
                  }

                }
                ++v7;
              }
              while (v48 != v7);
              v28 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
              v48 = v28;
              if (!v28)
              {
LABEL_55:

                CFRelease(bundle);
                goto LABEL_64;
              }
            }
          }
          v30 = fpuiLogHandle;
          if (!fpuiLogHandle)
          {
            FPUIInitLogging();
            v30 = fpuiLogHandle;
          }
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v31 = v30;
            objc_msgSend(v43, "URL");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v62 = v45;
            v63 = 2112;
            v64 = v32;
            _os_log_error_impl(&dword_2278C8000, v31, OS_LOG_TYPE_ERROR, "No extension bundle found for domain: %{public}@ at url %@", buf, 0x16u);

          }
        }
        else
        {
          v29 = fpuiLogHandle;
          if (!fpuiLogHandle)
          {
            FPUIInitLogging();
            v29 = fpuiLogHandle;
          }
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v62 = v45;
            _os_log_error_impl(&dword_2278C8000, v29, OS_LOG_TYPE_ERROR, "No action plists found for domain: %{public}@", buf, 0xCu);
          }
        }
LABEL_64:

      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
    }
    while (v38);
  }

  return v41;
}

+ (BOOL)isAction:(id)a3 eligibleForItems:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  char v15;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v17 = a1;
  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v18 = a4;
  objc_msgSend(v5, "predicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = v18;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(v11, "isKnownByTheProvider"))
          {
            objc_msgSend(v5, "fileProviderIdentifier", v17);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "providerID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v12, "isEqualToString:", v13);

            if (v14)
              continue;
          }
          v15 = 0;
          goto LABEL_15;
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v8)
          continue;
        break;
      }
    }

    objc_msgSend(v17, "extensionMatchingDictionaryForItems:fpProviderDomain:", v7, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v6, "evaluateWithObject:", v7);
LABEL_15:

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (void)getExtensionRecordsForUseCase:(unint64_t)a3 uiExtensionRecord:(id *)a4 nonUIExtensionRecord:(id *)a5 forProviderDomain:(id)a6
{
  id v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id *v28;
  void *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v9 = a6;
  objc_msgSend(v9, "providerID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"));

  if (v11
    || (objc_msgSend(v9, "providerID"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider")),
        v12,
        v13))
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDC1528], "fpui_extensionRecordForIdentifier:useCase:isUIExtension:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProviderUI"), a3, 1);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x24BDC1528];
    objc_msgSend(v9, "extensionBundleURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fpui_extensionRecordForURL:useCase:isUIExtension:", v15, a3, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v16);
      objc_msgSend(v9, "providerID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.SMBClientProvider.FileProvider"));

      if (v18)
      {
        if (a4)
        {
          objc_msgSend(MEMORY[0x24BDC1528], "fpui_extensionRecordForIdentifier:useCase:isUIExtension:", CFSTR("com.apple.FileProviderUI.ServerAuthUIExtension"), a3, 1);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        objc_msgSend(v16, "fpui_containingApplicationRecord");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v29 = v19;
          v28 = a4;
          v33 = 0u;
          v34 = 0u;
          v31 = 0u;
          v32 = 0u;
          objc_msgSend(v19, "applicationExtensionRecords");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v32;
            while (2)
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v32 != v22)
                  objc_enumerationMutation(obj);
                v24 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
                objc_msgSend(v24, "fpui_extensionInfoForKey:ofClass:", CFSTR("NSExtensionPointIdentifier"), objc_opt_class());
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v25, "isEqualToString:", CFSTR("com.apple.fileprovider-actionsui")))
                {
                  objc_msgSend(MEMORY[0x24BDC1528], "fpui_extensionRecordByFiltering:useCase:isUIExtension:", v24, a3, 1);
                  v26 = objc_claimAutoreleasedReturnValue();
                  if (v26)
                  {
                    v27 = (void *)v26;
                    if (v28)
                      *v28 = objc_retainAutorelease(v24);

                    goto LABEL_25;
                  }
                }

              }
              v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
              if (v21)
                continue;
              break;
            }
          }
LABEL_25:

          v19 = v29;
        }

      }
    }

  }
}

+ (id)extensionMatchingDictionaryForItems:(id)a3 fpProviderDomain:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)MEMORY[0x22E29F988](v9);
        FPExtensionMatchingDictionaryForItem();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v14, (_QWORD)v17);

        objc_autoreleasePoolPop(v13);
        ++v12;
      }
      while (v10 != v12);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v10 = v9;
    }
    while (v9);
  }

  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setObject:forKey:", v7, CFSTR("fileproviderItems"));

  return v15;
}

+ (void)valueForKey:(uint64_t)a1 inActionPlist:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v5 = 138543618;
  v6 = a1;
  v7 = 2114;
  v8 = objc_opt_class();
  OUTLINED_FUNCTION_0(&dword_2278C8000, v3, v4, "Invalid value for %{public}@ got %{public}@ expected string", (uint8_t *)&v5);

}

+ (void)actionsForProviderDomain:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_2278C8000, a2, OS_LOG_TYPE_DEBUG, "Getting actionsForProviderDomain: %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)isAction:(NSObject *)a3 eligibleForItems:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_0(&dword_2278C8000, a3, (uint64_t)a3, "Predicate evaluation threw an exception. Predicate: %@, Exception: %@", (uint8_t *)&v3);
}

@end
