@implementation AXSettingsResourceDownloadController

- (AXSettingsResourceDownloadController)init
{
  AXSettingsResourceDownloadController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXSettingsResourceDownloadController;
  result = -[AXUISettingsListController init](&v3, sel_init);
  if (result)
    result->_showPerVoiceSettings = 1;
  return result;
}

- (BOOL)showPerVoiceSettings
{
  void *v3;
  void *v4;
  char showPerVoiceSettings;

  -[AXSettingsResourceDownloadController specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyForKey:", CFSTR("PVSettings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    showPerVoiceSettings = objc_msgSend(v4, "BOOLValue");
  else
    showPerVoiceSettings = self->_showPerVoiceSettings;

  return showPerVoiceSettings;
}

- (AXSpeechSettingsModelController)speechModelController
{
  AXSpeechSettingsModelController *speechModelController;
  void *v4;
  void *v5;
  objc_class *v6;
  AXSpeechSettingsModelController *v7;
  AXSpeechSettingsModelController *v8;

  speechModelController = self->_speechModelController;
  if (!speechModelController)
  {
    -[AXSettingsResourceDownloadController specifier](self, "specifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "propertyForKey:", CFSTR("speechModelController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      v6 = (objc_class *)objc_opt_class();
    else
      v6 = (objc_class *)AXSpeechSettingsModelController;
    v7 = (AXSpeechSettingsModelController *)objc_alloc_init(v6);
    v8 = self->_speechModelController;
    self->_speechModelController = v7;

    speechModelController = self->_speechModelController;
  }
  return speechModelController;
}

- (NSMutableDictionary)downloadProgessByVoiceID
{
  void *v2;
  void *v3;

  -[AXSettingsResourceDownloadController speechModelController](self, "speechModelController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "downloadProgessByVoiceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMutableDictionary *)v3;
}

- (void)restoreDownloadProgress
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[AXSettingsResourceDownloadController specifiers](self, "specifiers");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v28;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(obj);
        v21 = v3;
        v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v3);
        objc_msgSend(v22, "propertyForKey:", CFSTR("Resources"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v5)
        {
          v6 = v5;
          v7 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v6; ++i)
            {
              if (*(_QWORD *)v24 != v7)
                objc_enumerationMutation(v4);
              v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
              objc_msgSend(v9, "voiceId");
              v10 = objc_claimAutoreleasedReturnValue();
              if (v10)
              {
                v11 = (void *)v10;
                -[AXSettingsResourceDownloadController downloadProgessByVoiceID](self, "downloadProgessByVoiceID");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "voiceId");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "objectForKeyedSubscript:", v13);
                v14 = (void *)objc_claimAutoreleasedReturnValue();

                if (v14)
                {
                  -[AXSettingsResourceDownloadController downloadProgessByVoiceID](self, "downloadProgessByVoiceID");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v9, "voiceId");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "objectForKeyedSubscript:", v16);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "setProperty:forKey:", v17, CFSTR("DownloadProgress"));

                }
              }
            }
            v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v6);
        }

        v3 = v21 + 1;
      }
      while (v21 + 1 != v20);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v20);
  }
  -[AXSettingsResourceDownloadController reloadSpecifiers](self, "reloadSpecifiers");

}

- (void)startDownloadForResource:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AXSettingsResourceDownloadController speechModelController](self, "speechModelController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDownloadForResource:", v4);

}

- (void)stopDownloadForResource:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AXSettingsResourceDownloadController speechModelController](self, "speechModelController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopDownloadForResource:", v4);

}

- (void)deleteResource:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AXSettingsResourceDownloadController speechModelController](self, "speechModelController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteResource:", v4);

}

- (void)playSampleForResource:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AXSettingsResourceDownloadController speechModelController](self, "speechModelController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "playSampleForResource:completion:", v7, v6);

}

- (BOOL)allowedToDownload
{
  void *v2;
  char v3;

  -[AXSettingsResourceDownloadController speechModelController](self, "speechModelController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowedToDownload");

  return v3;
}

- (void)openVoiceSettingsFor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  AXSpeechSettingsPerVoicePreferencesController *v8;

  v4 = a3;
  v8 = objc_alloc_init(AXSpeechSettingsPerVoicePreferencesController);
  -[AXSpeechSettingsPerVoicePreferencesController setParentController:](v8, "setParentController:", self);
  -[AXSettingsResourceDownloadController speechSourceKey](self, "speechSourceKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSpeechSettingsPerVoicePreferencesController setSpeechSourceKey:](v8, "setSpeechSourceKey:", v5);

  objc_msgSend(v4, "speechVoice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSpeechSettingsPerVoicePreferencesController setVoiceIdentifier:](v8, "setVoiceIdentifier:", v7);

  -[AXUISettingsSetupCapableListController showController:animate:](self, "showController:animate:", v8, 1);
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v6 = a4;
  v7 = a3;
  -[AXSettingsResourceDownloadController specifierAtIndex:](self, "specifierAtIndex:", -[AXSettingsResourceDownloadController indexForIndexPath:](self, "indexForIndexPath:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "propertyForKey:", CFSTR("Resources"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForRowAtIndexPath:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "accessibilityActivate");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v9, "count") == 1
    && (objc_msgSend(v9, "firstObject"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isInstalled"),
        v11,
        !v12))
  {
    v13 = 0;
  }
  else
  {
    v13 = v6;
  }

  return v13;
}

- (void)setSelectedSpecifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[AXSettingsResourceDownloadController specifiers](self, "specifiers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    v9 = MEMORY[0x1E0C9AAA0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "setProperty:forKey:", v9, CFSTR("IsSelected"));
        -[AXUISettingsBaseListController cellForSpecifier:](self, "cellForSpecifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "refreshCellContentsWithSpecifier:", v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("IsSelected"));
  -[AXUISettingsBaseListController cellForSpecifier:](self, "cellForSpecifier:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "refreshCellContentsWithSpecifier:", v4);

}

- (id)specifierForVoiceId:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  int v16;
  id v17;
  id obj;
  uint64_t v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[AXSettingsResourceDownloadController specifiers](self, "specifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v5)
  {
    v6 = v5;
    v20 = *(_QWORD *)v27;
    v21 = 0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v8, "propertyForKey:", CFSTR("Resources"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v23;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v23 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "voiceId");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "isEqualToString:", v4);

              if (v16)
              {
                v17 = v8;

                v21 = v17;
                goto LABEL_16;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v12)
              continue;
            break;
          }
        }
LABEL_16:

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v6);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)updateSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  AXSettingsResourceDownloadController *v33;
  id obj;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  void *v53;
  uint8_t v54[128];
  uint8_t buf[4];
  void *v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  -[AXSettingsResourceDownloadController parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AXSettingsResourceDownloadController specifier](self, "specifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "propertyForKey:", CFSTR("Resources"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = self;
    -[AXSettingsResourceDownloadController speechModelController](self, "speechModelController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getAllResources");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = v5;
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    if (v37)
    {
      v35 = *(_QWORD *)v50;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v50 != v35)
            objc_enumerationMutation(obj);
          v38 = v7;
          v8 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v7);
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          v9 = v36;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v46;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v46 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
                objc_msgSend(v8, "voiceId");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "voiceId");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v15, "isEqualToString:", v16) & 1) != 0)
                {
                  objc_msgSend(v14, "voiceId");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "objectForKey:", v17);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v18)
                  {
                    v19 = objc_msgSend(v8, "isInstalled");
                    if (v19 != objc_msgSend(v14, "isInstalled"))
                    {
                      objc_msgSend(v14, "voiceId");
                      v20 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v40, "setObject:forKey:", v14, v20);

                    }
                    objc_msgSend(v39, "addObject:", v14);
                  }
                }
                else
                {

                }
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
            }
            while (v11);
          }

          v7 = v38 + 1;
        }
        while (v38 + 1 != v37);
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      }
      while (v37);
    }

    AXLogSpeechAssetDownload();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v40, "allValues");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v56 = v22;
      _os_log_impl(&dword_1BD892000, v21, OS_LOG_TYPE_DEFAULT, "Assets changed: using new updated voices: %{public}@", buf, 0xCu);

    }
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    objc_msgSend(v40, "allKeys");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v42 != v26)
            objc_enumerationMutation(v23);
          v28 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j);
          -[AXSettingsResourceDownloadController specifierForVoiceId:](v33, "specifierForVoiceId:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectForKeyedSubscript:", v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v30;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setProperty:forKey:", v31, CFSTR("Resources"));

          -[AXSettingsResourceDownloadController reloadSpecifier:](v33, "reloadSpecifier:", v29);
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
      }
      while (v25);
    }

    -[AXSettingsResourceDownloadController specifier](v33, "specifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setProperty:forKey:", v39, CFSTR("Resources"));

    -[AXSettingsResourceDownloadController manageEditButton](v33, "manageEditButton");
  }
}

- (id)getVoiceSettingsForVoice:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void (**v7)(_QWORD, _QWORD);
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[AXSettingsResourceDownloadController parentController](self, "parentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[AXSettingsResourceDownloadController parentController](self, "parentController");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getVoiceSettingsForVoice:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AXSettingsResourceDownloadController getPerVoiceSettingsCallack](self, "getPerVoiceSettingsCallack");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = (void *)MEMORY[0x1E0C9AA70];
      goto LABEL_7;
    }
    -[AXSettingsResourceDownloadController getPerVoiceSettingsCallack](self, "getPerVoiceSettingsCallack");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v7)[2](v7, v4);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v8;

LABEL_7:
  return v10;
}

- (void)voiceSettingsDidChangeForVoice:(id)a3 settings:(id)a4
{
  id v6;
  void *v7;
  char isKindOfClass;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[AXSettingsResourceDownloadController parentController](self, "parentController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[AXSettingsResourceDownloadController parentController](self, "parentController");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "voiceSettingsDidChangeForVoice:settings:", v11, v6);
LABEL_5:

    goto LABEL_6;
  }
  -[AXSettingsResourceDownloadController setPerVoiceSettingsCallack](self, "setPerVoiceSettingsCallack");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[AXSettingsResourceDownloadController setPerVoiceSettingsCallack](self, "setPerVoiceSettingsCallack");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v9)[2](v9, v11, v6);
    goto LABEL_5;
  }
LABEL_6:

}

- (NSString)speechSourceKey
{
  void *v3;
  char isKindOfClass;
  void *v5;
  NSString *v6;

  -[AXSettingsResourceDownloadController parentController](self, "parentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[AXSettingsResourceDownloadController parentController](self, "parentController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "speechSourceKey");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = self->_speechSourceKey;
  }
  return v6;
}

- (void)setShowPerVoiceSettings:(BOOL)a3
{
  self->_showPerVoiceSettings = a3;
}

- (id)setDialectPreferencesCallback
{
  return self->_setDialectPreferencesCallback;
}

- (void)setSetDialectPreferencesCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1416);
}

- (id)getDialectPreferencesCallback
{
  return self->_getDialectPreferencesCallback;
}

- (void)setGetDialectPreferencesCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1424);
}

- (id)getVoiceAllowedCallback
{
  return self->_getVoiceAllowedCallback;
}

- (void)setGetVoiceAllowedCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1432);
}

- (void)setSpeechSourceKey:(id)a3
{
  objc_storeStrong((id *)&self->_speechSourceKey, a3);
}

- (id)getPerVoiceSettingsCallack
{
  return self->_getPerVoiceSettingsCallack;
}

- (void)setGetPerVoiceSettingsCallack:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1448);
}

- (id)setPerVoiceSettingsCallack
{
  return self->_setPerVoiceSettingsCallack;
}

- (void)setSetPerVoiceSettingsCallack:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1456);
}

- (void)setSpeechModelController:(id)a3
{
  objc_storeStrong((id *)&self->_speechModelController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechModelController, 0);
  objc_storeStrong(&self->_setPerVoiceSettingsCallack, 0);
  objc_storeStrong(&self->_getPerVoiceSettingsCallack, 0);
  objc_storeStrong((id *)&self->_speechSourceKey, 0);
  objc_storeStrong(&self->_getVoiceAllowedCallback, 0);
  objc_storeStrong(&self->_getDialectPreferencesCallback, 0);
  objc_storeStrong(&self->_setDialectPreferencesCallback, 0);
}

@end
