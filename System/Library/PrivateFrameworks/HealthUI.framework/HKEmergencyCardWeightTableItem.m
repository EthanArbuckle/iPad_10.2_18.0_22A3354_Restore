@implementation HKEmergencyCardWeightTableItem

- (id)title
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("weight"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasPresentableData
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HKEmergencyCardTableItem data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "weight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)localeDidChange:(id)a3
{
  -[HKMedicalIDEditorWeightCell _localeDidChange:](self->_editableCell, "_localeDidChange:", a3);
}

- (id)_createEditableCell
{
  HKMedicalIDEditorWeightCell *v3;
  void *v4;

  v3 = -[HKMedicalIDEditorWeightCell initWithStyle:reuseIdentifier:]([HKMedicalIDEditorWeightCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("kWeightTableItemCellIdentifier"));
  -[HKEmergencyCardWeightTableItem title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDEditorCell setLabel:](v3, "setLabel:", v4);

  -[HKMedicalIDEditorCell setMinimumLabelWidth:](v3, "setMinimumLabelWidth:", 47.0);
  -[HKMedicalIDEditorCell setEditDelegate:](v3, "setEditDelegate:", self);
  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  HKMedicalIDEditorWeightCell *v15;
  void *editableCell;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v5 = a3;
  if (-[HKEmergencyCardTableItem isInEditMode](self, "isInEditMode"))
  {
    -[HKEmergencyCardTableItem data](self, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "weight");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", CFSTR("kWeightTableItemCellIdentifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        -[HKEmergencyCardWeightTableItem _createEditableCell](self, "_createEditableCell");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[HKEmergencyCardTableItem data](self, "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "weight");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6CD0], "gramUnitWithMetricPrefix:", 9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValueForUnit:", v11);
      v13 = v12;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setKilogramValue:", v14);

      v15 = v8;
      editableCell = self->_editableCell;
      self->_editableCell = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      editableCell = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(editableCell, "localizedStringForKey:value:table:", CFSTR("add_weight"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKEmergencyCardTableItem _dequeueNoValueCellInTableView:withTitle:](self, "_dequeueNoValueCellInTableView:withTitle:", v5, v28);
      v15 = (HKMedicalIDEditorWeightCell *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    +[_HKMedicalIDMultilineStringCell defaultReuseIdentifier](_HKMedicalIDMultilineStringCell, "defaultReuseIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", v17);
    v15 = (HKMedicalIDEditorWeightCell *)objc_claimAutoreleasedReturnValue();

    -[HKEmergencyCardWeightTableItem title](self, "title");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicalIDEditorWeightCell titleLabel](v15, "titleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v18);

    -[HKEmergencyCardTableItem data](self, "data");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "weight");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "gramUnitWithMetricPrefix:", 9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValueForUnit:", v22);
    v24 = v23;

    +[HKPersonWeightFormatter sharedFormatter](HKPersonWeightFormatter, "sharedFormatter");
    editableCell = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(editableCell, "stringFromWeightInKilograms:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicalIDEditorWeightCell detailLabel](v15, "detailLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setText:", v26);

  }
  return v15;
}

- (double)tableView:(id)a3 heightForRowAtIndex:(int64_t)a4
{
  id v6;
  double v7;
  double v8;
  objc_super v10;

  v6 = a3;
  if (-[HKEmergencyCardTableItem isInEditMode](self, "isInEditMode"))
  {
    v10.receiver = self;
    v10.super_class = (Class)HKEmergencyCardWeightTableItem;
    -[HKEmergencyCardTableItem tableView:heightForRowAtIndex:](&v10, sel_tableView_heightForRowAtIndex_, v6, a4);
    v8 = v7;
  }
  else
  {
    v8 = *MEMORY[0x1E0DC53D8];
  }

  return v8;
}

- (BOOL)shouldHighlightRowAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[HKEmergencyCardTableItem data](self, "data", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "weight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[HKMedicalIDEditorWeightCell beginEditing](self->_editableCell, "beginEditing");
  return 0;
}

- (void)medicalIDEditorCellDidChangeValue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HKMedicalIDEditorWeightCell kilogramValue](self->_editableCell, "kilogramValue", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB6CD0], "gramUnitWithMetricPrefix:", 9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(v8, "doubleValue");
    objc_msgSend(v5, "quantityWithUnit:doubleValue:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKEmergencyCardTableItem data](self, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWeight:", v6);

  }
  else
  {
    -[HKEmergencyCardTableItem data](self, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWeight:", 0);
  }

}

- (int64_t)editingStyleForRowAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;

  -[HKEmergencyCardTableItem data](self, "data", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "weight");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 1;
  else
    return 2;
}

- (int64_t)commitEditingStyle:(int64_t)a3 forRowAtIndex:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3 == 1)
  {
    -[HKEmergencyCardTableItem data](self, "data", 1, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWeight:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB6CD0], "gramUnitWithMetricPrefix:", 9, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB6A28];
    +[HKMedicalIDWeightPickerDataProvider defaultKilogramValue](HKMedicalIDWeightPickerDataProvider, "defaultKilogramValue");
    objc_msgSend(v6, "quantityWithUnit:doubleValue:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKEmergencyCardTableItem data](self, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWeight:", v7);

  }
  return 2;
}

- (void)didCommitEditingStyle:(int64_t)a3 forRowAtIndex:(int64_t)a4
{
  if (a3 == 2)
    -[HKMedicalIDEditorWeightCell beginEditing](self->_editableCell, "beginEditing", 2, a4);
}

- (void)commitEditing
{
  -[HKMedicalIDEditorWeightCell commitEditing](self->_editableCell, "commitEditing");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editableCell, 0);
}

@end
