@implementation CNNicknameProviderTestDouble

- (CNNicknameProviderTestDouble)init
{
  return -[CNNicknameProviderTestDouble initWithFilePathsForContacts:](self, "initWithFilePathsForContacts:", MEMORY[0x1E0C9AA70]);
}

- (CNNicknameProviderTestDouble)initWithFilePathsForContacts:(id)a3
{
  id v4;
  CNNicknameProviderTestDouble *v5;
  uint64_t v6;
  NSMutableDictionary *filePathsForContacts;
  uint64_t v8;
  NSMutableDictionary *contactForNickname;
  CNNicknameProviderTestDouble *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNNicknameProviderTestDouble;
  v5 = -[CNNicknameProviderTestDouble init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    filePathsForContacts = v5->_filePathsForContacts;
    v5->_filePathsForContacts = (NSMutableDictionary *)v6;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    contactForNickname = v5->_contactForNickname;
    v5->_contactForNickname = (NSMutableDictionary *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)addFilePath:(id)a3 forContact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[CNNicknameProviderTestDouble filePathsForContacts](self, "filePathsForContacts");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKey:", v7, v8);
}

- (id)nicknameForContact:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v5 = (void *)getIMNicknameClass_softClass;
  v16 = getIMNicknameClass_softClass;
  if (!getIMNicknameClass_softClass)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __getIMNicknameClass_block_invoke;
    v12[3] = &unk_1E29F98A8;
    v12[4] = &v13;
    __getIMNicknameClass_block_invoke((uint64_t)v12);
    v5 = (void *)v14[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v13, 8);
  v7 = (void *)objc_msgSend([v6 alloc], "initWithMeContact:", v4);
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRecordID:", v8);

  -[CNNicknameProviderTestDouble contactForNickname](self, "contactForNickname");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v4, v10);

  return v7;
}

- (id)avatarImageFileURLForNickname:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CNNicknameProviderTestDouble filePathsForContacts](self, "filePathsForContacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)wallpaperFileURLForNickname:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CNNicknameProviderTestDouble filePathsForContacts](self, "filePathsForContacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)watchWallpaperImageDataFileURLForNickname:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CNNicknameProviderTestDouble filePathsForContacts](self, "filePathsForContacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)sharedAvatarImageDataForContact:(id)a3
{
  return 0;
}

- (BOOL)accountCanCreateSNaP
{
  return 1;
}

- (void)fetchPersonalNicknameAsContactWithCompletion:(id)a3
{
  id v4;
  CNNicknameProviderTestDouble *v5;
  id v6;

  v4 = a3;
  v5 = self;
  CNUnimplementedMethodException();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (BOOL)isNicknameSharingEnabled
{
  return 1;
}

- (id)sharedWallpaperForNickname:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CNWallpaper *v8;

  -[CNNicknameProviderTestDouble wallpaperFileURLForNickname:](self, "wallpaperFileURLForNickname:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataWithContentsOfURL:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[CNWallpaper initWithPosterArchiveData:]([CNWallpaper alloc], "initWithPosterArchiveData:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)sharedWatchWallpaperImageDataForNickname:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CNNicknameProviderTestDouble watchWallpaperImageDataFileURLForNickname:](self, "watchWallpaperImageDataFileURLForNickname:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataWithContentsOfURL:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)sharingAudience
{
  return 0;
}

- (id)nicknameAsContactForContact:(id)a3
{
  return 0;
}

- (NSMutableDictionary)filePathsForContacts
{
  return self->_filePathsForContacts;
}

- (void)setFilePathsForContacts:(id)a3
{
  objc_storeStrong((id *)&self->_filePathsForContacts, a3);
}

- (NSMutableDictionary)contactForNickname
{
  return self->_contactForNickname;
}

- (void)setContactForNickname:(id)a3
{
  objc_storeStrong((id *)&self->_contactForNickname, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactForNickname, 0);
  objc_storeStrong((id *)&self->_filePathsForContacts, 0);
}

@end
