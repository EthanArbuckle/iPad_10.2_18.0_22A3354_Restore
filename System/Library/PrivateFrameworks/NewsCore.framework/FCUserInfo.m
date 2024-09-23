@implementation FCUserInfo

+ (unint64_t)progressivePersonalization
{
  void *v2;
  int v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("AppCanShowSiriSuggestionsBlacklist"), CFSTR("com.apple.suggestions"));
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("com.apple.news"));

  if (v3)
    return 1;
  else
    return 2;
}

- (unint64_t)progressivePersonalization
{
  return objc_msgSend((id)objc_opt_class(), "progressivePersonalization");
}

- (int64_t)shortcutsOnboardingState
{
  void *v2;
  int64_t v3;

  -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("shortcutsOnboardingState"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (int64_t)sportsSyncState
{
  void *v2;
  int64_t v3;

  -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("sportsSyncState"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (id)_userInfoValueForKey:(id *)a1
{
  id v3;
  id v4;
  _QWORD v6[5];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "assertReadyForUse");
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__25;
    v13 = __Block_byref_object_dispose__25;
    v14 = 0;
    v4 = a1[16];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __35__FCUserInfo__userInfoValueForKey___block_invoke;
    v6[3] = &unk_1E463AD58;
    v8 = &v9;
    v6[4] = a1;
    v7 = v3;
    objc_msgSend(v4, "performReadSync:", v6);

    a1 = (id *)(id)v10[5];
    _Block_object_dispose(&v9, 8);

  }
  return a1;
}

void __35__FCUserInfo__userInfoValueForKey___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[15];
  v3 = a1[5];
  v7 = v2;
  objc_msgSend(v7, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (NSDate)userStartDate
{
  return (NSDate *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("userStartDate"));
}

+ (unint64_t)localStoreVersion
{
  return 2;
}

+ (id)localStoreFilename
{
  return CFSTR("userinfo");
}

+ (id)commandStoreFileName
{
  return CFSTR("userinfo-commands");
}

+ (int64_t)commandQueueUrgency
{
  return 2;
}

- (void)setDateLastOpened:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  FCModifyUserInfoCommand *v8;
  void *v9;
  FCModifyUserInfoCommand *v10;
  id v11;

  v11 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  -[FCUserInfo dateLastOpened](self, "dateLastOpened");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4
    || (objc_msgSend(v4, "dateByAddingTimeInterval:", 86400.0),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v11, "fc_isLaterThan:", v6),
        v6,
        v7))
  {
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v11, CFSTR("lastOpenedDate"));
    v8 = [FCModifyUserInfoCommand alloc];
    -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v8, "initWithUserInfoRecord:", v9);

    -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v10);
  }

}

- (NSDate)dateLastOpened
{
  return (NSDate *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("lastOpenedDate"));
}

- (NSString)sportsUserID
{
  void *v3;
  void *v4;
  id v5;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("sportsUserID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[FCUserInfo _temporaryUserIDForKey:]((uint64_t)self, (uint64_t)CFSTR("sportsUserID"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Sports user ID was requested from UserInfo before a temporary one had been generated"));
        v8 = 136315906;
        v9 = "-[FCUserInfo sportsUserID]";
        v10 = 2080;
        v11 = "FCUserInfo.m";
        v12 = 1024;
        v13 = 385;
        v14 = 2114;
        v15 = v7;
        _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: MissingTemporarySportsUserID) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);

      }
      v5 = 0;
    }
  }

  return (NSString *)v5;
}

- (NSString)adsUserID
{
  void *v3;
  void *v4;
  id v5;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("adsUserID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[FCUserInfo _temporaryUserIDForKey:]((uint64_t)self, (uint64_t)CFSTR("adsUserID"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Ads user ID was requested from UserInfo before a temporary one had been generated"));
        v8 = 136315906;
        v9 = "-[FCUserInfo adsUserID]";
        v10 = 2080;
        v11 = "FCUserInfo.m";
        v12 = 1024;
        v13 = 372;
        v14 = 2114;
        v15 = v7;
        _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: MissingTemporaryAdsUserID) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);

      }
      v5 = 0;
    }
  }

  return (NSString *)v5;
}

- (id)_temporaryUserIDForKey:(uint64_t)a1
{
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    objc_msgSend(CFSTR("temporary-user-id-"), "stringByAppendingString:", a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    NewsCoreSensitiveUserDefaults();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)loadLocalCachesFromStore
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSDictionary *readOnlyUserInfo;
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
  id v20;

  -[FCPrivateDataController localStore](self, "localStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo setReadOnlyUserInfo:]((uint64_t)self, v4);

  NewsCoreSensitiveUserDefaults();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringForKey:", CFSTR("widget_assigned_user_id"));
  v20 = (id)objc_claimAutoreleasedReturnValue();

  NewsCoreSensitiveUserDefaults();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("widget_assigned_user_id"));

  if (self)
    readOnlyUserInfo = self->_readOnlyUserInfo;
  else
    readOnlyUserInfo = 0;
  -[NSDictionary objectForKeyedSubscript:](readOnlyUserInfo, "objectForKeyedSubscript:", CFSTR("feldsparID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  NewsCoreSensitiveUserDefaults();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("temporary-fsid"));

    NewsCoreSensitiveUserDefaults();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", CFSTR("temporary-fsid-creation-date"));
  }
  else
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("temporary-fsid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      NewsCoreSensitiveUserDefaults();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v20)
      {
        objc_msgSend(v12, "setObject:forKey:", v20, CFSTR("temporary-fsid"));
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "UUIDString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("temporary-fsid"));

      }
      NewsCoreSensitiveUserDefaults();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKey:", v17, CFSTR("temporary-fsid-creation-date"));

      v11 = 0;
    }
  }

  -[FCUserInfo _generateTemporaryUserIDIfNeededForKey:]((uint64_t)self, CFSTR("sportsUserID"));
  -[FCUserInfo _generateTemporaryUserIDIfNeededForKey:]((uint64_t)self, CFSTR("adsUserID"));
  -[FCUserInfo tagSettings](self, "tagSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "loadLocalCachesFromStore");

  -[FCUserInfo puzzleTypeSettings](self, "puzzleTypeSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "loadLocalCachesFromStore");

}

- (void)_generateTemporaryUserIDIfNeededForKey:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (a1)
  {
    v3 = a2;
    objc_msgSend(CFSTR("temporary-user-id-"), "stringByAppendingString:", v3);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 120), "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    NewsCoreSensitiveUserDefaults();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      objc_msgSend(v5, "removeObjectForKey:", v11);
    }
    else
    {
      objc_msgSend(v5, "objectForKey:", v11);
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
      if (!v7)
      {
        NewsCoreSensitiveUserDefaults();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "UUIDString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v10, v11);

        v6 = 0;
      }
    }

  }
}

- (FCTagSettings)tagSettings
{
  return self->_tagSettings;
}

- (FCPuzzleTypeSettings)puzzleTypeSettings
{
  return self->_puzzleTypeSettings;
}

- (void)setReadOnlyUserInfo:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 120), a2);
}

- (void)maybeUpdateOnboardingVersion:(id)a3
{
  void (**v4)(id, _QWORD);
  uint64_t v5;
  unsigned int (**v6)(void);
  _QWORD v7[5];
  unsigned int (**v8)(void);
  void (**v9)(id, _QWORD);
  _QWORD aBlock[5];

  v4 = (void (**)(id, _QWORD))a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__FCUserInfo_maybeUpdateOnboardingVersion___block_invoke;
  aBlock[3] = &unk_1E463AB90;
  aBlock[4] = self;
  v6 = (unsigned int (**)(void))_Block_copy(aBlock);
  if (v6[2]())
  {
    if (v4)
      v4[2](v4, 0);
  }
  else
  {
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __43__FCUserInfo_maybeUpdateOnboardingVersion___block_invoke_2;
    v7[3] = &unk_1E46402D8;
    v8 = v6;
    v9 = v4;
    v7[4] = self;
    -[FCPrivateDataController performFirstSyncWithCallbackQueue:completion:](self, "performFirstSyncWithCallbackQueue:completion:", MEMORY[0x1E0C80D38], v7);

  }
}

void __43__FCUserInfo_maybeUpdateOnboardingVersion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
  {
    v2 = *(_QWORD *)(a1 + 48);
    if (v2)
      (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "onboardingVersionNumber");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if (objc_msgSend(v4, "integerValue") < 5)
      {
        objc_msgSend(*(id *)(a1 + 32), "setMarketingNotificationsEnabled:", 1);
        objc_msgSend(*(id *)(a1 + 32), "setOnboardingVersionNumber:", &unk_1E470A808);
      }
      if (objc_msgSend(v4, "integerValue") <= 5)
      {
        objc_msgSend(*(id *)(a1 + 32), "setEndOfAudioTrackNotificationsEnabled:", 1);
        objc_msgSend(*(id *)(a1 + 32), "setOnboardingVersionNumber:", &unk_1E470A820);
      }
    }
    v3 = *(_QWORD *)(a1 + 48);
    if (v3)
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);

  }
}

uint64_t __43__FCUserInfo_maybeUpdateOnboardingVersion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mightNeedToUpdateOnboardingVersion") ^ 1;
}

- (BOOL)mightNeedToUpdateOnboardingVersion
{
  void *v3;
  uint64_t v4;
  void *v6;
  uint64_t v7;

  -[FCUserInfo onboardingVersionNumber](self, "onboardingVersionNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if (v4 > 6)
    return 0;
  -[FCUserInfo onboardingVersionNumber](self, "onboardingVersionNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  return v7 != 6;
}

- (NSNumber)onboardingVersionNumber
{
  return (NSNumber *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("finishFirstLaunchVersion"));
}

- (int64_t)sportsOnboardingState
{
  void *v2;
  int64_t v3;

  -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("sportsOnboardingState"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)addObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCUserInfo;
  -[FCPrivateDataController addObserver:](&v3, sel_addObserver_, a3);
}

- (NSString)feldsparID
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[FCUserInfo overrideFeldsparID](FCUserInfo, "overrideFeldsparID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
  }
  else
  {
    -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("feldsparID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v4 = v5;
    }
    else
    {
      NewsCoreSensitiveUserDefaults();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("temporary-fsid"));
      v4 = (id)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("FSID was requested from UserInfo before a temporary one had been generated"));
          v10 = 136315906;
          v11 = "-[FCUserInfo feldsparID]";
          v12 = 2080;
          v13 = "FCUserInfo.m";
          v14 = 1024;
          v15 = 334;
          v16 = 2114;
          v17 = v9;
          _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: MissingTemporaryFSID) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);

        }
        v4 = 0;
      }
    }

  }
  return (NSString *)v4;
}

+ (id)overrideFeldsparID
{
  if (qword_1ED0F7C98 != -1)
    dispatch_once(&qword_1ED0F7C98, &__block_literal_global_134);
  return (id)qword_1ED0F7C90;
}

- (void)prepareForUse
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)FCUserInfo;
  -[FCPrivateDataController prepareForUse](&v21, sel_prepareForUse);
  -[FCUserInfo notificationsUserID](self, "notificationsUserID");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        -[FCUserInfo notificationsUserID](self, "notificationsUserID"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "length"),
        v5,
        v4,
        !v6))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v8, CFSTR("notificationsUserID"));
    v9 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v8;
      _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_INFO, "Generated a new notificationsUserID: %@", buf, 0xCu);
    }

  }
  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isPrivateDataSyncingEnabled");

  if ((v11 & 1) == 0)
  {
    -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("notificationsUserID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "hasSuffix:", CFSTR("-NoSync")) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "stringByAppendingString:", CFSTR("-NoSync"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v12, CFSTR("notificationsUserID"));
      v15 = FCPushNotificationsLog;
      if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v12;
        _os_log_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_INFO, "Private data syncing is disabled, generated a new notificationsUserID: %@", buf, 0xCu);
      }
    }

  }
  if (self)
  {
    -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("adsUserIDCreatedDate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  v17 = -[FCUserInfo _shouldRotateAdsUserIDWithCreatedDate:]((id *)&self->super.super.isa, v16);

  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v19, CFSTR("adsUserID"));
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v20, CFSTR("adsUserIDCreatedDate"));

  }
}

- (NSString)notificationsUserID
{
  return -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("notificationsUserID"));
}

- (uint64_t)_shouldRotateAdsUserIDWithCreatedDate:(id *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (v3)
    {
      NewsCoreUserDefaults();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", CFSTR("settings.analytics.identifiers.ad_identifier_rotation_interval"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = 5184000.0;
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v7 = (double)objc_msgSend(v6, "integerValue") * 86400.0;
      }
      objc_msgSend(v4, "dateByAddingTimeInterval:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "fc_isEarlierThanOrEqualTo:", v9);

    }
    else
    {
      -[FCUserInfo _userInfoValueForKey:](a1, CFSTR("adsUserID"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v6 != 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)endOfAudioTrackNotificationsEnabled
{
  void *v2;
  char v3;

  -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("endOfAudioNotificationsEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isUsingPlaceholderFSID
{
  void *v2;
  BOOL v3;

  -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("feldsparID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (BOOL)puzzleNotificationsEnabled
{
  void *v2;
  char v3;

  -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("puzzleNotificationsEnabled2"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)newIssueNotificationsEnabled
{
  void *v2;
  char v3;

  -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("newIssueNotificationsEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)marketingNotificationsEnabled
{
  void *v2;
  char v3;

  -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("marketingNotificationsEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSDate)puzzleStatsStartDate
{
  return (NSDate *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("puzzleStatsStartDate"));
}

- (NSString)canonicalLanguage
{
  return -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("canonicalLanguage"));
}

- (FCUserInfo)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5
{
  FCUserInfo *v5;
  FCTagSettings *v6;
  void *v7;
  uint64_t v8;
  FCTagSettings *tagSettings;
  FCPuzzleTypeSettings *v10;
  void *v11;
  uint64_t v12;
  FCPuzzleTypeSettings *puzzleTypeSettings;
  FCMTWriterLock *v14;
  FCMTWriterLock *userInfoLock;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)FCUserInfo;
  v5 = -[FCPrivateDataController initWithContext:pushNotificationCenter:storeDirectory:](&v17, sel_initWithContext_pushNotificationCenter_storeDirectory_, a3, a4, a5);
  if (v5)
  {
    v6 = [FCTagSettings alloc];
    -[FCPrivateDataController localStore](v5, "localStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[FCTagSettings initWithStore:tagSettingsDelegate:](v6, "initWithStore:tagSettingsDelegate:", v7, v5);
    tagSettings = v5->_tagSettings;
    v5->_tagSettings = (FCTagSettings *)v8;

    v10 = [FCPuzzleTypeSettings alloc];
    -[FCPrivateDataController localStore](v5, "localStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[FCPuzzleTypeSettings initWithStore:delegate:](v10, "initWithStore:delegate:", v11, v5);
    puzzleTypeSettings = v5->_puzzleTypeSettings;
    v5->_puzzleTypeSettings = (FCPuzzleTypeSettings *)v12;

    v14 = objc_alloc_init(FCMTWriterLock);
    userInfoLock = v5->_userInfoLock;
    v5->_userInfoLock = v14;

  }
  return v5;
}

void __32__FCUserInfo_overrideFeldsparID__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  if (NFInternalBuild())
  {
    NewsCoreUserDefaults();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "BOOLForKey:", CFSTR("enable_overrides_user_segmentation")) & 1) != 0)
    {
      NewsCoreUserDefaults();
      v0 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v0, "stringForKey:", CFSTR("override_feldspar_id_user_segmentation"));
      v1 = objc_claimAutoreleasedReturnValue();
      v2 = (void *)qword_1ED0F7C90;
      qword_1ED0F7C90 = v1;

    }
    else
    {
      v0 = (void *)qword_1ED0F7C90;
      qword_1ED0F7C90 = 0;
    }

    v3 = v4;
  }
  else
  {
    v3 = (void *)qword_1ED0F7C90;
    qword_1ED0F7C90 = 0;
  }

}

- (void)loadFeldsparIDWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  _QWORD v6[5];
  void (**v7)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("feldsparID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v4[2](v4);
  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43__FCUserInfo_loadFeldsparIDWithCompletion___block_invoke_2;
    v6[3] = &unk_1E463D8B8;
    v6[4] = self;
    v7 = v4;
    -[FCPrivateDataController performFirstSyncWithCallbackQueue:completion:](self, "performFirstSyncWithCallbackQueue:completion:", MEMORY[0x1E0C80D38], v6);

  }
}

- (void)_setUserInfoValue:(void *)a3 forKey:
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __39__FCUserInfo__setUserInfoValue_forKey___block_invoke;
    v8[3] = &unk_1E4640300;
    v9 = v6;
    v10 = v5;
    -[FCUserInfo _modifyUserInfoWithBlock:](a1, v8);

  }
}

+ (id)desiredKeys
{
  if (qword_1ED0F7C88 != -1)
    dispatch_once(&qword_1ED0F7C88, &__block_literal_global_57_1);
  return (id)_MergedGlobals_13;
}

void __25__FCUserInfo_desiredKeys__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  __FCCKUserInfoKeys_block_invoke();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObjectsFromArray:", v1);

  __FCCKTagSettingsKeys_block_invoke();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObjectsFromArray:", v2);

  __FCCKPuzzleTypeSettingsKeys_block_invoke();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObjectsFromArray:", v3);

  v4 = (void *)_MergedGlobals_13;
  _MergedGlobals_13 = (uint64_t)v0;

}

- (void)setOnboardingVersionNumber:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  FCModifyUserInfoCommand *v18;
  void *v19;
  FCModifyUserInfoCommand *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v5 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    NSStringFromFCOnboardingVersionNumber(objc_msgSend(v4, "integerValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v27 = v4;
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_INFO, "Onboarding version number being set to %@ (%@)", buf, 0x16u);

  }
  if (objc_msgSend(v4, "intValue") == 4)
  {
    -[FCUserInfo onboardingVersionNumber](self, "onboardingVersionNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "intValue");

    if (v9 == 3)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBool:forKey:", 1, CFSTR("onboarding_completed_from_personalize_news"));

    }
  }
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v4, CFSTR("finishFirstLaunchVersion"));
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[FCPrivateDataController observers](self, "observers", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v16);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v17, "userInfoDidChangeOnboardingStatus:", self);
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

  v18 = [FCModifyUserInfoCommand alloc];
  -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v18, "initWithUserInfoRecord:", v19);

  -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v20);
}

- (id)asCKRecord
{
  id *v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v1 = a1;
  if (a1)
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x3032000000;
    v8 = __Block_byref_object_copy__25;
    v9 = __Block_byref_object_dispose__25;
    v10 = 0;
    v2 = a1[16];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __24__FCUserInfo_asCKRecord__block_invoke;
    v4[3] = &unk_1E463AD80;
    v4[4] = v1;
    v4[5] = &v5;
    objc_msgSend(v2, "performReadSync:", v4);

    v1 = (id *)(id)v6[5];
    _Block_object_dispose(&v5, 8);

  }
  return v1;
}

void __43__FCUserInfo_loadFeldsparIDWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  FCModifyUserInfoCommand *v5;
  void *v6;
  FCModifyUserInfoCommand *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a3
    || (-[FCUserInfo _userInfoValueForKey:](*(id **)(a1 + 32), CFSTR("feldsparID")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    -[FCUserInfo _modifyUserInfoWithBlock:](*(_QWORD *)(a1 + 32), &__block_literal_global_65);
    v5 = [FCModifyUserInfoCommand alloc];
    -[FCUserInfo asCKRecord](*(id **)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v5, "initWithUserInfoRecord:", v6);

    objc_msgSend(*(id *)(a1 + 32), "addCommandToCommandQueue:", v7);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "observers", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v14, "userInfoDidChangeFeldsparID:fromCloud:", *(_QWORD *)(a1 + 32), 0);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __43__FCUserInfo_loadFeldsparIDWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = a2;
  NewsCoreSensitiveUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("temporary-fsid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v7 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("feldsparID"));

}

- (uint64_t)_modifyUserInfoWithBlock:(uint64_t)result
{
  _QWORD *v2;
  void *v3;
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  _QWORD v7[5];

  if (result)
  {
    v2 = (_QWORD *)result;
    v3 = (void *)MEMORY[0x1E0CB3978];
    v4 = a2;
    objc_msgSend(v3, "isMainThread");
    objc_msgSend(v2, "localStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v5);

    v6 = (void *)v2[16];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __39__FCUserInfo__modifyUserInfoWithBlock___block_invoke;
    v7[3] = &unk_1E463AB18;
    v7[4] = v2;
    return objc_msgSend(v6, "performWriteSync:", v7);
  }
  return result;
}

- (void)resetUserIDs
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  FCModifyUserInfoCommand *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[16];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v3 = FCUserInfoLog;
  if (os_log_type_enabled((os_log_t)FCUserInfoLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1B90000, v3, OS_LOG_TYPE_DEFAULT, "Resetting user IDs", buf, 2u);
  }
  -[FCUserInfo _modifyUserInfoWithBlock:]((uint64_t)self, &__block_literal_global_69);
  NewsCoreSensitiveUserDefaults();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("temporary-fsid"));

  NewsCoreSensitiveUserDefaults();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("temporary-fsid-creation-date"));

  NewsCoreSensitiveUserDefaults();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("report_concern_user_id"));

  -[FCUserInfo _clearTemporaryUserIDForKey:]((uint64_t)self, (uint64_t)CFSTR("sportsUserID"));
  -[FCUserInfo _clearTemporaryUserIDForKey:]((uint64_t)self, (uint64_t)CFSTR("adsUserID"));
  v7 = [FCModifyUserInfoCommand alloc];
  -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v7, "initWithUserInfoRecord:", v8);

  v17 = (void *)v9;
  -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v9);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[FCPrivateDataController observers](self, "observers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "userInfoDidChangeFeldsparID:fromCloud:", self, 0);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "userInfoDidChangeAdsUserID:fromCloud:", self, 0);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "userInfoDidChangeSportsUserID:", self);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v13);
  }

}

void __26__FCUserInfo_resetUserIDs__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v2 = (void *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  objc_msgSend(v2, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("feldsparID"));

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("adsUserID"));

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("sportsUserID"));

}

- (void)_clearTemporaryUserIDForKey:(uint64_t)a1
{
  void *v2;
  id v3;

  if (a1)
  {
    objc_msgSend(CFSTR("temporary-user-id-"), "stringByAppendingString:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    NewsCoreSensitiveUserDefaults();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeObjectForKey:", v3);

  }
}

- (void)setFeldsparID:(id)a3
{
  id v4;
  FCModifyUserInfoCommand *v5;
  void *v6;
  FCModifyUserInfoCommand *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v4, CFSTR("feldsparID"));
  v5 = [FCModifyUserInfoCommand alloc];
  -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v5, "initWithUserInfoRecord:", v6);

  -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v7);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[FCPrivateDataController observers](self, "observers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "userInfoDidChangeFeldsparID:fromCloud:", self, 0);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (double)ageOfPlaceholderFSID
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  NewsCoreSensitiveUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("temporary-fsid-creation-date"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "fc_timeIntervalUntilNow");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (void)setAdsUserID:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = a3;
  objc_msgSend(v4, "isMainThread");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _persistAdsUserID:createdDate:]((id *)&self->super.super.isa, v5, v6);

}

- (void)_persistAdsUserID:(void *)a3 createdDate:
{
  id v5;
  FCModifyUserInfoCommand *v6;
  void *v7;
  FCModifyUserInfoCommand *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)a1, a2, CFSTR("adsUserID"));
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)a1, v5, CFSTR("adsUserIDCreatedDate"));
    v6 = [FCModifyUserInfoCommand alloc];
    -[FCUserInfo asCKRecord](a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v6, "initWithUserInfoRecord:", v7);

    objc_msgSend(a1, "addCommandToCommandQueue:", v8);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(a1, "observers", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v14);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v15, "userInfoDidChangeAdsUserID:fromCloud:", a1, 0);
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

  }
}

- (void)setSportsUserID:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = a3;
  objc_msgSend(v4, "isMainThread");
  -[FCUserInfo _persistSportsUserID:]((id *)&self->super.super.isa, v5);

}

- (void)_persistSportsUserID:(id *)a1
{
  FCModifyUserInfoCommand *v3;
  void *v4;
  FCModifyUserInfoCommand *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)a1, a2, CFSTR("sportsUserID"));
    v3 = [FCModifyUserInfoCommand alloc];
    -[FCUserInfo asCKRecord](a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v3, "initWithUserInfoRecord:", v4);

    objc_msgSend(a1, "addCommandToCommandQueue:", v5);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(a1, "observers", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v12, "userInfoDidChangeSportsUserID:", a1);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
}

- (NSString)editorialArticleVersion
{
  return -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("editorialArticleVersion"));
}

- (unint64_t)sportsTopicNotificationsEnabledState
{
  void *v2;
  unint64_t v3;

  -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("sportsTopicNotificationsEnabledState2"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setUserStartDate:(id)a3
{
  void *v4;
  id v5;
  FCModifyUserInfoCommand *v6;
  void *v7;
  FCModifyUserInfoCommand *v8;

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = a3;
  objc_msgSend(v4, "isMainThread");
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v5, CFSTR("userStartDate"));

  v6 = [FCModifyUserInfoCommand alloc];
  -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v6, "initWithUserInfoRecord:", v7);

  -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v8);
}

- (BOOL)shouldShowDefaultForYou
{
  void *v2;
  uint64_t v3;

  -[FCUserInfo onboardingVersionNumber](self, "onboardingVersionNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3 == 3;
}

- (BOOL)hasShownProgressivePersonalizationWelcomeBrick
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("personalization_reset_progressive_personalization_opt_in"));

  if (v3)
  {
    NewsCoreUserDefaults();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBool:forKey:", 0, CFSTR("has_show_personalization_brick"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBool:forKey:", 0, CFSTR("personalization_reset_progressive_personalization_opt_in"));

  }
  v6 = objc_msgSend((id)objc_opt_class(), "progressivePersonalization");
  if (v6 != 1)
  {
    NewsCoreUserDefaults();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("has_show_personalization_brick"));

    LOBYTE(v6) = v8;
  }
  return v6;
}

- (void)setHasShownProgressivePersonalizationWelcomeBrick:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  NewsCoreUserDefaults();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("has_show_personalization_brick"));

}

- (BOOL)userHasCompletedFavoritesSetup
{
  void *v2;
  char v3;

  NewsCoreUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("user_has_completed_favorites_setup"));

  return v3;
}

- (void)setUserHasCompletedFavoritesSetup:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  NewsCoreUserDefaults();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("user_has_completed_favorites_setup"));

}

- (void)setSportsOnboardingState:(int64_t)a3
{
  void *v5;
  void *v6;
  FCModifyUserInfoCommand *v7;
  void *v8;
  FCModifyUserInfoCommand *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v5, CFSTR("sportsOnboardingState"));

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v6, CFSTR("sportsOnboardingCompletedDate"));

  v7 = [FCModifyUserInfoCommand alloc];
  -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v7, "initWithUserInfoRecord:", v8);

  -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v9);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[FCPrivateDataController observers](self, "observers", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "userInfoDidChangeSportsOnboardingState:", self);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

- (void)setShortcutsOnboardingState:(int64_t)a3
{
  void *v5;
  void *v6;
  FCModifyUserInfoCommand *v7;
  void *v8;
  FCModifyUserInfoCommand *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v5, CFSTR("shortcutsOnboardingState"));

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v6, CFSTR("shortcutsOnboardingCompletedDate"));

  v7 = [FCModifyUserInfoCommand alloc];
  -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v7, "initWithUserInfoRecord:", v8);

  -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v9);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[FCPrivateDataController observers](self, "observers", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "userInfoDidChangeShortcutsOnboardingState:", self);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

- (NSDate)shortcutsOnboardingStateCompletedDate
{
  return (NSDate *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("shortcutsOnboardingCompletedDate"));
}

- (NSDate)sportsOnboardingCompletedDate
{
  return (NSDate *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("sportsOnboardingCompletedDate"));
}

- (NSDate)sportsSyncStateLastSavedDate
{
  return (NSDate *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("sportsSyncStateLastSavedDate"));
}

- (void)setSportsSyncState:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  FCModifyUserInfoCommand *v9;
  void *v10;
  FCModifyUserInfoCommand *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("sportsSyncState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v7, CFSTR("sportsSyncState"));

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v8, CFSTR("sportsSyncStateLastSavedDate"));

  v9 = [FCModifyUserInfoCommand alloc];
  -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v9, "initWithUserInfoRecord:", v10);

  -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v11);
  if (v5 != v6)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[FCPrivateDataController observers](self, "observers", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v17);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v18, "userInfoDidChangeSportsSyncState:", self);
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v15);
    }

  }
}

- (NSDate)newsletterSignupLastSeenDate
{
  id *p_isa;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  p_isa = (id *)&self->super.super.isa;
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("newsletterSignupLastSeenDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (p_isa)
  {
    -[FCUserInfo _userInfoValueForKey:](p_isa, CFSTR("personalizedNewsletterSignupLastSeenDate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCUserInfo _userInfoValueForKey:](p_isa, CFSTR("issuesNewsletterOptinLastSeenDate"));
    p_isa = (id *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v3, "arrayWithObjects:", v4, v5, p_isa, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", 0, 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortUsingDescriptors:", v8);

  objc_msgSend(v6, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v9;
}

- (void)setNewsletterSignupLastSeenDate:(id)a3
{
  void *v4;
  id v5;
  FCModifyUserInfoCommand *v6;
  void *v7;
  void *v8;
  id v9;
  FCModifyUserInfoCommand *v10;
  void *v11;
  FCModifyUserInfoCommand *v12;
  void *v13;
  id v14;
  FCModifyUserInfoCommand *v15;
  void *v16;
  FCModifyUserInfoCommand *v17;
  FCModifyUserInfoCommand *v18;

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = a3;
  objc_msgSend(v4, "isMainThread");
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v5, CFSTR("newsletterSignupLastSeenDate"));
  v6 = [FCModifyUserInfoCommand alloc];
  -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v6, "initWithUserInfoRecord:", v7);

  -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v18);
  if (self)
  {
    v8 = (void *)MEMORY[0x1E0CB3978];
    v9 = v5;
    objc_msgSend(v8, "isMainThread");
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v9, CFSTR("personalizedNewsletterSignupLastSeenDate"));

    v10 = [FCModifyUserInfoCommand alloc];
    -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v10, "initWithUserInfoRecord:", v11);

    -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v12);
    v13 = (void *)MEMORY[0x1E0CB3978];
    v14 = v9;
    objc_msgSend(v13, "isMainThread");
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v14, CFSTR("issuesNewsletterOptinLastSeenDate"));

    v15 = [FCModifyUserInfoCommand alloc];
    -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v15, "initWithUserInfoRecord:", v16);

    -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v17);
  }

}

- (NSNumber)monthlyALaCarteSubscriptionMeteredCount
{
  return (NSNumber *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("monthlyMeteredCount"));
}

- (void)setMonthlyALaCarteSubscriptionMeteredCount:(id)a3
{
  void *v4;
  id v5;
  FCModifyUserInfoCommand *v6;
  void *v7;
  FCModifyUserInfoCommand *v8;

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = a3;
  objc_msgSend(v4, "isMainThread");
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v5, CFSTR("monthlyMeteredCount"));

  v6 = [FCModifyUserInfoCommand alloc];
  -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v6, "initWithUserInfoRecord:", v7);

  -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v8);
}

- (NSDate)aLaCarteSubscriptionMeteredCountLastResetDate
{
  return (NSDate *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("meteredCountLastResetDate"));
}

- (void)setALaCarteSubscriptionMeteredCountLastResetDate:(id)a3
{
  void *v4;
  id v5;
  FCModifyUserInfoCommand *v6;
  void *v7;
  FCModifyUserInfoCommand *v8;

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = a3;
  objc_msgSend(v4, "isMainThread");
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v5, CFSTR("meteredCountLastResetDate"));

  v6 = [FCModifyUserInfoCommand alloc];
  -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v6, "initWithUserInfoRecord:", v7);

  -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v8);
}

- (NSNumber)monthlyBundleSubscriptionMeteredCount
{
  return (NSNumber *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("monthlyPaidBundleMeteredCount"));
}

- (void)setMonthlyBundleSubscriptionMeteredCount:(id)a3
{
  void *v4;
  id v5;
  FCModifyUserInfoCommand *v6;
  void *v7;
  FCModifyUserInfoCommand *v8;

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = a3;
  objc_msgSend(v4, "isMainThread");
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v5, CFSTR("monthlyPaidBundleMeteredCount"));

  v6 = [FCModifyUserInfoCommand alloc];
  -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v6, "initWithUserInfoRecord:", v7);

  -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v8);
}

- (NSDate)bundleSubscriptionMeteredCountLastResetDate
{
  return (NSDate *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("paidBundleMeteredCountLastResetDate"));
}

- (void)setBundleSubscriptionMeteredCountLastResetDate:(id)a3
{
  void *v4;
  id v5;
  FCModifyUserInfoCommand *v6;
  void *v7;
  FCModifyUserInfoCommand *v8;

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = a3;
  objc_msgSend(v4, "isMainThread");
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v5, CFSTR("paidBundleMeteredCountLastResetDate"));

  v6 = [FCModifyUserInfoCommand alloc];
  -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v6, "initWithUserInfoRecord:", v7);

  -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v8);
}

- (NSNumber)upsellAppLaunchCount
{
  return (NSNumber *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("upsellAppLaunchCount"));
}

- (void)setUpsellAppLaunchCount:(id)a3
{
  void *v4;
  id v5;
  FCModifyUserInfoCommand *v6;
  void *v7;
  FCModifyUserInfoCommand *v8;

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = a3;
  objc_msgSend(v4, "isMainThread");
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v5, CFSTR("upsellAppLaunchCount"));

  v6 = [FCModifyUserInfoCommand alloc];
  -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v6, "initWithUserInfoRecord:", v7);

  -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v8);
}

- (NSString)lastAppLaunchUpsellInstanceID
{
  return -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("lastAppLaunchUpsellInstanceID"));
}

- (void)setLastAppLaunchUpsellInstanceID:(id)a3
{
  void *v4;
  id v5;
  FCModifyUserInfoCommand *v6;
  void *v7;
  FCModifyUserInfoCommand *v8;

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = a3;
  objc_msgSend(v4, "isMainThread");
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v5, CFSTR("lastAppLaunchUpsellInstanceID"));

  v6 = [FCModifyUserInfoCommand alloc];
  -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v6, "initWithUserInfoRecord:", v7);

  -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v8);
}

- (NSDate)appLaunchUpsellLastSeenDate
{
  return (NSDate *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("upsellAppLaunchLastSeenDate"));
}

- (void)setAppLaunchUpsellLastSeenDate:(id)a3
{
  void *v4;
  id v5;
  FCModifyUserInfoCommand *v6;
  void *v7;
  FCModifyUserInfoCommand *v8;

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = a3;
  objc_msgSend(v4, "isMainThread");
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v5, CFSTR("upsellAppLaunchLastSeenDate"));

  v6 = [FCModifyUserInfoCommand alloc];
  -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v6, "initWithUserInfoRecord:", v7);

  -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v8);
}

- (NSString)appLaunchUpsellLastShownCampaignID
{
  return -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("upsellAppLaunchLastShownCampaignID"));
}

- (void)setAppLaunchUpsellLastShownCampaignID:(id)a3
{
  void *v4;
  id v5;
  FCModifyUserInfoCommand *v6;
  void *v7;
  FCModifyUserInfoCommand *v8;

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = a3;
  objc_msgSend(v4, "isMainThread");
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v5, CFSTR("upsellAppLaunchLastShownCampaignID"));

  v6 = [FCModifyUserInfoCommand alloc];
  -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v6, "initWithUserInfoRecord:", v7);

  -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v8);
}

- (NSString)appLaunchUpsellLastPresenterBundleID
{
  return -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("upsellAppLaunchLastPresenterBundleID"));
}

- (void)setAppLaunchUpsellLastPresenterBundleID:(id)a3
{
  void *v4;
  id v5;
  FCModifyUserInfoCommand *v6;
  void *v7;
  FCModifyUserInfoCommand *v8;

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = a3;
  objc_msgSend(v4, "isMainThread");
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v5, CFSTR("upsellAppLaunchLastPresenterBundleID"));

  v6 = [FCModifyUserInfoCommand alloc];
  -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v6, "initWithUserInfoRecord:", v7);

  -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v8);
}

- (NSDate)postPurchaseOnboardingLastShownDate
{
  return (NSDate *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("postPurchaseOnboardingLastSeenDate"));
}

- (void)setPostPurchaseOnboardingLastShownDate:(id)a3
{
  void *v4;
  id v5;
  FCModifyUserInfoCommand *v6;
  void *v7;
  FCModifyUserInfoCommand *v8;

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = a3;
  objc_msgSend(v4, "isMainThread");
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v5, CFSTR("postPurchaseOnboardingLastSeenDate"));

  v6 = [FCModifyUserInfoCommand alloc];
  -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v6, "initWithUserInfoRecord:", v7);

  -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v8);
}

- (void)refreshOnboardingVersion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__FCUserInfo_refreshOnboardingVersion___block_invoke;
  v6[3] = &unk_1E463D8B8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[FCPrivateDataController performFirstSyncWithCallbackQueue:completion:](self, "performFirstSyncWithCallbackQueue:completion:", MEMORY[0x1E0C80D38], v6);

}

void __39__FCUserInfo_refreshOnboardingVersion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "onboardingVersionNumber");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

  }
}

- (void)updateOnboardingVersion
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  -[FCUserInfo onboardingVersionNumber](self, "onboardingVersionNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if (v4 < 5)
  {
    -[FCUserInfo setMarketingNotificationsEnabled:](self, "setMarketingNotificationsEnabled:", 1);
    -[FCUserInfo setOnboardingVersionNumber:](self, "setOnboardingVersionNumber:", &unk_1E470A808);
  }
  -[FCUserInfo onboardingVersionNumber](self, "onboardingVersionNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (v6 <= 5)
  {
    -[FCUserInfo setEndOfAudioTrackNotificationsEnabled:](self, "setEndOfAudioTrackNotificationsEnabled:", 1);
    -[FCUserInfo setOnboardingVersionNumber:](self, "setOnboardingVersionNumber:", &unk_1E470A820);
  }
  FCBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", FCIntegerRepresentationOfBundleShortVersionString(v9));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo setOnboardingVersionNumber:](self, "setOnboardingVersionNumber:", v8);

}

- (void)markSavedAsViewed
{
  void *v3;
  FCModifyUserInfoCommand *v4;
  void *v5;
  FCModifyUserInfoCommand *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v3, CFSTR("lastViewedSavedDate"));
  v4 = [FCModifyUserInfoCommand alloc];
  -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v4, "initWithUserInfoRecord:", v5);

  -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v6);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[FCPrivateDataController observers](self, "observers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "userInfoDidChangeDateLastViewedSaved:fromCloud:", self, 0);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (NSDate)dateLastViewedSaved
{
  return (NSDate *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("lastViewedSavedDate"));
}

- (void)setEditorialArticleVersion:(id)a3
{
  void *v4;
  void *v5;
  FCModifyUserInfoCommand *v6;
  void *v7;
  FCModifyUserInfoCommand *v8;
  id v9;

  v9 = a3;
  if (v9)
  {
    -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("editorialArticleVersion"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4 || (objc_msgSend(v4, "isEqualToString:", v9) & 1) == 0)
    {
      -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v9, CFSTR("editorialArticleVersion"));
      v6 = [FCModifyUserInfoCommand alloc];
      -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v6, "initWithUserInfoRecord:", v7);

      -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v8);
    }

  }
}

- (void)setCanonicalLanguage:(id)a3
{
  void *v4;
  void *v5;
  FCModifyUserInfoCommand *v6;
  void *v7;
  FCModifyUserInfoCommand *v8;
  id v9;

  v9 = a3;
  if (v9)
  {
    -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("canonicalLanguage"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4 || (objc_msgSend(v4, "isEqualToString:", v9) & 1) == 0)
    {
      -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v9, CFSTR("canonicalLanguage"));
      v6 = [FCModifyUserInfoCommand alloc];
      -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v6, "initWithUserInfoRecord:", v7);

      -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v8);
    }

  }
}

- (void)setMarketingNotificationsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  FCModifyUserInfoCommand *v9;
  void *v10;
  FCModifyUserInfoCommand *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  v5 = -[FCUserInfo marketingNotificationsEnabled](self, "marketingNotificationsEnabled");
  if (v5 != v3)
  {
    v6 = v5;
    v7 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v25 = v6;
      v26 = 1024;
      v27 = v3;
      _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "Changing the marketing notifications switch from: %d to: %d", buf, 0xEu);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v8, CFSTR("marketingNotificationsEnabled"));

    v9 = [FCModifyUserInfoCommand alloc];
    -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v9, "initWithUserInfoRecord:", v10);

    -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v11);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[FCPrivateDataController observers](self, "observers", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v17);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v18, "userInfoDidChangeMarketingNotificationsEnabled:fromCloud:", self, 0);
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v15);
    }

  }
}

- (void)setNewIssueNotificationsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  FCModifyUserInfoCommand *v9;
  void *v10;
  FCModifyUserInfoCommand *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  v5 = -[FCUserInfo newIssueNotificationsEnabled](self, "newIssueNotificationsEnabled");
  if (v5 != v3)
  {
    v6 = v5;
    v7 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v25 = v6;
      v26 = 1024;
      v27 = v3;
      _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "Changing the new issue notifications switch from: %d to: %d", buf, 0xEu);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v8, CFSTR("newIssueNotificationsEnabled"));

    v9 = [FCModifyUserInfoCommand alloc];
    -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v9, "initWithUserInfoRecord:", v10);

    -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v11);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[FCPrivateDataController observers](self, "observers", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v17);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v18, "userInfoDidChangeNewIssueNotificationsEnabled:fromCloud:", self, 0);
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v15);
    }

  }
}

- (void)setEndOfAudioTrackNotificationsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  FCModifyUserInfoCommand *v9;
  void *v10;
  FCModifyUserInfoCommand *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  v5 = -[FCUserInfo endOfAudioTrackNotificationsEnabled](self, "endOfAudioTrackNotificationsEnabled");
  if (v5 != v3)
  {
    v6 = v5;
    v7 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v25 = v6;
      v26 = 1024;
      v27 = v3;
      _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "Changing the end of audio track notifications switch from: %d to: %d", buf, 0xEu);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v8, CFSTR("endOfAudioNotificationsEnabled"));

    v9 = [FCModifyUserInfoCommand alloc];
    -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v9, "initWithUserInfoRecord:", v10);

    -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v11);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[FCPrivateDataController observers](self, "observers", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v17);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v18, "userInfoDidChangeEndOfAudioTrackNotificationsEnabled:fromCloud:", self, 0);
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v15);
    }

  }
}

- (void)setSportsTopicNotificationsEnabledState:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  FCModifyUserInfoCommand *v9;
  void *v10;
  FCModifyUserInfoCommand *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  unint64_t v25;
  __int16 v26;
  unint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v5 = -[FCUserInfo sportsTopicNotificationsEnabledState](self, "sportsTopicNotificationsEnabledState");
  if (v5 != a3)
  {
    v6 = v5;
    v7 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v25 = v6;
      v26 = 2048;
      v27 = a3;
      _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "Changing the sports topic notifications from: %ld to: %ld", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v8, CFSTR("sportsTopicNotificationsEnabledState2"));

    v9 = [FCModifyUserInfoCommand alloc];
    -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v9, "initWithUserInfoRecord:", v10);

    -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v11);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[FCPrivateDataController observers](self, "observers", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v17);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v18, "userInfoDidChangeSportsTopicNotificationsEnabledState:fromCloud:", self, 0);
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v15);
    }

  }
}

- (NSDate)appReviewRequestLastShownDate
{
  return (NSDate *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("appReviewRequestLastSeenDate"));
}

- (void)setAppReviewRequestLastShownDate:(id)a3
{
  void *v4;
  id v5;
  FCModifyUserInfoCommand *v6;
  void *v7;
  FCModifyUserInfoCommand *v8;

  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = a3;
  objc_msgSend(v4, "isMainThread");
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v5, CFSTR("appReviewRequestLastSeenDate"));

  v6 = [FCModifyUserInfoCommand alloc];
  -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v6, "initWithUserInfoRecord:", v7);

  -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v8);
}

- (NSDate)puzzleNotificationsLastChangedDate
{
  return (NSDate *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("puzzleNotificationsLastChangedDate"));
}

- (void)setPuzzleNotificationsEnabled:(BOOL)a3 userTriggered:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  _BOOL4 v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  FCModifyUserInfoCommand *v13;
  void *v14;
  FCModifyUserInfoCommand *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  _BYTE v29[10];
  uint64_t v30;

  v4 = a4;
  v5 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v7 = -[FCUserInfo puzzleNotificationsEnabled](self, "puzzleNotificationsEnabled");
  -[FCUserInfo puzzleNotificationsLastChangedDate](self, "puzzleNotificationsLastChangedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v5 || (((v8 == 0) ^ v4) & 1) == 0)
  {
    v9 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v29 = v7;
      *(_WORD *)&v29[4] = 1024;
      *(_DWORD *)&v29[6] = v5;
      _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "Changing the puzzle notifications switch from: %d to: %d", buf, 0xEu);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v10, CFSTR("puzzleNotificationsEnabled2"));

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v12 = FCPushNotificationsLog;
      if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v29 = v11;
        _os_log_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_DEFAULT, "Changing the puzzle notifications last changed date to: %@", buf, 0xCu);
      }
      -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v11, CFSTR("puzzleNotificationsLastChangedDate"));
    }
    v13 = [FCModifyUserInfoCommand alloc];
    -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v13, "initWithUserInfoRecord:", v14);

    -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v15);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[FCPrivateDataController observers](self, "observers", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");

    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v24 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v22, "userInfoDidChangePuzzleNotificationsEnabled:fromCloud:", self, 0);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v19);
    }

  }
}

- (void)resetPuzzleNotificationsState
{
  NSObject *v3;
  void *v4;
  FCModifyUserInfoCommand *v5;
  void *v6;
  FCModifyUserInfoCommand *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[8];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v3 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1B90000, v3, OS_LOG_TYPE_DEFAULT, "Resetting puzzle notifications state", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v4, CFSTR("puzzleNotificationsEnabled2"));

  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, 0, CFSTR("puzzleNotificationsLastChangedDate"));
  v5 = [FCModifyUserInfoCommand alloc];
  -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v5, "initWithUserInfoRecord:", v6);

  -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v7);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[FCPrivateDataController observers](self, "observers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "userInfoDidChangePuzzleNotificationsEnabled:fromCloud:", self, 0);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v11);
  }

}

- (void)setPuzzleStatsStartDate:(id)a3
{
  id v4;
  NSObject *v5;
  FCModifyUserInfoCommand *v6;
  void *v7;
  FCModifyUserInfoCommand *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v5 = FCUserInfoLog;
  if (os_log_type_enabled((os_log_t)FCUserInfoLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v4;
    _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "Changing the puzzle stats start date to: %@", buf, 0xCu);
  }
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v4, CFSTR("puzzleStatsStartDate"));
  v6 = [FCModifyUserInfoCommand alloc];
  -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v6, "initWithUserInfoRecord:", v7);

  -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v8);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[FCPrivateDataController observers](self, "observers", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "userInfoDidChangeDatePuzzleStatsStart:fromCloud:", self, 0);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

void __24__FCUserInfo_asCKRecord__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[15];
  v6 = v2;
  +[FCUserInfo userInfoCKRecordFromUserInfoDictionary:]((uint64_t)FCUserInfo, v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (id)userInfoCKRecordFromUserInfoDictionary:(uint64_t)a1
{
  id v2;
  id v3;
  void *v4;
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

  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "objectForKey:", CFSTR("feldsparID"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("monthlyMeteredCount"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("meteredCountLastResetDate"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("meteredCountLastResetDate"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("lastOpenedDate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("lastViewedSavedDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("lastViewedSharedWithYouDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_alloc(MEMORY[0x1E0C95098]);
  v7 = (void *)objc_msgSend(v3, "initWithZoneName:ownerName:", CFSTR("UserInfo"), *MEMORY[0x1E0C94730]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:zoneID:", CFSTR("user_info_static_record_name"), v7);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("UserInfo"), v6);
  objc_msgSend(v4, "setValue:forKey:", v42, CFSTR("finishFirstLaunchVersion"));
  objc_msgSend(v4, "setValue:forKey:", v46, CFSTR("feldsparID"));
  objc_msgSend(v4, "setValue:forKey:", v45, CFSTR("notificationsUserID"));
  objc_msgSend(v4, "setValue:forKey:", v44, CFSTR("adsUserID"));
  objc_msgSend(v4, "setValue:forKey:", v43, CFSTR("adsUserIDCreatedDate"));
  objc_msgSend(v4, "setValue:forKey:", v16, CFSTR("lastOpenedDate"));
  objc_msgSend(v4, "setValue:forKey:", v9, CFSTR("lastViewedSavedDate"));
  objc_msgSend(v4, "setValue:forKey:", v8, CFSTR("lastViewedSharedWithYouDate"));
  objc_msgSend(v4, "setValue:forKey:", v41, CFSTR("monthlyMeteredCount"));
  objc_msgSend(v4, "setValue:forKey:", v40, CFSTR("meteredCountLastResetDate"));
  objc_msgSend(v4, "setValue:forKey:", v39, CFSTR("monthlyPaidBundleMeteredCount"));
  objc_msgSend(v4, "setValue:forKey:", v38, CFSTR("paidBundleMeteredCountLastResetDate"));
  objc_msgSend(v4, "setValue:forKey:", v37, CFSTR("upsellAppLaunchCount"));
  objc_msgSend(v4, "setValue:forKey:", v36, CFSTR("lastAppLaunchUpsellInstanceID"));
  objc_msgSend(v4, "setValue:forKey:", v35, CFSTR("upsellAppLaunchLastSeenDate"));
  objc_msgSend(v4, "setValue:forKey:", v34, CFSTR("upsellAppLaunchLastShownCampaignID"));
  objc_msgSend(v4, "setValue:forKey:", v33, CFSTR("upsellAppLaunchLastPresenterBundleID"));
  objc_msgSend(v4, "setValue:forKey:", v32, CFSTR("newsletterSignupLastSeenDate"));
  objc_msgSend(v4, "setValue:forKey:", v31, CFSTR("personalizedNewsletterSignupLastSeenDate"));
  objc_msgSend(v4, "setValue:forKey:", v30, CFSTR("issuesNewsletterOptinLastSeenDate"));
  objc_msgSend(v4, "setValue:forKey:", v29, CFSTR("userStartDate"));
  objc_msgSend(v4, "setValue:forKey:", v28, CFSTR("editorialArticleVersion"));
  objc_msgSend(v4, "setValue:forKey:", v27, CFSTR("canonicalLanguage"));
  objc_msgSend(v4, "setValue:forKey:", v26, CFSTR("marketingNotificationsEnabled"));
  objc_msgSend(v4, "setValue:forKey:", v25, CFSTR("newIssueNotificationsEnabled"));
  objc_msgSend(v4, "setValue:forKey:", v24, CFSTR("endOfAudioNotificationsEnabled"));
  objc_msgSend(v4, "setValue:forKey:", v23, CFSTR("sportsTopicNotificationsEnabledState2"));
  objc_msgSend(v4, "setValue:forKey:", v22, CFSTR("postPurchaseOnboardingLastSeenDate"));
  objc_msgSend(v4, "setValue:forKey:", v21, CFSTR("appReviewRequestLastSeenDate"));
  objc_msgSend(v4, "setValue:forKey:", v20, CFSTR("sportsOnboardingState"));
  objc_msgSend(v4, "setValue:forKey:", v19, CFSTR("shortcutsOnboardingState"));
  objc_msgSend(v4, "setValue:forKey:", v18, CFSTR("shortcutsOnboardingCompletedDate"));
  objc_msgSend(v4, "setValue:forKey:", v17, CFSTR("sportsSyncState"));
  objc_msgSend(v4, "setValue:forKey:", v15, CFSTR("sportsSyncStateLastSavedDate"));
  objc_msgSend(v4, "setValue:forKey:", v14, CFSTR("sportsOnboardingCompletedDate"));
  objc_msgSend(v4, "setValue:forKey:", v13, CFSTR("sportsUserID"));
  objc_msgSend(v4, "setValue:forKey:", v12, CFSTR("puzzleNotificationsEnabled2"));
  objc_msgSend(v4, "setValue:forKey:", v11, CFSTR("puzzleNotificationsLastChangedDate"));
  objc_msgSend(v4, "setValue:forKey:", v10, CFSTR("puzzleStatsStartDate"));

  return v4;
}

- (void)removeObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCUserInfo;
  -[FCPrivateDataController removeObserver:](&v3, sel_removeObserver_, a3);
}

- (void)syncWithCompletion:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  FCUserInfo *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __33__FCUserInfo_syncWithCompletion___block_invoke;
  v5[3] = &unk_1E463F6C8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)FCUserInfo;
  v5[0] = MEMORY[0x1E0C809B0];
  v3 = v7;
  -[FCPrivateDataController syncWithCompletion:](&v4, sel_syncWithCompletion_, v5);

}

void __33__FCUserInfo_syncWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("reset_onboarding_version"));

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerForKey:", CFSTR("onboarding_version_to_reset_to"));

    v8 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOnboardingVersionNumber:", v9);

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBool:forKey:", 0, CFSTR("reset_onboarding_version"));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)accessTokenDidChangeForTagID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[FCPrivateDataController observers](self, "observers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v12 = (void *)objc_msgSend(v4, "copy");
          objc_msgSend(v11, "userInfo:didChangeAccessTokenForTagID:", self, v12);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)accessTokenRemovedForTagID:(id)a3 userInitiated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[FCPrivateDataController observers](self, "observers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v14 = (void *)objc_msgSend(v6, "copy");
          objc_msgSend(v13, "userInfo:didRemoveAccessTokenForTagID:userInitiated:", self, v14, v4);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (void)settingsDataDidChangeForPuzzleTypeID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[FCPrivateDataController observers](self, "observers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v12 = (void *)objc_msgSend(v4, "copy");
          objc_msgSend(v11, "userInfo:didChangePuzzleTypeSettingsForPuzzleTypeID:", self, v12);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  const char *v19;
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
  const char *v40;
  id v41;
  id v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v41 = a4;
  obj = v6;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v49 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v11, "recordType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("UserInfo")))
        {
          -[FCUserInfo handleSyncWithUserInfoRecord:]((id *)&self->super.super.isa, v11);
          goto LABEL_13;
        }
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("TagSettings")))
        {
          -[FCUserInfo tagSettings](self, "tagSettings");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "handleSyncWithTagSettingsRecord:", v11);
        }
        else
        {
          if (!objc_msgSend(v12, "isEqualToString:", CFSTR("PuzzleTypeSettings")))
            goto LABEL_13;
          -[FCUserInfo puzzleTypeSettings](self, "puzzleTypeSettings");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "handleSyncWithPuzzleTypeSettingsRecord:", v11);
        }

LABEL_13:
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v8);
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = v41;
  v14 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v45 != v16)
          objc_enumerationMutation(v42);
        v18 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
        if (objc_msgSend(v18, "isEqualToString:", CFSTR("user_info_static_record_name")))
        {
          if (!self)
            continue;
          -[FCPrivateDataController localStore](self, "localStore");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          __FCCKUserInfoKeys_block_invoke();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "removeObjectsForKeys:", v21);

          -[FCPrivateDataController localStore](self, "localStore");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "UUIDString");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKey:", v24, CFSTR("feldsparID"));

          -[FCPrivateDataController localStore](self, "localStore");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "UUIDString");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKey:", v27, CFSTR("notificationsUserID"));

          -[FCPrivateDataController localStore](self, "localStore");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "UUIDString");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setObject:forKey:", v30, CFSTR("adsUserID"));

          -[FCPrivateDataController localStore](self, "localStore");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "UUIDString");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKey:", v33, CFSTR("sportsUserID"));

          -[FCPrivateDataController localStore](self, "localStore");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setObject:forKey:", v35, CFSTR("adsUserIDCreatedDate"));

          -[FCPrivateDataController localStore](self, "localStore");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setObject:forKey:", v37, CFSTR("lastOpenedDate"));

          -[FCPrivateDataController localStore](self, "localStore");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setObject:forKey:", v39, CFSTR("userStartDate"));

        }
        else if (FCIsTagSettingsRecordName(v18, v19))
        {
          -[FCUserInfo tagSettings](self, "tagSettings");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "handleSyncWithDeletedTagSettingsRecordName:", v18);
        }
        else
        {
          if (!FCIsPuzzleTypeSettingsRecordName(v18, v40))
            continue;
          -[FCUserInfo puzzleTypeSettings](self, "puzzleTypeSettings");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "handleSyncWithDeletedPuzzleTypeSettingsRecordName:", v18);
        }

      }
      v15 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v15);
  }

}

- (void)handleSyncWithUserInfoRecord:(id *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  NSObject *v18;
  FCModifyUserInfoCommand *v19;
  void *v20;
  FCModifyUserInfoCommand *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  __CFString *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t k;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  id v81;
  void *v82;
  NSObject *v83;
  int v84;
  NSObject *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t m;
  void *v93;
  NSObject *v94;
  void *v95;
  void *v96;
  id v97;
  id v98;
  id v99;
  void *v100;
  NSObject *v101;
  void *v102;
  void *v103;
  NSObject *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t n;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  id v115;
  id v116;
  void *v117;
  NSObject *v118;
  void *v119;
  void *v120;
  NSObject *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t ii;
  void *v128;
  void *v129;
  void *v130;
  id v131;
  id v132;
  id v133;
  id v134;
  void *v135;
  NSObject *v136;
  void *v137;
  void *v138;
  char v139;
  NSObject *v140;
  void *v141;
  void *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t jj;
  void *v147;
  void *v148;
  void *v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  int v153;
  void *v154;
  int v155;
  int v156;
  void *v157;
  int v158;
  void *v159;
  void *v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  int v164;
  int v165;
  int v166;
  void *v167;
  void *v168;
  int v169;
  void *v170;
  void *v171;
  void *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t kk;
  void *v177;
  id v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  id v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  id v201;
  void *v202;
  void *v203;
  id v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  id v215;
  void *v216;
  id v217;
  void *v218;
  void *v219;
  void *v220;
  int v221;
  int v222;
  id obj;
  uint64_t v224;
  int v225;
  int v226;
  int v227;
  void *v228;
  int v229;
  id *v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  _QWORD v235[4];
  id v236;
  id v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  _BYTE v242[128];
  _QWORD v243[4];
  uint8_t buf[4];
  id v245;
  __int16 v246;
  id v247;
  __int16 v248;
  id v249;
  __int16 v250;
  void *v251;
  uint64_t v252;

  v252 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!a1)
    goto LABEL_218;
  -[FCUserInfo _userInfoValueForKey:](a1, CFSTR("feldsparID"));
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _userInfoValueForKey:](a1, CFSTR("lastViewedSavedDate"));
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _userInfoValueForKey:](a1, CFSTR("editorialArticleVersion"));
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _userInfoValueForKey:](a1, CFSTR("finishFirstLaunchVersion"));
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _userInfoValueForKey:](a1, CFSTR("marketingNotificationsEnabled"));
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _userInfoValueForKey:](a1, CFSTR("newIssueNotificationsEnabled"));
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _userInfoValueForKey:](a1, CFSTR("endOfAudioNotificationsEnabled"));
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _userInfoValueForKey:](a1, CFSTR("sportsTopicNotificationsEnabledState2"));
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _userInfoValueForKey:](a1, CFSTR("lastViewedSharedWithYouDate"));
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _userInfoValueForKey:](a1, CFSTR("notificationsUserID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _userInfoValueForKey:](a1, CFSTR("adsUserID"));
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _userInfoValueForKey:](a1, CFSTR("adsUserIDCreatedDate"));
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _userInfoValueForKey:](a1, CFSTR("lastAppLaunchUpsellInstanceID"));
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _userInfoValueForKey:](a1, CFSTR("upsellAppLaunchLastSeenDate"));
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _userInfoValueForKey:](a1, CFSTR("sportsUserID"));
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _userInfoValueForKey:](a1, CFSTR("sportsSyncState"));
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _userInfoValueForKey:](a1, CFSTR("sportsSyncStateLastSavedDate"));
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _userInfoValueForKey:](a1, CFSTR("sportsOnboardingState"));
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _userInfoValueForKey:](a1, CFSTR("sportsOnboardingCompletedDate"));
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _userInfoValueForKey:](a1, CFSTR("shortcutsOnboardingState"));
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _userInfoValueForKey:](a1, CFSTR("shortcutsOnboardingCompletedDate"));
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _userInfoValueForKey:](a1, CFSTR("puzzleNotificationsEnabled2"));
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _userInfoValueForKey:](a1, CFSTR("puzzleNotificationsLastChangedDate"));
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _userInfoValueForKey:](a1, CFSTR("puzzleStatsStartDate"));
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E60];
  v243[0] = CFSTR("lastAppLaunchUpsellInstanceID");
  v243[1] = CFSTR("upsellAppLaunchLastSeenDate");
  v243[2] = CFSTR("puzzleNotificationsEnabled2");
  v243[3] = CFSTR("puzzleNotificationsLastChangedDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v243, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v235[0] = MEMORY[0x1E0C809B0];
  v235[1] = 3221225472;
  v235[2] = __43__FCUserInfo_handleSyncWithUserInfoRecord___block_invoke;
  v235[3] = &unk_1E4640300;
  v184 = v7;
  v236 = v184;
  v8 = v3;
  v237 = v8;
  -[FCUserInfo _modifyUserInfoWithBlock:]((uint64_t)a1, v235);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("FCUserInfoChangedNotificationName"), a1);

  v228 = v8;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("notificationsUserID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v4;
  v12 = v10;
  v13 = v12;
  v204 = v3;
  v230 = a1;
  if (!v12 || !objc_msgSend(v12, "length"))
  {
    if (!v11
      || !objc_msgSend(v11, "length")
      || (v14 = v11, objc_msgSend(v11, "hasSuffix:", CFSTR("-NoSync"))))
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = FCPushNotificationsLog;
      if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v245 = v14;
        _os_log_impl(&dword_1A1B90000, v18, OS_LOG_TYPE_INFO, "Syncing enabled, generated a new notificationsUserID: %@", buf, 0xCu);
      }
    }
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)a1, v14, CFSTR("notificationsUserID"));
    v19 = [FCModifyUserInfoCommand alloc];
    -[FCUserInfo asCKRecord](a1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v19, "initWithUserInfoRecord:", v20);

    objc_msgSend(a1, "addCommandToCommandQueue:", v21);
    goto LABEL_18;
  }
  if (v11 && objc_msgSend(v11, "length"))
  {
    v14 = v11;
    if ((objc_msgSend(v11, "isEqualToString:", v13) & 1) != 0)
      goto LABEL_28;
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)a1, v13, CFSTR("notificationsUserID"));
    v15 = FCPushNotificationsLog;
    v14 = v11;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v245 = v13;
      v16 = "Syncing enabled, updated with remote notificationsUserID: %@";
LABEL_17:
      _os_log_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_INFO, v16, buf, 0xCu);
      v14 = v11;
    }
  }
  else
  {
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)a1, v13, CFSTR("notificationsUserID"));
    v15 = FCPushNotificationsLog;
    v14 = v11;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v245 = v13;
      v16 = "Syncing enabled, merged remote notificationsUserID: %@";
      goto LABEL_17;
    }
  }
LABEL_18:
  v240 = 0u;
  v241 = 0u;
  v238 = 0u;
  v239 = 0u;
  objc_msgSend(a1, "observers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copy");

  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v238, buf, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v239;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v239 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v238 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v28, "userInfoDidChangeNotificationsUserID:", v230);
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v238, buf, 16);
    }
    while (v25);
  }

  a1 = v230;
LABEL_28:

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("adsUserID"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("adsUserIDCreatedDate"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v194;
  v32 = v192;
  v33 = v29;
  v34 = v30;
  v193 = v32;
  v195 = v31;
  v185 = v11;
  v178 = v34;
  if (!v33 || (v35 = v34, !objc_msgSend(v33, "length")))
  {
    if (!v31 || (v36 = v31, !objc_msgSend(v31, "length")))
    {
      -[FCUserInfo _temporaryUserIDForKey:]((uint64_t)a1, (uint64_t)CFSTR("adsUserID"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v38)
      {
        v36 = v38;
        v40 = v31;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "UUIDString");
        v36 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v32 = (id)objc_claimAutoreleasedReturnValue();

    }
    v37 = a1;
LABEL_45:
    -[FCUserInfo _persistAdsUserID:createdDate:](v37, v36, v32);
    goto LABEL_46;
  }
  if (v31 && objc_msgSend(v31, "length"))
  {
    if ((objc_msgSend(v31, "isEqualToString:", v33) & 1) != 0
      || (-[FCUserInfo _shouldRotateAdsUserIDWithCreatedDate:](a1, v35) & 1) != 0)
    {
      v36 = v31;
      if (!-[FCUserInfo _shouldRotateAdsUserIDWithCreatedDate:](a1, v35))
        goto LABEL_56;
      v37 = a1;
      v36 = v31;
      goto LABEL_45;
    }
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)a1, v33, CFSTR("adsUserID"));
    v41 = (uint64_t)a1;
    v42 = v35;
    v43 = CFSTR("adsUserIDCreatedDate");
  }
  else
  {
    v41 = (uint64_t)a1;
    v42 = v33;
    v43 = CFSTR("adsUserID");
  }
  -[FCUserInfo _setUserInfoValue:forKey:](v41, v42, v43);
  v36 = v31;
LABEL_46:
  v240 = 0u;
  v241 = 0u;
  v238 = 0u;
  v239 = 0u;
  objc_msgSend(a1, "observers", v178);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v44, "copy");

  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v238, buf, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v239;
    do
    {
      for (j = 0; j != v47; ++j)
      {
        if (*(_QWORD *)v239 != v48)
          objc_enumerationMutation(v45);
        v50 = *(void **)(*((_QWORD *)&v238 + 1) + 8 * j);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v50, "userInfoDidChangeAdsUserID:fromCloud:", v230, 1);
      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v238, buf, 16);
    }
    while (v47);
  }

  a1 = v230;
  v35 = v178;
LABEL_56:

  v51 = v228;
  objc_msgSend(v228, "objectForKeyedSubscript:", CFSTR("sportsUserID"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v186;
  v54 = v52;
  v55 = v54;
  v187 = v53;
  if (v54 && objc_msgSend(v54, "length"))
  {
    if (v53)
    {
      if (objc_msgSend(v53, "length"))
      {
        v56 = v53;
        if ((objc_msgSend(v53, "isEqualToString:", v55) & 1) != 0)
          goto LABEL_80;
      }
    }
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)a1, v55, CFSTR("sportsUserID"));
    v56 = v53;
  }
  else
  {
    if (!v53 || (v56 = v53, !objc_msgSend(v53, "length")))
    {
      -[FCUserInfo _temporaryUserIDForKey:]((uint64_t)a1, (uint64_t)CFSTR("sportsUserID"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v57;
      if (v57)
      {
        v56 = v57;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v59 = v53;
        v53 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "UUIDString");
        v56 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    -[FCUserInfo _persistSportsUserID:](a1, v56);
  }
  v240 = 0u;
  v241 = 0u;
  v238 = 0u;
  v239 = 0u;
  objc_msgSend(a1, "observers", v178);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (void *)objc_msgSend(v60, "copy");

  v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v238, buf, 16);
  if (v62)
  {
    v63 = v62;
    v64 = *(_QWORD *)v239;
    do
    {
      for (k = 0; k != v63; ++k)
      {
        if (*(_QWORD *)v239 != v64)
          objc_enumerationMutation(v61);
        v66 = *(void **)(*((_QWORD *)&v238 + 1) + 8 * k);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v66, "userInfoDidChangeSportsUserID:", a1);
      }
      v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v238, buf, 16);
    }
    while (v63);
  }

  v51 = v228;
LABEL_80:

  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("upsellAppLaunchLastSeenDate"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("lastAppLaunchUpsellInstanceID"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v200;
  v70 = v182;
  v71 = v67;
  v72 = v68;
  if (v71 && (!v69 || objc_msgSend(v71, "compare:", v69) == 1))
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)a1, v71, CFSTR("upsellAppLaunchLastSeenDate"));
  objc_msgSend(v70, "fc_numberFollowingString:", CFSTR("v"), v178);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "fc_numberFollowingString:", CFSTR("v"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v74;
  if (v74 && (!v73 || objc_msgSend(v74, "compare:", v73) == 1))
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)a1, v72, CFSTR("lastAppLaunchUpsellInstanceID"));

  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("puzzleNotificationsEnabled2"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("puzzleNotificationsLastChangedDate"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v198;
  v79 = v196;
  v80 = v76;
  v81 = v77;
  v82 = v81;
  v199 = v78;
  v201 = v69;
  v183 = v70;
  v197 = v79;
  if (v81)
  {
    if (v79 && !objc_msgSend(v81, "fc_isLaterThan:", v79))
      goto LABEL_112;
    v83 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v245 = v79;
      v246 = 2112;
      v247 = v82;
      _os_log_impl(&dword_1A1B90000, v83, OS_LOG_TYPE_DEFAULT, "Changing the puzzle notifications last change date from: %@ to: %@", buf, 0x16u);
    }
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)a1, v82, CFSTR("puzzleNotificationsLastChangedDate"));
  }
  else if (v79)
  {
    goto LABEL_112;
  }
  v84 = objc_msgSend(v78, "BOOLValue");
  if (v84 != objc_msgSend(v80, "BOOLValue"))
  {
    v85 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v245 = v78;
      v246 = 2112;
      v247 = v80;
      _os_log_impl(&dword_1A1B90000, v85, OS_LOG_TYPE_DEFAULT, "Changing the puzzle notifications enabled state from: %@ to: %@", buf, 0x16u);
    }
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)a1, v80, CFSTR("puzzleNotificationsEnabled2"));
    goto LABEL_100;
  }
  if (v82)
  {
LABEL_100:
    v86 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1B90000, v86, OS_LOG_TYPE_DEFAULT, "Applying changes to puzzle notification state and notifying observers.", buf, 2u);
    }
    v240 = 0u;
    v241 = 0u;
    v238 = 0u;
    v239 = 0u;
    objc_msgSend(a1, "observers");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = (void *)objc_msgSend(v87, "copy");

    v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v238, buf, 16);
    if (v89)
    {
      v90 = v89;
      v91 = *(_QWORD *)v239;
      do
      {
        for (m = 0; m != v90; ++m)
        {
          if (*(_QWORD *)v239 != v91)
            objc_enumerationMutation(v88);
          v93 = *(void **)(*((_QWORD *)&v238 + 1) + 8 * m);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v93, "userInfoDidChangePuzzleNotificationsEnabled:fromCloud:", a1, 1);
        }
        v90 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v238, buf, 16);
      }
      while (v90);
    }

    v51 = v228;
    v78 = v199;
    goto LABEL_114;
  }
LABEL_112:
  v94 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1B90000, v94, OS_LOG_TYPE_DEFAULT, "No changes to existing puzzle notification state, skipping...", buf, 2u);
  }
LABEL_114:

  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("sportsSyncState"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("sportsSyncStateLastSavedDate"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v217 = v216;
  v97 = v190;
  v98 = v95;
  v99 = v96;
  v100 = (void *)FCUserInfoLog;
  if (os_log_type_enabled((os_log_t)FCUserInfoLog, OS_LOG_TYPE_DEFAULT))
  {
    v101 = v100;
    objc_msgSend(v97, "description");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "description");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v245 = v217;
    v246 = 2112;
    v247 = v102;
    v248 = 2112;
    v249 = v98;
    v250 = 2112;
    v251 = v103;
    _os_log_impl(&dword_1A1B90000, v101, OS_LOG_TYPE_DEFAULT, "Sync local sports sync state, local=%@ localDate=%@, with remote=%@, remoteDate=%@", buf, 0x2Au);

  }
  v191 = v97;
  if (v97 && (objc_msgSend(v97, "isEqualToDate:", v99) & 1) == 0)
  {
    v104 = FCUserInfoLog;
    if (os_log_type_enabled((os_log_t)FCUserInfoLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1B90000, v104, OS_LOG_TYPE_DEFAULT, "Remote date and local sports sync state has changed, firing observers", buf, 2u);
    }
    v240 = 0u;
    v241 = 0u;
    v238 = 0u;
    v239 = 0u;
    objc_msgSend(a1, "observers");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = (void *)objc_msgSend(v105, "copy");

    v107 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v238, buf, 16);
    if (v107)
    {
      v108 = v107;
      v109 = *(_QWORD *)v239;
      do
      {
        for (n = 0; n != v108; ++n)
        {
          if (*(_QWORD *)v239 != v109)
            objc_enumerationMutation(v106);
          v111 = *(void **)(*((_QWORD *)&v238 + 1) + 8 * n);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v111, "userInfoDidChangeSportsSyncState:", v230);
        }
        v108 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v238, buf, 16);
      }
      while (v108);
    }

    v51 = v228;
    a1 = v230;
    v97 = v191;
  }

  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("sportsOnboardingState"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("sportsOnboardingCompletedDate"));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v215 = v214;
  v114 = v188;
  v115 = v112;
  v116 = v113;
  v117 = (void *)FCUserInfoLog;
  if (os_log_type_enabled((os_log_t)FCUserInfoLog, OS_LOG_TYPE_DEFAULT))
  {
    v118 = v117;
    objc_msgSend(v114, "description");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "description");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v245 = v215;
    v246 = 2112;
    v247 = v119;
    v248 = 2112;
    v249 = v115;
    v250 = 2112;
    v251 = v120;
    _os_log_impl(&dword_1A1B90000, v118, OS_LOG_TYPE_DEFAULT, "Sync local sports onboarding state, local=%@ localDate=%@, with remote=%@, remoteDate=%@", buf, 0x2Au);

  }
  v189 = v114;
  if (v114 && (objc_msgSend(v114, "isEqualToDate:", v116) & 1) == 0)
  {
    v121 = FCUserInfoLog;
    if (os_log_type_enabled((os_log_t)FCUserInfoLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1B90000, v121, OS_LOG_TYPE_DEFAULT, "Remote date and local sports onboarding state has changed, firing observers", buf, 2u);
    }
    v240 = 0u;
    v241 = 0u;
    v238 = 0u;
    v239 = 0u;
    objc_msgSend(a1, "observers");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = (void *)objc_msgSend(v122, "copy");

    v124 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v238, buf, 16);
    if (v124)
    {
      v125 = v124;
      v126 = *(_QWORD *)v239;
      do
      {
        for (ii = 0; ii != v125; ++ii)
        {
          if (*(_QWORD *)v239 != v126)
            objc_enumerationMutation(v123);
          v128 = *(void **)(*((_QWORD *)&v238 + 1) + 8 * ii);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v128, "userInfoDidChangeSportsOnboardingState:", v230);
        }
        v125 = objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v238, buf, 16);
      }
      while (v125);
    }

    v51 = v228;
    a1 = v230;
    v114 = v189;
  }

  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("shortcutsOnboardingState"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("shortcutsOnboardingCompletedDate"));
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = v220;
  v132 = v219;
  v133 = v129;
  v134 = v130;
  v135 = (void *)FCUserInfoLog;
  v213 = v132;
  if (os_log_type_enabled((os_log_t)FCUserInfoLog, OS_LOG_TYPE_DEFAULT))
  {
    v136 = v135;
    objc_msgSend(v132, "description");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "description");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v245 = v131;
    v246 = 2112;
    v247 = v137;
    v248 = 2112;
    v249 = v133;
    v250 = 2112;
    v251 = v138;
    _os_log_impl(&dword_1A1B90000, v136, OS_LOG_TYPE_DEFAULT, "Sync local shortcuts onboarding state, local=%@ localDate=%@, with remote=%@, remoteDate=%@", buf, 0x2Au);

    v132 = v213;
  }
  v205 = v131;
  if (v132 == v134)
  {
    if (v131 != v133)
    {
LABEL_153:
      v140 = FCUserInfoLog;
      if (os_log_type_enabled((os_log_t)FCUserInfoLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1B90000, v140, OS_LOG_TYPE_DEFAULT, "Remote date and local shortcuts onboarding state has changed, firing observers", buf, 2u);
      }
      v240 = 0u;
      v241 = 0u;
      v238 = 0u;
      v239 = 0u;
      objc_msgSend(a1, "observers");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      v142 = (void *)objc_msgSend(v141, "copy");

      v143 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v238, buf, 16);
      if (v143)
      {
        v144 = v143;
        v145 = *(_QWORD *)v239;
        do
        {
          for (jj = 0; jj != v144; ++jj)
          {
            if (*(_QWORD *)v239 != v145)
              objc_enumerationMutation(v142);
            v147 = *(void **)(*((_QWORD *)&v238 + 1) + 8 * jj);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v147, "userInfoDidChangeShortcutsOnboardingState:", a1);
          }
          v144 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v238, buf, 16);
        }
        while (v144);
      }

      v51 = v228;
      v131 = v205;
      v132 = v213;
    }
  }
  else
  {
    v139 = objc_msgSend(v132, "isEqualToDate:", v134);
    if (v131 != v133 || (v139 & 1) == 0)
      goto LABEL_153;
  }

  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("feldsparID"));
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = objc_msgSend(v212, "isEqualToString:", v148);

  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("finishFirstLaunchVersion"));
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v226 = objc_msgSend(v210, "isEqual:", v149);

  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("lastViewedSavedDate"));
  v150 = objc_claimAutoreleasedReturnValue();
  v181 = (void *)v150;
  if (v211 == (void *)v150)
    v225 = 0;
  else
    v225 = objc_msgSend(v211, "isEqualToDate:", v150) ^ 1;
  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("editorialArticleVersion"));
  v151 = objc_claimAutoreleasedReturnValue();
  v152 = (void *)v151;
  v229 = 0;
  if (v218 && v151)
    v229 = objc_msgSend(v218, "isEqualToString:", v151) ^ 1;
  v180 = v152;
  v153 = objc_msgSend(v209, "BOOLValue");
  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("marketingNotificationsEnabled"));
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = objc_msgSend(v154, "BOOLValue");

  v156 = objc_msgSend(v208, "BOOLValue");
  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("newIssueNotificationsEnabled"));
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = objc_msgSend(v157, "BOOLValue");

  v222 = objc_msgSend(v207, "BOOLValue");
  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("endOfAudioNotificationsEnabled"));
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v221 = objc_msgSend(v159, "BOOLValue");

  v224 = objc_msgSend(v206, "integerValue");
  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("sportsTopicNotificationsEnabledState2"));
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = objc_msgSend(v160, "integerValue");

  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("lastViewedSharedWithYouDate"));
  v162 = objc_claimAutoreleasedReturnValue();
  v163 = v203;
  v179 = (void *)v162;
  if (v203 == (void *)v162)
    v164 = 0;
  else
    v164 = objc_msgSend(v203, "isEqualToDate:", v162) ^ 1;
  v165 = v153 ^ v155;
  v166 = v156 ^ v158;
  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("puzzleStatsStartDate"));
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = v202;
  if (v202 == v167)
    v169 = 0;
  else
    v169 = objc_msgSend(v202, "isEqualToDate:", v167) ^ 1;
  v3 = v204;
  v170 = v201;
  if (((v227 & v226 ^ 1 | v225 | v229 | v165 | v166 | v164) & 1) != 0 || v169)
  {
    v233 = 0u;
    v234 = 0u;
    v231 = 0u;
    v232 = 0u;
    objc_msgSend(v230, "observers");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    v172 = (void *)objc_msgSend(v171, "copy");

    obj = v172;
    v173 = objc_msgSend(v172, "countByEnumeratingWithState:objects:count:", &v231, v242, 16);
    if (v173)
    {
      v174 = v173;
      v175 = *(_QWORD *)v232;
      do
      {
        for (kk = 0; kk != v174; ++kk)
        {
          if (*(_QWORD *)v232 != v175)
            objc_enumerationMutation(obj);
          v177 = *(void **)(*((_QWORD *)&v231 + 1) + 8 * kk);
          if ((v227 & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v177, "userInfoDidChangeFeldsparID:fromCloud:", v230, 1);
          if ((v226 & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v177, "userInfoDidChangeOnboardingStatus:", v230);
          if (v225 && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v177, "userInfoDidChangeDateLastViewedSaved:fromCloud:", v230, 1);
          if (v229 && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v177, "userInfoDidChangeEditorialArticleVersion:", v230);
          if (v165 && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v177, "userInfoDidChangeMarketingNotificationsEnabled:fromCloud:", v230, 1);
          if (v166 && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v177, "userInfoDidChangeNewIssueNotificationsEnabled:fromCloud:", v230, 1);
          if (v222 != v221 && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v177, "userInfoDidChangeEndOfAudioTrackNotificationsEnabled:fromCloud:", v230, 1);
          if (v224 != v161 && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v177, "userInfoDidChangeSportsTopicNotificationsEnabledState:fromCloud:", v230, 1);
          if (v164 && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v177, "userInfoDidChangeDateLastViewedSharedWithYou:fromCloud:", v230, 1);
          if (v169 && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v177, "userInfoDidChangeDatePuzzleStatsStart:fromCloud:", v230, 1);
        }
        v174 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v231, v242, 16);
      }
      while (v174);
    }

    v163 = v203;
    v3 = v204;
    v170 = v201;
    v168 = v202;
  }

LABEL_218:
}

- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", CFSTR("user_info_static_record_name"));
  -[FCUserInfo tagSettings](self, "tagSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allTagSettingsRecordNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  -[FCUserInfo puzzleTypeSettings](self, "puzzleTypeSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allPuzzleTypeSettingsRecordNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v8);

  return v4;
}

void __43__FCUserInfo_handleSyncWithUserInfoRecord___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  __FCCKUserInfoKeys_block_invoke();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v9, (_QWORD)v11) & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v10, v9);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)markSharedWithYouAsViewed
{
  void *v3;
  FCModifyUserInfoCommand *v4;
  void *v5;
  FCModifyUserInfoCommand *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v3, CFSTR("lastViewedSharedWithYouDate"));
  v4 = [FCModifyUserInfoCommand alloc];
  -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v4, "initWithUserInfoRecord:", v5);

  -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v6);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[FCPrivateDataController observers](self, "observers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "userInfoDidChangeDateLastViewedSharedWithYou:fromCloud:", self, 0);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (NSDate)dateLastViewedSharedWithYou
{
  return (NSDate *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, CFSTR("lastViewedSharedWithYouDate"));
}

+ (BOOL)requiresPushNotificationSupport
{
  return 1;
}

+ (BOOL)requiresBatchedSync
{
  return 0;
}

+ (BOOL)requiresHighPriorityFirstSync
{
  return 1;
}

+ (id)backingRecordZoneIDs
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C95098]);
  v3 = (void *)objc_msgSend(v2, "initWithZoneName:ownerName:", CFSTR("UserInfo"), *MEMORY[0x1E0C94730]);
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)backingRecordIDs
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  FCModifyUserInfoCommand *v8;
  void *v9;
  void *v10;
  FCModifyUserInfoCommand *v11;
  void *v12;
  void *v13;

  v5 = (void *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  objc_msgSend(v5, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [FCModifyUserInfoCommand alloc];
  objc_msgSend(v6, "asDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCUserInfo userInfoCKRecordFromUserInfoDictionary:]((uint64_t)a1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[FCModifyUserInfoCommand initWithUserInfoRecord:](v8, "initWithUserInfoRecord:", v10);

  objc_msgSend(v7, "addObject:", v11);
  +[FCTagSettings commandsToMergeLocalDataToCloud:](FCTagSettings, "commandsToMergeLocalDataToCloud:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v12);
  +[FCPuzzleTypeSettings commandsToMergeLocalDataToCloud:](FCPuzzleTypeSettings, "commandsToMergeLocalDataToCloud:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObjectsFromArray:", v13);
  return v7;
}

- (BOOL)canHelpRestoreZoneName:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("UserInfo"));
}

- (id)recordsForRestoringZoneName:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__FCUserInfo_recordsForRestoringZoneName___block_invoke;
  v4[3] = &unk_1E463AA30;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __42__FCUserInfo_recordsForRestoringZoneName___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(id **)(a1 + 32);
  v4 = a2;
  -[FCUserInfo asCKRecord](v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  objc_msgSend(*(id *)(a1 + 32), "tagSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allTagSettingsRecords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v7);

  objc_msgSend(*(id *)(a1 + 32), "puzzleTypeSettings");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allPuzzleTypeSettingsRecords");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v8);

}

uint64_t __39__FCUserInfo__setUserInfoValue_forKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __39__FCUserInfo__modifyUserInfoWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "localStore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUserInfo setReadOnlyUserInfo:](*(_QWORD *)(a1 + 32), v2);

}

- (void)setTagSettings:(id)a3
{
  objc_storeStrong((id *)&self->_tagSettings, a3);
}

- (void)setPuzzleTypeSettings:(id)a3
{
  objc_storeStrong((id *)&self->_puzzleTypeSettings, a3);
}

- (BOOL)useParsecResults
{
  return self->_useParsecResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfoLock, 0);
  objc_storeStrong((id *)&self->_readOnlyUserInfo, 0);
  objc_storeStrong((id *)&self->_puzzleTypeSettings, 0);
  objc_storeStrong((id *)&self->_tagSettings, 0);
}

@end
