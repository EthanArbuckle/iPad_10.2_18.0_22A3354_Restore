@implementation HKEmergencyCardPrimaryLanguageTableItem

- (BOOL)hasPresentableData
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HKEmergencyCardTableItem data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryLanguageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)title
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("primary_language"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)initInEditMode:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v3 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HKEmergencyCardPrimaryLanguageTableItem;
  v4 = -[HKEmergencyCardTableItem initInEditMode:](&v17, sel_initInEditMode_);
  if (v4)
    v5 = !v3;
  else
    v5 = 1;
  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "spokenLanguagesForLanguages:includeLanguagesForRegion:", v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hk_map:", &__block_literal_global_89);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v4[8];
    v4[8] = v9;

    objc_msgSend(MEMORY[0x1E0C99DC8], "availableSpokenLanguages");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hk_map:", &__block_literal_global_196);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sortedArrayUsingComparator:", &__block_literal_global_198_0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v4[9];
    v4[9] = v14;

  }
  return v4;
}

HKSpokenLanguage *__58__HKEmergencyCardPrimaryLanguageTableItem_initInEditMode___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HKSpokenLanguage *v3;

  v2 = a2;
  v3 = -[HKSpokenLanguage initWithLanguageIdentifier:forCategory:]([HKSpokenLanguage alloc], "initWithLanguageIdentifier:forCategory:", v2, 1);

  return v3;
}

HKSpokenLanguage *__58__HKEmergencyCardPrimaryLanguageTableItem_initInEditMode___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  HKSpokenLanguage *v3;

  v2 = a2;
  v3 = -[HKSpokenLanguage initWithLanguageIdentifier:forCategory:]([HKSpokenLanguage alloc], "initWithLanguageIdentifier:forCategory:", v2, 2);

  return v3;
}

uint64_t __58__HKEmergencyCardPrimaryLanguageTableItem_initInEditMode___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "languageInCurrentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languageInCurrentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return v7;
}

- (id)_createEditableCell
{
  HKMedicalIDEditorLanguageCell *v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id location;

  v3 = -[HKMedicalIDEditorCell initWithStyle:reuseIdentifier:]([HKMedicalIDEditorLanguageCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("kPreferredLanguageTableItemCellIdentifier"));
  -[HKEmergencyCardPrimaryLanguageTableItem title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDEditorCell setLabel:](v3, "setLabel:", v4);

  -[HKMedicalIDEditorCell setMinimumLabelWidth:](v3, "setMinimumLabelWidth:", 87.0);
  -[HKMedicalIDEditorCell setEditDelegate:](v3, "setEditDelegate:", self);
  -[HKMedicalIDEditorLanguageCell setValueLanguageText:](v3, "setValueLanguageText:", self->_currentLanguage);
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__HKEmergencyCardPrimaryLanguageTableItem__createEditableCell__block_invoke;
  v6[3] = &unk_1E9C40600;
  objc_copyWeak(&v7, &location);
  -[HKMedicalIDEditorLanguageCell setBeginEditAction:](v3, "setBeginEditAction:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v3;
}

void __62__HKEmergencyCardPrimaryLanguageTableItem__createEditableCell__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentSpokenLanguageController");

}

- (void)setCurrentLanguage:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HKSpokenLanguage *v15;
  void *v16;
  HKSpokenLanguage *v17;
  HKSpokenLanguage *currentLanguage;
  id v19;

  v3 = a3;
  if (!self->_currentLanguage)
    goto LABEL_3;
  -[HKEmergencyCardTableItem data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryLanguageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSpokenLanguage identifier](self->_currentLanguage, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
LABEL_3:
    -[HKEmergencyCardTableItem data](self, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "primaryLanguageCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9 && v3)
    {
      v10 = (void *)MEMORY[0x1E0C99DC8];
      objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "spokenLanguagesForLanguages:includeLanguagesForRegion:", v11, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKEmergencyCardTableItem data](self, "data");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setPrimaryLanguageCode:", v13);

    }
    v15 = [HKSpokenLanguage alloc];
    -[HKEmergencyCardTableItem data](self, "data");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "primaryLanguageCode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HKSpokenLanguage initWithLanguageIdentifier:forCategory:](v15, "initWithLanguageIdentifier:forCategory:", v16, 0);
    currentLanguage = self->_currentLanguage;
    self->_currentLanguage = v17;

  }
}

- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  HKMedicalIDEditorLanguageCell *v9;
  void *editableCell;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v5 = a3;
  -[HKEmergencyCardPrimaryLanguageTableItem setCurrentLanguage:](self, "setCurrentLanguage:", 0);
  if (-[HKEmergencyCardTableItem isInEditMode](self, "isInEditMode"))
  {
    if (self->_isEditing
      || (-[HKEmergencyCardTableItem data](self, "data"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "primaryLanguageCode"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          v7))
    {
      objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", CFSTR("kPreferredLanguageTableItemCellIdentifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        -[HKEmergencyCardPrimaryLanguageTableItem _createEditableCell](self, "_createEditableCell");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v9 = v8;
      editableCell = self->_editableCell;
      self->_editableCell = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      editableCell = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(editableCell, "localizedStringForKey:value:table:", CFSTR("add_primary_language"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKEmergencyCardTableItem _dequeueNoValueCellInTableView:withTitle:](self, "_dequeueNoValueCellInTableView:withTitle:", v5, v16);
      v9 = (HKMedicalIDEditorLanguageCell *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    +[_HKMedicalIDMultilineStringCell defaultReuseIdentifier](_HKMedicalIDMultilineStringCell, "defaultReuseIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", v11);
    v9 = (HKMedicalIDEditorLanguageCell *)objc_claimAutoreleasedReturnValue();

    -[HKEmergencyCardPrimaryLanguageTableItem title](self, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicalIDEditorLanguageCell titleLabel](v9, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);

    -[HKEmergencyCardPrimaryLanguageTableItem attributedStringForCurrentLanguage](self, "attributedStringForCurrentLanguage");
    editableCell = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicalIDEditorLanguageCell detailLabel](v9, "detailLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAttributedText:", editableCell);

  }
  return v9;
}

- (id)attributedStringForCurrentLanguage
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB3778]);
  -[HKSpokenLanguage languageInCurrentLocale](self->_currentLanguage, "languageInCurrentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DC1138];
  v21 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithString:attributes:", v4, v7);

  -[HKSpokenLanguage languageInCurrentLocale](self->_currentLanguage, "languageInCurrentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSpokenLanguage languageInLanguageLocale](self->_currentLanguage, "languageInLanguageLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 != v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3498]);
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[HKSpokenLanguage languageInLanguageLocale](self->_currentLanguage, "languageInLanguageLocale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("\n%@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v5;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v11, "initWithString:attributes:", v14, v16);
    objc_msgSend(v8, "appendAttributedString:", v17);

  }
  return v8;
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
    v10.super_class = (Class)HKEmergencyCardPrimaryLanguageTableItem;
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
    -[HKMedicalIDEditorLanguageCell beginEditing](self->_editableCell, "beginEditing");
  return 0;
}

- (void)presentSpokenLanguageController
{
  void *v3;
  void *v4;
  HKSpokenLanguagesViewController *v5;

  -[HKEmergencyCardPrimaryLanguageTableItem setCurrentLanguage:](self, "setCurrentLanguage:", 1);
  v5 = -[HKSpokenLanguagesViewController initWithCurrentLanguage:preferredLanguages:andAllSpokenLanguages:]([HKSpokenLanguagesViewController alloc], "initWithCurrentLanguage:preferredLanguages:andAllSpokenLanguages:", self->_currentLanguage, self->_mostLikelyLanguages, self->_allSpokenLanguages);
  -[HKSpokenLanguagesViewController setPickerDelegate:](v5, "setPickerDelegate:", self);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v5);
  -[HKEmergencyCardTableItem owningViewController](self, "owningViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentViewController:animated:completion:", v3, 1, 0);

}

- (int64_t)editingStyleForRowAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  if (self->_isEditing)
    return 1;
  -[HKEmergencyCardTableItem data](self, "data", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryLanguageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

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
    objc_msgSend(v5, "setPrimaryLanguageCode:", 0);

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
    -[HKMedicalIDEditorLanguageCell beginEditing](self->_editableCell, "beginEditing");
}

- (void)didSelectCellWithLanguage:(id)a3
{
  HKSpokenLanguage *v4;
  void *v5;
  void *v6;
  HKSpokenLanguage *currentLanguage;
  HKSpokenLanguage *v8;

  v4 = (HKSpokenLanguage *)a3;
  -[HKSpokenLanguage identifier](v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardTableItem data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPrimaryLanguageCode:", v5);

  currentLanguage = self->_currentLanguage;
  self->_currentLanguage = v4;
  v8 = v4;

  -[HKMedicalIDEditorLanguageCell setValueLanguageText:](self->_editableCell, "setValueLanguageText:", self->_currentLanguage);
}

- (void)didCancelLanguageSelection
{
  id v3;

  if (!-[HKEmergencyCardPrimaryLanguageTableItem hasPresentableData](self, "hasPresentableData"))
  {
    -[HKEmergencyCardPrimaryLanguageTableItem commitEditingStyle:forRowAtIndex:](self, "commitEditingStyle:forRowAtIndex:", 1, 0);
    -[HKEmergencyCardPrimaryLanguageTableItem delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updatePrimaryLanguageTableItem");

  }
}

- (HKEmergencyCardPrimaryLanguageUpdateDelegate)delegate
{
  return (HKEmergencyCardPrimaryLanguageUpdateDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentLanguage, 0);
  objc_storeStrong((id *)&self->_allSpokenLanguages, 0);
  objc_storeStrong((id *)&self->_mostLikelyLanguages, 0);
  objc_storeStrong((id *)&self->_displayCell, 0);
  objc_storeStrong((id *)&self->_editableCell, 0);
}

@end
