@implementation HUMediaAccessoryAudioSettingsItemManager

- (HUMediaAccessoryAudioSettingsItemManager)initWithMediaSystemBuilder:(id)a3 sourceItem:(id)a4 delegate:(id)a5
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HUMediaAccessoryAudioSettingsItemManager *v14;
  void *v16;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUMediaAccessoryAudioSettingsItemManager.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("builder"));

  }
  v13 = (void *)objc_msgSend(v11, "copy");
  v17.receiver = self;
  v17.super_class = (Class)HUMediaAccessoryAudioSettingsItemManager;
  v14 = -[HFItemManager initWithDelegate:sourceItem:](&v17, sel_initWithDelegate_sourceItem_, v12, v13);

  if (v14)
    objc_storeStrong((id *)&v14->_mediaSystemBuilder, a3);

  return v14;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  id v5;
  HFItem *v6;
  HFItem *audioSettingsItem;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0D31840]);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __71__HUMediaAccessoryAudioSettingsItemManager__buildItemProvidersForHome___block_invoke;
  v18 = &unk_1E6F4C4E8;
  objc_copyWeak(&v19, &location);
  v6 = (HFItem *)objc_msgSend(v5, "initWithResultsBlock:", &v15);
  audioSettingsItem = self->_audioSettingsItem;
  self->_audioSettingsItem = v6;

  v8 = objc_alloc(MEMORY[0x1E0D31848]);
  v9 = (void *)MEMORY[0x1E0C99E60];
  -[HUMediaAccessoryAudioSettingsItemManager audioSettingsItem](self, "audioSettingsItem", v15, v16, v17, v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithItems:", v11);

  v21[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v13;
}

id __71__HUMediaAccessoryAudioSettingsItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_opt_new();
  v3 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(WeakRetained, "mediaSystemBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaSystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_setWithSafeObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(WeakRetained, "mediaSystemBuilder", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D30B80]);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUMediaAccessoryAudioSettingsItemManager audioSettingsItem](self, "audioSettingsItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if (!v6)
    return MEMORY[0x1E0C9AA60];
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("MediaAccessoryAudioSettings"));
  -[HUMediaAccessoryAudioSettingsItemManager audioSettingsItem](self, "audioSettingsItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setItems:", v9);

  _HULocalizedStringWithDefaultValue(CFSTR("HUMediaAccessoryAudioSettingsSectionFooter"), CFSTR("HUMediaAccessoryAudioSettingsSectionFooter"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFooterTitle:", v10);

  v13 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_registerForExternalUpdates
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HUMediaAccessoryAudioSettingsItemManager;
  -[HFItemManager _registerForExternalUpdates](&v2, sel__registerForExternalUpdates);
}

- (void)_unregisterForExternalUpdates
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HUMediaAccessoryAudioSettingsItemManager;
  -[HFItemManager _unregisterForExternalUpdates](&v2, sel__unregisterForExternalUpdates);
}

- (HFItem)audioSettingsItem
{
  return self->_audioSettingsItem;
}

- (HFMediaSystemBuilder)mediaSystemBuilder
{
  return self->_mediaSystemBuilder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaSystemBuilder, 0);
  objc_storeStrong((id *)&self->_audioSettingsItem, 0);
}

@end
