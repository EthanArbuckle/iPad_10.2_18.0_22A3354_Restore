@implementation AXSettingsSecondaryResourceDownloadController

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)AXSettingsSecondaryResourceDownloadController;
  -[AXUISettingsSetupCapableListController viewDidLoad](&v20, sel_viewDidLoad);
  objc_initWeak(&location, self);
  -[AXSettingsResourceDownloadController speechModelController](self, "speechModelController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __60__AXSettingsSecondaryResourceDownloadController_viewDidLoad__block_invoke;
  v17[3] = &unk_1E76AB188;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v3, "setDownloadProgressForVoiceIdCallback:", v17);

  -[AXSettingsResourceDownloadController speechModelController](self, "speechModelController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __60__AXSettingsSecondaryResourceDownloadController_viewDidLoad__block_invoke_2;
  v15[3] = &unk_1E76AB1B0;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v5, "setFinishedDownloadingResourceCallback:", v15);

  -[AXSettingsResourceDownloadController speechModelController](self, "speechModelController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __60__AXSettingsSecondaryResourceDownloadController_viewDidLoad__block_invoke_184;
  v13[3] = &unk_1E76AB1D8;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v6, "setFinishedDeletingResourceCallback:", v13);

  -[AXSettingsResourceDownloadController speechModelController](self, "speechModelController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __60__AXSettingsSecondaryResourceDownloadController_viewDidLoad__block_invoke_2_186;
  v11[3] = &unk_1E76AB200;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v7, "setResourceCacheDidReceiveUpdateCallback:", v11);

  -[AXSettingsResourceDownloadController speechModelController](self, "speechModelController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __60__AXSettingsSecondaryResourceDownloadController_viewDidLoad__block_invoke_3;
  v9[3] = &unk_1E76AB200;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v8, "setSelectedVoiceDidUpdateCallback:", v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __60__AXSettingsSecondaryResourceDownloadController_viewDidLoad__block_invoke(uint64_t a1, void *a2, float a3, uint64_t a4, uint64_t a5)
{
  id v8;
  id *v9;
  id WeakRetained;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  double v21;

  v8 = a2;
  v9 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "specifierForVoiceId:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  *(float *)&v12 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProperty:forKey:", v13, CFSTR("DownloadProgress"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProperty:forKey:", v14, CFSTR("RequiredDiskSpace"));

  objc_opt_class();
  v15 = objc_loadWeakRetained(v9);
  objc_msgSend(v15, "cellForSpecifier:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "updateInformation");
  v18 = objc_loadWeakRetained(v9);
  objc_msgSend(v18, "speechModelController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "resourceWithVoiceId:", v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v21 = a3;
  objc_msgSend(v18, "downloadProgressUpdate:progress:", v20, v21);

}

void __60__AXSettingsSecondaryResourceDownloadController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id *v4;
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "reloadSpecifiers");

  v7 = objc_loadWeakRetained(v4);
  objc_msgSend(v5, "voiceId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "specifierForVoiceId:", v8);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (a3)
    v9 = &unk_1E76C2168;
  else
    v9 = &unk_1E76C2180;
  objc_msgSend(v13, "setProperty:forKey:", v9, CFSTR("DownloadProgress"));
  v10 = objc_loadWeakRetained(v4);
  objc_msgSend(v10, "reloadSpecifier:", v13);

  v11 = objc_loadWeakRetained(v4);
  objc_msgSend(v11, "manageEditButton");

  v12 = objc_loadWeakRetained(v4);
  objc_msgSend(v12, "finishedDownloadingResource:", v5);

}

void __60__AXSettingsSecondaryResourceDownloadController_viewDidLoad__block_invoke_184(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "reloadSpecifiers");

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "voiceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specifierForVoiceId:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setProperty:forKey:", &unk_1E76C2168, CFSTR("DownloadProgress"));
  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "reloadSpecifier:", v10);

  v8 = objc_loadWeakRetained(v2);
  objc_msgSend(v8, "manageEditButton");

  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "finishedDeletingResource:", v3);

}

void __60__AXSettingsSecondaryResourceDownloadController_viewDidLoad__block_invoke_2_186(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateSettings");

}

void __60__AXSettingsSecondaryResourceDownloadController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reloadSpecifiers");

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXSettingsSecondaryResourceDownloadController;
  -[AXSettingsSecondaryResourceDownloadController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[AXSettingsSecondaryResourceDownloadController manageEditButton](self, "manageEditButton");
}

- (void)_editPressed:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[AXUISettingsBaseListController setEditing:animated:](self, "setEditing:animated:", 1, 1);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80598]), "visibleCells", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v9, "setShowsUsageInfo:", 1);
        objc_msgSend(v9, "updateInformation");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[AXSettingsSecondaryResourceDownloadController manageEditButton](self, "manageEditButton");
}

- (void)_donePressed
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[AXUISettingsBaseListController setEditing:animated:](self, "setEditing:animated:", 0, 1);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80598]), "visibleCells", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "setShowsUsageInfo:", 0);
        objc_msgSend(v8, "updateInformation");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[AXSettingsSecondaryResourceDownloadController manageEditButton](self, "manageEditButton");
}

- (void)manageEditButton
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  id v16;
  char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  char v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[AXSettingsSecondaryResourceDownloadController specifiers](self, "specifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v2)
  {
    v3 = v2;
    v24 = 0;
    v4 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v30 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v6, "propertyForKey:", CFSTR("Resources"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v26;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v26 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
              objc_msgSend(v12, "speechVoice");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v13, "canBeDownloaded"))
              {
                v14 = objc_msgSend(v12, "isInstalled");

                if ((v14 & 1) != 0)
                {
                  v24 = 1;
                  goto LABEL_17;
                }
              }
              else
              {

              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v9);
        }
LABEL_17:

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v3);
  }
  else
  {
    v24 = 0;
  }

  v15 = (int)*MEMORY[0x1E0D80598];
  if ((objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.super.super.isa + v15), "isEditing") & 1) != 0)
  {
    if (!objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.super.super.isa + v15), "isEditing"))return;
    if ((v24 & 1) != 0)
    {
      v16 = objc_allocWithZone(MEMORY[0x1E0DC34F0]);
      v17 = sel__donePressed;
      v18 = 0;
LABEL_27:
      v19 = (void *)objc_msgSend(v16, "initWithBarButtonSystemItem:target:action:", v18, self, v17);
      -[AXSettingsSecondaryResourceDownloadController navigationItem](self, "navigationItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setRightBarButtonItem:", v19);

      return;
    }
    -[AXSettingsSecondaryResourceDownloadController _donePressed](self, "_donePressed");
  }
  else
  {
    if ((v24 & 1) != 0)
    {
      v16 = objc_allocWithZone(MEMORY[0x1E0DC34F0]);
      v17 = sel__editPressed_;
      v18 = 2;
      goto LABEL_27;
    }
    -[AXSettingsSecondaryResourceDownloadController navigationItem](self, "navigationItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setRightBarButtonItem:", 0);

  }
}

- (id)_dialect
{
  void *v2;
  void *v3;

  -[AXSettingsSecondaryResourceDownloadController specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyForKey:", CFSTR("kAXPSDialectMapKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_footerLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  -[AXSettingsSecondaryResourceDownloadController specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyForKey:", CFSTR("Resources"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speechVoice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canBeDownloaded");

  if (v6)
  {
    if (objc_msgSend(v4, "isInstalled"))
      AXLocalizedTileForResourceOnDiskSizeUsed(v4);
    else
      AXLocalizedTileForResourceDownloadSizeRequired(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;

  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[AXSettingsSecondaryResourceDownloadController _internalSpecifiers](self, "_internalSpecifiers");
    v5 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v6 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.super.super.isa + v3) = v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)_internalSpecifiers
{
  void *v3;
  void (**v4)(void);
  id v5;
  void *v6;
  const char *v7;
  void *v8;
  AXSettingsSecondaryResourceDownloadController *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v32;
  void *v33;
  void *v34;
  id obj;
  uint64_t v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  -[AXSettingsSecondaryResourceDownloadController specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettingsSecondaryResourceDownloadController getDialectPreferencesCallback](self, "getDialectPreferencesCallback");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v4[2]();
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v34 = v3;
  objc_msgSend(v3, "propertyForKey:", CFSTR("Resources"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AXSortedVoiceVariantsForDisplay(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = self;
  -[AXSettingsSecondaryResourceDownloadController _dialect](self, "_dialect");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "languageNameAndLocaleInCurrentLocale");
  v11 = objc_claimAutoreleasedReturnValue();

  v33 = (void *)v11;
  objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, 0, 0, 0, 0, 0, 0);
  v38 = v5;
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:");
  AXSortTTSAXResourcesForSiriVoicesIfNeeded(v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v13)
  {
    v14 = v13;
    v36 = *(_QWORD *)v40;
    v15 = *MEMORY[0x1E0D80780];
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v40 != v36)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        AXLocalizedVoiceVariantNameForResource(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v18, v9, 0, 0, 0, 3, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setProperty:forKey:", v20, CFSTR("Resources"));

        objc_msgSend(v19, "setProperty:forKey:", objc_opt_class(), v15);
        objc_msgSend(v38, "addObject:", v19);
        objc_msgSend(v17, "speechVoice");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "canBeDownloaded");

        if (v22)
        {
          if ((objc_msgSend(v17, "isInstalled") & 1) != 0)
          {
            objc_msgSend(v19, "setProperty:forKey:", &unk_1E76C2180, CFSTR("DownloadProgress"));
          }
          else
          {
            -[AXSettingsResourceDownloadController downloadProgessByVoiceID](v9, "downloadProgessByVoiceID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "voiceId");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKeyedSubscript:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25)
            {
              -[AXSettingsResourceDownloadController downloadProgessByVoiceID](v9, "downloadProgessByVoiceID");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "voiceId");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "objectForKeyedSubscript:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setProperty:forKey:", v28, CFSTR("DownloadProgress"));

            }
          }
        }
        objc_msgSend(v17, "voiceId");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v37, "isEqualToString:", v29);

        if (v30)
          objc_msgSend(v19, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("IsSelected"));

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v14);
  }

  return v38;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  void *v7;
  float v8;
  float v9;
  void *v10;
  void *v11;
  id v12;

  -[AXUISettingsBaseListController specifierForIndexPath:](self, "specifierForIndexPath:", a5);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "propertyForKey:", CFSTR("DownloadProgress"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  if (a4 == 1 && v9 == 1.0)
  {
    objc_msgSend(v12, "propertyForKey:", CFSTR("Resources"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXSettingsResourceDownloadController deleteResource:](self, "deleteResource:", v11);
  }

}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[AXUISettingsBaseListController specifierForIndexPath:](self, "specifierForIndexPath:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyForKey:", CFSTR("Resources"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXSettingsResourceDownloadController speechModelController](self, "speechModelController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v8, "isResourceUserDeletable:", v7);

  return (char)v6;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  int64_t v10;

  -[AXUISettingsBaseListController specifierForIndexPath:](self, "specifierForIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", CFSTR("Resources"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "propertyForKey:", CFSTR("DownloadProgress"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  if (v9 == 1.0)
    v10 = AXResourceActivelyUsed() ^ 1;
  else
    v10 = 0;

  return v10;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  _BOOL8 v6;
  id v7;

  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "setShowsPlayButton:", 1);
    objc_msgSend(v7, "setShowsInfoLabel:", 1);
    if (AXRuntimeCheck_PerVoiceSettings())
      v6 = -[AXSettingsResourceDownloadController showPerVoiceSettings](self, "showPerVoiceSettings");
    else
      v6 = 0;
    objc_msgSend(v7, "setShowsPerVoiceSettingsButton:", v6);
    objc_msgSend(v7, "setInfoDelegate:", self);
    objc_msgSend(v7, "setShowsUsageInfo:", objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80598]), "isEditing"));
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AXSettingsSecondaryResourceDownloadController;
  v6 = a4;
  -[AXUISettingsSetupCapableListController tableView:didSelectRowAtIndexPath:](&v14, sel_tableView_didSelectRowAtIndexPath_, a3, v6);
  v7 = -[AXSettingsSecondaryResourceDownloadController indexForIndexPath:](self, "indexForIndexPath:", v6, v14.receiver, v14.super_class);

  -[AXSettingsSecondaryResourceDownloadController specifierAtIndex:](self, "specifierAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "propertyForKey:", CFSTR("Resources"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "isInstalled"))
  {
    -[AXSettingsSecondaryResourceDownloadController setDialectPreferencesCallback](self, "setDialectPreferencesCallback");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[AXSettingsSecondaryResourceDownloadController setDialectPreferencesCallback](self, "setDialectPreferencesCallback");
      v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "voiceId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v12)[2](v12, v13);

    }
    -[AXSettingsResourceDownloadController setSelectedSpecifier:](self, "setSelectedSpecifier:", v8);
  }

}

- (id)getDialectPreferencesCallback
{
  void *v2;
  void *v3;

  -[AXSettingsSecondaryResourceDownloadController specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyForKey:", CFSTR("getDialectPreferencesCallback"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)setDialectPreferencesCallback
{
  void *v2;
  void *v3;

  -[AXSettingsSecondaryResourceDownloadController specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyForKey:", CFSTR("setDialectPreferencesCallback"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  -[AXUISettingsBaseListController specifierForIndexPath:](self, "specifierForIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", CFSTR("Resources"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = AXResourceActivelyUsed() ^ 1;
  return (char)v5;
}

@end
