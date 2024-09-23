@implementation HULocationTriggerEditorSummaryItemManager

+ (NSString)usersHeaderSectionID
{
  return (NSString *)CFSTR("users");
}

+ (NSString)usersListSectionID
{
  return +[HUPresenceUserPickerItemModule sectionID](HUPresenceUserPickerItemModule, "sectionID");
}

+ (NSString)locationSectionID
{
  return (NSString *)CFSTR("location");
}

- (HULocationTriggerEditorSummaryItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_triggerBuilder_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HULocationTriggerEditorSummaryItemManager.m"), 44, CFSTR("%s is unavailable; use %@ instead"),
    "-[HULocationTriggerEditorSummaryItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HULocationTriggerEditorSummaryItemManager)initWithDelegate:(id)a3 triggerBuilder:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  HULocationTriggerEditorSummaryItemManager *v16;
  HUTriggerConditionEditorItemModule *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  HUTriggerConditionEditorItemModule *conditionEditorModule;
  id v23;
  void *v24;
  HUPresenceUserPickerItemModule *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  HUPresenceUserPickerItemModule *userPickerModule;
  _QWORD v31[4];
  id v32;
  objc_super v33;
  _QWORD v34[4];
  id v35;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "locationInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "locationEventBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = objc_opt_class();
    NSLog(CFSTR("%@ must be initialized with a trigger builder that has a preselected event! Instead received trigger builder %@"), v11, v7);
  }
  v12 = objc_alloc(MEMORY[0x1E0D31840]);
  v13 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __77__HULocationTriggerEditorSummaryItemManager_initWithDelegate_triggerBuilder___block_invoke;
  v34[3] = &unk_1E6F4C518;
  v14 = v7;
  v35 = v14;
  v15 = (void *)objc_msgSend(v12, "initWithResultsBlock:", v34);
  v33.receiver = self;
  v33.super_class = (Class)HULocationTriggerEditorSummaryItemManager;
  v16 = -[HFItemManager initWithDelegate:sourceItem:](&v33, sel_initWithDelegate_sourceItem_, v8, v15);

  if (v16)
  {
    objc_storeStrong((id *)&v16->_triggerBuilder, a4);
    v17 = [HUTriggerConditionEditorItemModule alloc];
    objc_msgSend(v14, "home");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "conditionCollection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E70415C0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[HUTriggerConditionEditorItemModule initWithItemUpdater:home:conditionCollection:disallowedConditionTypes:](v17, "initWithItemUpdater:home:conditionCollection:disallowedConditionTypes:", v16, v18, v19, v20);
    conditionEditorModule = v16->_conditionEditorModule;
    v16->_conditionEditorModule = (HUTriggerConditionEditorItemModule *)v21;

    v31[0] = v13;
    v31[1] = 3221225472;
    v31[2] = __77__HULocationTriggerEditorSummaryItemManager_initWithDelegate_triggerBuilder___block_invoke_23;
    v31[3] = &unk_1E6F5A200;
    v23 = v14;
    v32 = v23;
    __77__HULocationTriggerEditorSummaryItemManager_initWithDelegate_triggerBuilder___block_invoke_23((uint64_t)v31);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = [HUPresenceUserPickerItemModule alloc];
    objc_msgSend(v23, "home");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULocationTriggerEditorSummaryItemManager _userPickerOptions](v16, "_userPickerOptions");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[HUPresenceUserPickerItemModule initWithItemUpdater:home:presenceEvent:options:delegate:](v25, "initWithItemUpdater:home:presenceEvent:options:delegate:", v16, v26, v24, v27, v16);
    userPickerModule = v16->_userPickerModule;
    v16->_userPickerModule = (HUPresenceUserPickerItemModule *)v28;

  }
  return v16;
}

id __77__HULocationTriggerEditorSummaryItemManager_initWithDelegate_triggerBuilder___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "locationInterface");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "locationEventBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "locationEventType");

  if (v3 == 1)
    v4 = CFSTR("HULocationTriggerSummaryTitlePeopleArrive");
  else
    v4 = CFSTR("HULocationTriggerSummaryTitlePeopleLeave");
  _HULocalizedStringWithDefaultValue(v4, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D519C0];
  v10 = *MEMORY[0x1E0D30D18];
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "futureWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __77__HULocationTriggerEditorSummaryItemManager_initWithDelegate_triggerBuilder___block_invoke_23(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "locationInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "locationEventBuilder");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (!v5)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D31690]);
    objc_msgSend(*(id *)(a1 + 32), "locationInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationEventBuilder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLocationEventType:", objc_msgSend(v7, "locationEventType"));

    objc_msgSend(MEMORY[0x1E0D31778], "currentUserCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setUsers:", v8);

    objc_msgSend(v3, "setActivationGranularity:", 0);
  }
  objc_msgSend(v3, "buildNewEventsFromCurrentState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isInstructionsItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HULocationTriggerEditorSummaryItemManager usersInstructionsItem](self, "usersInstructionsItem");
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

  -[HULocationTriggerEditorSummaryItemManager triggerBuilder](self, "triggerBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationInterface");
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
    -[HFItemManager home](self, "home");
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
  -[HULocationTriggerEditorSummaryItemManager locationItem](self, "locationItem");
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
    -[HULocationTriggerEditorSummaryItemManager triggerBuilder](self, "triggerBuilder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locationInterface");
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
      -[HULocationTriggerEditorSummaryItemManager triggerBuilder](self, "triggerBuilder");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "locationInterface");
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
    -[HULocationTriggerEditorSummaryItemManager userPickerModule](self, "userPickerModule");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presenceEventBuilder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HULocationTriggerEditorSummaryItemManager triggerBuilder](self, "triggerBuilder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "locationInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLocationEventBuilder:", v7);

LABEL_10:
  }
  -[HULocationTriggerEditorSummaryItemManager _userPickerOptions](self, "_userPickerOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULocationTriggerEditorSummaryItemManager userPickerModule](self, "userPickerModule");
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
  v6[2] = __63__HULocationTriggerEditorSummaryItemManager__userPickerOptions__block_invoke;
  v6[3] = &unk_1E6F5A1D8;
  v6[4] = self;
  __63__HULocationTriggerEditorSummaryItemManager__userPickerOptions__block_invoke((uint64_t)v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HUPresenceUserPickerItemModuleOptions initWithLocationDevice:customLocationSelected:]([HUPresenceUserPickerItemModuleOptions alloc], "initWithLocationDevice:customLocationSelected:", v3, -[HULocationTriggerEditorSummaryItemManager _hasCustomLocation](self, "_hasCustomLocation"));

  return v4;
}

id __63__HULocationTriggerEditorSummaryItemManager__userPickerOptions__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "triggerBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "locationInterface");
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
    objc_msgSend(*(id *)(a1 + 32), "triggerBuilder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trigger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "creatorDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      +[HUPresenceCurrentUserLocationDevice customDeviceWithHMDevice:](HUPresenceCurrentUserLocationDevice, "customDeviceWithHMDevice:", v9);
    else
      +[HUPresenceCurrentUserLocationDevice currentDevice](HUPresenceCurrentUserLocationDevice, "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  HULocationTriggerSelectedLocationItem *v7;
  void *v8;
  HULocationTriggerSelectedLocationItem *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E20], "set", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31840]), "initWithResultsBlock:", &__block_literal_global_217);
  -[HULocationTriggerEditorSummaryItemManager setUsersInstructionsItem:](self, "setUsersInstructionsItem:", v5);

  -[HULocationTriggerEditorSummaryItemManager usersInstructionsItem](self, "usersInstructionsItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

  v7 = [HULocationTriggerSelectedLocationItem alloc];
  -[HULocationTriggerEditorSummaryItemManager triggerBuilder](self, "triggerBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HULocationTriggerSelectedLocationItem initWithTriggerBuilder:](v7, "initWithTriggerBuilder:", v8);
  -[HULocationTriggerEditorSummaryItemManager setLocationItem:](self, "setLocationItem:", v9);

  -[HULocationTriggerEditorSummaryItemManager locationItem](self, "locationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", v4);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __72__HULocationTriggerEditorSummaryItemManager__buildItemProvidersForHome___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)objc_opt_new();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", &unk_1E70415D8, CFSTR("instructionsStyle"));
  _HULocalizedStringWithDefaultValue(CFSTR("HULocationTriggerEditorUserListSectionTitle"), CFSTR("HULocationTriggerEditorUserListSectionTitle"), 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v1, *MEMORY[0x1E0D30D18]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_buildItemModulesForHome:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99D20];
  -[HULocationTriggerEditorSummaryItemManager conditionEditorModule](self, "conditionEditorModule", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULocationTriggerEditorSummaryItemManager userPickerModule](self, "userPickerModule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithObjects:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = objc_alloc(MEMORY[0x1E0D31570]);
  +[HULocationTriggerEditorSummaryItemManager usersHeaderSectionID](HULocationTriggerEditorSummaryItemManager, "usersHeaderSectionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithIdentifier:", v7);

  -[HULocationTriggerEditorSummaryItemManager usersInstructionsItem](self, "usersInstructionsItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setItems:filteringToDisplayedItems:", v10, v4);

  objc_msgSend(v5, "addObject:", v8);
  -[HULocationTriggerEditorSummaryItemManager userPickerModule](self, "userPickerModule");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "buildSectionsWithDisplayedItems:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v12);

  v13 = objc_alloc(MEMORY[0x1E0D31570]);
  +[HULocationTriggerEditorSummaryItemManager locationSectionID](HULocationTriggerEditorSummaryItemManager, "locationSectionID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithIdentifier:", v14);

  -[HULocationTriggerEditorSummaryItemManager locationItem](self, "locationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setItems:filteringToDisplayedItems:", v17, v4);

  objc_msgSend(v5, "addObject:", v15);
  -[HULocationTriggerEditorSummaryItemManager conditionEditorModule](self, "conditionEditorModule");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "buildSectionsWithDisplayedItems:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObjectsFromArray:", v19);
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

  -[HULocationTriggerEditorSummaryItemManager triggerBuilder](self, "triggerBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationEventBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    return 1;
  -[HULocationTriggerEditorSummaryItemManager userPickerModule](self, "userPickerModule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presenceEventBuilder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "users");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager home](self, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resolveSelectedUsersWithHome:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99E60];
  -[HFItemManager home](self, "home");
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
  void *v14;
  char v15;

  -[HULocationTriggerEditorSummaryItemManager triggerBuilder](self, "triggerBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationEventBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    return 0;
  objc_opt_class();
  -[HULocationTriggerEditorSummaryItemManager triggerBuilder](self, "triggerBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "locationEventBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  -[HULocationTriggerEditorSummaryItemManager triggerBuilder](self, "triggerBuilder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "isRegionAtHome:", v14);

  v7 = v15 ^ 1;
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
  id v13;
  id v14;

  v14 = a4;
  if (!-[HULocationTriggerEditorSummaryItemManager _hasCustomLocation](self, "_hasCustomLocation")
    || (objc_msgSend(v14, "users"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "type"),
        v6,
        v7 != 1))
  {
    -[HULocationTriggerEditorSummaryItemManager triggerBuilder](self, "triggerBuilder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "locationInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLocationEventBuilder:", v14);

    v10 = (void *)MEMORY[0x1E0C99E60];
    -[HULocationTriggerEditorSummaryItemManager locationItem](self, "locationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HFItemManager updateResultsForItems:senderSelector:](self, "updateResultsForItems:senderSelector:", v12, a2);

  }
}

- (HFEventTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usersInstructionsItem, 0);
  objc_storeStrong((id *)&self->_locationItem, 0);
  objc_storeStrong((id *)&self->_conditionEditorModule, 0);
  objc_storeStrong((id *)&self->_userPickerModule, 0);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);
}

@end
