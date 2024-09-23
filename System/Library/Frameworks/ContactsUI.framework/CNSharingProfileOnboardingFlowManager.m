@implementation CNSharingProfileOnboardingFlowManager

- (CNSharingProfileOnboardingFlowManager)initWithNavigationController:(id)a3 contact:(id)a4 avatarRecord:(id)a5 avatarItemProviderConfiguration:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CNSharingProfileLogger *v14;
  CNSharingProfileOnboardingFlowManager *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(CNSharingProfileLogger);
  v15 = -[CNSharingProfileOnboardingFlowManager initWithNavigationController:contact:avatarRecord:avatarItemProviderConfiguration:logger:](self, "initWithNavigationController:contact:avatarRecord:avatarItemProviderConfiguration:logger:", v13, v12, v11, v10, v14);

  return v15;
}

- (CNSharingProfileOnboardingFlowManager)initWithNavigationController:(id)a3 contact:(id)a4 avatarRecord:(id)a5 avatarItemProviderConfiguration:(id)a6 logger:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  CNSharingProfileOnboardingFlowManager *v16;
  CNSharingProfileOnboardingFlowManager *v17;
  CNSharingProfileLogger *v18;
  CNSharingProfileLogger *logger;
  CNSharingProfileOnboardingFlowManager *v20;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CNSharingProfileOnboardingFlowManager;
  v16 = -[CNSharingProfileOnboardingFlowManager init](&v22, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_navigationController, a3);
    objc_storeStrong((id *)&v17->_contact, a4);
    objc_storeStrong((id *)&v17->_avatarRecord, a5);
    objc_storeStrong((id *)&v17->_avatarItemProviderConfiguration, a6);
    v18 = objc_alloc_init(CNSharingProfileLogger);
    logger = v17->_logger;
    v17->_logger = v18;

    v17->_shouldAnimateNavTransitions = 1;
    v20 = v17;
  }

  return v17;
}

- (void)startFlow
{
  CNSharingProfileOnboardingPhotoSelectionViewController *v3;
  CNSharingProfileOnboardingPhotoSelectionViewController *photoSelectionController;

  if (!-[CNSharingProfileOnboardingFlowManager isRunning](self, "isRunning"))
  {
    -[CNSharingProfileOnboardingFlowManager setIsRunning:](self, "setIsRunning:", 1);
    v3 = -[CNSharingProfileOnboardingPhotoSelectionViewController initWithContact:avatarRecord:avatarItemProviderConfiguration:]([CNSharingProfileOnboardingPhotoSelectionViewController alloc], "initWithContact:avatarRecord:avatarItemProviderConfiguration:", self->_contact, self->_avatarRecord, self->_avatarItemProviderConfiguration);
    photoSelectionController = self->_photoSelectionController;
    self->_photoSelectionController = v3;

    -[CNSharingProfileOnboardingPhotoSelectionViewController setDelegate:](self->_photoSelectionController, "setDelegate:", self);
    -[UINavigationController pushViewController:animated:](self->_navigationController, "pushViewController:animated:", self->_photoSelectionController, self->_shouldAnimateNavTransitions);
  }
}

- (id)prepareVariantsControllerForResult:(id)a3
{
  id v4;
  CNPhotoPickerVariantsManager *v5;
  CNPhotoPickerVariantsManager *variantsManager;
  void *v7;
  CNSharingProfileOnboardingVariantViewController *v8;
  CNPhotoPickerVariantsManager *v9;
  void *v10;
  CNSharingProfileOnboardingVariantViewController *v11;

  v4 = a3;
  if (!self->_variantsManager)
  {
    v5 = objc_alloc_init(CNPhotoPickerVariantsManager);
    variantsManager = self->_variantsManager;
    self->_variantsManager = v5;

  }
  -[CNSharingProfileOnboardingFlowManager providerItemForPhotoResult:](self, "providerItemForPhotoResult:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = [CNSharingProfileOnboardingVariantViewController alloc];
    v9 = self->_variantsManager;
    objc_msgSend(v4, "variantName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CNSharingProfileOnboardingVariantViewController initWithVariantsManager:originalItem:selectedVariantIdentifier:](v8, "initWithVariantsManager:originalItem:selectedVariantIdentifier:", v9, v7, v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)providerItemForPhotoResult:(id)a3
{
  id v4;
  uint64_t v5;
  CNPhotoPickerAnimojiProviderItem *v6;
  UIImage *v7;
  void *v8;
  CNPhotoPickerAnimojiProviderItem *v9;
  CNVisualIdentity *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CNPhotoPickerProviderItem *v18;

  v4 = a3;
  v5 = objc_msgSend(v4, "avatarType");
  switch(v5)
  {
    case 1:
      v10 = -[CNVisualIdentity initWithContact:]([CNVisualIdentity alloc], "initWithContact:", self->_contact);
      +[CNPhotoPickerMonogramProvider providerItemForVisualIdentity:size:RTL:](CNPhotoPickerMonogramProvider, "providerItemForVisualIdentity:size:RTL:", v10, objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1, 500.0, 500.0);
      v9 = (CNPhotoPickerAnimojiProviderItem *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      v18 = [CNPhotoPickerProviderItem alloc];
      objc_msgSend(v4, "originalImage");
      v10 = (CNVisualIdentity *)objc_claimAutoreleasedReturnValue();
      UIImageJPEGRepresentation((UIImage *)v10, 0.8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:](v18, "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:", v16, 0, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
LABEL_9:

      break;
    case 2:
      v6 = [CNPhotoPickerAnimojiProviderItem alloc];
      objc_msgSend(v4, "originalImage");
      v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
      UIImagePNGRepresentation(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[CNPhotoPickerAnimojiProviderItem initWithOriginalImageData:cropRect:](v6, "initWithOriginalImageData:cropRect:", v8, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

      +[CNPhotoPickerVariantsManager sharingProfileAvatarPoseConfigurationForAvatarRecord:](CNPhotoPickerVariantsManager, "sharingProfileAvatarPoseConfigurationForAvatarRecord:", self->_avatarRecord);
      v10 = (CNVisualIdentity *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "originalImage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNAvatarImageUtilities transparencyInsetsForImage:requiringFullOpacity:](CNAvatarImageUtilities, "transparencyInsetsForImage:requiringFullOpacity:", v11, 0);
      -[CNPhotoPickerAnimojiProviderItem setEdgeInsets:](v9, "setEdgeInsets:");

      objc_msgSend(v4, "originalImage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "size");
      -[CNPhotoPickerAnimojiProviderItem setOriginalImageSize:](v9, "setOriginalImageSize:");

      -[CNPhotoPickerAnimojiProviderItem setPoseConfiguration:](v9, "setPoseConfiguration:", v10);
      objc_msgSend(v4, "memojiMetadata");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = (void *)MEMORY[0x1E0C97350];
        objc_msgSend(v4, "memojiMetadata");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "memojiMetadataFromData:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v16, "avatarRecord");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNPhotoPickerAnimojiProviderItem setAvatarRecord:](v9, "setAvatarRecord:", v17);

        }
        goto LABEL_9;
      }
      break;
    default:
      v9 = 0;
      goto LABEL_12;
  }

LABEL_12:
  return v9;
}

- (void)presentMeCardPersistanceAlertIfNeededWithCompletionBlock:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void (**v18)(_QWORD);
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  CNSharingProfileOnboardingFlowManager *v29;
  void (**v30)(_QWORD);
  _QWORD v31[5];
  id v32;

  v4 = (void (**)(_QWORD))a3;
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "featureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isFeatureEnabled:", 15);

  if (v7)
  {
    -[CNSharingProfileOnboardingFlowManager performSaveToMeCardAction](self, "performSaveToMeCardAction");
    v4[2](v4);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0DC3450];
    CNContactsUIBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SHARING_UPDATE_ME_CARD_PROMPT_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CNContactsUIBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SHARING_UPDATE_ME_CARD_PROMPT_MESSAGE"), &stru_1E20507A8, CFSTR("Localized"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", v10, v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0DC3448];
    CNContactsUIBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("SHARING_UPDATE_ME_CARD_PROMPT_CONFIRM"), &stru_1E20507A8, CFSTR("Localized"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __98__CNSharingProfileOnboardingFlowManager_presentMeCardPersistanceAlertIfNeededWithCompletionBlock___block_invoke;
    v31[3] = &unk_1E204D898;
    v31[4] = self;
    v18 = v4;
    v32 = v18;
    objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, v31);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAction:", v19);

    v20 = (void *)MEMORY[0x1E0DC3448];
    CNContactsUIBundle();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("SHARING_UPDATE_ME_CARD_PROMPT_CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v17;
    v26 = 3221225472;
    v27 = __98__CNSharingProfileOnboardingFlowManager_presentMeCardPersistanceAlertIfNeededWithCompletionBlock___block_invoke_2;
    v28 = &unk_1E204D898;
    v29 = self;
    v30 = v18;
    objc_msgSend(v20, "actionWithTitle:style:handler:", v22, 1, &v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAction:", v23, v25, v26, v27, v28, v29);

    -[CNSharingProfileOnboardingFlowManager navigationController](self, "navigationController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "presentViewController:animated:completion:", v13, 1, 0);

  }
}

- (void)performSaveToMeCardAction
{
  -[CNSharingProfileOnboardingFlowManager saveCurrentInfoToMeCard](self, "saveCurrentInfoToMeCard");
  -[CNSharingProfileOnboardingFlowManager setDidPersistToMeCard:](self, "setDidPersistToMeCard:", 1);
}

- (unint64_t)imageTypeForAvatarType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return 0;
  else
    return qword_18AF8BA68[a3 - 1];
}

- (void)saveCurrentInfoToMeCard
{
  id v3;
  id v4;
  void *v5;
  CNPhotoPickerProviderItem *selectedVariantItem;
  UIImage *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  char v12;
  id v13;
  void *v14;
  CNSharingProfileLogger *v15;
  BOOL v16;
  _BOOL4 v17;
  uint64_t v18;
  _QWORD *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  CNSharingProfileLogger *logger;
  void *v27;
  id v28;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  CNSharingProfileLogger *v45;
  void *v46;
  char v47;
  id v48;
  void *v49;
  CNSharingProfileLogger *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  CNSharingProfileLogger *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  id v76;
  void *v77;
  CNSharingProfileLogger *v78;
  void *v79;
  CNSharingProfileLogger *v80;
  void *v81;
  char v82;
  id v83;
  CNSharingProfileLogger *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  _QWORD v97[5];
  id v98;
  id v99;
  _QWORD v100[5];
  id v101;
  void *v102;
  _QWORD v103[3];

  v103[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v4 = objc_alloc_init(MEMORY[0x1E0C973D0]);
  v5 = (void *)-[CNContact mutableCopy](self->_contact, "mutableCopy");
  selectedVariantItem = self->_selectedVariantItem;
  if (selectedVariantItem)
  {
    -[CNPhotoPickerProviderItem updateContact:](selectedVariantItem, "updateContact:", v5);
  }
  else
  {
    -[CNSharingProfileOnboardingPhotoSelectionResult compositedImage](self->_photoSelectionResult, "compositedImage");
    v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIImagePNGRepresentation(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setImageData:", v8);
    objc_msgSend(v5, "setThumbnailImageData:", v8);
    objc_msgSend(v8, "_cn_md5Hash");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImageHash:", v9);

    objc_msgSend(v5, "setCropRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v5, "updateImageInfoWithType:", -[CNSharingProfileOnboardingFlowManager imageTypeForAvatarType:](self, "imageTypeForAvatarType:", -[CNSharingProfileOnboardingPhotoSelectionResult avatarType](self->_photoSelectionResult, "avatarType")));
    -[CNSharingProfileOnboardingPhotoSelectionResult memojiMetadata](self->_photoSelectionResult, "memojiMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMemojiMetadata:", v10);

  }
  if (objc_msgSend(v5, "hasBeenPersisted"))
  {
    v11 = -[CNContact rawImageType](self->_contact, "rawImageType") != 1
       && -[CNContact rawImageType](self->_contact, "rawImageType") != 0;
    v16 = -[CNSharingProfileOnboardingPhotoSelectionResult wasSelectedInFullPhotoPicker](self->_photoSelectionResult, "wasSelectedInFullPhotoPicker");
    v17 = -[CNContact imageDataAvailable](self->_contact, "imageDataAvailable");
    v18 = MEMORY[0x1E0C809B0];
    v19 = (_QWORD *)&unk_18AF8B000;
    if (v17 && !v11 && !v16)
    {
      v20 = objc_alloc_init(MEMORY[0x1E0C97238]);
      v21 = (void *)MEMORY[0x1E0C97228];
      -[CNContact identifier](self->_contact, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v103[0] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "recentImagesRequestForContactIdenfitiers:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = &unk_18AF8B000;
      v101 = 0;
      objc_msgSend(v20, "performFetchRequest:error:", v24, &v101);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = v101;
      v100[0] = v18;
      v100[1] = 3221225472;
      v100[2] = __64__CNSharingProfileOnboardingFlowManager_saveCurrentInfoToMeCard__block_invoke;
      v100[3] = &unk_1E204D8C0;
      v100[4] = self;
      if ((objc_msgSend(v25, "_cn_any:", v100) & 1) == 0)
      {
        v87 = v24;
        v91 = v3;
        logger = self->_logger;
        -[CNContact identifier](self->_contact, "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNSharingProfileLogger logOnboardingSavingMeCardImageToRecentsForIdentifier:](logger, "logOnboardingSavingMeCardImageToRecentsForIdentifier:", v27);

        v28 = objc_alloc(MEMORY[0x1E0C97220]);
        -[CNContact imageData](self->_contact, "imageData");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContact cropRect](self->_contact, "cropRect");
        v31 = v30;
        v33 = v32;
        v35 = v34;
        v37 = v36;
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (void *)objc_msgSend(v28, "initWithImageData:cropRect:lastUsedDate:", v29, v38, v31, v33, v35, v37);

        v40 = (void *)MEMORY[0x1E0C97230];
        -[CNContact identifier](self->_contact, "identifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "saveRequestToCreateImage:forContactIdentifier:", v39, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        v99 = 0;
        LOBYTE(v40) = objc_msgSend(v20, "performSaveRequest:error:", v42, &v99);
        v43 = v99;
        v44 = v43;
        v45 = self->_logger;
        if ((v40 & 1) != 0)
        {
          -[CNSharingProfileLogger logOnboardingSuccessSavingMeCardImageToRecents](self->_logger, "logOnboardingSuccessSavingMeCardImageToRecents");
        }
        else
        {
          objc_msgSend(v43, "localizedDescription");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNSharingProfileLogger logOnboardingErrorSavingMeCardImageToRecentsWithDescription:](v45, "logOnboardingErrorSavingMeCardImageToRecentsWithDescription:", v52);

        }
        v3 = v91;
        v18 = MEMORY[0x1E0C809B0];
        v19 = &unk_18AF8B000;
        v24 = v87;
      }

    }
    -[CNContact wallpaper](self->_contact, "wallpaper");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "posterArchiveData");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      v55 = objc_alloc_init(MEMORY[0x1E0C97278]);
      v56 = (void *)MEMORY[0x1E0C97268];
      -[CNContact identifier](self->_contact, "identifier");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = v57;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "recentPostersRequestForContactIdenfitiers:", v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      v98 = 0;
      objc_msgSend(v55, "performFetchRequest:error:", v59, &v98);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v98;
      v97[0] = v18;
      v97[1] = v19[120];
      v97[2] = __64__CNSharingProfileOnboardingFlowManager_saveCurrentInfoToMeCard__block_invoke_2;
      v97[3] = &unk_1E204D8E8;
      v97[4] = self;
      if ((objc_msgSend(v60, "_cn_any:", v97) & 1) == 0)
      {
        v86 = v61;
        v88 = v60;
        v90 = v59;
        v92 = v3;
        v62 = self->_logger;
        -[CNContact identifier](self->_contact, "identifier");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNSharingProfileLogger logOnboardingSavingMeCardPosterToRecentsForIdentifier:](v62, "logOnboardingSavingMeCardPosterToRecentsForIdentifier:", v63);

        v64 = objc_alloc(MEMORY[0x1E0C97260]);
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "UUIDString");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContact wallpaper](self->_contact, "wallpaper");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "posterArchiveData");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v69 = v55;
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend(v64, "initWithIdentifier:posterData:lastUsedDate:", v66, v68, v70);

        v72 = (void *)v71;
        v73 = (void *)MEMORY[0x1E0C97270];
        -[CNContact identifier](self->_contact, "identifier");
        v74 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "saveRequestToCreatePoster:forContactIdentifier:", v72, v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        v96 = 0;
        LOBYTE(v74) = objc_msgSend(v69, "performSaveRequest:error:", v75, &v96);
        v76 = v96;
        v77 = v76;
        v78 = self->_logger;
        if ((v74 & 1) != 0)
        {
          -[CNSharingProfileLogger logOnboardingSuccessSavingMeCardPosterToRecents](self->_logger, "logOnboardingSuccessSavingMeCardPosterToRecents");
        }
        else
        {
          objc_msgSend(v76, "localizedDescription");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNSharingProfileLogger logOnboardingErrorSavingMeCardPosterToRecentsWithDescription:](v78, "logOnboardingErrorSavingMeCardPosterToRecentsWithDescription:", v79);

        }
        v59 = v90;
        v3 = v92;
        v55 = v69;
        v61 = v86;
        v60 = v88;
      }

    }
    v80 = self->_logger;
    objc_msgSend(v5, "identifier");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSharingProfileLogger logOnboardingUpdatingContactWithIdentifier:](v80, "logOnboardingUpdatingContactWithIdentifier:", v81);

    objc_msgSend(v4, "updateContact:", v5);
    v95 = 0;
    v82 = objc_msgSend(v3, "executeSaveRequest:error:", v4, &v95);
    v83 = v95;
    v14 = v83;
    v84 = self->_logger;
    if ((v82 & 1) != 0)
    {
      -[CNSharingProfileLogger logOnboardingSuccessSavingContact](self->_logger, "logOnboardingSuccessSavingContact");
    }
    else
    {
      objc_msgSend(v83, "localizedDescription");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNSharingProfileLogger logOnboardingErrorSavingContactWithDescription:](v84, "logOnboardingErrorSavingContactWithDescription:", v85);

    }
  }
  else
  {
    -[CNSharingProfileLogger logOnboardingAddingContact](self->_logger, "logOnboardingAddingContact");
    objc_msgSend(v4, "addContact:toContainerWithIdentifier:", v5, 0);
    v94 = 0;
    v12 = objc_msgSend(v3, "executeSaveRequest:error:", v4, &v94);
    v13 = v94;
    v14 = v13;
    v15 = self->_logger;
    if ((v12 & 1) != 0)
    {
      -[CNSharingProfileLogger logOnboardingSuccessSavingContact](self->_logger, "logOnboardingSuccessSavingContact");
    }
    else
    {
      objc_msgSend(v13, "localizedDescription");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNSharingProfileLogger logOnboardingErrorSavingContactWithDescription:](v15, "logOnboardingErrorSavingContactWithDescription:", v46);

    }
    v93 = 0;
    v47 = objc_msgSend(v3, "setMeContact:error:", v5, &v93);
    v48 = v93;
    v49 = v48;
    if ((v47 & 1) == 0)
    {
      v50 = self->_logger;
      objc_msgSend(v48, "localizedDescription");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNSharingProfileLogger logOnboardingErrorSettingMeContactWithDescription:](v50, "logOnboardingErrorSettingMeContactWithDescription:", v51);

    }
  }

}

- (void)presentNameAndAudienceControllerForContact:(id)a3
{
  id v4;
  CNSharingProfileOnboardingAudienceViewController *v5;
  CNSharingProfileOnboardingAudienceController *audienceViewController;
  CNSharingProfileOnboardingAudienceViewController *v7;

  v4 = a3;
  v5 = -[CNSharingProfileOnboardingAudienceViewController initWithContact:selectedSharingAudience:]([CNSharingProfileOnboardingAudienceViewController alloc], "initWithContact:selectedSharingAudience:", v4, 1);

  -[CNSharingProfileOnboardingAudienceViewController setDelegate:](v5, "setDelegate:", self);
  audienceViewController = self->_audienceViewController;
  self->_audienceViewController = (CNSharingProfileOnboardingAudienceController *)v5;
  v7 = v5;

  -[UINavigationController pushViewController:animated:](self->_navigationController, "pushViewController:animated:", v7, self->_shouldAnimateNavTransitions);
}

- (void)presentAnimojiPoseCapture
{
  CNAvatarEditingManager *v3;
  CNAvatarEditingManager *avatarEditingManager;
  CNPhotoPickerNavigationViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  CNPhotoPickerNavigationViewController *v15;

  v3 = -[CNAvatarEditingManager initWithAvatarRecord:variantsManager:]([CNAvatarEditingManager alloc], "initWithAvatarRecord:variantsManager:", self->_avatarRecord, self->_variantsManager);
  avatarEditingManager = self->_avatarEditingManager;
  self->_avatarEditingManager = v3;

  v5 = [CNPhotoPickerNavigationViewController alloc];
  -[CNAvatarEditingManager viewController](self->_avatarEditingManager, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[CNPhotoPickerNavigationViewController initWithRootViewController:](v5, "initWithRootViewController:", v6);

  -[CNAvatarEditingManager setDelegate:](self->_avatarEditingManager, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarEditingManager viewController](self->_avatarEditingManager, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v7);

  +[CNVisualIdentityPickerViewController defaultContentSize](CNPhotoPickerViewController, "defaultContentSize");
  v11 = v10;
  v13 = v12;
  -[CNAvatarEditingManager viewController](self->_avatarEditingManager, "viewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPreferredContentSize:", v11, v13);

  -[UINavigationController presentViewController:animated:completion:](self->_navigationController, "presentViewController:animated:completion:", v15, 1, 0);
}

- (void)notifyDelegateOfSetupLaterSelected
{
  void *v3;
  char v4;
  id v5;

  -[CNSharingProfileOnboardingFlowManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CNSharingProfileOnboardingFlowManager delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "flowManagerDidSelectSetupLater:", self);

  }
}

- (void)photoSelectionViewControllerDidFinishWithResult:(id)a3
{
  CNPhotoPickerProviderItem *selectedVariantItem;
  CNSharingProfileOnboardingVariantViewController *v6;
  CNSharingProfileOnboardingVariantViewController *variantController;
  CNSharingProfileOnboardingVariantViewController *v8;
  id v9;
  id v10;

  v10 = a3;
  if (v10)
  {
    objc_storeStrong((id *)&self->_photoSelectionResult, a3);
    selectedVariantItem = self->_selectedVariantItem;
    self->_selectedVariantItem = 0;

    if (objc_msgSend(v10, "wasSelectedInFullPhotoPicker")
      || (-[CNSharingProfileOnboardingFlowManager prepareVariantsControllerForResult:](self, "prepareVariantsControllerForResult:", v10), v6 = (CNSharingProfileOnboardingVariantViewController *)objc_claimAutoreleasedReturnValue(), variantController = self->_variantController, self->_variantController = v6, variantController, (v8 = self->_variantController) == 0))
    {
      -[CNSharingProfileOnboardingFlowManager presentMeCardAlertForResult:](self, "presentMeCardAlertForResult:", v10);
    }
    else
    {
      -[CNSharingProfileOnboardingVariantViewController setOnboardingDelegate:](v8, "setOnboardingDelegate:", self);
      -[CNSharingProfileOnboardingVariantViewController setShouldShowPoseButton:](self->_variantController, "setShouldShowPoseButton:", objc_msgSend(v10, "avatarType") == 2);
      -[UINavigationController pushViewController:animated:](self->_navigationController, "pushViewController:animated:", self->_variantController, self->_shouldAnimateNavTransitions);
    }
  }
  else
  {
    v9 = -[UINavigationController popViewControllerAnimated:](self->_navigationController, "popViewControllerAnimated:", self->_shouldAnimateNavTransitions);
  }

}

- (void)presentMeCardAlertForResult:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__CNSharingProfileOnboardingFlowManager_presentMeCardAlertForResult___block_invoke;
  v6[3] = &unk_1E2050400;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CNSharingProfileOnboardingFlowManager presentMeCardPersistanceAlertIfNeededWithCompletionBlock:](self, "presentMeCardPersistanceAlertIfNeededWithCompletionBlock:", v6);

}

- (id)mutableContactForResult:(id)a3
{
  UIImage *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "compositedImage");
  v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)-[CNContact mutableCopy](self->_contact, "mutableCopy");
  objc_msgSend(v6, "setImageData:", v5);
  objc_msgSend(v6, "setCropRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v6, "setThumbnailImageData:", v5);

  return v6;
}

- (void)onboardingVariantControllerDidTapBack:(id)a3
{
  id v3;

  v3 = -[UINavigationController popViewControllerAnimated:](self->_navigationController, "popViewControllerAnimated:", self->_shouldAnimateNavTransitions);
}

- (void)onboardingVariantControllerDidTapContinue:(id)a3
{
  CNPhotoPickerProviderItem *v4;
  CNPhotoPickerProviderItem *selectedVariantItem;
  _QWORD v6[5];

  objc_msgSend(a3, "selectedItem");
  v4 = (CNPhotoPickerProviderItem *)objc_claimAutoreleasedReturnValue();
  selectedVariantItem = self->_selectedVariantItem;
  self->_selectedVariantItem = v4;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__CNSharingProfileOnboardingFlowManager_onboardingVariantControllerDidTapContinue___block_invoke;
  v6[3] = &unk_1E204F648;
  v6[4] = self;
  -[CNSharingProfileOnboardingFlowManager presentMeCardPersistanceAlertIfNeededWithCompletionBlock:](self, "presentMeCardPersistanceAlertIfNeededWithCompletionBlock:", v6);
}

- (void)posePickerController:(id)a3 didFinishWithProviderItem:(id)a4
{
  id v6;
  CNPhotoPickerVariantsManager *v7;
  CNPhotoPickerVariantsManager *variantsManager;
  void *v9;
  void *v10;
  void *v11;
  UIImage *v12;
  void *v13;
  CNPhotoPickerAnimojiProviderItem *v14;
  CNPhotoPickerAnimojiProviderItem *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  CNSharingProfileOnboardingVariantViewController *v21;
  CNSharingProfileOnboardingVariantViewController *variantController;
  id v23;

  v23 = a3;
  v6 = a4;
  if (!self->_variantsManager)
  {
    v7 = objc_alloc_init(CNPhotoPickerVariantsManager);
    variantsManager = self->_variantsManager;
    self->_variantsManager = v7;

  }
  v9 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(v6, "imageData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageWithData:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNAvatarImageUtilities croppedAndCenteredAvatarImageForImage:widthMultiplier:](CNAvatarImageUtilities, "croppedAndCenteredAvatarImageForImage:widthMultiplier:", v11, 1.0);
  v12 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [CNPhotoPickerAnimojiProviderItem alloc];
  v15 = -[CNPhotoPickerAnimojiProviderItem initWithOriginalImageData:cropRect:](v14, "initWithOriginalImageData:cropRect:", v13, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_opt_class();
  v16 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  if (v18)
  {
    objc_msgSend(v18, "avatarRecord");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerAnimojiProviderItem setAvatarRecord:](v15, "setAvatarRecord:", v19);

    objc_msgSend(v18, "poseConfiguration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerAnimojiProviderItem setPoseConfiguration:](v15, "setPoseConfiguration:", v20);

    objc_msgSend(v18, "edgeInsets");
    -[CNPhotoPickerAnimojiProviderItem setEdgeInsets:](v15, "setEdgeInsets:");
    objc_msgSend(v18, "originalImageSize");
    -[CNPhotoPickerAnimojiProviderItem setOriginalImageSize:](v15, "setOriginalImageSize:");
  }
  else
  {
    -[CNSharingProfileLogger logOnboardingReturningNonAnimojiItem](self->_logger, "logOnboardingReturningNonAnimojiItem");
  }
  v21 = -[CNSharingProfileOnboardingVariantViewController initWithVariantsManager:originalItem:selectedVariantIdentifier:]([CNSharingProfileOnboardingVariantViewController alloc], "initWithVariantsManager:originalItem:selectedVariantIdentifier:", self->_variantsManager, v15, 0);
  objc_storeStrong((id *)&self->_variantController, v21);
  variantController = self->_variantController;
  if (variantController)
  {
    -[CNSharingProfileOnboardingVariantViewController setOnboardingDelegate:](variantController, "setOnboardingDelegate:", self);
    -[UINavigationController pushViewController:animated:](self->_navigationController, "pushViewController:animated:", self->_variantController, self->_shouldAnimateNavTransitions);
  }

}

- (void)posePickerControllerDidSelectBack:(id)a3
{
  id v4;
  id v5;

  -[CNSharingProfileOnboardingFlowManager navigationController](self, "navigationController", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "popViewControllerAnimated:", self->_shouldAnimateNavTransitions);

}

- (void)posePickerControllerDidSelectSetupLater:(id)a3
{
  id v4;

  -[CNSharingProfileOnboardingFlowManager delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flowManagerDidSelectSetupLater:", self);

}

- (void)avatarEditingManager:(id)a3 didFinishWithProviderItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v6)
  {
    objc_storeStrong((id *)&self->_selectedVariantItem, a4);
    -[CNSharingProfileOnboardingFlowManager variantController](self, "variantController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateOriginalItem:", v6);

  }
  objc_msgSend(v9, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)audienceController:(id)a3 didFinishWithContact:(id)a4 sharingAudience:(unint64_t)a5
{
  id v7;
  id v8;
  void (**v9)(void);
  _QWORD aBlock[4];
  id v11;
  CNSharingProfileOnboardingFlowManager *v12;
  unint64_t v13;

  v7 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__CNSharingProfileOnboardingFlowManager_audienceController_didFinishWithContact_sharingAudience___block_invoke;
  aBlock[3] = &unk_1E204D910;
  v11 = v7;
  v12 = self;
  v13 = a5;
  v8 = v7;
  v9 = (void (**)(void))_Block_copy(aBlock);
  v9[2]();

}

- (CNSharingProfileOnboardingFlowManagerDelegate)delegate
{
  return (CNSharingProfileOnboardingFlowManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldAnimateNavTransitions
{
  return self->_shouldAnimateNavTransitions;
}

- (void)setShouldAnimateNavTransitions:(BOOL)a3
{
  self->_shouldAnimateNavTransitions = a3;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
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

- (BOOL)didPersistToMeCard
{
  return self->_didPersistToMeCard;
}

- (void)setDidPersistToMeCard:(BOOL)a3
{
  self->_didPersistToMeCard = a3;
}

- (CNSharingProfileOnboardingPhotoSelectionViewController)photoSelectionController
{
  return self->_photoSelectionController;
}

- (void)setPhotoSelectionController:(id)a3
{
  objc_storeStrong((id *)&self->_photoSelectionController, a3);
}

- (CNSharingProfileOnboardingPosePickerController)posePickerController
{
  return self->_posePickerController;
}

- (void)setPosePickerController:(id)a3
{
  objc_storeStrong((id *)&self->_posePickerController, a3);
}

- (CNSharingProfileOnboardingVariantViewController)variantController
{
  return self->_variantController;
}

- (void)setVariantController:(id)a3
{
  objc_storeStrong((id *)&self->_variantController, a3);
}

- (CNSharingProfileOnboardingAudienceController)audienceViewController
{
  return self->_audienceViewController;
}

- (void)setAudienceViewController:(id)a3
{
  objc_storeStrong((id *)&self->_audienceViewController, a3);
}

- (CNSharingProfileOnboardingPhotoSelectionResult)photoSelectionResult
{
  return self->_photoSelectionResult;
}

- (void)setPhotoSelectionResult:(id)a3
{
  objc_storeStrong((id *)&self->_photoSelectionResult, a3);
}

- (CNPhotoPickerVariantsManager)variantsManager
{
  return self->_variantsManager;
}

- (void)setVariantsManager:(id)a3
{
  objc_storeStrong((id *)&self->_variantsManager, a3);
}

- (CNPhotoPickerProviderItem)selectedVariantItem
{
  return self->_selectedVariantItem;
}

- (void)setSelectedVariantItem:(id)a3
{
  objc_storeStrong((id *)&self->_selectedVariantItem, a3);
}

- (CNAvatarEditingManager)avatarEditingManager
{
  return self->_avatarEditingManager;
}

- (void)setAvatarEditingManager:(id)a3
{
  objc_storeStrong((id *)&self->_avatarEditingManager, a3);
}

- (CNSharingProfileLogger)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_avatarEditingManager, 0);
  objc_storeStrong((id *)&self->_selectedVariantItem, 0);
  objc_storeStrong((id *)&self->_variantsManager, 0);
  objc_storeStrong((id *)&self->_photoSelectionResult, 0);
  objc_storeStrong((id *)&self->_audienceViewController, 0);
  objc_storeStrong((id *)&self->_variantController, 0);
  objc_storeStrong((id *)&self->_posePickerController, 0);
  objc_storeStrong((id *)&self->_photoSelectionController, 0);
  objc_storeStrong((id *)&self->_avatarItemProviderConfiguration, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __97__CNSharingProfileOnboardingFlowManager_audienceController_didFinishWithContact_sharingAudience___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  CNSharingProfileOnboardingFlowResult *v10;

  if (*(_QWORD *)(a1 + 32))
  {
    v10 = objc_alloc_init(CNSharingProfileOnboardingFlowResult);
    objc_msgSend(*(id *)(a1 + 32), "imageData");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "length");

    if (!v3)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "rawImageType"))
      {
        if (objc_msgSend(*(id *)(a1 + 32), "rawImageType") != 2)
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "logOnboardingReturningEmptyImage");
      }
      else
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "logOnboardingReturningDefaultMonogram");
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "imageData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSharingProfileOnboardingFlowResult setImageData:](v10, "setImageData:", v4);

    objc_msgSend(*(id *)(a1 + 32), "cropRect");
    -[CNSharingProfileOnboardingFlowResult setCropRect:](v10, "setCropRect:");
    objc_msgSend(*(id *)(a1 + 32), "givenName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSharingProfileOnboardingFlowResult setGivenName:](v10, "setGivenName:", v5);

    objc_msgSend(*(id *)(a1 + 32), "familyName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSharingProfileOnboardingFlowResult setFamilyName:](v10, "setFamilyName:", v6);

    objc_msgSend(*(id *)(a1 + 32), "wallpaper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSharingProfileOnboardingFlowResult setWallpaper:](v10, "setWallpaper:", v7);

    -[CNSharingProfileOnboardingFlowResult setSharingAudience:](v10, "setSharingAudience:", *(_QWORD *)(a1 + 48));
    -[CNSharingProfileOnboardingFlowResult setDidPersistImageToContact:](v10, "setDidPersistImageToContact:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 10));
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "flowManager:didFinishWithResult:", *(_QWORD *)(a1 + 40), v10);

  }
  else
  {
    v9 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "popViewControllerAnimated:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 8));
  }
}

void __83__CNSharingProfileOnboardingFlowManager_onboardingVariantControllerDidTapContinue___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "mutableCopy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "updateContact:", v2);
  objc_msgSend(*(id *)(a1 + 32), "presentNameAndAudienceControllerForContact:", v2);

}

void __69__CNSharingProfileOnboardingFlowManager_presentMeCardAlertForResult___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "mutableContactForResult:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "presentNameAndAudienceControllerForContact:", v2);

}

uint64_t __64__CNSharingProfileOnboardingFlowManager_saveCurrentInfoToMeCard__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "imageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "imageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToData:", v4);

  return v5;
}

uint64_t __64__CNSharingProfileOnboardingFlowManager_saveCurrentInfoToMeCard__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "posterData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "wallpaper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "posterArchiveData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToData:", v5);

  return v6;
}

uint64_t __98__CNSharingProfileOnboardingFlowManager_presentMeCardPersistanceAlertIfNeededWithCompletionBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "performSaveToMeCardAction");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __98__CNSharingProfileOnboardingFlowManager_presentMeCardPersistanceAlertIfNeededWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_1_45248 != -1)
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_1_45248, &__block_literal_global_45249);
  return (id)descriptorForRequiredKeys_cn_once_object_1_45250;
}

void __66__CNSharingProfileOnboardingFlowManager_descriptorForRequiredKeys__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  +[CNSharingProfileOnboardingPhotoSelectionViewController descriptorForRequiredKeys](CNSharingProfileOnboardingPhotoSelectionViewController, "descriptorForRequiredKeys");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v0;
  +[CNSharingProfileOnboardingAudienceViewController descriptorForRequiredKeys](CNSharingProfileOnboardingAudienceViewController, "descriptorForRequiredKeys");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNSharingProfileOnboardingFlowManager descriptorForRequiredKeys]_block_invoke");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptorWithKeyDescriptors:description:", v2, v4);
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = (void *)descriptorForRequiredKeys_cn_once_object_1_45250;
  descriptorForRequiredKeys_cn_once_object_1_45250 = v5;

}

@end
