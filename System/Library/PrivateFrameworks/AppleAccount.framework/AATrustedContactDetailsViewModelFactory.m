@implementation AATrustedContactDetailsViewModelFactory

- (id)viewModelForFlow:(unint64_t)a3 withContact:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_opt_new();
  switch(a3)
  {
    case 0uLL:
      -[AATrustedContactDetailsViewModelFactory prepareForMyCustodianFlow:withContact:](self, "prepareForMyCustodianFlow:withContact:", v7, v6);
      break;
    case 1uLL:
      -[AATrustedContactDetailsViewModelFactory prepareForCustodianForFlow:withContact:](self, "prepareForCustodianForFlow:withContact:", v7, v6);
      break;
    case 2uLL:
      -[AATrustedContactDetailsViewModelFactory prepareForMyBeneficiaryFlow:withContact:](self, "prepareForMyBeneficiaryFlow:withContact:", v7, v6);
      break;
    case 3uLL:
      -[AATrustedContactDetailsViewModelFactory prepareForMyBenefactorFlow:withContact:](self, "prepareForMyBenefactorFlow:withContact:", v7, v6);
      break;
    default:
      break;
  }
  objc_msgSend(v7, "setContact:", v6);

  return v7;
}

- (void)prepareForMyCustodianFlow:(id)a3 withContact:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v32 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MY_RECOVERY_CONTACT_TITLE"), 0, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTitle:", v7);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MY_RECOVERY_CONTACT_DETAILS"), 0, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setDetailsLabel:", v9);

  v10 = objc_msgSend(v5, "trustedContactStatus");
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v10 == 1)
  {
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("MY_RECOVERY_CONTACT_DETAILS_SUBTITLE_PENDING"), 0, CFSTR("Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstNameOrHandleForDisplay");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setDetailsSubtitle:", v16);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("RESEND_INVITATION"), 0, CFSTR("Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setPrimaryActionText:", v17);
  }
  else
  {
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("MY_RECOVERY_CONTACT_DETAILS_SUBTITLE_ACCEPTED"), 0, CFSTR("Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstNameOrHandleForDisplay");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setDetailsSubtitle:", v19);

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("REMOVE_CONTACT"), 0, CFSTR("Localizable"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setDestructiveActionText:", v21);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("REMOVE_RECOVERY_CONTACT_ALERT_TITLE"), 0, CFSTR("Localizable"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setDestructiveActionSheetTitle:", v23);

  v24 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("MY_RECOVERY_CONTACT_REMOVE_DETAILS"), 0, CFSTR("Localizable"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstNameOrHandleForDisplay");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstNameOrHandleForDisplay");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setDestructiveActionSheetDetails:", v29);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("CANCEL"), 0, CFSTR("Localizable"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setDestructiveActionSheetCancelText:", v31);

  objc_msgSend(v32, "setDestructiveActionRequiresAuth:", 1);
}

- (void)prepareForCustodianForFlow:(id)a3 withContact:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v5 = (void *)MEMORY[0x1E0CB34D0];
  v6 = a4;
  v33 = a3;
  objc_msgSend(v5, "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("RECOVERY_CONTACT_FOR_TITLE"), 0, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setTitle:", v8);

  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("RECOVERY_CONTACT_FOR_DETAILS"), 0, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstNameOrHandleForDisplay");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setDetailsLabel:", v13);

  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("RECOVERY_CONTACT_FOR_DETAILS_SUBTITLE"), 0, CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstNameOrHandleForDisplay");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setDetailsSubtitle:", v18);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("RECOVERY_CONTACT_FOR_HELP"), 0, CFSTR("Localizable"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setPrimaryActionText:", v20);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("REMOVE"), 0, CFSTR("Localizable"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setDestructiveActionText:", v22);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("REMOVE_CUSTODIANSHIP_ALERT_TITLE"), 0, CFSTR("Localizable"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setDestructiveActionSheetTitle:", v24);

  v25 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("RECOVERY_CONTACT_FOR_REMOVE_DETAILS"), 0, CFSTR("Localizable"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fullName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstNameOrHandleForDisplay");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "stringWithFormat:", v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setDestructiveActionSheetDetails:", v30);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("CANCEL"), 0, CFSTR("Localizable"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setDestructiveActionSheetCancelText:", v32);

  objc_msgSend(v33, "setDestructiveActionRequiresAuth:", 1);
}

- (void)prepareForMyBeneficiaryFlow:(id)a3 withContact:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v36 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MY_BENEFICIARY_TITLE"), 0, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setTitle:", v7);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MY_BENEFICIARY_DETAILS"), 0, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setDetailsLabel:", v9);

  v10 = objc_msgSend(v5, "trustedContactStatus");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 == 1)
  {
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("MY_BENEFICIARY_RESEND_ACCESS_KEY"), 0, CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setPrimaryActionText:", v13);

    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("MY_BENEFICIARY_DETAILS_SUBTITLE_PENDING"), 0, CFSTR("Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstNameOrHandleForDisplay");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setDetailsSubtitle:", v18);

  }
  else
  {
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("MY_BENEFICIARY_VIEW_ACCESS_KEY"), 0, CFSTR("Localizable"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setPrimaryActionText:", v19);

    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("MY_BENEFICIARY_DETAILS_SUBTITLE"), 0, CFSTR("Localizable"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstNameOrHandleForDisplay");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setDetailsSubtitle:", v24);

    objc_msgSend(v36, "setPrimaryActionRequiresAuth:", 1);
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("MY_BENEFICIARY_REMOVE_TEXT"), 0, CFSTR("Localizable"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setDestructiveActionText:", v26);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("REMOVE_BENEFICIARY_ALERT_TITLE"), 0, CFSTR("Localizable"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setDestructiveActionSheetTitle:", v28);

  v29 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("MY_BENEFICIARY_REMOVE_DETAILS"), 0, CFSTR("Localizable"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstNameOrHandleForDisplay");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringWithFormat:", v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setDestructiveActionSheetDetails:", v33);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("CANCEL"), 0, CFSTR("Localizable"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setDestructiveActionSheetCancelText:", v35);

  objc_msgSend(v36, "setDestructiveActionRequiresAuth:", 1);
}

- (void)prepareForMyBenefactorFlow:(id)a3 withContact:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v36 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MY_BENEFACTOR_TITLE"), 0, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setTitle:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("MY_BENEFACTOR_DETAILS"), 0, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstNameOrHandleForDisplay");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setDetailsLabel:", v12);

  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("MY_BENEFACTOR_DETAILS_SUBTITLE"), 0, CFSTR("Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstNameOrHandleForDisplay");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setDetailsSubtitle:", v17);

  objc_msgSend(v5, "inheritanceContactInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "trustedContactStatus") == 2)
  {
    objc_msgSend(v18, "accessKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("MY_BENEFACTOR_VIEW_ACCESS_KEY"), 0, CFSTR("Localizable"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setPrimaryActionText:", v21);

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("MY_BENEFACTOR_REQUEST_ACCESS"), 0, CFSTR("Localizable"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setSecondaryActionText:", v23);

      objc_msgSend(v36, "setPrimaryActionRequiresAuth:", 1);
    }
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("REMOVE"), 0, CFSTR("Localizable"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setDestructiveActionText:", v25);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("REMOVE_BENEFACTOR_ALERT_TITLE"), 0, CFSTR("Localizable"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setDestructiveActionSheetTitle:", v27);

  v28 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("MY_BENEFACTOR_REMOVE_DETAILS"), 0, CFSTR("Localizable"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fullName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstNameOrHandleForDisplay");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithFormat:", v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setDestructiveActionSheetDetails:", v33);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("CANCEL"), 0, CFSTR("Localizable"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setDestructiveActionSheetCancelText:", v35);

  objc_msgSend(v36, "setDestructiveActionRequiresAuth:", 1);
}

@end
