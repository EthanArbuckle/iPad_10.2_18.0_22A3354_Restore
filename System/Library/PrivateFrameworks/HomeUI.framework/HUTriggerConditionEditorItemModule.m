@implementation HUTriggerConditionEditorItemModule

- (HUTriggerConditionEditorItemModule)initWithItemUpdater:(id)a3 home:(id)a4 conditionCollection:(id)a5 disallowedConditionTypes:(id)a6
{
  id v11;
  id v12;
  id v13;
  HUTriggerConditionEditorItemModule *v14;
  HUTriggerConditionEditorItemModule *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HUTriggerConditionEditorItemModule;
  v14 = -[HFItemModule initWithItemUpdater:](&v17, sel_initWithItemUpdater_, a3);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_home, a4);
    objc_storeStrong((id *)&v15->_conditionCollection, a5);
    objc_storeStrong((id *)&v15->_disallowedConditionTypes, a6);
    -[HUTriggerConditionEditorItemModule _buildItemProviders](v15, "_buildItemProviders");
  }

  return v15;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v20 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[HUTriggerConditionEditorItemModule _allSectionModules](self, "_allSectionModules");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
        -[HUTriggerConditionEditorItemModule disallowedConditionTypes](self, "disallowedConditionTypes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "conditionType"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "containsObject:", v11);

        if ((v12 & 1) == 0)
        {
          objc_msgSend(v9, "buildSectionsWithDisplayedItems:", v21);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "na_flatMap:", &__block_literal_global_197);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObjectsFromArray:", v14);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("Conditions"));
  objc_msgSend(v15, "setItems:", v20);
  v16 = (void *)MEMORY[0x1E0D314B0];
  v26 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "filterSections:toDisplayedItems:", v17, v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

uint64_t __70__HUTriggerConditionEditorItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "items");
}

- (BOOL)isConditionOptionItem:(id)a3
{
  void *v3;
  BOOL v4;

  -[HUTriggerConditionEditorItemModule _moduleForConditionOptionItem:](self, "_moduleForConditionOptionItem:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)doesConditionOptionItemRequireInitialConfiguration:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HUTriggerConditionEditorItemModule _moduleForConditionOptionItem:](self, "_moduleForConditionOptionItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "doesOptionItemRequireInitialUserConfiguration:", v4);

  return v6;
}

- (id)conditionForOptionItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HUTriggerConditionEditorItemModule _moduleForConditionOptionItem:](self, "_moduleForConditionOptionItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    NSLog(CFSTR("Unrecognized option item %@"), v4);
  objc_msgSend(v5, "conditionForOptionItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateCondition:(id)a3 forOptionItem:(id)a4
{
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
  id v18;
  id v19;

  v19 = a3;
  -[HUTriggerConditionEditorItemModule _moduleForConditionOptionItem:](self, "_moduleForConditionOptionItem:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedOptionItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HUTriggerConditionEditorItemModule conditionCollection](self, "conditionCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectedOptionItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "conditionForOptionItem:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeCondition:", v11);

  }
  -[HUTriggerConditionEditorItemModule conditionCollection](self, "conditionCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addCondition:", v19);

  v13 = (id)objc_msgSend(v7, "updateSelectionWithCondition:", v19);
  v14 = (void *)MEMORY[0x1E0D314C0];
  objc_msgSend(v7, "itemProviders");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "requestToReloadItemProviders:senderSelector:", v15, a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFItemModule itemUpdater](self, "itemUpdater");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v17, "performItemUpdateRequest:", v16);

}

- (unint64_t)conditionTypeForItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;

  v5 = a3;
  -[HUTriggerConditionEditorItemModule _sectionModuleForItem:](self, "_sectionModuleForItem:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "conditionType");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTriggerConditionEditorItemModule.m"), 96, CFSTR("Unknown item %@"), v5);

    v8 = 2;
  }

  return v8;
}

- (void)conditionCollectionDidChange
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[HUTriggerConditionEditorItemModule _reloadConditionsFromConditionCollection](self, "_reloadConditionsFromConditionCollection");
  v4 = (void *)MEMORY[0x1E0D314C0];
  -[HUTriggerConditionEditorItemModule itemProviders](self, "itemProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestToReloadItemProviders:senderSelector:", v5, a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[HFItemModule itemUpdater](self, "itemUpdater");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "performItemUpdateRequest:", v8);

}

- (BOOL)shouldShowConditionOptionsForType:(unint64_t)a3
{
  void *v3;
  char v4;

  -[HUTriggerConditionEditorItemModule _expandingSectionModuleForConditionType:](self, "_expandingSectionModuleForConditionType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showOptions");

  return v4;
}

- (void)setShowConditionOptions:(BOOL)a3 forType:(unint64_t)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  -[HUTriggerConditionEditorItemModule _expandingSectionModuleForConditionType:](self, "_expandingSectionModuleForConditionType:", a4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "showOptions") != v4)
  {
    objc_msgSend(v13, "setShowOptions:", v4);
    -[HUTriggerConditionEditorItemModule _expandingSectionModules](self, "_expandingSectionModules");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __70__HUTriggerConditionEditorItemModule_setShowConditionOptions_forType___block_invoke;
    v14[3] = &unk_1E6F5A5B8;
    v15 = v13;
    objc_msgSend(v7, "na_each:", v14);

    v8 = (void *)MEMORY[0x1E0D314C0];
    -[HUTriggerConditionEditorItemModule itemProviders](self, "itemProviders");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "requestToReloadItemProviders:senderSelector:", v9, a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFItemModule itemUpdater](self, "itemUpdater");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "performItemUpdateRequest:", v10);

  }
}

uint64_t __70__HUTriggerConditionEditorItemModule_setShowConditionOptions_forType___block_invoke(uint64_t result, void *a2)
{
  if (*(void **)(result + 32) != a2)
    return objc_msgSend(a2, "setShowOptions:", 0);
  return result;
}

- (void)setSelectedConditionOptionItem:(id)a3 forType:(unint64_t)a4
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;

  v19 = a3;
  if (v19
    && !-[HUTriggerConditionEditorItemModule _isConditionOptionItem:ofType:](self, "_isConditionOptionItem:ofType:", v19, a4))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTriggerConditionEditorItemModule.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!item || [self _isConditionOptionItem:item ofType:type]"));

  }
  -[HUTriggerConditionEditorItemModule _expandingSectionModuleForConditionType:](self, "_expandingSectionModuleForConditionType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedOptionItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v19)
  {
    objc_msgSend(v7, "condition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectOptionItem:", v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[HUTriggerConditionEditorItemModule conditionCollection](self, "conditionCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeCondition:", v9);

    }
    if (v10)
    {
      -[HUTriggerConditionEditorItemModule conditionCollection](self, "conditionCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addCondition:", v10);

    }
    v13 = (void *)MEMORY[0x1E0D314C0];
    objc_msgSend(v7, "itemProviders");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "requestToReloadItemProviders:senderSelector:", v14, a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFItemModule itemUpdater](self, "itemUpdater");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v16, "performItemUpdateRequest:", v15);

  }
}

- (BOOL)isShowConditionOptionsItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HUTriggerConditionEditorItemModule _expandingSectionModules](self, "_expandingSectionModules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__HUTriggerConditionEditorItemModule_isShowConditionOptionsItem___block_invoke;
  v9[3] = &unk_1E6F5A5E0;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

BOOL __65__HUTriggerConditionEditorItemModule_isShowConditionOptionsItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "showOptionsItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)setCustomConditionEnabled:(BOOL)a3 forItem:(id)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v4 = a3;
  v19 = a4;
  -[HUTriggerConditionEditorItemModule customConditionsModule](self, "customConditionsModule");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "conditionForItem:", v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUTriggerConditionEditorItemModule customConditionsModule](self, "customConditionsModule");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isConditionEnabled:", v8);

  if (v10 != v4)
  {
    -[HUTriggerConditionEditorItemModule customConditionsModule](self, "customConditionsModule");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setConditionEnabled:forCondition:", v4, v8);

    -[HUTriggerConditionEditorItemModule conditionCollection](self, "conditionCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v4)
      objc_msgSend(v12, "addCondition:", v8);
    else
      objc_msgSend(v12, "removeCondition:", v8);

    v14 = (void *)MEMORY[0x1E0D314C0];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "requestToUpdateItems:senderSelector:", v15, a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFItemModule itemUpdater](self, "itemUpdater");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v17, "performItemUpdateRequest:", v16);

  }
}

- (BOOL)isCustomConditionSwitchItem:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HUTriggerConditionEditorItemModule customConditionsModule](self, "customConditionsModule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsItem:", v4);

  return v6;
}

- (void)_buildItemProviders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HUTriggerCustomConditionEditorSectionModule *v9;
  void *v10;
  void *v11;
  HUTriggerCustomConditionEditorSectionModule *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  -[HFItemModule itemUpdater](self, "itemUpdater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerConditionEditorItemModule home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUTriggerConditionEditorExpandingSectionModule sectionModuleForConditionType:itemUpdater:home:](HUTriggerConditionEditorExpandingSectionModule, "sectionModuleForConditionType:itemUpdater:home:", 0, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerConditionEditorItemModule setTimeConditionModule:](self, "setTimeConditionModule:", v5);

  -[HFItemModule itemUpdater](self, "itemUpdater");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerConditionEditorItemModule home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUTriggerConditionEditorExpandingSectionModule sectionModuleForConditionType:itemUpdater:home:](HUTriggerConditionEditorExpandingSectionModule, "sectionModuleForConditionType:itemUpdater:home:", 1, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerConditionEditorItemModule setLocationConditionModule:](self, "setLocationConditionModule:", v8);

  v9 = [HUTriggerCustomConditionEditorSectionModule alloc];
  -[HFItemModule itemUpdater](self, "itemUpdater");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerConditionEditorItemModule home](self, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HUTriggerCustomConditionEditorSectionModule initWithItemUpdater:home:](v9, "initWithItemUpdater:home:", v10, v11);
  -[HUTriggerConditionEditorItemModule setCustomConditionsModule:](self, "setCustomConditionsModule:", v12);

  -[HUTriggerConditionEditorItemModule _reloadConditionsFromConditionCollection](self, "_reloadConditionsFromConditionCollection");
  v13 = (void *)MEMORY[0x1E0C99E60];
  -[HUTriggerConditionEditorItemModule _allSectionModules](self, "_allSectionModules");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "na_flatMap:", &__block_literal_global_24_2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerConditionEditorItemModule setItemProviders:](self, "setItemProviders:", v15);

}

uint64_t __57__HUTriggerConditionEditorItemModule__buildItemProviders__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "itemProviders");
}

- (void)_reloadConditionsFromConditionCollection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[HUTriggerConditionEditorItemModule conditionCollection](self, "conditionCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "conditions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "mutableCopy");

  -[HUTriggerConditionEditorItemModule timeConditionModule](self, "timeConditionModule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerConditionEditorItemModule _reloadConditionForExpandingSectionModule:remainingConditions:](self, "_reloadConditionForExpandingSectionModule:remainingConditions:", v5, v10);

  -[HUTriggerConditionEditorItemModule locationConditionModule](self, "locationConditionModule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerConditionEditorItemModule _reloadConditionForExpandingSectionModule:remainingConditions:](self, "_reloadConditionForExpandingSectionModule:remainingConditions:", v6, v10);

  -[HUTriggerConditionEditorItemModule customConditionsModule](self, "customConditionsModule");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateEnabledConditions:disabledConditions:", v8, v9);

}

- (void)_reloadConditionForExpandingSectionModule:(id)a3 remainingConditions:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v5 = a4;
  objc_msgSend(v8, "preferredConditionFromConditions:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "removeObject:", v6);
  v7 = (id)objc_msgSend(v8, "updateSelectionWithCondition:", v6);

}

- (id)_allSectionModules
{
  void *v3;
  void *v4;
  void *v5;

  -[HUTriggerConditionEditorItemModule _expandingSectionModules](self, "_expandingSectionModules");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerConditionEditorItemModule customConditionsModule](self, "customConditionsModule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_expandingSectionModules
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  -[HUTriggerConditionEditorItemModule timeConditionModule](self, "timeConditionModule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  -[HUTriggerConditionEditorItemModule locationConditionModule](self, "locationConditionModule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_expandingSectionModuleForConditionType:(unint64_t)a3
{
  void *v3;

  if (a3 == 1)
  {
    -[HUTriggerConditionEditorItemModule locationConditionModule](self, "locationConditionModule");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    -[HUTriggerConditionEditorItemModule timeConditionModule](self, "timeConditionModule");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_moduleForConditionOptionItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HUTriggerConditionEditorItemModule _expandingSectionModules](self, "_expandingSectionModules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__HUTriggerConditionEditorItemModule__moduleForConditionOptionItem___block_invoke;
  v9[3] = &unk_1E6F5A5E0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __68__HUTriggerConditionEditorItemModule__moduleForConditionOptionItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "optionItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_sectionModuleForItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HUTriggerConditionEditorItemModule _allSectionModules](self, "_allSectionModules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__HUTriggerConditionEditorItemModule__sectionModuleForItem___block_invoke;
  v9[3] = &unk_1E6F5A628;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __60__HUTriggerConditionEditorItemModule__sectionModuleForItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsItem:", *(_QWORD *)(a1 + 32));
}

- (BOOL)_isConditionOptionItem:(id)a3 ofType:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  BOOL v9;

  v6 = a3;
  -[HUTriggerConditionEditorItemModule _expandingSectionModuleForConditionType:](self, "_expandingSectionModuleForConditionType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "containsItem:", v6))
  {
    objc_msgSend(v7, "showOptionsItem");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v8 != v6;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSSet)itemProviders
{
  return self->_itemProviders;
}

- (void)setItemProviders:(id)a3
{
  objc_storeStrong((id *)&self->_itemProviders, a3);
}

- (HFConditionCollection)conditionCollection
{
  return self->_conditionCollection;
}

- (HMHome)home
{
  return self->_home;
}

- (NSSet)disallowedConditionTypes
{
  return self->_disallowedConditionTypes;
}

- (HUTriggerConditionEditorExpandingSectionModule)timeConditionModule
{
  return self->_timeConditionModule;
}

- (void)setTimeConditionModule:(id)a3
{
  objc_storeStrong((id *)&self->_timeConditionModule, a3);
}

- (HUTriggerConditionEditorExpandingSectionModule)locationConditionModule
{
  return self->_locationConditionModule;
}

- (void)setLocationConditionModule:(id)a3
{
  objc_storeStrong((id *)&self->_locationConditionModule, a3);
}

- (HUTriggerCustomConditionEditorSectionModule)customConditionsModule
{
  return self->_customConditionsModule;
}

- (void)setCustomConditionsModule:(id)a3
{
  objc_storeStrong((id *)&self->_customConditionsModule, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customConditionsModule, 0);
  objc_storeStrong((id *)&self->_locationConditionModule, 0);
  objc_storeStrong((id *)&self->_timeConditionModule, 0);
  objc_storeStrong((id *)&self->_disallowedConditionTypes, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_conditionCollection, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end
