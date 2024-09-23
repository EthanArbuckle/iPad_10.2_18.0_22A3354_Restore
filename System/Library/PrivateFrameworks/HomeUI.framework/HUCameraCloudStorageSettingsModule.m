@implementation HUCameraCloudStorageSettingsModule

- (HUCameraCloudStorageSettingsModule)initWithItemUpdater:(id)a3 cameraProfiles:(id)a4
{
  id v7;
  id v8;
  HUCameraCloudStorageSettingsModule *v9;
  uint64_t v10;
  NSSet *cameraProfiles;
  void *v13;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCameraCloudStorageSettingsModule.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cameraProfiles.count > 0"));

  }
  v14.receiver = self;
  v14.super_class = (Class)HUCameraCloudStorageSettingsModule;
  v9 = -[HFItemModule initWithItemUpdater:](&v14, sel_initWithItemUpdater_, v7);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    cameraProfiles = v9->_cameraProfiles;
    v9->_cameraProfiles = (NSSet *)v10;

  }
  return v9;
}

- (HUCameraCloudStorageSettingsModule)initWithItemUpdater:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_cameraProfiles_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCameraCloudStorageSettingsModule.m"), 34, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUCameraCloudStorageSettingsModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (id)removeAllCameraRecordings
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v16[6];
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[HUCameraCloudStorageSettingsModule cameraProfiles](self, "cameraProfiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v17[0] = v6;
        v17[1] = 3221225472;
        v17[2] = __63__HUCameraCloudStorageSettingsModule_removeAllCameraRecordings__block_invoke;
        v17[3] = &unk_1E6F4C660;
        v17[4] = v10;
        objc_msgSend(MEMORY[0x1E0D519C0], "futureWithBlock:", v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __63__HUCameraCloudStorageSettingsModule_removeAllCameraRecordings__block_invoke_13;
  v16[3] = &unk_1E6F53210;
  v16[4] = self;
  v16[5] = a2;
  objc_msgSend(v12, "addCompletionBlock:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __63__HUCameraCloudStorageSettingsModule_removeAllCameraRecordings__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "recordingEventManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__HUCameraCloudStorageSettingsModule_removeAllCameraRecordings__block_invoke_2;
  v7[3] = &unk_1E6F4D1B0;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "deleteAllEventsWithCompletionHandler:", v7);

}

void __63__HUCameraCloudStorageSettingsModule_removeAllCameraRecordings__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "Error removing all camera clips: %@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "Deleted all clips for profile:%@", (uint8_t *)&v7, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }

}

void __63__HUCameraCloudStorageSettingsModule_removeAllCameraRecordings__block_invoke_13(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "itemUpdater");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0D314C0];
  objc_msgSend(*(id *)(a1 + 32), "itemProviders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestToReloadItemProviders:senderSelector:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v6, "performItemUpdateRequest:", v4);

}

- (BOOL)isItemHeader:(id)a3
{
  return 0;
}

- (id)didSelectItem:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult", a3);
}

- (id)itemProviders
{
  NSSet *itemProviders;
  HUCameraCloudStorageItemProvider *v4;
  void *v5;
  void *v6;
  HFItemProvider *v7;
  HFItemProvider *cloudStorageSectionSettingsItemProvider;
  NSSet *v9;
  NSSet *v10;

  itemProviders = self->_itemProviders;
  if (!itemProviders)
  {
    v4 = [HUCameraCloudStorageItemProvider alloc];
    -[HUCameraCloudStorageSettingsModule cameraProfiles](self, "cameraProfiles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HUCameraCloudStorageItemProvider initWithCameraProfile:](v4, "initWithCameraProfile:", v6);
    cloudStorageSectionSettingsItemProvider = self->_cloudStorageSectionSettingsItemProvider;
    self->_cloudStorageSectionSettingsItemProvider = v7;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", self->_cloudStorageSectionSettingsItemProvider, 0);
    v9 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v10 = self->_itemProviders;
    self->_itemProviders = v9;

    itemProviders = self->_itemProviders;
  }
  return itemProviders;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v4 = a3;
  -[HUCameraCloudStorageSettingsModule itemProviders](self, "itemProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __70__HUCameraCloudStorageSettingsModule_buildSectionsWithDisplayedItems___block_invoke;
  v24[3] = &unk_1E6F57F28;
  v25 = v4;
  v7 = v4;
  objc_msgSend(v5, "na_flatMap:", v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUCameraCloudStorageSettingsModule cloudStorageSectionSettingsItemProvider](self, "cloudStorageSectionSettingsItemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("iCloudStorageSection"));
  v19 = v6;
  v20 = 3221225472;
  v21 = __70__HUCameraCloudStorageSettingsModule_buildSectionsWithDisplayedItems___block_invoke_2;
  v22 = &unk_1E6F4DAD8;
  v23 = v9;
  v12 = v9;
  objc_msgSend(v8, "na_filter:", &v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allObjects", v19, v20, v21, v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D314B0], "itemResultManualSortComparator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sortedArrayUsingComparator:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setItems:", v16);

  _HULocalizedStringWithDefaultValue(CFSTR("HUCameraEraseFooterString"), CFSTR("HUCameraEraseFooterString"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFooterTitle:", v17);

  objc_msgSend(v10, "addObject:", v11);
  return v10;
}

id __70__HUCameraCloudStorageSettingsModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_setByIntersectingWithSet:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __70__HUCameraCloudStorageSettingsModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (NSSet)cameraProfiles
{
  return self->_cameraProfiles;
}

- (HFItemProvider)cloudStorageSectionSettingsItemProvider
{
  return self->_cloudStorageSectionSettingsItemProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudStorageSectionSettingsItemProvider, 0);
  objc_storeStrong((id *)&self->_cameraProfiles, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end
