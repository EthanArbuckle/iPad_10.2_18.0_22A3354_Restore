@implementation HUServiceGroupEditorGridItemManager

- (HUServiceGroupEditorGridItemManager)initWithDelegate:(id)a3 shouldGroupByRoom:(BOOL)a4 itemProvidersCreator:(id)a5
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithServiceGroupBuilder_delegate_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUServiceGroupEditorGridItemManager.m"), 29, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUServiceGroupEditorGridItemManager initWithDelegate:shouldGroupByRoom:itemProvidersCreator:]",
    v8);

  return 0;
}

- (HUServiceGroupEditorGridItemManager)initWithServiceGroupBuilder:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HUServiceGroupEditorGridItemManager *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  +[HUSelectableServiceGridViewController defaultItemProviderCreatorWithOptions:](HUSelectableServiceGridViewController, "defaultItemProviderCreatorWithOptions:", 9);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)HUServiceGroupEditorGridItemManager;
  v10 = -[HUServiceGridItemManager initWithDelegate:shouldGroupByRoom:itemProvidersCreator:](&v17, sel_initWithDelegate_shouldGroupByRoom_itemProvidersCreator_, v8, 1, v9);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_serviceGroupBuilder, a3);
    v11 = (void *)MEMORY[0x1E0C99E60];
    -[HUServiceGroupEditorGridItemManager serviceGroupBuilder](v10, "serviceGroupBuilder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "services");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "na_map:", &__block_literal_global_106);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUServiceGroupEditorGridItemManager setPrioritizedRooms:](v10, "setPrioritizedRooms:", v15);

  }
  return v10;
}

uint64_t __76__HUServiceGroupEditorGridItemManager_initWithServiceGroupBuilder_delegate___block_invoke(uint64_t a1, void *a2)
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
  v30.super_class = (Class)HUServiceGroupEditorGridItemManager;
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
        if ((objc_msgSend(v10, "conformsToProtocol:", &unk_1EF2AC378) & 1) == 0)
          NSLog(CFSTR("Item doesn't conform to HFServiceVendor: %@"), v10);
        if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EF2AC378))
        {
          v11 = v10;
          objc_msgSend(v11, "services");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "count");

          objc_msgSend(v11, "services");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "anyObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13 != 1)
            goto LABEL_12;
          -[HUServiceGroupEditorGridItemManager serviceGroupBuilder](self, "serviceGroupBuilder");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "services");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "containsObject:", v15);

          if ((v18 & 1) == 0)
          {
            -[HUServiceGroupEditorGridItemManager serviceGroupBuilder](self, "serviceGroupBuilder");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "services");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "anyObject");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v19, "shouldAllowAddingService:", v21);

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

- (BOOL)_shouldHideServiceItem:(id)a3 containedInServiceGroupItem:(id)a4
{
  id v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HUServiceGroupEditorGridItemManager;
  v7 = -[HFItemManager _shouldHideServiceItem:containedInServiceGroupItem:](&v15, sel__shouldHideServiceItem_containedInServiceGroupItem_, v6, a4);
  v8 = (void *)MEMORY[0x1E0C99E60];
  -[HUServiceGroupEditorGridItemManager serviceGroupBuilder](self, "serviceGroupBuilder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "services");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EF2AC378))
  {
    objc_msgSend(v6, "services");
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }
  if (v7)
    v7 = objc_msgSend(v11, "intersectsSet:", v12) ^ 1;

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

  -[HUServiceGroupEditorGridItemManager prioritizedRooms](self, "prioritizedRooms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)HUServiceGroupEditorGridItemManager;
  -[HUServiceGridItemManager _roomComparator](&v12, sel__roomComparator);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__HUServiceGroupEditorGridItemManager__roomComparator__block_invoke;
  v9[3] = &unk_1E6F540B8;
  v10 = v3;
  v11 = v4;
  v5 = v4;
  v6 = v3;
  v7 = _Block_copy(v9);

  return v7;
}

uint64_t __54__HUServiceGroupEditorGridItemManager__roomComparator__block_invoke(uint64_t a1, void *a2, void *a3)
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

- (HFServiceGroupBuilder)serviceGroupBuilder
{
  return self->_serviceGroupBuilder;
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
  objc_storeStrong((id *)&self->_serviceGroupBuilder, 0);
}

@end
