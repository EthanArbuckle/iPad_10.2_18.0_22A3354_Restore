@implementation HUCameraRecordingOptionsItemManager

- (id)_buildItemProvidersForHome:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  HUCameraRecordingSettingsModule *v9;
  void *v10;
  void *v11;
  void *v12;
  HUCameraRecordingSettingsModule *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_opt_class();
  -[HFItemManager sourceItem](self, "sourceItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "hf_supportsRecordingEvents"))
    {
LABEL_8:

      goto LABEL_9;
    }
    -[HUCameraRecordingOptionsItemManager cameraRecordingItemModule](self, "cameraRecordingItemModule");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = [HUCameraRecordingSettingsModule alloc];
      v10 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v6, "profile");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setWithObject:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[HUCameraRecordingSettingsModule initWithItemUpdater:cameraProfiles:displayStyle:](v9, "initWithItemUpdater:cameraProfiles:displayStyle:", self, v12, -[HUCameraRecordingOptionsItemManager displayStyle](self, "displayStyle"));
      -[HUCameraRecordingOptionsItemManager setCameraRecordingItemModule:](self, "setCameraRecordingItemModule:", v13);

      -[HUCameraRecordingOptionsItemManager cameraRecordingItemModule](self, "cameraRecordingItemModule");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDelegate:", self);
      goto LABEL_8;
    }
  }
LABEL_9:
  -[HUCameraRecordingOptionsItemManager cameraRecordingItemModule](self, "cameraRecordingItemModule");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "itemProviders");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HUCameraRecordingOptionsItemManager cameraRecordingItemModule](self, "cameraRecordingItemModule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buildSectionsWithDisplayedItems:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)cameraRecordingSettingsModule:(id)a3 didUpdateItem:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0C99E60];
  -[HFItemManager sourceItem](self, "sourceItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager updateResultsForItems:senderSelector:](self, "updateResultsForItems:senderSelector:", v11, a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __83__HUCameraRecordingOptionsItemManager_cameraRecordingSettingsModule_didUpdateItem___block_invoke;
  v16[3] = &unk_1E6F56188;
  v17 = v7;
  v18 = v8;
  v13 = v8;
  v14 = v7;
  v15 = (id)objc_msgSend(v12, "addCompletionBlock:", v16);

}

void __83__HUCameraRecordingOptionsItemManager_cameraRecordingSettingsModule_didUpdateItem___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138412546;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "Did update recording settings module:%@ with item:%@", (uint8_t *)&v5, 0x16u);
  }

}

- (HUCameraRecordingSettingsModule)cameraRecordingItemModule
{
  return self->_cameraRecordingItemModule;
}

- (void)setCameraRecordingItemModule:(id)a3
{
  objc_storeStrong((id *)&self->_cameraRecordingItemModule, a3);
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (void)setDisplayStyle:(unint64_t)a3
{
  self->_displayStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraRecordingItemModule, 0);
}

@end
