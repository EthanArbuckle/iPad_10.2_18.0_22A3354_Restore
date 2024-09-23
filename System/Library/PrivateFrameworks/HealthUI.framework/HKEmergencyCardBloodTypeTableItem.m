@implementation HKEmergencyCardBloodTypeTableItem

- (BOOL)hasPresentableData
{
  void *v2;
  BOOL v3;

  -[HKEmergencyCardTableItem data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "bloodType") != 0;

  return v3;
}

- (id)title
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("blood_type"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_createEditableCell
{
  HKMedicalIDEditorPickerCell *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[10];

  v16[9] = *MEMORY[0x1E0C80C00];
  v3 = -[HKMedicalIDEditorCell initWithStyle:reuseIdentifier:]([HKMedicalIDEditorPickerCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("kBloodTypeTableItemCellIdentifier"));
  -[HKEmergencyCardBloodTypeTableItem title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDEditorCell setLabel:](v3, "setLabel:", v4);

  -[HKMedicalIDEditorCell setMinimumLabelWidth:](v3, "setMinimumLabelWidth:", 87.0);
  -[HKMedicalIDEditorCell setEditDelegate:](v3, "setEditDelegate:", self);
  HKStringForBloodType(0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v15;
  HKStringForBloodType(1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v5;
  HKStringForBloodType(2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v6;
  HKStringForBloodType(3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v7;
  HKStringForBloodType(4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v8;
  HKStringForBloodType(5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v9;
  HKStringForBloodType(6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v10;
  HKStringForBloodType(7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[7] = v11;
  HKStringForBloodType(8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDEditorPickerCell setPossibleValues:](v3, "setPossibleValues:", v13);

  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  HKMedicalIDEditorPickerCell *v10;
  void *editableCell;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  v5 = a3;
  if (-[HKEmergencyCardTableItem isInEditMode](self, "isInEditMode"))
  {
    if (self->_isEditing
      || (-[HKEmergencyCardTableItem data](self, "data"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "bloodType"),
          v6,
          v7))
    {
      objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", CFSTR("kBloodTypeTableItemCellIdentifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        -[HKEmergencyCardBloodTypeTableItem _createEditableCell](self, "_createEditableCell");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[HKEmergencyCardTableItem data](self, "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setChosenValueIndex:", objc_msgSend(v9, "bloodType"));

      v10 = v8;
      editableCell = self->_editableCell;
      self->_editableCell = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      editableCell = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(editableCell, "localizedStringForKey:value:table:", CFSTR("add_blood_type"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKEmergencyCardTableItem _dequeueNoValueCellInTableView:withTitle:](self, "_dequeueNoValueCellInTableView:withTitle:", v5, v18);
      v10 = (HKMedicalIDEditorPickerCell *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    +[_HKMedicalIDMultilineStringCell defaultReuseIdentifier](_HKMedicalIDMultilineStringCell, "defaultReuseIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", v12);
    v10 = (HKMedicalIDEditorPickerCell *)objc_claimAutoreleasedReturnValue();

    -[HKEmergencyCardBloodTypeTableItem title](self, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicalIDEditorPickerCell titleLabel](v10, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v13);

    -[HKEmergencyCardTableItem data](self, "data");
    editableCell = (void *)objc_claimAutoreleasedReturnValue();
    HKStringForBloodType(objc_msgSend(editableCell, "bloodType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicalIDEditorPickerCell detailLabel](v10, "detailLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v15);

  }
  return v10;
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
    v10.super_class = (Class)HKEmergencyCardBloodTypeTableItem;
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
  if (-[HKEmergencyCardTableItem isInEditMode](self, "isInEditMode", a3))
    -[HKMedicalIDEditorPickerCell beginEditing](self->_editableCell, "beginEditing");
  return 0;
}

- (void)medicalIDEditorCellDidChangeValue:(id)a3
{
  int64_t v4;
  id v5;

  v4 = -[HKMedicalIDEditorPickerCell chosenValueIndex](self->_editableCell, "chosenValueIndex", a3);
  -[HKEmergencyCardTableItem data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBloodType:", v4);

}

- (int64_t)editingStyleForRowAtIndex:(int64_t)a3
{
  void *v4;
  uint64_t v5;

  if (self->_isEditing)
    return 1;
  -[HKEmergencyCardTableItem data](self, "data", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "bloodType");

  if (v5)
    return 1;
  else
    return 2;
}

- (int64_t)commitEditingStyle:(int64_t)a3 forRowAtIndex:(int64_t)a4
{
  void *v5;
  BOOL v6;

  if (a3 == 1)
  {
    -[HKEmergencyCardTableItem data](self, "data", 1, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBloodType:", 0);

    v6 = 0;
  }
  else
  {
    v6 = 1;
  }
  self->_isEditing = v6;
  return 2;
}

- (void)didCommitEditingStyle:(int64_t)a3 forRowAtIndex:(int64_t)a4
{
  if (a3 == 2 && self->_isEditing)
    -[HKMedicalIDEditorPickerCell beginEditing](self->_editableCell, "beginEditing");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayCell, 0);
  objc_storeStrong((id *)&self->_editableCell, 0);
}

@end
