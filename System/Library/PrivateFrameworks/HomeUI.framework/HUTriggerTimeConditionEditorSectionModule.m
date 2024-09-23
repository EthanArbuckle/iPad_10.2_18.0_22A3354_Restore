@implementation HUTriggerTimeConditionEditorSectionModule

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
  void *v13;
  void *v14;

  v4 = a3;
  -[HUTriggerTimeConditionEditorSectionModule anyTimeOptionItem](self, "anyTimeOptionItem");
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

      if (!v12)
      {
        v13 = (void *)MEMORY[0x1E0D318F8];
        objc_msgSend(v8, "sourceItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "defaultConditionForType:", objc_msgSend(v14, "type"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
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
      -[HUTriggerTimeConditionEditorSectionModule _conditionItemForType:](self, "_conditionItemForType:", objc_msgSend(v7, "timeConditionType"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sourceItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCondition:", v7);

    }
    else
    {
      NSLog(CFSTR("Unexpected condition %@"), v5);
      v8 = 0;
    }

  }
  else
  {
    -[HUTriggerTimeConditionEditorSectionModule anyTimeOptionItem](self, "anyTimeOptionItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)preferredConditionFromConditions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(a3, "na_filter:", &__block_literal_global_118);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_6_0);
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

uint64_t __78__HUTriggerTimeConditionEditorSectionModule_preferredConditionFromConditions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

BOOL __78__HUTriggerTimeConditionEditorSectionModule_preferredConditionFromConditions___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "timeConditionType") != 3;
}

- (id)conditionTitle
{
  return _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerTimeConditionTitle"), CFSTR("HUTriggerTimeConditionTitle"), 1);
}

- (id)noConditionSummaryTitle
{
  return _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerTimeConditionNoSelectedConditionSummary"), CFSTR("HUTriggerTimeConditionNoSelectedConditionSummary"), 1);
}

- (BOOL)conditionIsDisabled
{
  return 0;
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
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerTimeConditionOptionNoneTitle"), CFSTR("HUTriggerTimeConditionOptionNoneTitle"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerConditionEditorExpandingSectionModule createNoConditionOptionItemWithTitle:](self, "createNoConditionOptionItemWithTitle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerTimeConditionEditorSectionModule setAnyTimeOptionItem:](self, "setAnyTimeOptionItem:", v4);
  -[HUTriggerTimeConditionEditorSectionModule _createConditionItemForType:](self, "_createConditionItemForType:", 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerTimeConditionEditorSectionModule setOnlyDayOptionItem:](self, "setOnlyDayOptionItem:", v5);
  v11[1] = v5;
  -[HUTriggerTimeConditionEditorSectionModule _createConditionItemForType:](self, "_createConditionItemForType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerTimeConditionEditorSectionModule setOnlyNightOptionItem:](self, "setOnlyNightOptionItem:", v6);
  v11[2] = v6;
  -[HUTriggerTimeConditionEditorSectionModule _createConditionItemForType:](self, "_createConditionItemForType:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerTimeConditionEditorSectionModule setSpecificTimesOptionItem:](self, "setSpecificTimesOptionItem:", v7);
  v11[3] = v7;
  -[HUTriggerTimeConditionEditorSectionModule _createConditionItemForType:](self, "_createConditionItemForType:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerTimeConditionEditorSectionModule setCustomOptionItem:](self, "setCustomOptionItem:", v8);
  v11[4] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)doesOptionItemRequireInitialUserConfiguration:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[HUTriggerTimeConditionEditorSectionModule specificTimesOptionItem](self, "specificTimesOptionItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[HUTriggerTimeConditionEditorSectionModule specificTimesOptionItem](self, "specificTimesOptionItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sourceItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "condition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9 == 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_conditionItemForType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case 0uLL:
      -[HUTriggerTimeConditionEditorSectionModule onlyDayOptionItem](self, "onlyDayOptionItem", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1uLL:
      -[HUTriggerTimeConditionEditorSectionModule onlyNightOptionItem](self, "onlyNightOptionItem", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      -[HUTriggerTimeConditionEditorSectionModule specificTimesOptionItem](self, "specificTimesOptionItem", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
      -[HUTriggerTimeConditionEditorSectionModule customOptionItem](self, "customOptionItem", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)_createConditionItemForType:(unint64_t)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  id v14[2];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  id location;

  objc_initWeak(&location, self);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31900]), "initWithConditionType:", a3);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__15;
  v19 = __Block_byref_object_dispose__15;
  v20 = 0;
  v5 = objc_alloc(MEMORY[0x1E0D31920]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__HUTriggerTimeConditionEditorSectionModule__createConditionItemForType___block_invoke_20;
  v11[3] = &unk_1E6F54D50;
  objc_copyWeak(v14, &location);
  v13 = &v15;
  v14[1] = (id)a3;
  v6 = v4;
  v12 = v6;
  v7 = objc_msgSend(v5, "initWithSourceItem:updateOptionsTransformBlock:resultsTransformBlock:", v6, &__block_literal_global_16, v11);
  v8 = (void *)v16[5];
  v16[5] = v7;

  v9 = (id)v16[5];
  objc_destroyWeak(v14);
  _Block_object_dispose(&v15, 8);

  objc_destroyWeak(&location);
  return v9;
}

id __73__HUTriggerTimeConditionEditorSectionModule__createConditionItemForType___block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E7040F60, *MEMORY[0x1E0D308F8]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E7040F78, *MEMORY[0x1E0D30908]);
  return v2;
}

id __73__HUTriggerTimeConditionEditorSectionModule__createConditionItemForType___block_invoke_20(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(WeakRetained, "selectedOptionItem");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", HFPrimaryStateFromBOOL());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30E20]);

  if (*(_QWORD *)(a1 + 56) == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "condition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  }

  return v6;
}

- (HFItem)anyTimeOptionItem
{
  return self->_anyTimeOptionItem;
}

- (void)setAnyTimeOptionItem:(id)a3
{
  objc_storeStrong((id *)&self->_anyTimeOptionItem, a3);
}

- (HFTransformItem)onlyDayOptionItem
{
  return self->_onlyDayOptionItem;
}

- (void)setOnlyDayOptionItem:(id)a3
{
  objc_storeStrong((id *)&self->_onlyDayOptionItem, a3);
}

- (HFTransformItem)onlyNightOptionItem
{
  return self->_onlyNightOptionItem;
}

- (void)setOnlyNightOptionItem:(id)a3
{
  objc_storeStrong((id *)&self->_onlyNightOptionItem, a3);
}

- (HFTransformItem)specificTimesOptionItem
{
  return self->_specificTimesOptionItem;
}

- (void)setSpecificTimesOptionItem:(id)a3
{
  objc_storeStrong((id *)&self->_specificTimesOptionItem, a3);
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
  objc_storeStrong((id *)&self->_specificTimesOptionItem, 0);
  objc_storeStrong((id *)&self->_onlyNightOptionItem, 0);
  objc_storeStrong((id *)&self->_onlyDayOptionItem, 0);
  objc_storeStrong((id *)&self->_anyTimeOptionItem, 0);
}

@end
