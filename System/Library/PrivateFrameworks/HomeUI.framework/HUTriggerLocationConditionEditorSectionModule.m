@implementation HUTriggerLocationConditionEditorSectionModule

- (HUTriggerLocationConditionEditorSectionModule)initWithItemUpdater:(id)a3 conditionType:(unint64_t)a4 home:(id)a5
{
  HUTriggerLocationConditionEditorSectionModule *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUTriggerLocationConditionEditorSectionModule;
  v5 = -[HUTriggerConditionEditorExpandingSectionModule initWithItemUpdater:conditionType:home:](&v8, sel_initWithItemUpdater_conditionType_home_, a3, a4, a5);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D314E0], "sharedDispatcher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:", v5);

  }
  return v5;
}

- (id)conditionForOptionItem:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[HUTriggerLocationConditionEditorSectionModule anyLocationOptionItem](self, "anyLocationOptionItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v12 = 0;
  }
  else
  {
    objc_opt_class();
    v6 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8
      && (-[HUTriggerConditionEditorExpandingSectionModule optionItems](self, "optionItems"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "containsObject:", v8),
          v9,
          v10))
    {
      objc_msgSend(v8, "sourceItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "condition");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      NSLog(CFSTR("Unknown option item %@!"), v6);
      v12 = 0;
    }

  }
  return v12;
}

- (id)selectOptionItemForCondition:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    v5 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    if (v7)
    {
      objc_msgSend(v7, "presenceEvent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUTriggerLocationConditionEditorSectionModule _conditionItemForPresenceEvent:](self, "_conditionItemForPresenceEvent:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "sourceItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setCondition:", v7);

    }
    else
    {
      NSLog(CFSTR("Unexpected condition %@"), v5);
      v9 = 0;
    }

  }
  else
  {
    -[HUTriggerLocationConditionEditorSectionModule anyLocationOptionItem](self, "anyLocationOptionItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)preferredConditionFromConditions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(a3, "na_filter:", &__block_literal_global_201);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_7_2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "firstObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

uint64_t __82__HUTriggerLocationConditionEditorSectionModule_preferredConditionFromConditions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __82__HUTriggerLocationConditionEditorSectionModule_preferredConditionFromConditions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "presenceEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "presenceUserType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(&unk_1E7042D08, "containsObject:", v4);

  return v5;
}

- (id)conditionTitle
{
  return _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerLocationConditionTitle"), CFSTR("HUTriggerLocationConditionTitle"), 1);
}

- (id)noConditionSummaryTitle
{
  return _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerLocationConditionNoSelectedConditionSummary"), CFSTR("HUTriggerLocationConditionNoSelectedConditionSummary"), 1);
}

- (BOOL)conditionIsDisabled
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1E0CBA780];
  -[HUTriggerConditionEditorExpandingSectionModule home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "hf_presenceDisableReasonsForHome:", v3) != 0;

  return (char)v2;
}

- (id)buildConditionOptionItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[7];

  v12[6] = *MEMORY[0x1E0C80C00];
  _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerLocationConditionOptionNoneTitle"), CFSTR("HUTriggerLocationConditionOptionNoneTitle"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerConditionEditorExpandingSectionModule createNoConditionOptionItemWithTitle:](self, "createNoConditionOptionItemWithTitle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerLocationConditionEditorSectionModule setAnyLocationOptionItem:](self, "setAnyLocationOptionItem:", v4);
  v12[0] = v4;
  -[HUTriggerLocationConditionEditorSectionModule _createConditionItemForPresenceEventType:userType:](self, "_createConditionItemForPresenceEventType:userType:", 3, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerLocationConditionEditorSectionModule setAnyUserAtHomeOptionItem:](self, "setAnyUserAtHomeOptionItem:", v5);
  v12[1] = v5;
  -[HUTriggerLocationConditionEditorSectionModule _createConditionItemForPresenceEventType:userType:](self, "_createConditionItemForPresenceEventType:userType:", 3, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerLocationConditionEditorSectionModule setCurrentUserAtHomeOptionItem:](self, "setCurrentUserAtHomeOptionItem:", v6);
  v12[2] = v6;
  -[HUTriggerLocationConditionEditorSectionModule _createConditionItemForPresenceEventType:userType:](self, "_createConditionItemForPresenceEventType:userType:", 4, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerLocationConditionEditorSectionModule setNoUserAtHomeOptionItem:](self, "setNoUserAtHomeOptionItem:", v7);
  v12[3] = v7;
  -[HUTriggerLocationConditionEditorSectionModule _createConditionItemForPresenceEventType:userType:](self, "_createConditionItemForPresenceEventType:userType:", 4, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerLocationConditionEditorSectionModule setCurrentUserNotAtHomeOptionItem:](self, "setCurrentUserNotAtHomeOptionItem:", v8);
  v12[4] = v8;
  -[HUTriggerLocationConditionEditorSectionModule _createConditionItemForPresenceEventType:userType:](self, "_createConditionItemForPresenceEventType:userType:", 3, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerLocationConditionEditorSectionModule setCustomOptionItem:](self, "setCustomOptionItem:", v9);
  v12[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0D314C0];
  -[HUTriggerConditionEditorExpandingSectionModule itemProviders](self, "itemProviders", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestToReloadItemProviders:senderSelector:", v6, a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[HFItemModule itemUpdater](self, "itemUpdater");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "performItemUpdateRequest:", v9);

}

- (id)_conditionItemForPresenceEvent:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "presenceUserType");
  if (v5 == 1)
  {
    if (objc_msgSend(v4, "presenceEventType") == 3)
      -[HUTriggerLocationConditionEditorSectionModule currentUserAtHomeOptionItem](self, "currentUserAtHomeOptionItem");
    else
      -[HUTriggerLocationConditionEditorSectionModule currentUserNotAtHomeOptionItem](self, "currentUserNotAtHomeOptionItem");
  }
  else
  {
    if (v5 != 2)
    {
      -[HUTriggerLocationConditionEditorSectionModule customOptionItem](self, "customOptionItem");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    if (objc_msgSend(v4, "presenceEventType") == 3)
      -[HUTriggerLocationConditionEditorSectionModule anyUserAtHomeOptionItem](self, "anyUserAtHomeOptionItem");
    else
      -[HUTriggerLocationConditionEditorSectionModule noUserAtHomeOptionItem](self, "noUserAtHomeOptionItem");
  }
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_11:
  v7 = (void *)v6;

  return v7;
}

- (id)_createConditionItemForPresenceEventType:(unint64_t)a3 userType:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  id v22[2];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  id location;

  -[HUTriggerConditionEditorExpandingSectionModule home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA780]), "initWithPresenceEventType:presenceUserType:", a3, a4);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31680]), "initWithPresenceEvent:", v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31688]), "initWithCondition:home:", v9, v7);
  objc_initWeak(&location, self);
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__23;
  v27 = __Block_byref_object_dispose__23;
  v28 = 0;
  v11 = objc_alloc(MEMORY[0x1E0D31920]);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __99__HUTriggerLocationConditionEditorSectionModule__createConditionItemForPresenceEventType_userType___block_invoke_25;
  v18[3] = &unk_1E6F5A8F0;
  objc_copyWeak(v22, &location);
  v21 = &v23;
  v22[1] = (id)a4;
  v12 = v10;
  v19 = v12;
  v13 = v7;
  v20 = v13;
  v14 = objc_msgSend(v11, "initWithSourceItem:updateOptionsTransformBlock:resultsTransformBlock:", v12, &__block_literal_global_22_3, v18);
  v15 = (void *)v24[5];
  v24[5] = v14;

  v16 = (id)v24[5];
  objc_destroyWeak(v22);
  _Block_object_dispose(&v23, 8);

  objc_destroyWeak(&location);
  return v16;
}

id __99__HUTriggerLocationConditionEditorSectionModule__createConditionItemForPresenceEventType_userType___block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E70414E8, *MEMORY[0x1E0D308F8]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E7041518, *MEMORY[0x1E0D30908]);
  return v2;
}

id __99__HUTriggerLocationConditionEditorSectionModule__createConditionItemForPresenceEventType_userType___block_invoke_25(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v3 = (id *)(a1 + 56);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(WeakRetained, "selectedOptionItem");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", HFPrimaryStateFromBOOL());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30E20]);

  v8 = *(_QWORD *)(a1 + 64);
  if (v8 == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "condition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presenceEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "users");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (!v12)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
    v8 = *(_QWORD *)(a1 + 64);
  }
  if (v8 == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "users");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (!v14)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  }
  if (objc_msgSend(WeakRetained, "conditionIsDisabled"))
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);

  return v6;
}

- (HFItem)anyLocationOptionItem
{
  return self->_anyLocationOptionItem;
}

- (void)setAnyLocationOptionItem:(id)a3
{
  objc_storeStrong((id *)&self->_anyLocationOptionItem, a3);
}

- (HFTransformItem)anyUserAtHomeOptionItem
{
  return self->_anyUserAtHomeOptionItem;
}

- (void)setAnyUserAtHomeOptionItem:(id)a3
{
  objc_storeStrong((id *)&self->_anyUserAtHomeOptionItem, a3);
}

- (HFTransformItem)currentUserAtHomeOptionItem
{
  return self->_currentUserAtHomeOptionItem;
}

- (void)setCurrentUserAtHomeOptionItem:(id)a3
{
  objc_storeStrong((id *)&self->_currentUserAtHomeOptionItem, a3);
}

- (HFTransformItem)noUserAtHomeOptionItem
{
  return self->_noUserAtHomeOptionItem;
}

- (void)setNoUserAtHomeOptionItem:(id)a3
{
  objc_storeStrong((id *)&self->_noUserAtHomeOptionItem, a3);
}

- (HFTransformItem)currentUserNotAtHomeOptionItem
{
  return self->_currentUserNotAtHomeOptionItem;
}

- (void)setCurrentUserNotAtHomeOptionItem:(id)a3
{
  objc_storeStrong((id *)&self->_currentUserNotAtHomeOptionItem, a3);
}

- (HFTransformItem)customOptionItem
{
  return self->_customOptionItem;
}

- (void)setCustomOptionItem:(id)a3
{
  objc_storeStrong((id *)&self->_customOptionItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customOptionItem, 0);
  objc_storeStrong((id *)&self->_currentUserNotAtHomeOptionItem, 0);
  objc_storeStrong((id *)&self->_noUserAtHomeOptionItem, 0);
  objc_storeStrong((id *)&self->_currentUserAtHomeOptionItem, 0);
  objc_storeStrong((id *)&self->_anyUserAtHomeOptionItem, 0);
  objc_storeStrong((id *)&self->_anyLocationOptionItem, 0);
}

@end
