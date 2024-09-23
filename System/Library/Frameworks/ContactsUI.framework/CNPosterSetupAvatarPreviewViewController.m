@implementation CNPosterSetupAvatarPreviewViewController

- (CNPosterSetupAvatarPreviewViewController)initWithPosterConfiguration:(id)a3 forEditingContact:(id)a4
{
  id v6;
  id v7;
  CNPosterSetupAvatarPreviewViewController *v8;
  CNPosterSetupAvatarPreviewViewController *v9;
  uint64_t v10;
  NSString *wallpaperType;
  NSObject *v12;
  CNPosterSetupAvatarPreviewViewController *v13;
  CNPosterSetupAvatarPreviewViewController *v14;
  _QWORD v16[4];
  CNPosterSetupAvatarPreviewViewController *v17;
  id v18;
  id v19;
  id location;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CNPosterSetupAvatarPreviewViewController;
  v8 = -[CNPosterSetupAvatarPreviewViewController init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_editingContact, a4);
    objc_msgSend(MEMORY[0x1E0C97408], "wallpaperTypeFromConfiguration:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    wallpaperType = v9->_wallpaperType;
    v9->_wallpaperType = (NSString *)v10;

    v9->_imageType = objc_msgSend((id)objc_opt_class(), "defaultImageTypeForWallpaperType:", v9->_wallpaperType);
    objc_initWeak(&location, v9);
    dispatch_get_global_queue(25, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __90__CNPosterSetupAvatarPreviewViewController_initWithPosterConfiguration_forEditingContact___block_invoke;
    v16[3] = &unk_1E204FF10;
    v13 = v9;
    v17 = v13;
    v18 = v6;
    objc_copyWeak(&v19, &location);
    dispatch_async(v12, v16);

    v14 = v13;
    objc_destroyWeak(&v19);

    objc_destroyWeak(&location);
  }

  return v9;
}

- (CNPosterSetupAvatarPreviewViewController)initWithContactImage:(id)a3 imageType:(unint64_t)a4 forEditingContact:(id)a5
{
  id v9;
  id v10;
  CNPosterSetupAvatarPreviewViewController *v11;
  CNPosterSetupAvatarPreviewViewController *v12;
  uint64_t v13;
  NSData *imageData;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CNPosterSetupAvatarPreviewViewController *v19;
  objc_super v21;

  v9 = a3;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CNPosterSetupAvatarPreviewViewController;
  v11 = -[CNPosterSetupAvatarPreviewViewController init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_editingContact, a5);
    objc_storeStrong((id *)&v12->_contactImage, a3);
    objc_msgSend(v9, "imageData");
    v13 = objc_claimAutoreleasedReturnValue();
    imageData = v12->_imageData;
    v12->_imageData = (NSData *)v13;

    objc_msgSend(v9, "cropRect");
    v12->_cropRect.origin.x = v15;
    v12->_cropRect.origin.y = v16;
    v12->_cropRect.size.width = v17;
    v12->_cropRect.size.height = v18;
    v12->_imageType = a4;
    v19 = v12;
  }

  return v12;
}

- (void)setImageData:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_imageData, a3);
  v5 = a3;
  -[CNPosterSetupAvatarPreviewViewController avatarPreviewView](self, "avatarPreviewView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImageData:", v5);

}

- (void)setCropRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  self->_cropRect = a3;
  -[CNPosterSetupAvatarPreviewViewController avatarPreviewView](self, "avatarPreviewView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCropRect:", x, y, width, height);

}

- (void)setImageType:(unint64_t)a3
{
  id v4;

  self->_imageType = a3;
  -[CNPosterSetupAvatarPreviewViewController avatarPreviewView](self, "avatarPreviewView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageType:", a3);

}

- (void)updateMemojiEditingManagerForProviderItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  CNAvatarEditingManager *v9;
  CNAvatarEditingManager *memojiEditingManager;
  id v11;

  v11 = a3;
  if (-[CNPosterSetupAvatarPreviewViewController imageType](self, "imageType") == 3)
  {
    objc_opt_class();
    v4 = v11;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    if (v6)
    {
      objc_msgSend(v6, "avatarRecord");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "poseConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPosterSetupAvatarPreviewViewController memojiEditingManagerForAvatarRecord:poseConfiguration:](self, "memojiEditingManagerForAvatarRecord:poseConfiguration:", v7, v8);
      v9 = (CNAvatarEditingManager *)objc_claimAutoreleasedReturnValue();

      -[CNAvatarEditingManager setOriginalItem:](v9, "setOriginalItem:", v6);
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  memojiEditingManager = self->_memojiEditingManager;
  self->_memojiEditingManager = v9;

}

- (id)memojiEditingManagerForAvatarRecord:(id)a3 poseConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CNPhotoPickerVariantsManager *v9;
  CNPhotoPickerVariantsManager *variantsManager;
  CNAvatarEditingManager *v11;

  v6 = a4;
  v7 = a3;
  -[CNPosterSetupAvatarPreviewViewController variantsManager](self, "variantsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = objc_alloc_init(CNPhotoPickerVariantsManager);
    variantsManager = self->_variantsManager;
    self->_variantsManager = v9;

  }
  v11 = -[CNAvatarEditingManager initWithAvatarRecord:poseConfiguration:variantsManager:]([CNAvatarEditingManager alloc], "initWithAvatarRecord:poseConfiguration:variantsManager:", v7, v6, self->_variantsManager);

  -[CNAvatarEditingManager setDelegate:](v11, "setDelegate:", self);
  return v11;
}

- (void)updateWithProviderItem:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "imageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterSetupAvatarPreviewViewController setImageData:](self, "setImageData:", v4);

  objc_msgSend(v6, "cropRect");
  -[CNPosterSetupAvatarPreviewViewController setCropRect:](self, "setCropRect:");
  -[CNPosterSetupAvatarPreviewViewController setImageType:](self, "setImageType:", objc_msgSend(v6, "imageType"));
  objc_msgSend(v6, "contactImageForMetadataStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterSetupAvatarPreviewViewController setContactImage:](self, "setContactImage:", v5);

  -[CNPosterSetupAvatarPreviewViewController updateMemojiEditingManagerForProviderItem:](self, "updateMemojiEditingManagerForProviderItem:", v6);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CNPosterSetupAvatarPreviewViewController *v7;
  CNPosterSetupAvatarPreviewViewController *v8;
  BOOL v9;
  id v10;
  CNPosterSetupAvatarPreviewViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _TtC10ContactsUI37CNPosterSetupAvatarPreviewViewWrapper *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _TtC10ContactsUI37CNPosterSetupAvatarPreviewViewWrapper *v23;
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
  _TtC10ContactsUI37CNPosterSetupAvatarPreviewViewWrapper *v48;
  void *v49;
  objc_super v50;
  _QWORD v51[6];

  v51[4] = *MEMORY[0x1E0C80C00];
  v50.receiver = self;
  v50.super_class = (Class)CNPosterSetupAvatarPreviewViewController;
  -[CNPosterSetupAvatarPreviewViewController viewDidLoad](&v50, sel_viewDidLoad);
  CNContactsUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SNAP_POSTER_AVATAR_PREVIEW_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterSetupAvatarPreviewViewController setTitle:](self, "setTitle:", v4);

  -[CNPosterSetupAvatarPreviewViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (CNPosterSetupAvatarPreviewViewController *)objc_claimAutoreleasedReturnValue();
  if (v7 == self)
  {
    v11 = self;
  }
  else
  {
    v8 = v7;
    v9 = -[CNPosterSetupAvatarPreviewViewController hideSkipOption](self, "hideSkipOption");

    if (v9)
      goto LABEL_6;
    v10 = objc_alloc(MEMORY[0x1E0DC34F0]);
    CNContactsUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SNAP_POSTER_PREVIEW_SKIP"), &stru_1E20507A8, CFSTR("Localized"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (CNPosterSetupAvatarPreviewViewController *)objc_msgSend(v10, "initWithTitle:style:target:action:", v6, 0, self, sel_skipStep);
    -[CNPosterSetupAvatarPreviewViewController navigationItem](self, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRightBarButtonItem:", v11);

  }
LABEL_6:
  if (-[CNPosterSetupAvatarPreviewViewController shouldShowCancelButton](self, "shouldShowCancelButton"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_didTapCancel);
    -[CNPosterSetupAvatarPreviewViewController navigationItem](self, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLeftBarButtonItem:", v13);

  }
  -[CNPosterSetupAvatarPreviewViewController imageData](self, "imageData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterSetupAvatarPreviewViewController contactImage](self, "contactImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "variant");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPhotoPickerProviderItem generateImageDataWithData:filterName:](CNPhotoPickerProviderItem, "generateImageDataWithData:filterName:", v15, v17);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = [_TtC10ContactsUI37CNPosterSetupAvatarPreviewViewWrapper alloc];
  -[CNPosterSetupAvatarPreviewViewController cropRect](self, "cropRect");
  v23 = -[CNPosterSetupAvatarPreviewViewWrapper initWithImageData:cropRect:imageType:delegate:](v18, "initWithImageData:cropRect:imageType:delegate:", v49, -[CNPosterSetupAvatarPreviewViewController imageType](self, "imageType"), self, v19, v20, v21, v22);
  -[CNPosterSetupAvatarPreviewViewWrapper hostingController](v23, "hostingController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNPosterSetupAvatarPreviewViewController setAvatarPreviewView:](self, "setAvatarPreviewView:", v23);
  -[CNPosterSetupAvatarPreviewViewWrapper hostingController](v23, "hostingController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "willMoveToParentViewController:", self);

  v48 = v23;
  -[CNPosterSetupAvatarPreviewViewWrapper hostingController](v23, "hostingController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterSetupAvatarPreviewViewController addChildViewController:](self, "addChildViewController:", v27);

  -[CNPosterSetupAvatarPreviewViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSubview:", v25);

  -[CNPosterSetupAvatarPreviewViewWrapper hostingController](v23, "hostingController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "didMoveToParentViewController:", self);

  v40 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v25, "leadingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterSetupAvatarPreviewViewController view](self, "view");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "leadingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v44;
  objc_msgSend(v25, "trailingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterSetupAvatarPreviewViewController view](self, "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v41);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v39;
  objc_msgSend(v25, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterSetupAvatarPreviewViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = v33;
  objc_msgSend(v25, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterSetupAvatarPreviewViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v51[3] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "activateConstraints:", v38);

}

- (void)skipStep
{
  id v3;

  -[CNPosterSetupAvatarPreviewViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avatarPreviewViewControllerDidSelectCustomizeLater:", self);

}

- (void)didTapCancel
{
  id v3;

  -[CNPosterSetupAvatarPreviewViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[CNPosterSetupAvatarPreviewViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avatarPreviewViewControllerDidCancel:", self);

}

- (void)photoPickerProviderItemFromPosterConfiguration:(id)a3 completionBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  id v9;
  int v10;
  NSObject *v11;
  void *v12;
  _TtC10ContactsUI35CNMonogramPosterConfigurationReader *v13;
  void *v14;
  void *v15;
  void *v16;
  _TtC10ContactsUI33CNMemojiPosterConfigurationReader *v17;
  void *v18;
  uint64_t v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  CNAvatarEditingManager *v30;
  CNAvatarEditingManager *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  CNAvatarEditingManager *v37;
  CNAvatarEditingManager *memojiEditingManager;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  __int128 buf;
  Class (*v49)(uint64_t);
  void *v50;
  uint64_t *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[CNPosterSetupAvatarPreviewViewController setImagePickerCustomBackgroundColor:](self, "setImagePickerCustomBackgroundColor:", 0);
  v43 = 0;
  objc_msgSend(v6, "loadUserInfoWithError:", &v43);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v43;
  v10 = (*(uint64_t (**)(void))(*MEMORY[0x1E0D13820] + 16))();
  if (v10)
  {
    CNUILogPosters();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_error_impl(&dword_18AC56000, v11, OS_LOG_TYPE_ERROR, "Error loading user info for configuration: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0C97408], "wallpaperTypeFromConfiguration:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (((v10 | objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C97188]) ^ 1) & 1) != 0
    || !+[CNMonogramPosterConfigurationReader canReadConfiguration](_TtC10ContactsUI35CNMonogramPosterConfigurationReader, "canReadConfiguration"))
  {
    if (((v10 | objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C97180]) ^ 1) & 1) != 0
      || !+[CNMemojiPosterConfigurationReader canReadConfiguration](_TtC10ContactsUI33CNMemojiPosterConfigurationReader, "canReadConfiguration"))
    {
      if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C97190]))
      {
        -[CNPosterSetupAvatarPreviewViewController photoProviderItemFromPosterConfiguration:completionBlock:](self, "photoProviderItemFromPosterConfiguration:completionBlock:", v6, v7);
      }
      else
      {
        -[CNPosterSetupAvatarPreviewViewController providerItemForRandomColoredMonogram](self, "providerItemForRandomColoredMonogram");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, v24);

      }
    }
    else
    {
      v17 = -[CNMemojiPosterConfigurationReader initWithPosterConfigurationUserInfo:]([_TtC10ContactsUI33CNMemojiPosterConfigurationReader alloc], "initWithPosterConfigurationUserInfo:", v8);
      -[CNMemojiPosterConfigurationReader avatarRecordData](v17, "avatarRecordData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *MEMORY[0x1E0D13818];
      v20 = (*(uint64_t (**)(_QWORD, void *))(*MEMORY[0x1E0D13818] + 16))(*MEMORY[0x1E0D13818], v18);

      if ((v20 & 1) != 0)
      {
        -[CNMemojiPosterConfigurationReader avatarImageData](v17, "avatarImageData");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (*(uint64_t (**)(uint64_t, void *))(v19 + 16))(v19, v21);

        if ((v22 & 1) != 0)
        {
          -[CNPosterSetupAvatarPreviewViewController providerItemForRandomColoredMonogram](self, "providerItemForRandomColoredMonogram");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[CNPosterSetupAvatarPreviewViewController memojiEditingManagerForAvatarRecord:poseConfiguration:](self, "memojiEditingManagerForAvatarRecord:poseConfiguration:", 0, 0);
          v37 = (CNAvatarEditingManager *)objc_claimAutoreleasedReturnValue();
          memojiEditingManager = self->_memojiEditingManager;
          self->_memojiEditingManager = v37;

          -[CNMemojiPosterConfigurationReader avatarImageData](v17, "avatarImageData");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNMemojiPosterConfigurationReader backgroundColor](v17, "backgroundColor");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNPosterSetupAvatarPreviewViewController animojiProviderItemForAvatarImageData:backgroundColor:](self, "animojiProviderItemForAvatarImageData:backgroundColor:", v39, v40);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        v44 = 0;
        v45 = &v44;
        v46 = 0x2050000000;
        v25 = (void *)getAVTAvatarRecordSerializerClass_softClass;
        v47 = getAVTAvatarRecordSerializerClass_softClass;
        if (!getAVTAvatarRecordSerializerClass_softClass)
        {
          *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
          *((_QWORD *)&buf + 1) = 3221225472;
          v49 = __getAVTAvatarRecordSerializerClass_block_invoke;
          v50 = &unk_1E204EBC0;
          v51 = &v44;
          __getAVTAvatarRecordSerializerClass_block_invoke((uint64_t)&buf);
          v25 = (void *)v45[3];
        }
        v26 = objc_retainAutorelease(v25);
        _Block_object_dispose(&v44, 8);
        -[CNMemojiPosterConfigurationReader avatarRecordData](v17, "avatarRecordData");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "avatarRecordFromData:", v27);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = (void *)MEMORY[0x1E0C97350];
        -[CNMemojiPosterConfigurationReader avatarPoseData](v17, "avatarPoseData");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "poseConfigurationForData:withAvatarRecord:", v29, v42);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        -[CNPosterSetupAvatarPreviewViewController memojiEditingManagerForAvatarRecord:poseConfiguration:](self, "memojiEditingManagerForAvatarRecord:poseConfiguration:", v42, v41);
        v30 = (CNAvatarEditingManager *)objc_claimAutoreleasedReturnValue();
        v31 = self->_memojiEditingManager;
        self->_memojiEditingManager = v30;

        -[CNPosterSetupAvatarPreviewViewController memojiEditingManager](self, "memojiEditingManager");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "originalItem");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v33, "setPoseConfiguration:", v41);
        v34 = (id)objc_msgSend(v33, "generateImageDataIfNeeded");
        -[CNMemojiPosterConfigurationReader backgroundColor](v17, "backgroundColor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNPosterSetupAvatarPreviewViewController animojiProviderItem:backgroundColor:](self, "animojiProviderItem:backgroundColor:", v33, v35);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        -[CNPosterSetupAvatarPreviewViewController memojiEditingManager](self, "memojiEditingManager");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setOriginalItem:", v23);

      }
      v7[2](v7, v23);

    }
  }
  else
  {
    v13 = -[CNMonogramPosterConfigurationReader initWithPosterConfigurationUserInfo:]([_TtC10ContactsUI35CNMonogramPosterConfigurationReader alloc], "initWithPosterConfigurationUserInfo:", v8);
    -[CNMonogramPosterConfigurationReader initials](v13, "initials");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMonogramPosterConfigurationReader backgroundColor](v13, "backgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPosterSetupAvatarPreviewViewController monogramProviderItemForInitials:backgroundColor:](self, "monogramProviderItemForInitials:backgroundColor:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v7[2](v7, v16);
  }

}

- (id)photoProviderItemForFullImageFromPosterConfiguration:(id)a3
{
  id v3;
  CNPhotosPosterConfigurationReader *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double x;
  double y;
  double width;
  double height;
  double v14;
  double v15;
  double v16;
  double v17;
  CNPhotoPickerProviderItem *v18;
  CGRect v20;

  v3 = a3;
  v4 = -[CNPhotosPosterConfigurationReader initWithPosterConfiguration:]([CNPhotosPosterConfigurationReader alloc], "initWithPosterConfiguration:", v3);

  -[CNPhotosPosterConfigurationReader fullExtentPreviewImageData](v4, "fullExtentPreviewImageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotosPosterConfigurationReader fullExtentPreviewImageSize](v4, "fullExtentPreviewImageSize");
  v7 = v6;
  v9 = v8;
  -[CNPhotosPosterConfigurationReader fullExtentPreviewImageFaceRect](v4, "fullExtentPreviewImageFaceRect");
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  if (CGRectEqualToRect(v20, *MEMORY[0x1E0C9D648]))
  {
    objc_msgSend(MEMORY[0x1E0D13A80], "centeredSquareCropRectInRect:", 0.0, 0.0, v7, v9);
    x = v14;
    y = v15;
    width = v16;
    height = v17;
  }
  v18 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:]([CNPhotoPickerProviderItem alloc], "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:", v5, 0, 0, x, y, width, height);

  return v18;
}

- (void)photoProviderItemFromPosterConfiguration:(id)a3 completionBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[CNPosterSetupAvatarPreviewViewController photoProviderItemForFullImageFromPosterConfiguration:](self, "photoProviderItemForFullImageFromPosterConfiguration:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v7[2](v7, v8);
  }
  else
  {
    CNUILogPosters();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18AC56000, v9, OS_LOG_TYPE_DEFAULT, "Unable to get original image data for Photos poster, falling back to poster snapshot", v10, 2u);
    }

    -[CNPosterSetupAvatarPreviewViewController photoProviderItemForSnapshotFromPosterConfiguration:completionBlock:](self, "photoProviderItemForSnapshotFromPosterConfiguration:completionBlock:", v6, v7);
  }

}

- (void)photoProviderItemForSnapshotFromPosterConfiguration:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  CNPRUISPosterSnapshotController *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  CNPosterSetupAvatarPreviewViewController *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;

  v6 = a4;
  v7 = a3;
  +[CNPRUISIncomingCallPosterContext emptyContext](CNPRUISIncomingCallPosterContext, "emptyContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPRUISIncomingCallSnapshotDefinition contentsOnlySnapshotDefinitionWithContext:attachmentIdentifiers:](CNPRUISIncomingCallSnapshotDefinition, "contentsOnlySnapshotDefinitionWithContext:attachmentIdentifiers:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNPRUISPosterSnapshotRequest requestForConfiguration:definition:interfaceOrientation:](CNPRUISPosterSnapshotRequest, "requestForConfiguration:definition:interfaceOrientation:", v7, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(CNPRUISPosterSnapshotController);
  v26 = 0;
  -[CNPRUISPosterSnapshotController latestSnapshotBundleForRequest:error:](v11, "latestSnapshotBundleForRequest:error:", v10, &v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v26;
  if (!v12)
    goto LABEL_4;
  objc_msgSend(v9, "levelSets");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "snapshotForLevelSet:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __112__CNPosterSetupAvatarPreviewViewController_photoProviderItemForSnapshotFromPosterConfiguration_completionBlock___block_invoke;
    v23[3] = &unk_1E204F098;
    v23[4] = self;
    v18 = v16;
    v24 = v18;
    v25 = v6;
    objc_msgSend(v17, "performBlock:", v23);

  }
  else
  {
LABEL_4:
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __112__CNPosterSetupAvatarPreviewViewController_photoProviderItemForSnapshotFromPosterConfiguration_completionBlock___block_invoke_2;
    v19[3] = &unk_1E204C3A0;
    v22 = v6;
    v20 = v9;
    v21 = self;
    -[CNPRUISPosterSnapshotController executeSnapshotRequest:completion:](v11, "executeSnapshotRequest:completion:", v10, v19);

    v18 = 0;
  }

}

- (id)providerItemWithSnapshotImage:(id)a3
{
  id v3;
  CGImage *v4;
  __CFData *v5;
  CGImageDestination *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  CNPhotoPickerProviderItem *v21;

  v3 = a3;
  v4 = (CGImage *)objc_msgSend(v3, "cnui_CGImageSnapshot");
  v5 = (__CFData *)objc_opt_new();
  v6 = CGImageDestinationCreateWithData(v5, CFSTR("public.png"), 1uLL, 0);
  CGImageDestinationAddImage(v6, v4, 0);
  CGImageDestinationFinalize(v6);
  if (v6)
    CFRelease(v6);
  v7 = (void *)MEMORY[0x1E0D13A80];
  objc_msgSend(v3, "size");
  v9 = v8;
  objc_msgSend(v3, "size");
  objc_msgSend(v7, "centeredSquareCropRectInRect:", 0.0, 0.0, v9, v10);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = (void *)objc_opt_class();
  objc_msgSend(v3, "size");
  v19 = v18;

  objc_msgSend(v17, "twentyFourPointFivePercentOfHeight:", v19);
  v21 = -[CNPhotoPickerProviderItem initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:]([CNPhotoPickerProviderItem alloc], "initWithImageData:thumbnailImageData:fullscreenImageData:cropRect:", v5, 0, 0, v12, v20, v14, v16);

  return v21;
}

- (id)animojiProviderItem:(id)a3 backgroundColor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  objc_opt_class();
  objc_msgSend(v7, "imageData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterSetupAvatarPreviewViewController animojiProviderItemForAvatarImageData:backgroundColor:](self, "animojiProviderItemForAvatarImageData:backgroundColor:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v7, "poseConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPoseConfiguration:", v12);

  objc_msgSend(v7, "avatarRecord");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setAvatarRecord:", v13);
  return v11;
}

- (id)animojiProviderItemForAvatarImageData:(id)a3 backgroundColor:(id)a4
{
  id v6;
  id v7;
  CNPhotoPickerVariantsManager *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  void *v15;
  CNPhotoPickerAnimojiProviderItem *v16;
  void *v17;
  CNPhotoPickerAnimojiProviderItem *v18;
  _QWORD v20[6];
  uint64_t v21;
  double *v22;
  uint64_t v23;
  const char *v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(CNPhotoPickerVariantsManager);
  -[CNPhotoPickerVariantsManager avatarBackgrounds](v8, "avatarBackgrounds");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterSetupAvatarPreviewViewController closestColor:inColors:](self, "closestColor:inColors:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "color");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPhotoPickerVariantsManager nonAlphaColorForBackgroundColor:](CNPhotoPickerVariantsManager, "nonAlphaColorForBackgroundColor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterSetupAvatarPreviewViewController setImagePickerCustomBackgroundColor:](self, "setImagePickerCustomBackgroundColor:", v12);

  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__34738;
  v31 = __Block_byref_object_dispose__34739;
  v32 = 0;
  v21 = 0;
  v22 = (double *)&v21;
  v23 = 0x4010000000;
  v24 = "";
  v14 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v25 = *MEMORY[0x1E0C9D648];
  v26 = v14;
  -[CNPosterSetupAvatarPreviewViewController memojiEditingManager](self, "memojiEditingManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __98__CNPosterSetupAvatarPreviewViewController_animojiProviderItemForAvatarImageData_backgroundColor___block_invoke;
  v20[3] = &unk_1E204C3C8;
  v20[4] = &v27;
  v20[5] = &v21;
  objc_msgSend(v15, "prepareAvatarImageForPicker:synchronousCompletion:", v13, v20);

  v16 = [CNPhotoPickerAnimojiProviderItem alloc];
  UIImagePNGRepresentation((UIImage *)v28[5]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[CNPhotoPickerAnimojiProviderItem initWithOriginalImageData:cropRect:backgroundColorVariant:](v16, "initWithOriginalImageData:cropRect:backgroundColorVariant:", v17, v10, v22[4], v22[5], v22[6], v22[7]);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v18;
}

- (id)providerItemForRandomColoredMonogram
{
  CNVisualIdentity *v3;
  void *v4;
  CNVisualIdentity *v5;
  _BOOL8 v6;
  void *v7;

  v3 = [CNVisualIdentity alloc];
  -[CNPosterSetupAvatarPreviewViewController editingContact](self, "editingContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNVisualIdentity initWithContact:](v3, "initWithContact:", v4);

  v6 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1;
  objc_msgSend((id)objc_opt_class(), "defaultItemSize");
  +[CNPhotoPickerMonogramProvider providerItemWithRandomBackgroundColorForVisualIdentity:size:RTL:](CNPhotoPickerMonogramProvider, "providerItemWithRandomBackgroundColorForVisualIdentity:size:RTL:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)monogramProviderItemForInitials:(id)a3 backgroundColor:(id)a4
{
  id v6;
  id v7;
  CNVisualIdentity *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(CNVisualIdentity);
  -[CNVisualIdentity setAbbreviatedName:](v8, "setAbbreviatedName:", v7);

  objc_msgSend(MEMORY[0x1E0D70A78], "availableColors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_cn_map:", &__block_literal_global_34732);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNPosterSetupAvatarPreviewViewController closestColor:inColors:](self, "closestColor:inColors:", v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1;
  objc_msgSend((id)objc_opt_class(), "defaultItemSize");
  v14 = v13;
  v16 = v15;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scale");
  v19 = v18;
  v20 = objc_alloc(MEMORY[0x1E0D70A78]);
  objc_msgSend(v11, "colorName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithColorName:", v21);
  +[CNPhotoPickerMonogramProvider providerItemForVisualIdentity:size:scale:RTL:backgroundColor:](CNPhotoPickerMonogramProvider, "providerItemForVisualIdentity:size:scale:RTL:backgroundColor:", v8, v12, v22, v14, v16, v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)closestColor:(id)a3 inColors:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  void *v14;
  void *v15;
  double v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  double v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v27 = 0;
  v28 = 0.0;
  v26 = 0;
  objc_msgSend(v5, "getHue:saturation:brightness:alpha:", &v28, &v27, &v26, 0);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v23;
    v12 = 1.79769313e308;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v20 = 0;
        v21 = 0.0;
        v19 = 0;
        objc_msgSend(v14, "color");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "getHue:saturation:brightness:alpha:", &v21, &v20, &v19, 0);

        v16 = vabdd_f64(v28, v21);
        if (v16 < v12)
        {
          v17 = v14;

          v12 = v16;
          v10 = v17;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)avatarPreviewViewDidFinishWithImageData:(id)a3 cropRect:(CGRect)a4
{
  void *v5;
  id v6;

  -[CNPosterSetupAvatarPreviewViewController delegate](self, "delegate", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CNPosterSetupAvatarPreviewViewController contactImage](self, "contactImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "avatarPreviewViewController:didFinishWithContactImage:", self, v5);

}

- (void)avatarPreviewViewDidSelectChangeScale
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  CNVisualIdentityImagePickerController *v20;

  v20 = objc_alloc_init(CNVisualIdentityImagePickerController);
  -[CNPosterSetupAvatarPreviewViewController contactImage](self, "contactImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "source");

  if (v4 == 3)
  {
    -[CNPosterSetupAvatarPreviewViewController memojiEditingManager](self, "memojiEditingManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPosterSetupAvatarPreviewViewController memojiEditingManager](self, "memojiEditingManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "originalItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imagePickerForItem:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNVisualIdentityImagePickerController presentImagePicker:withStyle:fromViewController:](v20, "presentImagePicker:withStyle:fromViewController:", v8, 6, self);
    -[CNPosterSetupAvatarPreviewViewController setMemojiImagePickerController:](self, "setMemojiImagePickerController:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13D40], "unifiedMeContactMonitor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPosterSetupAvatarPreviewViewController editingContact](self, "editingContact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityImagePickerController setIsMeContact:](v20, "setIsMeContact:", objc_msgSend(v9, "isMeContact:", v10));

    -[CNPosterSetupAvatarPreviewViewController imageData](self, "imageData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPosterSetupAvatarPreviewViewController cropRect](self, "cropRect");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    -[CNPosterSetupAvatarPreviewViewController imagePickerCustomBackgroundColor](self, "imagePickerCustomBackgroundColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityImagePickerController presentMoveAndScaleForImageData:withCropRect:fromViewController:backgroundColor:](v20, "presentMoveAndScaleForImageData:withCropRect:fromViewController:backgroundColor:", v8, self, v19, v12, v14, v16, v18);

  }
  -[CNVisualIdentityImagePickerController setDelegate:](v20, "setDelegate:", self);
  -[CNPosterSetupAvatarPreviewViewController setImagePicker:](self, "setImagePicker:", v20);

}

- (void)avatarPreviewViewDidSelectCustomizePhoto
{
  id v3;

  -[CNPosterSetupAvatarPreviewViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avatarPreviewViewControllerDidSelectCustomizePhoto:", self);

}

- (void)presentPhotoFilterEditorForProviderItem:(id)a3
{
  void *v4;
  id v5;

  -[CNPosterSetupAvatarPreviewViewController editorViewControllerForProviderItem:](self, "editorViewControllerForProviderItem:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v5);
  -[CNPosterSetupAvatarPreviewViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (id)editorViewControllerForProviderItem:(id)a3
{
  id v4;
  CNPhotoPickerVariantsManager *v5;
  CNVisualIdentityItemEditorViewController *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc_init(CNPhotoPickerVariantsManager);
  v6 = -[CNVisualIdentityItemEditorViewController initWithProviderItem:variantsManager:]([CNVisualIdentityItemEditorViewController alloc], "initWithProviderItem:variantsManager:", v4, v5);

  CNContactsUIBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_1E20507A8, CFSTR("Localized"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityItemEditorViewController setDoneButtonTitle:](v6, "setDoneButtonTitle:", v8);

  -[CNVisualIdentityItemEditorViewController setDelegate:](v6, "setDelegate:", self);
  return v6;
}

- (void)imagePickerController:(id)a3 didFinishWithProviderItem:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  v7 = a3;
  -[CNPosterSetupAvatarPreviewViewController updateWithProviderItem:](self, "updateWithProviderItem:", v6);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __92__CNPosterSetupAvatarPreviewViewController_imagePickerController_didFinishWithProviderItem___block_invoke;
  v9[3] = &unk_1E2050400;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v9);

}

- (void)imagePickerControllerDidCancel:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)visualIdentityEditorControllerDidCancel:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)visualIdentityEditorController:(id)a3 didFinishWithProviderItem:(id)a4
{
  id v6;

  v6 = a3;
  -[CNPosterSetupAvatarPreviewViewController updateWithProviderItem:](self, "updateWithProviderItem:", a4);
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)avatarEditingManager:(id)a3 didFinishWithProviderItem:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[CNPosterSetupAvatarPreviewViewController updateWithProviderItem:](self, "updateWithProviderItem:", v5);
  -[CNPosterSetupAvatarPreviewViewController memojiImagePickerController](self, "memojiImagePickerController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __91__CNPosterSetupAvatarPreviewViewController_avatarEditingManager_didFinishWithProviderItem___block_invoke;
  v8[3] = &unk_1E2050400;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v8);

}

- (NSData)imageData
{
  return self->_imageData;
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CNPosterSetupAvatarPreviewViewControllerDelegate)delegate
{
  return (CNPosterSetupAvatarPreviewViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)hideSkipOption
{
  return self->_hideSkipOption;
}

- (void)setHideSkipOption:(BOOL)a3
{
  self->_hideSkipOption = a3;
}

- (BOOL)shouldShowCancelButton
{
  return self->_shouldShowCancelButton;
}

- (void)setShouldShowCancelButton:(BOOL)a3
{
  self->_shouldShowCancelButton = a3;
}

- (_TtC10ContactsUI37CNPosterSetupAvatarPreviewViewWrapper)avatarPreviewView
{
  return self->_avatarPreviewView;
}

- (void)setAvatarPreviewView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarPreviewView, a3);
}

- (CNVisualIdentityImagePickerController)imagePicker
{
  return self->_imagePicker;
}

- (void)setImagePicker:(id)a3
{
  objc_storeStrong((id *)&self->_imagePicker, a3);
}

- (UIColor)imagePickerCustomBackgroundColor
{
  return self->_imagePickerCustomBackgroundColor;
}

- (void)setImagePickerCustomBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_imagePickerCustomBackgroundColor, a3);
}

- (CNContact)editingContact
{
  return self->_editingContact;
}

- (void)setEditingContact:(id)a3
{
  objc_storeStrong((id *)&self->_editingContact, a3);
}

- (NSString)wallpaperType
{
  return self->_wallpaperType;
}

- (unint64_t)imageType
{
  return self->_imageType;
}

- (CNContactImage)contactImage
{
  return self->_contactImage;
}

- (void)setContactImage:(id)a3
{
  objc_storeStrong((id *)&self->_contactImage, a3);
}

- (CNAvatarEditingManager)memojiEditingManager
{
  return self->_memojiEditingManager;
}

- (void)setMemojiEditingManager:(id)a3
{
  objc_storeStrong((id *)&self->_memojiEditingManager, a3);
}

- (CNPhotoPickerVariantsManager)variantsManager
{
  return self->_variantsManager;
}

- (void)setVariantsManager:(id)a3
{
  objc_storeStrong((id *)&self->_variantsManager, a3);
}

- (UIImagePickerController)memojiImagePickerController
{
  return self->_memojiImagePickerController;
}

- (void)setMemojiImagePickerController:(id)a3
{
  objc_storeStrong((id *)&self->_memojiImagePickerController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memojiImagePickerController, 0);
  objc_storeStrong((id *)&self->_variantsManager, 0);
  objc_storeStrong((id *)&self->_memojiEditingManager, 0);
  objc_storeStrong((id *)&self->_contactImage, 0);
  objc_storeStrong((id *)&self->_wallpaperType, 0);
  objc_storeStrong((id *)&self->_editingContact, 0);
  objc_storeStrong((id *)&self->_imagePickerCustomBackgroundColor, 0);
  objc_storeStrong((id *)&self->_imagePicker, 0);
  objc_storeStrong((id *)&self->_avatarPreviewView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageData, 0);
}

uint64_t __91__CNPosterSetupAvatarPreviewViewController_avatarEditingManager_didFinishWithProviderItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentPhotoFilterEditorForProviderItem:", *(_QWORD *)(a1 + 40));
}

uint64_t __92__CNPosterSetupAvatarPreviewViewController_imagePickerController_didFinishWithProviderItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentPhotoFilterEditorForProviderItem:", *(_QWORD *)(a1 + 40));
}

CNPhotoPickerColorVariant *__92__CNPosterSetupAvatarPreviewViewController_monogramProviderItemForInitials_backgroundColor___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  CNPhotoPickerColorVariant *v3;
  void *v4;
  void *v5;
  CNPhotoPickerColorVariant *v6;

  v2 = a2;
  v3 = [CNPhotoPickerColorVariant alloc];
  objc_msgSend(v2, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[CNPhotoPickerColorVariant initWithColor:named:](v3, "initWithColor:named:", v4, v5);
  return v6;
}

void __98__CNPosterSetupAvatarPreviewViewController_animojiProviderItemForAvatarImageData_backgroundColor___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v12;
  double *v13;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v12 = a2;
  v13 = *(double **)(*(_QWORD *)(a1 + 40) + 8);
  v13[4] = a3;
  v13[5] = a4;
  v13[6] = a5;
  v13[7] = a6;

}

void __112__CNPosterSetupAvatarPreviewViewController_photoProviderItemForSnapshotFromPosterConfiguration_completionBlock___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "providerItemWithSnapshotImage:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __112__CNPosterSetupAvatarPreviewViewController_photoProviderItemForSnapshotFromPosterConfiguration_completionBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3)
  {
    objc_msgSend(a3, "snapshotBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "levelSets");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "snapshotForLevelSet:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __112__CNPosterSetupAvatarPreviewViewController_photoProviderItemForSnapshotFromPosterConfiguration_completionBlock___block_invoke_2_36;
      v18[3] = &unk_1E204F098;
      v18[4] = *(_QWORD *)(a1 + 40);
      v12 = v10;
      v19 = v12;
      v20 = *(id *)(a1 + 48);
      objc_msgSend(v11, "performBlock:", v18);

    }
    else
    {
      CNUILogPosters();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18AC56000, v15, OS_LOG_TYPE_ERROR, "Snapshot of poster returned nil", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __112__CNPosterSetupAvatarPreviewViewController_photoProviderItemForSnapshotFromPosterConfiguration_completionBlock___block_invoke_35;
      v21[3] = &unk_1E204FB40;
      v22 = *(id *)(a1 + 48);
      objc_msgSend(v16, "performBlock:", v21);

      v12 = 0;
    }
  }
  else
  {
    CNUILogPosters();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "localizedDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v17;
      _os_log_error_impl(&dword_18AC56000, v13, OS_LOG_TYPE_ERROR, "Failed to snapshot poster with error: %@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __112__CNPosterSetupAvatarPreviewViewController_photoProviderItemForSnapshotFromPosterConfiguration_completionBlock___block_invoke_34;
    v23[3] = &unk_1E204FB40;
    v24 = *(id *)(a1 + 48);
    objc_msgSend(v14, "performBlock:", v23);

    v12 = v24;
  }

}

uint64_t __112__CNPosterSetupAvatarPreviewViewController_photoProviderItemForSnapshotFromPosterConfiguration_completionBlock___block_invoke_34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __112__CNPosterSetupAvatarPreviewViewController_photoProviderItemForSnapshotFromPosterConfiguration_completionBlock___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __112__CNPosterSetupAvatarPreviewViewController_photoProviderItemForSnapshotFromPosterConfiguration_completionBlock___block_invoke_2_36(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "providerItemWithSnapshotImage:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __90__CNPosterSetupAvatarPreviewViewController_initWithPosterConfiguration_forEditingContact___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __90__CNPosterSetupAvatarPreviewViewController_initWithPosterConfiguration_forEditingContact___block_invoke_2;
  v3[3] = &unk_1E204C378;
  objc_copyWeak(&v4, (id *)(a1 + 48));
  objc_msgSend(v1, "photoPickerProviderItemFromPosterConfiguration:completionBlock:", v2, v3);
  objc_destroyWeak(&v4);
}

void __90__CNPosterSetupAvatarPreviewViewController_initWithPosterConfiguration_forEditingContact___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "generateAllImageDatasIfNeeded");
  objc_initWeak(&location, WeakRetained);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__CNPosterSetupAvatarPreviewViewController_initWithPosterConfiguration_forEditingContact___block_invoke_3;
  block[3] = &unk_1E204F910;
  objc_copyWeak(&v8, &location);
  v7 = v3;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __90__CNPosterSetupAvatarPreviewViewController_initWithPosterConfiguration_forEditingContact___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "updateWithProviderItem:", *(_QWORD *)(a1 + 32));

}

+ (unint64_t)defaultImageTypeForWallpaperType:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C97180]) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C97188]))
  {
    v4 = 2;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

+ (CGSize)defaultItemSize
{
  double v2;
  double v3;
  CGSize result;

  +[CNVisualIdentityPickerViewController defaultItemSize](CNVisualIdentityPickerViewController, "defaultItemSize");
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)twentyFourPointFivePercentOfHeight:(double)a3
{
  return a3 * 0.245000005;
}

@end
