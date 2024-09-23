@implementation HFTriggerBuilder

- (id)getOrCreateTriggerBuilder
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  -[HFTriggerBuilder trigger](self, "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "hf_copyAsBuilder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v7 = 0;
      goto LABEL_7;
    }
    +[HFTriggerBuilderPair updatingTrigger:withBuilder:](HFTriggerBuilderPair, "updatingTrigger:withBuilder:", v4, v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HFTriggerBuilder createNewTriggerBuilder](self, "createNewTriggerBuilder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFTriggerBuilderPair creatingTriggerWithBuilder:](HFTriggerBuilderPair, "creatingTriggerWithBuilder:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
LABEL_7:

  return v7;
}

- (id)createNewTriggerBuilder
{
  return 0;
}

- (id)updateTriggerBuilder:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFTriggerBuilder name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:isConfigured:", v5, -[HFTriggerBuilder nameIsConfigured](self, "nameIsConfigured"));

  objc_msgSend(v4, "setEnabled:", -[HFTriggerBuilder enabled](self, "enabled"));
  -[HFTriggerBuilder triggerActionSets](self, "triggerActionSets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateActionSetsInTriggerBuilder:", v4);

  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

+ (id)triggerBuilderForTrigger:(id)a3 inHome:(id)a4 context:(id)a5
{
  return (id)objc_msgSend(a1, "triggerBuilderForTrigger:inHome:context:assertsFailure:", a3, a4, a5, 1);
}

+ (id)triggerBuilderForTrigger:(id)a3 inHome:(id)a4 context:(id)a5 assertsFailure:(BOOL)a6
{
  _BOOL4 v6;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  objc_class *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  id (*v21)(uint64_t);
  void *v22;
  id v23;
  uint64_t v24;
  SEL v25;
  id v26;
  BOOL v27;

  v6 = a6;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (objc_msgSend(v11, "conformsToProtocol:", &unk_1F04502A0))
    v14 = objc_msgSend(v11, "hf_triggerType");
  else
    v14 = 0;
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __75__HFTriggerBuilder_triggerBuilderForTrigger_inHome_context_assertsFailure___block_invoke;
  v22 = &unk_1EA73DD48;
  v24 = v14;
  v15 = v11;
  v27 = v6;
  v23 = v15;
  v25 = a2;
  v26 = a1;
  v16 = (objc_class *)__75__HFTriggerBuilder_triggerBuilderForTrigger_inHome_context_assertsFailure___block_invoke((uint64_t)&v19);
  if (v16 || v6)
  {
    v17 = (void *)objc_msgSend([v16 alloc], "initWithExistingObject:inHome:context:", v15, v12, v13);
    if (!v17)
      NSLog(CFSTR("Could not create trigger builder from trigger: %@"), v15, v19, v20, v21, v22);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

id __75__HFTriggerBuilder_triggerBuilderForTrigger_inHome_context_assertsFailure___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v5;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1 == 7 || v1 == 1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), CFSTR("HFTriggerBuilder.m"), 84, CFSTR("Unexpected trigger type %d"), *(_QWORD *)(a1 + 40));

    }
    v3 = 0;
  }
  return v3;
}

- (BOOL)supportsConditions
{
  return 0;
}

- (BOOL)supportsEndEvents
{
  return 0;
}

- (BOOL)supportsHomeKitAutomationBuilders
{
  return 0;
}

- (HFTriggerBuilder)initWithHome:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_context_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFTriggerBuilder.m"), 119, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFTriggerBuilder initWithHome:]",
    v6);

  return 0;
}

- (HFTriggerBuilder)initWithHome:(id)a3 context:(id)a4
{
  id v6;
  HFTriggerBuilder *v7;
  HFTriggerBuilder *v8;

  v6 = a4;
  v7 = -[HFTriggerBuilder initWithExistingObject:inHome:context:](self, "initWithExistingObject:inHome:context:", 0, a3, v6);
  v8 = v7;
  if (v7)
    -[HFTriggerBuilder setContext:](v7, "setContext:", v6);

  return v8;
}

- (HFTriggerBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithExistingObject_inHome_context_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFTriggerBuilder.m"), 132, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFTriggerBuilder initWithExistingObject:inHome:]",
    v7);

  return 0;
}

- (HFTriggerBuilder)initWithExistingObject:(id)a3 inHome:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  HFTriggerBuilder *v10;
  HFTriggerBuilder *v11;
  HFTriggerActionSetsBuilder *v12;
  void *v13;
  void *v14;
  HFTriggerActionSetsBuilder *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  HFConditionCollection *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HFMutableSetDiff *v27;
  void *v28;
  HFMutableSetDiff *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v39;

  v8 = a4;
  v9 = a5;
  v39.receiver = self;
  v39.super_class = (Class)HFTriggerBuilder;
  v10 = -[HFItemBuilder initWithExistingObject:inHome:](&v39, sel_initWithExistingObject_inHome_, a3, v8);
  v11 = v10;
  if (v10)
  {
    -[HFTriggerBuilder setContext:](v10, "setContext:", v9);
    v12 = [HFTriggerActionSetsBuilder alloc];
    -[HFTriggerBuilder trigger](v11, "trigger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "actionSets");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HFTriggerActionSetsBuilder initWithActionSets:inHome:filterEmptyActionSets:](v12, "initWithActionSets:inHome:filterEmptyActionSets:", v14, v8, objc_msgSend(v9, "filtersEmptyActionSets"));
    -[HFTriggerBuilder setTriggerActionSets:](v11, "setTriggerActionSets:", v15);

    objc_opt_class();
    -[HFTriggerBuilder trigger](v11, "trigger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v18 = v17;

    objc_msgSend(v18, "predicate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v18, "predicate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[HFConditionCollection conditionCollectionForPredicate:](HFConditionCollection, "conditionCollectionForPredicate:", v20);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = [HFConditionCollection alloc];
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[HFConditionCollection initWithConditions:](v22, "initWithConditions:", v20);
    }
    v23 = (void *)v21;
    -[HFTriggerBuilder setConditionCollection:](v11, "setConditionCollection:", v21);

    objc_msgSend(v18, "endEvents");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v18, "endEvents");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "na_map:", &__block_literal_global_207);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v27 = [HFMutableSetDiff alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[HFMutableSetDiff initWithFromSet:](v27, "initWithFromSet:", v28);
    -[HFTriggerBuilder setEndEventBuildersDiff:](v11, "setEndEventBuildersDiff:", v29);

    -[HFTriggerBuilder trigger](v11, "trigger");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "configuredName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      -[HFTriggerBuilder setName:](v11, "setName:", v31);
    }
    else
    {
      -[HFTriggerBuilder trigger](v11, "trigger");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "name");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFTriggerBuilder setName:](v11, "setName:", v33);

    }
    -[HFTriggerBuilder trigger](v11, "trigger");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "configuredName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFTriggerBuilder setNameIsConfigured:](v11, "setNameIsConfigured:", v35 != 0);

    -[HFTriggerBuilder trigger](v11, "trigger");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      -[HFTriggerBuilder trigger](v11, "trigger");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFTriggerBuilder setEnabled:](v11, "setEnabled:", objc_msgSend(v37, "isEnabled"));

    }
    else
    {
      -[HFTriggerBuilder setEnabled:](v11, "setEnabled:", 1);
    }

  }
  return v11;
}

id __58__HFTriggerBuilder_initWithExistingObject_inHome_context___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HFEventBuilder eventBuilderForEvent:](HFEventBuilder, "eventBuilderForEvent:", a2);
}

- (NSString)displayName
{
  NSString *displayName;
  NSString *v4;
  NSString *v5;

  displayName = self->_displayName;
  if (!displayName)
  {
    -[HFTriggerBuilder naturalLanguageNameOfType:](self, "naturalLanguageNameOfType:", 2);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_displayName;
    self->_displayName = v4;

    displayName = self->_displayName;
  }
  return displayName;
}

- (void)addEndEventBuilder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[HFTriggerBuilder supportsEndEvents](self, "supportsEndEvents"))
    NSLog(CFSTR("Attempt to add an end event builder (%@) on a trigger builder class that doesn't support it (%@)"), v5, self);
  -[HFTriggerBuilder endEventBuildersDiff](self, "endEventBuildersDiff");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

- (void)updateEndEventBuilder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFTriggerBuilder endEventBuildersDiff](self, "endEventBuildersDiff");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateObject:", v4);

}

- (void)removeEndEventBuilder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFTriggerBuilder endEventBuildersDiff](self, "endEventBuildersDiff");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteObject:", v4);

}

- (void)removeAllEndEventBuilders
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[HFTriggerBuilder endEventBuilders](self, "endEventBuilders", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[HFTriggerBuilder removeEndEventBuilder:](self, "removeEndEventBuilder:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)removeServiceLikeItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;

  v4 = a3;
  objc_msgSend(v4, "services");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_flatMap:", &__block_literal_global_75_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v4, "homeKitObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    objc_msgSend(v9, "services");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "na_flatMap:", &__block_literal_global_78_0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setByAddingObjectsFromArray:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v12;
  }
  objc_opt_class();
  v26 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v26;
  else
    v13 = 0;
  v14 = v13;

  objc_msgSend(v14, "mediaProfileContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFTriggerBuilder triggerActionSets](self, "triggerActionSets");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "anonymousActionSetBuilder");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "actionBuilders");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "toSet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __42__HFTriggerBuilder_removeServiceLikeItem___block_invoke_3;
  v29[3] = &unk_1EA73DDD0;
  v30 = v6;
  v31 = v15;
  v21 = v17;
  v32 = v21;
  v22 = v6;
  v23 = v15;
  objc_msgSend(v19, "na_map:", v29);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v20;
  v27[1] = 3221225472;
  v27[2] = __42__HFTriggerBuilder_removeServiceLikeItem___block_invoke_4;
  v27[3] = &unk_1EA72C4F8;
  v28 = v21;
  v25 = v21;
  objc_msgSend(v24, "na_each:", v27);

}

id __42__HFTriggerBuilder_removeServiceLikeItem___block_invoke(uint64_t a1, void *a2)
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

uint64_t __42__HFTriggerBuilder_removeServiceLikeItem___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristics");
}

id __42__HFTriggerBuilder_removeServiceLikeItem___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6
    && (v7 = *(void **)(a1 + 32),
        objc_msgSend(v6, "characteristic"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v7) = objc_msgSend(v7, "containsObject:", v8),
        v8,
        (_DWORD)v7))
  {
    v9 = v4;
  }
  else
  {
    objc_opt_class();
    v10 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    objc_msgSend(v12, "mediaProfiles");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "na_setWithSafeObject:", *(_QWORD *)(a1 + 40));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "na_setByRemovingObjectsFromSet:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "count"))
    {
      objc_msgSend(v12, "setMediaProfiles:", v15);
      objc_msgSend(*(id *)(a1 + 48), "updateAction:", v12);
      v9 = 0;
    }
    else
    {
      v9 = v12;
    }

  }
  return v9;
}

void __42__HFTriggerBuilder_removeServiceLikeItem___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "actionBuilders");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteObject:", v3);

}

- (void)setEndEvent:(id)a3
{
  id v4;

  v4 = a3;
  -[HFTriggerBuilder removeAllEndEventBuilders](self, "removeAllEndEventBuilders");
  -[HFTriggerBuilder addEndEventBuilder:](self, "addEndEventBuilder:", v4);

}

- (NSArray)endEventBuilders
{
  void *v2;
  void *v3;
  void *v4;

  -[HFTriggerBuilder endEventBuildersDiff](self, "endEventBuildersDiff");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (BOOL)requiresConfirmationToRun
{
  return 0;
}

- (BOOL)secureActionsRequireConfirmationToRun
{
  return 0;
}

- (BOOL)requiresLocationServicesAuthorization
{
  return 0;
}

- (BOOL)requiresHomeHub
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;

  objc_opt_class();
  -[HFTriggerBuilder trigger](self, "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = objc_msgSend(v5, "triggerActivationState");
  return v6 == 1;
}

- (BOOL)requiresUpdatedHomeHub
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;

  objc_opt_class();
  -[HFTriggerBuilder trigger](self, "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = objc_msgSend(v5, "triggerActivationState");
  return v6 == 2;
}

- (BOOL)requiresFMFDeviceToRun
{
  return 0;
}

- (BOOL)areActionsAffectedByEndEvents
{
  void *v2;
  char v3;

  -[HFTriggerBuilder triggerActionSets](self, "triggerActionSets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "areActionsAffectedByEndEvents");

  return v3;
}

- (HFDurationEventBuilder)designatedDurationEventBuilder
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HFTriggerBuilder endEventBuilders](self, "endEventBuilders", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;
          objc_msgSend(v9, "duration");
          if (v10 > 1.0)
          {
            if (!v5 || (objc_msgSend(v5, "duration"), v12 = v11, objc_msgSend(v9, "duration"), v12 > v13))
            {
              v14 = v9;

              v5 = v14;
            }
          }

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return (HFDurationEventBuilder *)v5;
}

- (BOOL)isShortcutOwned
{
  void *v3;
  char v4;
  void *v6;
  void *v7;
  char v8;

  -[HFTriggerBuilder triggerActionSets](self, "triggerActionSets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isShortcutOwned");

  if ((v4 & 1) != 0)
    return 1;
  -[HFTriggerBuilder trigger](self, "trigger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    return 0;
  -[HFTriggerBuilder trigger](self, "trigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hf_isShortcutOwned");

  return v8;
}

- (id)deleteTrigger
{
  void *v3;
  void *v4;
  void *v5;

  -[HFTriggerBuilder trigger](self, "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemBuilder home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFTriggerBuilder _deleteTrigger:fromHome:](self, "_deleteTrigger:fromHome:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)validationError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  -[HFItemBuilder verifyPropertyIsSet:](self, "verifyPropertyIsSet:", CFSTR("name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[HFTriggerBuilder name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemBuilder verifyNameIsNotEmpty:](self, "verifyNameIsNotEmpty:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[HFTriggerBuilder triggerActionSets](self, "triggerActionSets");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "anonymousActionSetBuilder");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "actions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      -[HFTriggerBuilder triggerActionSets](self, "triggerActionSets");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "namedActionSetsDiff");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "toSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v8 | objc_msgSend(v11, "count");

      if (!v12)
      {
        v21 = CFSTR("HFItemBuilderFailureReason");
        v22[0] = CFSTR("Triggers must have at least one action or action set");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D51980], 2, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        return v14;
      }
      -[HFTriggerBuilder triggerActionSets](self, "triggerActionSets");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "anonymousActionSetBuilder");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "actions");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "na_map:", &__block_literal_global_92_3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "firstObject");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
        v20 = v3;

    }
  }
  return v3;
}

uint64_t __35__HFTriggerBuilder_validationError__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "validationError");
}

- (id)_lazy_performValidation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  -[HFItemBuilder lazy_verifyPropertyIsSet:](self, "lazy_verifyPropertyIsSet:", CFSTR("name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D519C0];
  v12[0] = v3;
  -[HFTriggerBuilder name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemBuilder lazy_verifyNameIsNotEmpty:](self, "lazy_verifyNameIsNotEmpty:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chainFutures:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__HFTriggerBuilder__lazy_performValidation__block_invoke;
  v11[3] = &unk_1EA726968;
  v11[4] = self;
  v9 = (id)objc_msgSend(v8, "addFailureBlock:", v11);

  return v8;
}

void __43__HFTriggerBuilder__lazy_performValidation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Error validating trigger builder: %@. Error: %@", (uint8_t *)&v6, 0x16u);
  }

}

- (id)_commitUsingBuilders
{
  void *v3;
  void *v4;
  __CFString **v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  __CFString *v19;
  uint8_t buf[4];
  HFTriggerBuilder *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[HFTriggerBuilder validationError](self, "validationError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HFTriggerBuilder trigger](self, "trigger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = HFOperationEditTrigger;
    if (!v4)
      v5 = HFOperationAddTrigger;
    v6 = *v5;

    HFLogForCategory(0x28uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v21 = self;
      v22 = 2112;
      v23 = v3;
      _os_log_error_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_ERROR, "Error validating trigger builder: %@. Error: %@", buf, 0x16u);
    }

    v8 = (void *)MEMORY[0x1E0D519C0];
    -[HFTriggerBuilder displayName](self, "displayName");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hf_errorWithOperationType:failedItemName:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "futureWithError:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HFItemBuilder home](self, "home");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[HFTriggerBuilder getOrCreateTriggerBuilder](self, "getOrCreateTriggerBuilder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = v12;
      objc_msgSend(v12, "builder");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFTriggerBuilder updateTriggerBuilder:](self, "updateTriggerBuilder:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __40__HFTriggerBuilder__commitUsingBuilders__block_invoke;
      v17[3] = &unk_1EA732620;
      v9 = v13;
      v18 = v9;
      v6 = v6;
      v19 = v6;
      objc_msgSend(v15, "flatMap:", v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[HFTriggerBuilder _legacyCommitItem](self, "_legacyCommitItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
    }
  }

  return v11;
}

uint64_t __40__HFTriggerBuilder__commitUsingBuilders__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "commitBuilderInHome:", *(_QWORD *)(a1 + 40));
}

- (id)_legacyCommitItem
{
  void *v3;
  __CFString **v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  __CFString *v21;
  void *v22;
  __CFString *v24;
  void *v25;
  _QWORD v26[4];
  __CFString *v27;
  HFTriggerBuilder *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id location;
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[9];

  v36[7] = *MEMORY[0x1E0C80C00];
  -[HFTriggerBuilder trigger](self, "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = HFOperationEditTrigger;
  if (!v3)
    v4 = HFOperationAddTrigger;
  v24 = *v4;

  -[HFTriggerBuilder trigger](self, "trigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == 0;

  -[HFTriggerBuilder _lazy_performValidation](self, "_lazy_performValidation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    v9 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __37__HFTriggerBuilder__legacyCommitItem__block_invoke;
    v35[3] = &unk_1EA726940;
    v35[4] = self;
    objc_msgSend(v7, "flatMap:", v35);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v9;
    v34[1] = 3221225472;
    v34[2] = __37__HFTriggerBuilder__legacyCommitItem__block_invoke_2;
    v34[3] = &unk_1EA73DE18;
    v34[4] = self;
    objc_msgSend(v10, "flatMap:", v34);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __37__HFTriggerBuilder__legacyCommitItem__block_invoke_3;
    v33[3] = &unk_1EA726940;
    v33[4] = self;
    objc_msgSend(v7, "flatMap:", v33);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v11 = (void *)MEMORY[0x1E0D519C0];
  v36[0] = v25;
  -[HFTriggerBuilder _updateAnonymousActionSet](self, "_updateAnonymousActionSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v12;
  -[HFTriggerBuilder _updateActionSets](self, "_updateActionSets");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v13;
  -[HFTriggerBuilder _updateConditions](self, "_updateConditions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v14;
  -[HFTriggerBuilder _updateEndEvents](self, "_updateEndEvents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v15;
  -[HFTriggerBuilder _updateEnabledState](self, "_updateEnabledState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36[5] = v16;
  -[HFTriggerBuilder lazilyFinishCommitingTrigger](self, "lazilyFinishCommitingTrigger");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36[6] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "chainFutures:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v30[0] = v9;
  v30[1] = 3221225472;
  v30[2] = __37__HFTriggerBuilder__legacyCommitItem__block_invoke_4;
  v30[3] = &unk_1EA727DB0;
  objc_copyWeak(&v31, &location);
  objc_msgSend(v19, "flatMap:", v30);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v9;
  v26[1] = 3221225472;
  v26[2] = __37__HFTriggerBuilder__legacyCommitItem__block_invoke_5;
  v26[3] = &unk_1EA73DE40;
  v21 = v24;
  v27 = v21;
  v28 = self;
  objc_copyWeak(&v29, &location);
  objc_msgSend(v20, "recover:", v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v29);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

  return v22;
}

uint64_t __37__HFTriggerBuilder__legacyCommitItem__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "commitCreateTrigger");
}

id __37__HFTriggerBuilder__legacyCommitItem__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "nameIsConfigured") & 1) == 0)
    objc_msgSend(v3, "setValue:forKey:", 0, CFSTR("configuredName"));
  objc_msgSend(*(id *)(a1 + 32), "_commitAddTriggerToHome:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __37__HFTriggerBuilder__legacyCommitItem__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(*(id *)(a1 + 32), "commitEditTrigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(*(id *)(a1 + 32), "_updateName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chainFutures:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __37__HFTriggerBuilder__legacyCommitItem__block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "trigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_notifyObserversOfChangingTrigger:", v5);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __37__HFTriggerBuilder__legacyCommitItem__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(__CFString **)(a1 + 32);
  v6 = MEMORY[0x1E0C809B0];
  if (v5 == CFSTR("HFOperationAddTrigger"))
  {
    objc_msgSend(*(id *)(a1 + 40), "deleteTrigger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v6;
    v22[1] = 3221225472;
    v22[2] = __37__HFTriggerBuilder__legacyCommitItem__block_invoke_6;
    v22[3] = &unk_1EA735210;
    objc_copyWeak(&v23, (id *)(a1 + 48));
    objc_msgSend(v7, "addCompletionBlock:", v22);
    v8 = objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v23);
    v5 = *(__CFString **)(a1 + 32);
    v4 = (void *)v8;
  }
  v9 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(*(id *)(a1 + 40), "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_errorWithOperationType:failedItemName:", v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "futureWithError:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = v6;
  v20[1] = 3221225472;
  v20[2] = __37__HFTriggerBuilder__legacyCommitItem__block_invoke_7;
  v20[3] = &unk_1EA726940;
  v13 = v12;
  v21 = v13;
  objc_msgSend(v4, "flatMap:", v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  v18[1] = 3221225472;
  v18[2] = __37__HFTriggerBuilder__legacyCommitItem__block_invoke_8;
  v18[3] = &unk_1EA72A050;
  v19 = v13;
  v15 = v13;
  objc_msgSend(v14, "recover:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __37__HFTriggerBuilder__legacyCommitItem__block_invoke_6(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setTrigger:", 0);
  objc_msgSend(WeakRetained, "triggerActionSets");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "anonymousActionSetBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setActionSet:", 0);

}

id __37__HFTriggerBuilder__legacyCommitItem__block_invoke_7(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __37__HFTriggerBuilder__legacyCommitItem__block_invoke_8(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)commitItem
{
  NSObject *v3;
  os_signpost_id_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  _BOOL4 v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v24[5];
  id v25;
  os_signpost_id_t v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x31uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[HFTriggerBuilder trigger](self, "trigger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = CFSTR("Committing");
  else
    v7 = CFSTR("Creating");
  -[HFTriggerBuilder name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFTriggerBuilder trigger](self, "trigger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    -[HFTriggerBuilder trigger](self, "trigger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR(" (%@)"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ trigger with name: %@%@"), v7, v8, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ trigger with name: %@%@"), v7, v8, &stru_1EA741FF8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  HFLogForCategory(0x31uLL);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_1DD34E000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v4, "HFTriggerBuilderCommit", "%@", buf, 0xCu);
  }

  -[HFItemBuilder home](self, "home");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "areAutomationBuildersSupported"))
  {

    goto LABEL_14;
  }
  v18 = -[HFTriggerBuilder(AutomationBuilders) supportsHomeKitAutomationBuilders](self, "supportsHomeKitAutomationBuilders");

  if (!v18)
  {
LABEL_14:
    -[HFTriggerBuilder _legacyCommitItem](self, "_legacyCommitItem");
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  -[HFTriggerBuilder _commitUsingBuilders](self, "_commitUsingBuilders");
  v19 = objc_claimAutoreleasedReturnValue();
LABEL_15:
  v20 = (void *)v19;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __30__HFTriggerBuilder_commitItem__block_invoke;
  v24[3] = &unk_1EA72D0C0;
  v25 = v14;
  v26 = v4;
  v24[4] = self;
  v21 = v14;
  v22 = (id)objc_msgSend(v20, "addCompletionBlock:", v24);

  return v20;
}

void __30__HFTriggerBuilder_commitItem__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  void *v22;
  __CFString *v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    HFLogForCategory(0x43uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "trigger");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uniqueIdentifier");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = CFSTR("no-id");
      *(_DWORD *)buf = 138412802;
      v25 = v6;
      if (v10)
        v12 = (const __CFString *)v10;
      v26 = 2112;
      v27 = v8;
      v28 = 2112;
      v29 = v12;
      _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Error %@ while committing \"%@\" (%@)", buf, 0x20u);

    }
  }
  HFLogForCategory(0x43uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "trigger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uniqueIdentifier");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v18 = CFSTR("no-id");
    if (v16)
      v18 = (const __CFString *)v16;
    *(_DWORD *)buf = 138412546;
    v25 = v14;
    v26 = 2112;
    v27 = v18;
    _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "Finished commiting trigger \"%@\" (%@)", buf, 0x16u);

  }
  HFLogForCategory(0x31uLL);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  v21 = *(_QWORD *)(a1 + 48);
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    v22 = *(void **)(a1 + 40);
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" error: %@"), v6);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = &stru_1EA741FF8;
    }
    *(_DWORD *)buf = 138412546;
    v25 = v22;
    v26 = 2112;
    v27 = v23;
    _os_signpost_emit_with_name_impl(&dword_1DD34E000, v20, OS_SIGNPOST_INTERVAL_END, v21, "HFTriggerBuilderCommit", "%@%@", buf, 0x16u);
    if (v6)

  }
}

- (id)_updateEnabledState
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__HFTriggerBuilder__updateEnabledState__block_invoke;
  v3[3] = &unk_1EA728A78;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0D519C0], "lazyFutureWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __39__HFTriggerBuilder__updateEnabledState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __39__HFTriggerBuilder__updateEnabledState__block_invoke_2;
  v12[3] = &unk_1EA7268C8;
  v12[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reschedule:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __39__HFTriggerBuilder__updateEnabledState__block_invoke_3;
  v10[3] = &unk_1EA72A0C8;
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v8 = v3;
  v9 = (id)objc_msgSend(v7, "addCompletionBlock:", v10);

}

void __39__HFTriggerBuilder__updateEnabledState__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "trigger");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enable:completionHandler:", objc_msgSend(*(id *)(a1 + 32), "enabled"), v4);

}

void __39__HFTriggerBuilder__updateEnabledState__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  void *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  HFLogForCategory(0x28uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(*(id *)(a1 + 32), "enabled");
      v12 = 138412802;
      v13 = v9;
      v14 = 1024;
      v15 = v10;
      v16 = 2112;
      v17 = v5;
      _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "Failed to update enabled state for trigger with name:%@ enabled:%d Error: %@", (uint8_t *)&v12, 0x1Cu);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(*(id *)(a1 + 32), "enabled");
    v12 = 138412546;
    v13 = v9;
    v14 = 1024;
    v15 = v11;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Update enabled state for trigger with name:%@ enabled:%d", (uint8_t *)&v12, 0x12u);
    goto LABEL_6;
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:error:", v6, v5);
}

- (id)_updateAnonymousActionSet
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__HFTriggerBuilder__updateAnonymousActionSet__block_invoke;
  v3[3] = &unk_1EA728A78;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0D519C0], "lazyFutureWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __45__HFTriggerBuilder__updateAnonymousActionSet__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "trigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "triggerActionSets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anonymousActionSetBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContainingTrigger:", v4);

  objc_msgSend(*(id *)(a1 + 32), "triggerActionSets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anonymousActionSetBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commitItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __45__HFTriggerBuilder__updateAnonymousActionSet__block_invoke_2;
  v12[3] = &unk_1EA72A0C8;
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v3;
  v10 = v3;
  v11 = (id)objc_msgSend(v9, "addCompletionBlock:", v12);

}

void __45__HFTriggerBuilder__updateAnonymousActionSet__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  HFLogForCategory(0x28uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v5;
      _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "Failed to update anonymous action set for trigger with name:%@ Error: %@", (uint8_t *)&v10, 0x16u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Updated anonymous action set for trigger with name:%@", (uint8_t *)&v10, 0xCu);
    goto LABEL_6;
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:error:", v6, v5);
}

- (id)_updateActionSets
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__HFTriggerBuilder__updateActionSets__block_invoke;
  v3[3] = &unk_1EA728A78;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0D519C0], "lazyFutureWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __37__HFTriggerBuilder__updateActionSets__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  _QWORD v14[4];
  uint64_t v15;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "triggerActionSets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "namedActionSetsDiff");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __37__HFTriggerBuilder__updateActionSets__block_invoke_2;
  v14[3] = &unk_1EA73DE68;
  v15 = *(_QWORD *)(a1 + 32);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __37__HFTriggerBuilder__updateActionSets__block_invoke_122;
  v13[3] = &unk_1EA73DE68;
  v13[4] = v15;
  v14[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(v4, "commitItemBuilderSetDiff:addBlock:deleteBlock:", v6, v14, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __37__HFTriggerBuilder__updateActionSets__block_invoke_126;
  v11[3] = &unk_1EA72A0C8;
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v9 = v3;
  v10 = (id)objc_msgSend(v8, "addCompletionBlock:", v11);

}

id __37__HFTriggerBuilder__updateActionSets__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v5 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __37__HFTriggerBuilder__updateActionSets__block_invoke_3;
  v21[3] = &unk_1EA728590;
  v21[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v22 = v6;
  objc_msgSend(v4, "futureWithErrorOnlyHandlerAdapterBlock:", v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  v18[1] = 3221225472;
  v18[2] = __37__HFTriggerBuilder__updateActionSets__block_invoke_4;
  v18[3] = &unk_1EA72CB68;
  v8 = v6;
  v9 = *(_QWORD *)(a1 + 32);
  v19 = v8;
  v20 = v9;
  v10 = (id)objc_msgSend(v7, "addSuccessBlock:", v18);
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __37__HFTriggerBuilder__updateActionSets__block_invoke_120;
  v15[3] = &unk_1EA726360;
  v11 = *(_QWORD *)(a1 + 32);
  v16 = v8;
  v17 = v11;
  v12 = v8;
  v13 = (id)objc_msgSend(v7, "addFailureBlock:", v15);

  return v7;
}

void __37__HFTriggerBuilder__updateActionSets__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "trigger");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "actionSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addActionSet:completionHandler:", v5, v4);

}

void __37__HFTriggerBuilder__updateActionSets__block_invoke_4(uint64_t a1)
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
    objc_msgSend(*(id *)(a1 + 32), "actionSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412546;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "Added action set: %@ to trigger with name:%@", (uint8_t *)&v5, 0x16u);

  }
}

void __37__HFTriggerBuilder__updateActionSets__block_invoke_120(uint64_t a1, void *a2)
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
    objc_msgSend(*(id *)(a1 + 32), "actionSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412802;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = v3;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Failed to add action set: %@ to trigger with name:%@. Error: %@", (uint8_t *)&v7, 0x20u);

  }
}

id __37__HFTriggerBuilder__updateActionSets__block_invoke_122(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  _QWORD v27[5];
  id v28;

  v3 = a2;
  objc_msgSend(v3, "actionSet");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_4;
  v5 = (void *)v4;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionSets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0D519C0];
    v11 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __37__HFTriggerBuilder__updateActionSets__block_invoke_2_123;
    v27[3] = &unk_1EA728590;
    v27[4] = *(_QWORD *)(a1 + 32);
    v12 = v3;
    v28 = v12;
    objc_msgSend(v10, "futureWithErrorOnlyHandlerAdapterBlock:", v27);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v11;
    v24[1] = 3221225472;
    v24[2] = __37__HFTriggerBuilder__updateActionSets__block_invoke_3_124;
    v24[3] = &unk_1EA72CB68;
    v14 = v12;
    v15 = *(_QWORD *)(a1 + 32);
    v25 = v14;
    v26 = v15;
    v16 = (id)objc_msgSend(v13, "addSuccessBlock:", v24);
    v21[0] = v11;
    v21[1] = 3221225472;
    v21[2] = __37__HFTriggerBuilder__updateActionSets__block_invoke_125;
    v21[3] = &unk_1EA726360;
    v17 = v14;
    v18 = *(_QWORD *)(a1 + 32);
    v22 = v17;
    v23 = v18;
    v19 = (id)objc_msgSend(v13, "addFailureBlock:", v21);

  }
  else
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

void __37__HFTriggerBuilder__updateActionSets__block_invoke_2_123(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "trigger");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "actionSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeActionSet:completionHandler:", v5, v4);

}

void __37__HFTriggerBuilder__updateActionSets__block_invoke_3_124(uint64_t a1)
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
    objc_msgSend(*(id *)(a1 + 32), "actionSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412546;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "Removed action set: %@ to trigger with name:%@", (uint8_t *)&v5, 0x16u);

  }
}

void __37__HFTriggerBuilder__updateActionSets__block_invoke_125(uint64_t a1, void *a2)
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
    objc_msgSend(*(id *)(a1 + 32), "actionSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412802;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = v3;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Failed to remove set: %@ from trigger with name:%@. Error: %@", (uint8_t *)&v7, 0x20u);

  }
}

void __37__HFTriggerBuilder__updateActionSets__block_invoke_126(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v8 = a2;
  objc_msgSend(v5, "triggerActionSets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetActionSetBuilders");

  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:error:", v8, v6);
}

- (id)_updateName
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
  v5[2] = __31__HFTriggerBuilder__updateName__block_invoke;
  v5[3] = &unk_1EA729F60;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v2, "lazyFutureWithBlock:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __31__HFTriggerBuilder__updateName__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __31__HFTriggerBuilder__updateName__block_invoke_2;
  v15[3] = &unk_1EA73DE90;
  objc_copyWeak(&v16, (id *)(a1 + 32));
  objc_msgSend(v4, "futureWithErrorOnlyHandlerAdapterBlock:", v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __31__HFTriggerBuilder__updateName__block_invoke_3;
  v13[3] = &unk_1EA73AD38;
  objc_copyWeak(&v14, (id *)(a1 + 32));
  v7 = (id)objc_msgSend(v6, "addSuccessBlock:", v13);
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __31__HFTriggerBuilder__updateName__block_invoke_127;
  v11[3] = &unk_1EA727818;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v8 = (id)objc_msgSend(v6, "addFailureBlock:", v11);
  objc_msgSend(v3, "completionHandlerAdapter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v6, "addCompletionBlock:", v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&v16);
}

void __31__HFTriggerBuilder__updateName__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "trigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(WeakRetained, "nameIsConfigured") & 1) != 0)
  {
    objc_msgSend(WeakRetained, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateName:configuredName:completionHandler:", v5, v6, v7);

  }
  else
  {
    objc_msgSend(v4, "updateName:configuredName:completionHandler:", v5, 0, v7);
  }

}

void __31__HFTriggerBuilder__updateName__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory(0x28uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412546;
    v5 = v3;
    v6 = 1024;
    v7 = objc_msgSend(WeakRetained, "nameIsConfigured");
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "Updated trigger name:%@ configured:%{BOOL}d", (uint8_t *)&v4, 0x12u);

  }
}

void __31__HFTriggerBuilder__updateName__block_invoke_127(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory(0x28uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(WeakRetained, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412802;
    v8 = v6;
    v9 = 1024;
    v10 = objc_msgSend(WeakRetained, "nameIsConfigured");
    v11 = 2112;
    v12 = v3;
    _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "Failed to update trigger name:%@ configured:%{BOOL}d. Error: %@", (uint8_t *)&v7, 0x1Cu);

  }
}

- (id)_updateConditions
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__HFTriggerBuilder__updateConditions__block_invoke;
  v3[3] = &unk_1EA728A78;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0D519C0], "lazyFutureWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __37__HFTriggerBuilder__updateConditions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "trigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "supportsConditions");

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "conditionCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "predicate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = (void *)MEMORY[0x1E0D519C0];
      v9 = MEMORY[0x1E0C809B0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __37__HFTriggerBuilder__updateConditions__block_invoke_2;
      v22[3] = &unk_1EA728590;
      v22[4] = *(_QWORD *)(a1 + 32);
      v10 = v7;
      v23 = v10;
      objc_msgSend(v8, "futureWithErrorOnlyHandlerAdapterBlock:", v22);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v9;
      v19[1] = 3221225472;
      v19[2] = __37__HFTriggerBuilder__updateConditions__block_invoke_3;
      v19[3] = &unk_1EA726EF8;
      v19[4] = *(_QWORD *)(a1 + 32);
      v20 = v10;
      v21 = v3;
      v12 = v10;
      v13 = (id)objc_msgSend(v11, "addCompletionBlock:", v19);

      goto LABEL_8;
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "conditionCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "conditions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    objc_msgSend(*(id *)(a1 + 32), "conditionCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "conditions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Conditions are currently only supported on event triggers, but the conditions <%@> were specified for builder <%@>"), v18, *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(v3, "finishWithNoResult");
LABEL_8:

}

void __37__HFTriggerBuilder__updateConditions__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "trigger");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updatePredicate:completionHandler:", *(_QWORD *)(a1 + 40), v4);

}

void __37__HFTriggerBuilder__updateConditions__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  HFLogForCategory(0x28uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      v12 = 138412802;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v5;
      _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "Failed to update predicate for trigger: %@. Predicate: %@. Error: %@", (uint8_t *)&v12, 0x20u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v12 = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v11;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Updated predicate for trigger: %@. Predicate: %@", (uint8_t *)&v12, 0x16u);
    goto LABEL_6;
  }

  objc_msgSend(*(id *)(a1 + 48), "finishWithResult:error:", v6, v5);
}

- (id)_updateEndEvents
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__HFTriggerBuilder__updateEndEvents__block_invoke;
  v3[3] = &unk_1EA728A78;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0D519C0], "lazyFutureWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __36__HFTriggerBuilder__updateEndEvents__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "supportsEndEvents")
    && (objc_msgSend(*(id *)(a1 + 32), "trigger"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v4,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "trigger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "endEventBuilders");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_flatMap:", &__block_literal_global_133_2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "endEvents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToArray:", v9);

    if (v10)
    {
      objc_msgSend(v3, "finishWithNoResult");
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0D519C0];
      v15 = MEMORY[0x1E0C809B0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __36__HFTriggerBuilder__updateEndEvents__block_invoke_3;
      v20[3] = &unk_1EA728590;
      v21 = v6;
      v22 = v8;
      objc_msgSend(v14, "futureWithErrorOnlyHandlerAdapterBlock:", v20);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v15;
      v18[1] = 3221225472;
      v18[2] = __36__HFTriggerBuilder__updateEndEvents__block_invoke_4;
      v18[3] = &unk_1EA72A0C8;
      v18[4] = *(_QWORD *)(a1 + 32);
      v19 = v3;
      v17 = (id)objc_msgSend(v16, "addCompletionBlock:", v18);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "endEventBuilders");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "endEventBuilders");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("End events are currently only supported on event triggers, but the end event builders <%@> were specified for trigger builder <%@>"), v13, *(_QWORD *)(a1 + 32));

    }
    objc_msgSend(v3, "finishWithNoResult");
  }

}

id __36__HFTriggerBuilder__updateEndEvents__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "buildNewEventsFromCurrentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __36__HFTriggerBuilder__updateEndEvents__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateEndEvents:completionHandler:", *(_QWORD *)(a1 + 40), a2);
}

void __36__HFTriggerBuilder__updateEndEvents__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HFMutableSetDiff *v11;
  void *v12;
  void *v13;
  HFMutableSetDiff *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  HFLogForCategory(0x28uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "endEventBuilders");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412802;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v5;
      _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "Failed to update end events for trigger: %@. Events: %@. Error: %@", (uint8_t *)&v15, 0x20u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "endEventBuilders");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Updated predicate for trigger: %@. Events: %@", (uint8_t *)&v15, 0x16u);
    goto LABEL_6;
  }

  v11 = [HFMutableSetDiff alloc];
  objc_msgSend(*(id *)(a1 + 32), "endEventBuildersDiff");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "toSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HFMutableSetDiff initWithFromSet:](v11, "initWithFromSet:", v13);
  objc_msgSend(*(id *)(a1 + 32), "setEndEventBuildersDiff:", v14);

  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:error:", v6, v5);
}

- (id)lazilyFinishCommitingTrigger
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (id)commitCreateTrigger
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFTriggerBuilder.m"), 677, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFTriggerBuilder commitCreateTrigger]", objc_opt_class());

  return 0;
}

- (id)commitEditTrigger
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFTriggerBuilder.m"), 683, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFTriggerBuilder commitEditTrigger]", objc_opt_class());

  return 0;
}

- (id)naturalLanguageNameOfType:(unint64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFTriggerBuilder.m"), 689, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFTriggerBuilder naturalLanguageNameOfType:]", objc_opt_class());

  return 0;
}

- (id)naturalLanguageNameWithOptions:(id)a3
{
  return -[HFTriggerBuilder naturalLanguageNameOfType:](self, "naturalLanguageNameOfType:", objc_msgSend(a3, "nameType"));
}

- (id)naturalLanguageDetailsWithOptions:(id)a3
{
  return 0;
}

- (id)replaceCurrentTriggerWithTrigger:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFTriggerBuilder trigger](self, "trigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory(0x28uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "hf_prettyDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hf_prettyDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemBuilder home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v25 = v7;
    v26 = 2112;
    v27 = v8;
    v28 = 2112;
    v29 = v9;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Swapping current trigger:%@ for new trigger:%@ in home:%@", buf, 0x20u);

  }
  objc_msgSend(v4, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFTriggerBuilder _uniquelyRenameTrigger:pendingReplaceByNewTriggerWithName:](self, "_uniquelyRenameTrigger:pendingReplaceByNewTriggerWithName:", v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __53__HFTriggerBuilder_replaceCurrentTriggerWithTrigger___block_invoke;
  v22[3] = &unk_1EA732620;
  v22[4] = self;
  v23 = v4;
  v13 = v4;
  objc_msgSend(v11, "flatMap:", v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __53__HFTriggerBuilder_replaceCurrentTriggerWithTrigger___block_invoke_2;
  v20[3] = &unk_1EA732620;
  v20[4] = self;
  v21 = v5;
  v15 = v5;
  objc_msgSend(v14, "flatMap:", v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __53__HFTriggerBuilder_replaceCurrentTriggerWithTrigger___block_invoke_3;
  v19[3] = &unk_1EA726338;
  v19[4] = self;
  objc_msgSend(v16, "addSuccessBlock:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t __53__HFTriggerBuilder_replaceCurrentTriggerWithTrigger___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_commitAddTriggerToHome:", *(_QWORD *)(a1 + 40));
}

id __53__HFTriggerBuilder_replaceCurrentTriggerWithTrigger___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v1, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_deleteTrigger:fromHome:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __53__HFTriggerBuilder_replaceCurrentTriggerWithTrigger___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didReplaceBackingTrigger");
}

- (HFTriggerBuilder)triggerBuilderWithContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
  return self;
}

- (void)replaceConditionsWithConditions:(id)a3
{
  objc_storeStrong((id *)&self->_conditionCollection, a3);
}

- (void)_notifyObserversOfAddingTrigger:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__HFTriggerBuilder__notifyObserversOfAddingTrigger___block_invoke;
  v7[3] = &unk_1EA7277C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "dispatchHomeObserverMessage:sender:", v7, 0);

}

void __52__HFTriggerBuilder__notifyObserversOfAddingTrigger___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "home:didAddTrigger:", v3, *(_QWORD *)(a1 + 40));

  }
}

- (void)_notifyObserversOfChangingTrigger:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__HFTriggerBuilder__notifyObserversOfChangingTrigger___block_invoke;
  v7[3] = &unk_1EA7277C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "dispatchHomeObserverMessage:sender:", v7, 0);

}

void __54__HFTriggerBuilder__notifyObserversOfChangingTrigger___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "home:didUpdateTrigger:", v3, *(_QWORD *)(a1 + 40));

  }
}

- (void)_didReplaceBackingTrigger
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HFTriggerBuilder triggerActionSets](self, "triggerActionSets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetAllActionSets");

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HFTriggerBuilder endEventBuildersDiff](self, "endEventBuildersDiff");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFSetDiff diffFromSet:toSet:](HFSetDiff, "diffFromSet:toSet:", v8, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  -[HFTriggerBuilder setEndEventBuildersDiff:](self, "setEndEventBuildersDiff:", v7);

}

- (id)_uniquelyRenameTrigger:(id)a3 pendingReplaceByNewTriggerWithName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D519C0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__HFTriggerBuilder__uniquelyRenameTrigger_pendingReplaceByNewTriggerWithName___block_invoke;
  v13[3] = &unk_1EA72CA78;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "futureWithErrorOnlyHandlerAdapterBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __78__HFTriggerBuilder__uniquelyRenameTrigger_pendingReplaceByNewTriggerWithName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "triggers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_map:", &__block_literal_global_144_0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setByAddingObject:", *(_QWORD *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFUtilities uniqueHomeKitNameForName:allNames:](HFUtilities, "uniqueHomeKitNameForName:allNames:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "updateName:completionHandler:", v11, v5);
}

uint64_t __78__HFTriggerBuilder__uniquelyRenameTrigger_pendingReplaceByNewTriggerWithName___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

- (id)_commitAddTriggerToHome:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  HFTriggerBuilder *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v6 = (void *)MEMORY[0x1E0D519C0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __44__HFTriggerBuilder__commitAddTriggerToHome___block_invoke;
  v19[3] = &unk_1EA728590;
  v19[4] = self;
  v7 = v4;
  v20 = v7;
  objc_msgSend(v6, "futureWithErrorOnlyHandlerAdapterBlock:", v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __44__HFTriggerBuilder__commitAddTriggerToHome___block_invoke_2;
  v17[3] = &unk_1EA72CB68;
  v17[4] = self;
  v9 = v7;
  v18 = v9;
  v10 = (id)objc_msgSend(v8, "addSuccessBlock:", v17);
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __44__HFTriggerBuilder__commitAddTriggerToHome___block_invoke_2_147;
  v14[3] = &unk_1EA726360;
  v15 = v9;
  v16 = self;
  v11 = v9;
  v12 = (id)objc_msgSend(v8, "addFailureBlock:", v14);

  return v8;
}

void __44__HFTriggerBuilder__commitAddTriggerToHome___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "home");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTrigger:completionHandler:", *(_QWORD *)(a1 + 40), v4);

}

void __44__HFTriggerBuilder__commitAddTriggerToHome___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setTrigger:", *(_QWORD *)(a1 + 40));
  HFLogForCategory(0x28uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "trigger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hf_prettyDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "Added trigger:%@ home:%@", buf, 0x16u);

  }
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__HFTriggerBuilder__commitAddTriggerToHome___block_invoke_146;
  v7[3] = &unk_1EA726918;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "dispatchHomeObserverMessage:sender:", v7, 0);

}

void __44__HFTriggerBuilder__commitAddTriggerToHome___block_invoke_146(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "trigger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "home:didAddTrigger:", v3, v4);

  }
}

void __44__HFTriggerBuilder__commitAddTriggerToHome___block_invoke_2_147(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Failed to add trigger (error = %@) :%@ home:%@", (uint8_t *)&v7, 0x20u);

  }
}

- (id)_deleteTrigger:(id)a3 fromHome:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  HFTriggerBuilder *v21;
  _QWORD v22[4];
  id v23;
  HFTriggerBuilder *v24;
  _QWORD v25[4];
  id v26;
  id v27;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v7 || !v8)
  {

    goto LABEL_6;
  }
  v10 = objc_msgSend(v6, "hf_isBuilder");

  if ((v10 & 1) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v11 = (void *)MEMORY[0x1E0D519C0];
  v12 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __44__HFTriggerBuilder__deleteTrigger_fromHome___block_invoke;
  v25[3] = &unk_1EA728590;
  v26 = v7;
  v13 = v6;
  v27 = v13;
  objc_msgSend(v11, "futureWithErrorOnlyHandlerAdapterBlock:", v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __44__HFTriggerBuilder__deleteTrigger_fromHome___block_invoke_2;
  v22[3] = &unk_1EA72CB68;
  v15 = v13;
  v23 = v15;
  v24 = self;
  objc_msgSend(v14, "addSuccessBlock:", v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __44__HFTriggerBuilder__deleteTrigger_fromHome___block_invoke_2_151;
  v19[3] = &unk_1EA726360;
  v20 = v15;
  v21 = self;
  objc_msgSend(v16, "addFailureBlock:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v17;
}

uint64_t __44__HFTriggerBuilder__deleteTrigger_fromHome___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeTrigger:completionHandler:", *(_QWORD *)(a1 + 40), a2);
}

void __44__HFTriggerBuilder__deleteTrigger_fromHome___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  int8x16_t v7;
  _QWORD v8[4];
  int8x16_t v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x28uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v11 = v3;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "Deleted trigger:%@ home:%@", buf, 0x16u);

  }
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__HFTriggerBuilder__deleteTrigger_fromHome___block_invoke_148;
  v8[3] = &unk_1EA7277C8;
  v7 = *(int8x16_t *)(a1 + 32);
  v6 = (id)v7.i64[0];
  v9 = vextq_s8(v7, v7, 8uLL);
  objc_msgSend(v5, "dispatchHomeObserverMessage:sender:", v8, 0);

}

void __44__HFTriggerBuilder__deleteTrigger_fromHome___block_invoke_148(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "home:didRemoveTrigger:", v3, *(_QWORD *)(a1 + 40));

  }
}

void __44__HFTriggerBuilder__deleteTrigger_fromHome___block_invoke_2_151(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Failed to delete trigger (error = %@) :%@ home:%@", (uint8_t *)&v7, 0x20u);

  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)nameIsConfigured
{
  return self->_nameIsConfigured;
}

- (void)setNameIsConfigured:(BOOL)a3
{
  self->_nameIsConfigured = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (HFTriggerActionSetsBuilder)triggerActionSets
{
  return self->_triggerActionSets;
}

- (void)setTriggerActionSets:(id)a3
{
  objc_storeStrong((id *)&self->_triggerActionSets, a3);
}

- (HFTriggerBuilderContextProviding)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (HFConditionCollection)conditionCollection
{
  return self->_conditionCollection;
}

- (void)setConditionCollection:(id)a3
{
  objc_storeStrong((id *)&self->_conditionCollection, a3);
}

- (HFMutableSetDiff)endEventBuildersDiff
{
  return self->_endEventBuildersDiff;
}

- (void)setEndEventBuildersDiff:(id)a3
{
  objc_storeStrong((id *)&self->_endEventBuildersDiff, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endEventBuildersDiff, 0);
  objc_storeStrong((id *)&self->_conditionCollection, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_triggerActionSets, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (id)compareToObject:(id)a3
{
  id v4;
  HFComparisonResult *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  HFTriggerBuilder *v20;
  id v21;

  v4 = a3;
  v5 = -[HFComparisonResult initWithObjectA:objectB:]([HFComparisonResult alloc], "initWithObjectA:objectB:", self, v4);
  if (!-[HFComparisonResult containsCriticalDifference](v5, "containsCriticalDifference"))
  {
    -[HFTriggerBuilder triggerActionSets](self, "triggerActionSets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "triggerActionSets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "compareToObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[HFContainedObjectDifference containedObjectDifferenceWithKey:comparisonResult:](HFContainedObjectDifference, "containedObjectDifferenceWithKey:comparisonResult:", CFSTR("triggerActionSets"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFComparisonResult add:](v5, "add:", v9);

    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __48__HFTriggerBuilder_Comparison__compareToObject___block_invoke;
    v19 = &unk_1EA72C9C0;
    v20 = self;
    v10 = v4;
    v21 = v10;
    +[HFDifference difference:priority:withBlock:](HFDifference, "difference:priority:withBlock:", CFSTR("enabled"), 1, &v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFComparisonResult add:](v5, "add:", v11, v16, v17, v18, v19, v20);

    -[HFTriggerBuilder endEventBuilders](self, "endEventBuilders");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endEventBuilders");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFContainedObjectListDifference containedObjectDifferenceWithKey:objectsA:objectsB:](HFContainedObjectListDifference, "containedObjectDifferenceWithKey:objectsA:objectsB:", CFSTR("endEvents"), v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFComparisonResult add:](v5, "add:", v14);

  }
  return v5;
}

uint64_t __48__HFTriggerBuilder_Comparison__compareToObject___block_invoke(uint64_t a1)
{
  int v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "enabled");
  return v2 ^ objc_msgSend(*(id *)(a1 + 40), "enabled");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[HFTriggerBuilder trigger](self, "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[HFTriggerBuilder trigger](self, "trigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");

  return v7;
}

@end
