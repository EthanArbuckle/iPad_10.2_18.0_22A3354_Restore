@implementation HUMultiCameraRecordingOptionsItemManager

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUMultiCameraRecordingOptionsItemManager cameraRecordingItemModules](self, "cameraRecordingItemModules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMultiCameraRecordingOptionsItemManager setCameraRecordingItemModules:](self, "setCameraRecordingItemModules:", v6);

    objc_msgSend(v4, "hf_allCameraProfilesSupportingRecording");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __71__HUMultiCameraRecordingOptionsItemManager__buildItemProvidersForHome___block_invoke;
    v25[3] = &unk_1E6F5F708;
    v25[4] = self;
    objc_msgSend(v7, "na_each:", v25);

  }
  objc_opt_class();
  -[HUMultiCameraRecordingOptionsItemManager cameraRecordingItemModules](self, "cameraRecordingItemModules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v11, "setShouldShowFooterTitle:", 1);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[HUMultiCameraRecordingOptionsItemManager cameraRecordingItemModules](self, "cameraRecordingItemModules", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v17), "itemProviders");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "allObjects");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObjectsFromArray:", v19);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v15);
  }

  return v12;
}

void __71__HUMultiCameraRecordingOptionsItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HUMultiCameraRecordingSettingsModule *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  HUMultiCameraRecordingSettingsModule *v8;

  v3 = a2;
  v4 = [HUMultiCameraRecordingSettingsModule alloc];
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HUMultiCameraRecordingSettingsModule initWithItemUpdater:cameraProfiles:displayStyle:](v4, "initWithItemUpdater:cameraProfiles:displayStyle:", v5, v6, 2);
  -[HUCameraRecordingSettingsModule setDelegate:](v8, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "cameraRecordingItemModules");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a3;
  -[HUMultiCameraRecordingOptionsItemManager cameraRecordingItemModules](self, "cameraRecordingItemModules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMultiCameraRecordingOptionsItemManager cameraRecordingItemModules](self, "cameraRecordingItemModules");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __77__HUMultiCameraRecordingOptionsItemManager__buildSectionsWithDisplayedItems___block_invoke;
    v13[3] = &unk_1E6F5F730;
    v14 = v4;
    v9 = v7;
    v15 = v9;
    objc_msgSend(v8, "na_each:", v13);

    v10 = v15;
    v11 = v9;

  }
  else
  {
    v11 = (id)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

void __77__HUMultiCameraRecordingOptionsItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "buildSectionsWithDisplayedItems:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v3);

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
  v16[2] = __88__HUMultiCameraRecordingOptionsItemManager_cameraRecordingSettingsModule_didUpdateItem___block_invoke;
  v16[3] = &unk_1E6F56188;
  v17 = v7;
  v18 = v8;
  v13 = v8;
  v14 = v7;
  v15 = (id)objc_msgSend(v12, "addCompletionBlock:", v16);

}

void __88__HUMultiCameraRecordingOptionsItemManager_cameraRecordingSettingsModule_didUpdateItem___block_invoke(uint64_t a1)
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

- (NSMutableArray)cameraRecordingItemModules
{
  return self->_cameraRecordingItemModules;
}

- (void)setCameraRecordingItemModules:(id)a3
{
  objc_storeStrong((id *)&self->_cameraRecordingItemModules, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraRecordingItemModules, 0);
}

@end
