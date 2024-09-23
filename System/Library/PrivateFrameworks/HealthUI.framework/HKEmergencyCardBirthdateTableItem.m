@implementation HKEmergencyCardBirthdateTableItem

- (id)initInEditMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v7;
  objc_super v8;

  v3 = a3;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKEmergencyCardBirthdateTableItem.m"), 28, CFSTR("HKEmergencyCardBirthdateTableItem only supports edit mode"));

  }
  v8.receiver = self;
  v8.super_class = (Class)HKEmergencyCardBirthdateTableItem;
  return -[HKEmergencyCardTableItem initInEditMode:](&v8, sel_initInEditMode_, v3);
}

- (id)title
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("birthdate"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)timeZoneDidChange:(id)a3
{
  NSCalendar *gregorianCalendar;

  gregorianCalendar = self->_gregorianCalendar;
  self->_gregorianCalendar = 0;

}

- (id)_createEditableCell
{
  HKMedicalIDEditorDateCell *v3;
  void *v4;

  v3 = -[HKMedicalIDEditorCell initWithStyle:reuseIdentifier:]([HKMedicalIDEditorDateCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("kBirthdateTableItemCellIdentifier"));
  -[HKEmergencyCardBirthdateTableItem title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDEditorCell setLabel:](v3, "setLabel:", v4);

  -[HKMedicalIDEditorCell setMinimumLabelWidth:](v3, "setMinimumLabelWidth:", 47.0);
  -[HKMedicalIDEditorCell setEditDelegate:](v3, "setEditDelegate:", self);
  return v3;
}

- (double)tableView:(id)a3 heightForRowAtIndex:(int64_t)a4
{
  if (HKUIApplicationIsUsingAccessibilityContentSizeCategory())
    return *MEMORY[0x1E0DC53D8];
  else
    return 44.0 + 24.0 - 6.0;
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
  void *v12;
  HKMedicalIDEditorDateCell *v13;
  void *editableCell;
  void *v15;

  v5 = a3;
  -[HKEmergencyCardTableItem data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "gregorianBirthday");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", CFSTR("kBirthdateTableItemCellIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      -[HKEmergencyCardBirthdateTableItem _createEditableCell](self, "_createEditableCell");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[HKEmergencyCardBirthdateTableItem _cachedCalendar](self, "_cachedCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKEmergencyCardTableItem data](self, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "gregorianBirthday");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateFromComponents:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDateValue:", v12);

    v13 = v8;
    editableCell = self->_editableCell;
    self->_editableCell = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    editableCell = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(editableCell, "localizedStringForKey:value:table:", CFSTR("add_birthdate"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKEmergencyCardTableItem _dequeueNoValueCellInTableView:withTitle:](self, "_dequeueNoValueCellInTableView:withTitle:", v5, v15);
    v13 = (HKMedicalIDEditorDateCell *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (BOOL)shouldHighlightRowAtIndex:(int64_t)a3
{
  -[HKMedicalIDEditorDateCell beginEditing](self->_editableCell, "beginEditing", a3);
  return 0;
}

- (int64_t)editingStyleForRowAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;

  -[HKEmergencyCardTableItem data](self, "data", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gregorianBirthday");
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

  if (a3 == 1)
  {
    -[HKEmergencyCardTableItem data](self, "data", 1, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGregorianBirthday:", 0);
  }
  else
  {
    HKUIDefaultGregorianBirthday();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKEmergencyCardTableItem data](self, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGregorianBirthday:", v5);

  }
  return 2;
}

- (void)didCommitEditingStyle:(int64_t)a3 forRowAtIndex:(int64_t)a4
{
  if (a3 == 2)
    -[HKMedicalIDEditorDateCell beginEditing](self->_editableCell, "beginEditing", 2, a4);
}

- (void)medicalIDEditorCellDidChangeValue:(id)a3
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HKMedicalIDEditorDateCell dateValue](self->_editableCell, "dateValue", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[HKEmergencyCardBirthdateTableItem _cachedCalendar](self, "_cachedCalendar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hk_dateOfBirthDateComponentsWithDate:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[HKEmergencyCardTableItem data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGregorianBirthday:", v5);

  v7 = v8;
  if (v8)
  {

    v7 = v8;
  }

}

- (id)_cachedCalendar
{
  NSCalendar *gregorianCalendar;
  NSCalendar *v4;
  NSCalendar *v5;

  gregorianCalendar = self->_gregorianCalendar;
  if (!gregorianCalendar)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
    v4 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
    v5 = self->_gregorianCalendar;
    self->_gregorianCalendar = v4;

    gregorianCalendar = self->_gregorianCalendar;
  }
  return gregorianCalendar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_editableCell, 0);
}

@end
