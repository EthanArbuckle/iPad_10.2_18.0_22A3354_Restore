@implementation HUMediaSystemEditorGridItemManager

+ (id)defaultItemProviderCreatorForMediaSystemBuilder:(id)a3 options:(unint64_t)a4
{
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  unint64_t v13;
  id v14;
  SEL v15;

  v7 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __94__HUMediaSystemEditorGridItemManager_defaultItemProviderCreatorForMediaSystemBuilder_options___block_invoke;
  v11[3] = &unk_1E6F5B6B8;
  v12 = v7;
  v13 = a4;
  v14 = a1;
  v15 = a2;
  v8 = v7;
  v9 = _Block_copy(v11);

  return v9;
}

id __94__HUMediaSystemEditorGridItemManager_defaultItemProviderCreatorForMediaSystemBuilder_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  __int128 v20;
  uint64_t v21;
  _QWORD aBlock[4];
  id v23;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v4 = MEMORY[0x1E0C809B0];
  v31 = *MEMORY[0x1E0C80C00];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__HUMediaSystemEditorGridItemManager_defaultItemProviderCreatorForMediaSystemBuilder_options___block_invoke_2;
  aBlock[3] = &unk_1E6F5B670;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v23 = v5;
  v24 = v6;
  v7 = a2;
  v8 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "firstSetupSourceAccessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "supportedStereoPairVersions");

  if (!v11)
  {
    HFLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 48);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "firstSetupSourceAccessory");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v26 = v16;
      v27 = 2112;
      v28 = v17;
      v29 = 2112;
      v30 = v18;
      _os_log_error_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_ERROR, "%@:%@ Source HomePod has no stereo pairing versions: %@", buf, 0x20u);

    }
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31510]), "initWithHome:", v7);

  v19[0] = v4;
  v19[1] = 3221225472;
  v19[2] = __94__HUMediaSystemEditorGridItemManager_defaultItemProviderCreatorForMediaSystemBuilder_options___block_invoke_17;
  v19[3] = &__block_descriptor_56_e27_B16__0___HFHomeKitObject__8l;
  v20 = *(_OWORD *)(a1 + 48);
  v21 = v11;
  objc_msgSend(v13, "setFilter:", v19);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31928]), "initWithSourceProvider:transformationBlock:", v13, v8);
  objc_msgSend(v9, "addObject:", v14);

  return v9;
}

id __94__HUMediaSystemEditorGridItemManager_defaultItemProviderCreatorForMediaSystemBuilder_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  v4 = objc_alloc((Class)objc_opt_class());
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __94__HUMediaSystemEditorGridItemManager_defaultItemProviderCreatorForMediaSystemBuilder_options___block_invoke_3;
  v10[3] = &unk_1E6F5B648;
  v11 = v3;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v12 = v5;
  v13 = v6;
  v7 = v3;
  v8 = (void *)objc_msgSend(v4, "initWithSourceItem:transformationBlock:", v7, v10);

  return v8;
}

id __94__HUMediaSystemEditorGridItemManager_defaultItemProviderCreatorForMediaSystemBuilder_options___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  objc_class *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  void *v32;
  id v33;
  void *v34;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_opt_class();
  v4 = *(id *)(a1 + 32);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "mediaProfileContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_backingAccessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "firstSetupSourceAccessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
    v10 = &unk_1E7041560;
  else
    v10 = &unk_1E7041578;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D30E20]);
  v11 = *(_QWORD *)(a1 + 48);
  if ((v11 & 1) != 0)
  {
    objc_msgSend(v3, "removeObjectForKey:", *MEMORY[0x1E0D30BF8]);
    v11 = *(_QWORD *)(a1 + 48);
  }
  if ((v11 & 8) != 0)
  {
    v12 = *MEMORY[0x1E0D30C60];
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C60]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = (objc_class *)MEMORY[0x1E0D31470];
      v15 = v13;
      v16 = [v14 alloc];
      objc_msgSend(v15, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)objc_msgSend(v16, "initWithIdentifier:incrementalState:", v17, &unk_1E70435F8);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, v12);

    }
  }
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = __94__HUMediaSystemEditorGridItemManager_defaultItemProviderCreatorForMediaSystemBuilder_options___block_invoke_9;
  v32 = &unk_1E6F51BE0;
  v19 = v3;
  v33 = v19;
  v34 = v7;
  if (__94__HUMediaSystemEditorGridItemManager_defaultItemProviderCreatorForMediaSystemBuilder_options___block_invoke_9((uint64_t)&v29))
  {
    v20 = *MEMORY[0x1E0D30EA0];
    objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0D30EA0], v29, v30, v31, v32);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v19, "objectForKeyedSubscript:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "underlyingError");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, CFSTR("BADGE_REASON_ERROR"));

    }
    objc_msgSend(v19, "setObject:forKeyedSubscript:", &unk_1E7041590, *MEMORY[0x1E0D30BB8]);
    v24 = *MEMORY[0x1E0D30BB0];
    v25 = v19;
    v26 = &unk_1E7041590;
  }
  else
  {
    v24 = *MEMORY[0x1E0D30BB8];
    v25 = v19;
    v26 = 0;
  }
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v26, v24, v29, v30, v31, v32);
  v27 = (void *)objc_msgSend(v19, "copy");

  return v27;
}

uint64_t __94__HUMediaSystemEditorGridItemManager_defaultItemProviderCreatorForMediaSystemBuilder_options___block_invoke_9(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  int v9;

  v2 = *MEMORY[0x1E0D30EA0];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D30EA0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "underlyingSymptom");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == 0;

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "hf_backingAccessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "softwareVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hf_softwareUpdateWouldSupportHomePodPairing");

    return v9 ^ 1u;
  }
  return v6;
}

BOOL __94__HUMediaSystemEditorGridItemManager_defaultItemProviderCreatorForMediaSystemBuilder_options___block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  v4 = v3;
  objc_msgSend(v4, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hf_isHomePod") & 1) == 0)
  {

    goto LABEL_7;
  }
  v6 = (void *)MEMORY[0x1E0CBA668];
  objc_msgSend(v4, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "canSupportMediaSystem:", v7);

  if (!(_DWORD)v6)
  {
LABEL_7:

LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v4, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "supportedStereoPairVersions");

  if (v9)
  {
    v10 = (*(_QWORD *)(a1 + 48) & v9) != 0;
  }
  else
  {
    HFLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accessory");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412802;
      v17 = v13;
      v18 = 2112;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      _os_log_error_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_ERROR, "%@:%@ Found HomePod has no stereo pairing versions: %@", (uint8_t *)&v16, 0x20u);

    }
    v10 = 0;
  }

LABEL_9:
  return v10;
}

- (HUMediaSystemEditorGridItemManager)initWithDelegate:(id)a3 shouldGroupByRoom:(BOOL)a4 itemProvidersCreator:(id)a5
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithMediaSystemBuilder_delegate_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUMediaSystemEditorGridItemManager.m"), 128, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUMediaSystemEditorGridItemManager initWithDelegate:shouldGroupByRoom:itemProvidersCreator:]",
    v8);

  return 0;
}

- (HUMediaSystemEditorGridItemManager)initWithMediaSystemBuilder:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HUMediaSystemEditorGridItemManager *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  +[HUMediaSystemEditorGridItemManager defaultItemProviderCreatorForMediaSystemBuilder:options:](HUMediaSystemEditorGridItemManager, "defaultItemProviderCreatorForMediaSystemBuilder:options:", v7, 9);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)HUMediaSystemEditorGridItemManager;
  v10 = -[HUServiceGridItemManager initWithDelegate:shouldGroupByRoom:itemProvidersCreator:](&v15, sel_initWithDelegate_shouldGroupByRoom_itemProvidersCreator_, v8, 1, v9);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_mediaSystemBuilder, a3);
    -[HUMediaSystemEditorGridItemManager mediaSystemBuilder](v10, "mediaSystemBuilder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessories");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "na_map:", &__block_literal_global_214);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMediaSystemEditorGridItemManager setPrioritizedRooms:](v10, "setPrioritizedRooms:", v13);

  }
  return v10;
}

uint64_t __74__HUMediaSystemEditorGridItemManager_initWithMediaSystemBuilder_delegate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_parentRoom");
}

- (id)_itemsToHideInSet:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)HUMediaSystemEditorGridItemManager;
  -[HUServiceGridItemManager _itemsToHideInSet:](&v30, sel__itemsToHideInSet_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_msgSend(v5, "mutableCopy");

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if ((objc_msgSend(v10, "conformsToProtocol:", &unk_1EF2AC2D0) & 1) == 0)
          NSLog(CFSTR("Item doesn't conform to HFAccessoryVendor: %@"), v10);
        if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EF2AC2D0))
        {
          v11 = v10;
          objc_msgSend(v11, "accessories");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "count");

          objc_msgSend(v11, "accessories");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "anyObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13 != 1)
            goto LABEL_12;
          -[HUMediaSystemEditorGridItemManager mediaSystemBuilder](self, "mediaSystemBuilder");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "accessories");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "containsObject:", v15);

          if ((v18 & 1) == 0)
          {
            -[HUMediaSystemEditorGridItemManager mediaSystemBuilder](self, "mediaSystemBuilder");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "accessories");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "anyObject");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v19, "shouldAllowAddingAccessory:", v21);

            if ((v22 & 1) == 0)
LABEL_12:
              objc_msgSend(v24, "addObject:", v11);
          }

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v7);
  }

  return v24;
}

- (id)_sortedItems:(id)a3 forSectionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  objc_super v15;
  _QWORD v16[4];
  id v17;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  -[HUMediaSystemEditorGridItemManager mediaSystemBuilder](self, "mediaSystemBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstSetupSourceAccessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v6, "count") >= 2 && v9)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __72__HUMediaSystemEditorGridItemManager__sortedItems_forSectionIdentifier___block_invoke;
    v16[3] = &unk_1E6F4DAD8;
    v17 = v9;
    objc_msgSend(v6, "na_firstObjectPassingTest:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v14.receiver = self;
      v14.super_class = (Class)HUMediaSystemEditorGridItemManager;
      -[HFItemManager _sortedItems:forSectionIdentifier:](&v14, sel__sortedItems_forSectionIdentifier_, v6, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "mutableCopy");

      objc_msgSend(v12, "removeObject:", v10);
      objc_msgSend(v12, "insertObject:atIndex:", v10, 0);
    }
    else
    {
      v15.receiver = self;
      v15.super_class = (Class)HUMediaSystemEditorGridItemManager;
      -[HFItemManager _sortedItems:forSectionIdentifier:](&v15, sel__sortedItems_forSectionIdentifier_, v6, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)HUMediaSystemEditorGridItemManager;
    -[HFItemManager _sortedItems:forSectionIdentifier:](&v18, sel__sortedItems_forSectionIdentifier_, v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

uint64_t __72__HUMediaSystemEditorGridItemManager__sortedItems_forSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF2AC2D0))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  objc_msgSend(v5, "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 32));
  return v7;
}

- (id)_roomComparator
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  objc_super v12;

  -[HUMediaSystemEditorGridItemManager prioritizedRooms](self, "prioritizedRooms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)HUMediaSystemEditorGridItemManager;
  -[HUServiceGridItemManager _roomComparator](&v12, sel__roomComparator);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__HUMediaSystemEditorGridItemManager__roomComparator__block_invoke;
  v9[3] = &unk_1E6F540B8;
  v10 = v3;
  v11 = v4;
  v5 = v4;
  v6 = v3;
  v7 = _Block_copy(v9);

  return v7;
}

uint64_t __53__HUMediaSystemEditorGridItemManager__roomComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5);
  if (v7 == objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6))
  {
    v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else if (v7)
  {
    v8 = -1;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (HFMediaSystemBuilder)mediaSystemBuilder
{
  return self->_mediaSystemBuilder;
}

- (NSSet)prioritizedRooms
{
  return self->_prioritizedRooms;
}

- (void)setPrioritizedRooms:(id)a3
{
  objc_storeStrong((id *)&self->_prioritizedRooms, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prioritizedRooms, 0);
  objc_storeStrong((id *)&self->_mediaSystemBuilder, 0);
}

@end
