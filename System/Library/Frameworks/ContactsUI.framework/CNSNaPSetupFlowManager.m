@implementation CNSNaPSetupFlowManager

- (CNSNaPSetupFlowManager)initWithBaseViewController:(id)a3 contactStore:(id)a4 mode:(int64_t)a5
{
  return -[CNSNaPSetupFlowManager initWithBaseViewController:contactStore:mode:presenterDelegate:](self, "initWithBaseViewController:contactStore:mode:presenterDelegate:", a3, a4, a5, 0);
}

- (CNSNaPSetupFlowManager)initWithPresenterDelegate:(id)a3 contactStore:(id)a4 mode:(int64_t)a5
{
  return -[CNSNaPSetupFlowManager initWithBaseViewController:contactStore:mode:presenterDelegate:](self, "initWithBaseViewController:contactStore:mode:presenterDelegate:", 0, a4, a5, a3);
}

- (CNSNaPSetupFlowManager)initWithBaseViewController:(id)a3 contactStore:(id)a4 mode:(int64_t)a5 presenterDelegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  CNSNaPSetupFlowManager *v14;
  CNSNaPSetupFlowManager *v15;
  CNMeCardSharingEditAvatarFlowManager *v16;
  CNMeCardSharingEditAvatarFlowManager *avatarEditFlowManager;
  CNVisualIdentityImagePickerController *v18;
  CNVisualIdentityImagePickerController *imagePickerController;
  void *v20;
  uint64_t v21;
  CNScheduler *providerItemRenderingQueue;
  void *v23;
  uint64_t v24;
  CNScheduler *providerItemCallbackQueue;
  CNPRUISPosterSnapshotController *v26;
  CNPRUISPosterSnapshotController *snapshotController;
  void *v28;
  uint64_t v29;
  int64_t v30;
  _TtC10ContactsUI22PosterEditFlowReporter *v31;
  _TtC10ContactsUI22PosterEditFlowReporter *editFlowReporter;
  CNSNaPSetupFlowManager *v33;
  objc_super v35;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v35.receiver = self;
  v35.super_class = (Class)CNSNaPSetupFlowManager;
  v14 = -[CNSNaPSetupFlowManager initWithNibName:bundle:](&v35, sel_initWithNibName_bundle_, 0, 0);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_baseViewController, a3);
    objc_storeWeak((id *)&v15->_presenterDelegate, v13);
    objc_storeStrong((id *)&v15->_contactStore, a4);
    v16 = objc_alloc_init(CNMeCardSharingEditAvatarFlowManager);
    avatarEditFlowManager = v15->_avatarEditFlowManager;
    v15->_avatarEditFlowManager = v16;

    -[CNMeCardSharingEditAvatarFlowManager setDelegate:](v15->_avatarEditFlowManager, "setDelegate:", v15);
    v18 = objc_alloc_init(CNVisualIdentityImagePickerController);
    imagePickerController = v15->_imagePickerController;
    v15->_imagePickerController = v18;

    -[CNVisualIdentityImagePickerController setDelegate:](v15->_imagePickerController, "setDelegate:", v15);
    objc_msgSend(MEMORY[0x1E0D13B70], "defaultProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "newSerialSchedulerWithName:", CFSTR("com.apple.ContactsUI.sharedProfileSetup.providerItem.workQueue"));
    providerItemRenderingQueue = v15->_providerItemRenderingQueue;
    v15->_providerItemRenderingQueue = (CNScheduler *)v21;

    objc_msgSend(MEMORY[0x1E0D13B70], "defaultProvider");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "mainThreadScheduler");
    v24 = objc_claimAutoreleasedReturnValue();
    providerItemCallbackQueue = v15->_providerItemCallbackQueue;
    v15->_providerItemCallbackQueue = (CNScheduler *)v24;

    v26 = objc_alloc_init(CNPRUISPosterSnapshotController);
    snapshotController = v15->_snapshotController;
    v15->_snapshotController = v26;

    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "userInterfaceIdiom");

    if ((v29 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v30 = 0;
    else
      v30 = a5;
    v15->_mode = v30;
    v15->_editingState = 0;
    v31 = objc_alloc_init(_TtC10ContactsUI22PosterEditFlowReporter);
    editFlowReporter = v15->_editFlowReporter;
    v15->_editFlowReporter = v31;

    v33 = v15;
  }

  return v15;
}

- (void)setGalleryNavigationController:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_galleryNavigationController, a3);
  v5 = a3;
  -[CNSNaPSetupFlowManager avatarEditFlowManager](self, "avatarEditFlowManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBaseNavigationController:", v5);

}

- (int64_t)defaultModalPresentationStyle
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return -2;
  else
    return 0;
}

- (void)startEditFlowWithSNaPContact:(id)a3
{
  CNMutableContact **p_editingContact;
  id v6;
  CNVisualIdentity *v7;
  CNVisualIdentity *pendingVisualIdentity;
  void *v9;
  uint64_t v10;
  void *v11;
  _TtC10ContactsUI22PosterEditFlowReporter *editFlowReporter;
  void *v13;
  void *v14;
  id v15;

  p_editingContact = &self->_editingContact;
  objc_storeStrong((id *)&self->_editingContact, a3);
  v6 = a3;
  v7 = -[CNVisualIdentity initWithContact:]([CNVisualIdentity alloc], "initWithContact:", v6);
  pendingVisualIdentity = self->_pendingVisualIdentity;
  self->_pendingVisualIdentity = v7;

  objc_msgSend(MEMORY[0x1E0D13D40], "unifiedMeContactMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isMeContact:", v6);
  -[CNSNaPSetupFlowManager imagePickerController](self, "imagePickerController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIsMeContact:", v10);

  editFlowReporter = self->_editFlowReporter;
  -[CNSNaPSetupFlowManager imagePickerController](self, "imagePickerController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PosterEditFlowReporter startingFromSNAPWithMeCard:](editFlowReporter, "startingFromSNAPWithMeCard:", objc_msgSend(v13, "isMeContact"));

  -[CNSNaPSetupFlowManager posterEditOptionsNavigationControllerForContact:](self, "posterEditOptionsNavigationControllerForContact:", *p_editingContact);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager setPosterEditOptionsNavigationController:](self, "setPosterEditOptionsNavigationController:", v14);

  -[CNPRUISPosterSnapshotController acquireKeepActiveAssertionForReason:](self->_snapshotController, "acquireKeepActiveAssertionForReason:", CFSTR("CNMeCardSharingEditPosterAvatarFlowManager"));
  -[CNSNaPSetupFlowManager posterEditOptionsNavigationController](self, "posterEditOptionsNavigationController");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager presentNavigationController:](self, "presentNavigationController:", v15);

}

- (void)startContactCardFlowForContact:(id)a3 isEditing:(BOOL)a4
{
  _BOOL8 v4;
  CNVisualIdentity *v7;
  CNVisualIdentity *pendingVisualIdentity;
  _TtC10ContactsUI22PosterEditFlowReporter *editFlowReporter;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  v4 = a4;
  v23 = a3;
  objc_storeStrong((id *)&self->_editingContact, a3);
  v7 = -[CNVisualIdentity initWithContact:]([CNVisualIdentity alloc], "initWithContact:", v23);
  pendingVisualIdentity = self->_pendingVisualIdentity;
  self->_pendingVisualIdentity = v7;

  self->_isEditingContactCard = 1;
  -[CNPRUISPosterSnapshotController acquireKeepActiveAssertionForReason:](self->_snapshotController, "acquireKeepActiveAssertionForReason:", CFSTR("CNMeCardSharingEditPosterAvatarFlowManager"));
  editFlowReporter = self->_editFlowReporter;
  -[CNSNaPSetupFlowManager imagePickerController](self, "imagePickerController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PosterEditFlowReporter startingFromContactsWithMeCard:isEditing:](editFlowReporter, "startingFromContactsWithMeCard:isEditing:", objc_msgSend(v10, "isMeContact"), v4);

  v11 = *MEMORY[0x1E0D13818];
  objc_msgSend(v23, "imageData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!(*(unsigned int (**)(uint64_t, void *))(v11 + 16))(v11, v12))
    goto LABEL_6;
  objc_msgSend(v23, "wallpaper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "posterArchiveData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(uint64_t, void *))(v11 + 16))(v11, v14) & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  objc_msgSend(v23, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[CNSNaPSetupFlowManager recentAvatarsCountForContactIdentifier:](self, "recentAvatarsCountForContactIdentifier:", v15);

  if (!v16)
  {
    -[CNSNaPSetupFlowManager wallpaperGalleryNavigationController](self, "wallpaperGalleryNavigationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSNaPSetupFlowManager setGalleryNavigationController:](self, "setGalleryNavigationController:", v17);

    -[CNSNaPSetupFlowManager galleryNavigationController](self, "galleryNavigationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSNaPSetupFlowManager presentNavigationController:](self, "presentNavigationController:", v18);

    -[CNSNaPSetupFlowManager setIsCreatingNewAvatar:](self, "setIsCreatingNewAvatar:", 1);
    goto LABEL_10;
  }
LABEL_7:
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "userInterfaceIdiom");

  if ((v20 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    -[CNSNaPSetupFlowManager setMode:](self, "setMode:", 1);
  -[CNSNaPSetupFlowManager posterEditOptionsNavigationControllerForContact:](self, "posterEditOptionsNavigationControllerForContact:", self->_editingContact);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager setPosterEditOptionsNavigationController:](self, "setPosterEditOptionsNavigationController:", v21);

  -[CNSNaPSetupFlowManager posterEditOptionsNavigationController](self, "posterEditOptionsNavigationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager presentNavigationController:](self, "presentNavigationController:", v22);

LABEL_10:
}

- (void)startOnboardingFlowWithNicknameContact:(id)a3 meContact:(id)a4
{
  _BOOL8 v7;
  id v8;
  id v9;
  id v10;
  CNMutableContact *v11;
  CNMutableContact *editingContact;
  CNVisualIdentity *v13;
  CNVisualIdentity *pendingVisualIdentity;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _TtC10ContactsUI22PosterEditFlowReporter *editFlowReporter;
  void *v22;
  void *v23;
  id v24;

  v7 = a3 != 0;
  if (a3)
    v8 = a3;
  else
    v8 = a4;
  self->_isOnboarding = 1;
  v9 = v8;
  v10 = a4;
  v24 = a3;
  v11 = (CNMutableContact *)objc_msgSend(v10, "mutableCopy");
  editingContact = self->_editingContact;
  self->_editingContact = v11;

  v13 = -[CNVisualIdentity initWithContact:]([CNVisualIdentity alloc], "initWithContact:", v9);
  pendingVisualIdentity = self->_pendingVisualIdentity;
  self->_pendingVisualIdentity = v13;

  +[CNAvatarPosterCarouselEditingContext contextForCreateNew](CNAvatarPosterCarouselEditingContext, "contextForCreateNew");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager setAvatarPosterEditingContext:](self, "setAvatarPosterEditingContext:", v15);

  objc_msgSend(MEMORY[0x1E0D13D40], "unifiedMeContactMonitor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isMeContact:", v10);
  -[CNSNaPSetupFlowManager imagePickerController](self, "imagePickerController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setIsMeContact:", v17);

  v19 = (void *)objc_msgSend(v9, "mutableCopy");
  -[CNSNaPSetupFlowManager posterOnboardingWelcomeNavigationControllerForContact:hasOptionToSkip:hasExistingNickname:](self, "posterOnboardingWelcomeNavigationControllerForContact:hasOptionToSkip:hasExistingNickname:", v19, 1, v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager setOnboardingWelcomeNavigationController:](self, "setOnboardingWelcomeNavigationController:", v20);

  -[CNPRUISPosterSnapshotController acquireKeepActiveAssertionForReason:](self->_snapshotController, "acquireKeepActiveAssertionForReason:", CFSTR("CNMeCardSharingEditPosterAvatarFlowManager"));
  editFlowReporter = self->_editFlowReporter;
  -[CNSNaPSetupFlowManager imagePickerController](self, "imagePickerController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PosterEditFlowReporter startingFromOnboardingWithMeCard:](editFlowReporter, "startingFromOnboardingWithMeCard:", objc_msgSend(v22, "isMeContact"));

  -[CNSNaPSetupFlowManager onboardingWelcomeNavigationController](self, "onboardingWelcomeNavigationController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager presentNavigationController:](self, "presentNavigationController:", v23);

}

- (void)presentNavigationController:(id)a3
{
  id v4;
  UIViewController *baseViewController;
  id WeakRetained;
  void *v7;
  id v8;

  v4 = a3;
  baseViewController = self->_baseViewController;
  v8 = v4;
  if (baseViewController)
  {
    -[UIViewController presentViewController:animated:completion:](baseViewController, "presentViewController:animated:completion:", v4, 1, 0);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_presenterDelegate);

    if (WeakRetained)
    {
      -[CNSNaPSetupFlowManager presenterDelegate](self, "presenterDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sender:presentViewController:", self, v8);

    }
  }

}

- (void)dismissOnboardingIfNeeded
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[CNSNaPSetupFlowManager onboardingWelcomeNavigationController](self, "onboardingWelcomeNavigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18AC56000, v4, OS_LOG_TYPE_DEFAULT, "Dismissing onboarding if needed", v6, 2u);
    }

    -[CNSNaPSetupFlowManager onboardingWelcomeNavigationController](self, "onboardingWelcomeNavigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)dismissNavigationController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  UIViewController *baseViewController;
  id WeakRetained;
  void *v11;
  id v12;

  v6 = a4;
  v12 = a3;
  v8 = a5;
  -[CNPRUISPosterSnapshotController releaseKeepActiveAssertionForReason:](self->_snapshotController, "releaseKeepActiveAssertionForReason:", CFSTR("CNMeCardSharingEditPosterAvatarFlowManager"));
  baseViewController = self->_baseViewController;
  if (baseViewController)
  {
    -[UIViewController dismissViewControllerAnimated:completion:](baseViewController, "dismissViewControllerAnimated:completion:", v6, v8);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_presenterDelegate);

    if (WeakRetained)
    {
      -[CNSNaPSetupFlowManager presenterDelegate](self, "presenterDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sender:dismissViewController:", self, v12);

    }
  }

}

- (void)dismissViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a5;
  -[CNPRUISPosterSnapshotController releaseKeepActiveAssertionForReason:](self->_snapshotController, "releaseKeepActiveAssertionForReason:", CFSTR("CNMeCardSharingEditPosterAvatarFlowManager"));
  if (v7)
    v8 = (void (**)(_QWORD))_Block_copy(v7);
  else
    v8 = (void (**)(_QWORD))&__block_literal_global_172;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presenterDelegate);

  if (WeakRetained)
  {
    -[CNSNaPSetupFlowManager presenterDelegate](self, "presenterDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sender:dismissViewController:completionHandler:", self, v13, v8);

  }
  else
  {
    objc_msgSend(v13, "presentingViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v13, "presentingViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 0, v8);

    }
    else
    {
      v8[2](v8);
    }
  }

}

- (void)submitAndResetFlowReporter
{
  _TtC10ContactsUI22PosterEditFlowReporter *v3;
  _TtC10ContactsUI22PosterEditFlowReporter *editFlowReporter;

  -[PosterEditFlowReporter didFinish](self->_editFlowReporter, "didFinish");
  v3 = objc_alloc_init(_TtC10ContactsUI22PosterEditFlowReporter);
  editFlowReporter = self->_editFlowReporter;
  self->_editFlowReporter = v3;

}

- (id)posterOnboardingWelcomeNavigationControllerForContact:(id)a3 hasOptionToSkip:(BOOL)a4 hasExistingNickname:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  CNPosterOnboardingWelcomeViewController *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  CNPhotoPickerNavigationViewController *v14;
  uint64_t v15;
  _QWORD v17[5];
  CNPosterOnboardingWelcomeViewController *v18;
  _QWORD v19[5];

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = -[CNPosterOnboardingWelcomeViewController initWithContact:]([CNPosterOnboardingWelcomeViewController alloc], "initWithContact:", v8);

  -[CNPosterOnboardingWelcomeViewController setHasOptionToSkip:](v9, "setHasOptionToSkip:", v6);
  -[CNPosterOnboardingWelcomeViewController setHasExistingNickname:](v9, "setHasExistingNickname:", v5);
  -[CNPosterOnboardingWelcomeViewController setDelegate:](v9, "setDelegate:", self);
  +[CNVisualIdentityPickerViewController defaultContentSize](CNPhotoPickerViewController, "defaultContentSize");
  -[CNPosterOnboardingWelcomeViewController setPreferredContentSize:](v9, "setPreferredContentSize:");
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "featureFlags");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isFeatureEnabled:", 14))
  {

    goto LABEL_5;
  }
  v12 = -[CNSNaPSetupFlowManager multiplePhoneNumbersTiedToAppleID](self, "multiplePhoneNumbersTiedToAppleID");

  if (!v12)
  {
LABEL_5:
    v14 = -[CNPhotoPickerNavigationViewController initWithRootViewController:]([CNPhotoPickerNavigationViewController alloc], "initWithRootViewController:", v9);
    -[CNPhotoPickerNavigationViewController setAllowRotation:](v14, "setAllowRotation:", 0);
    -[CNPhotoPickerNavigationViewController setModalPresentationStyle:](v14, "setModalPresentationStyle:", -[CNSNaPSetupFlowManager defaultModalPresentationStyle](self, "defaultModalPresentationStyle"));
    goto LABEL_6;
  }
  v13 = (void *)objc_opt_new();
  v14 = -[CNPhotoPickerNavigationViewController initWithRootViewController:]([CNPhotoPickerNavigationViewController alloc], "initWithRootViewController:", v13);
  -[CNPhotoPickerNavigationViewController setAllowRotation:](v14, "setAllowRotation:", 0);
  -[CNPhotoPickerNavigationViewController setModalPresentationStyle:](v14, "setModalPresentationStyle:", -[CNSNaPSetupFlowManager defaultModalPresentationStyle](self, "defaultModalPresentationStyle"));
  v15 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __116__CNSNaPSetupFlowManager_posterOnboardingWelcomeNavigationControllerForContact_hasOptionToSkip_hasExistingNickname___block_invoke;
  v19[3] = &unk_1E2048F40;
  v19[4] = self;
  objc_msgSend(v13, "setOnCancel:", v19);
  v17[0] = v15;
  v17[1] = 3221225472;
  v17[2] = __116__CNSNaPSetupFlowManager_posterOnboardingWelcomeNavigationControllerForContact_hasOptionToSkip_hasExistingNickname___block_invoke_179;
  v17[3] = &unk_1E2048F68;
  v17[4] = self;
  v18 = v9;
  objc_msgSend(v13, "setOnContinue:", v17);

LABEL_6:
  return v14;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v7;

  if (-[CNSNaPSetupFlowManager isOnboarding](self, "isOnboarding"))
    -[CNSNaPSetupFlowManager dismissOnboardingIfNeeded](self, "dismissOnboardingIfNeeded");
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1 && !-[CNSNaPSetupFlowManager isEditingContactCard](self, "isEditingContactCard"))
  {
    -[CNSNaPSetupFlowManager posterEditOptionsNavigationController](self, "posterEditOptionsNavigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      -[CNSNaPSetupFlowManager dismissPosterEditingFlow](self, "dismissPosterEditingFlow");
  }
  v7.receiver = self;
  v7.super_class = (Class)CNSNaPSetupFlowManager;
  -[CNSNaPSetupFlowManager dealloc](&v7, sel_dealloc);
}

- (id)posterEditOptionsNavigationControllerForContact:(id)a3
{
  id v4;
  CNPosterEditOptionsViewController *v5;
  CNPhotoPickerNavigationViewController *v6;

  v4 = a3;
  v5 = -[CNPosterEditOptionsViewController initWithContact:mode:]([CNPosterEditOptionsViewController alloc], "initWithContact:mode:", v4, -[CNSNaPSetupFlowManager mode](self, "mode"));

  -[CNPosterEditOptionsViewController setDelegate:](v5, "setDelegate:", self);
  +[CNVisualIdentityPickerViewController defaultContentSize](CNPhotoPickerViewController, "defaultContentSize");
  -[CNPosterEditOptionsViewController setPreferredContentSize:](v5, "setPreferredContentSize:");
  v6 = -[CNPhotoPickerNavigationViewController initWithRootViewController:]([CNPhotoPickerNavigationViewController alloc], "initWithRootViewController:", v5);
  -[CNPhotoPickerNavigationViewController setAllowRotation:](v6, "setAllowRotation:", 0);
  -[CNPhotoPickerNavigationViewController setModalPresentationStyle:](v6, "setModalPresentationStyle:", -[CNSNaPSetupFlowManager defaultModalPresentationStyle](self, "defaultModalPresentationStyle"));

  return v6;
}

- (id)wallpaperGalleryNavigationController
{
  return -[CNSNaPSetupFlowManager wallpaperGalleryNavigationControllerForMode:](self, "wallpaperGalleryNavigationControllerForMode:", -[CNSNaPSetupFlowManager mode](self, "mode"));
}

- (id)wallpaperGalleryNavigationControllerForMode:(int64_t)a3
{
  CNSNaPSuggestionsGalleryViewController *v5;
  void *v6;
  CNSNaPSuggestionsGalleryViewController *v7;
  CNPhotoPickerNavigationViewController *v8;

  v5 = [CNSNaPSuggestionsGalleryViewController alloc];
  -[CNSNaPSetupFlowManager editingContact](self, "editingContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNSNaPSuggestionsGalleryViewController initWithMode:contact:isEditingSNaP:isOnboarding:](v5, "initWithMode:contact:isEditingSNaP:isOnboarding:", a3, v6, -[CNSNaPSetupFlowManager isEditingContactCard](self, "isEditingContactCard") ^ 1, -[CNSNaPSetupFlowManager isOnboarding](self, "isOnboarding"));

  -[CNSNaPSuggestionsGalleryViewController setDelegate:](v7, "setDelegate:", self);
  +[CNVisualIdentityPickerViewController defaultContentSize](CNPhotoPickerViewController, "defaultContentSize");
  -[CNSNaPSuggestionsGalleryViewController setPreferredContentSize:](v7, "setPreferredContentSize:");
  v8 = -[CNPhotoPickerNavigationViewController initWithRootViewController:]([CNPhotoPickerNavigationViewController alloc], "initWithRootViewController:", v7);
  -[CNPhotoPickerNavigationViewController setAllowRotation:](v8, "setAllowRotation:", 0);
  -[CNPhotoPickerNavigationViewController setModalPresentationStyle:](v8, "setModalPresentationStyle:", -[CNSNaPSetupFlowManager defaultModalPresentationStyle](self, "defaultModalPresentationStyle"));

  return v8;
}

- (id)posterPreviewControllerWithPosterConfiguration:(id)a3 providerItem:(id)a4 mode:(int64_t)a5
{
  id v7;
  id v8;
  CNPosterPreviewViewController *v9;
  void *v10;
  CNPosterPreviewViewController *v11;

  v7 = a4;
  v8 = a3;
  v9 = [CNPosterPreviewViewController alloc];
  -[CNSNaPSetupFlowManager editingContact](self, "editingContact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CNPosterPreviewViewController initWithPosterConfiguration:fromProviderItem:contact:editingState:isEditingSNaP:](v9, "initWithPosterConfiguration:fromProviderItem:contact:editingState:isEditingSNaP:", v8, v7, v10, -[CNSNaPSetupFlowManager editingState](self, "editingState"), -[CNSNaPSetupFlowManager isEditingContactCard](self, "isEditingContactCard") ^ 1);

  -[CNPosterPreviewViewController setDelegate:](v11, "setDelegate:", self);
  return v11;
}

- (id)sharingSettingsViewControllerForOnboarding
{
  CNMeCardSharingContactNameProvider *v3;
  CNMeCardSharingContactAvatarProvider *v4;
  CNMeCardSharingSettingsViewController *v5;
  void *v6;
  id v7;
  uint64_t v9;

  v3 = -[CNMeCardSharingContactNameProvider initWithContact:]([CNMeCardSharingContactNameProvider alloc], "initWithContact:", self->_editingContact);
  v4 = -[CNMeCardSharingContactAvatarProvider initWithContact:]([CNMeCardSharingContactAvatarProvider alloc], "initWithContact:", self->_editingContact);
  v5 = [CNMeCardSharingSettingsViewController alloc];
  -[CNSNaPSetupFlowManager contactStore](self, "contactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = 1;
  v7 = -[CNMeCardSharingSettingsViewController initForOnboardingWithContactStore:contact:avatarProvider:nameProvider:sharingEnabled:selectedSharingAudience:showsWallpaperSuggestionsGalleryPicker:headerMode:](v5, "initForOnboardingWithContactStore:contact:avatarProvider:nameProvider:sharingEnabled:selectedSharingAudience:showsWallpaperSuggestionsGalleryPicker:headerMode:", v6, self->_editingContact, v4, v3, 1, 1, v9, -[CNSNaPSetupFlowManager mode](self, "mode"));

  return v7;
}

- (void)updateEditingContactWithVisualIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[CNSNaPSetupFlowManager validateAndUpdateAvatarDataForVisualIdentity:](self, "validateAndUpdateAvatarDataForVisualIdentity:", v4);
  -[CNSNaPSetupFlowManager editingContact](self, "editingContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateImageForContact:", v5);

  objc_msgSend(v4, "contacts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "givenName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager editingContact](self, "editingContact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGivenName:", v7);

  objc_msgSend(v11, "familyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager editingContact](self, "editingContact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFamilyName:", v9);

}

- (void)validateAndUpdateAvatarDataForVisualIdentity:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "imageData");
  v4 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "thumbnailImageData");
  v5 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "fullscreenImageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!(v4 | v5))
  {
    objc_msgSend(v3, "clearImage");
    goto LABEL_16;
  }
  if (v4)
  {
    if (v5)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "imageType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v8;

    }
    objc_msgSend(v3, "thumbnailImageData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setImageData:", v9);

    objc_msgSend(v3, "setCropRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    if (v5)
    {
LABEL_4:
      if (v6)
        goto LABEL_16;
      goto LABEL_13;
    }
  }
  objc_msgSend((id)objc_opt_class(), "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "imageType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412290;
    v18 = v11;

  }
  objc_msgSend(v3, "imageData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cropRect");
  CNImageUtilsCroppedImageDataFromFullSizeImageData();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setThumbnailImageData:", v13);

  if (!v6)
  {
LABEL_13:
    objc_msgSend((id)objc_opt_class(), "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "imageType");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v15;

    }
    objc_msgSend(v3, "imageData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFullscreenImageData:", v16);

  }
LABEL_16:

}

- (void)posterEditOptionsViewController:(id)a3 didSelectEditAvatarWithContext:(id)a4
{
  _TtC10ContactsUI22PosterEditFlowReporter *editFlowReporter;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  editFlowReporter = self->_editFlowReporter;
  v7 = a4;
  v8 = a3;
  -[PosterEditFlowReporter willEditAvatar](editFlowReporter, "willEditAvatar");
  -[CNSNaPSetupFlowManager setAvatarPosterEditingContext:](self, "setAvatarPosterEditingContext:", v7);
  objc_msgSend(v7, "existingAvatar");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager updateEditingStateForAction:](self, "updateEditingStateForAction:", 0);
  objc_msgSend(v7, "existingPoster");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNSNaPSetupFlowManager updatePendingVisualIdentityWithAvatar:contactPoster:viewController:](self, "updatePendingVisualIdentityWithAvatar:contactPoster:viewController:", v11, v9, v8);
  objc_msgSend(v8, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNSNaPSetupFlowManager editAvatar:inView:](self, "editAvatar:inView:", v11, v10);
}

- (void)editAvatar:(id)a3 inView:(id)a4
{
  id v6;
  uint64_t v7;
  CNPosterSetupAvatarPreviewViewController *v8;
  void *v9;
  CNPosterSetupAvatarPreviewViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  if (-[CNSNaPSetupFlowManager shouldShowItemEditorForContactImage:](self, "shouldShowItemEditorForContactImage:", v16))
  {
    v7 = objc_msgSend(v16, "source");
    if ((unint64_t)(v7 - 3) < 2 || v7 == 1)
    {
      -[CNSNaPSetupFlowManager providerItemForRecentAvatar:inView:](self, "providerItemForRecentAvatar:inView:", v16, v6);
      v10 = (CNPosterSetupAvatarPreviewViewController *)objc_claimAutoreleasedReturnValue();
      -[CNSNaPSetupFlowManager posterEditOptionsNavigationController](self, "posterEditOptionsNavigationController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNSNaPSetupFlowManager avatarEditFlowManager](self, "avatarEditFlowManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setBaseNavigationController:", v13);

      -[CNSNaPSetupFlowManager avatarEditFlowManager](self, "avatarEditFlowManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "presentAvatarEditorViewControllerForProviderItem:", v10);

      goto LABEL_8;
    }
    if (v7 == 2)
    {
      v8 = [CNPosterSetupAvatarPreviewViewController alloc];
      -[CNSNaPSetupFlowManager editingContact](self, "editingContact");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[CNPosterSetupAvatarPreviewViewController initWithContactImage:imageType:forEditingContact:](v8, "initWithContactImage:imageType:forEditingContact:", v16, 1, v9);

      -[CNPosterSetupAvatarPreviewViewController setDelegate:](v10, "setDelegate:", self);
      -[CNPosterSetupAvatarPreviewViewController setHideSkipOption:](v10, "setHideSkipOption:", 1);
      -[CNPosterSetupAvatarPreviewViewController setShouldShowCancelButton:](v10, "setShouldShowCancelButton:", 1);
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v10);
      objc_msgSend(v11, "setModalPresentationStyle:", -[CNSNaPSetupFlowManager defaultModalPresentationStyle](self, "defaultModalPresentationStyle"));
      -[CNSNaPSetupFlowManager posterEditOptionsNavigationController](self, "posterEditOptionsNavigationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "presentViewController:animated:completion:", v11, 1, 0);

LABEL_8:
      goto LABEL_9;
    }
  }
  -[CNSNaPSetupFlowManager presentCreateNewAvatarViewController](self, "presentCreateNewAvatarViewController");
LABEL_9:

}

- (BOOL)shouldShowItemEditorForContactImage:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "source");
  if (v4 == 3)
  {
    objc_msgSend(v3, "variant");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = v6 != 0;
  }
  else
  {
    if (v4 != 2)
    {
      LOBYTE(v7) = 1;
      goto LABEL_7;
    }
    v5 = *MEMORY[0x1E0D13818];
    objc_msgSend(v3, "imageData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6) ^ 1;
  }

LABEL_7:
  return v7;
}

- (void)posterEditOptionsViewController:(id)a3 didEditPosterWithContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[CNSNaPSetupFlowManager setAvatarPosterEditingContext:](self, "setAvatarPosterEditingContext:", v6);
  objc_msgSend(v6, "pendingPosterEdit");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager updateEditingStateForAction:](self, "updateEditingStateForAction:", 1);
  objc_msgSend(v6, "existingAvatar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNSNaPSetupFlowManager updatePendingVisualIdentityWithAvatar:pendingPosterEdit:viewController:](self, "updatePendingVisualIdentityWithAvatar:pendingPosterEdit:viewController:", v8, v12, v7);
  if (v12)
  {
    -[CNSNaPSetupFlowManager previewPendingPoster:](self, "previewPendingPoster:");
  }
  else
  {
    -[CNSNaPSetupFlowManager wallpaperGalleryNavigationControllerForMode:](self, "wallpaperGalleryNavigationControllerForMode:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSNaPSetupFlowManager setGalleryNavigationController:](self, "setGalleryNavigationController:", v9);

    -[CNSNaPSetupFlowManager posterEditOptionsNavigationController](self, "posterEditOptionsNavigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSNaPSetupFlowManager galleryNavigationController](self, "galleryNavigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presentViewController:animated:completion:", v11, 1, 0);

  }
}

- (void)previewPendingPoster:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "posterConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "posterConfiguration");
  }
  else
  {
    objc_msgSend(v4, "contactPoster");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "posterData");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    +[CNPRSPosterArchiver unarchiveCNConfigurationFromData:error:](CNPRSPosterArchiver, "unarchiveCNConfigurationFromData:error:", v4, 0);
  }
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[CNSNaPSetupFlowManager posterPreviewControllerWithPosterConfiguration:providerItem:mode:](self, "posterPreviewControllerWithPosterConfiguration:providerItem:mode:", v9, 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager posterEditOptionsNavigationController](self, "posterEditOptionsNavigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pushViewController:animated:", v7, 1);

}

- (void)posterEditOptionsViewControllerDidSelectCreateNew:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PosterEditFlowReporter willEditCreatingNew](self->_editFlowReporter, "willEditCreatingNew", a3);
  -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearImageAndWallpaper");

  -[CNSNaPSetupFlowManager wallpaperGalleryNavigationController](self, "wallpaperGalleryNavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager setGalleryNavigationController:](self, "setGalleryNavigationController:", v5);

  +[CNAvatarPosterCarouselEditingContext contextForCreateNew](CNAvatarPosterCarouselEditingContext, "contextForCreateNew");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager setAvatarPosterEditingContext:](self, "setAvatarPosterEditingContext:", v6);

  -[CNSNaPSetupFlowManager posterEditOptionsNavigationController](self, "posterEditOptionsNavigationController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager galleryNavigationController](self, "galleryNavigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)posterEditOptionsViewController:(id)a3 didSelectAvatar:(id)a4 poster:(id)a5
{
  -[CNSNaPSetupFlowManager updatePendingVisualIdentityWithAvatar:contactPoster:viewController:](self, "updatePendingVisualIdentityWithAvatar:contactPoster:viewController:", a4, a5, a3);
  -[CNSNaPSetupFlowManager finishFlowAndSaveAsRecent:](self, "finishFlowAndSaveAsRecent:", 0);
}

- (void)posterEditOptionsViewController:(id)a3 didLoadCurrentAvatar:(id)a4 poster:(id)a5 backedByRecents:(BOOL)a6
{
  _BOOL8 v6;
  id v9;

  v6 = a6;
  v9 = a5;
  -[CNSNaPSetupFlowManager setCurrentContactImage:](self, "setCurrentContactImage:", a4);
  -[CNSNaPSetupFlowManager setCurrentContactPoster:](self, "setCurrentContactPoster:", v9);

  -[CNSNaPSetupFlowManager setCurrentAvatarPosterPairIsBackedByRecents:](self, "setCurrentAvatarPosterPairIsBackedByRecents:", v6);
}

- (void)posterEditOptionsViewControllerDidDeleteCurrentPosterPair:(id)a3
{
  -[CNSNaPSetupFlowManager setCurrentContactImage:](self, "setCurrentContactImage:", 0);
  -[CNSNaPSetupFlowManager setCurrentContactPoster:](self, "setCurrentContactPoster:", 0);
  -[CNSNaPSetupFlowManager setCurrentAvatarPosterPairIsBackedByRecents:](self, "setCurrentAvatarPosterPairIsBackedByRecents:", 0);
}

- (void)posterEditOptionsViewControllerDidDeleteExistingPosterPair:(id)a3
{
  -[PosterEditFlowReporter didDelete](self->_editFlowReporter, "didDelete", a3);
}

- (void)updatePendingVisualIdentityWithAvatar:(id)a3 contactPoster:(id)a4 viewController:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  +[CNAvatarPosterCarouselPendingPosterEdit pendingEditFromContactPoster:](CNAvatarPosterCarouselPendingPosterEdit, "pendingEditFromContactPoster:", a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager updatePendingVisualIdentityWithAvatar:pendingPosterEdit:viewController:](self, "updatePendingVisualIdentityWithAvatar:pendingPosterEdit:viewController:", v9, v10, v8);

}

- (void)updatePendingVisualIdentityWithAvatar:(id)a3 pendingPosterEdit:(id)a4 viewController:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _BOOL8 v13;
  CNPhotoPickerRecentsProvider *v14;
  void *v15;
  CNPhotoPickerRecentsProvider *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v8 = a4;
  v9 = a5;
  -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clearImageAndWallpaper");

  objc_msgSend(v9, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "effectiveUserInterfaceLayoutDirection");
  if (v24)
  {
    v13 = v12 == 1;
    v14 = [CNPhotoPickerRecentsProvider alloc];
    -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[CNPhotoPickerRecentsProvider initWithVisualIdentity:](v14, "initWithVisualIdentity:", v15);

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scale");
    v19 = v18;
    -[CNSNaPSetupFlowManager providerItemRenderingQueue](self, "providerItemRenderingQueue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSNaPSetupFlowManager providerItemCallbackQueue](self, "providerItemCallbackQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerRecentsProvider providerItemForContactImage:size:scale:RTL:renderingQueue:callbackQueue:fallbackToDefaultItem:](v16, "providerItemForContactImage:size:scale:RTL:renderingQueue:callbackQueue:fallbackToDefaultItem:", v24, v13, v20, v21, 1, 250.0, 250.0, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "updateVisualIdentity:", v23);

  }
  if (v8)
    -[CNSNaPSetupFlowManager updateEditingContextWithPendingPoster:](self, "updateEditingContextWithPendingPoster:", v8);

}

- (void)updatePendingVisualIdentityWithWallpaper:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWallpaper:", v4);

}

- (void)posterEditOptionsViewControllerDidCancel:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;

  -[PosterEditFlowReporter didCancelFromCarousel](self->_editFlowReporter, "didCancelFromCarousel", a3);
  -[CNSNaPSetupFlowManager submitAndResetFlowReporter](self, "submitAndResetFlowReporter");
  -[CNSNaPSetupFlowManager posterEditOptionsNavigationController](self, "posterEditOptionsNavigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager dismissNavigationController:animated:completion:](self, "dismissNavigationController:animated:completion:", v4, 1, 0);

  -[CNSNaPSetupFlowManager cleanupTemporaryPosterData](self, "cleanupTemporaryPosterData");
  -[CNSNaPSetupFlowManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CNSNaPSetupFlowManager delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "avatarPosterEditorFromFlowManagerDidCancel:", self);

  }
}

- (void)posterPreviewViewController:(id)a3 didFinishWithPosterConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CNPosterSetupAvatarPreviewViewController *v9;
  void *v10;
  CNPosterSetupAvatarPreviewViewController *v11;
  void *v12;
  _QWORD v13[5];

  v6 = a3;
  v7 = a4;
  -[PosterEditFlowReporter didModifyPoster](self->_editFlowReporter, "didModifyPoster");
  -[CNSNaPSetupFlowManager updateEditingStateForAction:](self, "updateEditingStateForAction:", 1);
  +[CNAvatarPosterCarouselPendingPosterEdit pendingEditFromPosterConfiguration:](CNAvatarPosterCarouselPendingPosterEdit, "pendingEditFromPosterConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager updateEditingContextWithPendingPoster:](self, "updateEditingContextWithPendingPoster:", v8);

  if (-[CNSNaPSetupFlowManager editingState](self, "editingState") == 2)
  {
    v9 = [CNPosterSetupAvatarPreviewViewController alloc];
    -[CNSNaPSetupFlowManager editingContact](self, "editingContact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CNPosterSetupAvatarPreviewViewController initWithPosterConfiguration:forEditingContact:](v9, "initWithPosterConfiguration:forEditingContact:", v7, v10);

    -[CNPosterSetupAvatarPreviewViewController setDelegate:](v11, "setDelegate:", self);
    objc_msgSend(v6, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pushViewController:animated:", v11, 1);

  }
  else if (-[CNSNaPSetupFlowManager isOnboarding](self, "isOnboarding")
         || -[CNSNaPSetupFlowManager isEditingContactCard](self, "isEditingContactCard"))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __87__CNSNaPSetupFlowManager_posterPreviewViewController_didFinishWithPosterConfiguration___block_invoke;
    v13[3] = &unk_1E204F648;
    v13[4] = self;
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v13);
  }
  else
  {
    -[CNSNaPSetupFlowManager finishFlow](self, "finishFlow");
  }

}

- (void)posterPreviewViewControllerDidSelectCustomizeLater:(id)a3
{
  -[CNSNaPSetupFlowManager viewControllerDidSelectCustomizePosterLater:](self, "viewControllerDidSelectCustomizePosterLater:", a3);
  -[CNSNaPSetupFlowManager writeToDefaultsPosterSkippedIfNeeded](self, "writeToDefaultsPosterSkippedIfNeeded");
}

- (void)posterPreviewViewControllerDidSelectUseDifferentPoster:(id)a3
{
  id v4;
  CNSNaPSuggestionsGalleryViewController *v5;
  void *v6;
  void *v7;
  CNSNaPSuggestionsGalleryViewController *v8;

  v4 = a3;
  v5 = [CNSNaPSuggestionsGalleryViewController alloc];
  -[CNSNaPSetupFlowManager editingContact](self, "editingContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNSNaPSuggestionsGalleryViewController initWithMode:contact:isEditingSNaP:isOnboarding:](v5, "initWithMode:contact:isEditingSNaP:isOnboarding:", 1, v6, -[CNSNaPSetupFlowManager isEditingContactCard](self, "isEditingContactCard") ^ 1, -[CNSNaPSetupFlowManager isOnboarding](self, "isOnboarding"));

  -[CNSNaPSuggestionsGalleryViewController setDelegate:](v8, "setDelegate:", self);
  objc_msgSend(v4, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "pushViewController:animated:", v8, 1);
}

- (void)avatarPreviewViewControllerDidCancel:(id)a3
{
  -[CNSNaPSetupFlowManager updateEditingStateForRevertedAction:dismissingSetupFlow:](self, "updateEditingStateForRevertedAction:dismissingSetupFlow:", 0, 0);
}

- (void)viewControllerDidSelectCustomizePosterLater:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  -[PosterEditFlowReporter didSkipPoster](self->_editFlowReporter, "didSkipPoster");
  if (-[CNSNaPSetupFlowManager isOnboarding](self, "isOnboarding")
    || -[CNSNaPSetupFlowManager isEditingContactCard](self, "isEditingContactCard"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __70__CNSNaPSetupFlowManager_viewControllerDidSelectCustomizePosterLater___block_invoke;
    v5[3] = &unk_1E204F648;
    v5[4] = self;
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v5);
  }
  else
  {
    -[CNSNaPSetupFlowManager finishFlow](self, "finishFlow");
  }

}

- (void)writeToDefaultsPosterSkippedIfNeeded
{
  void *v3;
  void *v4;
  int v5;

  if (!-[CNSNaPSetupFlowManager isEditingContactCard](self, "isEditingContactCard")
    || (objc_msgSend(MEMORY[0x1E0D13D40], "unifiedMeContactMonitor"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        -[CNSNaPSetupFlowManager editingContact](self, "editingContact"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v3, "isMeContact:", v4),
        v4,
        v3,
        v5))
  {
    +[CNSharedProfileOnboardingController writeToDefaultsDidSkipPosterSetup:](CNSharedProfileOnboardingController, "writeToDefaultsDidSkipPosterSetup:", 1);
  }
}

- (void)updateEditingContextWithPendingPoster:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CNSNaPSetupFlowManager avatarPosterEditingContext](self, "avatarPosterEditingContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    +[CNAvatarPosterCarouselEditingContext contextForCreateNew](CNAvatarPosterCarouselEditingContext, "contextForCreateNew");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSNaPSetupFlowManager setAvatarPosterEditingContext:](self, "setAvatarPosterEditingContext:", v6);

  }
  -[CNSNaPSetupFlowManager avatarPosterEditingContext](self, "avatarPosterEditingContext");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPendingPosterEdit:", v4);

}

- (void)finishFlow
{
  -[CNSNaPSetupFlowManager finishFlowAndSaveAsRecent:](self, "finishFlowAndSaveAsRecent:", 1);
}

- (void)finishFlowAndSaveAsRecent:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
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
  id v18;
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
  char v33;
  void *v34;
  void *v35;
  _QWORD v36[5];

  v3 = a3;
  v5 = *MEMORY[0x1E0D13880];
  -[CNSNaPSetupFlowManager avatarPosterEditingContext](self, "avatarPosterEditingContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pendingWallpaperFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "result:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager updatePendingVisualIdentityWithWallpaper:](self, "updatePendingVisualIdentityWithWallpaper:", v9);

  -[CNSNaPSetupFlowManager avatarPosterEditingContext](self, "avatarPosterEditingContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pendingPosterEdit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "posterConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[CNSNaPSetupFlowManager currentAvatarPosterPairIsBackedByRecents](self, "currentAvatarPosterPairIsBackedByRecents"))-[CNSNaPSetupFlowManager saveCurrentVisualIdentityIfNeeded](self, "saveCurrentVisualIdentityIfNeeded");
  if (v3)
    -[CNSNaPSetupFlowManager saveRecentVisualIdentity](self, "saveRecentVisualIdentity");
  -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "wallpaper");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "wallpaper");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "posterArchiveData");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C97408], "reducedSizePosterArchiveDataFromData:posterConfiguration:", v35, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x1E0C97408]);
    -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "wallpaper");
    v20 = v12;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "metadata");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "wallpaper");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v18, "initWithPosterArchiveData:metadata:contentIsSensitive:", v17, v22, objc_msgSend(v24, "contentIsSensitive"));
    -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setWallpaper:", v25);

    v12 = v20;
  }
  -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity", v35);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager updateEditingContactWithVisualIdentity:](self, "updateEditingContactWithVisualIdentity:", v27);

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "likenessCarouselFingerprintCache");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager editingContact](self, "editingContact");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "removeObjectForContact:", v30);

  -[CNSNaPSetupFlowManager submitAndResetFlowReporter](self, "submitAndResetFlowReporter");
  -[CNSNaPSetupFlowManager cleanupTemporaryPosterData](self, "cleanupTemporaryPosterData");
  if (!self->_isOnboarding)
  {
    -[CNSNaPSetupFlowManager resetEditingState](self, "resetEditingState");
    -[CNSNaPSetupFlowManager delegate](self, "delegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_opt_respondsToSelector();

    if ((v33 & 1) != 0)
    {
      -[CNMutableContact wallpaper](self->_editingContact, "wallpaper");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        -[CNSNaPSetupFlowManager editingContact](self, "editingContact");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __52__CNSNaPSetupFlowManager_finishFlowAndSaveAsRecent___block_invoke;
        v36[3] = &unk_1E204F648;
        v36[4] = self;
        -[CNSNaPSetupFlowManager updateEditingContact:watchWallpaperImageDataForConfiguration:completion:](self, "updateEditingContact:watchWallpaperImageDataForConfiguration:completion:", v31, v12, v36);
        goto LABEL_9;
      }
      -[CNSNaPSetupFlowManager notifyDelegateOfUpdatesAndDismissIfNeeded](self, "notifyDelegateOfUpdatesAndDismissIfNeeded");
    }
    -[CNSNaPSetupFlowManager setGalleryNavigationController:](self, "setGalleryNavigationController:", 0);
    goto LABEL_15;
  }
  -[CNSNaPSetupFlowManager sharingSettingsViewControllerForOnboarding](self, "sharingSettingsViewControllerForOnboarding");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setDelegate:", self);
  -[CNSNaPSetupFlowManager pushNextStepWithViewController:](self, "pushNextStepWithViewController:", v31);
LABEL_9:

LABEL_15:
  -[CNPRUISPosterSnapshotController releaseKeepActiveAssertionForReason:](self->_snapshotController, "releaseKeepActiveAssertionForReason:", CFSTR("CNMeCardSharingEditPosterAvatarFlowManager"));

}

- (void)pushNextStepWithViewController:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  v5 = -[CNSNaPSetupFlowManager isOnboarding](self, "isOnboarding");
  -[CNSNaPSetupFlowManager galleryNavigationController](self, "galleryNavigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v8 = v6;
    objc_msgSend(v6, "presentingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      -[CNSNaPSetupFlowManager galleryNavigationController](self, "galleryNavigationController");
    else
      -[CNSNaPSetupFlowManager onboardingWelcomeNavigationController](self, "onboardingWelcomeNavigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v6;
  objc_msgSend(v6, "pushViewController:animated:", v4, 1);

}

- (void)notifyDelegateOfUpdatesAndDismissIfNeeded
{
  void *v3;
  void *v4;
  void *v5;

  -[CNSNaPSetupFlowManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager editingContact](self, "editingContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avatarPosterEditorFromFlowManager:didUpdateContact:withVisualIdentity:", self, v4, v5);

  if (-[CNSNaPSetupFlowManager isEditingContactCard](self, "isEditingContactCard"))
    -[CNSNaPSetupFlowManager dismissPosterEditingFlow](self, "dismissPosterEditingFlow");
}

- (void)dismissPosterEditingFlow
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[CNSNaPSetupFlowManager galleryNavigationController](self, "galleryNavigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNSNaPSetupFlowManager galleryNavigationController](self, "galleryNavigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSNaPSetupFlowManager dismissNavigationController:animated:completion:](self, "dismissNavigationController:animated:completion:", v5, 1, 0);

  }
  -[CNSNaPSetupFlowManager posterEditOptionsNavigationController](self, "posterEditOptionsNavigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CNSNaPSetupFlowManager posterEditOptionsNavigationController](self, "posterEditOptionsNavigationController");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[CNSNaPSetupFlowManager posterEditOptionsNavigationController](self, "posterEditOptionsNavigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentedViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8
      || (-[CNSNaPSetupFlowManager galleryNavigationController](self, "galleryNavigationController"),
          (v2 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[CNSNaPSetupFlowManager posterEditOptionsNavigationController](self, "posterEditOptionsNavigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "presentingViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      else

      if (!v10)
        goto LABEL_13;
      objc_msgSend(v11, "presentingViewController");
      v7 = v11;
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_13:
    -[CNSNaPSetupFlowManager dismissViewController:animated:completion:](self, "dismissViewController:animated:completion:", v11, 1, 0);

  }
}

- (void)updateEditingContact:(id)a3 watchWallpaperImageDataForConfiguration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  CNMutableContact *editingContact;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v8 = a3;
  v9 = a5;
  editingContact = self->_editingContact;
  v11 = a4;
  -[CNMutableContact wallpaper](editingContact, "wallpaper");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __98__CNSNaPSetupFlowManager_updateEditingContact_watchWallpaperImageDataForConfiguration_completion___block_invoke;
  v15[3] = &unk_1E204F7C8;
  v16 = v8;
  v17 = v9;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v12, "snapshotImageDataForWatchForContact:posterConfiguration:completion:", v14, v11, v15);

}

- (void)sharingSettingsViewController:(id)a3 didUpdateWithSharingResult:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[CNSNaPSetupFlowManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CNSNaPSetupFlowManager delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "onboardingFromFlowManager:didUpdateWithSharingResult:", self, v9);

    -[CNSNaPSetupFlowManager onboardingWelcomeNavigationController](self, "onboardingWelcomeNavigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSNaPSetupFlowManager dismissNavigationController:animated:completion:](self, "dismissNavigationController:animated:completion:", v8, 1, 0);

  }
}

- (void)sharingSettingsViewController:(id)a3 didUpdateSharingState:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  id v8;

  v4 = a4;
  -[CNSNaPSetupFlowManager delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CNSNaPSetupFlowManager delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "onboardingFromFlowManager:didUpdateSharingState:", self, v4);

  }
}

- (void)sharingSettingsViewController:(id)a3 didSelectSharingAudience:(unint64_t)a4
{
  void *v6;
  char v7;
  id v8;

  -[CNSNaPSetupFlowManager delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CNSNaPSetupFlowManager delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "onboardingFromFlowManager:didSelectSharingAudience:", self, a4);

  }
}

- (void)suggestionsGalleryViewController:(id)a3 didSelectAvatarSourceType:(int64_t)a4 name:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v8 = a5;
  -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "given");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "family");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "updateContactWithGivenName:familyName:", v10, v11);
  v12 = -[CNSNaPSetupFlowManager mode](self, "mode");
  if (v12 != objc_msgSend(v17, "mode"))
  {
    objc_msgSend(v17, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSNaPSetupFlowManager avatarEditFlowManager](self, "avatarEditFlowManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBaseNavigationController:", v13);

  }
  -[CNSNaPSetupFlowManager avatarEditFlowManager](self, "avatarEditFlowManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presentEditorForAvatarSourceType:visualIdentity:fromGalleryViewController:", a4, v16, v17);

}

- (void)suggestionsGalleryViewController:(id)a3 didSelectSuggestedAvatar:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  CNPhotoPickerRecentsProvider *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  void *v23;
  CNPhotoPickerRecentsProvider *v24;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "given");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "family");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "updateContactWithGivenName:familyName:", v12, v13);
  v14 = [CNPhotoPickerRecentsProvider alloc];
  -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[CNPhotoPickerRecentsProvider initWithVisualIdentity:](v14, "initWithVisualIdentity:", v15);

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scale");
  v18 = v17;
  objc_msgSend(v10, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "effectiveUserInterfaceLayoutDirection") == 1;
  -[CNSNaPSetupFlowManager providerItemRenderingQueue](self, "providerItemRenderingQueue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager providerItemCallbackQueue](self, "providerItemCallbackQueue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerRecentsProvider providerItemForContactImage:size:scale:RTL:renderingQueue:callbackQueue:fallbackToDefaultItem:](v24, "providerItemForContactImage:size:scale:RTL:renderingQueue:callbackQueue:fallbackToDefaultItem:", v9, v20, v21, v22, 1, 250.0, 250.0, v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNSNaPSetupFlowManager avatarEditingDidFinishWithProviderItem:fromViewController:](self, "avatarEditingDidFinishWithProviderItem:fromViewController:", v23, v10);
}

- (void)suggestionsGalleryViewController:(id)a3 didFinishWithPosterConfiguration:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CNSNaPSetupFlowManager updateEditingStateForAction:](self, "updateEditingStateForAction:", 1);
  -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "given");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "family");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "updateContactWithGivenName:familyName:", v12, v13);
  if (!-[CNSNaPSetupFlowManager isEditingContactCard](self, "isEditingContactCard"))
  {
    -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSNaPSetupFlowManager updateEditingContactWithVisualIdentity:](self, "updateEditingContactWithVisualIdentity:", v14);

  }
  -[CNSNaPSetupFlowManager posterPreviewControllerWithPosterConfiguration:providerItem:mode:](self, "posterPreviewControllerWithPosterConfiguration:providerItem:mode:", v9, 0, objc_msgSend(v10, "mode"));
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "navigationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "pushViewController:animated:", v16, 1);
}

- (void)suggestionsGalleryViewControllerDidCancel:(id)a3
{
  uint64_t v4;
  _TtC10ContactsUI22PosterEditFlowReporter *editFlowReporter;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  if (-[CNSNaPSetupFlowManager isOnboarding](self, "isOnboarding"))
  {
    -[PosterEditFlowReporter didCancelFromOnboardingNew](self->_editFlowReporter, "didCancelFromOnboardingNew");
  }
  else
  {
    v4 = objc_msgSend(v9, "mode");
    editFlowReporter = self->_editFlowReporter;
    if (v4)
      -[PosterEditFlowReporter didCancelFromPosterEditor](editFlowReporter, "didCancelFromPosterEditor");
    else
      -[PosterEditFlowReporter didCancelFromAvatarEditor](editFlowReporter, "didCancelFromAvatarEditor");
  }
  -[CNSNaPSetupFlowManager galleryNavigationController](self, "galleryNavigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
    -[CNSNaPSetupFlowManager dismissViewController:animated:completion:](self, "dismissViewController:animated:completion:", v9, 1, 0);
  else
    objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, 0);
  -[CNSNaPSetupFlowManager updateEditingStateForRevertedAction:dismissingSetupFlow:](self, "updateEditingStateForRevertedAction:dismissingSetupFlow:", objc_msgSend(v9, "mode") != 0, v8 == v9);

}

- (void)suggestionsGalleryViewControllerDidSelectCustomizeLater:(id)a3
{
  -[CNSNaPSetupFlowManager viewControllerDidSelectCustomizePosterLater:](self, "viewControllerDidSelectCustomizePosterLater:", a3);
  -[CNSNaPSetupFlowManager writeToDefaultsPosterSkippedIfNeeded](self, "writeToDefaultsPosterSkippedIfNeeded");
}

- (void)sharingEditAvatarFlowManager:(id)a3 didFinishWithProviderItem:(id)a4 fromViewController:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  v8 = a4;
  -[CNSNaPSetupFlowManager updateEditingStateForAction:](self, "updateEditingStateForAction:", 0);
  -[CNSNaPSetupFlowManager avatarEditingDidFinishWithProviderItem:fromViewController:](self, "avatarEditingDidFinishWithProviderItem:fromViewController:", v8, v7);

}

- (void)avatarEditingDidFinishWithProviderItem:(id)a3 fromViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  CNSNaPSuggestionsGalleryViewController *v19;
  void *v20;
  uint64_t v21;
  _BOOL8 v22;
  void *v23;
  CNSNaPSuggestionsGalleryViewController *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  _QWORD v40[5];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "contactImageForMetadataStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager avatarPosterEditingContext](self, "avatarPosterEditingContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUpdatedAvatar:", v8);

  -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateVisualIdentity:", v10);

  -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager updateEditingContactWithVisualIdentity:](self, "updateEditingContactWithVisualIdentity:", v11);

  -[CNSNaPSetupFlowManager updateEditingStateForAction:](self, "updateEditingStateForAction:", 0);
  if (-[CNSNaPSetupFlowManager editingState](self, "editingState") == 1)
  {
    -[PosterEditFlowReporter didModifyAvatar](self->_editFlowReporter, "didModifyAvatar");
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceIdiom");

    if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      if (-[CNSNaPSetupFlowManager isCreatingNewAvatar](self, "isCreatingNewAvatar"))
      {
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __84__CNSNaPSetupFlowManager_avatarEditingDidFinishWithProviderItem_fromViewController___block_invoke;
        v40[3] = &unk_1E204F648;
        v40[4] = self;
        -[CNSNaPSetupFlowManager dismissViewController:animated:completion:](self, "dismissViewController:animated:completion:", v7, 1, v40);
      }
      else if (-[CNSNaPSetupFlowManager isOnboarding](self, "isOnboarding")
             || -[CNSNaPSetupFlowManager isEditingContactCard](self, "isEditingContactCard"))
      {
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __84__CNSNaPSetupFlowManager_avatarEditingDidFinishWithProviderItem_fromViewController___block_invoke_2;
        v39[3] = &unk_1E204F648;
        v39[4] = self;
        objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v39);
      }
      else
      {
        -[CNSNaPSetupFlowManager finishFlow](self, "finishFlow");
      }
    }
    else
    {
      if (objc_msgSend(v6, "imageType") == 4
        || objc_msgSend(v6, "imageType") == 1
        && (v28 = *MEMORY[0x1E0D13848],
            objc_msgSend(v6, "assetIdentifier"),
            v29 = (void *)objc_claimAutoreleasedReturnValue(),
            LODWORD(v28) = (*(uint64_t (**)(uint64_t, void *))(v28 + 16))(v28, v29),
            v29,
            (_DWORD)v28))
      {
        v19 = [CNSNaPSuggestionsGalleryViewController alloc];
        -[CNSNaPSetupFlowManager editingContact](self, "editingContact");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[CNSNaPSetupFlowManager isEditingContactCard](self, "isEditingContactCard") ^ 1;
        v22 = -[CNSNaPSetupFlowManager isOnboarding](self, "isOnboarding");
        objc_msgSend(v6, "assetIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[CNSNaPSuggestionsGalleryViewController initWithMode:contact:isEditingSNaP:isOnboarding:photoLibraryAssetID:](v19, "initWithMode:contact:isEditingSNaP:isOnboarding:photoLibraryAssetID:", 1, v20, v21, v22, v23);

        -[CNSNaPSuggestionsGalleryViewController setDelegate:](v24, "setDelegate:", self);
      }
      else
      {
        -[CNSNaPSetupFlowManager avatarPosterEditingContext](self, "avatarPosterEditingContext");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "existingPoster");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "posterData");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v32)
        {
          v34 = v32;
        }
        else
        {
          -[CNSNaPSetupFlowManager editingContact](self, "editingContact");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "wallpaper");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "posterArchiveData");
          v34 = (id)objc_claimAutoreleasedReturnValue();

        }
        if (v34)
        {
          +[CNPRSPosterArchiver unarchiveCNConfigurationFromData:error:](CNPRSPosterArchiver, "unarchiveCNConfigurationFromData:error:", v34, 0);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v37 = 0;
        }
        -[CNSNaPSetupFlowManager posterPreviewControllerWithPosterConfiguration:providerItem:mode:](self, "posterPreviewControllerWithPosterConfiguration:providerItem:mode:", v37, v6, -[CNSNaPSetupFlowManager mode](self, "mode"));
        v24 = (CNSNaPSuggestionsGalleryViewController *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v7, "navigationController");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "pushViewController:animated:", v24, 1);

    }
  }
  else
  {
    objc_opt_class();
    -[CNSNaPSetupFlowManager galleryNavigationController](self, "galleryNavigationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    if (v17)
    {
      objc_msgSend(v17, "updateWithProviderItem:", v6);
      -[CNSNaPSetupFlowManager galleryNavigationController](self, "galleryNavigationController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dismissViewControllerAnimated:completion:", 1, 0);

    }
    else
    {
      -[PosterEditFlowReporter didModifyAvatar](self->_editFlowReporter, "didModifyAvatar");
      objc_msgSend(MEMORY[0x1E0C97200], "stringIdentifierForImageType:", objc_msgSend(v6, "imageType"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNVisualIdentity setImageType:](self->_pendingVisualIdentity, "setImageType:", v25);

      objc_msgSend(v6, "imageData");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNVisualIdentity setImageData:](self->_pendingVisualIdentity, "setImageData:", v26);

      objc_msgSend(v6, "cropRect");
      -[CNVisualIdentity setCropRect:](self->_pendingVisualIdentity, "setCropRect:");
      if (-[CNSNaPSetupFlowManager isEditingContactCard](self, "isEditingContactCard"))
      {
        -[CNSNaPSetupFlowManager posterEditOptionsNavigationController](self, "posterEditOptionsNavigationController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "dismissViewControllerAnimated:completion:", 1, 0);

      }
      -[CNSNaPSetupFlowManager finishFlow](self, "finishFlow");
    }

  }
}

- (void)sharingEditAvatarFlowManagerDidCancel:(id)a3
{
  -[PosterEditFlowReporter didCancelFromAvatarEditor](self->_editFlowReporter, "didCancelFromAvatarEditor", a3);
  -[CNSNaPSetupFlowManager updateEditingStateForRevertedAction:dismissingSetupFlow:](self, "updateEditingStateForRevertedAction:dismissingSetupFlow:", 0, 0);
}

- (void)posterOnboardingViewControllerDidTapContinue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[CNSNaPSetupFlowManager isOnboarding](self, "isOnboarding"))
  {
    -[CNSNaPSetupFlowManager wallpaperGalleryNavigationController](self, "wallpaperGalleryNavigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSNaPSetupFlowManager setGalleryNavigationController:](self, "setGalleryNavigationController:", v4);

    -[CNSNaPSetupFlowManager onboardingWelcomeNavigationController](self, "onboardingWelcomeNavigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSNaPSetupFlowManager galleryNavigationController](self, "galleryNavigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentViewController:animated:completion:", v6, 1, 0);

  }
  else
  {
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (void)posterOnboardingViewControllerDidDidTapCancel:(id)a3
{
  _TtC10ContactsUI22PosterEditFlowReporter *editFlowReporter;
  id v5;

  editFlowReporter = self->_editFlowReporter;
  v5 = a3;
  -[PosterEditFlowReporter didCancelFromOnboardingWelcome](editFlowReporter, "didCancelFromOnboardingWelcome");
  -[CNSNaPSetupFlowManager submitAndResetFlowReporter](self, "submitAndResetFlowReporter");
  -[CNPRUISPosterSnapshotController releaseKeepActiveAssertionForReason:](self->_snapshotController, "releaseKeepActiveAssertionForReason:", CFSTR("CNMeCardSharingEditPosterAvatarFlowManager"));
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)avatarPreviewViewController:(id)a3 didFinishWithContactImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  CNPhotoPickerAnimojiProviderItem *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  CNPhotoPickerAnimojiProviderItem *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  CNPhotoPickerAnimojiProviderItem *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD v60[5];

  v6 = a3;
  v7 = a4;
  -[CNSNaPSetupFlowManager updateEditingStateForAction:](self, "updateEditingStateForAction:", 0);
  -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clearImage");

  objc_msgSend(MEMORY[0x1E0C97200], "imageTypeStringIdentifierForImageSource:", objc_msgSend(v7, "source"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImageType:", v9);

  if (objc_msgSend(v7, "source") == 3)
  {
    v11 = [CNPhotoPickerAnimojiProviderItem alloc];
    objc_msgSend(v7, "imageData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cropRect");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(v7, "variant");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNPhotoPickerVariantsManager colorVariantWithColorNamed:](CNPhotoPickerVariantsManager, "colorVariantWithColorNamed:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[CNPhotoPickerAnimojiProviderItem initWithOriginalImageData:cropRect:backgroundColorVariant:](v11, "initWithOriginalImageData:cropRect:backgroundColorVariant:", v12, v22, v14, v16, v18, v20);

    v24 = (void *)MEMORY[0x1E0C97350];
    objc_msgSend(v7, "sourceIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "avatarRecordForIdentifier:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNPhotoPickerAnimojiProviderItem setAvatarRecord:](v23, "setAvatarRecord:", v26);
    +[CNPhotoPickerRecentsProvider poseConfigurationFromContactImage:](CNPhotoPickerRecentsProvider, "poseConfigurationFromContactImage:", v7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerAnimojiProviderItem setPoseConfiguration:](v23, "setPoseConfiguration:", v27);

    -[CNPhotoPickerAnimojiProviderItem generateAllImageDatasIfNeeded](v23, "generateAllImageDatasIfNeeded");
    -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerAnimojiProviderItem updateVisualIdentity:](v23, "updateVisualIdentity:", v28);

  }
  else
  {
    objc_msgSend(v7, "imageData");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "variant");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNPhotoPickerProviderItem generateImageDataWithData:filterName:](CNPhotoPickerProviderItem, "generateImageDataWithData:filterName:", v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31)
    {
      v33 = v31;
    }
    else
    {
      objc_msgSend(v7, "imageData");
      v33 = (CNPhotoPickerAnimojiProviderItem *)objc_claimAutoreleasedReturnValue();
    }
    v23 = v33;

    -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setImageData:", v23);

    objc_msgSend(v7, "cropRect");
    +[CNPhotoPickerProviderItem generateThumbnailImageDataWithData:cropRect:](CNPhotoPickerProviderItem, "generateThumbnailImageDataWithData:cropRect:", v23);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setThumbnailImageData:", v35);

    objc_msgSend(v7, "cropRect");
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v44 = v43;
    -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setCropRect:", v38, v40, v42, v44);
  }

  -[CNSNaPSetupFlowManager avatarPosterEditingContext](self, "avatarPosterEditingContext");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setUpdatedAvatar:", v7);

  -[PosterEditFlowReporter didModifyAvatar](self->_editFlowReporter, "didModifyAvatar");
  if (-[CNSNaPSetupFlowManager editingState](self, "editingState") == 1
    && (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v46 = (void *)objc_claimAutoreleasedReturnValue(),
        v47 = objc_msgSend(v46, "userInterfaceIdiom"),
        v46,
        (v47 & 0xFFFFFFFFFFFFFFFBLL) != 1))
  {
    -[CNSNaPSetupFlowManager avatarPosterEditingContext](self, "avatarPosterEditingContext");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "existingPoster");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "posterData");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v52;
    if (v52)
    {
      v54 = v52;
    }
    else
    {
      -[CNSNaPSetupFlowManager editingContact](self, "editingContact");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "wallpaper");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "posterArchiveData");
      v54 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (v54)
    {
      +[CNPRSPosterArchiver unarchiveCNConfigurationFromData:error:](CNPRSPosterArchiver, "unarchiveCNConfigurationFromData:error:", v54, 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v57 = 0;
    }
    -[CNSNaPSetupFlowManager posterPreviewControllerWithPosterConfiguration:providerItem:mode:](self, "posterPreviewControllerWithPosterConfiguration:providerItem:mode:", v57, 0, -[CNSNaPSetupFlowManager mode](self, "mode"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationController");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "pushViewController:animated:", v58, 1);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "userInterfaceIdiom");

    if ((v49 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __80__CNSNaPSetupFlowManager_avatarPreviewViewController_didFinishWithContactImage___block_invoke;
      v60[3] = &unk_1E204F648;
      v60[4] = self;
      objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v60);
    }
    else
    {
      -[CNSNaPSetupFlowManager finishFlow](self, "finishFlow");
    }
  }

}

- (void)avatarPreviewViewControllerDidSelectCustomizeLater:(id)a3
{
  uint64_t v4;
  void *v5;
  int64_t v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint8_t v14[16];

  -[CNSNaPSetupFlowManager avatarPosterEditingContext](self, "avatarPosterEditingContext", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4 && (v5 = (void *)v4, v6 = -[CNSNaPSetupFlowManager editingState](self, "editingState"), v5, v6))
  {
    -[PosterEditFlowReporter didSkipAvatar](self->_editFlowReporter, "didSkipAvatar");
    -[CNSNaPSetupFlowManager avatarPosterEditingContext](self, "avatarPosterEditingContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEditingExisting");

    if ((v8 & 1) != 0)
    {
      -[CNSNaPSetupFlowManager avatarPosterEditingContext](self, "avatarPosterEditingContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "existingAvatar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNSNaPSetupFlowManager avatarPosterEditingContext](self, "avatarPosterEditingContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setUpdatedAvatar:", v10);

    }
    else
    {
      -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "clearImage");

      -[CNSNaPSetupFlowManager avatarPosterEditingContext](self, "avatarPosterEditingContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setUpdatedAvatar:", 0);
    }

    -[CNSNaPSetupFlowManager finishFlow](self, "finishFlow");
  }
  else
  {
    CNUILogPosters();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_18AC56000, v12, OS_LOG_TYPE_DEFAULT, "Attempted to skip with empty editing state and context", v14, 2u);
    }

  }
}

- (void)presentCreateNewAvatarViewController
{
  -[CNSNaPSetupFlowManager presentCreateNewAvatarViewControllerFromViewController:](self, "presentCreateNewAvatarViewControllerFromViewController:", 0);
}

- (void)presentCreateNewAvatarViewControllerFromViewController:(id)a3
{
  id v4;
  CNSNaPSuggestionsGalleryViewController *v5;
  void *v6;
  CNSNaPSuggestionsGalleryViewController *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;

  v4 = a3;
  v5 = [CNSNaPSuggestionsGalleryViewController alloc];
  -[CNSNaPSetupFlowManager editingContact](self, "editingContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNSNaPSuggestionsGalleryViewController initWithMode:contact:isEditingSNaP:isOnboarding:](v5, "initWithMode:contact:isEditingSNaP:isOnboarding:", 0, v6, -[CNSNaPSetupFlowManager isEditingContactCard](self, "isEditingContactCard") ^ 1, -[CNSNaPSetupFlowManager isOnboarding](self, "isOnboarding"));

  -[CNSNaPSuggestionsGalleryViewController setDelegate:](v7, "setDelegate:", self);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v7);
  objc_msgSend(v8, "setModalPresentationStyle:", -[CNSNaPSetupFlowManager defaultModalPresentationStyle](self, "defaultModalPresentationStyle"));
  if (v4)
  {
    v9 = v4;
  }
  else
  {
    -[CNSNaPSetupFlowManager galleryNavigationController](self, "galleryNavigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      -[CNSNaPSetupFlowManager posterEditOptionsNavigationController](self, "posterEditOptionsNavigationController");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v12;

  }
  objc_msgSend(v9, "presentedViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v9, "presentedViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __81__CNSNaPSetupFlowManager_presentCreateNewAvatarViewControllerFromViewController___block_invoke;
    v19 = &unk_1E2050400;
    v20 = v9;
    v21 = v8;
    objc_msgSend(v14, "dismissViewControllerAnimated:completion:", 1, &v16);

  }
  else
  {
    objc_msgSend(v9, "presentViewController:animated:completion:", v8, 1, 0);
  }
  -[CNSNaPSetupFlowManager avatarEditFlowManager](self, "avatarEditFlowManager", v16, v17, v18, v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBaseNavigationController:", v8);

}

- (void)imagePickerControllerDidCancel:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)imagePickerController:(id)a3 didFinishWithProviderItem:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__CNSNaPSetupFlowManager_imagePickerController_didFinishWithProviderItem___block_invoke;
  v8[3] = &unk_1E2050400;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, v8);

}

- (CNContactImageStore)contactImageStore
{
  cn_objectResultWithObjectLock();
  return (CNContactImageStore *)(id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)recentAvatarsCountForContactIdentifier:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C97228];
  v12 = a3;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a3;
  objc_msgSend(v5, "arrayWithObjects:count:", &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recentImagesRequestForContactIdenfitiers:", v7, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNSNaPSetupFlowManager contactImageStore](self, "contactImageStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countForFetchRequest:error:", v8, 0);

  return v10;
}

- (void)saveCurrentVisualIdentityIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CNSNaPSetupFlowManager currentContactImage](self, "currentContactImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[CNSNaPSetupFlowManager currentContactPoster](self, "currentContactPoster");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      return;
  }
  v5 = (void *)MEMORY[0x1E0C973E0];
  -[CNSNaPSetupFlowManager currentContactPoster](self, "currentContactPoster");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager editingContact](self, "editingContact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "shouldSaveCurrentPoster:toRecentsForContact:", v6, v7);

  if ((_DWORD)v5)
  {
    -[CNSNaPSetupFlowManager currentContactImage](self, "currentContactImage");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[CNSNaPSetupFlowManager currentContactPoster](self, "currentContactPoster");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSNaPSetupFlowManager saveRecentAvatar:withPairedPoster:ignoreExisting:](self, "saveRecentAvatar:withPairedPoster:ignoreExisting:", v9, v8, 1);

  }
}

- (void)saveRecentVisualIdentity
{
  void *v3;
  id v4;

  -[CNSNaPSetupFlowManager recentAvatarFromPendingVisualIdentity](self, "recentAvatarFromPendingVisualIdentity");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager recentPosterFromPendingVisualIdentity](self, "recentPosterFromPendingVisualIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager saveRecentAvatar:withPairedPoster:ignoreExisting:](self, "saveRecentAvatar:withPairedPoster:ignoreExisting:", v4, v3, 0);

}

- (id)recentAvatarFromPendingVisualIdentity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  -[CNSNaPSetupFlowManager avatarPosterEditingContext](self, "avatarPosterEditingContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updatedAvatar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v23 = 0;
      return v23;
    }
    v7 = objc_alloc(MEMORY[0x1E0C97220]);
    -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cropRect");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v7, "initWithImageData:cropRect:lastUsedDate:", v6, v17, v10, v12, v14, v16);

    -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSource:", objc_msgSend(v18, "contactImageSource"));

  }
  v19 = (void *)MEMORY[0x1E0C97400];
  -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "thumbnailImageData");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "fingerprintForData:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setVisualFingerprint:", v22);
  v23 = v4;

  return v23;
}

- (id)recentPosterFromPendingVisualIdentity
{
  void *v3;
  void *v4;
  void *v5;

  -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wallpaper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager contactPosterFromWallpaper:](self, "contactPosterFromWallpaper:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)contactPosterFromWallpaper:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v3 = a3;
  objc_msgSend(v3, "posterArchiveData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[CNPRSPosterArchiver unarchiveCNConfigurationFromData:error:](CNPRSPosterArchiver, "unarchiveCNConfigurationFromData:error:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serverUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUIDString");
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    v12 = objc_alloc(MEMORY[0x1E0C97260]);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v12, "initWithIdentifier:posterData:lastUsedDate:", v9, v4, v13);

    objc_msgSend(v3, "visualFingerprintData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setVisualFingerprintData:", v14);

    objc_msgSend(v10, "setContentIsSensitive:", objc_msgSend(v3, "contentIsSensitive"));
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)saveRecentAvatar:(id)a3 withPairedPoster:(id)a4 ignoreExisting:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  char v22;
  id v23;
  NSObject *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    if (a5)
    {
      v10 = 0;
    }
    else
    {
      -[CNSNaPSetupFlowManager avatarPosterEditingContext](self, "avatarPosterEditingContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "existingAvatar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v8, "setPairedPoster:", v9);
    -[CNSNaPSetupFlowManager contactImageStore](self, "contactImageStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSNaPSetupFlowManager editingContact](self, "editingContact");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v16 = (void *)MEMORY[0x1E0C97230];
      objc_msgSend(v10, "identifier");
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "saveRequestToDeleteImageForIdentifier:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = 0;
      LOBYTE(v17) = objc_msgSend(v13, "performSaveRequest:error:", v18, &v26);
      v19 = v26;
      if ((v17 & 1) == 0)
      {
        objc_msgSend((id)objc_opt_class(), "log");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_18AC56000, v20, OS_LOG_TYPE_ERROR, "Failed to delete existing edited item", buf, 2u);
        }

      }
    }
    else
    {
      v19 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C97230], "saveRequestToCreateImage:forContactIdentifier:", v8, v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v19;
    v22 = objc_msgSend(v13, "performSaveRequest:error:", v21, &v25);
    v23 = v25;

    if ((v22 & 1) == 0)
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v15;
        _os_log_impl(&dword_18AC56000, v24, OS_LOG_TYPE_INFO, "Failed to save item to recent image store for contact identifier <%@>", buf, 0xCu);
      }

    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18AC56000, v11, OS_LOG_TYPE_INFO, "Contact image is nil, saving poster without any paired avatar", buf, 2u);
    }

    -[CNSNaPSetupFlowManager saveRecentPoster:](self, "saveRecentPoster:", v9);
  }

}

- (void)saveRecentPoster:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C97278]);
    v6 = (void *)MEMORY[0x1E0C97270];
    -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "saveRequestToCreatePoster:forContactIdentifier:", v4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    -[NSObject performSaveRequest:error:](v5, "performSaveRequest:error:", v9, &v14);
    v10 = v14;
    if (v10)
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v16 = v13;
        _os_log_impl(&dword_18AC56000, v11, OS_LOG_TYPE_INFO, "Failed to save item to recent poster store for contact identifier <%@>", buf, 0xCu);

      }
    }

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18AC56000, v5, OS_LOG_TYPE_INFO, "Contact poster is nil, not saving to recents", buf, 2u);
    }
  }

}

- (id)providerItemForRecentAvatar:(id)a3 inView:(id)a4
{
  id v6;
  _BOOL8 v7;
  CNPhotoPickerRecentsProvider *v8;
  void *v9;
  CNPhotoPickerRecentsProvider *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = objc_msgSend(a4, "effectiveUserInterfaceLayoutDirection") == 1;
  v8 = [CNPhotoPickerRecentsProvider alloc];
  -[CNSNaPSetupFlowManager pendingVisualIdentity](self, "pendingVisualIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CNPhotoPickerRecentsProvider initWithVisualIdentity:](v8, "initWithVisualIdentity:", v9);

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scale");
  v13 = v12;
  -[CNSNaPSetupFlowManager providerItemRenderingQueue](self, "providerItemRenderingQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSNaPSetupFlowManager providerItemCallbackQueue](self, "providerItemCallbackQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerRecentsProvider providerItemForContactImage:size:scale:RTL:renderingQueue:callbackQueue:fallbackToDefaultItem:](v10, "providerItemForContactImage:size:scale:RTL:renderingQueue:callbackQueue:fallbackToDefaultItem:", v6, v7, v14, v15, 1, 250.0, 250.0, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)updateEditingStateForAction:(int64_t)a3
{
  -[CNSNaPSetupFlowManager setEditingState:](self, "setEditingState:", +[CNMeCardSharingSettingsEditingStateMachine stateAfterPerformingAction:onState:](CNMeCardSharingSettingsEditingStateMachine, "stateAfterPerformingAction:onState:", a3, -[CNSNaPSetupFlowManager editingState](self, "editingState")));
}

- (void)updateEditingStateForRevertedAction:(int64_t)a3 dismissingSetupFlow:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  -[CNSNaPSetupFlowManager setEditingState:](self, "setEditingState:", +[CNMeCardSharingSettingsEditingStateMachine stateAfterRevertingAction:onState:](CNMeCardSharingSettingsEditingStateMachine, "stateAfterRevertingAction:onState:", a3, -[CNSNaPSetupFlowManager editingState](self, "editingState")));
  if (v4)
    -[CNSNaPSetupFlowManager setAvatarPosterEditingContext:](self, "setAvatarPosterEditingContext:", 0);
}

- (void)resetEditingState
{
  -[CNSNaPSetupFlowManager setEditingState:](self, "setEditingState:", 0);
  -[CNSNaPSetupFlowManager setAvatarPosterEditingContext:](self, "setAvatarPosterEditingContext:", 0);
}

- (void)cleanupTemporaryPosterData
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0D13B70], "defaultProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__CNSNaPSetupFlowManager_cleanupTemporaryPosterData__block_invoke;
  v5[3] = &unk_1E204F648;
  v5[4] = self;
  objc_msgSend(v4, "performBlock:", v5);

}

- (void)cleanupTemporaryPosterArchiveDataIfNeededFromURL:(id)a3 fileManager:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  _BYTE v31[128];
  _QWORD v32[3];

  v32[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "BOOLForKey:", CFSTR("CNPostersHasPerformedTemporaryArchiveCleanup")) & 1) == 0)
  {
    v20 = v7;
    v32[0] = *MEMORY[0x1E0C99A90];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v5;
    objc_msgSend(v6, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v5, v8, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v15, "pathExtension");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v16, "isEqualToString:", CFSTR("apa")) & 1) != 0
            || objc_msgSend(v16, "isEqualToString:", CFSTR("zapa")))
          {
            v22 = 0;
            v17 = objc_msgSend(v6, "removeItemAtURL:error:", v15, &v22);
            v18 = v22;
            if ((v17 & 1) == 0)
            {
              CNUILogPosters();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v28 = v16;
                v29 = 2112;
                v30 = v18;
                _os_log_error_impl(&dword_18AC56000, v19, OS_LOG_TYPE_ERROR, "Failed to clean up %@ type file from temporary directory, %@", buf, 0x16u);
              }

            }
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v12);
    }

    v7 = v20;
    objc_msgSend(v20, "setBool:forKey:", 1, CFSTR("CNPostersHasPerformedTemporaryArchiveCleanup"));

    v5 = v21;
  }

}

- (void)cleanupTemporaryPosterConfigurationsFromURL:(id)a3 fileManager:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  char v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("PosterConfigurations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "fileExistsAtPath:", v7);

  if (v8)
  {
    v13 = 0;
    v9 = objc_msgSend(v5, "removeItemAtURL:error:", v6, &v13);
    v10 = v13;
    if ((v9 & 1) == 0)
    {
      CNUILogPosters();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "localizedDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v15 = v12;
        _os_log_error_impl(&dword_18AC56000, v11, OS_LOG_TYPE_ERROR, "Failed to clean up poster configurations from temporary directory, %@", buf, 0xCu);

      }
    }

  }
}

- (BOOL)multiplePhoneNumbersTiedToAppleID
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getIMNicknameControllerClass_softClass_10662;
  v9 = getIMNicknameControllerClass_softClass_10662;
  if (!getIMNicknameControllerClass_softClass_10662)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getIMNicknameControllerClass_block_invoke_10663;
    v5[3] = &unk_1E204EBC0;
    v5[4] = &v6;
    __getIMNicknameControllerClass_block_invoke_10663((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  return objc_msgSend(v3, "multiplePhoneNumbersTiedToAppleID");
}

- (CNSNaPSetupFlowManagerDelegate)delegate
{
  return (CNSNaPSetupFlowManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNPresenterDelegate)presenterDelegate
{
  return (CNPresenterDelegate *)objc_loadWeakRetained((id *)&self->_presenterDelegate);
}

- (void)setPresenterDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presenterDelegate, a3);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (CNMutableContact)editingContact
{
  return self->_editingContact;
}

- (void)setEditingContact:(id)a3
{
  objc_storeStrong((id *)&self->_editingContact, a3);
}

- (CNVisualIdentity)pendingVisualIdentity
{
  return self->_pendingVisualIdentity;
}

- (void)setPendingVisualIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_pendingVisualIdentity, a3);
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (int64_t)editingState
{
  return self->_editingState;
}

- (void)setEditingState:(int64_t)a3
{
  self->_editingState = a3;
}

- (CNAvatarPosterCarouselEditingContext)avatarPosterEditingContext
{
  return self->_avatarPosterEditingContext;
}

- (void)setAvatarPosterEditingContext:(id)a3
{
  objc_storeStrong((id *)&self->_avatarPosterEditingContext, a3);
}

- (BOOL)isOnboarding
{
  return self->_isOnboarding;
}

- (void)setIsOnboarding:(BOOL)a3
{
  self->_isOnboarding = a3;
}

- (BOOL)isEditingContactCard
{
  return self->_isEditingContactCard;
}

- (void)setIsEditingContactCard:(BOOL)a3
{
  self->_isEditingContactCard = a3;
}

- (BOOL)isCreatingNewAvatar
{
  return self->_isCreatingNewAvatar;
}

- (void)setIsCreatingNewAvatar:(BOOL)a3
{
  self->_isCreatingNewAvatar = a3;
}

- (UINavigationController)posterEditOptionsNavigationController
{
  return self->_posterEditOptionsNavigationController;
}

- (void)setPosterEditOptionsNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_posterEditOptionsNavigationController, a3);
}

- (UINavigationController)galleryNavigationController
{
  return self->_galleryNavigationController;
}

- (UINavigationController)onboardingWelcomeNavigationController
{
  return self->_onboardingWelcomeNavigationController;
}

- (void)setOnboardingWelcomeNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingWelcomeNavigationController, a3);
}

- (UIViewController)baseViewController
{
  return self->_baseViewController;
}

- (void)setBaseViewController:(id)a3
{
  objc_storeStrong((id *)&self->_baseViewController, a3);
}

- (CNMeCardSharingEditAvatarFlowManager)avatarEditFlowManager
{
  return self->_avatarEditFlowManager;
}

- (void)setAvatarEditFlowManager:(id)a3
{
  objc_storeStrong((id *)&self->_avatarEditFlowManager, a3);
}

- (CNVisualIdentityImagePickerController)imagePickerController
{
  return self->_imagePickerController;
}

- (void)setImagePickerController:(id)a3
{
  objc_storeStrong((id *)&self->_imagePickerController, a3);
}

- (CNPRUISPosterSnapshotController)snapshotController
{
  return self->_snapshotController;
}

- (void)setSnapshotController:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotController, a3);
}

- (void)setContactImageStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactImageStore, a3);
}

- (_TtC10ContactsUI22PosterEditFlowReporter)editFlowReporter
{
  return self->_editFlowReporter;
}

- (void)setEditFlowReporter:(id)a3
{
  objc_storeStrong((id *)&self->_editFlowReporter, a3);
}

- (CNContactImage)currentContactImage
{
  return self->_currentContactImage;
}

- (void)setCurrentContactImage:(id)a3
{
  objc_storeStrong((id *)&self->_currentContactImage, a3);
}

- (CNContactPoster)currentContactPoster
{
  return self->_currentContactPoster;
}

- (void)setCurrentContactPoster:(id)a3
{
  objc_storeStrong((id *)&self->_currentContactPoster, a3);
}

- (BOOL)currentAvatarPosterPairIsBackedByRecents
{
  return self->_currentAvatarPosterPairIsBackedByRecents;
}

- (void)setCurrentAvatarPosterPairIsBackedByRecents:(BOOL)a3
{
  self->_currentAvatarPosterPairIsBackedByRecents = a3;
}

- (CNContactImage)pendingRecentImage
{
  return self->_pendingRecentImage;
}

- (void)setPendingRecentImage:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRecentImage, a3);
}

- (CNScheduler)providerItemRenderingQueue
{
  return self->_providerItemRenderingQueue;
}

- (CNScheduler)providerItemCallbackQueue
{
  return self->_providerItemCallbackQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerItemCallbackQueue, 0);
  objc_storeStrong((id *)&self->_providerItemRenderingQueue, 0);
  objc_storeStrong((id *)&self->_pendingRecentImage, 0);
  objc_storeStrong((id *)&self->_currentContactPoster, 0);
  objc_storeStrong((id *)&self->_currentContactImage, 0);
  objc_storeStrong((id *)&self->_editFlowReporter, 0);
  objc_storeStrong((id *)&self->_contactImageStore, 0);
  objc_storeStrong((id *)&self->_snapshotController, 0);
  objc_storeStrong((id *)&self->_imagePickerController, 0);
  objc_storeStrong((id *)&self->_avatarEditFlowManager, 0);
  objc_storeStrong((id *)&self->_baseViewController, 0);
  objc_storeStrong((id *)&self->_onboardingWelcomeNavigationController, 0);
  objc_storeStrong((id *)&self->_galleryNavigationController, 0);
  objc_storeStrong((id *)&self->_posterEditOptionsNavigationController, 0);
  objc_storeStrong((id *)&self->_avatarPosterEditingContext, 0);
  objc_storeStrong((id *)&self->_pendingVisualIdentity, 0);
  objc_storeStrong((id *)&self->_editingContact, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_destroyWeak((id *)&self->_presenterDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

void __52__CNSNaPSetupFlowManager_cleanupTemporaryPosterData__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  NSTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cleanupTemporaryPosterArchiveDataIfNeededFromURL:fileManager:", v3, v4);
  objc_msgSend(*(id *)(a1 + 32), "cleanupTemporaryPosterConfigurationsFromURL:fileManager:", v3, v4);

}

id __43__CNSNaPSetupFlowManager_contactImageStore__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1096);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C97238]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 1096);
    *(_QWORD *)(v4 + 1096) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1096);
  }
  return v2;
}

void __74__CNSNaPSetupFlowManager_imagePickerController_didFinishWithProviderItem___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "posterEditOptionsNavigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "avatarEditFlowManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBaseNavigationController:", v2);

  objc_msgSend(*(id *)(a1 + 32), "avatarEditFlowManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentAvatarEditorViewControllerForProviderItem:", *(_QWORD *)(a1 + 40));

}

uint64_t __81__CNSNaPSetupFlowManager_presentCreateNewAvatarViewControllerFromViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

uint64_t __80__CNSNaPSetupFlowManager_avatarPreviewViewController_didFinishWithContactImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishFlow");
}

uint64_t __84__CNSNaPSetupFlowManager_avatarEditingDidFinishWithProviderItem_fromViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishFlow");
}

uint64_t __84__CNSNaPSetupFlowManager_avatarEditingDidFinishWithProviderItem_fromViewController___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishFlow");
}

uint64_t __98__CNSNaPSetupFlowManager_updateEditingContact_watchWallpaperImageDataForConfiguration_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setWatchWallpaperImageData:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __52__CNSNaPSetupFlowManager_finishFlowAndSaveAsRecent___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "notifyDelegateOfUpdatesAndDismissIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "setGalleryNavigationController:", 0);
}

uint64_t __70__CNSNaPSetupFlowManager_viewControllerDidSelectCustomizePosterLater___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishFlow");
}

uint64_t __87__CNSNaPSetupFlowManager_posterPreviewViewController_didFinishWithPosterConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishFlow");
}

void __116__CNSNaPSetupFlowManager_posterOnboardingWelcomeNavigationControllerForContact_hasOptionToSkip_hasExistingNickname___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18AC56000, v3, OS_LOG_TYPE_INFO, "Detected that multiple numbers/devices are associated with Apple ID, user chose to cancel", v4, 2u);
  }

  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);
}

void __116__CNSNaPSetupFlowManager_posterOnboardingWelcomeNavigationControllerForContact_hasOptionToSkip_hasExistingNickname___block_invoke_179(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_18AC56000, v4, OS_LOG_TYPE_INFO, "Detected that multiple numbers/devices are associated with Apple ID, user chose to continue", v6, 2u);
  }

  objc_msgSend(v3, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "pushViewController:animated:", *(_QWORD *)(a1 + 40), 1);
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_24[0] != -1)
    dispatch_once(descriptorForRequiredKeys_cn_once_token_24, &__block_literal_global_10685);
  return (id)descriptorForRequiredKeys_cn_once_object_24;
}

+ (id)log
{
  if (log_cn_once_token_25 != -1)
    dispatch_once(&log_cn_once_token_25, &__block_literal_global_157);
  return (id)log_cn_once_object_25;
}

void __29__CNSNaPSetupFlowManager_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNMeCardSharingEditPosterAvatarFlowManager");
  v1 = (void *)log_cn_once_object_25;
  log_cn_once_object_25 = (uint64_t)v0;

}

void __51__CNSNaPSetupFlowManager_descriptorForRequiredKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[18];

  v14[17] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0, *MEMORY[0x1E0C966E8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x1E0C96708];
  v14[1] = v0;
  v14[2] = v1;
  v2 = *MEMORY[0x1E0C96688];
  v14[3] = *MEMORY[0x1E0C96890];
  v14[4] = v2;
  v3 = *MEMORY[0x1E0C966C8];
  v14[5] = *MEMORY[0x1E0C96778];
  v14[6] = v3;
  v4 = *MEMORY[0x1E0C96728];
  v14[7] = *MEMORY[0x1E0C96700];
  v14[8] = v4;
  v14[9] = *MEMORY[0x1E0C96710];
  v14[10] = v1;
  v5 = *MEMORY[0x1E0C968B8];
  v14[11] = *MEMORY[0x1E0C96860];
  v14[12] = v5;
  v6 = *MEMORY[0x1E0C968B0];
  v14[13] = *MEMORY[0x1E0C968A8];
  v14[14] = v6;
  objc_msgSend(MEMORY[0x1E0C973E0], "descriptorForRequiredKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[15] = v7;
  +[CNVisualIdentityPickerViewController descriptorForRequiredKeys](CNVisualIdentityPickerViewController, "descriptorForRequiredKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[16] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNSNaPSetupFlowManager descriptorForRequiredKeys]_block_invoke");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "descriptorWithKeyDescriptors:description:", v9, v11);
  v12 = objc_claimAutoreleasedReturnValue();

  v13 = (void *)descriptorForRequiredKeys_cn_once_object_24;
  descriptorForRequiredKeys_cn_once_object_24 = v12;

}

@end
