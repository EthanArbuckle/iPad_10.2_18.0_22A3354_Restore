@implementation HKEmergencyContactPicker

- (HKEmergencyContactPicker)initWithOwningViewController:(id)a3
{
  id v5;
  HKEmergencyContactPicker *v6;
  HKEmergencyContactPicker *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKEmergencyContactPicker;
  v6 = -[HKEmergencyContactPicker init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_owningViewController, a3);

  return v7;
}

- (void)presentEmergencyContactPickerForMedicalIDDataIfPossible:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "emergencyContacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 >= 10)
  {
    -[HKEmergencyContactPicker presentMaximumEmergencyContactAlert](self, "presentMaximumEmergencyContactAlert");
  }
  else
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x2050000000;
    v7 = (void *)getCNContactPickerViewControllerClass_softClass;
    v29 = getCNContactPickerViewControllerClass_softClass;
    if (!getCNContactPickerViewControllerClass_softClass)
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __getCNContactPickerViewControllerClass_block_invoke;
      v25[3] = &unk_1E9C3FDF8;
      v25[4] = &v26;
      __getCNContactPickerViewControllerClass_block_invoke((uint64_t)v25);
      v7 = (void *)v27[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v26, 8);
    v9 = objc_alloc_init(v8);
    if (v9)
    {
      v30[0] = *MEMORY[0x1E0C967C0];
      v10 = v30[0];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDisplayedPropertyKeys:", v11);

      objc_msgSend(v9, "setDelegate:", self);
      objc_msgSend(v9, "setMode:", 1);
      objc_msgSend(v9, "setOnlyRealContacts:", 1);
      -[HKEmergencyContactPicker _meContactIdentifier](self, "_meContactIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_nameContactIdentifier);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "emergencyContacts");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "valueForKeyPath:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.@count > 0"), v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "arrayWithObject:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 && !-[HKEmergencyContactPicker isSecondaryProfile](self, "isSecondaryProfile"))
      {
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %@"), *MEMORY[0x1E0C966E8], v12);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v19);

      }
      if (objc_msgSend(v15, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("!(%K IN %@)"), *MEMORY[0x1E0C966E8], v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v20);

      }
      objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPredicateForEnablingContact:", v21);

      if (-[NSArray count](self->_suggestedContacts, "count"))
      {
        objc_msgSend(v9, "setShouldDisplaySuggestionsController:", 1);
        objc_msgSend(v9, "setContactSuggestions:", self->_suggestedContacts);
      }
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("phoneNumbers.@count = 1"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPredicateForSelectionOfContact:", v22);

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("property == 'phoneNumbers'"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPredicateForSelectionOfProperty:", v23);

      -[HKEmergencyContactPicker owningViewController](self, "owningViewController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "presentViewController:animated:completion:", v9, 1, 0);

    }
  }

}

- (void)presentMaximumEmergencyContactAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_CONTACT_MAX_NUMBER_REACHED_ALERT_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_CONTACT_MAX_NUMBER_REACHED_ALERT_BODY"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v12, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_CONTACT_MAX_NUMBER_REACHED_ALERT_OK_ACTION"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithTitle:style:handler:", v9, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAction:", v10);
  -[HKEmergencyContactPicker owningViewController](self, "owningViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  HKEmergencyContactPickerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "emergencyContactPicker:didSelectContact:", self, v6);

}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  HKEmergencyContactPickerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "emergencyContactPicker:didSelectContactProperty:", self, v6);

}

- (id)_meContactIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  __CFString *v7;
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) == 3)
  {
    objc_msgSend(MEMORY[0x1E0C97298], "storeWithOptions:", 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = *MEMORY[0x1E0C966E8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    objc_msgSend(v2, "_ios_meContactWithKeysToFetch:error:", v3, &v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v9;

    if (v5)
    {
      _HKInitializeLogging();
      v6 = *MEMORY[0x1E0CB52C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
        -[HKEmergencyContactPicker _meContactIdentifier].cold.1((uint64_t)v5, v6);
    }
    objc_msgSend(v4, "identifier");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &stru_1E9C4C428;
  }
  return v7;
}

- (UIViewController)owningViewController
{
  return self->_owningViewController;
}

- (void)setOwningViewController:(id)a3
{
  objc_storeStrong((id *)&self->_owningViewController, a3);
}

- (HKEmergencyContactPickerDelegate)delegate
{
  return (HKEmergencyContactPickerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isSecondaryProfile
{
  return self->_isSecondaryProfile;
}

- (void)setIsSecondaryProfile:(BOOL)a3
{
  self->_isSecondaryProfile = a3;
}

- (NSArray)suggestedContacts
{
  return self->_suggestedContacts;
}

- (void)setSuggestedContacts:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedContacts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedContacts, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_owningViewController, 0);
}

- (void)_meContactIdentifier
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D7813000, a2, OS_LOG_TYPE_ERROR, "Error fetching me contact: %@", (uint8_t *)&v2, 0xCu);
}

@end
