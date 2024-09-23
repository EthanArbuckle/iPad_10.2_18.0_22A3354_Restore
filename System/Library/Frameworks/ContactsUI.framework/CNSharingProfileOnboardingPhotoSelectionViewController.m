@implementation CNSharingProfileOnboardingPhotoSelectionViewController

- (CNSharingProfileOnboardingPhotoSelectionViewController)initWithContact:(id)a3 avatarRecord:(id)a4 avatarItemProviderConfiguration:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  CNSharingProfileOnboardingPhotoSelectionViewController *v14;
  uint64_t v15;
  CNMutableContact *photoProviderContact;
  CNSharingProfileLogger *v17;
  CNSharingProfileLogger *logger;
  CNSharingProfilePhotoPickerViewController *v19;
  CNSharingProfilePhotoPickerViewController *sharingPhotoPickerViewController;
  void *v21;
  CNSharingProfileOnboardingPhotoSelectionViewController *v22;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  CNContactsUIBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SHARING_CHOOSE_YOUR_PHOTO_TO_SHARE"), &stru_1E20507A8, CFSTR("Localized"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)CNSharingProfileOnboardingPhotoSelectionViewController;
  v14 = -[CNSharingProfileOnboardingPhotoSelectionViewController initWithTitle:detailText:icon:](&v24, sel_initWithTitle_detailText_icon_, v13, 0, 0);

  if (v14)
  {
    objc_storeStrong((id *)&v14->_contact, a3);
    v15 = objc_msgSend(v9, "mutableCopy");
    photoProviderContact = v14->_photoProviderContact;
    v14->_photoProviderContact = (CNMutableContact *)v15;

    objc_storeStrong((id *)&v14->_avatarRecord, a4);
    objc_storeStrong((id *)&v14->_avatarItemProviderConfiguration, a5);
    v17 = objc_alloc_init(CNSharingProfileLogger);
    logger = v14->_logger;
    v14->_logger = v17;

    v19 = -[CNSharingProfilePhotoPickerViewController initWithContact:avatarRecord:avatarItemProviderConfiguration:logger:]([CNSharingProfilePhotoPickerViewController alloc], "initWithContact:avatarRecord:avatarItemProviderConfiguration:logger:", v14->_photoProviderContact, v14->_avatarRecord, v14->_avatarItemProviderConfiguration, v14->_logger);
    sharingPhotoPickerViewController = v14->_sharingPhotoPickerViewController;
    v14->_sharingPhotoPickerViewController = v19;

    -[CNSharingProfilePhotoPickerViewController view](v14->_sharingPhotoPickerViewController, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CNSharingProfilePhotoPickerViewController setDelegate:](v14->_sharingPhotoPickerViewController, "setDelegate:", v14);
    -[CNSharingProfilePhotoPickerViewController willMoveToParentViewController:](v14->_sharingPhotoPickerViewController, "willMoveToParentViewController:", v14);
    -[CNSharingProfileOnboardingPhotoSelectionViewController addChildViewController:](v14, "addChildViewController:", v14->_sharingPhotoPickerViewController);
    v22 = v14;
  }

  return v14;
}

- (id)contentView
{
  return (id)-[CNSharingProfilePhotoPickerViewController view](self->_sharingPhotoPickerViewController, "view");
}

- (void)loadView
{
  CNOnboardingBoldButtonProvider *v3;
  OBBoldTrayButton *v4;
  OBBoldTrayButton *confirmButton;
  OBBoldTrayButton *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNSharingProfileOnboardingPhotoSelectionViewController;
  -[OBBaseWelcomeController loadView](&v10, sel_loadView);
  v3 = objc_alloc_init(CNOnboardingBoldButtonProvider);
  -[CNOnboardingBoldButtonProvider boldButton](v3, "boldButton");
  v4 = (OBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
  confirmButton = self->_confirmButton;
  self->_confirmButton = v4;

  v6 = self->_confirmButton;
  CNContactsUIBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SHARING_CONTINUE"), &stru_1E20507A8, CFSTR("Localized"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBoldTrayButton setTitle:forState:](v6, "setTitle:forState:", v8, 0);

  -[OBBoldTrayButton addTarget:action:forControlEvents:](self->_confirmButton, "addTarget:action:forControlEvents:", self, sel_didTapDoneButton_, 64);
  -[CNSharingProfileOnboardingPhotoSelectionViewController buttonTray](self, "buttonTray");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addButton:", self->_confirmButton);

}

- (void)updateForContentSizeCategoryChange
{
  id v2;

  -[CNSharingProfileOnboardingPhotoSelectionViewController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

}

- (void)didTapSetupLaterButton:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CNSharingProfileOnboardingPhotoSelectionViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNSharingProfileOnboardingPhotoSelectionViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "photoSelectionViewControllerDidTapSetupLater:", self);

  }
}

- (void)didTapBackButton:(id)a3
{
  id v3;

  -[CNSharingProfileOnboardingPhotoSelectionViewController delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoSelectionViewControllerDidFinishWithResult:", 0);

}

- (void)didTapDoneButton:(id)a3
{
  CNSharingProfileOnboardingPhotoSelectionResult *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[CNSharingProfilePhotoPickerViewController selectedItem](self->_sharingPhotoPickerViewController, "selectedItem", a3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(CNSharingProfileOnboardingPhotoSelectionResult);
  objc_msgSend(v14, "originalImageWithSize:", 500.0, 500.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfileOnboardingPhotoSelectionResult setOriginalImage:](v4, "setOriginalImage:", v5);

  objc_msgSend(v14, "compositeImageWithSize:", 500.0, 500.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfileOnboardingPhotoSelectionResult setCompositedImage:](v4, "setCompositedImage:", v6);

  objc_msgSend(v14, "avatarItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfileOnboardingPhotoSelectionResult setAvatarType:](v4, "setAvatarType:", objc_msgSend(v7, "type"));

  objc_msgSend(v14, "avatarItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "variantIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfileOnboardingPhotoSelectionResult setVariantName:](v4, "setVariantName:", v9);

  objc_msgSend(v14, "avatarItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfileOnboardingPhotoSelectionResult setWasSelectedInFullPhotoPicker:](v4, "setWasSelectedInFullPhotoPicker:", objc_msgSend(v10, "wasSetFromFullPhotoPicker"));

  objc_msgSend(v14, "avatarItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "memojiMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfileOnboardingPhotoSelectionResult setMemojiMetadata:](v4, "setMemojiMetadata:", v12);

  -[CNSharingProfileOnboardingPhotoSelectionViewController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "photoSelectionViewControllerDidFinishWithResult:", v4);

}

- (void)sharingPhotoPickerDidSelectAddItem:(id)a3
{
  CNPhotoPickerViewController *v4;
  CNMutableContact *photoProviderContact;
  void *v6;
  void *v7;
  CNPhotoPickerViewController *v8;
  void *v9;
  void *v10;
  CNPhotoPickerViewController *photoPickerViewController;
  CNPhotoPickerViewController *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  v4 = [CNPhotoPickerViewController alloc];
  photoProviderContact = self->_photoProviderContact;
  +[CNContactStyle defaultStyle](CNContactStyle, "defaultStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPhotoPickerConfiguration contactsConfiguration](CNPhotoPickerConfiguration, "contactsConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNPhotoPickerViewController initWithContact:style:configuration:](v4, "initWithContact:style:configuration:", photoProviderContact, v6, v7);

  -[CNPhotoPickerViewController setDelegate:](v8, "setDelegate:", self);
  CNContactsUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SHARING_PHOTOPICKER_ASSIGN_TITLE_OVERRIDE"), &stru_1E20507A8, CFSTR("Localized"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityPickerViewController setAssignActionTitleOverride:](v8, "setAssignActionTitleOverride:", v10);

  +[CNVisualIdentityPickerViewController defaultContentSize](CNPhotoPickerViewController, "defaultContentSize");
  -[CNPhotoPickerViewController setPreferredContentSize:](v8, "setPreferredContentSize:");
  photoPickerViewController = self->_photoPickerViewController;
  self->_photoPickerViewController = v8;
  v12 = v8;

  -[CNSharingProfileOnboardingPhotoSelectionViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "endEditing:", 1);

  +[CNPhotoPickerViewController navigationControllerForPicker:](CNPhotoPickerViewController, "navigationControllerForPicker:", v12);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setModalPresentationStyle:", 2);
  +[CNVisualIdentityPickerViewController defaultContentSize](CNPhotoPickerViewController, "defaultContentSize");
  v16 = v15;
  v18 = v17;

  objc_msgSend(v19, "setPreferredContentSize:", v16, v18);
  -[CNSharingProfileOnboardingPhotoSelectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v19, 1, 0);

}

- (void)photoPickerDidCancel:(id)a3
{
  id v3;

  -[CNSharingProfileOnboardingPhotoSelectionViewController presentedViewController](self, "presentedViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)photoPicker:(id)a3 didUpdatePhotoForContact:(id)a4 withContactImage:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v8 = a5;
  objc_storeStrong((id *)&self->_photoProviderContact, a4);
  if (objc_msgSend(v8, "source") == 1)
  {
    objc_msgSend(v8, "variant");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = objc_alloc(MEMORY[0x1E0D70A78]);
      objc_msgSend(v8, "variant");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithColorName:", v11);
      -[CNSharingProfilePhotoPickerViewController setMonogramColor:](self->_sharingPhotoPickerViewController, "setMonogramColor:", v12);

    }
  }
  objc_msgSend(v15, "memojiMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfilePhotoPickerViewController setMemojiMetadata:](self->_sharingPhotoPickerViewController, "setMemojiMetadata:", v13);

  -[CNSharingProfilePhotoPickerViewController updateWithContact:fromFullPhotoPicker:](self->_sharingPhotoPickerViewController, "updateWithContact:fromFullPhotoPicker:", self->_photoProviderContact, 1);
  -[CNSharingProfileOnboardingPhotoSelectionViewController presentedViewController](self, "presentedViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (CNSharingProfileOnboardingPhotoSelectionViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CNSharingProfileOnboardingPhotoSelectionViewControllerDelegate *)a3;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setAvatarRecord:(id)a3
{
  objc_storeStrong((id *)&self->_avatarRecord, a3);
}

- (CNSharingProfileAvatarItemProviderConfiguration)avatarItemProviderConfiguration
{
  return self->_avatarItemProviderConfiguration;
}

- (void)setAvatarItemProviderConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_avatarItemProviderConfiguration, a3);
}

- (CNSharingProfileLogger)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
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

- (OBBoldTrayButton)confirmButton
{
  return self->_confirmButton;
}

- (void)setConfirmButton:(id)a3
{
  objc_storeStrong((id *)&self->_confirmButton, a3);
}

- (CNSharingProfilePhotoPickerViewController)sharingPhotoPickerViewController
{
  return self->_sharingPhotoPickerViewController;
}

- (void)setSharingPhotoPickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_sharingPhotoPickerViewController, a3);
}

- (CNPhotoPickerViewController)photoPickerViewController
{
  return self->_photoPickerViewController;
}

- (void)setPhotoPickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_photoPickerViewController, a3);
}

- (CNMutableContact)photoProviderContact
{
  return self->_photoProviderContact;
}

- (void)setPhotoProviderContact:(id)a3
{
  objc_storeStrong((id *)&self->_photoProviderContact, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoProviderContact, 0);
  objc_storeStrong((id *)&self->_photoPickerViewController, 0);
  objc_storeStrong((id *)&self->_sharingPhotoPickerViewController, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_setupLaterButton, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_avatarItemProviderConfiguration, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_1_44121 != -1)
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_1_44121, &__block_literal_global_44122);
  return (id)descriptorForRequiredKeys_cn_once_object_1_44123;
}

void __83__CNSharingProfileOnboardingPhotoSelectionViewController_descriptorForRequiredKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  +[CNVisualIdentityPickerViewController descriptorForRequiredKeys](CNPhotoPickerViewController, "descriptorForRequiredKeys");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x1E0C96708];
  v8[0] = v0;
  v8[1] = v1;
  v2 = *MEMORY[0x1E0C966C8];
  v8[2] = *MEMORY[0x1E0C96890];
  v8[3] = v2;
  v8[4] = *MEMORY[0x1E0C96700];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNSharingProfileOnboardingPhotoSelectionViewController descriptorForRequiredKeys]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptorWithKeyDescriptors:description:", v3, v5);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)descriptorForRequiredKeys_cn_once_object_1_44123;
  descriptorForRequiredKeys_cn_once_object_1_44123 = v6;

}

@end
