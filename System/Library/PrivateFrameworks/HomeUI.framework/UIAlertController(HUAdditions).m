@implementation UIAlertController(HUAdditions)

+ (uint64_t)alertControllerForAddingHomeWithProceed:()HUAdditions
{
  return objc_msgSend(a1, "alertControllerForAddingDestinationWithType:andProceed:", 0, a3);
}

+ (uint64_t)alertControllerForAddingZoneWithProceed:()HUAdditions
{
  return objc_msgSend(a1, "alertControllerForAddingDestinationWithType:andProceed:", 1, a3);
}

+ (uint64_t)alertControllerForAddingRoomWithProceed:()HUAdditions
{
  return objc_msgSend(a1, "alertControllerForAddingDestinationWithType:andProceed:", 2, a3);
}

+ (uint64_t)alertControllerForAddingServiceGroupWithProceed:()HUAdditions
{
  return objc_msgSend(a1, "alertControllerForAddingDestinationWithType:andProceed:", 3, a3);
}

+ (id)alertControllerForAddingDestinationWithType:()HUAdditions andProceed:
{
  id v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;

  v5 = a4;
  if (a3 > 3)
  {
    v7 = 0;
    v9 = 0;
LABEL_9:
    NSLog(CFSTR("alertController is nil!"));
    v17 = 0;
    goto LABEL_10;
  }
  v6 = off_1E6F52410[a3];
  _HULocalizedStringWithDefaultValue(off_1E6F523F0[a3], off_1E6F523F0[a3], 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(v6, v6, 1);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10)
    goto LABEL_9;
  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTextFieldWithConfigurationHandler:", &__block_literal_global_76);
  v12 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUAlertCancel"), CFSTR("HUAlertCancel"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, &__block_literal_global_20_2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v14);

  v15 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUAlertAdd"), CFSTR("HUAlertAdd"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __89__UIAlertController_HUAdditions__alertControllerForAddingDestinationWithType_andProceed___block_invoke_23;
  v23 = &unk_1E6F52350;
  v17 = v11;
  v24 = v17;
  v25 = v5;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 0, &v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAction:", v18, v20, v21, v22, v23);

  if (!v17)
    goto LABEL_9;
LABEL_10:

  return v17;
}

+ (id)alertControllerForAddingDestinationWithTypeString:()HUAdditions andProceed:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  objc_msgSend(v7, "capitalizedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Add %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "lowercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringWithFormat:", CFSTR("Enter a name for this %@."), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v9, v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addTextFieldWithConfigurationHandler:", &__block_literal_global_32_0);
  objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, &__block_literal_global_35_0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v14);

  v15 = (void *)MEMORY[0x1E0CEA2E0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __95__UIAlertController_HUAdditions__alertControllerForAddingDestinationWithTypeString_andProceed___block_invoke_38;
  v22[3] = &unk_1E6F52350;
  v16 = v13;
  v23 = v16;
  v24 = v5;
  v17 = v5;
  objc_msgSend(v15, "actionWithTitle:style:handler:", CFSTR("Add"), 0, v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v18);

  v19 = v24;
  v20 = v16;

  return v20;
}

+ (id)hu_alertControllerForUnimplementedFeature:()HUAdditions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CEA2E8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not yet implemented."), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Not Implemented"), v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", CFSTR("That's Lame"), 1, &__block_literal_global_45_1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v6);

  return v5;
}

+ (id)hu_alertControllerWithActivityIndicatorAndTitle:()HUAdditions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setText:", v3);

  objc_msgSend(MEMORY[0x1E0D33718], "preferredFontForTextStyle:traits:", *MEMORY[0x1E0CEB538], 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

  objc_msgSend(v4, "setLineBreakMode:", 2);
  objc_msgSend(v4, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v4, "setNeedsDisplayOnBoundsChange:", 1);
  objc_msgSend(v4, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pointSize");
  objc_msgSend(v4, "setMinimumScaleFactor:", 10.0 / v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v8, "sizeToFit");
  objc_msgSend(v8, "startAnimating");
  v9 = objc_alloc(MEMORY[0x1E0CEA9E0]);
  v18[0] = v8;
  v18[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithArrangedSubviews:", v10);

  objc_msgSend(v11, "setSpacing:", 8.0);
  objc_msgSend(v11, "setDistribution:", 0);
  objc_msgSend(v11, "setAlignment:", 3);
  objc_msgSend(v11, "setLayoutMarginsRelativeArrangement:", 1);
  objc_msgSend(v11, "sizeToFit");
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setView:", v11);
  objc_msgSend(v11, "bounds");
  objc_msgSend(v12, "setPreferredContentSize:", v13, v14);
  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA2E0], "_actionWithContentViewController:style:", v12, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAction:", v16);

  return v15;
}

+ (id)hu_alertControllerForAcknowledgementWithTitle:()HUAdditions message:
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUOkTitle"), CFSTR("HUOkTitle"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v5, 0, &__block_literal_global_54_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v6);

  return v4;
}

+ (id)hu_alertControllerForAddingPersonWithCompletionHandler:()HUAdditions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CEA2E8];
  _HULocalizedStringWithDefaultValue(CFSTR("HUUsersHH2InviteAlertTitle"), CFSTR("HUUsersHH2InviteAlertTitle"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUUsersHH2InviteAlertMessage"), CFSTR("HUUsersHH2InviteAlertMessage"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v5, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _HULocalizedStringWithDefaultValue(CFSTR("HUUsersHH2InviteAlertConfirmTitle"), CFSTR("HUUsersHH2InviteAlertConfirmTitle"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = (void *)MEMORY[0x1E0CEA2E0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __89__UIAlertController_HUAdditions__hu_alertControllerForAddingPersonWithCompletionHandler___block_invoke;
  v26[3] = &unk_1E6F52350;
  v27 = v8;
  v11 = v3;
  v28 = v11;
  v12 = v8;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 0, v26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v13);
  _HULocalizedStringWithDefaultValue(CFSTR("HUUsersHH2InviteAlertIgnoreTitle"), CFSTR("HUUsersHH2InviteAlertIgnoreTitle"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CEA2E0];
  v20 = v9;
  v21 = 3221225472;
  v22 = __89__UIAlertController_HUAdditions__hu_alertControllerForAddingPersonWithCompletionHandler___block_invoke_63;
  v23 = &unk_1E6F52350;
  v24 = v14;
  v25 = v11;
  v16 = v11;
  v17 = v14;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 0, &v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v18, v20, v21, v22, v23);

  return v7;
}

+ (id)hu_actionSheetWithTitle:()HUAdditions message:anchorView:
{
  void *v7;
  id v8;
  void *v9;

  v7 = (void *)MEMORY[0x1E0CEA2E8];
  v8 = a5;
  objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", a3, a4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hu_anchorActionSheetIfNeededFrom:", v8);

  return v9;
}

- (void)hu_anchorActionSheetIfNeededFrom:()HUAdditions
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    objc_msgSend(a1, "popoverPresentationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(a1, "popoverPresentationController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSourceView:", v6);

    }
  }

}

@end
