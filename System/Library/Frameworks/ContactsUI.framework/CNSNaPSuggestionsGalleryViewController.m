@implementation CNSNaPSuggestionsGalleryViewController

- (CNSNaPSuggestionsGalleryViewController)initWithMode:(int64_t)a3 contact:(id)a4 isEditingSNaP:(BOOL)a5 isOnboarding:(BOOL)a6
{
  return -[CNSNaPSuggestionsGalleryViewController initWithMode:contact:isEditingSNaP:isOnboarding:photoLibraryAssetID:](self, "initWithMode:contact:isEditingSNaP:isOnboarding:photoLibraryAssetID:", a3, a4, a5, a6, 0);
}

- (CNSNaPSuggestionsGalleryViewController)initWithMode:(int64_t)a3 contact:(id)a4 isEditingSNaP:(BOOL)a5 isOnboarding:(BOOL)a6 photoLibraryAssetID:(id)a7
{
  id v13;
  id v14;
  CNSNaPSuggestionsGalleryViewController *v15;
  CNSNaPSuggestionsGalleryViewController *v16;
  CNSNaPSuggestionsGalleryViewController *v17;
  objc_super v19;

  v13 = a4;
  v14 = a7;
  v19.receiver = self;
  v19.super_class = (Class)CNSNaPSuggestionsGalleryViewController;
  v15 = -[CNSNaPSuggestionsGalleryViewController init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_mode = a3;
    objc_storeStrong((id *)&v15->_contact, a4);
    v16->_isEditingSNaP = a5;
    v16->_isOnboarding = a6;
    objc_storeStrong((id *)&v16->_photoLibraryAssetID, a7);
    v17 = v16;
  }

  return v16;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  CNSNaPSuggestionsGalleryViewController *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CNSNaPSuggestionsGalleryViewController;
  -[CNSNaPSuggestionsGalleryViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[CNSNaPSuggestionsGalleryViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (CNSNaPSuggestionsGalleryViewController *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x1E0DC34F0]);
  v7 = v6;
  if (v5 == self)
  {
    v8 = (void *)objc_msgSend(v6, "initWithBarButtonSystemItem:target:action:", 1, self, sel_suggestionsGalleryDidCancel);
    -[CNSNaPSuggestionsGalleryViewController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLeftBarButtonItem:", v8);
  }
  else
  {
    CNContactsUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SNAP_POSTER_PREVIEW_SKIP"), &stru_1E20507A8, CFSTR("Localized"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithTitle:style:target:action:", v9, 0, self, sel_skipStep);
    -[CNSNaPSuggestionsGalleryViewController navigationItem](self, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRightBarButtonItem:", v10);

  }
  -[CNSNaPSuggestionsGalleryViewController setupNavBarAppearance](self, "setupNavBarAppearance");
}

- (void)setupNavBarAppearance
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
  objc_msgSend(v8, "configureWithDefaultBackground");
  if (CNUIIsMessages())
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v3);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShadowColor:", v4);

  }
  -[CNSNaPSuggestionsGalleryViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStandardAppearance:", v8);

  v6 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
  objc_msgSend(v6, "configureWithTransparentBackground");
  -[CNSNaPSuggestionsGalleryViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setScrollEdgeAppearance:", v6);

}

- (void)viewIsAppearing:(BOOL)a3
{
  _TtC10ContactsUI40CNWallpaperSuggestionsGalleryViewWrapper *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  _BOOL8 v10;
  _BOOL8 v11;
  void *v12;
  _TtC10ContactsUI40CNWallpaperSuggestionsGalleryViewWrapper *v13;
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
  void *v36;
  void *v37;
  void *v38;
  _TtC10ContactsUI40CNWallpaperSuggestionsGalleryViewWrapper *v39;
  objc_super v40;
  _QWORD v41[5];

  v41[4] = *MEMORY[0x1E0C80C00];
  v40.receiver = self;
  v40.super_class = (Class)CNSNaPSuggestionsGalleryViewController;
  -[CNSNaPSuggestionsGalleryViewController viewIsAppearing:](&v40, sel_viewIsAppearing_, a3);
  v4 = [_TtC10ContactsUI40CNWallpaperSuggestionsGalleryViewWrapper alloc];
  -[CNSNaPSuggestionsGalleryViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNSNaPSuggestionsGalleryViewController mode](self, "mode");
  -[CNSNaPSuggestionsGalleryViewController contact](self, "contact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CNSNaPSuggestionsGalleryViewController isEditingSNaP](self, "isEditingSNaP");
  v11 = -[CNSNaPSuggestionsGalleryViewController isOnboarding](self, "isOnboarding");
  -[CNSNaPSuggestionsGalleryViewController photoLibraryAssetID](self, "photoLibraryAssetID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CNWallpaperSuggestionsGalleryViewWrapper initWithDelegate:windowScene:mode:contact:isEditingSNaP:isOnboarding:photoLibraryAssetID:](v4, "initWithDelegate:windowScene:mode:contact:isEditingSNaP:isOnboarding:photoLibraryAssetID:", self, v7, v8, v9, v10, v11, v12);

  -[CNWallpaperSuggestionsGalleryViewWrapper hostingController](v13, "hostingController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNWallpaperSuggestionsGalleryViewWrapper hostingController](v13, "hostingController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "willMoveToParentViewController:", self);

  v39 = v13;
  -[CNWallpaperSuggestionsGalleryViewWrapper hostingController](v13, "hostingController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSuggestionsGalleryViewController addChildViewController:](self, "addChildViewController:", v17);

  -[CNSNaPSuggestionsGalleryViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v15);

  -[CNWallpaperSuggestionsGalleryViewWrapper hostingController](v13, "hostingController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "didMoveToParentViewController:", self);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:", v20);

  v31 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v15, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSuggestionsGalleryViewController view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v35;
  objc_msgSend(v15, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSuggestionsGalleryViewController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v32);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v30;
  objc_msgSend(v15, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSuggestionsGalleryViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v24;
  objc_msgSend(v15, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSuggestionsGalleryViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v41[3] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "activateConstraints:", v29);

}

- (void)skipStep
{
  id v3;

  -[CNSNaPSuggestionsGalleryViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suggestionsGalleryViewControllerDidSelectCustomizeLater:", self);

}

- (int64_t)sourceTypeFromString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("camera")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("photos")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("memoji")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("emoji")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 3;
  }

  return v4;
}

- (void)suggestionsGalleryDidSelectAvatarSourceType:(id)a3 withGivenName:(id)a4 familyName:(id)a5
{
  id v8;
  id v9;
  id v10;
  int64_t v11;
  CNSNaPSuggestionsGalleryName *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CNSNaPSuggestionsGalleryViewController delegate](self, "delegate");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v11 = -[CNSNaPSuggestionsGalleryViewController sourceTypeFromString:](self, "sourceTypeFromString:", v10);

  v12 = -[CNSNaPSuggestionsGalleryName initWithGivenName:familyName:]([CNSNaPSuggestionsGalleryName alloc], "initWithGivenName:familyName:", v9, v8);
  objc_msgSend(v13, "suggestionsGalleryViewController:didSelectAvatarSourceType:name:", self, v11, v12);

}

- (void)suggestionsGalleryDidSelectSuggestedAvatar:(id)a3 withGivenName:(id)a4 familyName:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNSNaPSuggestionsGalleryName *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CNSNaPSuggestionsGalleryViewController delegate](self, "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v11 = -[CNSNaPSuggestionsGalleryName initWithGivenName:familyName:]([CNSNaPSuggestionsGalleryName alloc], "initWithGivenName:familyName:", v9, v8);

  objc_msgSend(v12, "suggestionsGalleryViewController:didSelectSuggestedAvatar:name:", self, v10, v11);
}

- (void)suggestionsGalleryDidFinishWithPosterConfiguration:(id)a3 posterType:(id)a4 withGivenName:(id)a5 familyName:(id)a6
{
  id v9;
  id v10;
  id v11;
  CNSNaPSuggestionsGalleryName *v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a3;
  -[CNSNaPSuggestionsGalleryViewController delegate](self, "delegate");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v12 = -[CNSNaPSuggestionsGalleryName initWithGivenName:familyName:]([CNSNaPSuggestionsGalleryName alloc], "initWithGivenName:familyName:", v10, v9);

  objc_msgSend(v13, "suggestionsGalleryViewController:didFinishWithPosterConfiguration:name:", self, v11, v12);
}

- (void)suggestionsGalleryDidCancel
{
  id v3;

  -[CNSNaPSuggestionsGalleryViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suggestionsGalleryViewControllerDidCancel:", self);

}

- (void)suggestionsGalleryDidRequestPresentationOfPosterEditingViewController:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "setModalPresentationStyle:", 6);
    -[CNSNaPSuggestionsGalleryViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __112__CNSNaPSuggestionsGalleryViewController_suggestionsGalleryDidRequestPresentationOfPosterEditingViewController___block_invoke;
    v9[3] = &unk_1E204F648;
    v10 = v7;
    objc_msgSend(v8, "presentViewController:animated:completion:", v10, 1, v9);

  }
}

- (void)suggestionsGalleryDidRequestPresentationOfImagePickerController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNSNaPSuggestionsGalleryViewController navigationController](self, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (CNSNaPSuggestionsGalleryViewControllerDelegate)delegate
{
  return (CNSNaPSuggestionsGalleryViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (BOOL)isEditingSNaP
{
  return self->_isEditingSNaP;
}

- (void)setIsEditingSNaP:(BOOL)a3
{
  self->_isEditingSNaP = a3;
}

- (BOOL)isOnboarding
{
  return self->_isOnboarding;
}

- (void)setIsOnboarding:(BOOL)a3
{
  self->_isOnboarding = a3;
}

- (NSString)photoLibraryAssetID
{
  return self->_photoLibraryAssetID;
}

- (void)setPhotoLibraryAssetID:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibraryAssetID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibraryAssetID, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __112__CNSNaPSuggestionsGalleryViewController_suggestionsGalleryDidRequestPresentationOfPosterEditingViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentationDidFinishAnimated:", 1);
}

@end
