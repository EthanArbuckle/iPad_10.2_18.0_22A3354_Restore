@implementation CNNicknameProvider

- (void)nicknameStoreDidChange:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("CNNicknameStoreChangedNotification"), 0);

}

void __37__CNNicknameProvider_defaultProvider__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "makeDefaultProvider");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)defaultProvider_cn_once_object_1;
  defaultProvider_cn_once_object_1 = v1;

}

+ (id)makeDefaultProvider
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init((Class)getIMNicknameProviderClass());
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIMNicknameProvider:", v3);
  objc_msgSend(v4, "imNicknameProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNicknameListener:", v4);

  return v4;
}

- (CNNicknameProvider)initWithIMNicknameProvider:(id)a3
{
  id v5;
  CNNicknameProvider *v6;
  CNNicknameProvider *v7;
  uint64_t v8;
  IMMeCardSharingStateController *sharingStateController;
  CNNicknameProvider *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNNicknameProvider;
  v6 = -[CNNicknameProvider init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_imNicknameProvider, a3);
    objc_msgSend(getIMMeCardSharingStateControllerClass(), "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    sharingStateController = v7->_sharingStateController;
    v7->_sharingStateController = (IMMeCardSharingStateController *)v8;

    v10 = v7;
  }

  return v7;
}

- (IMNicknameProvider)imNicknameProvider
{
  return self->_imNicknameProvider;
}

+ (CNNicknameProvider)defaultProvider
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CNNicknameProvider_defaultProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultProvider_cn_once_token_1 != -1)
    dispatch_once(&defaultProvider_cn_once_token_1, block);
  return (CNNicknameProvider *)(id)defaultProvider_cn_once_object_1;
}

+ (id)log
{
  if (log_cn_once_token_0_10 != -1)
    dispatch_once(&log_cn_once_token_0_10, &__block_literal_global_104);
  return (id)log_cn_once_object_0_10;
}

void __25__CNNicknameProvider_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "CNNicknameProvider");
  v1 = (void *)log_cn_once_object_0_10;
  log_cn_once_object_0_10 = (uint64_t)v0;

}

- (CNNicknameProvider)init
{
  if (init_cn_once_token_2 != -1)
    dispatch_once(&init_cn_once_token_2, &__block_literal_global_26_2);
  return -[CNNicknameProvider initWithIMNicknameProvider:](self, "initWithIMNicknameProvider:", init_cn_once_object_2);
}

void __26__CNNicknameProvider_init__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)getIMNicknameProviderClass());
  v1 = (void *)init_cn_once_object_2;
  init_cn_once_object_2 = (uint64_t)v0;

}

- (void)fetchPersonalNicknameAsContactWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CNNicknameProvider imNicknameProvider](self, "imNicknameProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__CNNicknameProvider_fetchPersonalNicknameAsContactWithCompletion___block_invoke;
  v7[3] = &unk_1E29FCCD8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "nicknameForCurrentUserWithCompletionHandler:", v7);

}

void __67__CNNicknameProvider_fetchPersonalNicknameAsContactWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "contactFromNickname:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
  else
  {
    (*(void (**)(_QWORD))(v2 + 16))(*(_QWORD *)(a1 + 40));
  }
}

- (void)setPersonalNicknameWithSharingResult:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  id v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v5 = -[CNNicknameProvider isNicknameSharingEnabled](self, "isNicknameSharingEnabled");
  objc_msgSend((id)objc_opt_class(), "log");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_18F8BD000, v6, OS_LOG_TYPE_DEFAULT, "Updating nickname with sharing result", (uint8_t *)v10, 2u);
    }

    v11 = 0;
    v12 = &v11;
    v13 = 0x2050000000;
    v8 = (void *)getIMNicknameControllerClass_softClass;
    v14 = getIMNicknameControllerClass_softClass;
    if (!getIMNicknameControllerClass_softClass)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __getIMNicknameControllerClass_block_invoke;
      v10[3] = &unk_1E29F98A8;
      v10[4] = &v11;
      __getIMNicknameControllerClass_block_invoke((uint64_t)v10);
      v8 = (void *)v12[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v11, 8);
    objc_msgSend(v9, "sharedInstance");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject updatePersonalNicknameIfNecessaryWithMeCardSharingResult:](v6, "updatePersonalNicknameIfNecessaryWithMeCardSharingResult:", v4);
  }
  else if (v7)
  {
    LOWORD(v10[0]) = 0;
    _os_log_impl(&dword_18F8BD000, v6, OS_LOG_TYPE_DEFAULT, "Not updating nickname with sharing result, sharing is disabled", (uint8_t *)v10, 2u);
  }

}

- (void)setSharingAudience:(unint64_t)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl(&dword_18F8BD000, v4, OS_LOG_TYPE_DEFAULT, "Updating Sharing Audience: %lu", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(getIMMeCardSharingStateControllerClass(), "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSharingAudience:", a3);

}

- (void)setSharingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  void *v5;
  _DWORD v6[2];
  uint64_t v7;

  v3 = a3;
  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_18F8BD000, v4, OS_LOG_TYPE_DEFAULT, "Updating Sharing Enabled: %d", (uint8_t *)v6, 8u);
  }

  objc_msgSend(getIMMeCardSharingStateControllerClass(), "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSharingEnabled:", v3);

}

- (void)setPersonalNicknameWithContact:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_18F8BD000, v5, OS_LOG_TYPE_DEFAULT, "Setting personal nickname with contact: %@", (uint8_t *)&v7, 0xCu);
  }

  -[CNNicknameProvider imNicknameProvider](self, "imNicknameProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPersonalNicknameWithContact:", v4);

}

- (id)nicknameForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNNicknameProvider imNicknameProvider](self, "imNicknameProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentNicknameForContact:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)nicknameAsContactForContact:(id)a3
{
  void *v4;
  void *v5;

  -[CNNicknameProvider nicknameForContact:](self, "nicknameForContact:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CNNicknameProvider contactFromNickname:](self, "contactFromNickname:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)contactFromNickname:(id)a3
{
  id v4;
  CNMutableContact *v5;
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

  v4 = a3;
  v5 = objc_alloc_init(CNMutableContact);
  objc_msgSend(v4, "firstName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMutableContact setGivenName:](v5, "setGivenName:", v6);

  objc_msgSend(v4, "lastName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMutableContact setFamilyName:](v5, "setFamilyName:", v7);

  -[CNNicknameProvider avatarImageFileURLForNickname:](self, "avatarImageFileURLForNickname:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fileManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataWithContentsOfURL:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNMutableContact setImageData:](v5, "setImageData:", v12);
    -[CNMutableContact setThumbnailImageData:](v5, "setThumbnailImageData:", v12);

  }
  -[CNNicknameProvider sharedWallpaperForNickname:](self, "sharedWallpaperForNickname:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMutableContact setWallpaper:](v5, "setWallpaper:", v13);

  -[CNNicknameProvider sharedWatchWallpaperImageDataForNickname:](self, "sharedWatchWallpaperImageDataForNickname:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMutableContact setWatchWallpaperImageData:](v5, "setWatchWallpaperImageData:", v14);

  -[CNMutableContact freeze](v5, "freeze");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)avatarImageFileURLForNickname:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "avatar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageFilePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)wallpaperFileURLForNickname:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "wallpaper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)watchWallpaperImageDataFileURLForNickname:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "wallpaper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowResFilePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)avatarImageFileURLForContact:(id)a3
{
  void *v4;
  void *v5;

  -[CNNicknameProvider nicknameForContact:](self, "nicknameForContact:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNNicknameProvider avatarImageFileURLForNickname:](self, "avatarImageFileURLForNickname:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)wallpaperFileURLForContact:(id)a3
{
  void *v4;
  void *v5;

  -[CNNicknameProvider nicknameForContact:](self, "nicknameForContact:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNNicknameProvider wallpaperFileURLForNickname:](self, "wallpaperFileURLForNickname:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)watchWallpaperImageDataFileURLForContact:(id)a3
{
  void *v4;
  void *v5;

  -[CNNicknameProvider nicknameForContact:](self, "nicknameForContact:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNNicknameProvider watchWallpaperImageDataFileURLForNickname:](self, "watchWallpaperImageDataFileURLForNickname:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sharedAvatarImageDataForContact:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[CNNicknameProvider nicknameForContact:](self, "nicknameForContact:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nicknameProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "avatarImageFileURLForNickname:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fileManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dataWithContentsOfURL:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)sharedWatchWallpaperImageDataForNickname:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0D13A38];
  v4 = a3;
  objc_msgSend(v3, "currentEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nicknameProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "watchWallpaperImageDataFileURLForNickname:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dataWithContentsOfURL:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)sharedWallpaperForNickname:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CNWallpaper *v11;
  void *v12;
  CNWallpaper *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nicknameProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wallpaperFileURLForNickname:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataWithContentsOfURL:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = [CNWallpaper alloc];
    objc_msgSend(v3, "wallpaper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[CNWallpaper initWithPosterArchiveData:contentIsSensitive:](v11, "initWithPosterArchiveData:contentIsSensitive:", v10, objc_msgSend(v12, "contentIsSensitive"));

    objc_msgSend(v3, "wallpaper");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "metadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v3, "wallpaper");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "metadata");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNWallpaper wallpaperIncludingIMWallpaperMetadata:](v13, "wallpaperIncludingIMWallpaperMetadata:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v13 = (CNWallpaper *)v18;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)isNicknameSharingEnabled
{
  void *v2;
  char v3;

  -[CNNicknameProvider sharingStateController](self, "sharingStateController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sharingEnabled");

  return v3;
}

- (unint64_t)sharingAudience
{
  void *v2;
  unint64_t v3;

  -[CNNicknameProvider sharingStateController](self, "sharingStateController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sharingAudience");

  return v3;
}

- (IMMeCardSharingStateController)sharingStateController
{
  return self->_sharingStateController;
}

- (void)setSharingStateController:(id)a3
{
  objc_storeStrong((id *)&self->_sharingStateController, a3);
}

- (void)setImNicknameProvider:(id)a3
{
  objc_storeStrong((id *)&self->_imNicknameProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imNicknameProvider, 0);
  objc_storeStrong((id *)&self->_sharingStateController, 0);
}

@end
