@implementation HKEmergencyCardContactsTableItem

- (id)initInEditMode:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKEmergencyCardContactsTableItem;
  return -[HKEmergencyCardTableItem initInEditMode:](&v4, sel_initInEditMode_, a3);
}

- (BOOL)hasPresentableData
{
  void *v3;
  void *v4;
  BOOL v5;

  -[HKEmergencyCardTableItem data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emergencyContacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    v5 = 1;
  else
    v5 = -[HKEmergencyCardTableItem shouldShowHints](self, "shouldShowHints");

  return v5;
}

- (int64_t)itemTypeForRowIndex:(int64_t)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  int64_t v11;
  _BOOL4 v12;
  void *v14;
  void *v15;
  uint64_t v16;

  v5 = -[HKEmergencyCardTableItem isInEditMode](self, "isInEditMode");
  -[HKEmergencyCardTableItem data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "emergencyContacts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  v9 = v8;
  if (v5)
  {

    v10 = v9 == a3;
    v11 = 3;
    goto LABEL_10;
  }
  if (v8)
  {

LABEL_9:
    -[HKEmergencyCardTableItem data](self, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "emergencyContacts");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    v10 = v16 == a3;
    v11 = 1;
LABEL_10:
    if (v10)
      return v11 + 1;
    else
      return v11;
  }
  v12 = -[HKEmergencyCardTableItem shouldShowHints](self, "shouldShowHints");

  if (!v12)
    goto LABEL_9;
  if (a3)
    return 2;
  else
    return 5;
}

- (int64_t)contactIndexForRowIndex:(int64_t)a3
{
  return a3;
}

- (void)callEmergencyContact:(id)a3
{
  id v3;

  objc_msgSend(a3, "phoneNumber");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[HKMedicalIDTelephoneUtilities callEmergencyContact:](HKMedicalIDTelephoneUtilities, "callEmergencyContact:", v3);

}

- (int64_t)numberOfRows
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;
  _BOOL4 v7;
  uint64_t v8;

  -[HKEmergencyCardTableItem data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emergencyContacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = v5 + -[HKEmergencyCardTableItem isInEditMode](self, "isInEditMode");
  if (!-[HKEmergencyCardTableItem isInEditMode](self, "isInEditMode")
    && -[HKEmergencyCardTableItem shouldShowHints](self, "shouldShowHints")
    && v6 == 0)
  {
    v6 = 1;
  }
  if (!-[HKEmergencyCardTableItem isInEditMode](self, "isInEditMode"))
  {
    v7 = -[HKEmergencyCardTableItem shouldShowHints](self, "shouldShowHints");
    v8 = v6 > 0 || v7;
    v6 += v8;
  }
  return v6;
}

- (BOOL)refreshFromData:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  char v7;

  v3 = a3;
  if (-[HKEmergencyCardTableItem isInEditMode](self, "isInEditMode"))
    v5 = -[HKEmergencyCardTableItem isSecondaryProfile](self, "isSecondaryProfile") & v3;
  else
    v5 = 0;
  -[HKEmergencyCardTableItem data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "updateEmergencyContactsAutopopulateForSecondaryProfileIfEmpty:", v5);

  return v7;
}

- (id)_dequeueAndConfigureContactViewCellForIndex:(int64_t)a3 inTableView:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = -[HKEmergencyCardContactsTableItem itemTypeForRowIndex:](self, "itemTypeForRowIndex:", a3);
  if (v7 == 5)
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", 0x1E9C5C0E8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v7 == 2)
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", 0x1E9C5BA48);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKEmergencyCardContactsTableItem _footerAttributedText](self, "_footerAttributedText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFooterAttributedText:", v9);

  }
  else
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", 0x1E9C65F68);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKEmergencyCardTableItem data](self, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "emergencyContacts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", -[HKEmergencyCardContactsTableItem contactIndexForRowIndex:](self, "contactIndexForRowIndex:", a3));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContact:", v12);

  }
  return v8;
}

- (id)_footerAttributedText
{
  if (-[HKEmergencyCardTableItem isSecondaryProfile](self, "isSecondaryProfile"))
    -[HKEmergencyCardContactsTableItem _footerAttributedTextForSecondaryProfile](self, "_footerAttributedTextForSecondaryProfile");
  else
    -[HKEmergencyCardContactsTableItem _footerAttributedTextForPrimaryProfile](self, "_footerAttributedTextForPrimaryProfile");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_footerAttributedTextForPrimaryProfile
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_CONTACT_HINT_CONCATENATION_RULE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_CONTACT_HINT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_CONTACT_HINT_PROMPT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x1E0CB3778]);
  v11 = *MEMORY[0x1E0DC1140];
  v30[0] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v12;
  v13 = *MEMORY[0x1E0DC1138];
  v30[1] = *MEMORY[0x1E0DC1138];
  v14 = *MEMORY[0x1E0DC4AB8];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v10, "initWithString:attributes:", v9, v16);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_CONTACT_HINT_PROMPT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v9, "rangeOfString:", v19);
  v22 = v21;

  if (v20 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v28[0] = v11;
    HKHealthKeyColor();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v23;
    v28[1] = *MEMORY[0x1E0DC1160];
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=EMERGENCY_SOS%23-64"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v24;
    v28[2] = v13;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAttributes:range:", v26, v20, v22);

  }
  return v17;
}

- (id)_footerAttributedTextForSecondaryProfile
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[HKEmergencyCardContactsTableItem _footerTextForSecondaryProfile](self, "_footerTextForSecondaryProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0CB3498]);
  v9[0] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithString:attributes:", v2, v6);

  return v7;
}

- (id)_footerTextForSecondaryProfile
{
  void *v3;
  void *v4;

  -[HKEmergencyCardTableItem profileFirstName](self, "profileFirstName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardContactsTableItem _footerTextWithGivenName:](self, "_footerTextWithGivenName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_footerTextWithGivenName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_CONTACT_HINT_WITH_NAME_%@_%@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-tinker"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v6, v4, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_dequeueAndConfigureContactEditCellForIndex:(int64_t)a3 inTableView:(id)a4
{
  HKMedicalIDEditorEmergencyContactCell *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a4, "dequeueReusableCellWithIdentifier:", CFSTR("contactsTableItemEditCell"));
  v6 = (HKMedicalIDEditorEmergencyContactCell *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = -[HKMedicalIDEditorEmergencyContactCell initWithStyle:reuseIdentifier:]([HKMedicalIDEditorEmergencyContactCell alloc], "initWithStyle:reuseIdentifier:", 1, CFSTR("contactsTableItemEditCell"));
    -[HKMedicalIDEditorCell setEditDelegate:](v6, "setEditDelegate:", self);
    -[HKMedicalIDEditorCell setMinimumLabelWidth:](v6, "setMinimumLabelWidth:", 87.0);
  }
  -[HKEmergencyCardTableItem data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "emergencyContacts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDEditorEmergencyContactCell setContact:](v6, "setContact:", v9);

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v6 = a3;
  if (!-[HKEmergencyCardTableItem isInEditMode](self, "isInEditMode"))
  {
    -[HKEmergencyCardContactsTableItem _dequeueAndConfigureContactViewCellForIndex:inTableView:](self, "_dequeueAndConfigureContactViewCellForIndex:inTableView:", a4, v6);
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v15 = (void *)v16;
    goto LABEL_7;
  }
  -[HKEmergencyCardTableItem data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "emergencyContacts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 != a4)
  {
    -[HKEmergencyCardContactsTableItem _dequeueAndConfigureContactEditCellForIndex:inTableView:](self, "_dequeueAndConfigureContactEditCellForIndex:inTableView:", a4, v6);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[HKEmergencyCardTableItem data](self, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "emergencyContacts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count") > 9;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("add_emergency_contact"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardTableItem _dequeueNoValueCellInTableView:withTitle:disabled:](self, "_dequeueNoValueCellInTableView:withTitle:disabled:", v6, v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)&self->_lastDequeuedAddContactCell, v15);
  -[HKEmergencyCardContactsTableItem _setupContactPickingFlow](self, "_setupContactPickingFlow");
LABEL_7:

  return v15;
}

- (id)title
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("contacts"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)tableView:(id)a3 heightForRowAtIndex:(int64_t)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (BOOL)shouldHighlightRowAtIndex:(int64_t)a3
{
  int64_t v3;

  v3 = -[HKEmergencyCardContactsTableItem itemTypeForRowIndex:](self, "itemTypeForRowIndex:", a3);
  return v3 == 1 || v3 == 4;
}

- (void)_setupContactPickingFlow
{
  HKMedicalIDEmergencyContactFlow *v3;
  void *v4;
  void *v5;
  HKMedicalIDEmergencyContactFlow *v6;
  HKMedicalIDEmergencyContactFlow *contactPicker;

  v3 = [HKMedicalIDEmergencyContactFlow alloc];
  -[HKEmergencyCardTableItem owningViewController](self, "owningViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardTableItem data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKMedicalIDEmergencyContactFlow initWithPresentingViewController:forMedicalIDData:](v3, "initWithPresentingViewController:forMedicalIDData:", v4, v5);
  contactPicker = self->_contactPicker;
  self->_contactPicker = v6;

  -[HKMedicalIDEmergencyContactFlow setIsSecondaryProfile:](self->_contactPicker, "setIsSecondaryProfile:", -[HKEmergencyCardTableItem isSecondaryProfile](self, "isSecondaryProfile"));
  -[HKMedicalIDEmergencyContactFlow setDelegate:](self->_contactPicker, "setDelegate:", self);
  -[HKMedicalIDEmergencyContactFlow fetchFamilyContactsForSuggestion](self->_contactPicker, "fetchFamilyContactsForSuggestion");
}

- (void)_presentEmergencyContactPickerIfPossible
{
  -[HKMedicalIDEmergencyContactFlow presentEmergencyContactFlow](self->_contactPicker, "presentEmergencyContactFlow");
}

- (void)tableView:(id)a3 didSelectRowAtIndex:(int64_t)a4
{
  id v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  objc_msgSend(v6, "indexPathForSelectedRow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);

  v8 = -[HKEmergencyCardContactsTableItem itemTypeForRowIndex:](self, "itemTypeForRowIndex:", a4);
  if (v8 == 4)
  {
    -[HKEmergencyCardContactsTableItem _presentEmergencyContactPickerIfPossible](self, "_presentEmergencyContactPickerIfPossible");
  }
  else if (v8 == 1)
  {
    -[HKEmergencyCardTableItem data](self, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "emergencyContacts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", -[HKEmergencyCardContactsTableItem contactIndexForRowIndex:](self, "contactIndexForRowIndex:", a4));
    v11 = (id)objc_claimAutoreleasedReturnValue();

    -[HKEmergencyCardContactsTableItem callEmergencyContact:](self, "callEmergencyContact:", v11);
  }
}

- (int64_t)editingStyleForRowAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  -[HKEmergencyCardTableItem data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emergencyContacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == a3)
    return 2;
  else
    return 1;
}

- (int64_t)commitEditingStyle:(int64_t)a3 forRowAtIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3 == 1)
  {
    -[HKEmergencyCardTableItem data](self, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "emergencyContacts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "removeObjectAtIndex:", -[HKEmergencyCardContactsTableItem contactIndexForRowIndex:](self, "contactIndexForRowIndex:", a4));
    -[HKEmergencyCardTableItem data](self, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEmergencyContacts:", v8);

    return 1;
  }
  else
  {
    -[HKEmergencyCardContactsTableItem _presentEmergencyContactPickerIfPossible](self, "_presentEmergencyContactPickerIfPossible", a3, a4);
    return 0;
  }
}

- (void)medicalIDEditorCellDidTapLabel:(id)a3
{
  _HKEmergencyContact *v4;
  _HKEmergencyContact *selectedContact;
  HKNavigationController *v6;
  void *v7;
  HKEmergencyContactRelationshipPicker *v8;

  objc_msgSend(a3, "contact");
  v4 = (_HKEmergencyContact *)objc_claimAutoreleasedReturnValue();
  selectedContact = self->_selectedContact;
  self->_selectedContact = v4;

  v8 = objc_alloc_init(HKEmergencyContactRelationshipPicker);
  -[HKEmergencyContactRelationshipPicker setDelegate:](v8, "setDelegate:", self);
  v6 = -[HKNavigationController initWithRootViewController:]([HKNavigationController alloc], "initWithRootViewController:", v8);
  -[HKEmergencyCardTableItem owningViewController](self, "owningViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)emergencyContactRelationshipPicker:(id)a3 didChooseRelationshipNamed:(id)a4
{
  _HKEmergencyContact *selectedContact;
  void *v6;
  id v7;

  -[_HKEmergencyContact setRelationship:](self->_selectedContact, "setRelationship:", a4);
  selectedContact = self->_selectedContact;
  self->_selectedContact = 0;

  -[HKEmergencyCardTableItem owningViewController](self, "owningViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

  -[HKEmergencyCardContactsTableItem delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateEmergencyContactTableItem");

}

- (void)emergencyContactRelationshipPickerDidCancel:(id)a3
{
  _HKEmergencyContact *selectedContact;
  id v5;

  selectedContact = self->_selectedContact;
  self->_selectedContact = 0;

  -[HKEmergencyCardTableItem owningViewController](self, "owningViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_addEmergencyContactToData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HKEmergencyCardTableItem data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emergencyContacts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "arrayByAddingObject:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (getSOSUtilitiesClass_0() && (objc_msgSend(getSOSUtilitiesClass_0(), "isAllowedToMessageSOSContacts") & 1) == 0)
    objc_msgSend(getSOSUtilitiesClass_0(), "setAllowedToMessageSOSContacts:", 1);
  -[HKEmergencyCardTableItem data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEmergencyContacts:", v7);

  -[HKEmergencyCardContactsTableItem delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateEmergencyContactTableItem");

}

- (void)emergencyContactFlow:(id)a3 didSelectContact:(id)a4
{
  _HKEmergencyContact *selectedContact;

  -[HKEmergencyCardContactsTableItem _addEmergencyContactToData:](self, "_addEmergencyContactToData:", a4);
  selectedContact = self->_selectedContact;
  self->_selectedContact = 0;

}

- (void)emergencyContactFlowDidCancel:(id)a3
{
  _HKEmergencyContact *selectedContact;

  selectedContact = self->_selectedContact;
  self->_selectedContact = 0;

}

- (id)titleForFooter
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  if (!-[HKEmergencyCardTableItem isInEditMode](self, "isInEditMode"))
    return &stru_1E9C4C428;
  if (-[HKEmergencyCardTableItem isSecondaryProfile](self, "isSecondaryProfile"))
  {
    -[HKEmergencyCardContactsTableItem _footerTextForSecondaryProfile](self, "_footerTextForSecondaryProfile");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v4 = (void *)getSOSManagerClass_softClass;
  v12 = getSOSManagerClass_softClass;
  if (!getSOSManagerClass_softClass)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __getSOSManagerClass_block_invoke;
    v8[3] = &unk_1E9C3FDF8;
    v8[4] = &v9;
    __getSOSManagerClass_block_invoke((uint64_t)v8);
    v4 = (void *)v10[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v9, 8);
  if ((objc_msgSend(v5, "deviceSupportsSOS") & 1) == 0
    && !objc_msgSend(MEMORY[0x1E0CB6F18], "hasPairedWatch"))
  {
    return &stru_1E9C4C428;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_CONTACT_FOOTNOTE_LONG"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)titleForHeader
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_CONTACT_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HKEmergencyCardContactUpdateDelegate)delegate
{
  return (HKEmergencyCardContactUpdateDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contactPicker, 0);
  objc_storeStrong((id *)&self->_selectedContact, 0);
  objc_storeStrong((id *)&self->_lastDequeuedAddContactCell, 0);
}

@end
