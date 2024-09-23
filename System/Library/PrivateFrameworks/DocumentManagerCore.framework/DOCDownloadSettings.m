@implementation DOCDownloadSettings

- (DOCDownloadSettings)init
{
  DOCDownloadSettings *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DOCDownloadSettings;
  v2 = -[DOCDownloadSettings init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    +[DOCManagedPermission defaultPermission](DOCManagedPermission, "defaultPermission");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHostIdentifier:", v4);

    +[DOCNodeStartupManager shared](DOCNodeStartupManager, "shared");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startIfNeeded");

  }
  return v2;
}

- (void)fetchDefaultDownloadsLocationItem:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  DOCDownloadSettings *v17;
  id v18;
  void (**v19)(_QWORD, _QWORD);
  id v20;
  _QWORD v21[5];
  id v22;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __57__DOCDownloadSettings_fetchDefaultDownloadsLocationItem___block_invoke;
  v21[3] = &unk_24C0FF108;
  v21[4] = self;
  v6 = v4;
  v22 = v6;
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD0D5D4](v21);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.DocumentManager.defaults"));
  objc_msgSend(v8, "dataForKey:", CFSTR("DOCDefaultDownloadLocationKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v20 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, &v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v20;
    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDC82F0], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "itemID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v5;
      v15[1] = 3221225472;
      v15[2] = __57__DOCDownloadSettings_fetchDefaultDownloadsLocationItem___block_invoke_3;
      v15[3] = &unk_24C0FF130;
      v16 = v10;
      v17 = self;
      v18 = v6;
      v19 = v7;
      objc_msgSend(v12, "fetchItemForItemID:completionHandler:", v13, v15);

    }
    else
    {
      v14 = docDownloadServiceLogHandle;
      if (!docDownloadServiceLogHandle)
      {
        DOCInitLogging();
        v14 = docDownloadServiceLogHandle;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[DOCDownloadSettings fetchDefaultDownloadsLocationItem:].cold.1();
      v7[2](v7, 0);
    }

  }
  else
  {
    v7[2](v7, 0);
  }

}

void __57__DOCDownloadSettings_fetchDefaultDownloadsLocationItem___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__DOCDownloadSettings_fetchDefaultDownloadsLocationItem___block_invoke_2;
  v6[3] = &unk_24C0FF0E0;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v4, "_fetchDefaultFallbackDownloadLocationWithPreferredDomain:completion:", a2, v6);

}

void __57__DOCDownloadSettings_fetchDefaultDownloadsLocationItem___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  if (*(_QWORD *)(a1 + 40))
  {
    v5 = *(void **)(a1 + 32);
    v6 = a3;
    v7 = a2;
    objc_msgSend(v5, "setCurrentDefaultDownloadsLocationItem:", v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void __57__DOCDownloadSettings_fetchDefaultDownloadsLocationItem___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x24BDC82F8];
    objc_msgSend(v5, "providerDomainID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v7, "providerDomainWithID:cachePolicy:error:", v8, 3, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;

    if (v10)
    {
      v11 = docDownloadServiceLogHandle;
      if (!docDownloadServiceLogHandle)
      {
        DOCInitLogging();
        v11 = docDownloadServiceLogHandle;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __57__DOCDownloadSettings_fetchDefaultDownloadsLocationItem___block_invoke_3_cold_2(a1, v11);
    }

    if (v9 && (objc_msgSend(v5, "isTrashed") & 1) == 0 && (objc_msgSend(v9, "isHidden") & 1) == 0)
    {
      if (*(_QWORD *)(a1 + 48))
      {
        v12 = docDownloadServiceLogHandle;
        if (!docDownloadServiceLogHandle)
        {
          DOCInitLogging();
          v12 = docDownloadServiceLogHandle;
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v16 = v5;
          _os_log_impl(&dword_2090A2000, v12, OS_LOG_TYPE_INFO, "Successfully fetched saved downloads location item: %@", buf, 0xCu);
        }
        objc_msgSend(*(id *)(a1 + 40), "setCurrentDefaultDownloadsLocationItem:", v5);
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }
      goto LABEL_22;
    }
  }
  else
  {
    v9 = 0;
  }
  v13 = docDownloadServiceLogHandle;
  if (!docDownloadServiceLogHandle)
  {
    DOCInitLogging();
    v13 = docDownloadServiceLogHandle;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    __57__DOCDownloadSettings_fetchDefaultDownloadsLocationItem___block_invoke_3_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_22:

}

- (void)_removeCurrentDownloadsLocationFromFavorites
{
  void *v3;
  _QWORD v4[5];

  -[DOCDownloadSettings currentDefaultDownloadsLocationItem](self, "currentDefaultDownloadsLocationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __67__DOCDownloadSettings__removeCurrentDownloadsLocationFromFavorites__block_invoke;
    v4[3] = &unk_24C0FE168;
    v4[4] = self;
    DOCRunInMainThread(v4);
  }
}

void __67__DOCDownloadSettings__removeCurrentDownloadsLocationFromFavorites__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  _QWORD v5[5];
  id v6;

  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__6;
  v5[4] = __Block_byref_object_dispose__6;
  objc_msgSend(*(id *)(a1 + 32), "currentDefaultDownloadsLocationItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[DOCFavoritesManager sharedManager](DOCFavoritesManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentDefaultDownloadsLocationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __67__DOCDownloadSettings__removeCurrentDownloadsLocationFromFavorites__block_invoke_13;
  v4[3] = &unk_24C0FF158;
  v4[4] = v5;
  objc_msgSend(v2, "removeFavorite:completion:", v3, v4);

  _Block_object_dispose(v5, 8);
}

void __67__DOCDownloadSettings__removeCurrentDownloadsLocationFromFavorites__block_invoke_13(uint64_t a1, char a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((a2 & 1) == 0)
  {
    v3 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      v3 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __67__DOCDownloadSettings__removeCurrentDownloadsLocationFromFavorites__block_invoke_13_cold_1(a1, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (BOOL)_saveDownloadFolderItem:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[4];
  id v20;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.DocumentManager.defaults"));
    objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("DOCDefaultDownloadLocationKey"));
    -[DOCDownloadSettings setCurrentDefaultDownloadsLocationItem:](self, "setCurrentDefaultDownloadsLocationItem:", v6);
    if (v6)
    {
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __53__DOCDownloadSettings__saveDownloadFolderItem_error___block_invoke;
      v19[3] = &unk_24C0FE168;
      v20 = v6;
      DOCRunInMainThread(v19);

    }
    else
    {
      v10 = docDownloadServiceLogHandle;
      if (!docDownloadServiceLogHandle)
      {
        DOCInitLogging();
        v10 = docDownloadServiceLogHandle;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[DOCDownloadSettings _saveDownloadFolderItem:error:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }

  }
  else
  {
    v9 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      v9 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[DOCDownloadSettings _saveDownloadFolderItem:error:].cold.2();
  }

  return v7 != 0;
}

void __53__DOCDownloadSettings__saveDownloadFolderItem_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  +[DOCFavoritesManager sharedManager](DOCFavoritesManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__DOCDownloadSettings__saveDownloadFolderItem_error___block_invoke_2;
  v4[3] = &unk_24C0FF0B0;
  v5 = v3;
  objc_msgSend(v2, "addFavorite:completion:", v5, v4);

}

void __53__DOCDownloadSettings__saveDownloadFolderItem_error___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((a2 & 1) == 0)
  {
    v3 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      v3 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __53__DOCDownloadSettings__saveDownloadFolderItem_error___block_invoke_2_cold_1(a1, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)setDefaultDownloadsLocationItem:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, _BOOL8, id);
  _BOOL8 v9;
  id v10;
  void *v11;
  id v12;

  v7 = a3;
  v8 = (void (**)(id, _BOOL8, id))a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCDownloadSettings.m"), 174, CFSTR("Attempted to set nil as the default downloads location. Call resetDefaultDownloadsLocationItem instead."));

  }
  -[DOCDownloadSettings _removeCurrentDownloadsLocationFromFavorites](self, "_removeCurrentDownloadsLocationFromFavorites");
  v12 = 0;
  v9 = -[DOCDownloadSettings _saveDownloadFolderItem:error:](self, "_saveDownloadFolderItem:error:", v7, &v12);
  v10 = v12;
  if (v8)
    v8[2](v8, v9, v10);

}

- (void)setDefaultDownloadsItemForProviderDomain:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v13[0] = a3;
  v7 = (void *)MEMORY[0x24BDBCE30];
  v8 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __82__DOCDownloadSettings_setDefaultDownloadsItemForProviderDomain_completionHandler___block_invoke;
  v11[3] = &unk_24C0FEB70;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  -[DOCDownloadSettings _rootItemOfPreferredProviderInDomains:completion:](self, "_rootItemOfPreferredProviderInDomains:completion:", v9, v11);

}

void __82__DOCDownloadSettings_setDefaultDownloadsItemForProviderDomain_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  if (a2)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __82__DOCDownloadSettings_setDefaultDownloadsItemForProviderDomain_completionHandler___block_invoke_2;
    v4[3] = &unk_24C0FEB70;
    v3 = *(void **)(a1 + 40);
    v5 = *(id *)(a1 + 32);
    v6 = v3;
    objc_msgSend(v5, "_createDefaultDownloadsFolderInParent:completion:", a2, v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __82__DOCDownloadSettings_setDefaultDownloadsItemForProviderDomain_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = docDownloadServiceLogHandle;
  if (!docDownloadServiceLogHandle)
  {
    DOCInitLogging();
    v7 = docDownloadServiceLogHandle;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v5;
    _os_log_impl(&dword_2090A2000, v7, OS_LOG_TYPE_INFO, "Fetched downloads location: %@", buf, 0xCu);
  }
  if (v5)
  {
    if (objc_msgSend(v6, "code") == -1001)
    {

      v6 = 0;
    }
    v8 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __82__DOCDownloadSettings_setDefaultDownloadsItemForProviderDomain_completionHandler___block_invoke_23;
    v13[3] = &unk_24C0FEBE8;
    v14 = v5;
    v6 = v6;
    v15 = v6;
    v16 = *(id *)(a1 + 40);
    objc_msgSend(v8, "setDefaultDownloadsLocationItem:completionHandler:", v14, v13);

    v9 = v14;
  }
  else
  {
    _DocumentManagerBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Unrecoverable failure to locate the Downloads location."), CFSTR("Unrecoverable failure to locate the Downloads location."), CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_createErrorForCode:localizedDescription:underlyingError:", -1002, v9, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      v12 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __82__DOCDownloadSettings_setDefaultDownloadsItemForProviderDomain_completionHandler___block_invoke_2_cold_1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void __82__DOCDownloadSettings_setDefaultDownloadsItemForProviderDomain_completionHandler___block_invoke_23(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = *(id *)(a1 + 32);
  v5 = v4;
  if (*(_QWORD *)(a1 + 40))
  {

    v5 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)resetDefaultDownloadsLocationItem
{
  id v2;

  -[DOCDownloadSettings _removeCurrentDownloadsLocationFromFavorites](self, "_removeCurrentDownloadsLocationFromFavorites");
  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.DocumentManager.defaults"));
  objc_msgSend(v2, "setObject:forKey:", 0, CFSTR("DOCDefaultDownloadLocationKey"));

}

- (void)fetchProvidersSuitableForDownloads:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__DOCDownloadSettings_fetchProvidersSuitableForDownloads___block_invoke;
  v6[3] = &unk_24C0FE778;
  v7 = v4;
  v5 = v4;
  -[DOCDownloadSettings _fetchProviders:](self, "_fetchProviders:", v6);

}

void __58__DOCDownloadSettings_fetchProvidersSuitableForDownloads___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  int v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  const char *v21;
  char v22;
  void *v23;
  const char *v24;
  char v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  char v33;
  id v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v35 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (!v6)
  {
    v37 = 0;
    v8 = 0;
    v9 = 0;
    goto LABEL_40;
  }
  v7 = v6;
  v37 = 0;
  v8 = 0;
  v9 = 0;
  v10 = *(_QWORD *)v39;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v39 != v10)
        objc_enumerationMutation(v5);
      v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v11);
      objc_msgSend(v12, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage"));

      if (v14)
      {
        v15 = v12;

        v9 = v15;
      }
      if (objc_msgSend(v12, "isiCloudDriveProvider")
        && (objc_msgSend(v12, "isHidden") & 1) == 0
        && (objc_msgSend(v12, "needsAuthentication") & 1) == 0)
      {
        v16 = objc_msgSend(v12, "isMainiCloudDriveDomain");
        v17 = v12;
        v18 = v37;
        if (v16)
          v19 = v37;
        else
          v19 = v8;
        if (v16)
          v18 = v17;
        v37 = v18;
        if (!v16)
          v8 = v17;

      }
      if ((objc_msgSend(v12, "needsAuthentication") & 1) == 0 && (objc_msgSend(v12, "canDisconnect") & 1) == 0)
      {
        if (objc_msgSend(v12, "supportsEnumeration"))
        {
          if (objc_msgSend(v12, "isEnabled"))
          {
            if ((objc_msgSend(v12, "isHidden") & 1) == 0 && (objc_msgSend(v12, "isReadOnly") & 1) == 0)
            {
              if (objc_msgSend(v12, "isAvailableSystemWide"))
              {
                if (objc_msgSend(v12, "supportsPickingFolders"))
                {
                  objc_msgSend(v12, "identifier");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v22 = DOCProviderDomainIDIsDefaultSharedServer(v20, v21);

                  if ((v22 & 1) == 0)
                  {
                    objc_msgSend(v12, "identifier");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    v25 = DOCProviderDomainIDIsExternalDevice(v23, v24);

                    if ((v25 & 1) == 0)
                    {
                      objc_msgSend(v12, "providerID");
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.DocumentManager.SpotlightFileProvider")))goto LABEL_32;
                      objc_msgSend(v12, "providerID");
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v27, "isEqualToString:", CFSTR("com.apple.mobileslideshow.PhotosFileProvider")))
                      {

LABEL_32:
                        goto LABEL_33;
                      }
                      objc_msgSend(v12, "providerID");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("com.apple.TapToRadar.SystemFiles"));

                      if ((v33 & 1) == 0)
                        objc_msgSend(v36, "addObject:", v12);
                    }
                  }
                }
              }
            }
          }
        }
      }
LABEL_33:
      ++v11;
    }
    while (v7 != v11);
    v28 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    v7 = v28;
  }
  while (v28);
LABEL_40:

  objc_msgSend(v36, "sortUsingComparator:", &__block_literal_global_15);
  if (v9 && objc_msgSend(v36, "containsObject:", v9))
  {
    objc_msgSend(v36, "removeObject:", v9);
    objc_msgSend(v36, "insertObject:atIndex:", v9, 0);
  }
  if (v37 && (v29 = v37, (objc_msgSend(v36, "containsObject:", v37) & 1) != 0)
    || v8 && (v29 = v8, objc_msgSend(v36, "containsObject:", v8)))
  {
    objc_msgSend(v36, "removeObject:", v29);
    objc_msgSend(v36, "insertObject:atIndex:", v29, 0);
    v30 = 0;
    if (!v9)
      goto LABEL_52;
  }
  else
  {
    v30 = 1;
    if (!v9)
      goto LABEL_52;
  }
  if (((objc_msgSend(v36, "count") != 0) & ~v30) == 0)
  {
    objc_msgSend(v36, "removeObject:", v9);
    objc_msgSend(v36, "insertObject:atIndex:", v9, 0);
  }
LABEL_52:
  v31 = *(_QWORD *)(a1 + 32);
  if (v31)
    (*(void (**)(uint64_t, void *, id))(v31 + 16))(v31, v36, v35);

}

uint64_t __58__DOCDownloadSettings_fetchProvidersSuitableForDownloads___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "providerDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "providerDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return v7;
}

- (void)_fetchDefaultFallbackDownloadLocationWithPreferredDomain:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = docDownloadServiceLogHandle;
  if (!docDownloadServiceLogHandle)
  {
    DOCInitLogging();
    v8 = docDownloadServiceLogHandle;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2090A2000, v8, OS_LOG_TYPE_INFO, "No valid saved downloads location - fetching default", buf, 2u);
  }
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke;
  v11[3] = &unk_24C0FF290;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[DOCDownloadSettings _fetchAvailableProviders:](self, "_fetchAvailableProviders:", v11);

}

void __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, void *);
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke_2;
  v35[3] = &unk_24C0FF1A0;
  v35[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  v36 = v8;
  v9 = (void *)MEMORY[0x20BD0D5D4](v35);
  v32[0] = v7;
  v32[1] = 3221225472;
  v32[2] = __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke_33;
  v32[3] = &unk_24C0FF1F0;
  v32[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v33 = v10;
  v11 = v9;
  v34 = v11;
  v12 = (void *)MEMORY[0x20BD0D5D4](v32);
  v23 = v7;
  v24 = 3221225472;
  v25 = __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke_3_36;
  v26 = &unk_24C0FF268;
  v13 = v10;
  v27 = v13;
  v14 = *(id *)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 32);
  v28 = v14;
  v29 = v15;
  v16 = v11;
  v30 = v16;
  v17 = v12;
  v31 = v17;
  v18 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD0D5D4](&v23);
  v19 = docDownloadServiceLogHandle;
  if (*(_QWORD *)(a1 + 40))
  {
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      v19 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = *(void **)(a1 + 40);
      v21 = v19;
      objc_msgSend(v20, "providerDomainID", v23, v24, v25, v26, v27, v28, v29, v30);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v38 = v22;
      _os_log_impl(&dword_2090A2000, v21, OS_LOG_TYPE_INFO, "No valid saved downloads location - fetching default in previous location's domain: %@", buf, 0xCu);

    }
    v18[2](v18, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      v19 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2090A2000, v19, OS_LOG_TYPE_INFO, "No saved downloads location - fetching default using standard fallback logic", buf, 2u);
    }
    (*((void (**)(id, _QWORD))v17 + 2))(v17, *(_QWORD *)(a1 + 48));
  }

}

void __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke_3;
    v8[3] = &unk_24C0FEB70;
    v8[4] = v7;
    v9 = v5;
    objc_msgSend(v7, "_createDefaultDownloadsFolderInParent:completion:", a2, v8);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, *(_QWORD *)(a1 + 40));
  }

}

void __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = docDownloadServiceLogHandle;
  if (!docDownloadServiceLogHandle)
  {
    DOCInitLogging();
    v7 = docDownloadServiceLogHandle;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v5;
    _os_log_impl(&dword_2090A2000, v7, OS_LOG_TYPE_INFO, "Fetched downloads location: %@", buf, 0xCu);
  }
  if (objc_msgSend(v6, "code") == -1001)
  {

    v6 = 0;
  }
  v8 = *(void **)(a1 + 32);
  v12 = 0;
  objc_msgSend(v8, "_saveDownloadFolderItem:error:", v5, &v12);
  v9 = v12;
  v10 = v6;
  v11 = v10;
  if (v9)
  {
    v11 = v9;

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke_33(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke_2_34;
  v7[3] = &unk_24C0FF1C8;
  v8 = *(id *)(a1 + 48);
  v9 = v3;
  v6 = v3;
  objc_msgSend(v4, "_rootItemOfPreferredProviderInDomains:completion:", v5, v7);

}

uint64_t __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke_2_34(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
}

void __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke_3_36(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke_4;
  v21[3] = &unk_24C0FF218;
  v8 = *(void **)(a1 + 32);
  v22 = *(id *)(a1 + 40);
  v9 = objc_msgSend(v8, "indexOfObjectPassingTest:", v21);
  v10 = *(void **)(a1 + 32);
  if (!v10 || v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      v14 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = v14;
      objc_msgSend(v5, "providerDomainID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v16;
      _os_log_impl(&dword_2090A2000, v15, OS_LOG_TYPE_INFO, "Preferred domain (%@) is unavailable - falling back to default using standard fallback logic", buf, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 48);
    v25[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v7;
    v17[1] = 3221225472;
    v17[2] = __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke_5;
    v17[3] = &unk_24C0FF240;
    v18 = *(id *)(a1 + 56);
    v19 = v6;
    v20 = *(id *)(a1 + 64);
    objc_msgSend(v12, "_rootItemOfPreferredProviderInDomains:completion:", v13, v17);

  }
}

uint64_t __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "providerDomainID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

void __91__DOCDownloadSettings__fetchDefaultFallbackDownloadLocationWithPreferredDomain_completion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = docDownloadServiceLogHandle;
  if (v5)
  {
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      v7 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = v7;
      objc_msgSend(v5, "providerDomainID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_2090A2000, v8, OS_LOG_TYPE_INFO, "Validated preferred domain! - creating Downloads folder from that domain: %@", (uint8_t *)&v10, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      v7 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_2090A2000, v7, OS_LOG_TYPE_INFO, "Unable to validate preferred domain - falling back to default using standard fallback logic", (uint8_t *)&v10, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)_createDefaultDownloadsFolderInParent:(id)a3 completion:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x24BDC8268];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithParentItem:folderName:", v7, CFSTR("Downloads"));

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__DOCDownloadSettings__createDefaultDownloadsFolderInParent_completion___block_invoke;
  v11[3] = &unk_24C0FE2F0;
  v12 = v5;
  v9 = v5;
  objc_msgSend(v8, "setCreateFolderCompletionBlock:", v11);
  objc_msgSend(MEMORY[0x24BDC82F0], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scheduleAction:", v8);

}

void __72__DOCDownloadSettings__createDefaultDownloadsFolderInParent_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v8)
  {
    v6 = v8;
  }
  else
  {
    objc_msgSend(v5, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDC81B8]);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_fetchProviders:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD *v12;
  uint64_t *v13;
  SEL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _QWORD v21[3];
  char v22;

  v5 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 1;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__6;
  v19 = __Block_byref_object_dispose__6;
  v20 = 0;
  v6 = (void *)MEMORY[0x24BDC82F8];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __39__DOCDownloadSettings__fetchProviders___block_invoke;
  v10[3] = &unk_24C0FF2B8;
  v10[4] = self;
  v12 = v21;
  v7 = v5;
  v11 = v7;
  v13 = &v15;
  v14 = a2;
  objc_msgSend(v6, "beginMonitoringProviderDomainChangesWithHandler:", v10);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v16[5];
  v16[5] = v8;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v21, 8);

}

void __39__DOCDownloadSettings__fetchProviders___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (v11)
  {
    objc_msgSend(v11, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setProviders:", v6);

    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (*(_BYTE *)(v7 + 24))
    {
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "providers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v5);

      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    }
    *(_BYTE *)(v7 + 24) = 0;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      objc_msgSend(MEMORY[0x24BDC82F8], "endMonitoringProviderDomainChanges:");
  }
  else if (v5 && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("DOCDownloadSettings.m"), 454, CFSTR("FileProvider crashed most likely. So we cannot do anything else but crash. Please send a bug to FileProvider if you see this error. error = %@"), v5);

  }
}

- (void)_fetchAvailableProviders:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__DOCDownloadSettings__fetchAvailableProviders___block_invoke;
  v6[3] = &unk_24C0FF330;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[DOCDownloadSettings fetchProvidersSuitableForDownloads:](self, "fetchProvidersSuitableForDownloads:", v6);

}

void __48__DOCDownloadSettings__fetchAvailableProviders___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__DOCDownloadSettings__fetchAvailableProviders___block_invoke_2;
  v9[3] = &unk_24C0FF308;
  v6 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v10 = v5;
  v11 = v7;
  v8 = v5;
  objc_msgSend(v6, "_preferredProvidersIn:completion:", a2, v9);

}

void __48__DOCDownloadSettings__fetchAvailableProviders___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v3 = a2;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage")) & 1) != 0)
    {
      v6 = objc_msgSend(v4, "isEnabled");

      if ((v6 & 1) == 0)
      {
        objc_msgSend(v4, "providerDisplayName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v10[0] = MEMORY[0x24BDAC760];
        v10[1] = 3221225472;
        v10[2] = __48__DOCDownloadSettings__fetchAvailableProviders___block_invoke_3;
        v10[3] = &unk_24C0FF2E0;
        v11 = v7;
        v13 = *(id *)(a1 + 40);
        v12 = v3;
        v8 = v7;
        objc_msgSend(v4, "setEnabled:completionHandler:", 1, v10);

        goto LABEL_8;
      }
    }
    else
    {

    }
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id, _QWORD))(v9 + 16))(v9, v3, *(_QWORD *)(a1 + 32));
LABEL_8:

}

void __48__DOCDownloadSettings__fetchAvailableProviders___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  if (v3)
  {
    v4 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      v4 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __48__DOCDownloadSettings__fetchAvailableProviders___block_invoke_3_cold_1(a1, (uint64_t)v3, v4);
  }
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, *(_QWORD *)(a1 + 40), v3);

}

- (void)_rootItemOfPreferredProviderInDomains:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  DOCDownloadSettings *v24;
  id v25;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDC82F0], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __72__DOCDownloadSettings__rootItemOfPreferredProviderInDomains_completion___block_invoke;
    v21[3] = &unk_24C0FF358;
    v25 = v7;
    v22 = v8;
    v23 = v6;
    v24 = self;
    objc_msgSend(v9, "doc_fetchRootItemForProviderDomain:completionHandler:", v22, v21);

    v10 = v25;
  }
  else
  {
    v11 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      v11 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[DOCDownloadSettings _rootItemOfPreferredProviderInDomains:completion:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    _DocumentManagerBundle();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Unrecoverable failure to locate the Downloads location."), CFSTR("Unrecoverable failure to locate the Downloads location."), CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[DOCDownloadSettings _createErrorForCode:localizedDescription:underlyingError:](self, "_createErrorForCode:localizedDescription:underlyingError:", -1001, v10, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v20);

  }
}

void __72__DOCDownloadSettings__rootItemOfPreferredProviderInDomains_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v7 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      v7 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __72__DOCDownloadSettings__rootItemOfPreferredProviderInDomains_completion___block_invoke_cold_1(a1, v7);
    v8 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    objc_msgSend(v8, "removeObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 48), "_rootItemOfPreferredProviderInDomains:completion:", v8, *(_QWORD *)(a1 + 56));

  }
}

- (void)_preferredProvidersIn:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id obj;
  _QWORD block[4];
  id v16;
  _QWORD *v17;
  _QWORD v18[5];
  NSObject *v19;
  _QWORD *v20;
  _QWORD *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[3];
  char v27;
  _QWORD v28[5];
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v13 = a4;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__6;
  v28[4] = __Block_byref_object_dispose__6;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v7 = dispatch_group_create();
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v23;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v10);
        dispatch_group_enter(v7);
        v18[0] = MEMORY[0x24BDAC760];
        v18[1] = 3221225472;
        v18[2] = __56__DOCDownloadSettings__preferredProvidersIn_completion___block_invoke;
        v18[3] = &unk_24C0FF380;
        v20 = v28;
        v21 = v26;
        v18[4] = v11;
        v19 = v7;
        -[DOCDownloadSettings _validatePreferredProvider:completion:](self, "_validatePreferredProvider:completion:", v11, v18);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v8);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__DOCDownloadSettings__preferredProvidersIn_completion___block_invoke_2;
  block[3] = &unk_24C0FF3A8;
  v17 = v28;
  v16 = v13;
  v12 = v13;
  dispatch_group_notify(v7, MEMORY[0x24BDAC9B8], block);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);

}

void __56__DOCDownloadSettings__preferredProvidersIn_completion___block_invoke(uint64_t a1, int a2)
{
  id v3;

  if (a2)
  {
    v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_sync_enter(v3);
    if (objc_msgSend(*(id *)(a1 + 32), "isiCloudDriveProvider")
      && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "insertObject:atIndex:", *(_QWORD *)(a1 + 32), 0);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 32));
    }
    objc_sync_exit(v3);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __56__DOCDownloadSettings__preferredProvidersIn_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count"))
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_validatePreferredProvider:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD *v12;
  _QWORD v13[3];
  char v14;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isiCloudDriveProvider")
    && objc_msgSend(v5, "isEnabled")
    && (objc_msgSend(v5, "needsAuthentication") & 1) == 0)
  {
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    v14 = 0;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__DOCDownloadSettings__validatePreferredProvider_completion___block_invoke;
    block[3] = &unk_24C0FF3F8;
    v10 = v5;
    v12 = v13;
    v11 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    _Block_object_dispose(v13, 8);
  }
  else
  {
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage"));

    (*((void (**)(id, BOOL))v6 + 2))(v6, v8 != 0);
  }

}

void __61__DOCDownloadSettings__validatePreferredProvider_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;

  objc_msgSend(MEMORY[0x24BDC82F0], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__DOCDownloadSettings__validatePreferredProvider_completion___block_invoke_2;
  v6[3] = &unk_24C0FF3D0;
  v5 = *(_OWORD *)(a1 + 40);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(v2, "doc_fetchRootItemForProviderDomain:completionHandler:", v3, v6);

}

uint64_t __61__DOCDownloadSettings__validatePreferredProvider_completion___block_invoke_2(uint64_t a1, void *a2)
{
  char v3;

  if (a2)
    v3 = objc_msgSend(a2, "isActionable");
  else
    v3 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_createErrorForCode:(int64_t)a3 localizedDescription:(id)a4 underlyingError:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a5;
  v8 = (void *)MEMORY[0x24BDBCED8];
  v9 = a4;
  objc_msgSend(v8, "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v9, *MEMORY[0x24BDD0FC8]);

  if (v7)
    objc_msgSend(v10, "setObject:forKey:", v7, *MEMORY[0x24BDD1398]);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.DocumentManager.DocumentDownloads"), a3, v10);

  return v11;
}

- (NSArray)providers
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setProviders:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSError)providersObserverError
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProvidersObserverError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (id)providersObserverContext
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setProvidersObserverContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (FPItem)currentDefaultDownloadsLocationItem
{
  return (FPItem *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCurrentDefaultDownloadsLocationItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDefaultDownloadsLocationItem, 0);
  objc_storeStrong(&self->_providersObserverContext, 0);
  objc_storeStrong((id *)&self->_providersObserverError, 0);
  objc_storeStrong((id *)&self->_providers, 0);
}

- (void)fetchDefaultDownloadsLocationItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_2090A2000, v0, v1, "Unable to unarchive sandboxing URL wrapper. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __57__DOCDownloadSettings_fetchDefaultDownloadsLocationItem___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_2090A2000, v0, v1, "Unable to fetch saved downloads location item. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __57__DOCDownloadSettings_fetchDefaultDownloadsLocationItem___block_invoke_3_cold_2(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_7_0(a1, a2);
  objc_msgSend(v2, "providerDomainID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_1(&dword_2090A2000, v3, v5, "Unable to get domain for ID: %@. Error: %@", v6);

  OUTLINED_FUNCTION_3_0();
}

void __67__DOCDownloadSettings__removeCurrentDownloadsLocationFromFavorites__block_invoke_13_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2090A2000, a2, a3, "Failed to remove previous download location from favorites : %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_saveDownloadFolderItem:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2090A2000, a1, a3, "Download folder item unexpectedly nil", a5, a6, a7, a8, 0);
}

- (void)_saveDownloadFolderItem:error:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_1_1(&dword_2090A2000, v1, (uint64_t)v1, "Unable to archive item: %@ error: %@", v2);
  OUTLINED_FUNCTION_1();
}

void __53__DOCDownloadSettings__saveDownloadFolderItem_error___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2090A2000, a2, a3, "Failed to add item: %@ to favorites", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __82__DOCDownloadSettings_setDefaultDownloadsItemForProviderDomain_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_2090A2000, v0, v1, "Unable access existing folder because underlying error contained no FPItem: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __48__DOCDownloadSettings__fetchAvailableProviders___block_invoke_3_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_1_1(&dword_2090A2000, a3, (uint64_t)a3, "Unable to enable Local Storage (%@) as our last resort. Error: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

- (void)_rootItemOfPreferredProviderInDomains:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2090A2000, a1, a3, "Unable to find any domains, giving up.", a5, a6, a7, a8, 0);
}

void __72__DOCDownloadSettings__rootItemOfPreferredProviderInDomains_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_7_0(a1, a2);
  objc_msgSend(v2, "providerDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_1(&dword_2090A2000, v3, v5, "Unable to fetch root item for preferred domain: %@ error: %@", v6);

  OUTLINED_FUNCTION_3_0();
}

@end
