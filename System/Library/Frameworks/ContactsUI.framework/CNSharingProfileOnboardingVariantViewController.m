@implementation CNSharingProfileOnboardingVariantViewController

- (CNSharingProfileOnboardingVariantViewController)initWithVariantsManager:(id)a3 originalItem:(id)a4 selectedVariantIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  CNSharingProfileOnboardingVariantViewController *v13;
  CNSharingProfileOnboardingVariantViewController *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "localizedVariantsTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)CNSharingProfileOnboardingVariantViewController;
  v13 = -[CNSharingProfileOnboardingVariantViewController initWithTitle:detailText:icon:](&v16, sel_initWithTitle_detailText_icon_, v12, 0, 0);

  if (v13)
  {
    objc_storeStrong((id *)&v13->_variantsManager, a3);
    objc_storeStrong((id *)&v13->_item, a4);
    objc_storeStrong((id *)&v13->_variantName, a5);
    v14 = v13;
  }

  return v13;
}

- (void)viewDidLoad
{
  CNPhotoPickerVariantListController *v3;
  void *v4;
  void *v5;
  void *v6;
  CNPhotoPickerVariantListController *v7;
  CNPhotoPickerVariantListController *variantListController;
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
  NSLayoutConstraint *v25;
  NSLayoutConstraint *heightLayoutConstraint;
  CNOnboardingBoldButtonProvider *v27;
  OBBoldTrayButton *v28;
  OBBoldTrayButton *continueButton;
  OBBoldTrayButton *v30;
  void *v31;
  void *v32;
  void *v33;
  OBLinkTrayButton *v34;
  OBLinkTrayButton *poseButton;
  OBLinkTrayButton *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
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
  objc_super v57;
  _QWORD v58[6];

  v58[4] = *MEMORY[0x1E0C80C00];
  v57.receiver = self;
  v57.super_class = (Class)CNSharingProfileOnboardingVariantViewController;
  -[OBBaseWelcomeController viewDidLoad](&v57, sel_viewDidLoad);
  v3 = [CNPhotoPickerVariantListController alloc];
  -[CNSharingProfileOnboardingVariantViewController variantsManager](self, "variantsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfileOnboardingVariantViewController item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfileOnboardingVariantViewController variantName](self, "variantName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNPhotoPickerVariantListController initWithVariantsManager:originalItem:selectedVariantIdentifier:](v3, "initWithVariantsManager:originalItem:selectedVariantIdentifier:", v4, v5, v6);
  variantListController = self->_variantListController;
  self->_variantListController = v7;

  -[CNPhotoPickerVariantListController setDelegate:](self->_variantListController, "setDelegate:", self);
  -[CNPhotoPickerVariantListController view](self->_variantListController, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CNPhotoPickerVariantListController collectionView](self->_variantListController, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShowsVerticalScrollIndicator:", 0);

  -[CNPhotoPickerVariantListController collectionView](self->_variantListController, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShowsHorizontalScrollIndicator:", 0);

  -[CNPhotoPickerVariantListController collectionView](self->_variantListController, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setScrollEnabled:", 0);

  -[CNSharingProfileOnboardingVariantViewController contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerVariantListController view](self->_variantListController, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v14);

  -[CNSharingProfileOnboardingVariantViewController addChildViewController:](self, "addChildViewController:", self->_variantListController);
  -[CNPhotoPickerVariantListController didMoveToParentViewController:](self->_variantListController, "didMoveToParentViewController:", self);
  -[CNPhotoPickerVariantListController view](self->_variantListController, "view");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "topAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfileOnboardingVariantViewController contentView](self, "contentView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "topAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v53);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v52;
  -[CNPhotoPickerVariantListController view](self->_variantListController, "view");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "bottomAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfileOnboardingVariantViewController contentView](self, "contentView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "bottomAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v47;
  -[CNPhotoPickerVariantListController view](self->_variantListController, "view");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "leadingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfileOnboardingVariantViewController contentView](self, "contentView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v58[2] = v16;
  -[CNPhotoPickerVariantListController view](self->_variantListController, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfileOnboardingVariantViewController contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v58[3] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNPhotoPickerVariantListController view](self->_variantListController, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "heightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToConstant:", 200.0);
  v25 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  heightLayoutConstraint = self->_heightLayoutConstraint;
  self->_heightLayoutConstraint = v25;

  -[NSLayoutConstraint setActive:](self->_heightLayoutConstraint, "setActive:", 1);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v22);
  v27 = objc_alloc_init(CNOnboardingBoldButtonProvider);
  -[CNOnboardingBoldButtonProvider boldButton](v27, "boldButton");
  v28 = (OBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
  continueButton = self->_continueButton;
  self->_continueButton = v28;

  v30 = self->_continueButton;
  CNContactsUIBundle();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("SHARING_CONTINUE"), &stru_1E20507A8, CFSTR("Localized"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBoldTrayButton setTitle:forState:](v30, "setTitle:forState:", v32, 0);

  -[OBBoldTrayButton addTarget:action:forControlEvents:](self->_continueButton, "addTarget:action:forControlEvents:", self, sel_didTapContinue_, 64);
  -[CNSharingProfileOnboardingVariantViewController buttonTray](self, "buttonTray");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addButton:", self->_continueButton);

  if (self->_shouldShowPoseButton)
  {
    objc_msgSend(MEMORY[0x1E0D65178], "linkButton");
    v34 = (OBLinkTrayButton *)objc_claimAutoreleasedReturnValue();
    poseButton = self->_poseButton;
    self->_poseButton = v34;

    v36 = self->_poseButton;
    CNContactsUIBundle();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("SHARING_STRIKE_YOUR_POSE"), &stru_1E20507A8, CFSTR("Localized"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBLinkTrayButton setTitle:forState:](v36, "setTitle:forState:", v38, 0);

    -[OBLinkTrayButton addTarget:action:forControlEvents:](self->_poseButton, "addTarget:action:forControlEvents:", self, sel_didTapPose_, 64);
    -[CNSharingProfileOnboardingVariantViewController buttonTray](self, "buttonTray");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addButton:", self->_poseButton);

  }
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfileOnboardingVariantViewController view](self, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setBackgroundColor:", v40);

  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setLeftBarButtonItem:", 0);

  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setRightBarButtonItem:", 0);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  -[CNSharingProfileOnboardingVariantViewController variantListController](self, "variantListController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentSize");
  v6 = v5;
  -[CNSharingProfileOnboardingVariantViewController heightLayoutConstraint](self, "heightLayoutConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConstant:", v6);

  v8.receiver = self;
  v8.super_class = (Class)CNSharingProfileOnboardingVariantViewController;
  -[OBBaseWelcomeController viewDidLayoutSubviews](&v8, sel_viewDidLayoutSubviews);
}

- (void)updateOriginalItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNSharingProfileOnboardingVariantViewController variantListController](self, "variantListController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateForNewOriginalItem:", v4);

}

- (void)didTapSetupLater:(id)a3
{
  id v4;

  -[CNSharingProfileOnboardingVariantViewController onboardingDelegate](self, "onboardingDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "onboardingVariantControllerDidTapSetupLater:", self);

}

- (void)didTapContinue:(id)a3
{
  id v3;

  -[CNSharingProfileOnboardingVariantViewController variantListController](self, "variantListController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didFinishSelectingVariant");

}

- (void)didTapPose:(id)a3
{
  id v4;

  -[CNSharingProfileOnboardingVariantViewController onboardingDelegate](self, "onboardingDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "onboardingVariantControllerDidTapPose:", self);

}

- (void)didTapBack:(id)a3
{
  id v4;

  -[CNSharingProfileOnboardingVariantViewController onboardingDelegate](self, "onboardingDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "onboardingVariantControllerDidTapBack:", self);

}

- (void)photoPickerVariantListController:(id)a3 didSelectProviderItem:(id)a4
{
  id v5;

  objc_storeStrong((id *)&self->_selectedItem, a4);
  -[CNSharingProfileOnboardingVariantViewController onboardingDelegate](self, "onboardingDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "onboardingVariantControllerDidTapContinue:", self);

}

- (CNSharingProfileOnboardingVariantViewControllerDelegate)onboardingDelegate
{
  return (CNSharingProfileOnboardingVariantViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_onboardingDelegate);
}

- (void)setOnboardingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_onboardingDelegate, a3);
}

- (BOOL)shouldShowPoseButton
{
  return self->_shouldShowPoseButton;
}

- (void)setShouldShowPoseButton:(BOOL)a3
{
  self->_shouldShowPoseButton = a3;
}

- (CNPhotoPickerProviderItem)selectedItem
{
  return self->_selectedItem;
}

- (void)setSelectedItem:(id)a3
{
  objc_storeStrong((id *)&self->_selectedItem, a3);
}

- (CNPhotoPickerVariantsManager)variantsManager
{
  return self->_variantsManager;
}

- (void)setVariantsManager:(id)a3
{
  objc_storeStrong((id *)&self->_variantsManager, a3);
}

- (CNPhotoPickerProviderItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (NSString)variantName
{
  return self->_variantName;
}

- (void)setVariantName:(id)a3
{
  objc_storeStrong((id *)&self->_variantName, a3);
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

- (OBBoldTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
}

- (OBLinkTrayButton)poseButton
{
  return self->_poseButton;
}

- (void)setPoseButton:(id)a3
{
  objc_storeStrong((id *)&self->_poseButton, a3);
}

- (NSLayoutConstraint)heightLayoutConstraint
{
  return self->_heightLayoutConstraint;
}

- (void)setHeightLayoutConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightLayoutConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_poseButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_setupLaterButton, 0);
  objc_storeStrong((id *)&self->_variantListController, 0);
  objc_storeStrong((id *)&self->_variantName, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_variantsManager, 0);
  objc_storeStrong((id *)&self->_selectedItem, 0);
  objc_destroyWeak((id *)&self->_onboardingDelegate);
}

@end
