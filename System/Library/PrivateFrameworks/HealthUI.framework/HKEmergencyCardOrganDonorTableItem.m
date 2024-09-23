@implementation HKEmergencyCardOrganDonorTableItem

- (id)title
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("organ_donor"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasPresentableData
{
  return 0;
}

- (id)possibleValues
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  if (+[HKOrganDonationConnectionManager hasStoredRegistrant](HKOrganDonationConnectionManager, "hasStoredRegistrant"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("organ_donor_not_set"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v3;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("organ_donor_yes"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v5;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("organ_donor_no"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v7;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("organ_donor_registered"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[3] = v9;
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = v18;
  }
  else
  {
    v12 = +[HKOrganDonationConnectionManager isOrganDonationRegistrationAvailable](HKOrganDonationConnectionManager, "isOrganDonationRegistrationAvailable");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("organ_donor_not_set"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v13 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v13;
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"), v13);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("organ_donor_yes"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v16[1] = v5;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("organ_donor_no"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v17[0] = v13;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("organ_donor_yes"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v5;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("organ_donor_no"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v7;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("organ_donor_register"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[3] = v9;
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = v17;
  }
  objc_msgSend(v10, "arrayWithObjects:count:", v11, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v14;
}

- (id)_createEditableCell
{
  HKMedicalIDEditorPickerCell *v3;
  void *v4;
  void *v5;

  v3 = -[HKMedicalIDEditorCell initWithStyle:reuseIdentifier:]([HKMedicalIDEditorPickerCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("kOrganDonorTableItemCellIdentifier"));
  -[HKEmergencyCardOrganDonorTableItem title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDEditorCell setLabel:](v3, "setLabel:", v4);

  -[HKMedicalIDEditorCell setMinimumLabelWidth:](v3, "setMinimumLabelWidth:", 87.0);
  -[HKMedicalIDEditorCell setEditDelegate:](v3, "setEditDelegate:", self);
  -[HKEmergencyCardOrganDonorTableItem possibleValues](self, "possibleValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDEditorPickerCell setPossibleValues:](v3, "setPossibleValues:", v5);

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
  HKMedicalIDEditorPickerCell *v11;
  void *editableCell;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v21;

  v5 = a3;
  if (-[HKEmergencyCardTableItem isInEditMode](self, "isInEditMode"))
  {
    if (self->_isEditing
      || (-[HKEmergencyCardTableItem data](self, "data"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "isOrganDonor"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          v7))
    {
      objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", CFSTR("kOrganDonorTableItemCellIdentifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        -[HKEmergencyCardOrganDonorTableItem _createEditableCell](self, "_createEditableCell");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[HKEmergencyCardTableItem data](self, "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "isOrganDonor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setChosenValueIndex:", +[HKMedicalIDOrganDonorPickerDataProvider emergencyCardOrganDonorStatus:](HKMedicalIDOrganDonorPickerDataProvider, "emergencyCardOrganDonorStatus:", v10));

      v11 = v8;
      editableCell = self->_editableCell;
      self->_editableCell = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      editableCell = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(editableCell, "localizedStringForKey:value:table:", CFSTR("add_organ_donor"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKEmergencyCardTableItem _dequeueNoValueCellInTableView:withTitle:](self, "_dequeueNoValueCellInTableView:withTitle:", v5, v21);
      v11 = (HKMedicalIDEditorPickerCell *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    +[_HKMedicalIDMultilineStringCell defaultReuseIdentifier](_HKMedicalIDMultilineStringCell, "defaultReuseIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", v13);
    v11 = (HKMedicalIDEditorPickerCell *)objc_claimAutoreleasedReturnValue();

    -[HKEmergencyCardOrganDonorTableItem title](self, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicalIDEditorPickerCell titleLabel](v11, "titleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v14);

    -[HKEmergencyCardTableItem data](self, "data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "isOrganDonor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = +[HKMedicalIDOrganDonorPickerDataProvider emergencyCardOrganDonorStatus:](HKMedicalIDOrganDonorPickerDataProvider, "emergencyCardOrganDonorStatus:", v17);

    +[HKMedicalIDOrganDonorPickerDataProvider displayValueForOrganDonorStatus:](HKMedicalIDOrganDonorPickerDataProvider, "displayValueForOrganDonorStatus:", v18);
    editableCell = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicalIDEditorPickerCell detailLabel](v11, "detailLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", editableCell);

  }
  return v11;
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
    v10.super_class = (Class)HKEmergencyCardOrganDonorTableItem;
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
  void *v4;
  id v5;

  if (-[HKMedicalIDEditorPickerCell chosenValueIndex](self->_editableCell, "chosenValueIndex", a3) == 3)
  {
    -[HKEmergencyCardOrganDonorTableItem promptOrganDonationRegistrationIfPossibleWithCompletion:](self, "promptOrganDonationRegistrationIfPossibleWithCompletion:", 0);
  }
  else
  {
    +[HKMedicalIDOrganDonorPickerDataProvider medicalIDOrganDonorStatus:](HKMedicalIDOrganDonorPickerDataProvider, "medicalIDOrganDonorStatus:", -[HKMedicalIDEditorPickerCell chosenValueIndex](self->_editableCell, "chosenValueIndex"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[HKEmergencyCardTableItem data](self, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIsOrganDonor:", v5);

  }
}

- (void)promptOrganDonationRegistrationIfPossibleWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HKOrganDonationIntroductionViewController *v9;
  void *v10;
  HKOrganDonationIntroductionViewController *v11;
  void *v12;
  void *v13;
  HKNavigationController *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, int);
  void *v19;
  HKEmergencyCardOrganDonorTableItem *v20;
  void (**v21)(_QWORD);
  id v22;
  id location;

  v4 = (void (**)(_QWORD))a3;
  if (+[HKOrganDonationConnectionManager isOrganDonationRegistrationAvailable](HKOrganDonationConnectionManager, "isOrganDonationRegistrationAvailable")&& !+[HKOrganDonationConnectionManager hasStoredRegistrant](HKOrganDonationConnectionManager, "hasStoredRegistrant"))
  {
    objc_initWeak(&location, self);
    v9 = [HKOrganDonationIntroductionViewController alloc];
    -[HKEmergencyCardTableItem data](self, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HKOrganDonationBaseViewController initWithMedicalIDData:](v9, "initWithMedicalIDData:", v10);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("OD_DONE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOrganDonationBaseViewController setCompletionButtonTitle:](v11, "setCompletionButtonTitle:", v13);

    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __94__HKEmergencyCardOrganDonorTableItem_promptOrganDonationRegistrationIfPossibleWithCompletion___block_invoke;
    v19 = &unk_1E9C43520;
    objc_copyWeak(&v22, &location);
    v20 = self;
    v21 = v4;
    -[HKOrganDonationBaseViewController setRegistrationCompletionHandler:](v11, "setRegistrationCompletionHandler:", &v16);
    -[HKMedicalIDEditorCell dismissInputView](self->_editableCell, "dismissInputView", v16, v17, v18, v19, v20);
    v14 = -[HKNavigationController initWithRootViewController:]([HKNavigationController alloc], "initWithRootViewController:", v11);
    -[HKEmergencyCardTableItem owningViewController](self, "owningViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "presentViewController:animated:completion:", v14, 1, 0);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    if (+[HKOrganDonationConnectionManager isOrganDonationRegistrationAvailable](HKOrganDonationConnectionManager, "isOrganDonationRegistrationAvailable")&& +[HKOrganDonationConnectionManager hasStoredRegistrant](HKOrganDonationConnectionManager, "hasStoredRegistrant"))
    {
      +[HKMedicalIDOrganDonorPickerDataProvider medicalIDOrganDonorStatus:](HKMedicalIDOrganDonorPickerDataProvider, "medicalIDOrganDonorStatus:", 3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKEmergencyCardTableItem data](self, "data");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setIsOrganDonor:", v5);

      -[HKEmergencyCardTableItem data](self, "data");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "isOrganDonor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMedicalIDEditorPickerCell setChosenValueIndex:](self->_editableCell, "setChosenValueIndex:", +[HKMedicalIDOrganDonorPickerDataProvider emergencyCardOrganDonorStatus:](HKMedicalIDOrganDonorPickerDataProvider, "emergencyCardOrganDonorStatus:", v8));

      -[HKMedicalIDEditorCell updateValueLabel](self->_editableCell, "updateValueLabel");
    }
    if (v4)
      v4[2](v4);
  }

}

void __94__HKEmergencyCardOrganDonorTableItem_promptOrganDonationRegistrationIfPossibleWithCompletion___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v12 = WeakRetained;
    objc_msgSend(WeakRetained, "owningViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

    if (a2)
    {
      +[HKMedicalIDOrganDonorPickerDataProvider medicalIDOrganDonorStatus:](HKMedicalIDOrganDonorPickerDataProvider, "medicalIDOrganDonorStatus:", 3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setIsOrganDonor:", v7);

    }
    objc_msgSend(*(id *)(a1 + 32), "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "isOrganDonor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setChosenValueIndex:", +[HKMedicalIDOrganDonorPickerDataProvider emergencyCardOrganDonorStatus:](HKMedicalIDOrganDonorPickerDataProvider, "emergencyCardOrganDonorStatus:", v10));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "updateValueLabel");
    v11 = *(_QWORD *)(a1 + 40);
    v5 = v12;
    if (v11)
    {
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v12);
      v5 = v12;
    }
  }

}

- (int64_t)editingStyleForRowAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;

  if (self->_isEditing)
    return 1;
  -[HKEmergencyCardTableItem data](self, "data", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "isOrganDonor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
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
    objc_msgSend(v5, "setIsOrganDonor:", 0);

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
  if (a3 == 2)
    -[HKMedicalIDEditorPickerCell beginEditing](self->_editableCell, "beginEditing", 2, a4);
}

- (void)commitEditing
{
  -[HKMedicalIDEditorPickerCell commitEditing](self->_editableCell, "commitEditing");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editableCell, 0);
}

@end
