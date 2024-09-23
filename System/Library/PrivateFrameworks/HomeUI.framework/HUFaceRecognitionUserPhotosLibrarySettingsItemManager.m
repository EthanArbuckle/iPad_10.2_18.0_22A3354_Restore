@implementation HUFaceRecognitionUserPhotosLibrarySettingsItemManager

- (HUFaceRecognitionUserPhotosLibrarySettingsItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  id v6;
  HUFaceRecognitionUserPhotosLibrarySettingsItemManager *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  HMHome *overrideHome;
  HUFaceRecognitionUserPhotosLibrarySettingsModule *v13;
  void *v14;
  uint64_t v15;
  HUFaceRecognitionUserPhotosLibrarySettingsModule *photosLibrarySettingsModule;
  HUFaceRecognitionUserPhotosLibrarySettingsItemManager *v17;
  NSObject *v18;
  objc_super v20;
  uint8_t buf[4];
  HUFaceRecognitionUserPhotosLibrarySettingsItemManager *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HUFaceRecognitionUserPhotosLibrarySettingsItemManager;
  v7 = -[HFItemManager initWithDelegate:sourceItem:](&v20, sel_initWithDelegate_sourceItem_, a3, v6);
  if (!v7)
    goto LABEL_7;
  objc_opt_class();
  v8 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    objc_msgSend(v10, "home");
    v11 = objc_claimAutoreleasedReturnValue();
    overrideHome = v7->_overrideHome;
    v7->_overrideHome = (HMHome *)v11;

    v13 = [HUFaceRecognitionUserPhotosLibrarySettingsModule alloc];
    objc_msgSend(v10, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HUFaceRecognitionUserPhotosLibrarySettingsModule initWithItemUpdater:home:](v13, "initWithItemUpdater:home:", v7, v14);
    photosLibrarySettingsModule = v7->_photosLibrarySettingsModule;
    v7->_photosLibrarySettingsModule = (HUFaceRecognitionUserPhotosLibrarySettingsModule *)v15;

LABEL_7:
    v17 = v7;
    goto LABEL_11;
  }
  HFLogForCategory();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v22 = v7;
    v23 = 2080;
    v24 = "-[HUFaceRecognitionUserPhotosLibrarySettingsItemManager initWithDelegate:sourceItem:]";
    v25 = 2112;
    v26 = v8;
    _os_log_error_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_ERROR, "(%@ : %s) sourceItem should be HFUserPhotosLibraryItem. sourceItem = %@", buf, 0x20u);
  }

  v17 = 0;
LABEL_11:

  return v17;
}

- (HMUser)user
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v9;
  int v10;
  HUFaceRecognitionUserPhotosLibrarySettingsItemManager *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  -[HFItemManager sourceItem](self, "sourceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "user");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[HFItemManager sourceItem](self, "sourceItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412802;
      v11 = self;
      v12 = 2080;
      v13 = "-[HUFaceRecognitionUserPhotosLibrarySettingsItemManager user]";
      v14 = 2112;
      v15 = v9;
      _os_log_error_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_ERROR, "%@ %s: sourceItem is expected to be HFUserPhotosLibraryItem, but it's %@", (uint8_t *)&v10, 0x20u);

    }
    v6 = 0;
  }

  return (HMUser *)v6;
}

- (HUFaceRecognitionUserPhotosLibrarySettingsItemManager)initWithDelegate:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_sourceItem_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUFaceRecognitionUserPhotosLibrarySettingsItemManager.m"), 60, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUFaceRecognitionUserPhotosLibrarySettingsItemManager initWithDelegate:]",
    v6);

  return 0;
}

- (id)_buildItemModulesForHome:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_opt_new();
  -[HUFaceRecognitionUserPhotosLibrarySettingsItemManager photosLibrarySettingsModule](self, "photosLibrarySettingsModule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeAddObject:", v5);

  return v4;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  -[HFItemManager sourceItem](self, "sourceItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  if (!v5)
  {
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[HFItemManager sourceItem](self, "sourceItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v18 = "-[HUFaceRecognitionUserPhotosLibrarySettingsItemManager _buildItemProvidersForHome:]";
      v19 = 2112;
      v20 = v16;
      _os_log_error_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_ERROR, "(%s) sourceItem should be HFUserPhotosLibraryItem: %@", buf, 0x16u);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31840]), "initWithResultsBlock:", &__block_literal_global_117);
  -[HUFaceRecognitionUserPhotosLibrarySettingsItemManager setAddNamesInPhotosLibraryItem:](self, "setAddNamesInPhotosLibraryItem:", v8);

  v9 = objc_alloc(MEMORY[0x1E0D31848]);
  v10 = (void *)MEMORY[0x1E0C99E60];
  -[HUFaceRecognitionUserPhotosLibrarySettingsItemManager addNamesInPhotosLibraryItem](self, "addNamesInPhotosLibraryItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithObjects:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithItems:", v12);
  -[HUFaceRecognitionUserPhotosLibrarySettingsItemManager setStaticItemProvider:](self, "setStaticItemProvider:", v13);

  -[HUFaceRecognitionUserPhotosLibrarySettingsItemManager staticItemProvider](self, "staticItemProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_safeAddObject:", v14);

  return v7;
}

id __84__HUFaceRecognitionUserPhotosLibrarySettingsItemManager__buildItemProvidersForHome___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)objc_opt_new();
  _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionAddNamesInPhotosCellTitle"), CFSTR("HUFaceRecognitionAddNamesInPhotosCellTitle"), 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v1, *MEMORY[0x1E0D30D18]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[HUFaceRecognitionUserPhotosLibrarySettingsItemManager photosLibrarySettingsModule](self, "photosLibrarySettingsModule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buildSectionsWithDisplayedItems:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeAddObjectsFromArray:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUFaceRecognitionAddNamesInPhotosLibrarySection"));
  -[HUFaceRecognitionUserPhotosLibrarySettingsItemManager addNamesInPhotosLibraryItem](self, "addNamesInPhotosLibraryItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setItems:", v10);

  objc_msgSend(v5, "na_safeAddObject:", v8);
  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v5, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_homeFuture
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  -[HUFaceRecognitionUserPhotosLibrarySettingsItemManager overrideHome](self, "overrideHome");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)setImportPhotosLibraryEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  -[HFItemManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUFaceRecognitionUserPhotosLibrarySettingsItemManager user](self, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_setImportPhotosLibraryEnabled:forUser:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)setSharePhotosLibraryEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  -[HFItemManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUFaceRecognitionUserPhotosLibrarySettingsItemManager user](self, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_setSharePhotosLibraryEnabled:forUser:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HFStaticItem)addNamesInPhotosLibraryItem
{
  return self->_addNamesInPhotosLibraryItem;
}

- (void)setAddNamesInPhotosLibraryItem:(id)a3
{
  objc_storeStrong((id *)&self->_addNamesInPhotosLibraryItem, a3);
}

- (HUFaceRecognitionUserPhotosLibrarySettingsModule)photosLibrarySettingsModule
{
  return self->_photosLibrarySettingsModule;
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_staticItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_photosLibrarySettingsModule, 0);
  objc_storeStrong((id *)&self->_addNamesInPhotosLibraryItem, 0);
}

@end
