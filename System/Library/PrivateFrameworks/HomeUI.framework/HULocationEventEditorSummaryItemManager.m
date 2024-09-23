@implementation HULocationEventEditorSummaryItemManager

+ (NSString)usersHeaderSectionID
{
  if (_MergedGlobals_5_1 != -1)
    dispatch_once(&_MergedGlobals_5_1, &__block_literal_global_2_3);
  return (NSString *)(id)qword_1ED5805C8;
}

void __63__HULocationEventEditorSummaryItemManager_usersHeaderSectionID__block_invoke_2()
{
  void *v0;

  v0 = (void *)qword_1ED5805C8;
  qword_1ED5805C8 = (uint64_t)CFSTR("users");

}

+ (NSString)usersListSectionID
{
  return +[HUPresenceUserPickerItemModule sectionID](HUPresenceUserPickerItemModule, "sectionID");
}

+ (NSString)locationSectionID
{
  if (qword_1ED5805D0 != -1)
    dispatch_once(&qword_1ED5805D0, &__block_literal_global_5_1);
  return (NSString *)(id)qword_1ED5805D8;
}

void __60__HULocationEventEditorSummaryItemManager_locationSectionID__block_invoke_2()
{
  void *v0;

  v0 = (void *)qword_1ED5805D8;
  qword_1ED5805D8 = (uint64_t)CFSTR("location");

}

- (HULocationEventEditorSummaryItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_flow_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HULocationEventEditorSummaryItemManager.m"), 46, CFSTR("%s is unavailable; use %@ instead"),
    "-[HULocationEventEditorSummaryItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HULocationEventEditorSummaryItemManager)initWithDelegate:(id)a3 flow:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  HULocationEventEditorSummaryItemManager *v15;
  void *v16;
  HULocationEventEditorSummaryItemManager *v17;
  objc_super v19;
  _QWORD v20[4];
  HULocationEventEditorSummaryItemManager *v21;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "eventBuilderItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "locationEventBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0D31690]);
    v12 = objc_msgSend(v7, "eventType");
    if ((unint64_t)(v12 - 1) <= 1)
      objc_msgSend(v11, "setLocationEventType:", v12);
    objc_msgSend(v7, "eventBuilderItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLocationEventBuilder:", v11);

  }
  v14 = objc_alloc(MEMORY[0x1E0D31840]);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __65__HULocationEventEditorSummaryItemManager_initWithDelegate_flow___block_invoke;
  v20[3] = &unk_1E6F4C518;
  v15 = self;
  v21 = v15;
  v16 = (void *)objc_msgSend(v14, "initWithResultsBlock:", v20);
  v19.receiver = v15;
  v19.super_class = (Class)HULocationEventEditorSummaryItemManager;
  v17 = -[HFItemManager initWithDelegate:sourceItem:](&v19, sel_initWithDelegate_sourceItem_, v8, v16);

  if (v17)
    objc_storeStrong((id *)&v17->_flow, a4);

  return v17;
}

id __65__HULocationEventEditorSummaryItemManager_initWithDelegate_flow___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "flow");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "eventType");

  if (v2 == 1)
    v3 = CFSTR("HULocationTriggerSummaryTitlePeopleArrive");
  else
    v3 = CFSTR("HULocationTriggerSummaryTitlePeopleLeave");
  _HULocalizedStringWithDefaultValue(v3, v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D519C0];
  v9 = *MEMORY[0x1E0D30D18];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "futureWithResult:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)home
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  -[HULocationEventEditorSummaryItemManager flow](self, "flow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "triggerBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)HULocationEventEditorSummaryItemManager;
    -[HFItemManager home](&v10, sel_home);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (BOOL)isInstructionsItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HULocationEventEditorSummaryItemManager usersInstructionsItem](self, "usersInstructionsItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 == v4;
}

- (id)locationEventRegion
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[HULocationEventEditorSummaryItemManager flow](self, "flow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventBuilderItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationEventBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v6 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v8, "region");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HULocationTriggerRegion customRegionWithCircularRegion:](HULocationTriggerRegion, "customRegionWithCircularRegion:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = 0;
      goto LABEL_10;
    }
    -[HULocationEventEditorSummaryItemManager home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HULocationTriggerRegion homeRegionWithHome:eventType:](HULocationTriggerRegion, "homeRegionWithHome:eventType:", v9, objc_msgSend(v6, "locationEventType"));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;

LABEL_10:
  return v11;
}

- (BOOL)canChangeLocation
{
  void *v3;
  void *v4;
  id v5;
  BOOL v6;

  objc_opt_class();
  -[HULocationEventEditorSummaryItemManager locationItem](self, "locationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = v5 && (objc_msgSend(v5, "locationCanBeEdited") & 1) != 0;
  return v6;
}

- (void)updateLocationEventWithRegion:(id)a3
{
  uint64_t v5;
  id v6;
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
  void *v17;
  void *v18;
  id v19;
  id v20;

  v20 = a3;
  v5 = objc_msgSend(v20, "regionType");
  if (v5 == 1)
  {
    objc_opt_class();
    -[HULocationEventEditorSummaryItemManager flow](self, "flow");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "eventBuilderItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "locationEventBuilder");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v6;
    else
      v12 = 0;
    v13 = v12;

    if (!v13)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0D314E8]);
      -[HULocationEventEditorSummaryItemManager flow](self, "flow");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "eventBuilderItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setLocationEventBuilder:", v6);

    }
    objc_msgSend(v20, "circularRegion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRegion:", v7);
    goto LABEL_10;
  }
  if (!v5)
  {
    -[HULocationEventEditorSummaryItemManager userPickerModule](self, "userPickerModule");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presenceEventBuilder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULocationEventEditorSummaryItemManager flow](self, "flow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "eventBuilderItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLocationEventBuilder:", v7);

LABEL_10:
  }
  -[HULocationEventEditorSummaryItemManager _userPickerOptions](self, "_userPickerOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULocationEventEditorSummaryItemManager userPickerModule](self, "userPickerModule");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setOptions:", v16);

  -[HFItemManager allItems](self, "allItems");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HFItemManager updateResultsForItems:senderSelector:](self, "updateResultsForItems:senderSelector:", v18, a2);

}

- (id)_userPickerOptions
{
  void *v3;
  HUPresenceUserPickerItemModuleOptions *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__HULocationEventEditorSummaryItemManager__userPickerOptions__block_invoke;
  v6[3] = &unk_1E6F5A1D8;
  v6[4] = self;
  __61__HULocationEventEditorSummaryItemManager__userPickerOptions__block_invoke((uint64_t)v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HUPresenceUserPickerItemModuleOptions initWithLocationDevice:customLocationSelected:]([HUPresenceUserPickerItemModuleOptions alloc], "initWithLocationDevice:customLocationSelected:", v3, -[HULocationEventEditorSummaryItemManager _hasCustomLocation](self, "_hasCustomLocation"));

  return v4;
}

id __61__HULocationEventEditorSummaryItemManager__userPickerOptions__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "flow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventBuilderItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationEventBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    +[HUPresenceCurrentUserLocationDevice FMFDevice](HUPresenceCurrentUserLocationDevice, "FMFDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "flow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "triggerBuilder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trigger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "creatorDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      +[HUPresenceCurrentUserLocationDevice customDeviceWithHMDevice:](HUPresenceCurrentUserLocationDevice, "customDeviceWithHMDevice:", v10);
    else
      +[HUPresenceCurrentUserLocationDevice currentDevice](HUPresenceCurrentUserLocationDevice, "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)_buildItemModulesForHome:(id)a3
{
  id v4;
  void *v5;
  HUPresenceUserPickerItemModule *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  HUPresenceUserPickerItemModule *v13;
  HUPresenceUserPickerItemModule *userPickerModule;
  void *v15;
  void *v16;
  HUTriggerConditionEditorItemModule *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HUTriggerConditionEditorItemModule *v23;
  HUTriggerConditionEditorItemModule *conditionEditorModule;
  void *v25;
  _QWORD v27[5];
  void *v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __68__HULocationEventEditorSummaryItemManager__buildItemModulesForHome___block_invoke;
  v27[3] = &unk_1E6F5A200;
  v27[4] = self;
  v4 = a3;
  __68__HULocationEventEditorSummaryItemManager__buildItemModulesForHome___block_invoke((uint64_t)v27);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [HUPresenceUserPickerItemModule alloc];
  -[HULocationEventEditorSummaryItemManager flow](self, "flow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "triggerBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (id)v9;
  else
    v11 = v4;
  -[HULocationEventEditorSummaryItemManager _userPickerOptions](self, "_userPickerOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HUPresenceUserPickerItemModule initWithItemUpdater:home:presenceEvent:options:delegate:](v6, "initWithItemUpdater:home:presenceEvent:options:delegate:", self, v11, v5, v12, self);

  userPickerModule = self->_userPickerModule;
  self->_userPickerModule = v13;

  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    -[HULocationEventEditorSummaryItemManager userPickerModule](self, "userPickerModule");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = [HUTriggerConditionEditorItemModule alloc];
    -[HULocationEventEditorSummaryItemManager home](self, "home");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULocationEventEditorSummaryItemManager flow](self, "flow");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "triggerBuilder");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "conditionCollection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E70414A0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[HUTriggerConditionEditorItemModule initWithItemUpdater:home:conditionCollection:disallowedConditionTypes:](v17, "initWithItemUpdater:home:conditionCollection:disallowedConditionTypes:", self, v18, v21, v22);
    conditionEditorModule = self->_conditionEditorModule;
    self->_conditionEditorModule = v23;

    -[HULocationEventEditorSummaryItemManager userPickerModule](self, "userPickerModule");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v15;
    -[HULocationEventEditorSummaryItemManager conditionEditorModule](self, "conditionEditorModule");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

id __68__HULocationEventEditorSummaryItemManager__buildItemModulesForHome___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "flow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventBuilderItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationEventBuilder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (!v6)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D31690]);
    objc_msgSend(*(id *)(a1 + 32), "flow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "eventType");

    if (v8 == 1)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "flow");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "eventType");

      if (v11 != 2)
      {
LABEL_10:
        objc_msgSend(MEMORY[0x1E0D31778], "currentUserCollection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setUsers:", v12);

        objc_msgSend(v4, "setActivationGranularity:", 0);
        goto LABEL_11;
      }
      v9 = 2;
    }
    objc_msgSend(v4, "setLocationEventType:", v9);
    goto LABEL_10;
  }
LABEL_11:
  objc_msgSend(v4, "buildNewEventsFromCurrentState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "anyObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  HULocationEventSelectedLocationItem *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HULocationEventSelectedLocationItem *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31840]), "initWithResultsBlock:", &__block_literal_global_41_0);
  -[HULocationEventEditorSummaryItemManager setUsersInstructionsItem:](self, "setUsersInstructionsItem:", v5);

  -[HULocationEventEditorSummaryItemManager usersInstructionsItem](self, "usersInstructionsItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

  v7 = [HULocationEventSelectedLocationItem alloc];
  -[HULocationEventEditorSummaryItemManager flow](self, "flow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "eventBuilderItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "locationEventBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULocationEventEditorSummaryItemManager home](self, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HULocationEventSelectedLocationItem initWithEvent:inHome:](v7, "initWithEvent:inHome:", v10, v11);

  -[HULocationEventEditorSummaryItemManager flow](self, "flow");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "triggerBuilder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[HULocationEventEditorSummaryItemManager flow](self, "flow");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "triggerBuilder");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULocationEventSelectedLocationItem setLocationCanBeEdited:](v12, "setLocationCanBeEdited:", objc_msgSend(v16, "isShortcutOwned") ^ 1);

  }
  else
  {
    -[HULocationEventSelectedLocationItem setLocationCanBeEdited:](v12, "setLocationCanBeEdited:", 1);
  }
  -[HULocationEventEditorSummaryItemManager setLocationItem:](self, "setLocationItem:", v12);
  -[HULocationEventEditorSummaryItemManager locationItem](self, "locationItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v17);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", v4);
  v21[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

id __70__HULocationEventEditorSummaryItemManager__buildItemProvidersForHome___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)objc_opt_new();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", &unk_1E70414B8, CFSTR("instructionsStyle"));
  _HULocalizedStringWithDefaultValue(CFSTR("HULocationTriggerEditorUserListSectionTitle"), CFSTR("HULocationTriggerEditorUserListSectionTitle"), 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v1, *MEMORY[0x1E0D30D18]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = objc_alloc(MEMORY[0x1E0D31570]);
  +[HULocationEventEditorSummaryItemManager usersHeaderSectionID](HULocationEventEditorSummaryItemManager, "usersHeaderSectionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithIdentifier:", v7);

  -[HULocationEventEditorSummaryItemManager usersInstructionsItem](self, "usersInstructionsItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setItems:filteringToDisplayedItems:", v10, v4);

  objc_msgSend(v5, "addObject:", v8);
  -[HULocationEventEditorSummaryItemManager userPickerModule](self, "userPickerModule");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "buildSectionsWithDisplayedItems:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v12);

  v13 = objc_alloc(MEMORY[0x1E0D31570]);
  +[HULocationEventEditorSummaryItemManager locationSectionID](HULocationEventEditorSummaryItemManager, "locationSectionID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithIdentifier:", v14);

  -[HULocationEventEditorSummaryItemManager locationItem](self, "locationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setItems:filteringToDisplayedItems:", v17, v4);

  objc_msgSend(v5, "addObject:", v15);
  -[HULocationEventEditorSummaryItemManager conditionEditorModule](self, "conditionEditorModule");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[HULocationEventEditorSummaryItemManager conditionEditorModule](self, "conditionEditorModule");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "buildSectionsWithDisplayedItems:", v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v20);

  }
  return v5;
}

- (BOOL)_canEditLocation
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[HULocationEventEditorSummaryItemManager flow](self, "flow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventBuilderItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationEventBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    return 1;
  -[HULocationEventEditorSummaryItemManager userPickerModule](self, "userPickerModule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presenceEventBuilder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "users");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULocationEventEditorSummaryItemManager home](self, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resolveSelectedUsersWithHome:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99E60];
  -[HULocationEventEditorSummaryItemManager home](self, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "currentUser");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithObject:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = objc_msgSend(v12, "isEqualToSet:", v16);

  return (char)v10;
}

- (BOOL)_hasCustomLocation
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  char v14;

  -[HULocationEventEditorSummaryItemManager flow](self, "flow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventBuilderItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationEventBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    return 0;
  objc_opt_class();
  -[HULocationEventEditorSummaryItemManager flow](self, "flow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "eventBuilderItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "locationEventBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  -[HULocationEventEditorSummaryItemManager home](self, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isRegionAtHome:", v13);

  v7 = v14 ^ 1;
  return v7;
}

- (void)userPickerModule:(id)a3 didUpdatePresenceEvent:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;

  v25 = a4;
  if (!-[HULocationEventEditorSummaryItemManager _hasCustomLocation](self, "_hasCustomLocation")
    || (objc_msgSend(v25, "users"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "type"),
        v6,
        v7 != 1))
  {
    -[HULocationEventEditorSummaryItemManager flow](self, "flow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "eventBuilderItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "locationEventBuilder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[HULocationEventEditorSummaryItemManager flow](self, "flow");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "triggerBuilder");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "eventBuilders");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "containsObject:", v10);

      if (v14)
      {
        -[HULocationEventEditorSummaryItemManager flow](self, "flow");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "triggerBuilder");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "removeEventBuilder:", v10);

        -[HULocationEventEditorSummaryItemManager flow](self, "flow");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "triggerBuilder");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addEventBuilder:", v25);

      }
    }
    -[HULocationEventEditorSummaryItemManager flow](self, "flow");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "eventBuilderItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setLocationEventBuilder:", v25);

    v21 = (void *)MEMORY[0x1E0C99E60];
    -[HULocationEventEditorSummaryItemManager locationItem](self, "locationItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWithObject:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[HFItemManager updateResultsForItems:senderSelector:](self, "updateResultsForItems:senderSelector:", v23, a2);

  }
}

- (HUPresenceUserPickerItemModule)userPickerModule
{
  return self->_userPickerModule;
}

- (HUTriggerConditionEditorItemModule)conditionEditorModule
{
  return self->_conditionEditorModule;
}

- (HFItem)locationItem
{
  return self->_locationItem;
}

- (void)setLocationItem:(id)a3
{
  objc_storeStrong((id *)&self->_locationItem, a3);
}

- (HFItem)usersInstructionsItem
{
  return self->_usersInstructionsItem;
}

- (void)setUsersInstructionsItem:(id)a3
{
  objc_storeStrong((id *)&self->_usersInstructionsItem, a3);
}

- (HUEventUIFlow)flow
{
  return self->_flow;
}

- (void)setFlow:(id)a3
{
  objc_storeStrong((id *)&self->_flow, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flow, 0);
  objc_storeStrong((id *)&self->_usersInstructionsItem, 0);
  objc_storeStrong((id *)&self->_locationItem, 0);
  objc_storeStrong((id *)&self->_conditionEditorModule, 0);
  objc_storeStrong((id *)&self->_userPickerModule, 0);
}

@end
