@implementation HKMedicalIDEmergencyContactFlow

- (HKMedicalIDEmergencyContactFlow)initWithPresentingViewController:(id)a3 forMedicalIDData:(id)a4
{
  id v7;
  id v8;
  HKMedicalIDEmergencyContactFlow *v9;
  HKMedicalIDEmergencyContactFlow *v10;
  HKEmergencyContactPicker *v11;
  HKEmergencyContactPicker *contactPicker;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKMedicalIDEmergencyContactFlow;
  v9 = -[HKMedicalIDEmergencyContactFlow init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_medicalIDData, a4);
    objc_storeStrong((id *)&v10->_owningViewController, a3);
    v11 = -[HKEmergencyContactPicker initWithOwningViewController:]([HKEmergencyContactPicker alloc], "initWithOwningViewController:", v10->_owningViewController);
    contactPicker = v10->_contactPicker;
    v10->_contactPicker = v11;

  }
  return v10;
}

- (void)setShouldShowSuggestedContacts:(BOOL)a3
{
  self->_shouldShowSuggestedContacts = a3;
}

- (void)fetchFamilyContactsForSuggestion
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  dispatch_get_global_queue(2, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__HKMedicalIDEmergencyContactFlow_fetchFamilyContactsForSuggestion__block_invoke;
  v3[3] = &unk_1E9C40600;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __67__HKMedicalIDEmergencyContactFlow_fetchFamilyContactsForSuggestion__block_invoke(uint64_t a1)
{
  _QWORD v1[4];
  id v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __67__HKMedicalIDEmergencyContactFlow_fetchFamilyContactsForSuggestion__block_invoke_2;
  v1[3] = &unk_1E9C40CE0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  +[HKFamilyCircleUtilities fetchFamilyContacts:](HKFamilyCircleUtilities, "fetchFamilyContacts:", v1);
  objc_destroyWeak(&v2);
}

void __67__HKMedicalIDEmergencyContactFlow_fetchFamilyContactsForSuggestion__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setSuggestedContacts:", v3);

}

- (void)setSuggestedContacts:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__HKMedicalIDEmergencyContactFlow_setSuggestedContacts___block_invoke;
  v6[3] = &unk_1E9C3FC50;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __56__HKMedicalIDEmergencyContactFlow_setSuggestedContacts___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 41) = 1;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

- (void)presentEmergencyContactFlow
{
  -[HKEmergencyContactPicker setDelegate:](self->_contactPicker, "setDelegate:", self);
  -[HKEmergencyContactPicker setIsSecondaryProfile:](self->_contactPicker, "setIsSecondaryProfile:", -[HKMedicalIDEmergencyContactFlow isSecondaryProfile](self, "isSecondaryProfile"));
  if (self->_shouldShowSuggestedContacts
    && !-[HKMedicalIDEmergencyContactFlow isSecondaryProfile](self, "isSecondaryProfile"))
  {
    -[HKEmergencyContactPicker setSuggestedContacts:](self->_contactPicker, "setSuggestedContacts:", self->_suggestedContacts);
  }
  -[HKEmergencyContactPicker presentEmergencyContactPickerForMedicalIDDataIfPossible:](self->_contactPicker, "presentEmergencyContactPickerForMedicalIDDataIfPossible:", self->_medicalIDData);
}

- (HKCoreTelephonyUtilities)coreTelephonyUtilities
{
  HKCoreTelephonyUtilities *coreTelephonyUtilities;
  HKCoreTelephonyUtilities *v4;
  HKCoreTelephonyUtilities *v5;

  coreTelephonyUtilities = self->_coreTelephonyUtilities;
  if (!coreTelephonyUtilities)
  {
    v4 = objc_alloc_init(HKCoreTelephonyUtilities);
    v5 = self->_coreTelephonyUtilities;
    self->_coreTelephonyUtilities = v4;

    coreTelephonyUtilities = self->_coreTelephonyUtilities;
  }
  return coreTelephonyUtilities;
}

- (void)emergencyContactPicker:(id)a3 didSelectContact:(id)a4
{
  -[HKMedicalIDEmergencyContactFlow _didSelectContact:property:](self, "_didSelectContact:property:", a4, 0);
}

- (void)emergencyContactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  -[HKMedicalIDEmergencyContactFlow _didSelectContact:property:](self, "_didSelectContact:property:", 0, a4);
}

- (void)_didSelectContact:(id)a3 property:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HKNavigationController *v14;
  void *v15;
  HKEmergencyContactRelationshipPicker *v16;
  void *v17;
  void *v18;
  UIViewController *owningViewController;
  HKNavigationController *v20;
  _QWORD v21[5];
  HKNavigationController *v22;

  objc_msgSend(MEMORY[0x1E0CB6F88], "emergencyContactWithContact:property:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDEmergencyContactFlow coreTelephonyUtilities](self, "coreTelephonyUtilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "phoneNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEmergencyServicePhoneNumber:", v7);

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0DC3450];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_CONTACT_NO_EMERGENCY_SERVICE_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_CONTACT_NO_EMERGENCY_SERVICE_BODY"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v11, v13, 1);
    v14 = (HKNavigationController *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v16 = (HKEmergencyContactRelationshipPicker *)objc_claimAutoreleasedReturnValue();
    -[HKEmergencyContactRelationshipPicker localizedStringForKey:value:table:](v16, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_CONTACT_NO_EMERGENCY_SERVICE_BUTTON"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKNavigationController addAction:](v14, "addAction:", v18);

  }
  else
  {
    v16 = objc_alloc_init(HKEmergencyContactRelationshipPicker);
    -[HKEmergencyContactRelationshipPicker setDelegate:](v16, "setDelegate:", self);
    objc_storeStrong((id *)&self->_selectedContact, v5);
    v14 = -[HKNavigationController initWithRootViewController:]([HKNavigationController alloc], "initWithRootViewController:", v16);
  }

  -[HKMedicalIDEmergencyContactFlow setCoreTelephonyUtilities:](self, "setCoreTelephonyUtilities:", 0);
  owningViewController = self->_owningViewController;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __62__HKMedicalIDEmergencyContactFlow__didSelectContact_property___block_invoke;
  v21[3] = &unk_1E9C3FC50;
  v21[4] = self;
  v22 = v14;
  v20 = v14;
  -[UIViewController dismissViewControllerAnimated:completion:](owningViewController, "dismissViewControllerAnimated:completion:", 1, v21);

}

uint64_t __62__HKMedicalIDEmergencyContactFlow__didSelectContact_property___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)emergencyContactRelationshipPicker:(id)a3 didChooseRelationshipNamed:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _HKEmergencyContact *selectedContact;

  v5 = a4;
  if (!self)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
      -[HKMedicalIDEmergencyContactFlow emergencyContactRelationshipPicker:didChooseRelationshipNamed:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  -[_HKEmergencyContact setRelationship:](self->_selectedContact, "setRelationship:", v5);
  -[HKMedicalIDEmergencyContactFlow delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "emergencyContactFlow:didSelectContact:", self, self->_selectedContact);

  selectedContact = self->_selectedContact;
  self->_selectedContact = 0;

  -[UIViewController dismissViewControllerAnimated:completion:](self->_owningViewController, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)emergencyContactRelationshipPickerDidCancel:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _HKEmergencyContact *selectedContact;

  if (!self)
  {
    _HKInitializeLogging();
    v4 = *MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
      -[HKMedicalIDEmergencyContactFlow emergencyContactRelationshipPicker:didChooseRelationshipNamed:].cold.1(v4, v5, (uint64_t)a3, v6, v7, v8, v9, v10);
  }
  -[HKMedicalIDEmergencyContactFlow delegate](self, "delegate", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "emergencyContactFlowDidCancel:", self);

  selectedContact = self->_selectedContact;
  self->_selectedContact = 0;

  -[UIViewController dismissViewControllerAnimated:completion:](self->_owningViewController, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (HKMedicalIDEmergencyContactFlowDelegate)delegate
{
  return (HKMedicalIDEmergencyContactFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (BOOL)shouldShowSuggestedContacts
{
  return self->_shouldShowSuggestedContacts;
}

- (void)setCoreTelephonyUtilities:(id)a3
{
  objc_storeStrong((id *)&self->_coreTelephonyUtilities, a3);
}

- (UIViewController)owningViewController
{
  return self->_owningViewController;
}

- (void)setOwningViewController:(id)a3
{
  objc_storeStrong((id *)&self->_owningViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_owningViewController, 0);
  objc_storeStrong((id *)&self->_coreTelephonyUtilities, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_suggestedContacts, 0);
  objc_storeStrong((id *)&self->_contactPicker, 0);
  objc_storeStrong((id *)&self->_selectedContact, 0);
  objc_storeStrong((id *)&self->_medicalIDData, 0);
}

- (void)emergencyContactRelationshipPicker:(uint64_t)a3 didChooseRelationshipNamed:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1D7813000, a1, a3, "HKEmergencyContactRelationshipPicker instance was not properly retained for delegate callback.", a5, a6, a7, a8, 0);
}

@end
