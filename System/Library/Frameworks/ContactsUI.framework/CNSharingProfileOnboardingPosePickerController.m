@implementation CNSharingProfileOnboardingPosePickerController

- (CNSharingProfileOnboardingPosePickerController)initWithAvatarRecord:(id)a3 variantsManager:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  CNSharingProfileOnboardingPosePickerController *v11;
  CNSharingProfileOnboardingPosePickerController *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  CNContactsUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SHARING_CHOOSE_YOUR_POSE"), &stru_1E20507A8, CFSTR("Localized"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)CNSharingProfileOnboardingPosePickerController;
  v11 = -[CNSharingProfileOnboardingPosePickerController initWithTitle:detailText:icon:](&v14, sel_initWithTitle_detailText_icon_, v10, 0, 0);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_avatarRecord, a3);
    objc_storeStrong((id *)&v11->_variantsManager, a4);
    v12 = v11;
  }

  return v11;
}

- (void)viewDidLoad
{
  CNPhotoPickerVariantListController *v3;
  void *v4;
  void *v5;
  void *v6;
  CNPhotoPickerVariantListController *v7;
  void *v8;
  CNPhotoPickerVariantListController *variantListController;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CNOnboardingBoldButtonProvider *v14;
  OBLinkTrayButton *v15;
  OBLinkTrayButton *setupLaterButton;
  OBLinkTrayButton *v17;
  void *v18;
  void *v19;
  void *v20;
  OBBoldTrayButton *v21;
  OBBoldTrayButton *backButton;
  OBBoldTrayButton *v23;
  void *v24;
  void *v25;
  void *v26;
  OBBoldTrayButton *v27;
  OBBoldTrayButton *nextButton;
  OBBoldTrayButton *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSLayoutConstraint *v44;
  NSLayoutConstraint *heightConstraint;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  CNOnboardingBoldButtonProvider *v60;
  CNPhotoPickerVariantListController *v61;
  objc_super v62;
  _QWORD v63[6];

  v63[4] = *MEMORY[0x1E0C80C00];
  v62.receiver = self;
  v62.super_class = (Class)CNSharingProfileOnboardingPosePickerController;
  -[OBBaseWelcomeController viewDidLoad](&v62, sel_viewDidLoad);
  v3 = [CNPhotoPickerVariantListController alloc];
  -[CNSharingProfileOnboardingPosePickerController variantsManager](self, "variantsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfileOnboardingPosePickerController avatarRecord](self, "avatarRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPhotoPickerAnimojiProvider providerItemForAvatarRecord:](CNPhotoPickerAnimojiProvider, "providerItemForAvatarRecord:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNPhotoPickerVariantListController initWithVariantsManager:originalItem:](v3, "initWithVariantsManager:originalItem:", v4, v6);

  -[CNPhotoPickerVariantListController setDelegate:](v7, "setDelegate:", self);
  -[CNPhotoPickerVariantListController setShowPreview:](v7, "setShowPreview:", 0);
  -[CNPhotoPickerVariantListController setCellStyle:](v7, "setCellStyle:", 0);
  -[CNPhotoPickerVariantListController setNumberOfItemsPerRowProvider:](v7, "setNumberOfItemsPerRowProvider:", &__block_literal_global_7620);
  -[CNPhotoPickerVariantListController view](v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  variantListController = self->_variantListController;
  self->_variantListController = v7;
  v61 = v7;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerVariantListController view](self->_variantListController, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v10);

  -[CNSharingProfileOnboardingPosePickerController contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerVariantListController view](self->_variantListController, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v13);

  -[CNSharingProfileOnboardingPosePickerController addChildViewController:](self, "addChildViewController:", self->_variantListController);
  -[CNPhotoPickerVariantListController didMoveToParentViewController:](self->_variantListController, "didMoveToParentViewController:", self);
  v14 = objc_alloc_init(CNOnboardingBoldButtonProvider);
  objc_msgSend(MEMORY[0x1E0D65178], "linkButton");
  v15 = (OBLinkTrayButton *)objc_claimAutoreleasedReturnValue();
  setupLaterButton = self->_setupLaterButton;
  self->_setupLaterButton = v15;

  v17 = self->_setupLaterButton;
  CNContactsUIBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("SHARING_SET_UP_LATER"), &stru_1E20507A8, CFSTR("Localized"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBLinkTrayButton setTitle:forState:](v17, "setTitle:forState:", v19, 0);

  -[OBLinkTrayButton addTarget:action:forControlEvents:](self->_setupLaterButton, "addTarget:action:forControlEvents:", self, sel_didTapSetupLater_, 64);
  -[CNSharingProfileOnboardingPosePickerController buttonTray](self, "buttonTray");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addButton:", self->_setupLaterButton);

  v60 = v14;
  -[CNOnboardingBoldButtonProvider boldAlternateButton](v14, "boldAlternateButton");
  v21 = (OBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
  backButton = self->_backButton;
  self->_backButton = v21;

  v23 = self->_backButton;
  CNContactsUIBundle();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("SHARING_BACK"), &stru_1E20507A8, CFSTR("Localized"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBoldTrayButton setTitle:forState:](v23, "setTitle:forState:", v25, 0);

  -[OBBoldTrayButton addTarget:action:forControlEvents:](self->_backButton, "addTarget:action:forControlEvents:", self, sel_didTapBack_, 64);
  -[CNSharingProfileOnboardingPosePickerController buttonTray](self, "buttonTray");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addButton:", self->_backButton);

  -[CNOnboardingBoldButtonProvider boldButton](v14, "boldButton");
  v27 = (OBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
  nextButton = self->_nextButton;
  self->_nextButton = v27;

  v29 = self->_nextButton;
  CNContactsUIBundle();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("SHARING_CONTINUE"), &stru_1E20507A8, CFSTR("Localized"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBoldTrayButton setTitle:forState:](v29, "setTitle:forState:", v31, 0);

  -[OBBoldTrayButton addTarget:action:forControlEvents:](self->_nextButton, "addTarget:action:forControlEvents:", self, sel_didTapContinue_, 64);
  -[CNSharingProfileOnboardingPosePickerController buttonTray](self, "buttonTray");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addButton:", self->_nextButton);

  -[CNPhotoPickerVariantListController view](self->_variantListController, "view");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "leadingAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfileOnboardingPosePickerController contentView](self, "contentView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "leadingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:", v56);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v55;
  -[CNPhotoPickerVariantListController view](self->_variantListController, "view");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "trailingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfileOnboardingPosePickerController contentView](self, "contentView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "trailingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v50);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v49;
  -[CNPhotoPickerVariantListController view](self->_variantListController, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfileOnboardingPosePickerController contentView](self, "contentView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v63[2] = v36;
  -[CNPhotoPickerVariantListController view](self->_variantListController, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bottomAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfileOnboardingPosePickerController contentView](self, "contentView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v63[3] = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 4);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNPhotoPickerVariantListController view](self->_variantListController, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "heightAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToConstant:", 200.0);
  v44 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v44;

  v46 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v51, "arrayByAddingObject:", self->_heightConstraint);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "activateConstraints:", v47);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  -[CNSharingProfileOnboardingPosePickerController variantListController](self, "variantListController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentSize");
  v6 = v5;
  -[CNSharingProfileOnboardingPosePickerController heightConstraint](self, "heightConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConstant:", v6);

  v8.receiver = self;
  v8.super_class = (Class)CNSharingProfileOnboardingPosePickerController;
  -[OBBaseWelcomeController viewDidLayoutSubviews](&v8, sel_viewDidLayoutSubviews);
}

- (void)didTapSetupLater:(id)a3
{
  id v4;

  -[CNSharingProfileOnboardingPosePickerController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "posePickerControllerDidSelectSetupLater:", self);

}

- (void)didTapBack:(id)a3
{
  id v4;

  -[CNSharingProfileOnboardingPosePickerController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "posePickerControllerDidSelectBack:", self);

}

- (void)didTapContinue:(id)a3
{
  id v3;

  -[CNSharingProfileOnboardingPosePickerController variantListController](self, "variantListController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didFinishSelectingVariant");

}

- (void)photoPickerVariantListControllerDidCancel:(id)a3
{
  id v4;

  -[CNSharingProfileOnboardingPosePickerController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "posePickerControllerDidSelectBack:", self);

}

- (void)photoPickerVariantListController:(id)a3 didSelectProviderItem:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CNSharingProfileOnboardingPosePickerController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "posePickerController:didFinishWithProviderItem:", self, v5);

}

- (CNSharingProfileOnboardingPosePickerControllerDelegate)delegate
{
  return (CNSharingProfileOnboardingPosePickerControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setAvatarRecord:(id)a3
{
  objc_storeStrong((id *)&self->_avatarRecord, a3);
}

- (CNPhotoPickerVariantsManager)variantsManager
{
  return self->_variantsManager;
}

- (void)setVariantsManager:(id)a3
{
  objc_storeStrong((id *)&self->_variantsManager, a3);
}

- (CNPhotoPickerVariantListController)variantListController
{
  return self->_variantListController;
}

- (void)setVariantListController:(id)a3
{
  objc_storeStrong((id *)&self->_variantListController, a3);
}

- (OBLinkTrayButton)setupLaterButton
{
  return self->_setupLaterButton;
}

- (void)setSetupLaterButton:(id)a3
{
  objc_storeStrong((id *)&self->_setupLaterButton, a3);
}

- (OBBoldTrayButton)backButton
{
  return self->_backButton;
}

- (void)setBackButton:(id)a3
{
  objc_storeStrong((id *)&self->_backButton, a3);
}

- (OBBoldTrayButton)nextButton
{
  return self->_nextButton;
}

- (void)setNextButton:(id)a3
{
  objc_storeStrong((id *)&self->_nextButton, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_setupLaterButton, 0);
  objc_storeStrong((id *)&self->_variantListController, 0);
  objc_storeStrong((id *)&self->_variantsManager, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __61__CNSharingProfileOnboardingPosePickerController_viewDidLoad__block_invoke()
{
  return 4;
}

@end
