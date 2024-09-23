@implementation HUHomeStatusDetailsItemManager

- (NSMutableSet)representedHomeKitObjects
{
  NSMutableSet *representedHomeKitObjects;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableSet *v9;
  NSMutableSet *v10;

  representedHomeKitObjects = self->_representedHomeKitObjects;
  if (!representedHomeKitObjects)
  {
    -[HFItemManager sourceItem](self, "sourceItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "latestResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E30]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v9 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    }
    v10 = self->_representedHomeKitObjects;
    self->_representedHomeKitObjects = v9;

    representedHomeKitObjects = self->_representedHomeKitObjects;
  }
  return representedHomeKitObjects;
}

- (BOOL)shouldUseTitleDescriptionStyleForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  id v8;

  v4 = a3;
  -[HUHomeStatusDetailsItemManager residentDeviceStatusItemProvider](self, "residentDeviceStatusItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "containsObject:", v4) & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 1;
  }
  else
  {
    -[HUHomeStatusDetailsItemManager noRemoteAccessItem](self, "noRemoteAccessItem");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v8 == v4;

  }
  return v7;
}

- (BOOL)shouldShowRoomNameForItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[HUHomeStatusDetailsItemManager _sectionIdentifierForItem:](self, "_sectionIdentifierForItem:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeStatusDetailsItemManager cachedRoomNamesByIdentifier](self, "cachedRoomNamesByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4) ^ 1;

  return v7;
}

- (void)maintainMinimumPriorityForItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  HUHomeStatusDetailsItemAndPriorityTuple *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v13 = a3;
  -[HUHomeStatusDetailsItemManager minimumPriorityItemTuples](self, "minimumPriorityItemTuples");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHomeStatusDetailsItemManager setMinimumPriorityItemTuples:](self, "setMinimumPriorityItemTuples:", v5);

  }
  objc_msgSend(v13, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30CA0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v7, "integerValue");
    if (v8 >= -[HUHomeStatusDetailsItemManager _effectivePriorityForItem:](self, "_effectivePriorityForItem:", v13))
    {
      -[HUHomeStatusDetailsItemManager minimumPriorityItemTuples](self, "minimumPriorityItemTuples");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __65__HUHomeStatusDetailsItemManager_maintainMinimumPriorityForItem___block_invoke;
      v14[3] = &unk_1E6F5AA60;
      v10 = v13;
      v15 = v10;
      objc_msgSend(v9, "na_firstObjectPassingTest:", v14);
      v11 = (HUHomeStatusDetailsItemAndPriorityTuple *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[HUHomeStatusDetailsItemAndPriorityTuple setPriority:](v11, "setPriority:", objc_msgSend(v7, "integerValue"));
      }
      else
      {
        v11 = -[HUHomeStatusDetailsItemAndPriorityTuple initWithItem:priority:]([HUHomeStatusDetailsItemAndPriorityTuple alloc], "initWithItem:priority:", v10, objc_msgSend(v7, "integerValue"));
        -[HUHomeStatusDetailsItemManager minimumPriorityItemTuples](self, "minimumPriorityItemTuples");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v11);

      }
    }
  }

}

uint64_t __65__HUHomeStatusDetailsItemManager_maintainMinimumPriorityForItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)hasSymptomsHandlerForMediaProfileContainer:(id)a3
{
  id v3;
  char v4;
  int v5;
  char v6;
  void *v7;

  v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E0D31530], "isAnyKindOfGroup:", v3);
  v5 = objc_msgSend(MEMORY[0x1E0D31530], "isContainedWithinAGroup:", v3);
  if ((v4 & 1) != 0 || !v5)
  {
    objc_msgSend(v3, "accessories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "na_any:", &__block_literal_global_202);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

BOOL __77__HUHomeStatusDetailsItemManager_hasSymptomsHandlerForMediaProfileContainer___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "symptomsHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "symptoms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)resetItemPrioritiesToDefaults
{
  id v2;

  -[HUHomeStatusDetailsItemManager minimumPriorityItemTuples](self, "minimumPriorityItemTuples");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD aBlock[4];
  id v35;
  id location;
  _QWORD v37[5];

  v37[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D310B8]);
  -[HUHomeStatusDetailsItemManager statusItem](self, "statusItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "room");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (id)v7;
  else
    v9 = v4;
  v10 = (void *)objc_msgSend(v5, "initWithAccessoryContainer:inHome:", v9, v4);

  if (-[HUHomeStatusDetailsItemManager shouldShowAccessoryTiles](self, "shouldShowAccessoryTiles"))
    v11 = 0;
  else
    v11 = 4;
  objc_msgSend(v10, "setObjectLevel:", v11);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D316F0]), "initWithHome:", v4);
  -[HUHomeStatusDetailsItemManager setResidentDeviceStatusItemProvider:](self, "setResidentDeviceStatusItemProvider:", v12);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D315E0]), "initWithHome:", v4);
  -[HUHomeStatusDetailsItemManager setNoRemoteAccessItem:](self, "setNoRemoteAccessItem:", v13);

  v14 = objc_alloc(MEMORY[0x1E0D31848]);
  v15 = (void *)MEMORY[0x1E0C99E60];
  -[HUHomeStatusDetailsItemManager noRemoteAccessItem](self, "noRemoteAccessItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithObject:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v14, "initWithItems:", v17);

  objc_initWeak(&location, self);
  v19 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__HUHomeStatusDetailsItemManager__buildItemProvidersForHome___block_invoke;
  aBlock[3] = &unk_1E6F4DD60;
  objc_copyWeak(&v35, &location);
  v20 = _Block_copy(aBlock);
  v32[0] = v19;
  v32[1] = 3221225472;
  v32[2] = __61__HUHomeStatusDetailsItemManager__buildItemProvidersForHome___block_invoke_2;
  v32[3] = &unk_1E6F4DD60;
  objc_copyWeak(&v33, &location);
  v30[0] = v19;
  v30[1] = 3221225472;
  v30[2] = __61__HUHomeStatusDetailsItemManager__buildItemProvidersForHome___block_invoke_4;
  v30[3] = &unk_1E6F5AAA8;
  v21 = _Block_copy(v32);
  v31 = v21;
  objc_msgSend(v10, "setFilterBlock:", v30);
  v27[0] = v19;
  v27[1] = 3221225472;
  v27[2] = __61__HUHomeStatusDetailsItemManager__buildItemProvidersForHome___block_invoke_5;
  v27[3] = &unk_1E6F5AAD0;
  objc_copyWeak(&v29, &location);
  v22 = v20;
  v28 = v22;
  -[HUHomeStatusDetailsItemManager residentDeviceStatusItemProvider](self, "residentDeviceStatusItemProvider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFilter:", v27);

  v37[0] = v10;
  -[HUHomeStatusDetailsItemManager residentDeviceStatusItemProvider](self, "residentDeviceStatusItemProvider");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v24;
  v37[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v33);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

  return v25;
}

uint64_t __61__HUHomeStatusDetailsItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF2D9368))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "statusItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "room");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 1;
  if (v8 && v5)
  {
    objc_msgSend(v5, "hf_parentRoom");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", v10);

  }
  return v9;
}

uint64_t __61__HUHomeStatusDetailsItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  char isKindOfClass;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  _QWORD v33[4];
  id v34;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!objc_msgSend(WeakRetained, "shouldReloadItemProvidersOnSourceItemChange"))
  {
    objc_msgSend(WeakRetained, "statusItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "latestResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30B88]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v3);
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_6:
        v10 = (id)v9;
LABEL_13:
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __61__HUHomeStatusDetailsItemManager__buildItemProvidersForHome___block_invoke_3;
        v33[3] = &unk_1E6F4EE58;
        v34 = v8;
        v5 = objc_msgSend(v10, "na_any:", v33);

        goto LABEL_43;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v3, "services");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setWithArray:", v15);
        v16 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v3, "hf_visibleServices");
          v9 = objc_claimAutoreleasedReturnValue();
          goto LABEL_6;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v10 = 0;
          goto LABEL_13;
        }
        objc_msgSend(v3, "accessory");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "hf_visibleServices");
        v16 = objc_claimAutoreleasedReturnValue();
      }
      v10 = (id)v16;

      goto LABEL_13;
    }
    objc_msgSend(WeakRetained, "sourceItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(WeakRetained, "sourceItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v18 = objc_opt_isKindOfClass();

      if ((v18 & 1) == 0)
      {
        v5 = 1;
LABEL_44:

        goto LABEL_45;
      }
      v19 = v3;
      if (objc_msgSend(v19, "conformsToProtocol:", &unk_1EF32A3E0))
        v20 = v19;
      else
        v20 = 0;
      v10 = v20;

      v21 = v19;
      if (objc_msgSend(v21, "conformsToProtocol:", &unk_1EF347468))
        v22 = v21;
      else
        v22 = 0;
      v23 = v22;

      objc_opt_class();
      v24 = v21;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v25 = v24;
      else
        v25 = 0;
      v26 = v25;

      objc_msgSend(v26, "mediaProfile");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v28 = v24;
        if (objc_msgSend(v28, "conformsToProtocol:", &unk_1EF347468))
          v29 = v28;
        else
          v29 = 0;
        v30 = v29;

        v23 = v30;
      }
      if (v23)
      {
        v5 = objc_msgSend(WeakRetained, "hasSymptomsHandlerForMediaProfileContainer:", v23);
      }
      else
      {
        objc_msgSend(v10, "symptomsHandler");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v31 != 0;

      }
LABEL_43:

      goto LABEL_44;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v3;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v10 = 0;
        goto LABEL_40;
      }
      objc_msgSend(v3, "accessory");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v13;
LABEL_40:
    v5 = objc_msgSend(v10, "hf_isNetworkRouter");
    goto LABEL_43;
  }
  v5 = objc_msgSend(WeakRetained, "_shouldHideHomeKitObject:", v3) ^ 1;
LABEL_45:

  return v5;
}

uint64_t __61__HUHomeStatusDetailsItemManager__buildItemProvidersForHome___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "serviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __61__HUHomeStatusDetailsItemManager__buildItemProvidersForHome___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "hf_homeKitObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v4;
}

uint64_t __61__HUHomeStatusDetailsItemManager__buildItemProvidersForHome___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((objc_msgSend(WeakRetained, "isResidentDeviceStatusItem") & 1) != 0
    || objc_msgSend(WeakRetained, "isNoResponseStatusItem"))
  {
    v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)_numberOfSections
{
  void *v2;
  unint64_t v3;

  -[HUHomeStatusDetailsItemManager cachedSectionIdentifiers](self, "cachedSectionIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)_identifierForSection:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[HUHomeStatusDetailsItemManager cachedSectionIdentifiers](self, "cachedSectionIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") <= a3)
    NSLog(CFSTR("Received identifier request for section (%ld), but only have (%ld) sections"), a3, objc_msgSend(v4, "count"));
  if (objc_msgSend(v4, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_titleForSectionWithIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;

  v4 = a3;
  -[HUHomeStatusDetailsItemManager cachedRoomNamesByIdentifier](self, "cachedRoomNamesByIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_17;
  v6 = (void *)v5;
  -[HUHomeStatusDetailsItemManager cachedRoomNamesByIdentifier](self, "cachedRoomNamesByIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HUHomeStatusDetailsItemManager cachedRoomNamesByIdentifier](self, "cachedRoomNamesByIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_17:
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("UrgentServices")))
    {
      v11 = CFSTR("HUStatusDetailsUrgentSectionTitle");
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("GeneralServices")))
    {
      v11 = CFSTR("HUStatusDetailsGeneralSectionTitle");
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("LowBattery")))
    {
      v11 = CFSTR("HUStatusDetailsLowBatterySectionTitle");
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("SoftwareUpdateInfo")))
      {
        v10 = 0;
        goto LABEL_13;
      }
      v11 = CFSTR("HUStatusDetailsSoftwareUpdateSectionTitle");
    }
    _HULocalizedStringWithDefaultValue(v11, v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_13:

  return v10;
}

- (BOOL)_shouldUseSoftwareUpdateSectionForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[HUHomeStatusDetailsItemManager softwareUpdateItemProvider](self, "softwareUpdateItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

- (id)_separateSectionIdentifierForItem:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  __CFString *v14;

  v4 = a3;
  if (!-[HUHomeStatusDetailsItemManager _shouldUseSeparateSectionForItem:](self, "_shouldUseSeparateSectionForItem:", v4))goto LABEL_11;
  -[HUHomeStatusDetailsItemManager noRemoteAccessItem](self, "noRemoteAccessItem");
  v5 = objc_claimAutoreleasedReturnValue();
  if ((id)v5 == v4)
  {

    goto LABEL_8;
  }
  v6 = (void *)v5;
  -[HUHomeStatusDetailsItemManager residentDeviceStatusItemProvider](self, "residentDeviceStatusItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v4);

  if ((v9 & 1) != 0)
  {
LABEL_8:
    v14 = CFSTR("ResidentDevice");
    goto LABEL_12;
  }
  -[HUHomeStatusDetailsItemManager firmwareUpdateItemProvider](self, "firmwareUpdateItemProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "instructionsItem");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v4)
  {
    v14 = CFSTR("FirmwareUpdateInstructions");
    goto LABEL_12;
  }
  if (!objc_msgSend(v4, "conformsToProtocol:", &unk_1EF2544A8))
  {
    NSLog(CFSTR("Unexpected item %@"), v4);
LABEL_11:
    v14 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v4, "homeKitObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v14;
}

- (id)_roomForItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EF2544A8))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "homeKitObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EF2D9368))
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    if (v10)
    {
      objc_msgSend(v10, "hf_parentRoom");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(v7, "homeKitObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v7, "homeKitObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[HUHomeStatusDetailsItemManager isDisplayingRoomLevelStatus](self, "isDisplayingRoomLevelStatus"))
      {
        -[HUHomeStatusDetailsItemManager statusItem](self, "statusItem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "room");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v14, "services");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "hf_parentRoom");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_16;
    }
  }
  v11 = 0;
LABEL_17:

  return v11;
}

- (id)_sectionIdentifierForItem:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;

  v4 = a3;
  if (-[HUHomeStatusDetailsItemManager _shouldUseSeparateSectionForItem:](self, "_shouldUseSeparateSectionForItem:", v4))
  {
    -[HUHomeStatusDetailsItemManager _separateSectionIdentifierForItem:](self, "_separateSectionIdentifierForItem:", v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HUHomeStatusDetailsItemManager firmwareUpdateItemProvider](self, "firmwareUpdateItemProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v4);

    if ((v8 & 1) != 0)
    {
      v5 = CFSTR("FirmwareUpdateAppPunchOut");
    }
    else if (-[HUHomeStatusDetailsItemManager _shouldUseSoftwareUpdateSectionForItem:](self, "_shouldUseSoftwareUpdateSectionForItem:", v4))
    {
      v5 = CFSTR("SoftwareUpdateInfo");
    }
    else
    {
      -[HUHomeStatusDetailsItemManager _roomForItem:](self, "_roomForItem:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uniqueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUIDString");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      v13 = CFSTR("GeneralServices");
      if (v11)
        v13 = (__CFString *)v11;
      v5 = v13;

    }
  }

  return v5;
}

- (id)_itemsToHideInSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUHomeStatusDetailsItemManager;
  v4 = a3;
  -[HFItemManager _itemsToHideInSet:](&v10, sel__itemsToHideInSet_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__HUHomeStatusDetailsItemManager__itemsToHideInSet___block_invoke;
  v9[3] = &unk_1E6F4DAD8;
  v9[4] = self;
  objc_msgSend(v4, "na_filter:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "unionSet:", v7);
  return v6;
}

uint64_t __52__HUHomeStatusDetailsItemManager__itemsToHideInSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "shouldHideItem:", a2);
}

- (void)_didFinishUpdateTransactionWithAffectedItems:(id)a3
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)HUHomeStatusDetailsItemManager;
  v5 = a3;
  -[HFItemManager _didFinishUpdateTransactionWithAffectedItems:](&v23, sel__didFinishUpdateTransactionWithAffectedItems_, v5);
  -[HFItemManager sourceItem](self, "sourceItem", v23.receiver, v23.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
  {
    -[HFItemManager sourceItem](self, "sourceItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "latestResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E30]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    -[HUHomeStatusDetailsItemManager representedHomeKitObjects](self, "representedHomeKitObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqual:", v13);

    if ((v15 & 1) == 0)
    {
      if (-[HUHomeStatusDetailsItemManager shouldReloadItemProvidersOnSourceItemChange](self, "shouldReloadItemProvidersOnSourceItemChange"))
      {
        -[HUHomeStatusDetailsItemManager setRepresentedHomeKitObjects:](self, "setRepresentedHomeKitObjects:", 0);
        -[HFItemManager itemProviders](self, "itemProviders");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[HFItemManager reloadAndUpdateItemsForProviders:senderSelector:](self, "reloadAndUpdateItemsForProviders:senderSelector:", v16, a2);

      }
      else
      {
        -[HFItemManager sourceItem](self, "sourceItem");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "latestResults");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "BOOLValue");

        if ((v21 & 1) == 0)
        {
          -[HUHomeStatusDetailsItemManager representedHomeKitObjects](self, "representedHomeKitObjects");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "unionSet:", v13);

          -[HFItemManager recalculateVisibilityAndSortAllItems](self, "recalculateVisibilityAndSortAllItems");
        }
      }
    }

  }
}

- (void)_willUpdateSections
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  _QWORD aBlock[5];
  id v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__HUHomeStatusDetailsItemManager__willUpdateSections__block_invoke;
  aBlock[3] = &unk_1E6F5AAF8;
  aBlock[4] = self;
  v22 = v3;
  v23 = v4;
  v6 = v4;
  v7 = v3;
  v8 = _Block_copy(aBlock);
  -[HFItemManager itemProviders](self, "itemProviders");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v5;
  v17 = 3221225472;
  v18 = __53__HUHomeStatusDetailsItemManager__willUpdateSections__block_invoke_2;
  v19 = &unk_1E6F5AB20;
  v20 = v8;
  v10 = v8;
  objc_msgSend(v9, "na_each:", &v16);

  v11 = objc_alloc(MEMORY[0x1E0CB3928]);
  -[HUHomeStatusDetailsItemManager _sectionComparator](self, "_sectionComparator", v16, v17, v18, v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithKey:ascending:comparator:", 0, 1, v12);

  v24[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingDescriptors:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUHomeStatusDetailsItemManager setCachedRoomNamesByIdentifier:](self, "setCachedRoomNamesByIdentifier:", v6);
  -[HUHomeStatusDetailsItemManager setCachedSectionIdentifiers:](self, "setCachedSectionIdentifiers:", v15);

}

void __53__HUHomeStatusDetailsItemManager__willUpdateSections__block_invoke(id *a1, void *a2)
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v12 = a2;
  v3 = objc_msgSend(a1[4], "shouldHideItem:", v12);
  v4 = v12;
  if ((v3 & 1) == 0)
  {
    objc_msgSend(a1[4], "_sectionIdentifierForItem:", v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "addObject:", v5);
    if ((objc_msgSend(a1[4], "_shouldUseSeparateSectionForItem:", v12) & 1) == 0)
    {
      objc_msgSend(a1[4], "_roomForItem:", v12);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "uniqueIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "UUIDString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v5, "isEqualToString:", v9);

        if (v10)
        {
          objc_msgSend(v7, "name");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v11, v5);

        }
      }

    }
    v4 = v12;
  }

}

void __53__HUHomeStatusDetailsItemManager__willUpdateSections__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "items");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_each:", *(_QWORD *)(a1 + 32));

}

- (id)_sectionComparator
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (_MergedGlobals_4_5 != -1)
    dispatch_once(&_MergedGlobals_4_5, &__block_literal_global_325);
  v3 = (id)qword_1EF226BB0;
  -[HFItemManager home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_orderedRooms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_map:", &__block_literal_global_327_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D319D0], "comparatorWithSortedObjects:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __52__HUHomeStatusDetailsItemManager__sectionComparator__block_invoke_2()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];

  v2[7] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("UrgentServices");
  v2[1] = CFSTR("ResidentDevice");
  v2[2] = CFSTR("FirmwareUpdateInstructions");
  v2[3] = CFSTR("FirmwareUpdateAppPunchOut");
  v2[4] = CFSTR("SoftwareUpdateInfo");
  v2[5] = CFSTR("LowBattery");
  v2[6] = CFSTR("GeneralServices");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1EF226BB0;
  qword_1EF226BB0 = v0;

}

id __52__HUHomeStatusDetailsItemManager__sectionComparator__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_comparatorForSectionIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  objc_super v16;
  uint64_t v17;
  _QWORD v18[2];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19[0] = CFSTR("UrgentServices");
  v19[1] = CFSTR("GeneralServices");
  v19[2] = CFSTR("LowBattery");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) == 0)
  {
    v18[0] = CFSTR("FirmwareUpdateInstructions");
    v18[1] = CFSTR("FirmwareUpdateAppPunchOut");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v4);

    if (v9)
    {
      +[HUFirmwareUpdateItemProvider itemComparator](HUFirmwareUpdateItemProvider, "itemComparator");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("SoftwareUpdateInfo")))
      {
        v11 = (void *)MEMORY[0x1E0D319D0];
        v17 = objc_opt_class();
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v16.receiver = self;
        v16.super_class = (Class)HUHomeStatusDetailsItemManager;
        -[HFItemManager _comparatorForSectionIdentifier:](&v16, sel__comparatorForSectionIdentifier_, v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "comparatorWithSortedClasses:secondaryComparator:", v12, v13);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
      v15.receiver = self;
      v15.super_class = (Class)HUHomeStatusDetailsItemManager;
      -[HFItemManager _comparatorForSectionIdentifier:](&v15, sel__comparatorForSectionIdentifier_, v4);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v10;
    goto LABEL_9;
  }
  v7 = &__block_literal_global_330;
LABEL_9:

  return v7;
}

uint64_t __66__HUHomeStatusDetailsItemManager__comparatorForSectionIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(a2, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D30E70];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E70]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "localizedStandardCompare:", v9);

  return v10;
}

- (id)matchingItemForHomeKitObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    if (objc_msgSend(v7, "hf_isCamera"))
    {
      objc_msgSend(v7, "cameraProfiles");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v9)
      {
        objc_msgSend(v7, "cameraProfiles");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

        v5 = v11;
        goto LABEL_14;
      }
    }
    if (objc_msgSend(v7, "hf_isHomePod"))
    {
      objc_msgSend(v7, "home");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "hf_mediaSystemForAccessory:", v7);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v12)
        v14 = (void *)v12;
      else
        v14 = v5;
      v11 = v14;

      v5 = v13;
      goto LABEL_13;
    }
  }
LABEL_14:
  -[HFItemManager allDisplayedItems](self, "allDisplayedItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __63__HUHomeStatusDetailsItemManager_matchingItemForHomeKitObject___block_invoke;
  v19[3] = &unk_1E6F4DAD8;
  v20 = v5;
  v16 = v5;
  objc_msgSend(v15, "na_firstObjectPassingTest:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t __63__HUHomeStatusDetailsItemManager_matchingItemForHomeKitObject___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF2544A8))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "homeKitObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)shouldHideItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  BOOL v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HUHomeStatusDetailsItemManager representedHomeKitObjects](self, "representedHomeKitObjects");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "na_any:", &__block_literal_global_336);

      if (!v11 || !-[HUHomeStatusDetailsItemManager isFirmwareUpdateStatusItem](self, "isFirmwareUpdateStatusItem"))
        goto LABEL_7;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v12 = v4;
        if (objc_msgSend(v12, "conformsToProtocol:", &unk_1EF2544A8))
          v13 = v12;
        else
          v13 = 0;
        v5 = v13;

        if (v5)
        {
          objc_msgSend(v5, "homeKitObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[HUHomeStatusDetailsItemManager _shouldHideHomeKitObject:](self, "_shouldHideHomeKitObject:", v14);

          if (v15)
          {
            v9 = 1;
LABEL_19:

            goto LABEL_20;
          }
        }
        objc_msgSend(v12, "latestResults");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "BOOLValue");
        goto LABEL_17;
      }
    }
    objc_msgSend(v4, "latestResults");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "BOOLValue");
LABEL_18:

    v12 = v5;
    goto LABEL_19;
  }
  if (-[HUHomeStatusDetailsItemManager isFirmwareUpdateStatusItem](self, "isFirmwareUpdateStatusItem"))
  {
    -[HUHomeStatusDetailsItemManager firmwareUpdateItemProvider](self, "firmwareUpdateItemProvider");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "instructionsItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "latestResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D70]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

LABEL_17:
    goto LABEL_18;
  }
LABEL_7:
  v9 = 1;
LABEL_20:

  return v9;
}

uint64_t __49__HUHomeStatusDetailsItemManager_shouldHideItem___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "category");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "categoryType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB7A58]);

LABEL_5:
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "accessory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "hf_isHomePod");
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v2, "hf_isHomePod");
  else
    v5 = 0;
LABEL_6:

  return v5;
}

- (BOOL)_shouldHideHomeKitObject:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  char v24;
  id v25;
  _QWORD v27[4];
  id v28;
  id v29;
  char v30;
  _QWORD v31[5];

  v4 = a3;
  -[HUHomeStatusDetailsItemManager representedHomeKitObjects](self, "representedHomeKitObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "count");

  LOBYTE(v6) = 1;
  if (v4 && v5)
  {
    if (-[HUHomeStatusDetailsItemManager isDisplayingRoomLevelStatus](self, "isDisplayingRoomLevelStatus"))
    {
      v7 = v4;
      v8 = &unk_1EF2D9368;
      if (objc_msgSend(v7, "conformsToProtocol:", v8))
        v9 = v7;
      else
        v9 = 0;
      v10 = v9;

      if (v10)
      {
        -[HUHomeStatusDetailsItemManager statusItem](self, "statusItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "room");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "hf_parentRoom");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqual:", v13);

        if ((v14 & 1) == 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_31;
        }
      }
    }
    else
    {
      -[HUHomeStatusDetailsItemManager statusItem](self, "statusItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "latestResults");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D30CA0]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "integerValue");

      v19 = v4;
      v20 = &unk_1EF329C38;
      if (objc_msgSend(v19, "conformsToProtocol:", v20))
        v21 = v19;
      else
        v21 = 0;
      v22 = v21;

      if (objc_msgSend(v22, "hf_hasSetVisibleInHomeStatus")
        && (objc_msgSend(v22, "hf_isVisibleInHomeStatus") & 1) == 0
        && v18 < 2)
      {
        LOBYTE(v6) = 1;
LABEL_30:

        goto LABEL_31;
      }

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = v4;
      objc_msgSend(v23, "services");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __59__HUHomeStatusDetailsItemManager__shouldHideHomeKitObject___block_invoke;
      v31[3] = &unk_1E6F4EE58;
      v31[4] = self;
      LOBYTE(v6) = objc_msgSend(v22, "na_all:", v31);
LABEL_29:

      goto LABEL_30;
    }
    objc_opt_class();
    v24 = objc_opt_isKindOfClass() & 1;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_21;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = v4;
      goto LABEL_27;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
LABEL_21:
      objc_msgSend(v4, "accessory");
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v6 = 0;
        goto LABEL_28;
      }
      objc_msgSend(v4, "hf_linkedAccessory");
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_27:
    v6 = v25;
LABEL_28:
    -[HUHomeStatusDetailsItemManager representedHomeKitObjects](self, "representedHomeKitObjects");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __59__HUHomeStatusDetailsItemManager__shouldHideHomeKitObject___block_invoke_2;
    v27[3] = &unk_1E6F5ABE8;
    v30 = v24;
    v28 = v4;
    v29 = v6;
    v23 = v6;
    LODWORD(v6) = objc_msgSend(v22, "na_any:", v27) ^ 1;

    goto LABEL_29;
  }
LABEL_31:

  return (char)v6;
}

uint64_t __59__HUHomeStatusDetailsItemManager__shouldHideHomeKitObject___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shouldHideHomeKitObject:", a2);
}

uint64_t __59__HUHomeStatusDetailsItemManager__shouldHideHomeKitObject___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqual:", v3) & 1) != 0)
  {
    v4 = 1;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_10:
      v4 = 0;
      goto LABEL_13;
    }
    objc_msgSend(v3, "hf_linkedAccessory");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  if (!v5)
    goto LABEL_10;
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v5, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hf_mediaSystemForAccessory:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v4 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 40));
  }

LABEL_13:
  return v4;
}

- (int64_t)_effectivePriorityForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30CA0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUHomeStatusDetailsItemManager _minimumPriorityNumberForItem:](self, "_minimumPriorityNumberForItem:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v8 = objc_msgSend(v6, "integerValue");
    if (v7)
    {
LABEL_3:
      v9 = objc_msgSend(v7, "integerValue");
      goto LABEL_6;
    }
  }
  else
  {
    v8 = -1;
    if (v7)
      goto LABEL_3;
  }
  v9 = -1;
LABEL_6:
  if (v9 > v8)
    v8 = v9;

  return v8;
}

- (id)_minimumPriorityNumberForItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HUHomeStatusDetailsItemManager minimumPriorityItemTuples](self, "minimumPriorityItemTuples");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__HUHomeStatusDetailsItemManager__minimumPriorityNumberForItem___block_invoke;
  v10[3] = &unk_1E6F5AA60;
  v6 = v4;
  v11 = v6;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "priority"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __64__HUHomeStatusDetailsItemManager__minimumPriorityNumberForItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)statusItem
{
  void *v3;
  void *v4;
  id v5;

  objc_opt_class();
  -[HFItemManager sourceItem](self, "sourceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (BOOL)isDisplayingRoomLevelStatus
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HUHomeStatusDetailsItemManager statusItem](self, "statusItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "room");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isNoResponseStatusItem
{
  void *v2;
  char isKindOfClass;

  -[HUHomeStatusDetailsItemManager statusItem](self, "statusItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isFirmwareUpdateStatusItem
{
  void *v2;
  char isKindOfClass;

  -[HUHomeStatusDetailsItemManager statusItem](self, "statusItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isLowBatteryStatusItem
{
  void *v2;
  char isKindOfClass;

  -[HUHomeStatusDetailsItemManager statusItem](self, "statusItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isResidentDeviceStatusItem
{
  void *v2;
  char isKindOfClass;

  -[HUHomeStatusDetailsItemManager statusItem](self, "statusItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)shouldShowAccessoryTiles
{
  char isKindOfClass;
  void *v5;
  void *v6;

  if (-[HUHomeStatusDetailsItemManager isNoResponseStatusItem](self, "isNoResponseStatusItem")
    || -[HUHomeStatusDetailsItemManager isFirmwareUpdateStatusItem](self, "isFirmwareUpdateStatusItem")
    || -[HUHomeStatusDetailsItemManager isLowBatteryStatusItem](self, "isLowBatteryStatusItem"))
  {
    isKindOfClass = 1;
  }
  else
  {
    -[HFItemManager sourceItem](self, "sourceItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      isKindOfClass = 1;
    }
    else
    {
      -[HFItemManager sourceItem](self, "sourceItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

    }
  }
  return isKindOfClass & 1;
}

- (BOOL)shouldShowServiceGroupTiles
{
  if (-[HUHomeStatusDetailsItemManager isNoResponseStatusItem](self, "isNoResponseStatusItem")
    || -[HUHomeStatusDetailsItemManager isFirmwareUpdateStatusItem](self, "isFirmwareUpdateStatusItem"))
  {
    return 0;
  }
  else
  {
    return !-[HUHomeStatusDetailsItemManager isLowBatteryStatusItem](self, "isLowBatteryStatusItem");
  }
}

- (BOOL)shouldReloadItemProvidersOnSourceItemChange
{
  return -[HUHomeStatusDetailsItemManager isNoResponseStatusItem](self, "isNoResponseStatusItem")
      || -[HUHomeStatusDetailsItemManager isFirmwareUpdateStatusItem](self, "isFirmwareUpdateStatusItem")
      || -[HUHomeStatusDetailsItemManager isLowBatteryStatusItem](self, "isLowBatteryStatusItem")
      || -[HUHomeStatusDetailsItemManager isResidentDeviceStatusItem](self, "isResidentDeviceStatusItem");
}

- (HFResidentDeviceStatusDetailsItemProvider)residentDeviceStatusItemProvider
{
  return self->_residentDeviceStatusItemProvider;
}

- (void)setResidentDeviceStatusItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_residentDeviceStatusItemProvider, a3);
}

- (HUFirmwareUpdateItemProvider)firmwareUpdateItemProvider
{
  return self->_firmwareUpdateItemProvider;
}

- (void)setFirmwareUpdateItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_firmwareUpdateItemProvider, a3);
}

- (HUSoftwareUpdateInfoItemProvider)softwareUpdateItemProvider
{
  return self->_softwareUpdateItemProvider;
}

- (void)setSoftwareUpdateItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateItemProvider, a3);
}

- (HFNoRemoteAccessStatusDetailsItem)noRemoteAccessItem
{
  return self->_noRemoteAccessItem;
}

- (void)setNoRemoteAccessItem:(id)a3
{
  objc_storeStrong((id *)&self->_noRemoteAccessItem, a3);
}

- (void)setRepresentedHomeKitObjects:(id)a3
{
  objc_storeStrong((id *)&self->_representedHomeKitObjects, a3);
}

- (NSArray)cachedSectionIdentifiers
{
  return self->_cachedSectionIdentifiers;
}

- (void)setCachedSectionIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_cachedSectionIdentifiers, a3);
}

- (NSMutableDictionary)cachedRoomNamesByIdentifier
{
  return self->_cachedRoomNamesByIdentifier;
}

- (void)setCachedRoomNamesByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cachedRoomNamesByIdentifier, a3);
}

- (NSMutableSet)minimumPriorityItemTuples
{
  return self->_minimumPriorityItemTuples;
}

- (void)setMinimumPriorityItemTuples:(id)a3
{
  objc_storeStrong((id *)&self->_minimumPriorityItemTuples, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumPriorityItemTuples, 0);
  objc_storeStrong((id *)&self->_cachedRoomNamesByIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_representedHomeKitObjects, 0);
  objc_storeStrong((id *)&self->_noRemoteAccessItem, 0);
  objc_storeStrong((id *)&self->_softwareUpdateItemProvider, 0);
  objc_storeStrong((id *)&self->_firmwareUpdateItemProvider, 0);
  objc_storeStrong((id *)&self->_residentDeviceStatusItemProvider, 0);
}

@end
