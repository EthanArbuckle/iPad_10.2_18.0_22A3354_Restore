@implementation HUPresenceUserPickerItemModule

+ (NSString)sectionID
{
  if (_MergedGlobals_4 != -1)
    dispatch_once(&_MergedGlobals_4, &__block_literal_global_2_0);
  return (NSString *)(id)qword_1EF2269E0;
}

void __43__HUPresenceUserPickerItemModule_sectionID__block_invoke_2()
{
  void *v0;

  v0 = (void *)qword_1EF2269E0;
  qword_1EF2269E0 = (uint64_t)CFSTR("userList");

}

- (HUPresenceUserPickerItemModule)initWithItemUpdater:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_home_presenceEvent_options_delegate_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPresenceUserPickerItemModule.m"), 60, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUPresenceUserPickerItemModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (HUPresenceUserPickerItemModule)initWithItemUpdater:(id)a3 home:(id)a4 presenceEvent:(id)a5 options:(id)a6 delegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  HUPresenceUserPickerItemModule *v18;
  HUPresenceUserPickerItemModule *v19;
  uint64_t v20;
  HFPresenceEventBuilder *presenceEventBuilder;
  uint64_t v22;
  HULocationDeviceManager *locationDeviceManager;
  void *v25;
  void *v26;
  objc_super v27;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPresenceUserPickerItemModule.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

    if (v15)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPresenceUserPickerItemModule.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presenceEvent"));

LABEL_3:
  v27.receiver = self;
  v27.super_class = (Class)HUPresenceUserPickerItemModule;
  v18 = -[HFItemModule initWithItemUpdater:](&v27, sel_initWithItemUpdater_, v13);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_home, a4);
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0D31690]), "initWithEvent:", v15);
    presenceEventBuilder = v19->_presenceEventBuilder;
    v19->_presenceEventBuilder = (HFPresenceEventBuilder *)v20;

    objc_storeStrong((id *)&v19->_options, a6);
    objc_storeWeak((id *)&v19->_delegate, v17);
    +[HULocationDeviceManager sharedInstance](HULocationDeviceManager, "sharedInstance");
    v22 = objc_claimAutoreleasedReturnValue();
    locationDeviceManager = v19->_locationDeviceManager;
    v19->_locationDeviceManager = (HULocationDeviceManager *)v22;

    -[HUPresenceUserPickerItemModule _createItemProviders](v19, "_createItemProviders");
  }

  return v19;
}

- (void)registerForExternalUpdates
{
  id v3;

  -[HUPresenceUserPickerItemModule locationDeviceManager](self, "locationDeviceManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

}

- (void)unregisterForExternalUpdates
{
  id v3;

  -[HUPresenceUserPickerItemModule locationDeviceManager](self, "locationDeviceManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (unint64_t)itemTypeForItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUPresenceUserPickerItemModule singleUserSummaryItem](self, "singleUserSummaryItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v11 = 0;
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[HUPresenceUserPickerItemModule activationOptionStateByGranularity](self, "activationOptionStateByGranularity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      v11 = 1;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v13, "activationOptionItem");
          v14 = (id)objc_claimAutoreleasedReturnValue();

          if (v14 == v4)
            goto LABEL_14;
          objc_msgSend(v13, "userOptionItemProvider");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "items");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "containsObject:", v4);

          if ((v17 & 1) != 0)
          {
            v11 = 2;
LABEL_14:

            goto LABEL_15;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v9)
          continue;
        break;
      }
    }

    NSLog(CFSTR("Unexpected item %@"), v4);
    v11 = 2;
  }
LABEL_15:

  return v11;
}

- (id)activationOptionItemForGranularity:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HUPresenceUserPickerItemModule activationOptionStateByGranularity](self, "activationOptionStateByGranularity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activationOptionItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)stateForActivationOptionItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HUPresenceUserPickerItemModule activationOptionStateByGranularity](self, "activationOptionStateByGranularity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__HUPresenceUserPickerItemModule_stateForActivationOptionItem___block_invoke;
  v10[3] = &unk_1E6F503A0;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL __63__HUPresenceUserPickerItemModule_stateForActivationOptionItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "activationOptionItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)selectActivationOptionItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[HUPresenceUserPickerItemModule activationOptionStateByGranularity](self, "activationOptionStateByGranularity", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v12, "activationOptionItem");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setSelected:", v13 == v5);

        if (objc_msgSend(v12, "isSelected"))
        {
          v14 = objc_msgSend(v12, "activationGranularity");
          -[HUPresenceUserPickerItemModule presenceEventBuilder](self, "presenceEventBuilder");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setActivationGranularity:", v14);

          objc_msgSend(v12, "activationOptionItem");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "selectedUsers");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUPresenceUserPickerItemModule presenceEventBuilder](self, "presenceEventBuilder");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setUsers:", v17);

        }
        else
        {
          objc_msgSend(v12, "setExpanded:", 0);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v9);
  }

  -[HFItemModule itemUpdater](self, "itemUpdater");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0D314C0];
  -[HFItemModule allItems](self, "allItems");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "requestToUpdateItems:senderSelector:", v21, a2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v19, "performItemUpdateRequest:", v22);

  -[HUPresenceUserPickerItemModule delegate](self, "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPresenceUserPickerItemModule presenceEventBuilder](self, "presenceEventBuilder");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "userPickerModule:didUpdatePresenceEvent:", self, v25);

}

- (void)toggleExpandedForActivationOptionItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[HUPresenceUserPickerItemModule activationOptionStateByGranularity](self, "activationOptionStateByGranularity", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v12, "activationOptionItem");
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13 == v5)
          v14 = objc_msgSend(v12, "isExpanded") ^ 1;
        else
          v14 = 0;
        objc_msgSend(v12, "setExpanded:", v14);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  -[HFItemModule itemUpdater](self, "itemUpdater");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0D314C0];
  -[HFItemModule allItems](self, "allItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "requestToUpdateItems:senderSelector:", v17, a2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v15, "performItemUpdateRequest:", v18);

}

- (id)stateForUserItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  HUPresenceUserOptionState *v12;

  v4 = a3;
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30ED8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = -[HUPresenceUserPickerItemModule _isUserHandleSelected:](self, "_isUserHandleSelected:", v6);
    -[HUPresenceUserPickerItemModule home](self, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPresenceUserPickerItemModule home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hf_userForHandle:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "hf_isPresenceAuthorizedForUser:", v10);

    v12 = -[HUPresenceUserOptionState initWithActivationGranularity:selected:locationAvailable:]([HUPresenceUserOptionState alloc], "initWithActivationGranularity:selected:locationAvailable:", -[HUPresenceUserPickerItemModule _activationGranularityForUserItem:](self, "_activationGranularityForUserItem:", v4), v7, v11);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)selectUserItem:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30ED8]);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    -[HUPresenceUserPickerItemModule _updateSelected:forUserHandle:](self, "_updateSelected:forUserHandle:", 1, v6);
    v5 = v6;
  }

}

- (void)deselectUserItem:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30ED8]);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    -[HUPresenceUserPickerItemModule _updateSelected:forUserHandle:](self, "_updateSelected:forUserHandle:", 0, v6);
    v5 = v6;
  }

}

- (void)setOptions:(id)a3
{
  HUPresenceUserPickerItemModuleOptions *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  HUPresenceUserPickerItemModule *v21;
  _QWORD v22[4];
  HUPresenceUserPickerItemModuleOptions *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = (HUPresenceUserPickerItemModuleOptions *)a3;
  if (self->_options != v6)
  {
    objc_storeStrong((id *)&self->_options, a3);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v21 = self;
    -[HUPresenceUserPickerItemModule activationOptionStateByGranularity](self, "activationOptionStateByGranularity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectEnumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v25;
      v12 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "userOptionItemProvider");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "items");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v22[0] = v12;
          v22[1] = 3221225472;
          v22[2] = __45__HUPresenceUserPickerItemModule_setOptions___block_invoke;
          v22[3] = &unk_1E6F503C8;
          v23 = v6;
          objc_msgSend(v15, "na_each:", v22);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v10);
    }

    if (-[HUPresenceUserPickerItemModuleOptions customLocationSelected](v6, "customLocationSelected"))
      -[HUPresenceUserPickerItemModule _resetSelectionForCustomLocation](v21, "_resetSelectionForCustomLocation");
    -[HFItemModule itemUpdater](v21, "itemUpdater");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0D314C0];
    -[HFItemModule allItems](v21, "allItems");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "requestToUpdateItems:senderSelector:", v18, a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)objc_msgSend(v16, "performItemUpdateRequest:", v19);

  }
}

void __45__HUPresenceUserPickerItemModule_setOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "locationDevice");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setSelectedLocationDevice:", v5);
}

- (id)confirmationPromptForOptionItem:(id)a3
{
  id v4;
  void *v5;
  int v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  HUPresenceOptionSelectionConfirmationPrompt *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;

  v4 = a3;
  -[HUPresenceUserPickerItemModule options](self, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "customLocationSelected");

  if (!v6)
    goto LABEL_5;
  v7 = -[HUPresenceUserPickerItemModule itemTypeForItem:](self, "itemTypeForItem:", v4);
  if (v7 != 2)
  {
    if (v7 != 1)
      goto LABEL_5;
    -[HUPresenceUserPickerItemModule stateForActivationOptionItem:](self, "stateForActivationOptionItem:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "activationGranularity");

    if (!v9)
      goto LABEL_5;
LABEL_7:
    _HULocalizedStringWithDefaultValue(CFSTR("HUPresenceEventUnsupportedCustomLocationAlertTitleResetLocation"), CFSTR("HUPresenceEventUnsupportedCustomLocationAlertTitleResetLocation"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPresenceUserPickerItemModule home](self, "home");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUPresenceEventUnsupportedCustomLocationAlertMessageResetLocation"), CFSTR("%@"), v17, v18, v19, v20, v21, v22, (uint64_t)v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[HUPresenceOptionSelectionConfirmationPrompt initWithAlertTitle:alertBody:resetLocationToHomeOnConfirmation:]([HUPresenceOptionSelectionConfirmationPrompt alloc], "initWithAlertTitle:alertBody:resetLocationToHomeOnConfirmation:", v14, v23, 1);
    goto LABEL_8;
  }
  objc_msgSend(v4, "latestResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D30ED8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "type");
  if (v13)
    goto LABEL_7;
LABEL_5:
  v10 = 0;
LABEL_8:

  return v10;
}

- (void)_resetSelectionForCustomLocation
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D31778], "currentUserCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPresenceUserPickerItemModule presenceEventBuilder](self, "presenceEventBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUsers:", v6);

  -[HUPresenceUserPickerItemModule presenceEventBuilder](self, "presenceEventBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActivationGranularity:", 0);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[HUPresenceUserPickerItemModule activationOptionStateByGranularity](self, "activationOptionStateByGranularity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectEnumerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v10;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v15, "setExpanded:", 0);
        v16 = objc_msgSend(v15, "activationGranularity");
        -[HUPresenceUserPickerItemModule presenceEventBuilder](self, "presenceEventBuilder");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setSelected:", v16 == objc_msgSend(v17, "activationGranularity"));

        v18 = objc_msgSend(v15, "isSelected");
        if (v18)
        {
          -[HUPresenceUserPickerItemModule presenceEventBuilder](self, "presenceEventBuilder");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "users");
          v19 = objc_claimAutoreleasedReturnValue();
          v3 = (void *)v19;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D31778], "allUsersCollection");
          v19 = objc_claimAutoreleasedReturnValue();
          v4 = (void *)v19;
        }
        objc_msgSend(v15, "activationOptionItem");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setSelectedUsers:", v19);

        v21 = v4;
        if (v18)
        {

          v21 = v2;
        }

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v12);
  }

  -[HUPresenceUserPickerItemModule delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPresenceUserPickerItemModule presenceEventBuilder](self, "presenceEventBuilder");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "userPickerModule:didUpdatePresenceEvent:", self, v23);

}

- (id)itemProviders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[HUPresenceUserPickerItemModule activationOptionStateByGranularity](self, "activationOptionStateByGranularity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_34_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C99E60];
  -[HUPresenceUserPickerItemModule staticItemProvider](self, "staticItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __47__HUPresenceUserPickerItemModule_itemProviders__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userOptionItemProvider");
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  void *v25;
  void *v27;
  id v28;
  id obj;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D31570]);
  +[HUPresenceUserPickerItemModule sectionID](HUPresenceUserPickerItemModule, "sectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithIdentifier:", v6);

  v8 = (void *)objc_opt_new();
  if (-[HUPresenceUserPickerItemModule _shouldUseSingleUserStyle](self, "_shouldUseSingleUserStyle"))
  {
    -[HUPresenceUserPickerItemModule singleUserSummaryItem](self, "singleUserSummaryItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
  else
  {
    v27 = v7;
    v28 = v4;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[HUPresenceUserPickerItemModule _sortedActivationGranularities](self, "_sortedActivationGranularities");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v10)
    {
      v11 = v10;
      v30 = *(_QWORD *)v32;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v32 != v30)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v12);
          -[HUPresenceUserPickerItemModule activationOptionStateByGranularity](self, "activationOptionStateByGranularity");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "activationOptionItem");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v16);

          objc_msgSend(v15, "userOptionItemProvider");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "items");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "allObjects");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "_userItemComparator");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "sortedArrayUsingComparator:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObjectsFromArray:", v21);

          ++v12;
        }
        while (v11 != v12);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v11);
    }

    v7 = v27;
    v4 = v28;
  }
  objc_msgSend(v7, "setItems:", v8);
  -[HUPresenceUserPickerItemModule _attributedFooterTitle](self, "_attributedFooterTitle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAttributedFooterTitle:", v22);

  v23 = (void *)MEMORY[0x1E0D314B0];
  v35 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "filterSections:toDisplayedItems:", v24, v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (void)locationDeviceManager:(id)a3 didUpdateActiveLocationDevice:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  -[HFItemModule itemUpdater](self, "itemUpdater", a3, a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D314C0];
  -[HFItemModule allItems](self, "allItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestToUpdateItems:senderSelector:", v7, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v10, "performItemUpdateRequest:", v8);

}

- (id)_sortedActivationGranularities
{
  return &unk_1E7042A38;
}

- (unint64_t)_activationGranularityForUserItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[HUPresenceUserPickerItemModule activationOptionStateByGranularity](self, "activationOptionStateByGranularity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__HUPresenceUserPickerItemModule__activationGranularityForUserItem___block_invoke;
  v11[3] = &unk_1E6F503A0;
  v12 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "activationGranularity");

  return v9;
}

uint64_t __68__HUPresenceUserPickerItemModule__activationGranularityForUserItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "userOptionItemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (void)_createItemProviders
{
  void *v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  HUPresenceActivationOptionItem *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  HUPresenceActivationOptionItem *v20;
  HUPresenceActivationOptionState *v21;
  HUPresenceActivationOptionItem *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  HUPresenceActivationOptionItem *v30;
  HUPresenceActivationOptionItem *singleUserSummaryItem;
  void *v32;
  HFStaticItemProvider *v33;
  HFStaticItemProvider *staticItemProvider;
  id obj;
  uint64_t v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  _QWORD v42[5];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id location;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v37 = (id)objc_opt_new();
  v38 = (void *)objc_opt_new();
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[HUPresenceUserPickerItemModule _sortedActivationGranularities](self, "_sortedActivationGranularities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v3)
  {
    v36 = *(_QWORD *)v45;
    obj = v2;
    do
    {
      v39 = v3;
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v45 != v36)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        v6 = objc_alloc(MEMORY[0x1E0D31990]);
        -[HUPresenceUserPickerItemModule home](self, "home");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)objc_msgSend(v6, "initWithHome:", v7);

        objc_msgSend(v8, "setIncludeCurrentUser:", 1);
        objc_msgSend(v8, "setIncludeGuestUsers:", 1);
        objc_msgSend(v8, "setNameStyle:", 2);
        v9 = objc_alloc(MEMORY[0x1E0D31928]);
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __54__HUPresenceUserPickerItemModule__createItemProviders__block_invoke;
        v42[3] = &unk_1E6F50458;
        objc_copyWeak(&v43, &location);
        v42[4] = v5;
        v10 = (void *)objc_msgSend(v9, "initWithSourceProvider:transformationBlock:", v8, v42);
        v11 = objc_msgSend(v5, "unsignedIntegerValue");
        -[HUPresenceUserPickerItemModule presenceEventBuilder](self, "presenceEventBuilder");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "activationGranularity");

        v40 = v5;
        if (v13 == v11)
        {
          -[HUPresenceUserPickerItemModule presenceEventBuilder](self, "presenceEventBuilder");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "users");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D31778], "allUsersCollection");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v16 = [HUPresenceActivationOptionItem alloc];
        -[HUPresenceUserPickerItemModule presenceEventBuilder](self, "presenceEventBuilder");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "locationEventType");
        -[HUPresenceUserPickerItemModule home](self, "home");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[HUPresenceActivationOptionItem initWithEventType:selectedUsers:activationGranularity:style:home:](v16, "initWithEventType:selectedUsers:activationGranularity:style:home:", v18, v15, v11, 0, v19);

        -[HUPresenceActivationOptionItem setSelected:](v20, "setSelected:", v13 == v11);
        objc_msgSend(v38, "addObject:", v20);
        v21 = -[HUPresenceActivationOptionState initWithUserOptionItemProvider:activationOptionItem:]([HUPresenceActivationOptionState alloc], "initWithUserOptionItemProvider:activationOptionItem:", v10, v20);
        objc_msgSend(v37, "setObject:forKeyedSubscript:", v21, v40);

        objc_destroyWeak(&v43);
      }
      v2 = obj;
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v3);
  }

  objc_storeStrong((id *)&self->_activationOptionStateByGranularity, v37);
  v22 = [HUPresenceActivationOptionItem alloc];
  -[HUPresenceUserPickerItemModule presenceEventBuilder](self, "presenceEventBuilder");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "locationEventType");
  -[HUPresenceUserPickerItemModule presenceEventBuilder](self, "presenceEventBuilder");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "users");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPresenceUserPickerItemModule presenceEventBuilder](self, "presenceEventBuilder");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "activationGranularity");
  -[HUPresenceUserPickerItemModule home](self, "home");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[HUPresenceActivationOptionItem initWithEventType:selectedUsers:activationGranularity:style:home:](v22, "initWithEventType:selectedUsers:activationGranularity:style:home:", v24, v26, v28, 1, v29);
  singleUserSummaryItem = self->_singleUserSummaryItem;
  self->_singleUserSummaryItem = v30;

  -[HUPresenceUserPickerItemModule singleUserSummaryItem](self, "singleUserSummaryItem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addObject:", v32);

  v33 = (HFStaticItemProvider *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", v38);
  staticItemProvider = self->_staticItemProvider;
  self->_staticItemProvider = v33;

  objc_destroyWeak(&location);
}

id __54__HUPresenceUserPickerItemModule__createItemProviders__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  HUPresenceUserOptionItem *v5;
  void *v6;
  void *v7;
  void *v8;
  HUPresenceUserOptionItem *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = [HUPresenceUserOptionItem alloc];
  objc_msgSend(WeakRetained, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "locationDeviceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HUPresenceUserOptionItem initWithUserItem:selectedLocationDevice:locationDeviceManager:](v5, "initWithUserItem:selectedLocationDevice:locationDeviceManager:", v3, v7, v8);

  v10 = objc_alloc(MEMORY[0x1E0D31920]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__HUPresenceUserPickerItemModule__createItemProviders__block_invoke_2;
  v13[3] = &unk_1E6F50430;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  v13[4] = *(_QWORD *)(a1 + 32);
  v11 = (void *)objc_msgSend(v10, "initWithSourceItem:transformationBlock:", v9, v13);
  objc_destroyWeak(&v14);

  return v11;
}

id __54__HUPresenceUserPickerItemModule__createItemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30ED8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(WeakRetained, "_isUserHandleSelected:", v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D30DA0]);

  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "activationOptionStateByGranularity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithInt:", objc_msgSend(v11, "isExpanded") ^ 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D30D70]);

  return v6;
}

- (BOOL)_shouldUseSingleUserStyle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[HUPresenceUserPickerItemModule home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_allUsersIncludingCurrentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    v7 = 1;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CBA780];
    -[HUPresenceUserPickerItemModule home](self, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "hf_presenceDisableReasonsForHome:", v6) != 0;

  }
  return v7;
}

- (BOOL)_canDeselectUserHandle:(id)a3
{
  void *v4;
  BOOL v5;

  if (!-[HUPresenceUserPickerItemModule _isUserHandleSelected:](self, "_isUserHandleSelected:", a3))
    return 0;
  -[HUPresenceUserPickerItemModule _allSelectedAndSupportedUsers](self, "_allSelectedAndSupportedUsers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (unint64_t)objc_msgSend(v4, "count") > 1;

  return v5;
}

- (BOOL)_isUserHandleSelected:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  if (!a3)
    return 0;
  v4 = a3;
  -[HUPresenceUserPickerItemModule home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_userForHandle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUPresenceUserPickerItemModule _allSelectedAndSupportedUsers](self, "_allSelectedAndSupportedUsers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v7, "containsObject:", v6);

  return (char)v4;
}

- (void)_updateSelected:(BOOL)a3 forUserHandle:(id)a4
{
  _BOOL4 v4;
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
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;

  v4 = a3;
  v34 = a4;
  if (-[HUPresenceUserPickerItemModule _isUserHandleSelected:](self, "_isUserHandleSelected:") != v4
    && (v4 || -[HUPresenceUserPickerItemModule _canDeselectUserHandle:](self, "_canDeselectUserHandle:", v34)))
  {
    -[HUPresenceUserPickerItemModule home](self, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hf_userForHandle:", v34);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUPresenceUserPickerItemModule presenceEventBuilder](self, "presenceEventBuilder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "users");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPresenceUserPickerItemModule home](self, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resolveSelectedUsersWithHome:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    if (v4)
      objc_msgSend(v13, "addObject:", v8);
    else
      objc_msgSend(v13, "removeObject:", v8);
    v14 = (void *)MEMORY[0x1E0D31778];
    -[HUPresenceUserPickerItemModule home](self, "home");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "collectionWithResolvedUsers:inHome:", v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUPresenceUserPickerItemModule presenceEventBuilder](self, "presenceEventBuilder");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "users");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v16, "isEqual:", v18);

    if ((v19 & 1) == 0)
    {
      -[HUPresenceUserPickerItemModule presenceEventBuilder](self, "presenceEventBuilder");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setUsers:", v16);

      -[HUPresenceUserPickerItemModule activationOptionStateByGranularity](self, "activationOptionStateByGranularity");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0CB37E8];
      -[HUPresenceUserPickerItemModule presenceEventBuilder](self, "presenceEventBuilder");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "numberWithUnsignedInteger:", objc_msgSend(v23, "activationGranularity"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "activationOptionItem");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setSelectedUsers:", v16);

      -[HUPresenceActivationOptionItem setSelectedUsers:](self->_singleUserSummaryItem, "setSelectedUsers:", v16);
      v27 = (void *)MEMORY[0x1E0D314C0];
      -[HFItemModule allItems](self, "allItems");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "requestToUpdateItems:senderSelector:", v28, a2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      -[HFItemModule itemUpdater](self, "itemUpdater");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (id)objc_msgSend(v30, "performItemUpdateRequest:", v29);

      -[HUPresenceUserPickerItemModule delegate](self, "delegate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUPresenceUserPickerItemModule presenceEventBuilder](self, "presenceEventBuilder");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "userPickerModule:didUpdatePresenceEvent:", self, v33);

    }
  }

}

- (id)_allSelectedAndSupportedUsers
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[HUPresenceUserPickerItemModule options](self, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "customLocationSelected");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    -[HUPresenceUserPickerItemModule home](self, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentUser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HUPresenceUserPickerItemModule presenceEventBuilder](self, "presenceEventBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "users");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPresenceUserPickerItemModule home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resolveSelectedUsersWithHome:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (BOOL)_isPresenceAuthorizedForUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  -[HUPresenceUserPickerItemModule home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_handleForUser:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  if (v7)
  {
    -[HUPresenceUserPickerItemModule home](self, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "homeAccessControlForUser:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "presenceAuthorizationStatus") != 1;
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

+ (id)_userItemComparator
{
  return &__block_literal_global_56;
}

uint64_t __53__HUPresenceUserPickerItemModule__userItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t (**v11)(_QWORD, _QWORD, _QWORD);
  uint64_t v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D30ED8];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30ED8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "latestResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "type") || !objc_msgSend(v10, "type"))
  {
    if (objc_msgSend(v8, "type") && !objc_msgSend(v10, "type"))
    {
      v12 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
      v11 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v12 = ((uint64_t (**)(_QWORD, id, id))v11)[2](v11, v4, v5);

    }
  }
  else
  {
    v12 = -1;
  }

  return v12;
}

- (id)_attributedFooterTitle
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[5];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  -[HUPresenceUserPickerItemModule options](self, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  if (v5)
  {
    -[HUPresenceUserPickerItemModule _combinedFooterStringForLocationDeviceText:](self, "_combinedFooterStringForLocationDeviceText:", 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__6;
    v21 = __Block_byref_object_dispose__6;
    v22 = 0;
    -[HUPresenceUserPickerItemModule locationDeviceManager](self, "locationDeviceManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeLocationDeviceFuture");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __56__HUPresenceUserPickerItemModule__attributedFooterTitle__block_invoke;
    v16[3] = &unk_1E6F504C8;
    v16[4] = self;
    objc_msgSend(v8, "flatMap:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __56__HUPresenceUserPickerItemModule__attributedFooterTitle__block_invoke_3;
    v15[3] = &unk_1E6F4F2D0;
    v15[4] = self;
    objc_msgSend(v10, "recover:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __56__HUPresenceUserPickerItemModule__attributedFooterTitle__block_invoke_4;
    v14[3] = &unk_1E6F504F0;
    v14[4] = self;
    v14[5] = &v17;
    v12 = (id)objc_msgSend(v11, "flatMap:", v14);

    v6 = (id)v18[5];
    _Block_object_dispose(&v17, 8);

  }
  return v6;
}

id __56__HUPresenceUserPickerItemModule__attributedFooterTitle__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v2 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__HUPresenceUserPickerItemModule__attributedFooterTitle__block_invoke_2;
  v9[3] = &unk_1E6F504A0;
  v10 = v2;
  v3 = v2;
  __56__HUPresenceUserPickerItemModule__attributedFooterTitle__block_invoke_2((uint64_t)v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend((id)objc_opt_class(), "_locationDeviceTextForDeviceNameString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "futureWithResult:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __56__HUPresenceUserPickerItemModule__attributedFooterTitle__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (objc_msgSend(*(id *)(a1 + 32), "isCurrentDevice"))
  {
    HULocalizedModelString(CFSTR("HUPresenceActiveLocationDeviceFooterFormatThisDevice"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUPresenceActiveLocationDeviceFooterFormatOtherDevice"), CFSTR("%@"), v4, v5, v6, v7, v8, v9, (uint64_t)v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

id __56__HUPresenceUserPickerItemModule__attributedFooterTitle__block_invoke_3()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend((id)objc_opt_class(), "_locationDeviceTextForDeviceNameString:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "futureWithResult:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __56__HUPresenceUserPickerItemModule__attributedFooterTitle__block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_combinedFooterStringForLocationDeviceText:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (id)_combinedFooterStringForLocationDeviceText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[HUPresenceUserPickerItemModule _homeHubNeedsUpdateWarningText](self, "_homeHubNeedsUpdateWarningText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeAddObject:", v6);

  -[HUPresenceUserPickerItemModule _someUsersNeedSoftwareUpdateWarningText](self, "_someUsersNeedSoftwareUpdateWarningText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeAddObject:", v7);

  objc_msgSend(v5, "na_safeAddObject:", v4);
  if (objc_msgSend(v5, "count"))
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CB3778]);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __77__HUPresenceUserPickerItemModule__combinedFooterStringForLocationDeviceText___block_invoke;
    v11[3] = &unk_1E6F50518;
    v9 = v8;
    v12 = v9;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __77__HUPresenceUserPickerItemModule__combinedFooterStringForLocationDeviceText___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (a3)
  {
    v5 = *(void **)(a1 + 32);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n\n"));
    objc_msgSend(v5, "appendAttributedString:", v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", v7);

}

- (id)_homeHubNeedsUpdateWarningText
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[HUPresenceUserPickerItemModule home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "hf_supportsSharedEventAutomation") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3498]);
    _HULocalizedStringWithDefaultValue(CFSTR("HUPresenceActivationWarningFooterHomeHubNeedsUpdate"), CFSTR("HUPresenceActivationWarningFooterHomeHubNeedsUpdate"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v4, "initWithString:", v5);

  }
  return v3;
}

- (id)_someUsersNeedSoftwareUpdateWarningText
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  if (-[HUPresenceUserPickerItemModule _shouldUseSingleUserStyle](self, "_shouldUseSingleUserStyle"))
    return 0;
  -[HUPresenceUserPickerItemModule home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "users");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__HUPresenceUserPickerItemModule__someUsersNeedSoftwareUpdateWarningText__block_invoke;
  v10[3] = &unk_1E6F4D040;
  v10[4] = self;
  v5 = objc_msgSend(v4, "na_any:", v10);

  if (!v5)
    return 0;
  v6 = objc_alloc(MEMORY[0x1E0CB3498]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUPresenceActivationWarningFooterSomeUsersNeedSoftwareUpdate"), CFSTR("HUPresenceActivationWarningFooterSomeUsersNeedSoftwareUpdate"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithString:", v7);

  return v8;
}

uint64_t __73__HUPresenceUserPickerItemModule__someUsersNeedSoftwareUpdateWarningText__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  int v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hf_isPresenceAuthorizedForUser:", v3);

  return v5 ^ 1u;
}

+ (id)_locationDeviceTextForDeviceNameString:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;

  v3 = a3;
  _HULocalizedStringWithDefaultValue(CFSTR("HUPresenceActiveLocationDeviceFooterSettingsLinkTitle"), CFSTR("HUPresenceActiveLocationDeviceFooterSettingsLinkTitle"), 1);
  v4 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v4;
  if (v3)
  {
    HULocalizedStringWithFormat(CFSTR("HUPresenceActiveLocationDeviceFooterSettingsDescription"), CFSTR("%@"), v5, v6, v7, v8, v9, v10, v4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUPresenceActiveLocationDeviceFooterFormat"), CFSTR("%@%@"), v12, v13, v14, v15, v16, v17, (uint64_t)v3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    HULocalizedStringWithFormat(CFSTR("HUPresenceActiveLocationDeviceFooterNoFMFDeviceSettingsDescription"), CFSTR("%@"), v5, v6, v7, v8, v9, v10, v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");
  v20 = (void *)MEMORY[0x1E0CB3498];
  if (v19)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v18);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "hf_locationDeviceSettingsURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "hf_attributedLinkStringForString:linkString:linkURL:", v18, v11, v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v21;
}

- (HFItem)singleUserSummaryItem
{
  return &self->_singleUserSummaryItem->super;
}

- (HMHome)home
{
  return self->_home;
}

- (HUPresenceUserPickerItemModuleDelegate)delegate
{
  return (HUPresenceUserPickerItemModuleDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HFPresenceEventBuilder)presenceEventBuilder
{
  return self->_presenceEventBuilder;
}

- (HUPresenceUserPickerItemModuleOptions)options
{
  return self->_options;
}

- (NSDictionary)activationOptionStateByGranularity
{
  return self->_activationOptionStateByGranularity;
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (HULocationDeviceManager)locationDeviceManager
{
  return self->_locationDeviceManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationDeviceManager, 0);
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_activationOptionStateByGranularity, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_presenceEventBuilder, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_singleUserSummaryItem, 0);
}

@end
