@implementation CNVisualIdentityPickerViewController

+ (BOOL)canShowPhotoPickerForView:(id)a3 withTraitCollection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  double v16;
  uint64_t v17;
  char v18;
  char v19;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "windowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "interfaceOrientation");

  }
  else
  {
    objc_msgSend(v5, "bounds");
    v12 = v11;
    objc_msgSend(v5, "bounds");
    if (v12 <= v13)
      v10 = 1;
    else
      v10 = 3;
  }
  objc_msgSend(v5, "bounds");
  if (v14 >= 320.0)
  {
    objc_msgSend(v5, "bounds");
    v15 = v16 < 454.4;
  }
  else
  {
    v15 = 1;
  }
  v17 = objc_msgSend(v6, "userInterfaceIdiom");
  v18 = (unint64_t)(v10 - 3) < 2 || v15;
  if (v17)
    v18 = v15;
  v19 = v18 ^ 1;

  return v19;
}

void __65__CNVisualIdentityPickerViewController_descriptorForRequiredKeys__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "makeDescriptorForRequiredKeys");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)descriptorForRequiredKeys_cn_once_object_21;
  descriptorForRequiredKeys_cn_once_object_21 = v1;

}

+ (id)makeDescriptorForRequiredKeys
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[15];

  v15[14] = *MEMORY[0x1E0C80C00];
  +[CNMonogrammer descriptorForRequiredKeysIncludingImage:](CNMonogrammer, "descriptorForRequiredKeysIncludingImage:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  objc_msgSend(MEMORY[0x1E0D13D28], "descriptorForRequiredKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C966E8];
  v15[1] = v3;
  v15[2] = v4;
  v5 = *MEMORY[0x1E0C96708];
  v15[3] = *MEMORY[0x1E0C96768];
  v15[4] = v5;
  v6 = *MEMORY[0x1E0C96700];
  v15[5] = *MEMORY[0x1E0C96890];
  v15[6] = v6;
  v7 = *MEMORY[0x1E0C96688];
  v15[7] = *MEMORY[0x1E0C96898];
  v15[8] = v7;
  v8 = *MEMORY[0x1E0C96728];
  v15[9] = *MEMORY[0x1E0C966C8];
  v15[10] = v8;
  v9 = *MEMORY[0x1E0C96778];
  v15[11] = *MEMORY[0x1E0C96710];
  v15[12] = v9;
  v15[13] = *MEMORY[0x1E0C968A8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNVisualIdentityPickerViewController makeDescriptorForRequiredKeys]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "descriptorWithKeyDescriptors:description:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)descriptorForRequiredKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CNVisualIdentityPickerViewController_descriptorForRequiredKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (descriptorForRequiredKeys_cn_once_token_21 != -1)
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_21, block);
  return (id)descriptorForRequiredKeys_cn_once_object_21;
}

- (CNVisualIdentityPickerViewController)initWithPhotosDataSource:(id)a3 style:(id)a4 allowRotation:(BOOL)a5
{
  id v9;
  id v10;
  CNVisualIdentityPickerViewController *v11;
  CNVisualIdentityPickerViewController *v12;
  NSArray *pendingInjectedSuggestionItems;
  CNVisualIdentityImagePickerController *v14;
  CNVisualIdentityImagePickerController *imagePickerController;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CNVisualIdentityPickerViewController *v21;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CNVisualIdentityPickerViewController;
  v11 = -[CNVisualIdentityPickerViewController initWithNibName:bundle:](&v23, sel_initWithNibName_bundle_, 0, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dataSource, a3);
    -[CNPhotoPickerDataSource setDelegate:](v12->_dataSource, "setDelegate:", v12);
    objc_storeStrong((id *)&v12->_contactStyle, a4);
    v12->_allowRotation = a5;
    pendingInjectedSuggestionItems = v12->_pendingInjectedSuggestionItems;
    v12->_pendingInjectedSuggestionItems = (NSArray *)MEMORY[0x1E0C9AA60];

    v14 = -[CNVisualIdentityImagePickerController initWithContactStyle:]([CNVisualIdentityImagePickerController alloc], "initWithContactStyle:", v10);
    imagePickerController = v12->_imagePickerController;
    v12->_imagePickerController = v14;

    objc_msgSend(MEMORY[0x1E0D13D40], "unifiedMeContactMonitor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "visualIdentity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "contacts");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityImagePickerController setIsMeContact:](v12->_imagePickerController, "setIsMeContact:", objc_msgSend(v16, "isMeContact:", v19));

    -[CNVisualIdentityImagePickerController setDelegate:](v12->_imagePickerController, "setDelegate:", v12);
    -[CNVisualIdentityPickerViewController presenterDelegate](v12, "presenterDelegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityImagePickerController setPresenterDelegate:](v12->_imagePickerController, "setPresenterDelegate:", v20);

    v21 = v12;
  }

  return v12;
}

- (void)setPresenterDelegate:(id)a3
{
  CNVisualIdentityPickerPresenterDelegate **p_presenterDelegate;
  id v5;

  p_presenterDelegate = &self->_presenterDelegate;
  v5 = a3;
  objc_storeWeak((id *)p_presenterDelegate, v5);
  -[CNVisualIdentityImagePickerController setPresenterDelegate:](self->_imagePickerController, "setPresenterDelegate:", v5);

}

- (id)visualIdentity
{
  void *v2;
  void *v3;

  -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visualIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CNVisualIdentity)pendingVisualIdentity
{
  CNVisualIdentity *pendingVisualIdentity;
  void *v4;
  CNVisualIdentity *v5;
  CNVisualIdentity *v6;

  pendingVisualIdentity = self->_pendingVisualIdentity;
  if (!pendingVisualIdentity)
  {
    -[CNVisualIdentityPickerViewController visualIdentity](self, "visualIdentity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (CNVisualIdentity *)objc_msgSend(v4, "mutableCopy");
    v6 = self->_pendingVisualIdentity;
    self->_pendingVisualIdentity = v5;

    pendingVisualIdentity = self->_pendingVisualIdentity;
  }
  return pendingVisualIdentity;
}

- (void)viewDidLoad
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
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
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)CNVisualIdentityPickerViewController;
  -[CNVisualIdentityPickerViewController viewDidLoad](&v38, sel_viewDidLoad);
  -[CNVisualIdentityPickerViewController buildHeaderView](self, "buildHeaderView");
  -[CNVisualIdentityPickerViewController buildCollectionView](self, "buildCollectionView");
  objc_msgSend((id)objc_opt_class(), "defaultItemSize");
  v4 = v3;
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;

  -[CNVisualIdentityPickerViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "effectiveUserInterfaceLayoutDirection") == 1;

  v12 = (void *)objc_opt_class();
  -[CNVisualIdentityPickerViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  objc_msgSend(v12, "itemsPerRowForWidth:", v14);
  v16 = v15;

  -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "loadProviderGroupsItemsForSize:itemsPerRow:scale:RTL:", v11, v4, v6, v16, v9);

  -[CNVisualIdentityPickerViewController contactStyle](self, "contactStyle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "backgroundColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[CNVisualIdentityPickerViewController contactStyle](self, "contactStyle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "backgroundColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityPickerViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setBackgroundColor:", v21);

  }
  else
  {
    +[CNUIColorRepository photoPickerBackgroundColor](CNUIColorRepository, "photoPickerBackgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityPickerViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBackgroundColor:", v20);
  }

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_confirmCancelAction);
  -[CNVisualIdentityPickerViewController navigationItem](self, "navigationItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setLeftBarButtonItem:", v23);

  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_done_);
  -[CNVisualIdentityPickerViewController navigationItem](self, "navigationItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setRightBarButtonItem:", v25);

  -[CNVisualIdentityPickerViewController navigationItem](self, "navigationItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "rightBarButtonItem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setEnabled:", 0);

  -[CNVisualIdentityPickerViewController navigationItem](self, "navigationItem");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setLargeTitleDisplayMode:", 2);

  -[CNVisualIdentityPickerViewController navigationController](self, "navigationController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "presentationController");
  v31 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v31, "setDelegate:", self);

  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4DA0], 0, sel_confirmCancelAction);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityPickerViewController addKeyCommand:](self, "addKeyCommand:", v32);

  -[CNVisualIdentityPickerViewController navigationItem](self, "navigationItem");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_setBackgroundHidden:", 1);

  -[CNVisualIdentityPickerViewController navigationController](self, "navigationController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "navigationBar");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v31) = objc_msgSend(v35, "isTranslucent");

  if ((v31 & 1) == 0)
    -[CNVisualIdentityPickerViewController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", 1);
  -[CNVisualIdentityPickerViewController setShouldUpdateEmojiSuggestions:](self, "setShouldUpdateEmojiSuggestions:", 1);
  -[CNVisualIdentityPickerViewController proposedImageData](self, "proposedImageData");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[CNVisualIdentityPickerViewController proposedImageData](self, "proposedImageData");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityPickerViewController updateVisualIdentityWithProposedImageData:](self, "updateVisualIdentityWithProposedImageData:", v37);

  }
}

- (void)cancel:(id)a3
{
  id v4;

  -[CNVisualIdentityPickerViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visualIdentityPickerDidCancel:", self);

}

- (void)done:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[CNVisualIdentityPickerViewController setShouldUpdateEmojiSuggestions:](self, "setShouldUpdateEmojiSuggestions:", 0);
  -[CNVisualIdentityPickerViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resignFirstResponder");

  -[CNVisualIdentityPickerViewController contactImageForCurrentActiveItem](self, "contactImageForCurrentActiveItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityPickerViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "visualIdentityPicker:didUpdatePhotoForVisualIdentity:withContactImage:", self, v7, v5);

  objc_msgSend((id)objc_opt_class(), "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cropRect");
    v11 = v10;
    -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cropRect");
    v14 = v13;
    -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cropRect");
    v17 = v16;
    -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "cropRect");
    v20 = v19;
    -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "avatarImage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "size");
    v24 = v23;
    -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "avatarImage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "size");
    v28 = 134219264;
    v29 = v11;
    v30 = 2048;
    v31 = v14;
    v32 = 2048;
    v33 = v17;
    v34 = 2048;
    v35 = v20;
    v36 = 2048;
    v37 = v24;
    v38 = 2048;
    v39 = v27;
    _os_log_impl(&dword_18AC56000, v8, OS_LOG_TYPE_DEFAULT, "[Likeness Update] Updated likeness selected with cropRect {%.2f, %.2f, %.2f, %.2f}, image size {%.2f, %.2f}", (uint8_t *)&v28, 0x3Eu);

  }
}

- (void)updateVisualIdentityWithProposedImageData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CNPhotoPickerProviderItem *v18;
  id v19;

  v4 = a3;
  if (v4)
  {
    v19 = v4;
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "size");
      if (v8 != *MEMORY[0x1E0C9D820] || v7 != *(double *)(MEMORY[0x1E0C9D820] + 8))
      {
        v10 = (void *)MEMORY[0x1E0D13A80];
        objc_msgSend(v6, "size");
        v12 = v11;
        objc_msgSend(v6, "size");
        objc_msgSend(v10, "centeredSquareCropRectInRect:", 0.0, 0.0, v12, v13);
        v18 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:]([CNPhotoPickerProviderItem alloc], "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:", v19, 0, 0, v14, v15, v16, v17);
        -[CNVisualIdentityPickerViewController updateVisualIdentityWithProviderItem:](self, "updateVisualIdentityWithProviderItem:", v18);

      }
    }

    v4 = v19;
  }

}

- (double)textFieldFontSize
{
  return 50.0;
}

- (double)collectionViewPaddingForCatalyst
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  v3 = (void *)objc_opt_class();
  -[CNVisualIdentityPickerViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "itemsPerRowForWidth:", v5);
  v7 = v6;

  -[CNVisualIdentityPickerViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = (v9 - ((v7 + -1.0) * 16.0 + v7 * 48.0 + 1.0)) * 0.5;

  return v10;
}

- (void)buildCollectionView
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
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
  _QWORD v51[5];

  v51[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  objc_msgSend(v3, "setScrollDirection:", 0);
  objc_msgSend(v3, "setSectionHeadersPinToVisibleBounds:", 1);
  objc_msgSend(v3, "setSectionInsetReference:", 1);
  objc_msgSend(v3, "setSectionInset:", 14.0, 20.0, 30.0, 20.0);
  v50 = v3;
  objc_msgSend(v3, "setSectionHeadersPinToVisibleBounds:", 0);
  v4 = objc_alloc(MEMORY[0x1E0DC35B8]);
  -[CNVisualIdentityPickerViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v6 = (void *)objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v3);
  -[CNVisualIdentityPickerViewController setCollectionView:](self, "setCollectionView:", v6);

  -[CNVisualIdentityPickerViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);

  -[CNVisualIdentityPickerViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDataSource:", self);

  -[CNVisualIdentityPickerViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  +[CNPhotoPickerCollectionViewCell cellIdentifier](CNPhotoPickerCollectionViewCell, "cellIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerClass:forCellWithReuseIdentifier:", v10, v11);

  -[CNVisualIdentityPickerViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  +[CNPhotoPickerCollectionViewCell cellIdentifier](CNPhotoPickerCollectionViewCell, "cellIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingFormat:", CFSTR("-Add"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerClass:forCellWithReuseIdentifier:", v13, v15);

  -[CNVisualIdentityPickerViewController collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_class();
  v18 = *MEMORY[0x1E0DC48A8];
  +[CNPhotoPickerSectionHeader reusableIdentifier](CNPhotoPickerSectionHeader, "reusableIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v17, v18, v19);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityPickerViewController collectionView](self, "collectionView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setBackgroundColor:", v20);

  -[CNVisualIdentityPickerViewController collectionView](self, "collectionView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAlwaysBounceVertical:", 1);

  -[CNVisualIdentityPickerViewController collectionView](self, "collectionView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setContentInsetAdjustmentBehavior:", 2);

  -[CNVisualIdentityPickerViewController collectionView](self, "collectionView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setContentInset:", 0.0, 20.0, 0.0, 20.0);

  -[CNVisualIdentityPickerViewController collectionView](self, "collectionView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CNVisualIdentityPickerViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityPickerViewController collectionView](self, "collectionView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityPickerViewController headerView](self, "headerView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "insertSubview:below:", v27, v28);

  -[CNVisualIdentityPickerViewController headerView](self, "headerView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bottomAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNVisualIdentityPickerViewController collectionView](self, "collectionView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v49);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v46;
  -[CNVisualIdentityPickerViewController collectionView](self, "collectionView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityPickerViewController view](self, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v41;
  -[CNVisualIdentityPickerViewController collectionView](self, "collectionView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityPickerViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = v33;
  -[CNVisualIdentityPickerViewController collectionView](self, "collectionView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bottomAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityPickerViewController view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bottomAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v51[3] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 4);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v39);
}

- (void)buildHeaderView
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
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  -[CNVisualIdentityPickerViewController initializeHeaderView](self, "initializeHeaderView");
  -[CNVisualIdentityPickerViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

  -[CNVisualIdentityPickerViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CNVisualIdentityPickerViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityPickerViewController headerView](self, "headerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  -[CNVisualIdentityPickerViewController headerView](self, "headerView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityPickerViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "safeAreaLayoutGuide");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v18;
  -[CNVisualIdentityPickerViewController headerView](self, "headerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityPickerViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v10;
  -[CNVisualIdentityPickerViewController headerView](self, "headerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityPickerViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v16);
}

- (void)initializeHeaderView
{
  CNPhotoPickerHeaderView *v3;
  CNPhotoPickerHeaderView *v4;
  CNPhotoPickerHeaderView *headerView;
  id v6;

  v3 = [CNPhotoPickerHeaderView alloc];
  -[CNVisualIdentityPickerViewController visualIdentity](self, "visualIdentity");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[CNPhotoPickerHeaderView initWithVisualIdentity:](v3, "initWithVisualIdentity:", v6);
  headerView = self->_headerView;
  self->_headerView = v4;

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CNVisualIdentityPickerViewController;
  -[CNVisualIdentityPickerViewController viewDidLayoutSubviews](&v19, sel_viewDidLayoutSubviews);
  -[CNVisualIdentityPickerViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_opt_class();
  -[CNVisualIdentityPickerViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v5, "itemsPerRowForWidth:", v7);
  v9 = v8;

  -[CNVisualIdentityPickerViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = (v11 + (v9 + 1.0) * -20.0) / v9;

  v13 = fmin(v12, 90.0);
  objc_msgSend(v4, "setItemSize:", v13, v13);
  -[CNVisualIdentityPickerViewController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "collectionViewLayout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "invalidateLayout");

  -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "itemsPerRow");

  -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setItemsPerRow:requiresFullReload:", (unint64_t)v9, v9 != (double)v17);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNVisualIdentityPickerViewController;
  -[CNVisualIdentityPickerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v7, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[CNVisualIdentityPickerViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidateLayout");

}

- (id)photoPickerNavigationControllerForRootController:(id)a3
{
  id v4;
  CNPhotoPickerNavigationViewController *v5;

  v4 = a3;
  v5 = -[CNPhotoPickerNavigationViewController initWithRootViewController:]([CNPhotoPickerNavigationViewController alloc], "initWithRootViewController:", v4);

  -[CNPhotoPickerNavigationViewController setAllowRotation:](v5, "setAllowRotation:", -[CNVisualIdentityPickerViewController allowRotation](self, "allowRotation"));
  return v5;
}

- (void)updateActiveIndexPath:(id)a3 reload:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v4 = a4;
  v17 = a3;
  -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activePhotoIndexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v17);

  if ((v8 & 1) == 0)
  {
    v9 = (void *)objc_opt_new();
    -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activePhotoIndexPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setActivePhotoIndexPath:", v17);

    if (v17)
      objc_msgSend(v9, "addObject:", v17);
    -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "numberOfItemsInSection:", objc_msgSend(v17, "section"));
    v15 = objc_msgSend(v11, "row");

    if (v14 > v15 && v11)
      objc_msgSend(v9, "addObject:", v11);
    if (v4)
    {
      -[CNVisualIdentityPickerViewController collectionView](self, "collectionView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "reloadItemsAtIndexPaths:", v9);

    }
  }

}

- (void)updateActiveIndexPath:(id)a3
{
  -[CNVisualIdentityPickerViewController updateActiveIndexPath:reload:](self, "updateActiveIndexPath:reload:", a3, 0);
}

- (BOOL)hasPendingChanges
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  _BOOL4 v17;
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
  BOOL v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  CGRect v40;
  CGRect v41;

  -[CNVisualIdentityPickerViewController visualIdentity](self, "visualIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cropRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cropRect");
  v41.origin.x = v13;
  v41.origin.y = v14;
  v41.size.width = v15;
  v41.size.height = v16;
  v40.origin.x = v5;
  v40.origin.y = v7;
  v40.size.width = v9;
  v40.size.height = v11;
  v17 = CGRectEqualToRect(v40, v41);

  -[CNVisualIdentityPickerViewController visualIdentity](self, "visualIdentity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "imageData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "imageData");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNVisualIdentityPickerViewController visualIdentity](self, "visualIdentity");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "thumbnailImageData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "thumbnailImageData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNVisualIdentityPickerViewController visualIdentity](self, "visualIdentity");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "fullscreenImageData");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "fullscreenImageData");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 1;
  if (v17 && v19 == v21)
    v30 = v23 != v25 || v27 != v29;
  -[CNVisualIdentityPickerViewController visualIdentity](self, "visualIdentity");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "name");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v33)
  {
    -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      LOBYTE(v38) = 0;
LABEL_14:

      goto LABEL_15;
    }
  }
  -[CNVisualIdentityPickerViewController visualIdentity](self, "visualIdentity");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "name");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "name");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v35, "isEqual:", v37) ^ 1;

  if (!v33)
    goto LABEL_14;
LABEL_15:

  return v30 | v38;
}

- (void)updateVisualIdentityWithProviderItem:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v5, "updateVisualIdentity:", v4);
  else
    objc_msgSend(v4, "clearImage");

  -[CNVisualIdentityPickerViewController updateHeaderViewAvatar](self, "updateHeaderViewAvatar");
  -[CNVisualIdentityPickerViewController updateDoneButtonEnabledState](self, "updateDoneButtonEnabledState");

}

- (void)updateInjectedItemsSectionForProviderItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  CNVisualIdentityPickerViewController *v23;
  void *v24;
  int v25;
  id v26;
  void *v27;
  void *v28;
  char v29;
  uint64_t v30;
  id v31;
  id obj;
  _QWORD v33[6];
  _QWORD v34[6];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sectionIndexForProviderGroupType:", 4);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "injectedItemsGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeAllAddedProviderItems");

    if (v4)
    {
      v30 = v6;
      -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "variantsManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v4;
      objc_msgSend(v4, "createVariantsItemsWithVariantsManager:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_cn_reversed");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      obj = v12;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v36;
        v16 = *MEMORY[0x1E0D13850];
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v36 != v15)
              objc_enumerationMutation(obj);
            v18 = *(id *)(*((_QWORD *)&v35 + 1) + 8 * i);
            v19 = &unk_1EE033250;
            if (objc_msgSend(v18, "conformsToProtocol:", v19))
              v20 = v18;
            else
              v20 = 0;
            v21 = v20;

            if (!v21)
              goto LABEL_13;
            objc_msgSend(v21, "itemText");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "_cn_trimmedString");
            v23 = self;
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = (*(uint64_t (**)(uint64_t, void *))(v16 + 16))(v16, v24);

            self = v23;
            if (v25)
LABEL_13:
              v26 = -[CNVisualIdentityPickerViewController insertNewItem:toGroupType:updateActive:](self, "insertNewItem:toGroupType:updateActive:", v18, 4, 0);

          }
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        }
        while (v14);
      }

      -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "injectedItemsGroup");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "hasAddedProviderItems");

      if ((v29 & 1) == 0)
      {
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __82__CNVisualIdentityPickerViewController_updateInjectedItemsSectionForProviderItem___block_invoke;
        v34[3] = &unk_1E204C020;
        v34[4] = self;
        v34[5] = v30;
        objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v34);
      }

      v4 = v31;
    }
    else
    {
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __82__CNVisualIdentityPickerViewController_updateInjectedItemsSectionForProviderItem___block_invoke_2;
      v33[3] = &unk_1E204C020;
      v33[4] = self;
      v33[5] = v6;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v33);
    }
  }

}

- (void)updateDoneButtonEnabledState
{
  -[CNVisualIdentityPickerViewController updateDoneButtonEnabledStateForEditingProviderItem:](self, "updateDoneButtonEnabledStateForEditingProviderItem:", 0);
}

- (void)updateDoneButtonEnabledStateForEditingProviderItem:(id)a3
{
  _BOOL8 v4;
  void *v5;
  id v6;

  v4 = -[CNVisualIdentityPickerViewController hasPendingChanges](self, "hasPendingChanges", a3);
  -[CNVisualIdentityPickerViewController navigationItem](self, "navigationItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rightBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v4);

}

- (void)updateHeaderViewAvatar
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  -[CNVisualIdentityPickerViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placeholderProviderItem");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
  }
  else
  {
    -[CNVisualIdentityPickerViewController visualIdentity](self, "visualIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "identityType");

    if (v7)
      goto LABEL_5;
    -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "defaultItemSize");
    objc_msgSend(v9, "monogramProviderDefaultItemWithSize:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNVisualIdentityPickerViewController headerView](self, "headerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPlaceholderProviderItem:", v3);
  }

LABEL_5:
  -[CNVisualIdentityPickerViewController headerView](self, "headerView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updatePhotoViewWithUpdatedIdentity:", v8);

}

- (void)insertNewItemIntoSuggestions:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t);
  void *v14;
  CNVisualIdentityPickerViewController *v15;
  id v16;

  v4 = a3;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __69__CNVisualIdentityPickerViewController_insertNewItemIntoSuggestions___block_invoke;
  v14 = &unk_1E2050400;
  v15 = self;
  v16 = v4;
  v5 = v4;
  v6 = (void (**)(_QWORD))_Block_copy(&v11);
  if (-[CNVisualIdentityPickerViewController isViewLoaded](self, "isViewLoaded", v11, v12, v13, v14, v15))
  {
    v6[2](v6);
  }
  else
  {
    -[CNVisualIdentityPickerViewController pendingInjectedSuggestionItems](self, "pendingInjectedSuggestionItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "copy");
    v9 = _Block_copy(v8);
    objc_msgSend(v7, "arrayByAddingObject:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityPickerViewController setPendingInjectedSuggestionItems:](self, "setPendingInjectedSuggestionItems:", v10);

  }
}

- (id)insertNewItem:(id)a3 toGroupType:(int64_t)a4 updateActive:(BOOL)a5
{
  return -[CNVisualIdentityPickerViewController insertNewItem:toGroupType:updateActive:scrollToItem:](self, "insertNewItem:toGroupType:updateActive:scrollToItem:", a3, a4, a5, 1);
}

- (id)insertNewItem:(id)a3 toGroupType:(int64_t)a4 updateActive:(BOOL)a5 scrollToItem:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  CNVisualIdentityPickerViewController *v22;
  id v23;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "indexOfAddedItem:inGroupOfType:", v10, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0DC3F10];
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __92__CNVisualIdentityPickerViewController_insertNewItem_toGroupType_updateActive_scrollToItem___block_invoke;
    v21 = &unk_1E2050400;
    v22 = self;
    v14 = v12;
    v23 = v14;
    objc_msgSend(v13, "performWithoutAnimation:", &v18);
    if (v6)
    {
      -[CNVisualIdentityPickerViewController collectionView](self, "collectionView", v18, v19, v20, v21, v22);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "scrollToItemAtIndexPath:atScrollPosition:animated:", v14, 2, 1);

    }
    if (v7)
      -[CNVisualIdentityPickerViewController updateActiveIndexPath:](self, "updateActiveIndexPath:", v14);
    v16 = v14;

  }
  return v12;
}

- (void)deleteExistingItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeItem:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v8)
  {
    v7 = (void *)MEMORY[0x1E0DC3F10];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__CNVisualIdentityPickerViewController_deleteExistingItem___block_invoke;
    v9[3] = &unk_1E2050400;
    v9[4] = self;
    v10 = v8;
    objc_msgSend(v7, "performWithoutAnimation:", v9);

    v6 = v8;
  }

}

- (void)setSuggestionsProviderItemAsActiveItem:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[CNVisualIdentityPickerViewController deleteExistingItem:](self, "deleteExistingItem:", v5);
  v4 = -[CNVisualIdentityPickerViewController insertNewItem:toGroupType:updateActive:](self, "insertNewItem:toGroupType:updateActive:", v5, 1, 1);

}

- (id)contactImageForCurrentActiveItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activePhotoIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "providerItemAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "contactImageForMetadataStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v3;
  int64_t v4;

  -[CNVisualIdentityPickerViewController dataSource](self, "dataSource", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  return v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;

  -[CNVisualIdentityPickerViewController dataSource](self, "dataSource", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfItemsInSection:", a4);

  return v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  uint64_t v12;
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
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v6 = a3;
  v7 = a4;
  +[CNPhotoPickerCollectionViewCell cellIdentifier](CNPhotoPickerCollectionViewCell, "cellIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "providerItemAtIndexPath:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("-Add"));
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
  }
  -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "providerGroupAtIndexPath:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = v6;
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDisplaySessionUUID:", v16);
  -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activePhotoIndexPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSelected:", objc_msgSend(v7, "isEqual:", v18));

  if ((isKindOfClass & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CNVisualIdentityPickerViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "tintColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateTintColorIfNeeded:", v20);

    objc_msgSend(v15, "setDisplaysBorder:", 1);
    -[CNVisualIdentityPickerViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "tintColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateBorderTintColor:", v22);

  }
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 1;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __78__CNVisualIdentityPickerViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  v29[3] = &unk_1E204C048;
  v23 = v15;
  v30 = v23;
  v24 = v16;
  v31 = v24;
  v32 = &v33;
  objc_msgSend(v10, "thumbnailViewWithCompletion:", v29);
  objc_msgSend(v23, "setCellStyle:", isKindOfClass & 1u | (objc_msgSend(v14, "groupType") != 2));
  *((_BYTE *)v34 + 24) = 0;
  v25 = v31;
  v26 = v23;

  _Block_object_dispose(&v33, 8);
  return v26;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 0;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  BOOL v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  CGSize result;

  if (objc_msgSend(a3, "numberOfItemsInSection:", a5, a4) < 0)
  {
    v16 = *MEMORY[0x1E0C9D820];
    v17 = *(uint64_t *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "providerGroupAtSection:", a5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "groupType");
    v10 = objc_msgSend(v8, "groupType");
    v11 = objc_msgSend(v8, "groupType");
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceIdiom");

    if (!v9 || (!v13 ? (v14 = v10 == 1) : (v14 = 0), !v14 ? (v15 = v11 == 4) : (v15 = 1), v15))
    {
      v16 = *MEMORY[0x1E0C9D820];
      v17 = *(uint64_t *)(MEMORY[0x1E0C9D820] + 8);
    }
    else
    {
      v16 = 0.0;
      if (objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory"))
      {
        -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "actionTitleForSection:", a5);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[CNPhotoPickerSectionHeader heightNeededForAccessibilityLayoutIncludingActionButton:](CNPhotoPickerSectionHeader, "heightNeededForAccessibilityLayoutIncludingActionButton:", objc_msgSend(v21, "length") != 0);
        v17 = v22;

      }
      else
      {
        *(double *)&v17 = 44.0;
      }
    }

  }
  v18 = v16;
  v19 = *(double *)&v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  UIEdgeInsets result;

  v7 = a3;
  objc_msgSend(v7, "collectionViewLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionInset");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "userInterfaceIdiom");

  -[CNVisualIdentityPickerViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "traitCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "horizontalSizeClass");

  -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "providerGroupAtSection:", a5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_msgSend(v23, "groupType");
  if (v18 || v21 != 1)
  {
    if (!v24)
    {
      v31 = (double)objc_msgSend(v7, "numberOfItemsInSection:", a5);
      objc_msgSend(v8, "itemSize");
      v33 = v32 * v31;
      objc_msgSend(v8, "minimumInteritemSpacing");
      v35 = v34 * (v31 + -1.0);
      objc_msgSend(v7, "bounds");
      v37 = v36;
      -[CNVisualIdentityPickerViewController view](self, "view");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "safeAreaInsets");
      v40 = v39;
      -[CNVisualIdentityPickerViewController view](self, "view");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "safeAreaInsets");
      v43 = v37 - (v40 + v42);

      v16 = (v43 - (v33 + v35)) * 0.5;
      v12 = v16;
    }
  }
  else
  {
    if (v24 == 1)
    {
      -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "providerGroupAtSection:", a5 - 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v26, "groupType"))
      {
        objc_msgSend(v8, "minimumInteritemSpacing");
        v10 = v27 * 0.5;
      }

    }
    if (!objc_msgSend(v23, "groupType"))
    {
      -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "providerGroupAtSection:", a5 + 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v29, "groupType") == 1)
      {
        objc_msgSend(v8, "minimumInteritemSpacing");
        v14 = v30 * 0.5;
      }

    }
  }

  v44 = v10;
  v45 = v12;
  v46 = v14;
  v47 = v16;
  result.right = v47;
  result.bottom = v46;
  result.left = v45;
  result.top = v44;
  return result;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v24;
  objc_class *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id location;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = *MEMORY[0x1E0DC48A8];
  if ((id)*MEMORY[0x1E0DC48A8] != v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNVisualIdentityPickerViewController.m"), 1000, CFSTR("%@ asked to provide a supplementary element for an unsupported kind %@ at %@"), v26, v10, v11);

  }
  +[CNPhotoPickerSectionHeader reusableIdentifier](CNPhotoPickerSectionHeader, "reusableIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v12, v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNVisualIdentityPickerViewController contactStyle](self, "contactStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateStyle:", v15);

  -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "titleForSection:", objc_msgSend(v11, "section"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setText:", v17);

  objc_msgSend(v14, "actionButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "actionTitleForSection:", objc_msgSend(v11, "section"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTitle:forState:", v21, 0);

  objc_initWeak(&location, self);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __101__CNVisualIdentityPickerViewController_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke;
  v27[3] = &unk_1E204F910;
  objc_copyWeak(&v29, &location);
  v22 = v11;
  v28 = v22;
  objc_msgSend(v14, "setActionBlock:", v27);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

  return v14;
}

- (void)headerActionPressedAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v10 = a3;
  -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "providerGroupAtIndexPath:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "groupType") == 2)
  {
    -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateGroupCollapsedStateForSection:", objc_msgSend(v10, "section"));

    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(v10, "section"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0DC3F10];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __71__CNVisualIdentityPickerViewController_headerActionPressedAtIndexPath___block_invoke;
    v11[3] = &unk_1E2050400;
    v11[4] = self;
    v12 = v7;
    v9 = v7;
    objc_msgSend(v8, "performWithoutAnimation:", v11);

  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
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
  void *v14;
  id v15;
  void *v16;
  id v17;

  v17 = a4;
  -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "providerGroupAtIndexPath:", v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isItemAtIndexPathAddItem:", v17);

  switch(objc_msgSend(v6, "groupType"))
  {
    case 0:
      goto LABEL_3;
    case 1:
      if (v8)
      {
LABEL_3:
        -[CNVisualIdentityPickerViewController didSelectSuggestionsAddItemAtIndexPath:](self, "didSelectSuggestionsAddItemAtIndexPath:", v17);
        goto LABEL_17;
      }
      -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "providerItemAtIndexPath:", v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNVisualIdentityPickerViewController processSelectionForSuggestionsProviderItem:atIndexPath:](self, "processSelectionForSuggestionsProviderItem:atIndexPath:", v10, v17);
      goto LABEL_16;
    case 2:
      if (v8)
      {
        -[CNVisualIdentityPickerViewController showAvatarEditorForCreation](self, "showAvatarEditorForCreation");
      }
      else
      {
        objc_opt_class();
        -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "providerItemAtIndexPath:", v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
        v15 = v14;

        if (v15)
        {
          -[CNVisualIdentityPickerViewController showAvatarPosePickerFromItem:atIndexPath:](self, "showAvatarPosePickerFromItem:atIndexPath:", v15, v17);

        }
      }
      goto LABEL_17;
    case 3:
      if (v8)
      {
        -[CNVisualIdentityPickerViewController handleAddEmojiItemSelectedWithIndexPath:](self, "handleAddEmojiItemSelectedWithIndexPath:", v17);
      }
      else
      {
        -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "providerItemAtIndexPath:", v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[CNVisualIdentityPickerViewController selectItem:presentFromViewControllerIfNeeded:](self, "selectItem:presentFromViewControllerIfNeeded:", v10, self);
LABEL_16:

      }
LABEL_17:

      return;
    case 4:
      -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "providerItemAtIndexPath:", v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[CNVisualIdentityPickerViewController updateVisualIdentityWithProviderItem:](self, "updateVisualIdentityWithProviderItem:", v10);
      goto LABEL_16;
    default:
      goto LABEL_17;
  }
}

- (void)didSelectSuggestionsAddItemAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "providerItemAtIndexPath:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v6 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    switch(objc_msgSend(v8, "addItemType"))
    {
      case 0:
        -[CNVisualIdentityPickerViewController presentCameraImagePicker](self, "presentCameraImagePicker");
        break;
      case 1:
        -[CNVisualIdentityPickerViewController presentLibraryImagePickerForIndexPath:](self, "presentLibraryImagePickerForIndexPath:", v9);
        break;
      case 2:
        -[CNVisualIdentityPickerViewController handleAddEmojiItemSelectedWithIndexPath:](self, "handleAddEmojiItemSelectedWithIndexPath:", v9);
        break;
      case 3:
        -[CNVisualIdentityPickerViewController presentMonogramEditorFromIndexPath:](self, "presentMonogramEditorFromIndexPath:", v9);
        break;
      default:
        break;
    }
  }

}

- (void)presentEmojiEditor
{
  id v3;

  objc_msgSend((id)objc_opt_class(), "defaultItemSize");
  +[CNPhotoPickerEmojiProviderItem addNewEmojiProviderItemWithSize:](CNPhotoPickerEmojiProviderItem, "addNewEmojiProviderItemWithSize:");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityPickerViewController selectItem:presentFromViewControllerIfNeeded:](self, "selectItem:presentFromViewControllerIfNeeded:", v3, self);

}

- (void)presentMonogramEditorFromIndexPath:(id)a3
{
  void *v4;
  id v5;

  -[CNVisualIdentityPickerViewController dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultItemSize");
  objc_msgSend(v4, "monogramProviderMonogramItemWithSize:");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[CNVisualIdentityPickerViewController selectItem:presentFromViewControllerIfNeeded:](self, "selectItem:presentFromViewControllerIfNeeded:", v5, self);
}

- (BOOL)isEditingOrDuplicatingItem
{
  void *v3;
  BOOL v4;
  void *v5;

  -[CNVisualIdentityPickerViewController editingProviderItem](self, "editingProviderItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[CNVisualIdentityPickerViewController duplicatingProviderItem](self, "duplicatingProviderItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (void)selectItem:(id)a3 presentFromViewControllerIfNeeded:(id)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (objc_msgSend(v10, "allowsMoveAndScale"))
  {
    v7 = -[CNVisualIdentityPickerViewController isEditingOrDuplicatingItem](self, "isEditingOrDuplicatingItem");
    -[CNVisualIdentityPickerViewController imagePickerController](self, "imagePickerController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v10, "originalImageData");
    else
      objc_msgSend(v10, "imageData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cropRect");
    objc_msgSend(v8, "presentMoveAndScaleForImageData:withCropRect:fromViewController:", v9, v6);

  }
  else if (objc_msgSend(v10, "allowsVariants"))
  {
    -[CNVisualIdentityPickerViewController presentVisualIdentityItemEditorForItem:fromViewController:](self, "presentVisualIdentityItemEditorForItem:fromViewController:", v10, v6);
  }

}

- (void)presentVisualIdentityItemEditorForItem:(id)a3 fromViewController:(id)a4
{
  id v6;
  id v7;
  CNVisualIdentityItemEditorViewController *v8;
  void *v9;
  void *v10;
  CNVisualIdentityItemEditorViewController *v11;

  v6 = a4;
  v7 = a3;
  v8 = [CNVisualIdentityItemEditorViewController alloc];
  -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "variantsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CNVisualIdentityItemEditorViewController initWithProviderItem:variantsManager:](v8, "initWithProviderItem:variantsManager:", v7, v10);

  -[CNVisualIdentityItemEditorViewController setDelegate:](v11, "setDelegate:", self);
  -[CNVisualIdentityPickerViewController presentEditItemViewController:fromViewController:](self, "presentEditItemViewController:fromViewController:", v11, v6);

}

- (int64_t)defaultModalPresentationStyle
{
  void *v2;
  int64_t v3;
  void *v4;

  -[CNVisualIdentityPickerViewController contactStyle](self, "contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "shouldPresentInCurrentContext") & 1) != 0)
  {
    v3 = 3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "userInterfaceIdiom") == 1)
      v3 = 2;
    else
      v3 = -2;

  }
  return v3;
}

- (void)showAvatarEditorForCreation
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (objc_msgSend((id)objc_opt_class(), "canShowAvatarEditor"))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v3 = (void *)getAVTAvatarEditorViewControllerClass_softClass;
    v15 = getAVTAvatarEditorViewControllerClass_softClass;
    if (!getAVTAvatarEditorViewControllerClass_softClass)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __getAVTAvatarEditorViewControllerClass_block_invoke;
      v11[3] = &unk_1E204EBC0;
      v11[4] = &v12;
      __getAVTAvatarEditorViewControllerClass_block_invoke((uint64_t)v11);
      v3 = (void *)v13[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v12, 8);
    -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "avatarStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewControllerForCreatingAvatarInStore:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setDelegate:", self);
    objc_msgSend(v7, "setEditorPresentationContext:", 1);
    objc_msgSend(v7, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setBackgroundHidden:", 1);

    -[CNVisualIdentityPickerViewController photoPickerNavigationControllerForRootController:](self, "photoPickerNavigationControllerForRootController:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setModalPresentationStyle:", -[CNVisualIdentityPickerViewController defaultModalPresentationStyle](self, "defaultModalPresentationStyle"));
    -[CNVisualIdentityPickerViewController contactStyle](self, "contactStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setModalTransitionStyle:", objc_msgSend(v10, "modalTransitionStyle"));

    -[CNVisualIdentityPickerViewController sender:presentViewController:](self, "sender:presentViewController:", 0, v9);
  }
}

- (void)showAvatarPosePickerFromItem:(id)a3 atIndexPath:(id)a4
{
  CNAvatarEditingManager *v5;
  void *v6;
  void *v7;
  void *v8;
  CNAvatarEditingManager *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  if (+[CNPhotoPickerCapabilities allowsAvatarUI](CNPhotoPickerCapabilities, "allowsAvatarUI"))
  {
    v5 = [CNAvatarEditingManager alloc];
    objc_msgSend(v17, "avatarRecord");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "variantsManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CNAvatarEditingManager initWithAvatarRecord:variantsManager:](v5, "initWithAvatarRecord:variantsManager:", v6, v8);

    -[CNAvatarEditingManager setDelegate:](v9, "setDelegate:", self);
    -[CNAvatarEditingManager setOriginalItem:](v9, "setOriginalItem:", v17);
    -[CNVisualIdentityPickerViewController setAvatarEditingManager:](self, "setAvatarEditingManager:", v9);
    -[CNVisualIdentityPickerViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "backgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarEditingManager viewController](v9, "viewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v11);

    -[CNAvatarEditingManager viewController](v9, "viewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityPickerViewController photoPickerNavigationControllerForRootController:](self, "photoPickerNavigationControllerForRootController:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setModalPresentationStyle:", -[CNVisualIdentityPickerViewController defaultModalPresentationStyle](self, "defaultModalPresentationStyle"));
    -[CNVisualIdentityPickerViewController contactStyle](self, "contactStyle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setModalTransitionStyle:", objc_msgSend(v16, "modalTransitionStyle"));

    -[CNVisualIdentityPickerViewController sender:presentViewController:](self, "sender:presentViewController:", 0, v15);
  }

}

- (void)showAvatarCropAndScaleForItem:(id)a3 fromViewController:(id)a4
{
  id v6;
  id v7;
  CNAvatarEditingManager *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = [CNAvatarEditingManager alloc];
  objc_msgSend(v7, "avatarRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "variantsManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CNAvatarEditingManager initForEditingWithAvatarRecord:variantsManager:fromViewController:](v8, "initForEditingWithAvatarRecord:variantsManager:fromViewController:", v9, v11, v6);

  objc_msgSend(v14, "setDelegate:", self);
  objc_msgSend(v14, "setOriginalItem:", v7);
  -[CNVisualIdentityPickerViewController setAvatarEditingManager:](self, "setAvatarEditingManager:", v14);
  objc_msgSend(v14, "imagePickerForItem:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNVisualIdentityPickerViewController imagePickerController](self, "imagePickerController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentImagePicker:withStyle:fromViewController:forVisualIdentityPicker:", v12, 6, v6, self);

}

- (void)presentLibraryImagePickerForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CNVisualIdentityPickerViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForItemAtIndexPath:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CNVisualIdentityPickerViewController imagePickerController](self, "imagePickerController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentPhotoLibraryPickerFromViewController:sourceView:", self, v7);

}

- (void)presentCameraImagePicker
{
  id v3;

  if (+[CNPhotoPickerCapabilities allowsCameraAccess](CNPhotoPickerCapabilities, "allowsCameraAccess"))
  {
    -[CNVisualIdentityPickerViewController imagePickerController](self, "imagePickerController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentCameraImagePickerFromViewController:", self);

  }
}

- (void)photoPickerProviderGroupDidUpdate:(id)a3 requiresFullReload:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a4;
  v14 = a3;
  if (-[CNVisualIdentityPickerViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "sectionIndexForProviderGroup:", v14);

    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = objc_msgSend(v14, "groupType");
      if ((unint64_t)(v8 - 2) >= 2)
      {
        if (v8 == 1)
        {
          if (v4)
          {
            -[CNVisualIdentityPickerViewController collectionView](self, "collectionView");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "reloadData");

          }
          else
          {
            -[CNVisualIdentityPickerViewController reloadItemsForUpdatedSuggestionsGroup:atSectionIndex:](self, "reloadItemsForUpdatedSuggestionsGroup:atSectionIndex:", v14, v7);
          }
          -[CNVisualIdentityPickerViewController updateActiveIndexPathForUpdatedSuggestionsGroup:atSectionIndex:](self, "updateActiveIndexPathForUpdatedSuggestionsGroup:atSectionIndex:", v14, v7);
          v11 = *MEMORY[0x1E0D137F8];
          -[CNVisualIdentityPickerViewController pendingInjectedSuggestionItems](self, "pendingInjectedSuggestionItems");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v11) = (*(uint64_t (**)(uint64_t, void *))(v11 + 16))(v11, v12);

          if ((v11 & 1) == 0)
          {
            -[CNVisualIdentityPickerViewController pendingInjectedSuggestionItems](self, "pendingInjectedSuggestionItems");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "_cn_each:", &__block_literal_global_210);

            -[CNVisualIdentityPickerViewController setPendingInjectedSuggestionItems:](self, "setPendingInjectedSuggestionItems:", MEMORY[0x1E0C9AA60]);
          }
        }
      }
      else
      {
        -[CNVisualIdentityPickerViewController collectionView](self, "collectionView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "reloadData");

      }
    }
  }

}

- (void)photoPickerProviderGroup:(id)a3 didUpdateItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[CNVisualIdentityPickerViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (objc_msgSend(v6, "groupType") == 1)
    {
      -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "imageData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "findActiveIndexPathInGroup:withImageData:", v6, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[CNVisualIdentityPickerViewController collectionView](self, "collectionView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "reloadItemsAtIndexPaths:", v12);

      }
    }
    else
    {
      -[CNVisualIdentityPickerViewController photoPickerProviderGroupDidUpdate:requiresFullReload:](self, "photoPickerProviderGroupDidUpdate:requiresFullReload:", v6, 0);
    }
  }

}

- (void)reloadItemsForUpdatedSuggestionsGroup:(id)a3 atSectionIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  int64_t v22;

  v6 = a3;
  -[CNVisualIdentityPickerViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathsForVisibleItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __93__CNVisualIdentityPickerViewController_reloadItemsForUpdatedSuggestionsGroup_atSectionIndex___block_invoke;
  v20[3] = &unk_1E204C090;
  v22 = a4;
  v16 = v6;
  v21 = v16;
  objc_msgSend(v8, "_cn_filter:", v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D137F8] + 16))())
  {
    -[CNVisualIdentityPickerViewController collectionView](self, "collectionView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reloadSections:", v12);

  }
  else
  {
    -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "indexPathsToReloadForUpdatedGroup:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNVisualIdentityPickerViewController collectionView](self, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __93__CNVisualIdentityPickerViewController_reloadItemsForUpdatedSuggestionsGroup_atSectionIndex___block_invoke_2;
    v17[3] = &unk_1E204FAA0;
    v17[4] = self;
    v18 = v10;
    v19 = v14;
    v11 = v14;
    objc_msgSend(v15, "performBatchUpdates:completion:", v17, 0);

  }
}

- (void)updateActiveIndexPathForUpdatedSuggestionsGroup:(id)a3 atSectionIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v13 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v13;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    if (v8)
    {
      -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "findActiveIndexPathInGroup:withImageData:", v13, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v10, "indexForDefaultMonogram"), a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v12 = 0;
  }
  -[CNVisualIdentityPickerViewController updateActiveIndexPath:](self, "updateActiveIndexPath:", v12);

}

- (void)photoPickerHeaderView:(id)a3 didUpdateIdentityNameTextField:(id)a4 withText:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v7 = a5;
  objc_msgSend(a4, "textInputMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "primaryLanguage");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", v10);
  -[CNVisualIdentityPickerViewController updateVisualIdentityWithName:locale:](self, "updateVisualIdentityWithName:locale:", v7, v9);

  -[CNVisualIdentityPickerViewController updateDoneButtonEnabledState](self, "updateDoneButtonEnabledState");
}

- (void)photoPickerHeaderViewDidTapClearAvatarImageButton:(id)a3
{
  -[CNVisualIdentityPickerViewController updateVisualIdentityWithProviderItem:](self, "updateVisualIdentityWithProviderItem:", 0);
  -[CNVisualIdentityPickerViewController updateInjectedItemsSectionForProviderItem:](self, "updateInjectedItemsSectionForProviderItem:", 0);
  -[CNVisualIdentityPickerViewController updateActiveIndexPath:](self, "updateActiveIndexPath:", 0);
}

- (void)photoPickerHeaderViewDidReceiveDroppedImageData:(id)a3
{
  objc_class *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CNPhotoPickerProviderItem *v18;
  id v19;
  CGRect v20;
  CGRect v21;

  v4 = (objc_class *)MEMORY[0x1E0DC3870];
  v5 = a3;
  v19 = (id)objc_msgSend([v4 alloc], "initWithData:", v5);
  objc_msgSend(v19, "size");
  v7 = v6;
  objc_msgSend(v19, "scale");
  v9 = v7 / v8;
  objc_msgSend(v19, "size");
  v11 = v10;
  objc_msgSend(v19, "scale");
  v13 = v11 / v12;
  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  v20.size.width = v9;
  v20.size.height = v13;
  CGRectGetWidth(v20);
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.width = v9;
  v21.size.height = v13;
  CGRectGetHeight(v21);
  UIRectGetCenter();
  objc_msgSend(v19, "scale");
  UIRectCenteredAboutPointScale();
  v18 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:]([CNPhotoPickerProviderItem alloc], "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:", v5, 0, 0, v14, v15, v16, v17);

  if (-[CNPhotoPickerProviderItem allowsVariants](v18, "allowsVariants"))
    -[CNVisualIdentityPickerViewController presentVisualIdentityItemEditorForItem:fromViewController:](self, "presentVisualIdentityItemEditorForItem:fromViewController:", v18, self);

}

- (void)updateVisualIdentityWithName:(id)a3 locale:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  id v21;

  v21 = a3;
  v6 = a4;
  -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "canUpdateGroupName");

  if (v8)
  {
    -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "abbreviatedName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateGroupName:", v21);

    -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityPickerViewController updateEmojiSuggestionsForUpdatedVisualIdentity:locale:](self, "updateEmojiSuggestionsForUpdatedVisualIdentity:locale:", v12, v6);

    -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "abbreviatedName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v10, "isEqualToString:", v14);

    v16 = *MEMORY[0x1E0D13850];
    -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "abbreviatedName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (*(uint64_t (**)(uint64_t, void *))(v16 + 16))(v16, v18);

    if ((v15 & 1) == 0 && v19)
    {
      -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNVisualIdentityPickerViewController updateMonogramsForUpdatedVisualIdentity:](self, "updateMonogramsForUpdatedVisualIdentity:", v20);

    }
  }

}

- (void)updateMonogramsForUpdatedVisualIdentity:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  _BOOL8 v11;
  id v12;

  v4 = a3;
  -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suggestionsGroup");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "defaultItemSize");
  v7 = v6;
  v9 = v8;
  -[CNVisualIdentityPickerViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "effectiveUserInterfaceLayoutDirection") == 1;

  objc_msgSend(v12, "reloadMonogramProviderGroupWithVisualIdentity:size:RTL:", v4, v11, v7, v9);
}

- (void)updateEmojiSuggestionsForUpdatedVisualIdentity:(id)a3 locale:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[5];
  _QWORD v31[5];

  v29 = a3;
  v6 = a4;
  if (-[CNVisualIdentityPickerViewController shouldUpdateEmojiSuggestions](self, "shouldUpdateEmojiSuggestions"))
  {
    objc_msgSend(v29, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "variantsManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "defaultItemSize");
    +[CNPhotoPickerEmojiProviderItem suggestedEmojiItemsForString:variantsManager:size:locale:](CNPhotoPickerEmojiProviderItem, "suggestedEmojiItemsForString:variantsManager:size:locale:", v7, v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueEmojiSuggestionItems:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
    {
      -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "emojiSuggestionItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      v16 = MEMORY[0x1E0C809B0];
      if (v15 <= 2)
      {
        objc_msgSend(v12, "_cn_takeLast:", 3 - v15);
        v20 = objc_claimAutoreleasedReturnValue();

        -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "emojiSuggestionItems");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "arrayByAddingObjectsFromArray:", v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setEmojiSuggestionItems:", v23);

        v12 = (void *)v20;
      }
      else
      {
        -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "emojiSuggestionItems");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v16;
        v31[1] = 3221225472;
        v31[2] = __94__CNVisualIdentityPickerViewController_updateEmojiSuggestionsForUpdatedVisualIdentity_locale___block_invoke;
        v31[3] = &unk_1E204C1A8;
        v31[4] = self;
        objc_msgSend(v18, "_cn_each:", v31);

        -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setEmojiSuggestionItems:", v12);

      }
      -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "activePhotoIndexPath");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "providerItemAtIndexPath:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v30[0] = v16;
      v30[1] = 3221225472;
      v30[2] = __94__CNVisualIdentityPickerViewController_updateEmojiSuggestionsForUpdatedVisualIdentity_locale___block_invoke_2;
      v30[3] = &unk_1E204C1A8;
      v30[4] = self;
      objc_msgSend(v12, "_cn_each:", v30);
      -[CNVisualIdentityPickerViewController setSuggestionsProviderItemAsActiveItem:](self, "setSuggestionsProviderItemAsActiveItem:", v28);

    }
  }

}

- (void)sender:(id)a3 presentViewController:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v6 = a3;
  v7 = a4;
  -[CNVisualIdentityPickerViewController contactStyle](self, "contactStyle");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setModalTransitionStyle:", objc_msgSend((id)v8, "modalTransitionStyle"));

  v22 = v6;
  objc_msgSend(v7, "popoverPresentationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSourceView:", v22);

  objc_msgSend(v22, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v7, "popoverPresentationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSourceRect:", v11, v13, v15, v17);

  objc_msgSend(v7, "popoverPresentationController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPermittedArrowDirections:", 15);

  -[CNVisualIdentityPickerViewController preferredContentSize](self, "preferredContentSize");
  objc_msgSend(v7, "setPreferredContentSize:");
  -[CNVisualIdentityPickerViewController presenterDelegate](self, "presenterDelegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CNVisualIdentityPickerViewController presenterDelegate](self, "presenterDelegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "visualIdentityPicker:presentViewController:", self, v7);

  }
  else
  {
    -[CNVisualIdentityPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  }

}

- (void)sender:(id)a3 dismissViewController:(id)a4
{
  -[CNVisualIdentityPickerViewController sender:dismissViewController:completionHandler:](self, "sender:dismissViewController:completionHandler:", a3, a4, 0);
}

- (void)sender:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  -[CNVisualIdentityPickerViewController presenterDelegate](self, "presenterDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[CNVisualIdentityPickerViewController presenterDelegate](self, "presenterDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "visualIdentityPicker:dismissViewController:", self, v11);

  }
  else
  {
    objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 1, v7);
  }

}

- (BOOL)isPresentingModalViewController
{
  void *v2;
  BOOL v3;

  -[CNVisualIdentityPickerViewController presentedViewController](self, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)imagePickerController:(id)a3 didFinishWithProviderItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  CNVisualIdentityPickerViewController *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD aBlock[5];
  id v23;

  v6 = a3;
  v7 = a4;
  getPHPickerViewControllerClass[0]();
  objc_opt_class();
  objc_msgSend(v6, "presentingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v7)
  {
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__CNVisualIdentityPickerViewController_imagePickerController_didFinishWithProviderItem___block_invoke;
    aBlock[3] = &unk_1E2050400;
    aBlock[4] = self;
    v23 = v7;
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __88__CNVisualIdentityPickerViewController_imagePickerController_didFinishWithProviderItem___block_invoke_2;
    v19[3] = &unk_1E204F9B0;
    v20 = v10;
    v21 = _Block_copy(aBlock);
    v12 = v10;
    v13 = v21;
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v19);

    v14 = v23;
  }
  else
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __88__CNVisualIdentityPickerViewController_imagePickerController_didFinishWithProviderItem___block_invoke_3;
    v16[3] = &unk_1E2050400;
    v17 = v10;
    v18 = self;
    v15 = v10;
    -[CNVisualIdentityPickerViewController sender:dismissViewController:completionHandler:](self, "sender:dismissViewController:completionHandler:", 0, v6, v16);
    v14 = v17;
  }

}

- (void)imagePickerControllerDidCancel:(id)a3
{
  -[CNVisualIdentityPickerViewController sender:dismissViewController:](self, "sender:dismissViewController:", 0, a3);
  -[CNVisualIdentityPickerViewController setActionsViewController:](self, "setActionsViewController:", 0);
  -[CNVisualIdentityPickerViewController setEditingProviderItem:](self, "setEditingProviderItem:", 0);
}

- (void)presentActionsViewControllerForProviderItem:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  CNPhotoPickerActionsModel *v15;
  void *v16;
  _BOOL8 v17;
  CNPhotoPickerActionsModel *v18;
  id v19;
  void *v20;
  CNPhotoPickerActionsModel *v21;
  CNPhotoPickerActionsModel *v22;
  CNPhotoPickerActionsViewController *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  v6 = a4;
  -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "providerGroupAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "groupType");
  if (v9 == 3)
  {
    v21 = [CNPhotoPickerActionsModel alloc];
    -[CNVisualIdentityPickerViewController assignActionTitleOverride](self, "assignActionTitleOverride");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v21;
    v19 = v26;
    v20 = v16;
    v17 = 0;
LABEL_8:
    v22 = -[CNPhotoPickerActionsModel initWithProviderItem:assignActionTitleOverride:canDelete:atIndexPath:](v18, "initWithProviderItem:assignActionTitleOverride:canDelete:atIndexPath:", v19, v20, v17, v6);

    v23 = -[CNPhotoPickerActionsViewController initWithActionsModel:]([CNPhotoPickerActionsViewController alloc], "initWithActionsModel:", v22);
    -[CNPhotoPickerActionsViewController setDelegate:](v23, "setDelegate:", self);
    -[CNVisualIdentityPickerViewController setActionsViewController:](self, "setActionsViewController:", v23);
    -[CNVisualIdentityPickerViewController photoPickerNavigationControllerForRootController:](self, "photoPickerNavigationControllerForRootController:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setModalPresentationStyle:", -[CNVisualIdentityPickerViewController defaultModalPresentationStyle](self, "defaultModalPresentationStyle"));
    -[CNVisualIdentityPickerViewController contactStyle](self, "contactStyle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setModalTransitionStyle:", objc_msgSend(v25, "modalTransitionStyle"));

    -[CNVisualIdentityPickerViewController sender:presentViewController:](self, "sender:presentViewController:", 0, v24);
    goto LABEL_9;
  }
  if (v9 == 1)
  {
    objc_opt_class();
    -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "providerGroupAtIndexPath:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    v14 = objc_msgSend(v13, "indexForDefaultMonogram");
    v15 = [CNPhotoPickerActionsModel alloc];
    -[CNVisualIdentityPickerViewController assignActionTitleOverride](self, "assignActionTitleOverride");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v6, "row") > v14;
    v18 = v15;
    v19 = v26;
    v20 = v16;
    goto LABEL_8;
  }
LABEL_9:

}

- (void)photoPickerActionsViewController:(id)a3 didPerformAction:(int64_t)a4 withProviderItem:(id)a5 atIndexPath:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;

  v36 = a3;
  v10 = a5;
  v11 = a6;
  switch(a4)
  {
    case 0:
      objc_opt_class();
      -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "providerGroupAtIndexPath:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
      v15 = v14;

      v16 = objc_msgSend(v15, "indexForDefaultMonogram");
      if (objc_msgSend(v11, "row") == v16)
      {
        -[CNVisualIdentityPickerViewController updateVisualIdentityWithProviderItem:](self, "updateVisualIdentityWithProviderItem:", v10);
        -[CNVisualIdentityPickerViewController updateActiveIndexPath:](self, "updateActiveIndexPath:", v11);
      }
      else
      {
        -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "activePhotoIndexPath");
        v33 = (id)objc_claimAutoreleasedReturnValue();

        if (v33 != v11)
        {
          -[CNVisualIdentityPickerViewController setSuggestionsProviderItemAsActiveItem:](self, "setSuggestionsProviderItemAsActiveItem:", v10);
          -[CNVisualIdentityPickerViewController updateVisualIdentityWithProviderItem:](self, "updateVisualIdentityWithProviderItem:", v10);
        }
      }
      -[CNVisualIdentityPickerViewController sender:dismissViewController:](self, "sender:dismissViewController:", 0, v36);
      break;
    case 1:
      -[CNVisualIdentityPickerViewController setEditingProviderItem:](self, "setEditingProviderItem:", v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        v17 = v10;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v18 = v17;
        else
          v18 = 0;
        v19 = v18;

        if (v19)
          -[CNVisualIdentityPickerViewController showAvatarCropAndScaleForItem:fromViewController:](self, "showAvatarCropAndScaleForItem:fromViewController:", v19, v36);
        goto LABEL_33;
      }
      -[CNVisualIdentityPickerViewController selectItem:presentFromViewControllerIfNeeded:](self, "selectItem:presentFromViewControllerIfNeeded:", v10, v36);
      break;
    case 2:
      v19 = (id)objc_msgSend(v10, "copy");
      -[CNVisualIdentityPickerViewController actionsViewController](self, "actionsViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "updateActionsModelWithProviderItem:", v19);

      -[CNVisualIdentityPickerViewController updateVisualIdentityWithProviderItem:](self, "updateVisualIdentityWithProviderItem:", v19);
      v21 = -[CNVisualIdentityPickerViewController insertNewItem:toGroupType:updateActive:](self, "insertNewItem:toGroupType:updateActive:", v19, 1, 1);
      -[CNVisualIdentityPickerViewController setDuplicatingProviderItem:](self, "setDuplicatingProviderItem:", v19);
      -[CNVisualIdentityPickerViewController selectItem:presentFromViewControllerIfNeeded:](self, "selectItem:presentFromViewControllerIfNeeded:", v19, v36);
      goto LABEL_33;
    case 3:
      -[CNVisualIdentityPickerViewController deleteExistingItem:](self, "deleteExistingItem:", v10);
      -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "providerItemAtIndexPath:", v11);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "activePhotoIndexPath");
      v24 = (id)objc_claimAutoreleasedReturnValue();

      if (v24 == v11)
      {
        -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "providerGroupAtIndexPath:", v11);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        v27 = v26;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v28 = v27;
        else
          v28 = 0;
        v29 = v28;

        if (v19)
        {
          v30 = v19;
          v31 = v11;
        }
        else if (v29)
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v29, "indexForDefaultMonogram"), 0);
          v31 = (id)objc_claimAutoreleasedReturnValue();
          -[CNVisualIdentityPickerViewController dataSource](self, "dataSource");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "providerItemAtIndexPath:", v11);
          v30 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v31 = 0;
          v30 = 0;
        }
        -[CNVisualIdentityPickerViewController updateActiveIndexPath:reload:](self, "updateActiveIndexPath:reload:", v31, 0);
        -[CNVisualIdentityPickerViewController updateVisualIdentityWithProviderItem:](self, "updateVisualIdentityWithProviderItem:", v30);

      }
      objc_msgSend(v10, "recentsIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
        -[CNVisualIdentityPickerViewController deleteItemFromRecentsImageStore:](self, "deleteItemFromRecentsImageStore:", v10);
      if (v19)
        objc_msgSend(v36, "performDeleteTransitionToItem:", v19);
      else
        -[CNVisualIdentityPickerViewController sender:dismissViewController:](self, "sender:dismissViewController:", 0, v36);
LABEL_33:

      break;
    default:
      break;
  }

}

- (void)photoPickerActionsViewControllerDidFinish:(id)a3
{
  -[CNVisualIdentityPickerViewController sender:dismissViewController:](self, "sender:dismissViewController:", 0, a3);
  -[CNVisualIdentityPickerViewController setEditingProviderItem:](self, "setEditingProviderItem:", 0);
  -[CNVisualIdentityPickerViewController setDuplicatingProviderItem:](self, "setDuplicatingProviderItem:", 0);
  -[CNVisualIdentityPickerViewController setActionsViewController:](self, "setActionsViewController:", 0);
}

- (void)avatarEditingManager:(id)a3 didFinishWithProviderItem:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(a3, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityPickerViewController selectItem:presentFromViewControllerIfNeeded:](self, "selectItem:presentFromViewControllerIfNeeded:", v8, v7);
  }
  else
  {
    objc_msgSend(v6, "presentingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityPickerViewController sender:dismissViewController:](self, "sender:dismissViewController:", 0, v7);
  }

}

- (void)avatarEditorViewControllerDidCancel:(id)a3
{
  id v4;

  objc_msgSend(a3, "presentingViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityPickerViewController sender:dismissViewController:](self, "sender:dismissViewController:", 0, v4);

}

- (void)avatarEditorViewController:(id)a3 didFinishWithAvatarRecord:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  +[CNPhotoPickerAnimojiProvider providerItemForAvatarRecord:](CNPhotoPickerAnimojiProvider, "providerItemForAvatarRecord:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityPickerViewController insertNewItem:toGroupType:updateActive:](self, "insertNewItem:toGroupType:updateActive:", v8, 2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_msgSend(v6, "presentingViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __93__CNVisualIdentityPickerViewController_avatarEditorViewController_didFinishWithAvatarRecord___block_invoke;
  v13[3] = &unk_1E204FF10;
  objc_copyWeak(&v16, &location);
  v11 = v8;
  v14 = v11;
  v12 = v9;
  v15 = v12;
  -[CNVisualIdentityPickerViewController sender:dismissViewController:completionHandler:](self, "sender:dismissViewController:completionHandler:", 0, v10, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (BOOL)isModalInPresentation
{
  void *v2;
  void *v3;
  char v4;

  -[CNVisualIdentityPickerViewController navigationItem](self, "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rightBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabled");

  return v4;
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNVisualIdentityPickerViewController presenterDelegate](self, "presenterDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visualIdentityPicker:presentationControllerWillDismiss:", self, v4);

}

- (void)presentDismissConfirmation
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];

  if (-[CNVisualIdentityPickerViewController hasPendingChanges](self, "hasPendingChanges"))
  {
    v3 = (void *)MEMORY[0x1E0DC3450];
    CNContactsUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("PHOTO_EDITING_DISCARD_CONFIRMATION_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0DC3448];
    CNContactsUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("PHOTO_EDITING_DISCARD_CONFIRM"), &stru_1E20507A8, CFSTR("Localized"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __66__CNVisualIdentityPickerViewController_presentDismissConfirmation__block_invoke;
    v18[3] = &unk_1E204F7F0;
    v18[4] = self;
    objc_msgSend(v7, "actionWithTitle:style:handler:", v9, 2, v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v10);

    v11 = (void *)MEMORY[0x1E0DC3448];
    CNContactsUIBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("PHOTO_EDITING_DISCARD_CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v14);

    -[CNVisualIdentityPickerViewController navigationItem](self, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "leftBarButtonItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "popoverPresentationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBarButtonItem:", v16);

    -[CNVisualIdentityPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  }
  else
  {
    -[CNVisualIdentityPickerViewController cancel:](self, "cancel:", 0);
  }
}

- (void)deleteItemFromRecentsImageStore:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  objc_msgSend(v3, "recentsIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C97238]);
    v6 = (void *)MEMORY[0x1E0C97230];
    objc_msgSend(v3, "recentsIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "saveRequestToDeleteImageForIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 0;
    objc_msgSend(v5, "performSaveRequest:error:", v8, &v9);

  }
}

- (void)saveItemToRecentsImageStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNVisualIdentityPickerViewController visualIdentity](self, "visualIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "contactImageForMetadataStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {

    }
    else
    {
      objc_msgSend(v7, "variant");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
LABEL_10:

        goto LABEL_11;
      }
    }
    v10 = objc_alloc_init(MEMORY[0x1E0C97238]);
    v11 = (void *)MEMORY[0x1E0C97230];
    -[CNVisualIdentityPickerViewController visualIdentity](self, "visualIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "saveRequestToCreateImage:forContactIdentifier:", v7, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0;
    objc_msgSend(v10, "performSaveRequest:error:", v14, &v19);
    v15 = v19;
    if (v15)
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        -[CNVisualIdentityPickerViewController visualIdentity](self, "visualIdentity");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v21 = v18;
        _os_log_impl(&dword_18AC56000, v16, OS_LOG_TYPE_INFO, "Failed to save item to recent image store for contact identifier <%@>", buf, 0xCu);

      }
    }
    else
    {
      objc_msgSend(v7, "identifier");
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setRecentsIdentifier:", v16);
    }

    goto LABEL_10;
  }
LABEL_11:

}

- (void)scrollViewDidScroll:(id)a3
{
  id v3;

  -[CNVisualIdentityPickerViewController headerView](self, "headerView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

}

- (void)editableAvatarViewController:(id)a3 didUpdateWithProviderItem:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  BOOL v21;
  void *v22;
  id v23;
  CGRect v24;
  CGRect v25;

  v23 = a4;
  objc_msgSend(v23, "imageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v7)
  {
    objc_msgSend(v23, "cropRect");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cropRect");
    v25.origin.x = v17;
    v25.origin.y = v18;
    v25.size.width = v19;
    v25.size.height = v20;
    v24.origin.x = v9;
    v24.origin.y = v11;
    v24.size.width = v13;
    v24.size.height = v15;
    v21 = CGRectEqualToRect(v24, v25);

    if (v21)
      goto LABEL_8;
  }
  else
  {

  }
  -[CNVisualIdentityPickerViewController pendingVisualIdentity](self, "pendingVisualIdentity");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    objc_msgSend(v23, "updateVisualIdentity:", v22);
  else
    objc_msgSend(v22, "clearImage");

  -[CNVisualIdentityPickerViewController updateInjectedItemsSectionForProviderItem:](self, "updateInjectedItemsSectionForProviderItem:", v23);
  -[CNVisualIdentityPickerViewController updateDoneButtonEnabledStateForEditingProviderItem:](self, "updateDoneButtonEnabledStateForEditingProviderItem:", v23);
LABEL_8:

}

- (void)presentEditItemViewController:(id)a3 fromViewController:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v6 = a3;
  -[CNVisualIdentityPickerViewController photoPickerNavigationControllerForRootController:](self, "photoPickerNavigationControllerForRootController:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setModalPresentationStyle:", -2);
  -[CNVisualIdentityPickerViewController contactStyle](self, "contactStyle");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setModalTransitionStyle:", objc_msgSend((id)v8, "modalTransitionStyle"));

  -[CNVisualIdentityPickerViewController preferredContentSize](self, "preferredContentSize");
  objc_msgSend(v6, "setPreferredContentSize:");

  -[CNVisualIdentityPickerViewController presenterDelegate](self, "presenterDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CNVisualIdentityPickerViewController presenterDelegate](self, "presenterDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "visualIdentityPicker:presentViewController:", self, v7);

  }
  else
  {
    objc_msgSend(v11, "presentViewController:animated:completion:", v7, 1, 0);
  }

}

- (void)didCancelEditingProviderItemFromViewController:(id)a3
{
  -[CNVisualIdentityPickerViewController sender:dismissViewController:](self, "sender:dismissViewController:", 0, a3);
  -[CNVisualIdentityPickerViewController setEditingProviderItem:](self, "setEditingProviderItem:", 0);
}

- (void)updateForSelectedProviderItem:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v19 = a3;
  -[CNVisualIdentityPickerViewController visualIdentity](self, "visualIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "identityType");

  if (!v5)
  {
    objc_opt_class();
    v6 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    v9 = objc_msgSend(v8, "isGrayMonogramItem");
    objc_msgSend(v8, "monogramText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityPickerViewController visualIdentity](self, "visualIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "abbreviatedName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "isEqualToString:", v12);

    if (v9 && (v13 & 1) != 0)
    {
      -[CNVisualIdentityPickerViewController updateVisualIdentityWithProviderItem:](self, "updateVisualIdentityWithProviderItem:", 0);
      -[CNVisualIdentityPickerViewController updateActiveIndexPath:](self, "updateActiveIndexPath:", 0);
      goto LABEL_14;
    }

  }
  -[CNVisualIdentityPickerViewController updateVisualIdentityWithProviderItem:](self, "updateVisualIdentityWithProviderItem:", v19);
  if (-[CNVisualIdentityPickerViewController isEditingOrDuplicatingItem](self, "isEditingOrDuplicatingItem"))
  {
    -[CNVisualIdentityPickerViewController editingProviderItem](self, "editingProviderItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[CNVisualIdentityPickerViewController editingProviderItem](self, "editingProviderItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNVisualIdentityPickerViewController deleteExistingItem:](self, "deleteExistingItem:", v15);

      -[CNVisualIdentityPickerViewController editingProviderItem](self, "editingProviderItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNVisualIdentityPickerViewController deleteItemFromRecentsImageStore:](self, "deleteItemFromRecentsImageStore:", v16);

      -[CNVisualIdentityPickerViewController setEditingProviderItem:](self, "setEditingProviderItem:", 0);
    }
    else
    {
      -[CNVisualIdentityPickerViewController duplicatingProviderItem](self, "duplicatingProviderItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNVisualIdentityPickerViewController deleteExistingItem:](self, "deleteExistingItem:", v17);

      -[CNVisualIdentityPickerViewController setDuplicatingProviderItem:](self, "setDuplicatingProviderItem:", 0);
    }
  }
  v18 = -[CNVisualIdentityPickerViewController insertNewItem:toGroupType:updateActive:](self, "insertNewItem:toGroupType:updateActive:", v19, 1, 1);
  -[CNVisualIdentityPickerViewController saveItemToRecentsImageStore:](self, "saveItemToRecentsImageStore:", v19);
  -[CNVisualIdentityPickerViewController actionsViewController](self, "actionsViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateActionsModelWithProviderItem:", v19);
LABEL_14:

}

- (void)viewController:(id)a3 didSelectUpdatedProviderItem:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  CNVisualIdentityPickerViewController *v14;
  void *v15;
  void *v16;
  id v17;
  CNVisualIdentityPickerViewController *v18;

  v8 = a3;
  v9 = a5;
  -[CNVisualIdentityPickerViewController updateForSelectedProviderItem:](self, "updateForSelectedProviderItem:", a4);
  v18 = (CNVisualIdentityPickerViewController *)v8;
  -[CNVisualIdentityPickerViewController presentedViewController](self, "presentedViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }

  -[CNVisualIdentityPickerViewController presentedViewController](self, "presentedViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityPickerViewController presentingViewController](v18, "presentingViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 == v13 || (v14 = v18, (isKindOfClass & 1) != 0))
  {
    v14 = self;

    objc_opt_class();
    -[CNVisualIdentityPickerViewController presentedViewController](v14, "presentedViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    if (v17)
      objc_msgSend(v17, "endDisablingAutorotationIfNeeded");

  }
  -[CNVisualIdentityPickerViewController sender:dismissViewController:completionHandler:](self, "sender:dismissViewController:completionHandler:", 0, v14, v9);

}

- (void)viewController:(id)a3 didSelectUpdatedProviderItem:(id)a4
{
  -[CNVisualIdentityPickerViewController viewController:didSelectUpdatedProviderItem:completionHandler:](self, "viewController:didSelectUpdatedProviderItem:completionHandler:", a3, a4, 0);
}

- (CNVisualIdentityPickerViewControllerDelegate)delegate
{
  return (CNVisualIdentityPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNVisualIdentityPickerPresenterDelegate)presenterDelegate
{
  return (CNVisualIdentityPickerPresenterDelegate *)objc_loadWeakRetained((id *)&self->_presenterDelegate);
}

- (NSString)assignActionTitleOverride
{
  return self->_assignActionTitleOverride;
}

- (void)setAssignActionTitleOverride:(id)a3
{
  objc_storeStrong((id *)&self->_assignActionTitleOverride, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (CNPhotoPickerProviderItem)lastSelectedProviderItem
{
  return self->_lastSelectedProviderItem;
}

- (void)setLastSelectedProviderItem:(id)a3
{
  objc_storeStrong((id *)&self->_lastSelectedProviderItem, a3);
}

- (CNPhotoPickerProviderItem)editingProviderItem
{
  return self->_editingProviderItem;
}

- (void)setEditingProviderItem:(id)a3
{
  objc_storeStrong((id *)&self->_editingProviderItem, a3);
}

- (CNPhotoPickerProviderItem)duplicatingProviderItem
{
  return self->_duplicatingProviderItem;
}

- (void)setDuplicatingProviderItem:(id)a3
{
  objc_storeStrong((id *)&self->_duplicatingProviderItem, a3);
}

- (CNAvatarEditingManager)avatarEditingManager
{
  return self->_avatarEditingManager;
}

- (void)setAvatarEditingManager:(id)a3
{
  objc_storeStrong((id *)&self->_avatarEditingManager, a3);
}

- (CNPhotoPickerActionsViewController)actionsViewController
{
  return self->_actionsViewController;
}

- (void)setActionsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_actionsViewController, a3);
}

- (CNVisualIdentityEditablePrimaryAvatarViewController)editablePrimaryAvatarController
{
  return self->_editablePrimaryAvatarController;
}

- (void)setEditablePrimaryAvatarController:(id)a3
{
  objc_storeStrong((id *)&self->_editablePrimaryAvatarController, a3);
}

- (CNContactStyle)contactStyle
{
  return self->_contactStyle;
}

- (void)setContactStyle:(id)a3
{
  objc_storeStrong((id *)&self->_contactStyle, a3);
}

- (BOOL)allowRotation
{
  return self->_allowRotation;
}

- (void)setAllowRotation:(BOOL)a3
{
  self->_allowRotation = a3;
}

- (BOOL)shouldUpdateEmojiSuggestions
{
  return self->_shouldUpdateEmojiSuggestions;
}

- (void)setShouldUpdateEmojiSuggestions:(BOOL)a3
{
  self->_shouldUpdateEmojiSuggestions = a3;
}

- (NSArray)pendingInjectedSuggestionItems
{
  return self->_pendingInjectedSuggestionItems;
}

- (void)setPendingInjectedSuggestionItems:(id)a3
{
  objc_storeStrong((id *)&self->_pendingInjectedSuggestionItems, a3);
}

- (CNVisualIdentityImagePickerController)imagePickerController
{
  return self->_imagePickerController;
}

- (void)setImagePickerController:(id)a3
{
  objc_storeStrong((id *)&self->_imagePickerController, a3);
}

- (CNPhotoPickerHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (void)setPendingVisualIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_pendingVisualIdentity, a3);
}

- (CNPhotoPickerDataSource)dataSource
{
  return self->_dataSource;
}

- (NSData)proposedImageData
{
  return self->_proposedImageData;
}

- (void)setProposedImageData:(id)a3
{
  objc_storeStrong((id *)&self->_proposedImageData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proposedImageData, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_pendingVisualIdentity, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_imagePickerController, 0);
  objc_storeStrong((id *)&self->_pendingInjectedSuggestionItems, 0);
  objc_storeStrong((id *)&self->_contactStyle, 0);
  objc_storeStrong((id *)&self->_editablePrimaryAvatarController, 0);
  objc_storeStrong((id *)&self->_actionsViewController, 0);
  objc_storeStrong((id *)&self->_avatarEditingManager, 0);
  objc_storeStrong((id *)&self->_duplicatingProviderItem, 0);
  objc_storeStrong((id *)&self->_editingProviderItem, 0);
  objc_storeStrong((id *)&self->_lastSelectedProviderItem, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_assignActionTitleOverride, 0);
  objc_destroyWeak((id *)&self->_presenterDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __66__CNVisualIdentityPickerViewController_presentDismissConfirmation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel:", 0);
}

void __93__CNVisualIdentityPickerViewController_avatarEditorViewController_didFinishWithAvatarRecord___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "showAvatarPosePickerFromItem:atIndexPath:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __88__CNVisualIdentityPickerViewController_imagePickerController_didFinishWithProviderItem___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isEditingOrDuplicatingItem");
  v3 = objc_msgSend(*(id *)(a1 + 40), "allowsVariants");
  if (v2)
  {
    if (v3)
    {
      v5 = *(void **)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v5, "presentedViewController");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "presentVisualIdentityItemEditorForItem:fromViewController:", v4, v6);

    }
  }
  else if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentVisualIdentityItemEditorForItem:fromViewController:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  }
}

uint64_t __88__CNVisualIdentityPickerViewController_imagePickerController_didFinishWithProviderItem___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v2)
    return objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, v3);
  else
    return (*(uint64_t (**)(_QWORD))(v3 + 16))(*(_QWORD *)(a1 + 40));
}

uint64_t __88__CNVisualIdentityPickerViewController_imagePickerController_didFinishWithProviderItem___block_invoke_3(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return objc_msgSend(*(id *)(result + 40), "sender:dismissViewController:", 0);
  return result;
}

uint64_t __94__CNVisualIdentityPickerViewController_updateEmojiSuggestionsForUpdatedVisualIdentity_locale___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteExistingItem:", a2);
}

id __94__CNVisualIdentityPickerViewController_updateEmojiSuggestionsForUpdatedVisualIdentity_locale___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "insertNewItem:toGroupType:updateActive:scrollToItem:", a2, 1, 0, 0);
}

BOOL __93__CNVisualIdentityPickerViewController_reloadItemsForUpdatedSuggestionsGroup_atSectionIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL4 v6;
  _BOOL8 v7;

  v3 = a2;
  v4 = objc_msgSend(v3, "section");
  v5 = *(_QWORD *)(a1 + 40);
  if (objc_msgSend(*(id *)(a1 + 32), "allowAddItem"))
    v6 = objc_msgSend(v3, "row") != 0;
  else
    v6 = 1;
  v7 = v4 == v5 && v6;

  return v7;
}

void __93__CNVisualIdentityPickerViewController_reloadItemsForUpdatedSuggestionsGroup_atSectionIndex___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteItemsAtIndexPaths:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "insertItemsAtIndexPaths:", *(_QWORD *)(a1 + 48));

}

uint64_t __93__CNVisualIdentityPickerViewController_photoPickerProviderGroupDidUpdate_requiresFullReload___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __71__CNVisualIdentityPickerViewController_headerActionPressedAtIndexPath___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadSections:", *(_QWORD *)(a1 + 40));

}

void __101__CNVisualIdentityPickerViewController_collectionView_viewForSupplementaryElementOfKind_atIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "headerActionPressedAtIndexPath:", *(_QWORD *)(a1 + 32));

}

void __78__CNVisualIdentityPickerViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "displaySessionUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);

  if (v3 == v4)
    objc_msgSend(*(id *)(a1 + 32), "updateWithView:animation:", v5, *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 0);

}

void __59__CNVisualIdentityPickerViewController_deleteExistingItem___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadSections:", v2);

}

void __92__CNVisualIdentityPickerViewController_insertNewItem_toGroupType_updateActive_scrollToItem___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadSections:", v2);

}

id __69__CNVisualIdentityPickerViewController_insertNewItemIntoSuggestions___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "insertNewItem:toGroupType:updateActive:scrollToItem:", *(_QWORD *)(a1 + 40), 1, 1, 0);
}

void __82__CNVisualIdentityPickerViewController_updateInjectedItemsSectionForProviderItem___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadSections:", v2);

}

void __82__CNVisualIdentityPickerViewController_updateInjectedItemsSectionForProviderItem___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadSections:", v2);

}

+ (id)log
{
  if (log_cn_once_token_20 != -1)
    dispatch_once(&log_cn_once_token_20, &__block_literal_global_32084);
  return (id)log_cn_once_object_20;
}

+ (CGSize)defaultContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 624.0;
  v3 = 746.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)defaultItemSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 212.0;
  v3 = 212.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)navigationControllerForPicker:(id)a3
{
  id v3;
  CNPhotoPickerNavigationViewController *v4;
  uint64_t v5;

  v3 = a3;
  v4 = -[CNPhotoPickerNavigationViewController initWithRootViewController:]([CNPhotoPickerNavigationViewController alloc], "initWithRootViewController:", v3);
  v5 = objc_msgSend(v3, "allowRotation");

  -[CNPhotoPickerNavigationViewController setAllowRotation:](v4, "setAllowRotation:", v5);
  return v4;
}

+ (double)itemsPerRowForWidth:(double)a3
{
  BOOL v3;
  double result;

  v3 = a3 <= 460.0;
  result = 4.0;
  if (!v3)
    return 6.0;
  return result;
}

+ (BOOL)canShowAvatarEditor
{
  return +[CNPhotoPickerCapabilities allowsAvatarUI](CNPhotoPickerCapabilities, "allowsAvatarUI");
}

+ (id)imagePickerForContact:(id)a3
{
  id v4;
  CNVisualIdentity *v5;
  void *v6;

  v4 = a3;
  v5 = -[CNVisualIdentity initWithContact:]([CNVisualIdentity alloc], "initWithContact:", v4);

  objc_msgSend(a1, "imagePickerForVisualIdentity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)imagePickerForGroupIdentity:(id)a3
{
  id v4;
  CNVisualIdentity *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v4 = a3;
  v5 = -[CNVisualIdentity initWithGroupIdentity:]([CNVisualIdentity alloc], "initWithGroupIdentity:", v4);
  objc_msgSend(a1, "imagePickerForVisualIdentity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "numberOfContacts");

  CNContactsUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 >= 2)
    v10 = CFSTR("PHOTO_ACTION_SELECT_GROUP");
  else
    v10 = CFSTR("PHOTO_ACTION_SELECT_CONTACT");
  objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E20507A8, CFSTR("Localized"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAssignActionTitleOverride:", v11);

  return v6;
}

+ (id)imagePickerForVisualIdentity:(id)a3
{
  id v4;
  CNContactViewCache *v5;
  void *v6;
  CNPhotoPickerDataSource *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_alloc_init(CNContactViewCache);
  +[CNPhotoPickerConfiguration defaultConfiguration](CNPhotoPickerConfiguration, "defaultConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNPhotoPickerDataSource initWithVisualIdentity:contactViewCache:photoPickerConfiguration:]([CNPhotoPickerDataSource alloc], "initWithVisualIdentity:contactViewCache:photoPickerConfiguration:", v4, v5, v6);

  v8 = objc_alloc((Class)a1);
  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithPhotosDataSource:style:allowRotation:", v7, v9, objc_msgSend(v6, "allowRotation"));

  return v10;
}

void __43__CNVisualIdentityPickerViewController_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNVisualIdentityPicker");
  v1 = (void *)log_cn_once_object_20;
  log_cn_once_object_20 = (uint64_t)v0;

}

@end
