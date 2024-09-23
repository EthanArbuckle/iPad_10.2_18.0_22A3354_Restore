@implementation HFEventTriggerBuilder

- (HFEventTriggerBuilder)initWithExistingObject:(id)a3 inHome:(id)a4 context:(id)a5
{
  id v9;
  HFEventTriggerBuilder *v10;
  HFEventTriggerBuilder *v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  uint64_t v16;
  NSMutableDictionary *extensionInterfaces;
  void *v19;
  void *v20;
  objc_super v21;

  v9 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HFEventTriggerBuilder;
  v10 = -[HFTriggerBuilder initWithExistingObject:inHome:context:](&v21, sel_initWithExistingObject_inHome_context_, v9, a4, a5);
  v11 = v10;
  if (v10)
  {
    -[HFTriggerBuilder trigger](v10, "trigger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[HFTriggerBuilder trigger](v11, "trigger");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFTriggerBuilder trigger](v11, "trigger");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("HFEventTriggerBuilder.m"), 33, CFSTR("HFEventTriggerBuilder must be instantiated with an HMEventTrigger. Got: %@ instead"), v20);

      }
    }
    objc_msgSend(v9, "hf_effectiveRecurrences");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFEventTriggerBuilder setRecurrences:](v11, "setRecurrences:", v15);

    -[HFEventTriggerBuilder setExecuteOnce:](v11, "setExecuteOnce:", objc_msgSend(v9, "executeOnce"));
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    extensionInterfaces = v11->_extensionInterfaces;
    v11->_extensionInterfaces = (NSMutableDictionary *)v16;

    -[HFEventTriggerBuilder _createEventBuilders](v11, "_createEventBuilders");
  }

  return v11;
}

- (void)addEventBuilder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFEventTriggerBuilder mutableEventBuilders](self, "mutableEventBuilders");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeAddObject:", v4);

}

- (void)removeEventBuilder:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[HFEventTriggerBuilder mutableEventBuilders](self, "mutableEventBuilders");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v4);

  }
}

- (void)applyEventBuilderDiff:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v4 = a3;
  objc_msgSend(v4, "additions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__HFEventTriggerBuilder_applyEventBuilderDiff___block_invoke;
  v9[3] = &unk_1EA729BE0;
  v9[4] = self;
  objc_msgSend(v5, "na_each:", v9);

  objc_msgSend(v4, "deletions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __47__HFEventTriggerBuilder_applyEventBuilderDiff___block_invoke_2;
  v8[3] = &unk_1EA729BE0;
  v8[4] = self;
  objc_msgSend(v7, "na_each:", v8);

}

uint64_t __47__HFEventTriggerBuilder_applyEventBuilderDiff___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addEventBuilder:", a2);
}

uint64_t __47__HFEventTriggerBuilder_applyEventBuilderDiff___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeEventBuilder:", a2);
}

- (NSArray)eventBuilders
{
  void *v2;
  void *v3;

  -[HFEventTriggerBuilder mutableEventBuilders](self, "mutableEventBuilders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSSet)characteristics
{
  void *v2;
  void *v3;

  -[HFEventTriggerBuilder mutableEventBuilders](self, "mutableEventBuilders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_28);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

id __40__HFEventTriggerBuilder_characteristics__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "characteristic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setRecurrences:(id)a3
{
  NSArray *v4;
  BOOL v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSArray *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSArray *recurrences;
  NSArray *v18;
  NSUInteger v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)a3;
  v5 = (-[NSArray na_all:](v4, "na_all:", &__block_literal_global_9) & 1) != 0 || -[NSArray count](v4, "count") == 0;
  if (-[NSArray count](v4, "count") == 1
    && (-[NSArray firstObject](v4, "firstObject"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(MEMORY[0x1E0C99D78], "hf_dailyIntervalComponents"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "hf_isEqualToHomeKitRecurrence:", v7),
        v7,
        v6,
        v8))
  {
    HFLogForCategory(0x28uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[HFEventTriggerBuilder recurrences](self, "recurrences");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFTriggerBuilder name](self, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412546;
      v21 = v10;
      v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Reset recurrences: %@ to weekday components for trigger with name: %@", (uint8_t *)&v20, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0C99D78], "hf_dailyWeekdayIntervalComponents");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = v4;
    if (v5)
      goto LABEL_14;
    HFLogForCategory(0x28uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[HFEventTriggerBuilder recurrences](self, "recurrences");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFTriggerBuilder name](self, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412546;
      v21 = v15;
      v22 = 2112;
      v23 = v16;
      _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "Filtered to recurrences: %@ for trigger with name: %@", (uint8_t *)&v20, 0x16u);

    }
    -[NSArray na_filter:](v4, "na_filter:", &__block_literal_global_9);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (NSArray *)v12;

LABEL_14:
  recurrences = self->_recurrences;
  self->_recurrences = v13;
  v18 = v13;

  v19 = -[NSArray count](self->_recurrences, "count");
  if (v19)
    self->_executeOnce = 0;

}

BOOL __40__HFEventTriggerBuilder_setRecurrences___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "weekday") >= 1 && objc_msgSend(v2, "weekday") < 8;

  return v3;
}

- (NSSet)eventTypes
{
  NSSet *eventTypes;
  NSSet *v3;
  void *v4;

  eventTypes = self->_eventTypes;
  if (eventTypes)
  {
    v3 = eventTypes;
  }
  else
  {
    -[HFEventTriggerBuilder mutableEventBuilders](self, "mutableEventBuilders");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_map:", &__block_literal_global_11);
    v3 = (NSSet *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

uint64_t __35__HFEventTriggerBuilder_eventTypes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "eventType");
}

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (BOOL)supportsConditions
{
  return 1;
}

- (BOOL)supportsEndEvents
{
  return 1;
}

- (id)validationError
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFEventTriggerBuilder;
  -[HFTriggerBuilder validationError](&v8, sel_validationError);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[HFItemBuilder verifyProperty:matchesCondition:description:](self, "verifyProperty:matchesCondition:description:", CFSTR("mutableEventBuilders"), &__block_literal_global_17, CFSTR("List of events cannot be empty"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

BOOL __40__HFEventTriggerBuilder_validationError__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "count") != 0;
}

- (BOOL)requiresConfirmationToRun
{
  void *v3;
  int v4;
  void *v5;
  char v6;

  -[HFEventTriggerBuilder mutableEventBuilders](self, "mutableEventBuilders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_21_0);

  if (!v4)
    return 0;
  -[HFEventTriggerBuilder _allActionSets](self, "_allActionSets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_67);

  return v6;
}

uint64_t __50__HFEventTriggerBuilder_requiresConfirmationToRun__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", &unk_1F03FF648);
}

uint64_t __50__HFEventTriggerBuilder_requiresConfirmationToRun__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "requiresDeviceUnlock");
}

- (id)naturalLanguageNameOfType:(unint64_t)a3
{
  unint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  if (a3 != 4)
    goto LABEL_5;
  -[HFTriggerBuilder context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "triggerContextAwareTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v3 = 1;
LABEL_5:
    -[HFItemBuilder home](self, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFTriggerNaturalLanguageOptions optionsWithHome:nameType:](HFTriggerNaturalLanguageOptions, "optionsWithHome:nameType:", v7, v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFEventTriggerBuilder naturalLanguageNameWithOptions:](self, "naturalLanguageNameWithOptions:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  -[HFTriggerBuilder context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "triggerContextAwareTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v8;
}

- (id)naturalLanguageNameWithOptions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[HFTriggerBuilder trigger](self, "trigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "creator");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[HFItemBuilder home](self, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentUser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_4;
    -[HFTriggerBuilder trigger](self, "trigger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFTriggerBuilder trigger](self, "trigger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "creator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemBuilder home](self, "home");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "currentUser");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Unexpected nil user from the trigger %@ %@ %@"), v5, v14, v16);

  }
  v7 = (void *)v6;
LABEL_4:
  v9 = (void *)MEMORY[0x1E0CBA4D0];
  -[HFEventTriggerBuilder createEvents](self, "createEvents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hf_naturalLanguageNameWithOptions:events:forUser:", v4, v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)naturalLanguageDetailsWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[HFTriggerBuilder endEventBuilders](self, "endEventBuilders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_flatMap:", &__block_literal_global_72_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CBA4D0];
  -[HFEventTriggerBuilder recurrences](self, "recurrences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFTriggerBuilder conditionCollection](self, "conditionCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_naturalLanguageDetailsWithRecurrences:conditions:endEvents:withOptions:", v8, v9, v6, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __59__HFEventTriggerBuilder_naturalLanguageDetailsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "buildNewEventsFromCurrentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)deleteTrigger
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  id (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;

  -[HFItemBuilder home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFTriggerBuilder trigger](self, "trigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFTriggerBuilder trigger](self, "trigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFTriggerBuilder context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unsupportedTriggers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __38__HFEventTriggerBuilder_deleteTrigger__block_invoke;
    v29[3] = &unk_1EA729DA8;
    v11 = v7;
    v30 = v11;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v29);

    v24 = v10;
    v25 = 3221225472;
    v26 = __38__HFEventTriggerBuilder_deleteTrigger__block_invoke_2;
    v27 = &unk_1EA729DD0;
    v28 = v3;
    objc_msgSend(v11, "na_map:", &v24);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allObjects", v24, v25, v26, v27);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    -[HFTriggerBuilder trigger](self, "trigger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;
    objc_msgSend(v16, "hf_unmarkTriggerAsHomeAppCreated");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v19 = v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v19;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObjectsFromArray:", v13);
    objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

uint64_t __38__HFEventTriggerBuilder_deleteTrigger__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

id __38__HFEventTriggerBuilder_deleteTrigger__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__HFEventTriggerBuilder_deleteTrigger__block_invoke_3;
  v8[3] = &unk_1EA728590;
  v9 = *(id *)(a1 + 32);
  v10 = v3;
  v5 = v3;
  objc_msgSend(v4, "futureWithErrorOnlyHandlerAdapterBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __38__HFEventTriggerBuilder_deleteTrigger__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeTrigger:completionHandler:", *(_QWORD *)(a1 + 40), a2);
}

- (void)removeServiceLikeItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HFEventTriggerBuilder;
  v4 = a3;
  -[HFTriggerBuilder removeServiceLikeItem:](&v14, sel_removeServiceLikeItem_, v4);
  objc_msgSend(v4, "services");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "na_flatMap:", &__block_literal_global_82);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFEventTriggerBuilder mutableEventBuilders](self, "mutableEventBuilders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__HFEventTriggerBuilder_removeServiceLikeItem___block_invoke_2;
  v12[3] = &unk_1EA729E18;
  v13 = v6;
  v9 = v6;
  objc_msgSend(v7, "na_filter:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __47__HFEventTriggerBuilder_removeServiceLikeItem___block_invoke_3;
  v11[3] = &unk_1EA729BE0;
  v11[4] = self;
  objc_msgSend(v10, "na_each:", v11);

}

id __47__HFEventTriggerBuilder_removeServiceLikeItem___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __47__HFEventTriggerBuilder_removeServiceLikeItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1F03F70F0))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = v5;
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "characteristic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsObject:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __47__HFEventTriggerBuilder_removeServiceLikeItem___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "mutableEventBuilders");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v3);

}

- (id)lazilyFinishCommitingTrigger
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__HFEventTriggerBuilder_lazilyFinishCommitingTrigger__block_invoke;
  v3[3] = &unk_1EA728A78;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0D519C0], "lazyFutureWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __53__HFEventTriggerBuilder_lazilyFinishCommitingTrigger__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D519C0];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "_lazilyMarkTriggerAsHomeAppCreated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(*(id *)(a1 + 32), "_updateExecuteOnce");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chainFutures:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "completionHandlerAdapter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (id)objc_msgSend(v9, "addCompletionBlock:", v10);
}

- (id)commitCreateTrigger
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];

  -[HFEventTriggerBuilder _lazy_performValidation](self, "_lazy_performValidation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__HFEventTriggerBuilder_commitCreateTrigger__block_invoke;
  v11[3] = &unk_1EA726940;
  v11[4] = self;
  objc_msgSend(v3, "flatMap:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __44__HFEventTriggerBuilder_commitCreateTrigger__block_invoke_2;
  v10[3] = &unk_1EA726338;
  v10[4] = self;
  v6 = (id)objc_msgSend(v5, "addSuccessBlock:", v10);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __44__HFEventTriggerBuilder_commitCreateTrigger__block_invoke_96;
  v9[3] = &unk_1EA726968;
  v9[4] = self;
  v7 = (id)objc_msgSend(v5, "addFailureBlock:", v9);
  return v5;
}

id __44__HFEventTriggerBuilder_commitCreateTrigger__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = objc_alloc(MEMORY[0x1E0CBA4D0]);
  objc_msgSend(*(id *)(a1 + 32), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "createEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recurrences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithName:events:endEvents:recurrences:predicate:", v3, v4, 0, v5, 0);
  objc_msgSend(*(id *)(a1 + 32), "setTrigger:", v6);

  v7 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(*(id *)(a1 + 32), "trigger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "futureWithResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __44__HFEventTriggerBuilder_commitCreateTrigger__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x28uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "Created event trigger with name:%@", (uint8_t *)&v4, 0xCu);

  }
}

void __44__HFEventTriggerBuilder_commitCreateTrigger__block_invoke_96(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Failed to create event trigger with name:%@. Error: %@", (uint8_t *)&v6, 0x16u);

  }
}

- (id)commitEditTrigger
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];

  -[HFEventTriggerBuilder _lazy_performValidation](self, "_lazy_performValidation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__HFEventTriggerBuilder_commitEditTrigger__block_invoke;
  v11[3] = &unk_1EA726940;
  v11[4] = self;
  objc_msgSend(v3, "flatMap:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __42__HFEventTriggerBuilder_commitEditTrigger__block_invoke_2;
  v10[3] = &unk_1EA726940;
  v10[4] = self;
  objc_msgSend(v5, "flatMap:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __42__HFEventTriggerBuilder_commitEditTrigger__block_invoke_3;
  v9[3] = &unk_1EA726940;
  v9[4] = self;
  objc_msgSend(v6, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __42__HFEventTriggerBuilder_commitEditTrigger__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateEvents");
}

uint64_t __42__HFEventTriggerBuilder_commitEditTrigger__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateRecurrences");
}

uint64_t __42__HFEventTriggerBuilder_commitEditTrigger__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateExecuteOnce");
}

- (id)createEvents
{
  void *v2;
  void *v3;
  void *v4;

  -[HFEventTriggerBuilder mutableEventBuilders](self, "mutableEventBuilders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_flatMap:", &__block_literal_global_99);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __37__HFEventTriggerBuilder_createEvents__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "buildNewEventsFromCurrentState");
}

- (id)createEndEvents
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HFTriggerBuilder endEventBuilders](self, "endEventBuilders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_flatMap:", &__block_literal_global_100_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __40__HFEventTriggerBuilder_createEndEvents__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "buildNewEventsFromCurrentState");
}

- (id)_updateEvents
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  HFEventTriggerBuilder *v20;

  v3 = objc_opt_class();
  -[HFTriggerBuilder trigger](self, "trigger");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v3, objc_opt_class());

LABEL_7:
    v6 = 0;
  }

  v9 = (void *)MEMORY[0x1E0D519C0];
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __38__HFEventTriggerBuilder__updateEvents__block_invoke;
  v18[3] = &unk_1EA728590;
  v19 = v6;
  v20 = self;
  v11 = v6;
  objc_msgSend(v9, "futureWithErrorOnlyHandlerAdapterBlock:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __38__HFEventTriggerBuilder__updateEvents__block_invoke_2;
  v17[3] = &unk_1EA726338;
  v17[4] = self;
  objc_msgSend(v12, "addSuccessBlock:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __38__HFEventTriggerBuilder__updateEvents__block_invoke_101;
  v16[3] = &unk_1EA726968;
  v16[4] = self;
  objc_msgSend(v13, "addFailureBlock:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __38__HFEventTriggerBuilder__updateEvents__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "createEvents");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateEvents:completionHandler:", v5, v4);

}

void __38__HFEventTriggerBuilder__updateEvents__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x28uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "mutableEventBuilders");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hf_prettyDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "Updated events: %@ from trigger with name: %@", (uint8_t *)&v6, 0x16u);

  }
}

void __38__HFEventTriggerBuilder__updateEvents__block_invoke_101(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "mutableEventBuilders");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_prettyDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Failed to update events: %@ from trigger with name: %@. Error: %@", (uint8_t *)&v8, 0x20u);

  }
}

- (id)_updateExecuteOnce
{
  BOOL v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[5];
  BOOL v12;
  _QWORD v13[5];
  BOOL v14;
  _QWORD v15[5];
  BOOL v16;

  v3 = -[HFEventTriggerBuilder _effectiveExecuteOnce](self, "_effectiveExecuteOnce");
  -[HFEventTriggerBuilder eventTypes](self, "eventTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", CFSTR("HFEventTypeTime"));

  if ((v5 & 1) != 0)
  {
    v6 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __43__HFEventTriggerBuilder__updateExecuteOnce__block_invoke;
    v15[3] = &unk_1EA729EA0;
    v15[4] = self;
    v16 = v3;
    objc_msgSend(MEMORY[0x1E0D519C0], "lazyFutureWithBlock:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __43__HFEventTriggerBuilder__updateExecuteOnce__block_invoke_3;
    v13[3] = &unk_1EA729EC8;
    v14 = v3;
    v13[4] = self;
    v8 = (id)objc_msgSend(v7, "addSuccessBlock:", v13);
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __43__HFEventTriggerBuilder__updateExecuteOnce__block_invoke_102;
    v11[3] = &unk_1EA729EF0;
    v12 = v3;
    v11[4] = self;
    v9 = (id)objc_msgSend(v7, "addFailureBlock:", v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

void __43__HFEventTriggerBuilder__updateExecuteOnce__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "trigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(unsigned __int8 *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__HFEventTriggerBuilder__updateExecuteOnce__block_invoke_2;
  v7[3] = &unk_1EA726968;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "updateExecuteOnce:completionHandler:", v5, v7);

}

uint64_t __43__HFEventTriggerBuilder__updateExecuteOnce__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishWithError:", a2);
  else
    return objc_msgSend(v2, "finishWithNoResult");
}

void __43__HFEventTriggerBuilder__updateExecuteOnce__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  int v3;
  void *v4;
  _DWORD v5[2];
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x28uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = 67109378;
    v5[1] = v3;
    v6 = 2112;
    v7 = v4;
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "Updated execute once: %d for trigger with name: %@", (uint8_t *)v5, 0x12u);

  }
}

void __43__HFEventTriggerBuilder__updateExecuteOnce__block_invoke_102(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  void *v6;
  _DWORD v7[2];
  __int16 v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(unsigned __int8 *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = 67109634;
    v7[1] = v5;
    v8 = 2112;
    v9 = v6;
    v10 = 2112;
    v11 = v3;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Failed to update execute once: %d for trigger with name: %@. Error: %@", (uint8_t *)v7, 0x1Cu);

  }
}

- (id)_updateRecurrences
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  id v14;

  -[HFEventTriggerBuilder recurrences](self, "recurrences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D519C0];
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __43__HFEventTriggerBuilder__updateRecurrences__block_invoke;
  v13[3] = &unk_1EA729F18;
  v13[4] = self;
  v14 = v3;
  v6 = v3;
  objc_msgSend(v4, "lazyFutureWithBlock:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __43__HFEventTriggerBuilder__updateRecurrences__block_invoke_3;
  v12[3] = &unk_1EA726338;
  v12[4] = self;
  v8 = (id)objc_msgSend(v7, "addSuccessBlock:", v12);
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __43__HFEventTriggerBuilder__updateRecurrences__block_invoke_103;
  v11[3] = &unk_1EA726968;
  v11[4] = self;
  v9 = (id)objc_msgSend(v7, "addFailureBlock:", v11);

  return v7;
}

void __43__HFEventTriggerBuilder__updateRecurrences__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "trigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__HFEventTriggerBuilder__updateRecurrences__block_invoke_2;
  v7[3] = &unk_1EA726968;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "updateRecurrences:completionHandler:", v5, v7);

}

uint64_t __43__HFEventTriggerBuilder__updateRecurrences__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishWithError:", a2);
  else
    return objc_msgSend(v2, "finishWithNoResult");
}

void __43__HFEventTriggerBuilder__updateRecurrences__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x28uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "recurrences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412546;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "Updated recurrences: %@ for trigger with name: %@", (uint8_t *)&v5, 0x16u);

  }
}

void __43__HFEventTriggerBuilder__updateRecurrences__block_invoke_103(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "recurrences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412802;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = v3;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Failed to update recurrences: %@ for trigger with name: %@. Error: %@", (uint8_t *)&v7, 0x20u);

  }
}

- (id)_lazy_performValidation
{
  return -[HFItemBuilder lazy_verifyProperty:matchesCondition:description:](self, "lazy_verifyProperty:matchesCondition:description:", CFSTR("mutableEventBuilders"), &__block_literal_global_104, CFSTR("List of events cannot be empty"));
}

BOOL __48__HFEventTriggerBuilder__lazy_performValidation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "count") != 0;
}

- (id)_lazilyMarkTriggerAsHomeAppCreated
{
  void *v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0D519C0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__HFEventTriggerBuilder__lazilyMarkTriggerAsHomeAppCreated__block_invoke;
  v5[3] = &unk_1EA729F60;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v2, "lazyFutureWithBlock:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __59__HFEventTriggerBuilder__lazilyMarkTriggerAsHomeAppCreated__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  objc_msgSend(WeakRetained, "trigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if ((objc_msgSend(WeakRetained, "shouldMarkTriggerAsHomeAppCreated") & 1) != 0)
    objc_msgSend(v6, "hf_markTriggerAsHomeAppCreated");
  else
    objc_msgSend(v6, "hf_unmarkTriggerAsHomeAppCreated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v10, "completionHandlerAdapter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v7, "addCompletionBlock:", v8);

  }
  else
  {
    objc_msgSend(v10, "finishWithNoResult");
  }

}

- (BOOL)_effectiveExecuteOnce
{
  void *v3;
  BOOL v4;
  void *v5;

  -[HFEventTriggerBuilder recurrences](self, "recurrences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = -[HFEventTriggerBuilder executeOnce](self, "executeOnce");
  }
  else
  {
    -[HFEventTriggerBuilder eventTypes](self, "eventTypes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (objc_msgSend(v5, "containsObject:", CFSTR("HFEventTypeTime")) & 1) != 0
      || -[HFEventTriggerBuilder executeOnce](self, "executeOnce");

  }
  return v4;
}

- (id)_allActionSets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HFTriggerBuilder triggerActionSets](self, "triggerActionSets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "namedActionSets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFTriggerBuilder triggerActionSets](self, "triggerActionSets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anonymousActionSetBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_createEventBuilders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFEventTriggerBuilder setMutableEventBuilders:](self, "setMutableEventBuilders:", v3);

  -[HFTriggerBuilder trigger](self, "trigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "events");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v5, "mutableCopy");

  -[HFTriggerBuilder trigger](self, "trigger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "events");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_map:", &__block_literal_global_106_1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFEventTriggerBuilder mutableEventBuilders](self, "mutableEventBuilders");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemBuilder home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFCharacteristicEventBuilder characteristicEventBuildersForEvents:inHome:](HFCharacteristicEventBuilder, "characteristicEventBuildersForEvents:inHome:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v11);

  objc_msgSend(v12, "removeObjectsInArray:", v8);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __45__HFEventTriggerBuilder__createEventBuilders__block_invoke_2;
  v13[3] = &unk_1EA729FC8;
  v13[4] = self;
  objc_msgSend(v12, "na_each:", v13);

}

id __45__HFEventTriggerBuilder__createEventBuilders__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1F03F70F0))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

void __45__HFEventTriggerBuilder__createEventBuilders__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  +[HFEventBuilder eventBuilderForEvent:](HFEventBuilder, "eventBuilderForEvent:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    NSLog(CFSTR("Failed to create builder for event: %@"), v5);
  objc_msgSend(*(id *)(a1 + 32), "mutableEventBuilders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeAddObject:", v3);

}

- (NSArray)recurrences
{
  return self->_recurrences;
}

- (BOOL)executeOnce
{
  return self->_executeOnce;
}

- (void)setExecuteOnce:(BOOL)a3
{
  self->_executeOnce = a3;
}

- (BOOL)shouldMarkTriggerAsHomeAppCreated
{
  return self->_shouldMarkTriggerAsHomeAppCreated;
}

- (void)setShouldMarkTriggerAsHomeAppCreated:(BOOL)a3
{
  self->_shouldMarkTriggerAsHomeAppCreated = a3;
}

- (NSMutableSet)mutableEventBuilders
{
  return self->_mutableEventBuilders;
}

- (void)setMutableEventBuilders:(id)a3
{
  objc_storeStrong((id *)&self->_mutableEventBuilders, a3);
}

- (NSMutableDictionary)extensionInterfaces
{
  return self->_extensionInterfaces;
}

- (void)setExtensionInterfaces:(id)a3
{
  objc_storeStrong((id *)&self->_extensionInterfaces, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionInterfaces, 0);
  objc_storeStrong((id *)&self->_mutableEventBuilders, 0);
  objc_storeStrong((id *)&self->_recurrences, 0);
  objc_storeStrong((id *)&self->_eventTypes, 0);
}

- (id)createNewTriggerBuilder
{
  void *v2;
  void *v3;

  -[HFItemBuilder home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newEventTriggerBuilder");

  return v3;
}

- (id)updateTriggerBuilder:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  objc_super v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HFEventTriggerBuilder;
  -[HFTriggerBuilder updateTriggerBuilder:](&v24, sel_updateTriggerBuilder_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v7 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    -[HFEventTriggerBuilder createEvents](self, "createEvents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEvents:", v10);

    -[HFEventTriggerBuilder createEndEvents](self, "createEndEvents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEndEvents:", v11);

    -[HFEventTriggerBuilder recurrences](self, "recurrences");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRecurrences:", v12);

    objc_msgSend(v9, "setExecuteOnce:", -[HFEventTriggerBuilder _effectiveExecuteOnce](self, "_effectiveExecuteOnce"));
    v13 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __66__HFEventTriggerBuilder_AutomationBuilders__updateTriggerBuilder___block_invoke;
    v23[3] = &unk_1EA7279F8;
    v23[4] = self;
    __66__HFEventTriggerBuilder_AutomationBuilders__updateTriggerBuilder___block_invoke((uint64_t)v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPredicate:", v14);

    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = __66__HFEventTriggerBuilder_AutomationBuilders__updateTriggerBuilder___block_invoke_2;
    v21[3] = &unk_1EA730ED0;
    v21[4] = self;
    v22 = v9;
    __66__HFEventTriggerBuilder_AutomationBuilders__updateTriggerBuilder___block_invoke_2((uint64_t)v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0D519C0];
    v25[0] = v6;
    v25[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "combineAllFutures:", v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@:%@ passed a HM trigger builder that isn't an event trigger builder: %@"), self, v19, v7);

    v18 = v6;
  }

  return v18;
}

id __66__HFEventTriggerBuilder_AutomationBuilders__updateTriggerBuilder___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  if (objc_msgSend(*(id *)(a1 + 32), "supportsConditions"))
  {
    objc_msgSend(*(id *)(a1 + 32), "conditionCollection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "predicate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id __66__HFEventTriggerBuilder_AutomationBuilders__updateTriggerBuilder___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "shouldMarkTriggerAsHomeAppCreated");
  v3 = *(void **)(a1 + 40);
  if (v2)
    objc_msgSend(v3, "hf_markTriggerAsHomeAppCreated");
  else
    objc_msgSend(v3, "hf_unmarkTriggerAsHomeAppCreated");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (HFCharacteristicTriggerBuilderInterface)characteristicInterface
{
  void *v3;
  void *v4;
  void *v5;

  -[HFEventTriggerBuilder extensionInterfaces](self, "extensionInterfaces");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("characteristicInterface"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[HFEventTriggerBuilderInterface interfaceWithBuilder:](HFCharacteristicTriggerBuilderInterface, "interfaceWithBuilder:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFEventTriggerBuilder extensionInterfaces](self, "extensionInterfaces");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("characteristicInterface"));

  }
  return (HFCharacteristicTriggerBuilderInterface *)v4;
}

- (HFEventBuilderLocationInterface)locationInterface
{
  void *v3;
  void *v4;
  void *v5;

  -[HFEventTriggerBuilder extensionInterfaces](self, "extensionInterfaces");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("locationInterface"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[HFEventTriggerBuilderInterface interfaceWithBuilder:](HFEventBuilderLocationInterface, "interfaceWithBuilder:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFEventTriggerBuilder extensionInterfaces](self, "extensionInterfaces");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("locationInterface"));

  }
  return (HFEventBuilderLocationInterface *)v4;
}

- (HFEventTriggerBuilderTimeInterface)timeInterface
{
  void *v3;
  void *v4;
  void *v5;

  -[HFEventTriggerBuilder extensionInterfaces](self, "extensionInterfaces");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("timeInterface"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[HFEventTriggerBuilderInterface interfaceWithBuilder:](HFEventTriggerBuilderTimeInterface, "interfaceWithBuilder:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFEventTriggerBuilder extensionInterfaces](self, "extensionInterfaces");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("timeInterface"));

  }
  return (HFEventTriggerBuilderTimeInterface *)v4;
}

- (id)compareToObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HFEventTriggerBuilder;
  -[HFTriggerBuilder compareToObject:](&v10, sel_compareToObject_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsCriticalDifference") & 1) == 0)
  {
    -[HFEventTriggerBuilder eventBuilders](self, "eventBuilders");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventBuilders");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFContainedObjectListDifference containedObjectDifferenceWithKey:objectsA:objectsB:](HFContainedObjectListDifference, "containedObjectDifferenceWithKey:objectsA:objectsB:", CFSTR("eventBuilders"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "add:", v8);

  }
  return v5;
}

@end
