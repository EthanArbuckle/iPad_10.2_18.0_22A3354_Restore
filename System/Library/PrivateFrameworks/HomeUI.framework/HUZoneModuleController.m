@implementation HUZoneModuleController

- (HUZoneModuleController)initWithModule:(id)a3 room:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HUZoneModuleController *v14;
  HUZoneModuleController *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  v9 = v6;
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v9;
    if (v10)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v8, objc_opt_class());

  }
  v11 = 0;
LABEL_8:

  v17.receiver = self;
  v17.super_class = (Class)HUZoneModuleController;
  v14 = -[HUItemModuleController initWithModule:](&v17, sel_initWithModule_, v9);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_room, a4);

  return v15;
}

- (Class)collectionCellClassForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createNewZoneItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "isEqual:", v6);

  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[HUItemModuleController module](self, "module");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createNewZoneItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[HUZoneModuleController _configureCreateNewZoneItem:forCell:](self, "_configureCreateNewZoneItem:forCell:", v6, v12);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "sourceItem");
      v9 = objc_claimAutoreleasedReturnValue();

      -[HUItemModuleController module](self, "module");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "currentZoneItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 == (void *)v9)
        -[HUZoneModuleController _configureCurrentZonesItem:forCell:](self, "_configureCurrentZonesItem:forCell:", v9, v12);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[HUZoneModuleController _configureZoneBuilderItem:forCell:](self, "_configureZoneBuilderItem:forCell:", v9, v12);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[HUZoneModuleController _configureZoneItem:forCell:](self, "_configureZoneItem:forCell:", v9, v12);
      }
      v6 = (id)v9;
    }
  }

}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "sourceItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUItemModuleController module](self, "module");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentZoneItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v7)
    {
      -[HUItemModuleController module](self, "module");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "toggleExpansion");
    }
    else
    {
      objc_opt_class();
      v8 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
      v10 = v9;

      if (v10)
        v11 = -[HUZoneModuleController _didSelectZoneItem:](self, "_didSelectZoneItem:", v8);
      objc_opt_class();
      v12 = v8;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
      v14 = v13;

      if (v14)
        v15 = -[HUZoneModuleController _didSelectZoneBuilderItem:](self, "_didSelectZoneBuilderItem:", v12);

    }
  }
  else
  {
    v5 = v4;
  }

  return 0;
}

- (id)_didSelectZoneItem:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[6];

  objc_msgSend(a3, "zone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0D31A00]);
  -[HUZoneModuleController room](self, "room");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithExistingObject:inHome:", v5, v8);

  objc_msgSend(v5, "rooms");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUZoneModuleController room](self, "room");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "containsObject:", v11);

  -[HUZoneModuleController room](self, "room");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v9, "removeRoom:", v13);
  else
    objc_msgSend(v9, "addRoom:", v13);

  objc_msgSend(v9, "commitItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __45__HUZoneModuleController__didSelectZoneItem___block_invoke;
  v17[3] = &unk_1E6F501F0;
  v17[4] = self;
  v17[5] = a2;
  objc_msgSend(v14, "addCompletionBlock:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __45__HUZoneModuleController__didSelectZoneItem___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleError:", v11);
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0D314C0];
    objc_msgSend(*(id *)(a1 + 32), "module");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemProviders");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestToReloadItemProviders:senderSelector:", v7, *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "module");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemUpdater");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "performItemUpdateRequest:", v4);

  }
}

- (id)_didSelectZoneBuilderItem:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];

  objc_msgSend(a3, "zoneBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUZoneModuleController room](self, "room");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addRoom:", v6);

  objc_msgSend(v5, "commitItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__HUZoneModuleController__didSelectZoneBuilderItem___block_invoke;
  v10[3] = &unk_1E6F501F0;
  v10[4] = self;
  v10[5] = a2;
  objc_msgSend(v7, "addCompletionBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __52__HUZoneModuleController__didSelectZoneBuilderItem___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleError:", v11);
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0D314C0];
    objc_msgSend(*(id *)(a1 + 32), "module");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemProviders");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestToReloadItemProviders:senderSelector:", v7, *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "module");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemUpdater");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "performItemUpdateRequest:", v4);

  }
}

- (void)_updateCreateNewZoneCellText:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
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
  id v21;

  v3 = a3;
  -[HUZoneModuleController createNewZoneCell](self, "createNewZoneCell");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createNewZoneItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA718], "cellConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "textField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEditing");

  if (!v9 || v3)
  {
    objc_msgSend(v6, "latestResults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v14);

    objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setColor:", v15);

    objc_msgSend(v21, "textField");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPlaceholder:", &stru_1E6F60E80);

    objc_msgSend(v21, "textField");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", &stru_1E6F60E80);

    objc_msgSend(v21, "setContentConfiguration:", v7);
    if (v3)
    {
      objc_msgSend(v21, "textField");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setText:", &stru_1E6F60E80);

      objc_msgSend(v21, "textField");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "resignFirstResponder");

    }
  }
  else
  {
    objc_msgSend(v7, "setText:", 0);
    objc_msgSend(v21, "setContentConfiguration:", v7);
    objc_msgSend(v6, "latestResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D28]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "textField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPlaceholder:", v11);

  }
}

- (void)_configureCreateNewZoneItem:(id)a3 forCell:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[HUZoneModuleController setCreateNewZoneCell:](self, "setCreateNewZoneCell:", v5);
  -[HUZoneModuleController _updateCreateNewZoneCellText:](self, "_updateCreateNewZoneCellText:", 0);
  objc_msgSend(v5, "textField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAutocapitalizationType:", 1);

  objc_msgSend(v5, "textField");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setDelegate:", self);
}

- (void)_configureZoneItem:(id)a3 forCell:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  +[HUListContentConfigurationUtilities labelDefaultConfigurationForItem:](HUListContentConfigurationUtilities, "labelDefaultConfigurationForItem:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentConfiguration:", v8);
  objc_msgSend(v7, "zone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "rooms");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUZoneModuleController room](self, "room");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "containsObject:", v11);

  if ((v12 & 1) != 0)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0CEA3D8]);
    v15[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessories:", v14);

  }
  else
  {
    objc_msgSend(v6, "setAccessories:", MEMORY[0x1E0C9AA60]);
  }

}

- (void)_configureZoneBuilderItem:(id)a3 forCell:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (void *)MEMORY[0x1E0CEA718];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "valueCellConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUListContentConfigurationUtilities labelConfiguration:forItem:](HUListContentConfigurationUtilities, "labelConfiguration:forItem:", v8, v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setColor:", v9);

  objc_msgSend(v6, "setContentConfiguration:", v11);
  objc_msgSend(v6, "setAccessories:", MEMORY[0x1E0C9AA60]);

}

- (void)_configureCurrentZonesItem:(id)a3 forCell:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  -[HUZoneModuleController setCurrentZoneItemCell:](self, "setCurrentZoneItemCell:", v6);
  objc_msgSend(MEMORY[0x1E0CEA718], "valueCellConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUListContentConfigurationUtilities labelConfiguration:forItem:](HUListContentConfigurationUtilities, "labelConfiguration:forItem:", v8, v7);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[HUZoneModuleController room](self, "room");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hf_allZones");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
    objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "secondaryTextProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setColor:", v11);

  objc_msgSend(v6, "setContentConfiguration:", v13);
  objc_msgSend(v6, "setAccessories:", MEMORY[0x1E0C9AA60]);

}

- (BOOL)_validateNewZoneName:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0D319D0], "sanitizeUserEnteredHomeKitName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (id)_createNewZoneWithName:(id)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v34;
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  uint8_t v44[128];
  uint8_t buf[4];
  HUZoneModuleController *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D319D0], "sanitizeUserEnteredHomeKitName:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HUZoneModuleController hasPendingCreation](self, "hasPendingCreation"))
  {
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v46 = self;
      v47 = 2112;
      v48 = v7;
      v49 = 2112;
      v50 = v5;
      _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Pending creation for zone with name %@, skipping this one", buf, 0x20u);

    }
    goto LABEL_15;
  }
  if (!-[HUZoneModuleController _validateNewZoneName:](self, "_validateNewZoneName:", v5))
  {
LABEL_15:
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  -[HUItemModuleController module](self, "module");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  -[HUItemModuleController module](self, "module");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemProviders");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __49__HUZoneModuleController__createNewZoneWithName___block_invoke;
  v42[3] = &unk_1E6F50278;
  v11 = v8;
  v43 = v11;
  objc_msgSend(v10, "na_each:", v42);

  v40 = 0u;
  v41 = 0u;
  v39 = 0u;
  v38 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v39;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v39 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v17, "zone", v34);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", v5);

        if ((v20 & 1) != 0)
        {
          -[HUZoneModuleController _didSelectZoneItem:](self, "_didSelectZoneItem:", v17);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v37[0] = MEMORY[0x1E0C809B0];
          v37[1] = 3221225472;
          v37[2] = __49__HUZoneModuleController__createNewZoneWithName___block_invoke_4;
          v37[3] = &unk_1E6F502A0;
          v37[4] = self;
          v32 = (id)objc_msgSend(v31, "addSuccessBlock:", v37);

          objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v12;
          v22 = v34;
          goto LABEL_17;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      if (v14)
        continue;
      break;
    }
  }

  v21 = objc_alloc(MEMORY[0x1E0D31A00]);
  v22 = v34;
  objc_msgSend(v34, "room");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "home");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v21, "initWithHome:", v24);

  objc_msgSend(v25, "setName:", v5);
  objc_msgSend(v34, "room");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addRoom:", v26);

  -[HUZoneModuleController setHasPendingCreation:](self, "setHasPendingCreation:", 1);
  objc_msgSend(v25, "commitItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __49__HUZoneModuleController__createNewZoneWithName___block_invoke_5;
  v36[3] = &unk_1E6F502C8;
  v36[4] = self;
  objc_msgSend(v27, "addSuccessBlock:", v36);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v28;
  v35[1] = 3221225472;
  v35[2] = __49__HUZoneModuleController__createNewZoneWithName___block_invoke_6;
  v35[3] = &unk_1E6F4E2D8;
  v35[4] = self;
  objc_msgSend(v29, "addFailureBlock:", v35);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
LABEL_18:

  return v30;
}

void __49__HUZoneModuleController__createNewZoneWithName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_filter:", &__block_literal_global_52);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v6, "na_map:", &__block_literal_global_20_1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionSet:", v5);

}

uint64_t __49__HUZoneModuleController__createNewZoneWithName___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "sourceItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __49__HUZoneModuleController__createNewZoneWithName___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sourceItem");
}

uint64_t __49__HUZoneModuleController__createNewZoneWithName___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCreateNewZoneCellText:", 1);
}

uint64_t __49__HUZoneModuleController__createNewZoneWithName___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "module");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createNewZoneItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateCellForItems:", v5);

  return objc_msgSend(*(id *)(a1 + 32), "setHasPendingCreation:", 0);
}

uint64_t __49__HUZoneModuleController__createNewZoneWithName___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D313A0];
  v4 = a2;
  objc_msgSend(v3, "sharedHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleError:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "setHasPendingCreation:", 0);
}

- (id)finishZoneNameEditing
{
  void *v3;
  void *v4;
  void *v5;

  -[HUZoneModuleController editingTextField](self, "editingTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUZoneModuleController _createNewZoneWithName:](self, "_createNewZoneWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  -[HUZoneModuleController setEditingTextField:](self, "setEditingTextField:", a3);
  -[HUZoneModuleController _updateCreateNewZoneCellText:](self, "_updateCreateNewZoneCellText:", 0);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HUZoneModuleController _createNewZoneWithName:](self, "_createNewZoneWithName:", v5);

  objc_msgSend(v4, "resignFirstResponder");
  return 1;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    objc_msgSend(v4, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HUZoneModuleController _validateNewZoneName:](self, "_validateNewZoneName:", v7);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)textFieldDidEndEditing:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
}

- (HMRoom)room
{
  return self->_room;
}

- (void)setRoom:(id)a3
{
  objc_storeStrong((id *)&self->_room, a3);
}

- (UICollectionViewListCell)currentZoneItemCell
{
  return (UICollectionViewListCell *)objc_loadWeakRetained((id *)&self->_currentZoneItemCell);
}

- (void)setCurrentZoneItemCell:(id)a3
{
  objc_storeWeak((id *)&self->_currentZoneItemCell, a3);
}

- (HUEditableTextCollectionListCell)createNewZoneCell
{
  return (HUEditableTextCollectionListCell *)objc_loadWeakRetained((id *)&self->_createNewZoneCell);
}

- (void)setCreateNewZoneCell:(id)a3
{
  objc_storeWeak((id *)&self->_createNewZoneCell, a3);
}

- (UITextField)editingTextField
{
  return (UITextField *)objc_loadWeakRetained((id *)&self->_editingTextField);
}

- (void)setEditingTextField:(id)a3
{
  objc_storeWeak((id *)&self->_editingTextField, a3);
}

- (BOOL)hasPendingCreation
{
  return self->_hasPendingCreation;
}

- (void)setHasPendingCreation:(BOOL)a3
{
  self->_hasPendingCreation = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_editingTextField);
  objc_destroyWeak((id *)&self->_createNewZoneCell);
  objc_destroyWeak((id *)&self->_currentZoneItemCell);
  objc_storeStrong((id *)&self->_room, 0);
}

@end
