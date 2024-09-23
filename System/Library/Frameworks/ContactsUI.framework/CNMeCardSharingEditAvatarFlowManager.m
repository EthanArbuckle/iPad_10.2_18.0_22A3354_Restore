@implementation CNMeCardSharingEditAvatarFlowManager

- (CNMeCardSharingEditAvatarFlowManager)init
{
  CNMeCardSharingEditAvatarFlowManager *v2;
  CNVisualIdentityImagePickerController *v3;
  void *v4;
  uint64_t v5;
  CNVisualIdentityImagePickerController *imagePickerController;
  CNPhotoPickerVariantsManager *v7;
  CNPhotoPickerVariantsManager *variantsManager;
  CNMeCardSharingEditAvatarFlowManager *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CNMeCardSharingEditAvatarFlowManager;
  v2 = -[CNMeCardSharingEditAvatarFlowManager init](&v11, sel_init);
  if (v2)
  {
    v3 = [CNVisualIdentityImagePickerController alloc];
    +[CNContactStyle defaultStyle](CNContactStyle, "defaultStyle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CNVisualIdentityImagePickerController initWithContactStyle:](v3, "initWithContactStyle:", v4);
    imagePickerController = v2->_imagePickerController;
    v2->_imagePickerController = (CNVisualIdentityImagePickerController *)v5;

    -[CNVisualIdentityImagePickerController setDelegate:](v2->_imagePickerController, "setDelegate:", v2);
    v7 = objc_alloc_init(CNPhotoPickerVariantsManager);
    variantsManager = v2->_variantsManager;
    v2->_variantsManager = v7;

    v9 = v2;
  }

  return v2;
}

- (void)presentEditorForAvatarSourceType:(int64_t)a3 visualIdentity:(id)a4 fromGalleryViewController:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  CNPhotoPickerEmojiProviderItem *v15;
  CNPhotoPickerEmojiProviderItem *v16;
  id v17;

  v17 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0D13D40], "unifiedMeContactMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contacts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isMeContact:", v11);
  -[CNMeCardSharingEditAvatarFlowManager imagePickerController](self, "imagePickerController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIsMeContact:", v12);

  switch(a3)
  {
    case 0:
      -[CNMeCardSharingEditAvatarFlowManager imagePickerController](self, "imagePickerController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "presentCameraImagePickerFromViewController:", v8);
      goto LABEL_4;
    case 1:
      -[CNMeCardSharingEditAvatarFlowManager imagePickerController](self, "imagePickerController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "presentPhotoLibraryPickerFromViewController:sourceView:", v8, 0);
LABEL_4:

      break;
    case 2:
      -[CNMeCardSharingEditAvatarFlowManager presentMemojiPicker](self, "presentMemojiPicker");
      break;
    case 3:
      +[CNPhotoPickerMonogramProvider providerItemForVisualIdentity:size:RTL:](CNPhotoPickerMonogramProvider, "providerItemForVisualIdentity:size:RTL:", v17, 0, 212.0, 212.0);
      v15 = (CNPhotoPickerEmojiProviderItem *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4:
      v15 = -[CNPhotoPickerEmojiProviderItem initWithStringRepresentation:backgroundColorVariant:size:]([CNPhotoPickerEmojiProviderItem alloc], "initWithStringRepresentation:backgroundColorVariant:size:", &stru_1E20507A8, 0, 212.0, 212.0);
LABEL_8:
      v16 = v15;
      -[CNMeCardSharingEditAvatarFlowManager presentAvatarEditorViewControllerForProviderItem:](self, "presentAvatarEditorViewControllerForProviderItem:", v15);

      break;
    default:
      break;
  }

}

- (id)editorViewControllerForProviderItem:(id)a3
{
  id v4;
  CNVisualIdentityItemEditorViewController *v5;
  void *v6;
  CNVisualIdentityItemEditorViewController *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = [CNVisualIdentityItemEditorViewController alloc];
  -[CNMeCardSharingEditAvatarFlowManager variantsManager](self, "variantsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNVisualIdentityItemEditorViewController initWithProviderItem:variantsManager:](v5, "initWithProviderItem:variantsManager:", v4, v6);

  CNContactsUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("NEXT"), &stru_1E20507A8, CFSTR("Localized"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityItemEditorViewController setDoneButtonTitle:](v7, "setDoneButtonTitle:", v9);

  -[CNVisualIdentityItemEditorViewController setDelegate:](v7, "setDelegate:", self);
  return v7;
}

- (void)presentAvatarEditorViewControllerForProviderItem:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[CNMeCardSharingEditAvatarFlowManager editorViewControllerForProviderItem:](self, "editorViewControllerForProviderItem:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v6);
  objc_msgSend(v4, "setModalPresentationStyle:", -[CNMeCardSharingEditAvatarFlowManager defaultModalPresentationStyle](self, "defaultModalPresentationStyle"));
  -[CNMeCardSharingEditAvatarFlowManager baseNavigationController](self, "baseNavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)pushAvatarEditorViewControllerForProviderItem:(id)a3 fromViewController:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[CNMeCardSharingEditAvatarFlowManager editorViewControllerForProviderItem:](self, "editorViewControllerForProviderItem:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCanCancel:", 0);
  objc_msgSend(v6, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "pushViewController:animated:", v8, 1);
}

- (int64_t)defaultModalPresentationStyle
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return 6;
  else
    return 0;
}

- (void)presentMemojiPicker
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  CNAvatarEditingManager *v14;
  void *v15;
  void *v16;
  CNAvatarEditingManager *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 buf;
  void (*v30)(uint64_t);
  void *v31;
  uint64_t *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  v26 = &v25;
  v27 = 0x2050000000;
  v3 = (void *)getAVTAvatarStoreClass_softClass_35919;
  v28 = getAVTAvatarStoreClass_softClass_35919;
  if (!getAVTAvatarStoreClass_softClass_35919)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v30 = __getAVTAvatarStoreClass_block_invoke_35920;
    v31 = &unk_1E204EBC0;
    v32 = &v25;
    __getAVTAvatarStoreClass_block_invoke_35920((uint64_t)&buf);
    v3 = (void *)v26[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v25, 8);
  v5 = objc_alloc_init(v4);
  objc_msgSend(getAVTAvatarFetchRequestClass_35921(), "requestForStorePrimaryAvatar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v5, "avatarsForFetchRequest:error:", v6, &v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v24;
  objc_msgSend(v7, "firstObject");
  v9 = objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v8;
    v11 = v6;
LABEL_6:
    +[CNPhotoPickerAnimojiProvider providerItemForAvatarRecord:](CNPhotoPickerAnimojiProvider, "providerItemForAvatarRecord:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = [CNAvatarEditingManager alloc];
    objc_msgSend(v13, "avatarRecord");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMeCardSharingEditAvatarFlowManager variantsManager](self, "variantsManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[CNAvatarEditingManager initWithAvatarRecord:variantsManager:](v14, "initWithAvatarRecord:variantsManager:", v15, v16);

    -[CNAvatarEditingManager setDelegate:](v17, "setDelegate:", self);
    -[CNAvatarEditingManager setOriginalItem:](v17, "setOriginalItem:", v13);
    -[CNMeCardSharingEditAvatarFlowManager setAvatarEditingManager:](self, "setAvatarEditingManager:", v17);
    v18 = objc_alloc(MEMORY[0x1E0DC3A40]);
    -[CNAvatarEditingManager viewController](v17, "viewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithRootViewController:", v19);

    objc_msgSend(v20, "setModalPresentationStyle:", -[CNMeCardSharingEditAvatarFlowManager defaultModalPresentationStyle](self, "defaultModalPresentationStyle"));
    -[CNMeCardSharingEditAvatarFlowManager baseNavigationController](self, "baseNavigationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "presentViewController:animated:completion:", v20, 1, 0);

    goto LABEL_7;
  }
  objc_msgSend(getAVTAvatarFetchRequestClass_35921(), "requestForAllAvatars");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v8;
  objc_msgSend(v5, "avatarsForFetchRequest:error:", v11, &v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v23;

  objc_msgSend(v12, "firstObject");
  v9 = objc_claimAutoreleasedReturnValue();

  if (v9)
    goto LABEL_6;
  objc_msgSend((id)objc_opt_class(), "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v10, "debugDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v22;
    _os_log_error_impl(&dword_18AC56000, v9, OS_LOG_TYPE_ERROR, "Could not load avatar; %{public}@",
      (uint8_t *)&buf,
      0xCu);

  }
LABEL_7:

}

- (void)imagePickerController:(id)a3 didFinishWithProviderItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "presentingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMeCardSharingEditAvatarFlowManager baseNavigationController](self, "baseNavigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __88__CNMeCardSharingEditAvatarFlowManager_imagePickerController_didFinishWithProviderItem___block_invoke_2;
    v14[3] = &unk_1E2050400;
    v11 = &v15;
    v14[4] = self;
    v15 = v7;
    v13 = v7;
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v14);
  }
  else
  {
    -[CNMeCardSharingEditAvatarFlowManager baseNavigationController](self, "baseNavigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __88__CNMeCardSharingEditAvatarFlowManager_imagePickerController_didFinishWithProviderItem___block_invoke;
    v16[3] = &unk_1E2050400;
    v11 = &v17;
    v16[4] = self;
    v17 = v7;
    v12 = v7;
    objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, v16);

  }
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)visualIdentityEditorControllerDidCancel:(id)a3
{
  void *v5;
  id v6;

  -[CNMeCardSharingEditAvatarFlowManager baseNavigationController](self, "baseNavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", a3 != 0, 0);

  -[CNMeCardSharingEditAvatarFlowManager delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sharingEditAvatarFlowManagerDidCancel:", self);

}

- (void)visualIdentityEditorController:(id)a3 didFinishWithProviderItem:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CNMeCardSharingEditAvatarFlowManager delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sharingEditAvatarFlowManager:didFinishWithProviderItem:fromViewController:", self, v6, v7);

}

- (void)avatarEditingManager:(id)a3 didFinishWithProviderItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  _QWORD v17[2];
  _QWORD v18[4];
  _QWORD v19[2];
  id v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentedViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "viewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v10, "presentedViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __87__CNMeCardSharingEditAvatarFlowManager_avatarEditingManager_didFinishWithProviderItem___block_invoke;
    v18[3] = &unk_1E204FAA0;
    v13 = (id *)v19;
    v19[0] = v7;
    v19[1] = self;
    v20 = v6;
    v14 = v7;
    objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, v18);

    v11 = v20;
  }
  else
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __87__CNMeCardSharingEditAvatarFlowManager_avatarEditingManager_didFinishWithProviderItem___block_invoke_2;
    v16[3] = &unk_1E2050400;
    v13 = (id *)v17;
    v17[0] = v7;
    v17[1] = self;
    v15 = v7;
    objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 1, v16);
  }

}

- (UINavigationController)baseNavigationController
{
  return self->_baseNavigationController;
}

- (void)setBaseNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_baseNavigationController, a3);
}

- (CNMeCardSharingEditAvatarFlowManagerDelegate)delegate
{
  return (CNMeCardSharingEditAvatarFlowManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNVisualIdentityImagePickerController)imagePickerController
{
  return self->_imagePickerController;
}

- (void)setImagePickerController:(id)a3
{
  objc_storeStrong((id *)&self->_imagePickerController, a3);
}

- (CNPhotoPickerVariantsManager)variantsManager
{
  return self->_variantsManager;
}

- (void)setVariantsManager:(id)a3
{
  objc_storeStrong((id *)&self->_variantsManager, a3);
}

- (CNAvatarEditingManager)avatarEditingManager
{
  return self->_avatarEditingManager;
}

- (void)setAvatarEditingManager:(id)a3
{
  objc_storeStrong((id *)&self->_avatarEditingManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarEditingManager, 0);
  objc_storeStrong((id *)&self->_variantsManager, 0);
  objc_storeStrong((id *)&self->_imagePickerController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_baseNavigationController, 0);
}

void __87__CNMeCardSharingEditAvatarFlowManager_avatarEditingManager_didFinishWithProviderItem___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "viewController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "pushAvatarEditorViewControllerForProviderItem:fromViewController:", v1, v3);

  }
}

uint64_t __87__CNMeCardSharingEditAvatarFlowManager_avatarEditingManager_didFinishWithProviderItem___block_invoke_2(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return objc_msgSend(*(id *)(result + 40), "presentAvatarEditorViewControllerForProviderItem:");
  return result;
}

uint64_t __88__CNMeCardSharingEditAvatarFlowManager_imagePickerController_didFinishWithProviderItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentAvatarEditorViewControllerForProviderItem:", *(_QWORD *)(a1 + 40));
}

uint64_t __88__CNMeCardSharingEditAvatarFlowManager_imagePickerController_didFinishWithProviderItem___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentAvatarEditorViewControllerForProviderItem:", *(_QWORD *)(a1 + 40));
}

+ (id)log
{
  if (log_cn_once_token_1_35959 != -1)
    dispatch_once(&log_cn_once_token_1_35959, &__block_literal_global_35960);
  return (id)log_cn_once_object_1_35961;
}

void __43__CNMeCardSharingEditAvatarFlowManager_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "MeCardSharingEditAvatarFlowManager");
  v1 = (void *)log_cn_once_object_1_35961;
  log_cn_once_object_1_35961 = (uint64_t)v0;

}

@end
