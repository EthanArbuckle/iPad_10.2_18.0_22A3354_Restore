@implementation IMDCKDatabaseManager

- (CKContainer)truthContainer
{
  NSObject *v3;
  uint8_t v5[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Using Manatee Container", v5, 2u);
    }

  }
  return self->_manateeContainer;
}

+ (IMDCKDatabaseManager)sharedInstance
{
  if (qword_1ED935CC8 != -1)
    dispatch_once(&qword_1ED935CC8, &unk_1E922CA48);
  return (IMDCKDatabaseManager *)(id)qword_1ED935E00;
}

- (IMDCKDatabaseManager)init
{
  IMDCKDatabaseManager *v2;
  void *v3;
  int v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  CKContainer *manateeContainer;
  uint64_t v14;
  NSObject *v15;
  CKContainer *v16;
  objc_super v18;
  uint8_t buf[4];
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)IMDCKDatabaseManager;
  v2 = -[IMDCKDatabaseManager init](&v18, sel_init);
  if (v2 && (IMIsRunningInUnitTesting() & 1) == 0)
  {
    +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "shouldUseDevContainer");

    v6 = IMOSLoggingEnabled(v5);
    if (v4)
    {
      if (v6)
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v20 = CFSTR("com.apple.messages.cloud");
          _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "**** Initializing dev container with ID %@", buf, 0xCu);
        }

      }
      v8 = 2;
    }
    else
    {
      if (v6)
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v20 = CFSTR("com.apple.messages.cloud");
          _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Initializing production container %@", buf, 0xCu);
        }

      }
      v8 = 1;
    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C40]), "initWithContainerIdentifier:environment:", CFSTR("com.apple.messages.cloud"), v8);
    v11 = objc_alloc_init(MEMORY[0x1E0C94C50]);
    objc_msgSend(v11, "setMmcsEncryptionSupport:", 2);
    objc_msgSend(v11, "setUseZoneWidePCS:", 1);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:options:", v10, v11);
    manateeContainer = v2->_manateeContainer;
    v2->_manateeContainer = (CKContainer *)v12;

    if (IMOSLoggingEnabled(v14))
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = v2->_manateeContainer;
        *(_DWORD *)buf = 138412290;
        v20 = (const __CFString *)v16;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Manatee container %@", buf, 0xCu);
      }

    }
  }
  return v2;
}

- (BOOL)_serverSaysToUseOldContainer
{
  void *v2;
  void *v3;
  _BOOL4 v4;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  int v14;
  const __CFString *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("use-old-nickname-container"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue") != 0;
  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "getBoolFromDomain:forKey:", *MEMORY[0x1E0D38B48], CFSTR("UseOldProfilesContainer"));

  v7 = v6 | v4;
  if (IMOSLoggingEnabled(v8))
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = CFSTR("NO");
      v14 = 138412802;
      if (v7)
        v12 = CFSTR("YES");
      v15 = v12;
      v16 = 2112;
      v17 = v3;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Server says to use new container? %@ {serverbagValue: %@ version: %@}", (uint8_t *)&v14, 0x20u);

    }
  }

  return v7;
}

- (id)_nickNameContainerIdentifier
{
  if (-[IMDCKDatabaseManager _serverSaysToUseOldContainer](self, "_serverSaysToUseOldContainer"))
    return CFSTR("com.apple.internal.messages.memoji");
  else
    return CFSTR("com.apple.messages.profiles");
}

- (id)_nickNameContainer
{
  CKContainer *nickNameContainer;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  CKContainer **p_nickNameContainer;
  CKContainer *v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  nickNameContainer = self->_nickNameContainer;
  if (!nickNameContainer)
  {
    -[IMDCKDatabaseManager _nickNameContainerIdentifier](self, "_nickNameContainerIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "shouldUseDevNickNameContainer");

    v8 = IMOSLoggingEnabled(v7);
    if (v6)
    {
      if (v8)
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v18 = 138412290;
          v19 = v4;
          _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "**** Initializing dev nick name container with ID %@", (uint8_t *)&v18, 0xCu);
        }

      }
      v10 = 2;
    }
    else
    {
      if (v8)
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v18 = 138412290;
          v19 = v4;
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Initializing production container %@", (uint8_t *)&v18, 0xCu);
        }

      }
      v10 = 1;
    }
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C40]), "initWithContainerIdentifier:environment:", v4, v10);
    v13 = objc_alloc_init(MEMORY[0x1E0C94C50]);
    objc_msgSend(v13, "setUseZoneWidePCS:", 1);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:options:", v12, v13);
    v16 = self->_nickNameContainer;
    p_nickNameContainer = &self->_nickNameContainer;
    *p_nickNameContainer = (CKContainer *)v14;

    nickNameContainer = *p_nickNameContainer;
  }
  return nickNameContainer;
}

- (id)truthDatabase
{
  void *v2;
  void *v3;

  -[IMDCKDatabaseManager truthContainer](self, "truthContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privateCloudDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)truthPublicDatabase
{
  void *v2;
  void *v3;

  -[IMDCKDatabaseManager truthContainer](self, "truthContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "publicCloudDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)manateeDataBase
{
  void *v2;
  void *v3;

  -[IMDCKDatabaseManager manateeContainer](self, "manateeContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privateCloudDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)nickNamePublicDatabase
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v7;
  uint8_t v8[16];

  v3 = IMSharedHelperNickNameEnabled();
  if ((_DWORD)v3)
  {
    -[IMDCKDatabaseManager _nickNameContainer](self, "_nickNameContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "publicCloudDatabase");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    if (IMOSLoggingEnabled(v3))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Nicknames NOT enabled, returning nil public database", v8, 2u);
      }

    }
    return 0;
  }
}

- (void)fetchCurrentUserForNicknameContainer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[IMDCKDatabaseManager _nickNameContainer](self, "_nickNameContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1D1533CB0;
  v7[3] = &unk_1E922CA70;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchUserRecordIDWithCompletionHandler:", v7);

}

- (CKContainer)manateeContainer
{
  return self->_manateeContainer;
}

- (CKContainer)nickNameContainer
{
  return self->_nickNameContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nickNameContainer, 0);
  objc_storeStrong((id *)&self->_manateeContainer, 0);
}

@end
