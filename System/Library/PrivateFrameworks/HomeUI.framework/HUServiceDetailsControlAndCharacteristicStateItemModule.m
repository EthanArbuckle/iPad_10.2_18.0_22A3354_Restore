@implementation HUServiceDetailsControlAndCharacteristicStateItemModule

- (HUServiceDetailsControlAndCharacteristicStateItemModule)initWithItemUpdater:(id)a3 home:(id)a4 sourceItem:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HUServiceDetailsControlAndCharacteristicStateItemModule *v15;
  HUServiceDetailsControlAndCharacteristicStateItemModule *v16;
  void *v18;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUServiceDetailsControlAndCharacteristicStateItemModule.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

  }
  v19.receiver = self;
  v19.super_class = (Class)HUServiceDetailsControlAndCharacteristicStateItemModule;
  v15 = -[HUServiceDetailsItemModule initWithItemUpdater:home:sourceItem:](&v19, sel_initWithItemUpdater_home_sourceItem_, v11, v12, v13);
  v16 = v15;
  if (v15)
    -[HUServiceDetailsControlAndCharacteristicStateItemModule setDelegate:](v15, "setDelegate:", v14);

  return v16;
}

- (HUServiceDetailsControlAndCharacteristicStateItemModule)initWithItemUpdater:(id)a3 home:(id)a4 sourceItem:(id)a5
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_home_sourceItem_delegate_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUServiceDetailsControlAndCharacteristicStateItemModule.m"), 43, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUServiceDetailsControlAndCharacteristicStateItemModule initWithItemUpdater:home:sourceItem:]",
    v8);

  return 0;
}

- (BOOL)isServiceGroup
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HUServiceDetailsControlAndCharacteristicStateItemModule sourceServiceItem](self, "sourceServiceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EF2AC600))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3 != 0;

  return v4;
}

- (id)sourceServiceItem
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[HUServiceDetailsItemModule sourceItem](self, "sourceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = &unk_1EF2AC470;
  v4 = v2;
  v5 = v4;
  if (!v4)
    goto LABEL_7;
  if (objc_msgSend(v4, "conformsToProtocol:", v3))
    v6 = v5;
  else
    v6 = 0;
  v7 = v5;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol((Protocol *)v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("NSObject+NAAdditions.h"), 71, CFSTR("Expected protocol %@"), v10);

LABEL_7:
    v7 = 0;
  }

  return v7;
}

- (HFControlPanelItemProvider)controlPanelItemProvider
{
  HFControlPanelItemProvider *controlPanelItemProvider;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  HFControlPanelItemProvider *v9;
  HFControlPanelItemProvider *v10;
  HFControlPanelItemProvider *v11;
  _QWORD v12[4];
  id v13;
  id location;

  controlPanelItemProvider = self->_controlPanelItemProvider;
  if (controlPanelItemProvider)
    return controlPanelItemProvider;
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0D31338]);
  -[HUServiceDetailsControlAndCharacteristicStateItemModule sourceServiceItem](self, "sourceServiceItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceDetailsControlAndCharacteristicStateItemModule sourceServiceItem](self, "sourceServiceItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (HFControlPanelItemProvider *)objc_msgSend(v5, "initWithItem:valueSource:", v6, v8);
  v10 = self->_controlPanelItemProvider;
  self->_controlPanelItemProvider = v9;

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__HUServiceDetailsControlAndCharacteristicStateItemModule_controlPanelItemProvider__block_invoke;
  v12[3] = &unk_1E6F568A8;
  objc_copyWeak(&v13, &location);
  -[HFControlPanelItemProvider setFilter:](self->_controlPanelItemProvider, "setFilter:", v12);
  v11 = self->_controlPanelItemProvider;
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  return v11;
}

uint64_t __83__HUServiceDetailsControlAndCharacteristicStateItemModule_controlPanelItemProvider__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sourceServiceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "services");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") > 1)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(WeakRetained, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "controlAndCharacteristicStateItemModule:shouldShowControlPanelItem:", WeakRetained, v3);

  }
  return v8;
}

- (HFCharacteristicStateItemProvider)characteristicStateItemProvider
{
  HFCharacteristicStateItemProvider *characteristicStateItemProvider;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HFCharacteristicStateItemProvider *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  HFCharacteristicStateItemProvider *v18;

  characteristicStateItemProvider = self->_characteristicStateItemProvider;
  if (!characteristicStateItemProvider)
  {
    if (!-[HUServiceDetailsControlAndCharacteristicStateItemModule isServiceGroup](self, "isServiceGroup"))
    {
      -[HUServiceDetailsControlAndCharacteristicStateItemModule sourceServiceItem](self, "sourceServiceItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "services");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");

      if (v6 == 1)
      {
        v7 = objc_alloc(MEMORY[0x1E0D312C0]);
        -[HUServiceDetailsItemModule home](self, "home");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "hf_characteristicValueManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUServiceDetailsControlAndCharacteristicStateItemModule sourceServiceItem](self, "sourceServiceItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "services");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "anyObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (HFCharacteristicStateItemProvider *)objc_msgSend(v7, "initWithValueSource:service:", v9, v12);
LABEL_7:
        v18 = self->_characteristicStateItemProvider;
        self->_characteristicStateItemProvider = v13;

        goto LABEL_8;
      }
      -[HUServiceDetailsControlAndCharacteristicStateItemModule sourceServiceItem](self, "sourceServiceItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "accessories");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (v16 == 1)
      {
        v17 = objc_alloc(MEMORY[0x1E0D312C0]);
        -[HUServiceDetailsItemModule home](self, "home");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "hf_characteristicValueManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUServiceDetailsControlAndCharacteristicStateItemModule sourceServiceItem](self, "sourceServiceItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "accessories");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "anyObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (HFCharacteristicStateItemProvider *)objc_msgSend(v17, "initWithValueSource:accessory:", v9, v12);
        goto LABEL_7;
      }
    }
LABEL_8:
    characteristicStateItemProvider = self->_characteristicStateItemProvider;
  }
  return characteristicStateItemProvider;
}

- (id)itemProviders
{
  NSSet *itemProviders;
  NSSet *v3;
  void *v5;
  void *v6;
  void *v7;
  NSSet *v8;
  NSSet *v9;

  itemProviders = self->_itemProviders;
  if (itemProviders)
  {
    v3 = itemProviders;
  }
  else
  {
    v5 = (void *)objc_opt_new();
    -[HUServiceDetailsControlAndCharacteristicStateItemModule controlPanelItemProvider](self, "controlPanelItemProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeAddObject:", v6);

    -[HUServiceDetailsControlAndCharacteristicStateItemModule characteristicStateItemProvider](self, "characteristicStateItemProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeAddObject:", v7);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
    v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v9 = self->_itemProviders;
    self->_itemProviders = v8;

    v3 = self->_itemProviders;
  }
  return v3;
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
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  HUServiceDetailsControlAndCharacteristicStateItemModule *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUServiceDetailsControlAndCharacteristicStateItemModule controlPanelItemProvider](self, "controlPanelItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_setByIntersectingWithSet:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  -[HUServiceDetailsControlAndCharacteristicStateItemModule characteristicStateItemProvider](self, "characteristicStateItemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "na_setByIntersectingWithSet:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unionSet:", v11);

  objc_msgSend(v8, "objectsPassingTest:", &__block_literal_global_177);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minusSet:", v12);

  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __91__HUServiceDetailsControlAndCharacteristicStateItemModule_buildSectionsWithDisplayedItems___block_invoke_2;
  v37[3] = &unk_1E6F4DAD8;
  v31 = v4;
  v38 = v31;
  v13 = (id)objc_msgSend(v8, "na_filter:", v37);
  v14 = (void *)objc_opt_new();
  v32 = self;
  -[HUServiceDetailsControlAndCharacteristicStateItemModule _createGroupCharacteristicSectionsForItems:](self, "_createGroupCharacteristicSectionsForItems:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObjectsFromArray:", v15);
  v16 = (void *)objc_msgSend(v8, "mutableCopy");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v17 = v15;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v34;
    v21 = MEMORY[0x1E0C9AA60];
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v34 != v20)
          objc_enumerationMutation(v17);
        v23 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "items");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v24;
        if (v24)
          v26 = v24;
        else
          v26 = v21;
        objc_msgSend(v23, "setWithArray:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "minusSet:", v27);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v19);
  }

  -[HUServiceDetailsControlAndCharacteristicStateItemModule _createStandaloneCharacteristicSectionsForItems:](v32, "_createStandaloneCharacteristicSectionsForItems:", v16);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObjectsFromArray:", v28);

  v29 = (void *)objc_msgSend(v14, "copy");
  return v29;
}

BOOL __91__HUServiceDetailsControlAndCharacteristicStateItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

uint64_t __91__HUServiceDetailsControlAndCharacteristicStateItemModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (id)_createGroupCharacteristicSectionsForItems:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  id obj;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  id v50;
  _QWORD v52[4];
  id v53;
  id v54;
  HUServiceDetailsControlAndCharacteristicStateItemModule *v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t v69[128];
  uint8_t buf[4];
  const char *v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v45 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  obj = v3;
  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
  if (v46)
  {
    v44 = *(_QWORD *)v66;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v66 != v44)
          objc_enumerationMutation(obj);
        v47 = v5;
        v6 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v5);
        objc_msgSend(v6, "latestResults");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v7)
          NSLog(CFSTR("Item %@ has not been updated!"), v6);
        -[HUServiceDetailsControlAndCharacteristicStateItemModule _allCharacteristicTypesForItem:](self, "_allCharacteristicTypesForItem:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "unionSet:", v8);
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v49 = v8;
        v9 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v61, v78, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v62;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v62 != v11)
                objc_enumerationMutation(v49);
              v13 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
              -[HUServiceDetailsItemModule sourceItem](self, "sourceItem");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v14, "conformsToProtocol:", &unk_1EF2AC470))
                v15 = v14;
              else
                v15 = 0;
              v16 = v15;

              -[HUServiceDetailsItemModule home](self, "home");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "homeKitObject");
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v18, "uniqueIdentifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "hf_serviceWithIdentifier:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v20, "accessory");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v19) = objc_msgSend(v21, "supportsCHIP");

              if (!(_DWORD)v19)
              {
                objc_msgSend(v4, "objectForKeyedSubscript:", v13);
                v26 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v26)
                  goto LABEL_25;
                objc_msgSend(MEMORY[0x1E0CBA458], "hf_descriptionForCharacteristicType:", v13);
                v24 = objc_claimAutoreleasedReturnValue();
                NSLog(CFSTR("Duplicate items for characteristic type %@!"), v24);
                goto LABEL_24;
              }
              HFLogForCategory();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v71 = "-[HUServiceDetailsControlAndCharacteristicStateItemModule _createGroupCharacteristicSectionsForItems:]";
                v72 = 2112;
                v73 = v13;
                _os_log_impl(&dword_1B8E1E000, v22, OS_LOG_TYPE_DEFAULT, "%s: Skipping assertion for matter accessory duplicate characteristic type: %@", buf, 0x16u);
              }

              objc_msgSend(v4, "objectForKeyedSubscript:", v13);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              if (v23)
              {
                HFLogForCategory();
                v24 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v4, "objectForKeyedSubscript:", v13);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136315906;
                  v71 = "-[HUServiceDetailsControlAndCharacteristicStateItemModule _createGroupCharacteristicSectionsForItems:]";
                  v72 = 2112;
                  v73 = v13;
                  v74 = 2112;
                  v75 = v6;
                  v76 = 2112;
                  v77 = v25;
                  _os_log_error_impl(&dword_1B8E1E000, v24, OS_LOG_TYPE_ERROR, "%s: Duplicate characteristic found. Characteristic type: %@, current item: %@, existingItem: %@", buf, 0x2Au);

                }
LABEL_24:

              }
LABEL_25:
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v13);

            }
            v10 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v61, v78, 16);
          }
          while (v10);
        }

        v5 = v47 + 1;
      }
      while (v47 + 1 != v46);
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
    }
    while (v46);
  }

  v50 = (id)objc_opt_new();
  v48 = (void *)objc_opt_new();
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v27 = v45;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v58 != v30)
          objc_enumerationMutation(v27);
        v32 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0D312B8], "characteristicGroupForCharacteristicType:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v33)
        {
          objc_msgSend(v50, "addObject:", v33);
          objc_msgSend(v33, "identifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "na_objectForKey:withDefaultValue:", v34, &__block_literal_global_108_1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "addObject:", v32);

        }
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
    }
    while (v29);
  }
  v36 = v27;

  -[HUServiceDetailsControlAndCharacteristicStateItemModule _characteristicStateItemComparator](self, "_characteristicStateItemComparator");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __102__HUServiceDetailsControlAndCharacteristicStateItemModule__createGroupCharacteristicSectionsForItems___block_invoke_2;
  v52[3] = &unk_1E6F59398;
  v53 = v48;
  v54 = v4;
  v55 = self;
  v56 = v37;
  v38 = v37;
  v39 = v4;
  v40 = v48;
  objc_msgSend(v50, "na_map:", v52);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

id __102__HUServiceDetailsControlAndCharacteristicStateItemModule__createGroupCharacteristicSectionsForItems___block_invoke()
{
  return (id)objc_opt_new();
}

id __102__HUServiceDetailsControlAndCharacteristicStateItemModule__createGroupCharacteristicSectionsForItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  _QWORD v27[4];
  id v28;
  const __CFString *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("CharacteristicGroup-"), "stringByAppendingString:", v4);
  v5 = objc_claimAutoreleasedReturnValue();

  v26 = (void *)v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", v5);
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v3, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __102__HUServiceDetailsControlAndCharacteristicStateItemModule__createGroupCharacteristicSectionsForItems___block_invoke_3;
  v27[3] = &unk_1E6F59350;
  v28 = *(id *)(a1 + 40);
  objc_msgSend(v9, "na_map:", v27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortedArrayUsingComparator:", *(_QWORD *)(a1 + 56));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v12);

  objc_msgSend(v10, "na_filter:", &__block_literal_global_111_0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v13, "count") >= 2)
    NSLog(CFSTR("Multiple control panel items in group %@!"), v3);
  objc_msgSend(v13, "anyObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 48), "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(void **)(a1 + 48);
    objc_msgSend(v16, "sourceItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "controlAndCharacteristicStateItemModule:sectionTitleForControlPanelItem:forServiceItem:", v16, v14, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(void **)(a1 + 48);
    objc_msgSend(v20, "sourceItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "controlAndCharacteristicStateItemModule:sectionFooterForControlPanelItem:forServiceItem:", v20, v14, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v10, "count") == 1)
    {
      v18 = 0;
    }
    else
    {
      objc_msgSend(v3, "title");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v22 = 0;
  }
  objc_msgSend(v6, "setHeaderTitle:", v18);
  objc_msgSend(v6, "setFooterTitle:", v22);
  v29 = CFSTR("HUServiceDetailsItemModuleTitleForSectionSortingUserInfoKey");
  objc_msgSend(v3, "title");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInfo:", v24);

  return v6;
}

uint64_t __102__HUServiceDetailsControlAndCharacteristicStateItemModule__createGroupCharacteristicSectionsForItems___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
}

uint64_t __102__HUServiceDetailsControlAndCharacteristicStateItemModule__createGroupCharacteristicSectionsForItems___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_createStandaloneCharacteristicSectionsForItems:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __107__HUServiceDetailsControlAndCharacteristicStateItemModule__createStandaloneCharacteristicSectionsForItems___block_invoke;
  v6[3] = &unk_1E6F593E0;
  v6[4] = self;
  objc_msgSend(a3, "na_map:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __107__HUServiceDetailsControlAndCharacteristicStateItemModule__createStandaloneCharacteristicSectionsForItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
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
  id v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    NSLog(CFSTR("Item %@ has not been updated!"), v3);
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_allCharacteristicTypesForItem:", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "allObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_120_1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsJoinedByString:", CFSTR("_"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(CFSTR("CharacteristicItem-"), "stringByAppendingString:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      goto LABEL_8;
    }
    NSLog(CFSTR("No characteristic types for item %@!"), v3);

LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  v5 = v3;
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("ControlPanel-"), "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "controlAndCharacteristicStateItemModule:shouldShowSectionTitleForControlPanelItem:", *(_QWORD *)(a1 + 32), v5);

  if (!v9)
  {
    v11 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v5, "latestResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

LABEL_10:
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", v7);
  objc_msgSend(v14, "setHeaderTitle:", v11);
  v19 = CFSTR("HUServiceDetailsItemModuleTitleForSectionSortingUserInfoKey");
  v20[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setUserInfo:", v15);

  v18 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setItems:", v16);

LABEL_13:
  return v14;
}

uint64_t __107__HUServiceDetailsControlAndCharacteristicStateItemModule__createStandaloneCharacteristicSectionsForItems___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = (void *)MEMORY[0x1E0CBA458];
  v6 = a3;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "hf_sortPriorityForCharacteristicType:", a2));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = objc_msgSend(MEMORY[0x1E0CBA458], "hf_sortPriorityForCharacteristicType:", v6);

  objc_msgSend(v8, "numberWithInteger:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "compare:", v10);

  return v11;
}

- (id)_allCharacteristicTypesForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30B50]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  -[HUServiceDetailsControlAndCharacteristicStateItemModule delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "controlAndCharacteristicStateItemModule:childItemsForItem:", self, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "na_flatMap:", &__block_literal_global_129);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setByAddingObjectsFromSet:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __90__HUServiceDetailsControlAndCharacteristicStateItemModule__allCharacteristicTypesForItem___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D30B50]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_characteristicStateItemComparator
{
  id v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__HUServiceDetailsControlAndCharacteristicStateItemModule__characteristicStateItemComparator__block_invoke;
  aBlock[3] = &unk_1E6F59448;
  aBlock[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __93__HUServiceDetailsControlAndCharacteristicStateItemModule__characteristicStateItemComparator__block_invoke_2;
  v5[3] = &unk_1E6F59470;
  v6 = _Block_copy(aBlock);
  v2 = v6;
  v3 = _Block_copy(v5);

  return v3;
}

uint64_t __93__HUServiceDetailsControlAndCharacteristicStateItemModule__characteristicStateItemComparator__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_allCharacteristicTypesForItem:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = -1000;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v8 = objc_msgSend(MEMORY[0x1E0CBA458], "hf_sortPriorityForCharacteristicType:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
        if (v6 <= v8)
          v6 = v8;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v6 = -1000;
  }

  return v6;
}

uint64_t __93__HUServiceDetailsControlAndCharacteristicStateItemModule__characteristicStateItemComparator__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v7 == v8)
  {
    objc_msgSend(v5, "latestResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0D30D18];
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "latestResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v11, "localizedStandardCompare:", v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "compare:", v13);
  }
  v15 = v14;

  return v15;
}

- (HUServiceDetailsControlAndCharacteristicStateItemModuleDelegate)delegate
{
  return (HUServiceDetailsControlAndCharacteristicStateItemModuleDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_itemProviders, 0);
  objc_storeStrong((id *)&self->_controlPanelItemProvider, 0);
  objc_storeStrong((id *)&self->_characteristicStateItemProvider, 0);
}

@end
