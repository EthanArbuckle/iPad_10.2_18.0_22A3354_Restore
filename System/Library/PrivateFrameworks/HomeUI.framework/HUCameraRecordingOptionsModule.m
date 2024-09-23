@implementation HUCameraRecordingOptionsModule

- (HUCameraRecordingOptionsModule)initWithItemUpdater:(id)a3 cameraProfiles:(id)a4
{
  id v7;
  id v8;
  HUCameraRecordingOptionsModule *v9;
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
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCameraRecordingOptionsModule.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cameraProfiles.count > 0"));

  }
  v14.receiver = self;
  v14.super_class = (Class)HUCameraRecordingOptionsModule;
  v9 = -[HFItemModule initWithItemUpdater:](&v14, sel_initWithItemUpdater_, v7);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    cameraProfiles = v9->_cameraProfiles;
    v9->_cameraProfiles = (NSSet *)v10;

    -[HUCameraRecordingOptionsModule _buildItemProviders](v9, "_buildItemProviders");
  }

  return v9;
}

- (HUCameraRecordingOptionsModule)initWithItemUpdater:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_cameraProfiles_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCameraRecordingOptionsModule.m"), 42, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUCameraRecordingOptionsModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (BOOL)isItemHeader:(id)a3
{
  return 0;
}

- (void)_buildItemProviders
{
  HUCameraSmartDetectionSettingsModule *v3;
  void *v4;
  void *v5;
  HUCameraSmartDetectionSettingsModule *v6;
  HUCameraSmartDetectionSettingsModule *smartDetectionModule;
  HUCameraCloudStorageSettingsModule *v8;
  void *v9;
  void *v10;
  HUCameraCloudStorageSettingsModule *v11;
  HUCameraCloudStorageSettingsModule *cloudStorageModule;
  HUCameraRecordAudioSettingsItem *v13;
  void *v14;
  void *v15;
  HUCameraRecordAudioSettingsItem *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v3 = [HUCameraSmartDetectionSettingsModule alloc];
  -[HFItemModule itemUpdater](self, "itemUpdater");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingOptionsModule cameraProfiles](self, "cameraProfiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HUCameraSmartDetectionSettingsModule initWithItemUpdater:cameraProfiles:conditionCollection:settingsContext:](v3, "initWithItemUpdater:cameraProfiles:conditionCollection:settingsContext:", v4, v5, 0, 0);
  smartDetectionModule = self->_smartDetectionModule;
  self->_smartDetectionModule = v6;

  v8 = [HUCameraCloudStorageSettingsModule alloc];
  -[HFItemModule itemUpdater](self, "itemUpdater");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingOptionsModule cameraProfiles](self, "cameraProfiles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HUCameraCloudStorageSettingsModule initWithItemUpdater:cameraProfiles:](v8, "initWithItemUpdater:cameraProfiles:", v9, v10);
  cloudStorageModule = self->_cloudStorageModule;
  self->_cloudStorageModule = v11;

  v13 = [HUCameraRecordAudioSettingsItem alloc];
  -[HUCameraRecordingOptionsModule cameraProfiles](self, "cameraProfiles");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "anyObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HUCameraRecordAudioSettingsItem initWithCameraProfile:](v13, "initWithCameraProfile:", v15);
  -[HUCameraRecordingOptionsModule setRecordAudioItem:](self, "setRecordAudioItem:", v16);

  v17 = objc_alloc(MEMORY[0x1E0D31848]);
  v18 = (void *)MEMORY[0x1E0C99E60];
  -[HUCameraRecordingOptionsModule recordAudioItem](self, "recordAudioItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithObject:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v17, "initWithItems:", v20);
  -[HUCameraRecordingOptionsModule setRecordAudioItemProvider:](self, "setRecordAudioItemProvider:", v21);

  -[HUCameraRecordingOptionsModule smartDetectionModule](self, "smartDetectionModule");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "itemProviders");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingOptionsModule recordAudioItemProvider](self, "recordAudioItemProvider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setByAddingObject:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingOptionsModule cloudStorageModule](self, "cloudStorageModule");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "itemProviders");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setByAddingObjectsFromSet:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraRecordingOptionsModule setItemProviders:](self, "setItemProviders:", v27);

}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUCameraRecordingOptionsModule smartDetectionModule](self, "smartDetectionModule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buildSectionsWithDisplayedItems:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUCameraRecordingOptionsModule cloudStorageModule](self, "cloudStorageModule");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "buildSectionsWithDisplayedItems:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("recordAudioSection"));
  -[HUCameraRecordingOptionsModule recordAudioItem](self, "recordAudioItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setItems:", v11);

  objc_msgSend(v6, "arrayByAddingObject:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v13, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;

  v4 = a3;
  -[HUCameraRecordingOptionsModule smartDetectionModule](self, "smartDetectionModule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_4;
  -[HUCameraRecordingOptionsModule smartDetectionModule](self, "smartDetectionModule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v4);

  if (v8)
  {
    -[HUCameraRecordingOptionsModule smartDetectionModule](self, "smartDetectionModule");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v5, "didSelectItem:", v4);
LABEL_4:

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)updateRecordAudioValue:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[6];

  v3 = a3;
  -[HUCameraRecordingOptionsModule recordAudioItem](self, "recordAudioItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateRecordAudioSettingWithValue:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__HUCameraRecordingOptionsModule_updateRecordAudioValue___block_invoke;
  v9[3] = &unk_1E6F4F028;
  v9[4] = self;
  v9[5] = a2;
  v8 = (id)objc_msgSend(v7, "addCompletionBlock:", v9);

}

void __57__HUCameraRecordingOptionsModule_updateRecordAudioValue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "recordAudioItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cameraProfile");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "userSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v7;
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Failed to change audio recording setting for camera settings: %@", (uint8_t *)&v15, 0xCu);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "itemUpdater");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D314C0];
  v10 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "recordAudioItemProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestToReloadItemProviders:senderSelector:", v12, *(_QWORD *)(a1 + 40));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v8, "performItemUpdateRequest:", v13);

}

- (NSSet)itemProviders
{
  return self->_itemProviders;
}

- (void)setItemProviders:(id)a3
{
  objc_storeStrong((id *)&self->_itemProviders, a3);
}

- (HUCameraSmartDetectionSettingsModule)smartDetectionModule
{
  return self->_smartDetectionModule;
}

- (HUCameraCloudStorageSettingsModule)cloudStorageModule
{
  return self->_cloudStorageModule;
}

- (HUCameraRecordAudioSettingsItem)recordAudioItem
{
  return self->_recordAudioItem;
}

- (void)setRecordAudioItem:(id)a3
{
  objc_storeStrong((id *)&self->_recordAudioItem, a3);
}

- (NSSet)cameraProfiles
{
  return self->_cameraProfiles;
}

- (HFStaticItemProvider)recordAudioItemProvider
{
  return self->_recordAudioItemProvider;
}

- (void)setRecordAudioItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_recordAudioItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordAudioItemProvider, 0);
  objc_storeStrong((id *)&self->_cameraProfiles, 0);
  objc_storeStrong((id *)&self->_recordAudioItem, 0);
  objc_storeStrong((id *)&self->_cloudStorageModule, 0);
  objc_storeStrong((id *)&self->_smartDetectionModule, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end
