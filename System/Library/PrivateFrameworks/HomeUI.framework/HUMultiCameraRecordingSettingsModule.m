@implementation HUMultiCameraRecordingSettingsModule

- (HUMultiCameraRecordingSettingsModule)initWithItemUpdater:(id)a3 cameraProfiles:(id)a4 displayStyle:(unint64_t)a5
{
  HUMultiCameraRecordingSettingsModule *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUMultiCameraRecordingSettingsModule;
  result = -[HUCameraRecordingSettingsModule initWithItemUpdater:cameraProfiles:displayStyle:](&v6, sel_initWithItemUpdater_cameraProfiles_displayStyle_, a3, a4, a5);
  if (result)
    result->_shouldShowFooterTitle = 0;
  return result;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[HUCameraRecordingSettingsModule expandableModules](self, "expandableModules", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v10), "buildSectionsWithDisplayedItems:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "na_flatMap:", &__block_literal_global_211);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v8);
  }

  if (-[HUCameraRecordingSettingsModule displayStyle](self, "displayStyle") == 3)
  {
    -[HUCameraRecordingSettingsModule recordingOptionsItem](self, "recordingOptionsItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v13);

  }
  -[HUCameraRecordingSettingsModule cameraProfiles](self, "cameraProfiles");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "anyObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "accessory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", v17);
  objc_msgSend(v18, "setItems:", v5);
  objc_msgSend(v18, "setHeaderTitle:", v17);
  if (-[HUMultiCameraRecordingSettingsModule shouldShowFooterTitle](self, "shouldShowFooterTitle"))
  {
    -[HUCameraRecordingSettingsModule _attributedFooterTitle](self, "_attributedFooterTitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAttributedFooterTitle:", v19);

  }
  v20 = (void *)MEMORY[0x1E0D314B0];
  v28 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "filterSections:toDisplayedItems:", v21, v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

uint64_t __72__HUMultiCameraRecordingSettingsModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "items");
}

- (BOOL)shouldShowFooterTitle
{
  return self->_shouldShowFooterTitle;
}

- (void)setShouldShowFooterTitle:(BOOL)a3
{
  self->_shouldShowFooterTitle = a3;
}

@end
