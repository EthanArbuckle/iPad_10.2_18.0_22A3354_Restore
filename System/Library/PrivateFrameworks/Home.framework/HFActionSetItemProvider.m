@implementation HFActionSetItemProvider

- (NSMutableSet)actionSetItems
{
  return self->_actionSetItems;
}

- (id)invalidationReasons
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HFActionSetItemProvider;
  -[HFItemProvider invalidationReasons](&v5, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", CFSTR("actionSet"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

HFActionSetItem *__38__HFActionSetItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  HFActionSetItem *v5;
  uint64_t v6;
  void *v7;
  HFActionSetItem *v8;
  void *v9;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = [HFActionSetItem alloc];
  v6 = objc_msgSend(WeakRetained, "actionSetItemStyle");
  objc_msgSend(WeakRetained, "valueSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HFActionSetItem initWithActionSet:actionSetItemStyle:valueSource:](v5, "initWithActionSet:actionSetItemStyle:valueSource:", v3, v6, v7);

  objc_msgSend(WeakRetained, "serviceLikeItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFActionSetItem setServiceLikeItem:](v8, "setServiceLikeItem:", v9);

  return v8;
}

- (HFCharacteristicValueSource)valueSource
{
  void *v3;
  void *v4;
  void *v5;

  -[HFActionSetItemProvider overrideValueSource](self, "overrideValueSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HFActionSetItemProvider overrideValueSource](self, "overrideValueSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HFActionSetItemProvider home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_characteristicValueManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (HFCharacteristicValueSource *)v4;
}

- (HFServiceLikeItem)serviceLikeItem
{
  return self->_serviceLikeItem;
}

- (id)reloadItems
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  _QWORD aBlock[4];
  id v16;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__HFActionSetItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_1EA72A340;
  objc_copyWeak(&v16, &location);
  v4 = _Block_copy(aBlock);
  -[HFActionSetItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionSets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v14[1] = 3221225472;
  v14[2] = __38__HFActionSetItemProvider_reloadItems__block_invoke_2;
  v14[3] = &unk_1EA728840;
  v14[4] = self;
  objc_msgSend(v6, "na_filter:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFActionSetItemProvider filter](self, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemProvider reloadItemsWithHomeKitObjects:filter:itemMap:](self, "reloadItemsWithHomeKitObjects:filter:itemMap:", v7, v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v12[1] = 3221225472;
  v12[2] = __38__HFActionSetItemProvider_reloadItems__block_invoke_3;
  v12[3] = &unk_1EA726E30;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v9, "flatMap:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  return v10;
}

- (HMHome)home
{
  return self->_home;
}

- (HFCharacteristicValueSource)overrideValueSource
{
  return self->_overrideValueSource;
}

- (id)filter
{
  return self->_filter;
}

- (unint64_t)actionSetItemStyle
{
  return self->_actionSetItemStyle;
}

uint64_t __38__HFActionSetItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  unsigned int (**v6)(_QWORD, _QWORD);
  uint64_t (**v7)(_QWORD, _QWORD);

  v3 = a2;
  if ((objc_msgSend(v3, "hf_isAnonymous") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "actions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_roomFilter");
      v6 = (unsigned int (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      if (((unsigned int (**)(_QWORD, id))v6)[2](v6, v3))
      {
        objc_msgSend(*(id *)(a1 + 32), "_showInHomeDashboardFilter");
        v7 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v4 = ((uint64_t (**)(_QWORD, id))v7)[2](v7, v3);

      }
      else
      {
        v4 = 0;
      }

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

uint64_t __53__HFActionSetItemProvider__showInHomeDashboardFilter__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "onlyShowsFavorites"))
    v4 = objc_msgSend(v3, "hf_effectiveShowInHomeDashboard");
  else
    v4 = 1;

  return v4;
}

uint64_t __38__HFActionSetItemProvider__roomFilter__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(v3, "actions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    if (v37)
    {
      v6 = *(_QWORD *)v47;
      v34 = v4;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v47 != v6)
            objc_enumerationMutation(v5);
          v8 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v8, "characteristic");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "service");
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            v11 = *(void **)(a1 + 32);
            objc_msgSend(v10, "accessory");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "room");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "uniqueIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v11) = objc_msgSend(v11, "isEqual:", v14);

            if ((v11 & 1) != 0)
            {
              v29 = 1;
              v4 = v34;
              goto LABEL_33;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = v8;
              v42 = 0u;
              v43 = 0u;
              v44 = 0u;
              v45 = 0u;
              objc_msgSend(v15, "mediaProfiles");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
              if (v33)
              {
                v17 = *(_QWORD *)v43;
                v35 = v16;
                v36 = v5;
                v31 = v6;
                v32 = v15;
                v30 = *(_QWORD *)v43;
                do
                {
                  v18 = 0;
                  do
                  {
                    if (*(_QWORD *)v43 != v17)
                      objc_enumerationMutation(v16);
                    v19 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v18);
                    v38 = 0u;
                    v39 = 0u;
                    v40 = 0u;
                    v41 = 0u;
                    objc_msgSend(v19, "accessories", v30, v31);
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
                    if (v21)
                    {
                      v22 = v21;
                      v23 = *(_QWORD *)v39;
                      while (2)
                      {
                        for (j = 0; j != v22; ++j)
                        {
                          if (*(_QWORD *)v39 != v23)
                            objc_enumerationMutation(v20);
                          v25 = *(void **)(a1 + 32);
                          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * j), "room");
                          v26 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v26, "uniqueIdentifier");
                          v27 = (void *)objc_claimAutoreleasedReturnValue();
                          LOBYTE(v25) = objc_msgSend(v25, "isEqual:", v27);

                          if ((v25 & 1) != 0)
                          {

                            v29 = 1;
                            v4 = v34;
                            v5 = v36;
                            goto LABEL_33;
                          }
                        }
                        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
                        if (v22)
                          continue;
                        break;
                      }
                    }

                    ++v18;
                    v16 = v35;
                    v5 = v36;
                    v17 = v30;
                    v6 = v31;
                  }
                  while (v18 != v33);
                  v15 = v32;
                  v33 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
                }
                while (v33);
              }

            }
          }
        }
        v29 = 0;
        v4 = v34;
        v37 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      }
      while (v37);
    }
    else
    {
      v29 = 0;
    }
LABEL_33:

  }
  else
  {
    v29 = 1;
  }

  return v29;
}

- (BOOL)onlyShowsFavorites
{
  return self->_onlyShowsFavorites;
}

- (id)_showInHomeDashboardFilter
{
  void *v2;
  void *v3;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__HFActionSetItemProvider__showInHomeDashboardFilter__block_invoke;
  aBlock[3] = &unk_1EA72B160;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)_roomFilter
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD aBlock[4];
  id v9;

  -[HFActionSetItemProvider room](self, "room");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__HFActionSetItemProvider__roomFilter__block_invoke;
  aBlock[3] = &unk_1EA728840;
  v9 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (HMRoom)room
{
  return self->_room;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (HFActionSetItemProvider)initWithHome:(id)a3 actionSetItemStyle:(unint64_t)a4
{
  id v7;
  HFActionSetItemProvider *v8;
  HFActionSetItemProvider *v9;
  uint64_t v10;
  NSMutableSet *actionSetItems;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HFActionSetItemProvider;
  v8 = -[HFItemProvider init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    actionSetItems = v9->_actionSetItems;
    v9->_actionSetItems = (NSMutableSet *)v10;

    v9->_actionSetItemStyle = a4;
  }

  return v9;
}

- (void)setRoom:(id)a3
{
  objc_storeStrong((id *)&self->_room, a3);
}

id __38__HFActionSetItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "actionSetItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "actionSetItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HFActionSetItemProvider)initWithHome:(id)a3
{
  return -[HFActionSetItemProvider initWithHome:actionSetItemStyle:](self, "initWithHome:actionSetItemStyle:", a3, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFActionSetItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithHome:actionSetItemStyle:", v5, -[HFActionSetItemProvider actionSetItemStyle](self, "actionSetItemStyle"));

  return v6;
}

- (void)setServiceLikeItem:(id)a3
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  objc_storeStrong((id *)&self->_serviceLikeItem, a3);
  -[HFActionSetItemProvider actionSetItems](self, "actionSetItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__HFActionSetItemProvider_setServiceLikeItem___block_invoke;
  v8[3] = &unk_1EA72B110;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "na_each:", v8);

}

uint64_t __46__HFActionSetItemProvider_setServiceLikeItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setServiceLikeItem:", *(_QWORD *)(a1 + 32));
}

- (id)_favoriteFilter
{
  void *v2;
  void *v3;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__HFActionSetItemProvider__favoriteFilter__block_invoke;
  aBlock[3] = &unk_1EA72B138;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

uint64_t __42__HFActionSetItemProvider__favoriteFilter__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "onlyShowsFavorites"))
    v4 = objc_msgSend(v3, "hf_effectiveIsFavorite");
  else
    v4 = 1;

  return v4;
}

- (void)setOnlyShowsFavorites:(BOOL)a3
{
  self->_onlyShowsFavorites = a3;
}

- (void)setActionSetItems:(id)a3
{
  objc_storeStrong((id *)&self->_actionSetItems, a3);
}

- (void)setOverrideValueSource:(id)a3
{
  objc_storeStrong((id *)&self->_overrideValueSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideValueSource, 0);
  objc_storeStrong((id *)&self->_actionSetItems, 0);
  objc_storeStrong((id *)&self->_serviceLikeItem, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_room, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
