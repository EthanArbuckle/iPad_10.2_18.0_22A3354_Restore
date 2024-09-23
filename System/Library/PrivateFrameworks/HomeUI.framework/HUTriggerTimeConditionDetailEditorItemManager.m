@implementation HUTriggerTimeConditionDetailEditorItemManager

- (HUTriggerTimeConditionDetailEditorItemManager)initWithDelegate:(id)a3 rangeCondition:(id)a4
{
  id v7;
  HUTriggerTimeConditionDetailEditorItemManager *v8;
  HUTriggerTimeConditionDetailEditorItemManager *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUTriggerTimeConditionDetailEditorItemManager;
  v8 = -[HFItemManager initWithDelegate:sourceItem:](&v11, sel_initWithDelegate_sourceItem_, a3, 0);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_rangeCondition, a4);

  return v9;
}

- (id)primitiveConditionForPickerItem:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  -[HUTriggerTimeConditionDetailEditorItemManager startConditionPickerItem](self, "startConditionPickerItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[HUTriggerTimeConditionDetailEditorItemManager rangeCondition](self, "rangeCondition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startCondition");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v7 = (void *)v9;

    goto LABEL_7;
  }
  -[HUTriggerTimeConditionDetailEditorItemManager endConditionPickerItem](self, "endConditionPickerItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[HUTriggerTimeConditionDetailEditorItemManager rangeCondition](self, "rangeCondition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endCondition");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  NSLog(CFSTR("Item %@ is not a picker item!"), v4);
  v7 = 0;
LABEL_7:

  return v7;
}

- (void)setPrimitiveCondition:(id)a3 forPickerItem:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  -[HUTriggerTimeConditionDetailEditorItemManager startConditionPickerItem](self, "startConditionPickerItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    v9 = objc_alloc(MEMORY[0x1E0D31910]);
    -[HUTriggerTimeConditionDetailEditorItemManager rangeCondition](self, "rangeCondition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endCondition");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v9;
    v13 = v17;
    v14 = v11;
LABEL_6:
    v16 = (void *)objc_msgSend(v12, "initWithStartCondition:endCondition:", v13, v14);
    -[HUTriggerTimeConditionDetailEditorItemManager setRangeCondition:](self, "setRangeCondition:", v16);

    goto LABEL_7;
  }
  -[HUTriggerTimeConditionDetailEditorItemManager endConditionPickerItem](self, "endConditionPickerItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    v15 = objc_alloc(MEMORY[0x1E0D31910]);
    -[HUTriggerTimeConditionDetailEditorItemManager rangeCondition](self, "rangeCondition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startCondition");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v15;
    v13 = v11;
    v14 = v17;
    goto LABEL_6;
  }
  NSLog(CFSTR("Unknown item %@"), v6);
LABEL_7:

}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0D31840]);
  v5 = MEMORY[0x1E0C9AA70];
  v6 = (void *)objc_msgSend(v4, "initWithResults:", MEMORY[0x1E0C9AA70]);
  -[HUTriggerTimeConditionDetailEditorItemManager setStartConditionPickerItem:](self, "setStartConditionPickerItem:", v6);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31840]), "initWithResults:", v5);
  -[HUTriggerTimeConditionDetailEditorItemManager setEndConditionPickerItem:](self, "setEndConditionPickerItem:", v7);

  v8 = (void *)MEMORY[0x1E0C99E60];
  -[HUTriggerTimeConditionDetailEditorItemManager startConditionPickerItem](self, "startConditionPickerItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  -[HUTriggerTimeConditionDetailEditorItemManager endConditionPickerItem](self, "endConditionPickerItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", v12);
  v16 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("start"));
  _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerTimeConditionDetailEditorStartSectionTitle"), CFSTR("HUTriggerTimeConditionDetailEditorStartSectionTitle"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHeaderTitle:", v6);

  -[HUTriggerTimeConditionDetailEditorItemManager startConditionPickerItem](self, "startConditionPickerItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItems:", v8);

  objc_msgSend(v4, "addObject:", v5);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("end"));
  _HULocalizedStringWithDefaultValue(CFSTR("HUTriggerTimeConditionDetailEditorEndSectionTitle"), CFSTR("HUTriggerTimeConditionDetailEditorEndSectionTitle"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHeaderTitle:", v10);

  -[HUTriggerTimeConditionDetailEditorItemManager endConditionPickerItem](self, "endConditionPickerItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setItems:", v12);

  objc_msgSend(v4, "addObject:", v9);
  return v4;
}

- (HFItem)startConditionPickerItem
{
  return self->_startConditionPickerItem;
}

- (void)setStartConditionPickerItem:(id)a3
{
  objc_storeStrong((id *)&self->_startConditionPickerItem, a3);
}

- (HFItem)endConditionPickerItem
{
  return self->_endConditionPickerItem;
}

- (void)setEndConditionPickerItem:(id)a3
{
  objc_storeStrong((id *)&self->_endConditionPickerItem, a3);
}

- (HFTimeRangeCondition)rangeCondition
{
  return self->_rangeCondition;
}

- (void)setRangeCondition:(id)a3
{
  objc_storeStrong((id *)&self->_rangeCondition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rangeCondition, 0);
  objc_storeStrong((id *)&self->_endConditionPickerItem, 0);
  objc_storeStrong((id *)&self->_startConditionPickerItem, 0);
}

@end
