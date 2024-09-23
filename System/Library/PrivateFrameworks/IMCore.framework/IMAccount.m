@implementation IMAccount

- (IMServiceImpl)service
{
  return (IMServiceImpl *)objc_loadWeakRetained((id *)&self->_service);
}

- (NSString)serviceName
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  objc_msgSend(WeakRetained, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)hasCapability:(unint64_t)a3
{
  return (a3 & ~-[IMAccount capabilities](self, "capabilities")) == 0;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (id)imHandleWithID:(id)a3 alreadyCanonical:(BOOL)a4
{
  return -[IMAccount _imHandleWithID:alreadyCanonical:originalID:countryCode:](self, "_imHandleWithID:alreadyCanonical:originalID:countryCode:", a3, a4, 0, 0);
}

- (id)_imHandleWithID:(id)a3 alreadyCanonical:(BOOL)a4 originalID:(id)a5 countryCode:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  IMHandle *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  char v19;
  void *v20;
  char v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (!v10
    || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
        v13 = (id)objc_claimAutoreleasedReturnValue(),
        v13,
        v13 == v10))
  {
    v15 = 0;
  }
  else
  {
    if (a4)
    {
      v14 = 0;
    }
    else
    {
      -[IMAccount canonicalFormOfID:](self, "canonicalFormOfID:", v10);
      v16 = objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "isEqualToString:", v16) & 1) != 0)
      {
        v14 = 0;
      }
      else
      {
        IMCleanupPhoneNumber();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v10 = (id)v16;
    }
    -[IMAccount existingIMHandleWithID:alreadyCanonical:](self, "existingIMHandleWithID:alreadyCanonical:", v10, 1);
    v15 = (IMHandle *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v15 = -[IMHandle initWithAccount:ID:alreadyCanonical:]([IMHandle alloc], "initWithAccount:ID:alreadyCanonical:", self, v10, 1);
      v17 = -[IMAccount defaultHandleCapabilities](self, "defaultHandleCapabilities");
      if (v17)
        -[IMHandle _setCapabilities:](v15, "_setCapabilities:", v17);
    }
    if (v14)
    {
      -[IMHandle originalID](v15, "originalID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", v14);

      if ((v19 & 1) == 0)
      {
        objc_msgSend(v14, "trimmedString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v20, "length") < 4)
        {

        }
        else
        {
          v21 = objc_msgSend(v14, "hasPrefix:", CFSTR("+"));

          if ((v21 & 1) == 0)
          {
            -[IMHandle _updateOriginalID:](v15, "_updateOriginalID:", v14);
            -[IMHandle _setOriginalID:](v15, "_setOriginalID:", v14);
          }
        }
      }
    }

  }
  return v15;
}

- (id)existingIMHandleWithID:(id)a3 alreadyCanonical:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  char v14;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    if (a4)
    {
      v8 = 0;
    }
    else
    {
      -[IMAccount canonicalFormOfID:](self, "canonicalFormOfID:", v6);
      v10 = objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isEqualToString:", v10) & 1) != 0)
      {
        v8 = 0;
      }
      else
      {
        IMCleanupPhoneNumber();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v7 = (void *)v10;
    }
    -[NSRecursiveLock lock](self->_lock, "lock");
    -[NSMapTable objectForKey:](self->_imHandles, "objectForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSRecursiveLock unlock](self->_lock, "unlock");
    if (v8)
    {
      objc_msgSend(v9, "originalID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v8);

      if ((v12 & 1) == 0)
      {
        objc_msgSend(v8, "trimmedString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v13, "length") < 4)
        {

        }
        else
        {
          v14 = objc_msgSend(v8, "hasPrefix:", CFSTR("+"));

          if ((v14 & 1) == 0)
          {
            objc_msgSend(v9, "_updateOriginalID:", v8);
            objc_msgSend(v9, "_setOriginalID:", v8);
          }
        }
      }
    }

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (unint64_t)defaultHandleCapabilities
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;

  if (!self->_hasCheckedDefaultHandleCapabilities)
  {
    self->_hasCheckedDefaultHandleCapabilities = 1;
    -[IMAccount service](self, "service");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "serviceProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D361F0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMAccount service](self, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serviceProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D361E8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "intValue") || objc_msgSend(v8, "intValue"))
    {
      v9 = objc_msgSend(v5, "unsignedLongLongValue");
      v10 = objc_msgSend(v8, "unsignedLongLongValue") | v9;
    }
    else
    {
      v10 = 0;
    }
    self->_defaultHandleCapabilities = v10;

  }
  return self->_defaultHandleCapabilities;
}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

- (void)registerIMHandle:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  objc_msgSend(v6, "ID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMapTable objectForKey:](self->_imHandles, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      -[NSMapTable setObject:forKey:](self->_imHandles, "setObject:forKey:", v6, v4);
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (NSString)uniqueID
{
  NSString *uniqueID;
  NSString *v4;
  NSString *v5;

  uniqueID = self->_uniqueID;
  if (!uniqueID)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_uniqueID;
    self->_uniqueID = v4;

    uniqueID = self->_uniqueID;
  }
  return uniqueID;
}

- (IMHandle)loginIMHandle
{
  return self->_loginIMHandle;
}

- (BOOL)isConnected
{
  return self->_loginStatus == 4;
}

- (NSArray)vettedAliases
{
  NSArray *vettedAliases;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSArray *v14;
  NSArray *v15;
  NSArray *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  vettedAliases = self->_vettedAliases;
  if (vettedAliases)
    return vettedAliases;
  -[IMAccount objectForKey:](self, "objectForKey:", *MEMORY[0x1E0D36FE0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (-[IMAccount _aliasIsVisible:](self, "_aliasIsVisible:", v12, (_QWORD)v17))
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v13 = (void *)_IDSCopyOrderedAliasStrings();
  objc_msgSend(v13, "array");
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v15 = self->_vettedAliases;
  self->_vettedAliases = v14;

  v16 = self->_vettedAliases;
  return v16;
}

- (void)updateCapabilities:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (self->_capabilities != a3)
  {
    v5 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, CFSTR("__kkOldValueKey"), v7, CFSTR("__kkNewValueKey"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    self->_capabilities = a3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kIMAccountCapabilitiesChangedNotification"), self, v8);

  }
}

- (void)syncWithRemoteBuddies
{
  self->_hasReceivedSync = 1;
}

- (BOOL)supportsRegistration
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  v3 = objc_msgSend(WeakRetained, "supportsRegistration");

  return v3;
}

- (BOOL)supportsAuthorization
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  v3 = objc_msgSend(WeakRetained, "supportsAuthorization");

  return v3;
}

- (NSString)strippedLogin
{
  return self->_strippedLogin;
}

- (void)setKeyTransparencyIDQueryListenerID:(id)a3
{
  objc_storeStrong((id *)&self->_keyTransparencyIDQueryListenerID, a3);
}

- (void)setIsActive:(BOOL)a3
{
  void *v4;

  self->_isActive = a3;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "__mainThreadPostNotificationName:object:", CFSTR("__kIMAccountActivatedNotification"), self);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "__mainThreadPostNotificationName:object:", CFSTR("__kIMAccountDeactivatedNotification"), self);
  }

}

- (void)setIMAccountLoginStatus:(unint64_t)a3 errorMessage:(id)a4 reason:(int)a5
{
  id v8;
  _BOOL4 v9;
  unint64_t loginStatus;
  BOOL v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id WeakRetained;

  v8 = a4;
  IMLogBacktrace();
  v9 = -[IMAccount isActive](self, "isActive");
  loginStatus = self->_loginStatus;
  v12 = a3 == 3 && loginStatus == 4;
  if (loginStatus != a3 && !v12)
  {
    v13 = v9;
    self->_loginStatus = a3;
    self->_justLoggedIn = a3 == 4;
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__notJustLoggedIn, 0);
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0C99D80];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "dictionaryWithObjectsAndKeys:", v16, CFSTR("__kIMAccountLoginStatusChangedReasonKey"), v8, CFSTR("__kIMAccountLoginStatusChangedErrorMessageKey"), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kIMAccountLoginStatusChangedNotification"), self, v17);

    }
    if (a3 > 1)
    {
      self->_hasPostedOfflineNotification = 0;
      if (a3 == 4)
      {
        -[IMAccount _refreshLoginIMHandle](self, "_refreshLoginIMHandle");
        -[IMAccount nowLoggedIn](self, "nowLoggedIn");
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)MEMORY[0x1E0C99D80];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "dictionaryWithObjectsAndKeys:", v21, CFSTR("__kIMAccountLoginStatusChangedReasonKey"), v8, CFSTR("__kIMAccountLoginStatusChangedErrorMessageKey"), 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kIMAccountLoggedInNotification"), self, v22);

      }
    }
    else
    {
      -[IMAccount clearTargetState](self, "clearTargetState");
      -[IMAccount forgetAllWatches](self, "forgetAllWatches");
      if (!self->_hasPostedOfflineNotification)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "__mainThreadPostNotificationName:object:", CFSTR("__kIMAccountLoggedOutNotification"), self);

        self->_hasPostedOfflineNotification = 1;
      }
      -[IMAccount nowLoggedOut](self, "nowLoggedOut");
    }
  }
  if (loginStatus != a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_service);
    objc_msgSend(WeakRetained, "statusChangedForAccount:from:to:", self, loginStatus, a3);

  }
}

- (void)setIMAccountLoginStatus:(unint64_t)a3 errorMessage:(id)a4
{
  -[IMAccount setIMAccountLoginStatus:errorMessage:reason:](self, "setIMAccountLoginStatus:errorMessage:reason:", a3, 0, 0);
}

- (void)setIMAccountLoginStatus:(unint64_t)a3
{
  MEMORY[0x1E0DE7D20](self, sel_setIMAccountLoginStatus_errorMessage_);
}

- (void)setCurrentAccountStatus:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  NSAttributedString *v10;
  NSData *v11;
  NSDate *v12;
  NSDictionary *v13;
  NSDictionary *myNowPlaying;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  -[IMAccount myStatusDictionary](self, "myStatusDictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D36DF8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = IMPersonStatusFromFZPersonStatus(objc_msgSend(v6, "intValue"));

    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D36E00]);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = (__CFString *)v8;
    else
      v9 = &stru_1E4725068;
    -[IMAccount _updateMyStatus:message:](self, "_updateMyStatus:message:", v7, v9);
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D36DE8]);
    v10 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    if (v10 != self->_myProfile)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong((id *)&self->_myProfile, v10);
    }
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D36DD8]);
    v11 = (NSData *)objc_claimAutoreleasedReturnValue();
    if ((-[NSData isNull](v11, "isNull") & 1) != 0 || !-[NSData length](v11, "length"))
    {

      v11 = 0;
    }
    if (v11 != self->_myPictureData && !-[NSData isEqualToData:](v11, "isEqualToData:"))
      objc_storeStrong((id *)&self->_myPictureData, v11);
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D36D58]);
    v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
    if (v12 != self->_myIdleSince)
      objc_storeStrong((id *)&self->_myIdleSince, v12);
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D36DC0]);
    v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    myNowPlaying = self->_myNowPlaying;
    if (v13 != myNowPlaying && !-[NSDictionary isEqualToDictionary:](myNowPlaying, "isEqualToDictionary:", v13))
    {
      objc_storeStrong((id *)&self->_myNowPlaying, v13);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "__mainThreadPostNotificationName:object:", CFSTR("__kIMMeNowPlayingInfoChangedNotification"), self);

    }
    -[IMAccount myStatusDictionary](self, "myStatusDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v4 && v16)
    {
      -[IMAccount myStatusDictionary](self, "myStatusDictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToDictionary:", v4);

      v20 = (void *)objc_msgSend(v4, "mutableCopy");
      -[IMAccount setMyStatusDictionary:](self, "setMyStatusDictionary:", v20);

      if ((v19 & 1) != 0)
        goto LABEL_25;
    }
    else
    {

      v21 = (void *)objc_msgSend(v4, "mutableCopy");
      -[IMAccount setMyStatusDictionary:](self, "setMyStatusDictionary:", v21);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "__mainThreadPostNotificationName:object:", CFSTR("__kIMAccountStatusInfoChangedNotification"), self);

LABEL_25:
  }

}

- (int64_t)registrationStatus
{
  _BOOL4 v3;

  if (!-[IMAccount supportsRegistration](self, "supportsRegistration"))
    return 0;
  v3 = -[IMAccount isActive](self, "isActive");
  if (self->_registrationStatus < 5 || v3)
    return self->_registrationStatus;
  else
    return 1;
}

- (int64_t)registrationFailureReason
{
  if (-[IMAccount supportsRegistration](self, "supportsRegistration"))
    return self->_registrationFailureReason;
  else
    return -1;
}

- (void)registerAsIDSIDQueryControllerDelegate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  IMAccount *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[IMAccount service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1A200A40C(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[IMAccount uniqueID](self, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("IMAccount+KeyTransparency-%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount setKeyTransparencyIDQueryListenerID:](self, "setKeyTransparencyIDQueryListenerID:", v7);

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        -[IMAccount keyTransparencyIDQueryListenerID](self, "keyTransparencyIDQueryListenerID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v13 = v9;
        v14 = 2112;
        v15 = self;
        _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Adding IDSIDQueryControllerDelegate with listenerID %@ for %@", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0D34310], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount keyTransparencyIDQueryListenerID](self, "keyTransparencyIDQueryListenerID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addDelegate:forService:listenerID:queue:", self, v4, v11, MEMORY[0x1E0C80D38]);

  }
}

- (id)profileValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_profileChanges, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[NSDictionary objectForKey:](self->_profile, "objectForKey:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (int64_t)profileValidationStatus
{
  if (-[IMAccount accountType](self, "accountType") == 2)
    return 3;
  else
    return self->_profileStatus;
}

- (int64_t)profileValidationErrorReason
{
  void *v2;
  int64_t v3;

  -[IMAccount profileValueForKey:](self, "profileValueForKey:", *MEMORY[0x1E0D36F28]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "intValue");

  return v3;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *localCache;
  void *v7;
  void *v8;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_localCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    localCache = self->_localCache;
  }
  else
  {
    -[NSMutableDictionary objectForKey:](self->_dataChanges, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[NSRecursiveLock lock](self->_lock, "lock");
      -[NSDictionary objectForKey:](self->_data, "objectForKey:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSRecursiveLock unlock](self->_lock, "unlock");
      goto LABEL_6;
    }
    localCache = self->_dataChanges;
  }
  -[NSMutableDictionary objectForKey:](localCache, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v8;
}

- (unint64_t)myStatus
{
  return self->_myStatus;
}

- (NSString)myStatusMessage
{
  return self->_myStatusMessage;
}

- (NSMutableDictionary)myStatusDictionary
{
  return self->_myStatusDictionary;
}

- (NSData)myPictureData
{
  return self->_myPictureData;
}

- (NSString)myNowPlayingString
{
  return (NSString *)-[NSDictionary objectForKey:](self->_myNowPlaying, "objectForKey:", *MEMORY[0x1E0D36D40]);
}

- (NSDate)myIdleSince
{
  return self->_myIdleSince;
}

- (NSString)login
{
  return self->_loginID;
}

- (unint64_t)loginStatus
{
  return self->_loginStatus;
}

- (void)loginIfActiveRegistered
{
  if (!-[IMAccount loginStatus](self, "loginStatus")
    && -[IMAccount registrationStatus](self, "registrationStatus") == 5)
  {
    if (-[IMAccount isActive](self, "isActive"))
      MEMORY[0x1E0DE7D20](self, sel_setIMAccountLoginStatus_errorMessage_);
  }
}

- (void)loadFromDictionary:(id)a3
{
  -[IMAccount _loadFromDictionary:force:](self, "_loadFromDictionary:force:", a3, 0);
}

- (NSString)keyTransparencyIDQueryListenerID
{
  return self->_keyTransparencyIDQueryListenerID;
}

- (BOOL)isOperational
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D39648];
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "isAccountOperationalWithAllAccounts:account:", v5, self);

  return (char)self;
}

- (BOOL)isInvisible
{
  return -[IMAccount BOOLForKey:](self, "BOOLForKey:", *MEMORY[0x1E0D36CA8]);
}

- (NSString)internalName
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  objc_msgSend(WeakRetained, "internalName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (IMAccount)initWithUniqueID:(id)a3 service:(id)a4
{
  id v7;
  id v8;
  IMAccount *v9;
  NSRecursiveLock *v10;
  NSRecursiveLock *lock;
  IMPeople *v12;
  IMPeople *buddyList;
  NSDictionary *v14;
  NSDictionary *accountPreferences;
  void *v16;
  void *v17;
  NSAttributedString *v18;
  NSAttributedString *myProfile;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  dispatch_block_t v28;
  _QWORD block[4];
  IMAccount *v31;
  objc_super v32;

  v7 = a3;
  v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)IMAccount;
  v9 = -[IMAccount init](&v32, sel_init);
  if (v9)
  {
    v10 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    lock = v9->_lock;
    v9->_lock = v10;

    v12 = objc_alloc_init(IMPeople);
    buddyList = v9->_buddyList;
    v9->_buddyList = v12;

    v14 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    accountPreferences = v9->_accountPreferences;
    v9->_accountPreferences = v14;

    objc_storeStrong((id *)&v9->_uniqueID, a3);
    objc_storeWeak((id *)&v9->_service, v8);
    objc_msgSend(v8, "serviceProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", *MEMORY[0x1E0D36278]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_useMeCardName = objc_msgSend(v17, "intValue") != 0;

    v18 = (NSAttributedString *)objc_alloc_init(MEMORY[0x1E0CB3498]);
    myProfile = v9->_myProfile;
    v9->_myProfile = v18;

    -[IMAccount clearServiceCaches](v9, "clearServiceCaches");
    -[IMAccount syncWithRemoteBuddies](v9, "syncWithRemoteBuddies");
    objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addListener:", v9);

    -[IMAccount service](v9, "service");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMAccount service](v9, "service");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObserver:selector:name:object:", v9, sel__serviceDidConnect_, CFSTR("__k_IMServiceDidConnectNotification"), v23);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMAccount service](v9, "service");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObserver:selector:name:object:", v9, sel__serviceDidReconnect_, CFSTR("ServiceDidReconnect"), v25);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMAccount service](v9, "service");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObserver:selector:name:object:", v9, sel__serviceDidDisconnect_, CFSTR("ServiceDidDisconnect"), v27);

    }
    -[IMAccount registerAsIDSIDQueryControllerDelegate](v9, "registerAsIDSIDQueryControllerDelegate");
    if (qword_1ECF12478 != -1)
      dispatch_once(&qword_1ECF12478, &unk_1E471D538);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1A200C994;
    block[3] = &unk_1E471E348;
    v31 = v9;
    v28 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_UTILITY, 0, block);
    dispatch_async((dispatch_queue_t)qword_1ECF12468, v28);

  }
  return v9;
}

- (id)imHandleWithID:(id)a3
{
  return -[IMAccount imHandleWithID:alreadyCanonical:](self, "imHandleWithID:alreadyCanonical:", a3, 0);
}

- (void)hookupToDaemon
{
  -[IMAccount _refreshLoginIMHandle](self, "_refreshLoginIMHandle");
  self->_syncedWithRemoteBuddyList = 0;
  -[IMAccount requestGroups](self, "requestGroups");
  -[IMAccount syncWithRemoteBuddies](self, "syncWithRemoteBuddies");
}

- (NSString)countryCode
{
  NSString *countryCode;
  int64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  NSString *v10;
  void *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  void *v15;
  NSString *v16;
  void *v18;
  NSString *v19;
  NSString *v20;

  countryCode = self->_countryCode;
  if (countryCode)
    goto LABEL_20;
  v4 = -[IMAccount accountType](self, "accountType");
  if (v4 == 1)
  {
    if (IMSharedHelperDeviceIsAltAccount())
    {
      objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ctPhoneNumber");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (qword_1ECF12328 != -1)
        dispatch_once(&qword_1ECF12328, &unk_1E471EF48);
      objc_msgSend((id)qword_1ECF12320, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v6, "isTelephonyDevice"))
      {
        v5 = 0;
LABEL_14:

        if (!objc_msgSend(v5, "length"))
        {
          -[IMAccount profileValueForKey:](self, "profileValueForKey:", CFSTR("Number"));
          v8 = objc_claimAutoreleasedReturnValue();

          v5 = (void *)v8;
        }
        goto LABEL_16;
      }
      objc_msgSend(v6, "telephoneNumber");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v7;
    goto LABEL_14;
  }
  if (v4 == 2)
  {
    -[IMAccount displayName](self, "displayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
LABEL_16:
  if (objc_msgSend(v5, "length")
    && (IMCountryCodeForNumber(),
        v9 = (NSString *)objc_claimAutoreleasedReturnValue(),
        v10 = self->_countryCode,
        self->_countryCode = v9,
        v10,
        !-[NSString length](self->_countryCode, "length")))
  {
    -[IMAccount profileValueForKey:](self, "profileValueForKey:", CFSTR("Number"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "length"))
    {
      IMCountryCodeForNumber();
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      v20 = self->_countryCode;
      self->_countryCode = v19;

    }
  }
  else
  {
    v11 = v5;
  }

  countryCode = self->_countryCode;
LABEL_20:
  if (!-[NSString length](countryCode, "length"))
  {
    v12 = self->_countryCode;
    self->_countryCode = 0;

  }
  if (self->_countryCode
    || (IMCountryCodeForIncomingTextMessage(),
        v13 = (NSString *)objc_claimAutoreleasedReturnValue(),
        v14 = self->_countryCode,
        self->_countryCode = v13,
        v14,
        self->_countryCode))
  {
    -[IMAccount service](self, "service");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCountryCode:", self->_countryCode);

    v16 = self->_countryCode;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", *MEMORY[0x1E0C997B0]);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (void)clearServiceCaches
{
  NSMapTable *v3;
  NSMapTable *imHandles;
  unint64_t loginStatus;
  id WeakRetained;
  NSMutableDictionary *sortOrders;

  IMLogBacktrace();
  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0x10000, 5, 0);
  imHandles = self->_imHandles;
  self->_imHandles = v3;

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  loginStatus = self->_loginStatus;
  if (loginStatus)
  {
    self->_loginStatus = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_service);
    objc_msgSend(WeakRetained, "statusChangedForAccount:from:to:", self, loginStatus, self->_loginStatus);

  }
  sortOrders = self->_sortOrders;
  self->_sortOrders = 0;

}

- (id)canonicalFormOfID:(id)a3 countryCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  const void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "_appearsToBePhoneNumber"))
    goto LABEL_9;
  -[IMAccount service](self, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_wantsInternationizedNumbers");

  if (!v9)
    goto LABEL_9;
  if (!objc_msgSend(v7, "length"))
  {
    -[IMAccount countryCode](self, "countryCode");
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v10;
  }
  v11 = (const void *)IMPhoneNumberRefCopyForPhoneNumber();
  IMNormalizedPhoneNumberForCFPhoneNumberRef();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFRelease(v11);
  if (!objc_msgSend(v12, "length"))
  {

LABEL_9:
    objc_msgSend(v6, "lowercaseString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)canonicalFormOfID:(id)a3
{
  return -[IMAccount canonicalFormOfID:countryCode:](self, "canonicalFormOfID:countryCode:", a3, 0);
}

- (BOOL)BOOLForKey:(id)a3
{
  void *v3;
  char v4;

  -[IMAccount objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (NSString)authorizationID
{
  void *v3;

  if (-[IMAccount supportsAuthorization](self, "supportsAuthorization"))
  {
    -[IMAccount objectForKey:](self, "objectForKey:", *MEMORY[0x1E0D36E90]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSArray)aliases
{
  NSArray *aliases;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  NSArray *v18;
  NSArray *v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  aliases = self->_aliases;
  if (aliases)
    return aliases;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[IMAccount _aliases](self, "_aliases");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v23;
    v8 = *MEMORY[0x1E0D35140];
    v9 = *MEMORY[0x1E0D36E60];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (!v6)
          v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v11, "objectForKey:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lowercaseString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "trimmedString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15 && (!v12 || objc_msgSend(v12, "BOOLValue")))
        {
          if (-[IMAccount _aliasIsVisible:](self, "_aliasIsVisible:", v15))
            objc_msgSend(v6, "addObject:", v15);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v16 = (void *)_IDSCopyOrderedAliasStrings();
  objc_msgSend(v16, "array");
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v18 = self->_aliases;
  self->_aliases = v17;

  v19 = self->_aliases;
  return v19;
}

- (int64_t)accountType
{
  int64_t result;
  void *v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;

  result = self->_accountType;
  if (result < 0)
  {
    -[IMAccount login](self, "login");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "rangeOfString:", CFSTR("P:"));

    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[IMAccount service](self, "service");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "supportsAuthorization");

      result = v7;
    }
    else
    {
      result = 2;
    }
    self->_accountType = result;
  }
  return result;
}

- (void)accountDidBecomeActive
{
  -[IMAccount loginIfActiveRegistered](self, "loginIfActiveRegistered");
  MEMORY[0x1E0DE7D20](self, sel_hookupToDaemon);
}

- (void)_updateRegistrationStatus:(int)a3 error:(int)a4 info:(id)a5
{
  uint64_t v6;
  NSDictionary *v9;
  NSDictionary *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSDictionary **p_registrationAlertInfo;
  id WeakRetained;
  int v16;
  id v17;
  int64_t registrationStatus;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v6 = *(_QWORD *)&a4;
  v25 = *MEMORY[0x1E0C80C00];
  v9 = (NSDictionary *)a5;
  v10 = v9;
  if (*(_OWORD *)&self->_registrationStatus == __PAIR128__((int)v6, a3)
    && (!-[NSDictionary count](v9, "count") || self->_registrationAlertInfo))
  {
    if (v10)
    {
      if (!self->_registrationAlertInfo || -[NSDictionary isEqualToDictionary:](v10, "isEqualToDictionary:"))
        goto LABEL_26;
    }
    else if (!-[NSDictionary count](self->_registrationAlertInfo, "count"))
    {
      goto LABEL_26;
    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_registrationFailureReason);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412546;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Registration failure reason updated from:%@ to:%@", (uint8_t *)&v21, 0x16u);

    }
  }
  self->_registrationStatus = a3;
  self->_registrationFailureReason = (int)v6;
  p_registrationAlertInfo = &self->_registrationAlertInfo;
  if (self->_registrationAlertInfo != v10)
    objc_storeStrong((id *)&self->_registrationAlertInfo, a5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  v16 = objc_msgSend(WeakRetained, "supportsCapability:", *MEMORY[0x1E0D38E20]);

  if (v16)
    IMSetUserRegistrationFailureIntent();
  v17 = 0;
  registrationStatus = self->_registrationStatus;
  if ((_DWORD)v6 != -1 && registrationStatus == -1)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_registrationFailureReason);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v19, CFSTR("__kIMAccountRegistrationFailedReasonKey"));

    registrationStatus = self->_registrationStatus;
  }
  if (registrationStatus == -1 && -[NSDictionary count](*p_registrationAlertInfo, "count"))
  {
    if (!v17)
      v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v17, "addEntriesFromDictionary:", *p_registrationAlertInfo);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kIMAccountRegistrationStatusChangedNotification"), self, v17);

LABEL_26:
}

- (void)_updateProfileInfo:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int64_t v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  NSString *countryCode;
  int64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToDictionary:", self->_profile) & 1) != 0)
    goto LABEL_19;
  -[IMAccount profileValueForKey:](self, "profileValueForKey:", CFSTR("Region"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAccount profileValueForKey:](self, "profileValueForKey:", CFSTR("Number"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IMAccount profileValidationStatus](self, "profileValidationStatus");
  v9 = -[IMAccount profileValidationErrorReason](self, "profileValidationErrorReason");
  objc_storeStrong((id *)&self->_profile, a3);
  -[IMAccount profileValueForKey:](self, "profileValueForKey:", *MEMORY[0x1E0D36F30]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  self->_profileStatus = (int)objc_msgSend(v10, "intValue");

  -[IMAccount profileValueForKey:](self, "profileValueForKey:", CFSTR("Region"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 == v6)
  {

  }
  else
  {
    -[IMAccount profileValueForKey:](self, "profileValueForKey:", CFSTR("Region"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", v6);

    if (!v13)
    {
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "__mainThreadPostNotificationName:object:", CFSTR("__kIMAccountProfileChangedNotification"), self);

      goto LABEL_10;
    }
  }
  -[IMAccount profileValueForKey:](self, "profileValueForKey:", CFSTR("Number"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 != v7)
  {
    -[IMAccount profileValueForKey:](self, "profileValueForKey:", CFSTR("Number"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", v7);

    if ((v16 & 1) != 0)
      goto LABEL_10;
    goto LABEL_8;
  }

LABEL_10:
  if (-[IMAccount profileValidationStatus](self, "profileValidationStatus") != v8
    || -[IMAccount profileValidationErrorReason](self, "profileValidationErrorReason") != v9)
  {
    countryCode = self->_countryCode;
    self->_countryCode = 0;

    v19 = -[IMAccount profileValidationStatus](self, "profileValidationStatus");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[IMAccount profileValidationStatus](self, "profileValidationStatus"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 == -1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[IMAccount profileValidationErrorReason](self, "profileValidationErrorReason"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
    }
    objc_msgSend(v21, "dictionaryWithObjectsAndKeys:", v22, CFSTR("__kIMAccountNewStatusKey"), v23, CFSTR("__kIMAccountOldStatusKey"), v24, CFSTR("__kIMAccountProfileValidationStatusFailedReasonKey"), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kIMAccountProfileValidationStatusChangedNotification"), self, v25);

    if (v19 == -1)
  }

LABEL_19:
}

- (void)_updateLogin:(id)a3
{
  NSString *v5;
  NSString *strippedLogin;
  NSString *v7;

  v7 = (NSString *)a3;
  if (self->_loginID != v7)
  {
    self->_accountType = -1;
    objc_storeStrong((id *)&self->_loginID, a3);
    -[NSString _stripFZIDPrefix](self->_loginID, "_stripFZIDPrefix");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    strippedLogin = self->_strippedLogin;
    self->_strippedLogin = v5;

  }
  -[IMAccount _refreshLoginIMHandle](self, "_refreshLoginIMHandle");

}

- (BOOL)_updateDisplayName:(id)a3
{
  NSString *v5;
  NSString *displayName;
  BOOL v7;
  NSObject *v9;
  void *v10;

  v5 = (NSString *)a3;
  displayName = self->_displayName;
  if (displayName != v5
    && !-[NSString isEqualToString:](displayName, "isEqualToString:", v5)
    && (-[NSString _appearsToBeDSID](v5, "_appearsToBeDSID") & 1) == 0)
  {
    if (!-[NSString length](v5, "length")
      || -[IMAccount validationStatusForAlias:](self, "validationStatusForAlias:", v5) == 3
      || !-[IMAccount supportsRegistration](self, "supportsRegistration"))
    {
      objc_storeStrong((id *)&self->_displayName, a3);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "__mainThreadPostNotificationName:object:", CFSTR("__kIMAccountDisplayNameChangedNotification"), self);

      v7 = 1;
      goto LABEL_5;
    }
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1A2196340((uint64_t)v5, self, v9);

  }
  v7 = 0;
LABEL_5:

  return v7;
}

- (void)_serviceDidConnect:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_hookupToDaemon);
}

- (void)_refreshLoginIMHandle
{
  uint64_t v3;
  IMHandle *loginIMHandle;
  void *v5;
  char v6;
  IMHandle *v7;
  IMHandle *v8;
  void *v9;
  IMHandle *v10;
  IMHandle *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  IMHandle *v18;
  void *v19;
  id v20;

  -[IMAccount login](self, "login");
  v3 = objc_claimAutoreleasedReturnValue();
  loginIMHandle = self->_loginIMHandle;
  v20 = (id)v3;
  if (v3)
  {
    if (loginIMHandle)
    {
      -[IMHandle ID](loginIMHandle, "ID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqualToIgnoringCase:", v20);

      if ((v6 & 1) != 0)
        goto LABEL_14;
      loginIMHandle = self->_loginIMHandle;
    }
  }
  else if (!loginIMHandle)
  {
    goto LABEL_14;
  }
  v7 = loginIMHandle;
  v8 = self->_loginIMHandle;
  self->_loginIMHandle = 0;

  if (v7)
  {
    +[IMMe me](IMMe, "me");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeLoginIMHandle:", v7);

    -[IMHandle resetCNContact](v7, "resetCNContact");
  }
  if (v20)
  {
    -[IMAccount imHandleWithID:](self, "imHandleWithID:", v20);
    v10 = (IMHandle *)objc_claimAutoreleasedReturnValue();
    v11 = self->_loginIMHandle;
    self->_loginIMHandle = v10;

    +[IMMe me](IMMe, "me");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "addLoginIMHandle:", self->_loginIMHandle);

    if (v13)
    {
      +[IMMe me](IMMe, "me");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "cnContact");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[IMHandle cnContactWithKeys:](self->_loginIMHandle, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15 != v16)
      {
        +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = self->_loginIMHandle;
        objc_msgSend(v16, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeHandleFromCNIDMap:withCNID:", v18, v19);

        -[IMHandle updateCNContact:](self->_loginIMHandle, "updateCNContact:", v15);
      }

    }
  }

LABEL_14:
}

- (void)_loadFromDictionary:(id)a3 force:(BOOL)a4
{
  NSMutableDictionary *localCache;
  NSMutableDictionary *dataChanges;
  NSDictionary *v9;
  NSDictionary *accountPreferences;
  NSArray *vettedAliases;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSDictionary *v19;
  NSDictionary *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  NSDictionary *data;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  int64_t v47;
  int64_t v48;
  __CFDictionary *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _BOOL4 v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  void *v69;

  v67 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (!a4
    && v67
    && (data = self->_data) != 0
    && -[NSDictionary isEqualToDictionary:](data, "isEqualToDictionary:", v67))
  {
    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }
  else
  {
    v60 = -[IMAccount isInvisible](self, "isInvisible");
    -[IMAccount authorizationID](self, "authorizationID");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount aliases](self, "aliases");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount vettedAliases](self, "vettedAliases");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount _aliases](self, "_aliases");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_data, a3);
    localCache = self->_localCache;
    self->_localCache = 0;

    dataChanges = self->_dataChanges;
    self->_dataChanges = 0;

    objc_msgSend(v67, "objectForKey:", CFSTR("AccountPrefs"));
    v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    accountPreferences = self->_accountPreferences;
    self->_accountPreferences = v9;

    vettedAliases = self->_vettedAliases;
    self->_vettedAliases = 0;

    -[IMAccount _invalidateCachedAliases](self, "_invalidateCachedAliases");
    objc_msgSend(v67, "objectForKey:", *MEMORY[0x1E0D36F00]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount _updateLogin:](self, "_updateLogin:", v12);

    objc_msgSend(v67, "objectForKey:", *MEMORY[0x1E0D36F20]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount _updateProfileInfo:](self, "_updateProfileInfo:", v13);

    objc_msgSend(v67, "objectForKey:", *MEMORY[0x1E0D36F68]);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "objectForKey:", *MEMORY[0x1E0D36F70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "intValue");
    objc_msgSend(v65, "objectForKey:", *MEMORY[0x1E0D36F60]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "intValue");
    objc_msgSend(v65, "objectForKey:", *MEMORY[0x1E0D36F58]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount _updateRegistrationStatus:error:info:](self, "_updateRegistrationStatus:error:info:", v15, v17, v18);

    if (!self->_accountPreferences)
    {
      v19 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v20 = self->_accountPreferences;
      self->_accountPreferences = v19;

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "__mainThreadPostNotificationName:object:", CFSTR("__kIMAccountSettingsChangedNotification"), self);

    -[IMAccount authorizationID](self, "authorizationID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22 == v62)
    {

    }
    else
    {
      -[IMAccount authorizationID](self, "authorizationID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToString:", v62);

      if ((v24 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "__mainThreadPostNotificationName:object:", CFSTR("__kIMAccountAuthorizationIDChangedNotification"), self);

      }
    }
    -[IMAccount aliases](self, "aliases");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v64 != v63 && (objc_msgSend(v63, "isEqualToArray:", v64) & 1) == 0)
    {
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v64);
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v63);
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v64);
      objc_msgSend(v29, "minusSet:", v28);
      objc_msgSend(v28, "minusSet:", v27);
      v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (objc_msgSend(v28, "count"))
      {
        objc_msgSend(v28, "allObjects");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setObject:forKey:", v31, CFSTR("__kIMAccountAliasesAddedKey"));

      }
      if (objc_msgSend(v29, "count"))
      {
        objc_msgSend(v29, "allObjects");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setObject:forKey:", v32, CFSTR("__kIMAccountAliasesRemovedKey"));

      }
      if (objc_msgSend(v30, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kIMAccountAliasesChangedNotification"), self, v30);

      }
    }
    -[IMAccount _aliases](self, "_aliases");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "objectForKey:", *MEMORY[0x1E0D36E70]);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v66 || v34 != v69 && (objc_msgSend(v34, "isEqualToArray:", v69) & 1) == 0) && objc_msgSend(v34, "count"))
    {
      v35 = 0;
      v36 = *MEMORY[0x1E0D36E60];
      v68 = *MEMORY[0x1E0D36E68];
      do
      {
        objc_msgSend(v34, "objectAtIndex:", v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKey:", v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v38, "length"))
        {
          if (v35 >= objc_msgSend(v69, "count"))
          {
            v42 = 0;
          }
          else
          {
            objc_msgSend(v69, "objectAtIndex:", v35);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "objectForKey:", v68);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "intValue");

            v42 = v41;
          }
          if (v35 >= objc_msgSend(v34, "count"))
          {
            v46 = 0;
          }
          else
          {
            objc_msgSend(v34, "objectAtIndex:", v35);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "objectForKey:", v68);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v44, "intValue");

            v46 = v45;
          }
          v47 = -[IMAccount validationErrorReasonForAlias:](self, "validationErrorReasonForAlias:", v38);
          if (v46 != v42)
          {
            v48 = v47;
            v49 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
            v50 = v38;
            if (v50)
              CFDictionarySetValue(v49, CFSTR("__kIMAccountAliasChangedKey"), v50);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v46);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (v51)
              CFDictionarySetValue(v49, CFSTR("__kIMAccountNewStatusKey"), v51);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v42);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            if (v52)
              CFDictionarySetValue(v49, CFSTR("__kIMAccountOldStatusKey"), v52);

            if (v46 == -1 && v48 != -1)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v48);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              if (v53)
                CFDictionarySetValue(v49, CFSTR("__kIMAccountAliasValidationStatusFailedReasonKey"), v53);

              if (objc_msgSend(v66, "count"))
                -[__CFDictionary addEntriesFromDictionary:](v49, "addEntriesFromDictionary:", v66);
            }
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kIMAccountAliasValidationStatusChangedNotification"), self, v49);

          }
        }

        ++v35;
      }
      while (v35 < objc_msgSend(v34, "count"));
    }
    if (v60 != -[IMAccount isInvisible](self, "isInvisible"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "__mainThreadPostNotificationName:object:", CFSTR("__kIMAccountInvisibilityChangedNotification"), self);

    }
    -[IMAccount vettedAliases](self, "vettedAliases");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v56;
    if (v56 != v61 && (objc_msgSend(v56, "isEqualToArray:", v61) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "__mainThreadPostNotificationName:object:", CFSTR("__kIMAccountVettedAliasesChangedNotification"), self);

    }
    objc_msgSend(v67, "objectForKey:", *MEMORY[0x1E0D36ED0]);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount _updateDisplayName:](self, "_updateDisplayName:", v59);

    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }

}

- (BOOL)_isUsableForSending
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D39648];
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "isAccountUsableForSendingWithAllAccounts:account:", v5, self);

  return (char)self;
}

- (void)_invalidateCachedAliases
{
  NSArray *aliases;

  aliases = self->_aliases;
  self->_aliases = 0;

}

- (id)_aliases
{
  return -[IMAccount objectForKey:](self, "objectForKey:", *MEMORY[0x1E0D36E80]);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  NSMapTable *imHandles;
  NSDictionary *data;
  objc_super v8;

  +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_dumpOutAllIMHandlesForAccount:", self);

  -[IMAccount deregisterAsIDSIDQueryControllerDelegate](self, "deregisterAsIDSIDQueryControllerDelegate");
  objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeListener:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, 0, 0);

  -[NSRecursiveLock lock](self->_lock, "lock");
  imHandles = self->_imHandles;
  self->_imHandles = 0;

  data = self->_data;
  self->_data = 0;

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  v8.receiver = self;
  v8.super_class = (Class)IMAccount;
  -[IMAccount dealloc](&v8, sel_dealloc);
}

- (IMAccount)initWithService:(id)a3
{
  return -[IMAccount initWithUniqueID:service:](self, "initWithUniqueID:service:", 0, a3);
}

- (void)_loginWithAutoLogin:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  int v7;
  unint64_t v8;
  void *v9;
  id v10;

  v3 = a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "capabilities");
  v7 = *MEMORY[0x1E0D36CF0] & v6;

  if (v7)
  {
    v8 = -[IMAccount loginStatus](self, "loginStatus");
    if (-[IMAccount isActive](self, "isActive"))
    {
      if (v8 <= 3)
      {
        +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        -[IMAccount uniqueID](self, "uniqueID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v3)
          objc_msgSend(v10, "autoLoginAccount:", v9);
        else
          objc_msgSend(v10, "loginAccount:", v9);

      }
    }
  }
}

- (void)autoLoginAccount
{
  MEMORY[0x1E0DE7D20](self, sel__loginWithAutoLogin_);
}

- (void)loginAccount
{
  MEMORY[0x1E0DE7D20](self, sel__loginWithAutoLogin_);
}

- (void)logoutAccount
{
  void *v3;
  int v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "capabilities");
  v5 = *MEMORY[0x1E0D36CF0] & v4;

  if (v5)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount uniqueID](self, "uniqueID");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logoutAccount:", v7);

    -[IMAccount service](self, "service");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend(v8, "supportsOfflineTransfers");

    if ((v7 & 1) == 0)
    {
      +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "transfersForAccount:", self);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v20;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v20 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v15);
            +[IMFileTransferCenter sharedInstance](IMFileTransferCenter, "sharedInstance", (_QWORD)v19);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "guid");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "stopTransfer:", v18);

            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v13);
      }

    }
    if (-[IMAccount loginStatus](self, "loginStatus", (_QWORD)v19) >= 3)
      -[IMAccount setIMAccountLoginStatus:](self, "setIMAccountLoginStatus:", 0);
  }
}

- (void)loginStatusChanged:(unint64_t)a3 message:(id)a4 reason:(int)a5 properties:(id)a6
{
  -[IMAccount setIMAccountLoginStatus:errorMessage:reason:](self, "setIMAccountLoginStatus:errorMessage:reason:", a3, a4, *(_QWORD *)&a5, a6);
  -[IMAccount setIMAccountLoginStatus:](self, "setIMAccountLoginStatus:", a3);
}

- (void)setLogin:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[IMAccount accountType](self, "accountType") != 2)
  {
    -[IMAccount service](self, "service");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "supportsAuthorization");

    if (v5)
    {
      MEMORY[0x1A8582830](v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      IMGenerateLoginID();
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[IMAccount _setString:forKey:](self, "_setString:forKey:", v7, *MEMORY[0x1E0D36F00]);
    -[IMAccount _updateLogin:](self, "_updateLogin:", v7);
  }

}

- (void)_updateMyStatus:(unint64_t)a3 message:(id)a4
{
  id v7;
  void *v8;
  unint64_t *p_myStatus;
  int v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a4;
  v8 = v7;
  if (!v7 || objc_msgSend(v7, "isEqualToString:", self->_myStatusMessage))
  {
    p_myStatus = &self->_myStatus;
    if (self->_myStatus == a3)
      goto LABEL_13;
    v10 = 0;
    goto LABEL_7;
  }
  objc_storeStrong((id *)&self->_myStatusMessage, a4);
  p_myStatus = &self->_myStatus;
  v10 = 1;
  if (self->_myStatus != a3)
  {
LABEL_7:
    v11 = v10;
    *p_myStatus = a3;
    LOBYTE(v10) = 0;
    goto LABEL_8;
  }
  v11 = 1;
LABEL_8:
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "__mainThreadPostNotificationName:object:", CFSTR("__kIMMeStatusChangedNotification"), self);

  if ((v10 & 1) != 0)
  {
    if (!v11)
      goto LABEL_13;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "__mainThreadPostNotificationName:object:", CFSTR("__kIMAccountStatusChangedNotification"), self);

  if ((v11 & 1) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "__mainThreadPostNotificationName:object:", CFSTR("__kIMAccountStatusMessageChangedNotification"), self);

  }
LABEL_13:

}

- (void)setUniqueID:(id)a3
{
  NSString *v5;
  NSString **p_uniqueID;
  NSString *uniqueID;
  NSString *v8;

  v5 = (NSString *)a3;
  uniqueID = self->_uniqueID;
  p_uniqueID = &self->_uniqueID;
  if (uniqueID != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_uniqueID, a3);
    v5 = v8;
  }

}

- (NSString)shortName
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  objc_msgSend(WeakRetained, "shortName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)name
{
  void *v2;
  void *v3;

  if (self->_useMeCardName)
  {
    +[IMMe me](IMMe, "me");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "fullName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[IMAccount accountDescription](self, "accountDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (BOOL)equalID:(id)a3 andID:(id)a4
{
  IMServiceImpl **p_service;
  id v6;
  id v7;
  id WeakRetained;
  char v9;

  p_service = &self->_service;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_service);
  v9 = objc_msgSend(WeakRetained, "equalID:andID:", v7, v6);

  return v9;
}

- (void)writeSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSDictionary *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *profileChanges;
  NSString *countryCode;
  NSMutableDictionary *accountPreferencesChanges;
  NSMutableDictionary *localCache;
  NSMutableDictionary *dataChanges;
  NSDictionary *data;
  NSDictionary *v18;

  -[NSRecursiveLock lock](self->_lock, "lock");
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAccount uniqueID](self, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountForUniqueID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAccount:", self);

  }
  if (-[NSMutableDictionary count](self->_profileChanges, "count"))
  {
    -[IMAccount profileInfo](self, "profileInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount _setObject:forKey:](self, "_setObject:forKey:", v7, *MEMORY[0x1E0D36F20]);

  }
  if (-[NSMutableDictionary count](self->_accountPreferencesChanges, "count"))
  {
    -[IMAccount accountPreferences](self, "accountPreferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount _setObject:forKey:](self, "_setObject:forKey:", v8, CFSTR("AccountPrefs"));

  }
  -[IMAccount dictionary](self, "dictionary");
  v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableDictionary count](self->_dataChanges, "count"))
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount uniqueID](self, "uniqueID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "writeAccount:defaults:", v11, self->_dataChanges);

  }
  profileChanges = self->_profileChanges;
  self->_profileChanges = 0;

  countryCode = self->_countryCode;
  self->_countryCode = 0;

  accountPreferencesChanges = self->_accountPreferencesChanges;
  self->_accountPreferencesChanges = 0;

  localCache = self->_localCache;
  self->_localCache = 0;

  dataChanges = self->_dataChanges;
  self->_dataChanges = 0;

  data = self->_data;
  self->_data = v9;
  v18 = v9;

  -[IMAccount _loadFromDictionary:force:](self, "_loadFromDictionary:force:", v18, 1);
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (void)resetToDefaults
{
  id WeakRetained;
  NSMutableDictionary *localCache;
  NSMutableDictionary *dataChanges;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  id v8;

  -[IMAccount setAutoLogin:](self, "setAutoLogin:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  objc_msgSend(WeakRetained, "defaultAccountSettings");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  localCache = self->_localCache;
  self->_localCache = 0;

  if (objc_msgSend(v8, "count"))
  {
    dataChanges = self->_dataChanges;
    if (dataChanges)
    {
      -[NSMutableDictionary addEntriesFromDictionary:](dataChanges, "addEntriesFromDictionary:", v8);
    }
    else
    {
      v6 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v8);
      v7 = self->_dataChanges;
      self->_dataChanges = v6;

    }
  }
  -[IMAccount _invalidateCachedAliases](self, "_invalidateCachedAliases");

}

- (BOOL)emailAddressIsID:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  -[IMAccount emailDomains](self, "emailDomains");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[IMService isEmailAddress:inDomains:](IMService, "isEmailAddress:inDomains:", v4, v5);

  return v6;
}

- (int64_t)compareLoginStatus:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  int64_t v7;

  v4 = a3;
  v5 = -[IMAccount loginStatus](self, "loginStatus");
  v6 = objc_msgSend(v4, "loginStatus");
  if (v5 == v6)
  {
    v7 = -[IMAccount compareAccountNames:](self, "compareAccountNames:", v4);
  }
  else if (v5 > v6)
  {
    v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (int64_t)compareAccountNames:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[IMAccount accountDescription](self, "accountDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  if (!v7)
    v7 = -[IMAccount compareIDs:](self, "compareIDs:", v4);

  return v7;
}

- (int64_t)compareStatus:(id)a3
{
  id v4;
  NSComparisonResult v5;

  v4 = a3;
  v5 = IMComparePersonStatus(-[IMAccount myStatus](self, "myStatus"), objc_msgSend(v4, "myStatus"));
  if (v5 == NSOrderedSame)
    v5 = -[IMAccount compareAccountNames:](self, "compareAccountNames:", v4);

  return v5;
}

- (int64_t)compareIDs:(id)a3
{
  IMAccount *v4;
  void *v5;
  void *v6;
  int64_t v7;
  int64_t v8;

  v4 = (IMAccount *)a3;
  -[IMAccount login](self, "login");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAccount login](v4, "login");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);

  v8 = self > v4;
  if (v7)
    return v7;
  else
    return v8;
}

- (int64_t)compareServices:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  v4 = a3;
  -[IMAccount service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shortName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "shortName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "localizedCaseInsensitiveCompare:", v8);

  return v9;
}

- (BOOL)supportsCapability:(id)a3
{
  return -[IMAccount supportsCapability:forAlias:simID:](self, "supportsCapability:forAlias:simID:", a3, 0, 0);
}

- (BOOL)supportsCapability:(id)a3 forAlias:(id)a4
{
  return -[IMAccount supportsCapability:forAlias:simID:](self, "supportsCapability:forAlias:simID:", a3, a4, 0);
}

- (BOOL)supportsCapability:(id)a3 forAlias:(id)a4 simID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
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
  BOOL v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[IMAccount service](self, "service");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "supportsCapability:", v8);

  if (v12)
  {
    if (-[IMAccount _hasSuppressionForCapability:](self, "_hasSuppressionForCapability:", v8))
    {
      v13 = (void *)MEMORY[0x1E0C99E60];
      -[IMAccount objectForKey:](self, "objectForKey:", *MEMORY[0x1E0D38EE8]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setWithArray:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)MEMORY[0x1E0C99E60];
      -[IMAccount objectForKey:](self, "objectForKey:", *MEMORY[0x1E0D38EF0]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setWithArray:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = (void *)MEMORY[0x1E0C99E60];
      -[IMAccount aliases](self, "aliases");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setWithArray:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (objc_msgSend(v23, "isSubsetOfSet:", v16) & 1) == 0
         && (!v9 || (objc_msgSend(v16, "containsObject:", v9) & 1) == 0)
         && (!v10 || (objc_msgSend(v20, "containsObject:", v10) & 1) == 0);

    }
    else
    {
      v24 = 1;
    }
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (BOOL)_hasSuppressionForCapability:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = *MEMORY[0x1E0D38EE8];
  v5 = a3;
  -[IMAccount objectForKey:](self, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMAccount objectForKey:](self, "objectForKey:", *MEMORY[0x1E0D38EF0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
    v10 = 1;
  else
    v10 = objc_msgSend(v9, "count") != 0;

  return v10;
}

- (id)_handlesSupportingNetworkFallback
{
  return -[IMAccount objectForKey:](self, "objectForKey:", *MEMORY[0x1E0D38EE0]);
}

- (BOOL)handleSupportsNetworkFallback:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[IMAccount _handlesSupportingNetworkFallback](self, "_handlesSupportingNetworkFallback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (BOOL)handlesChatInvites
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  v3 = objc_msgSend(WeakRetained, "handlesChatInvites");

  return v3;
}

- (NSString)password
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_class();
  -[IMAccount login](self, "login");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAccount canonicalFormOfID:](self, "canonicalFormOfID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAccount internalName](self, "internalName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "passwordForAccount:forServiceName:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)setPassword:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[IMAccount uniqueID](self, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v6;
    _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_DEFAULT, "Client request to set password for account: %@", (uint8_t *)&v14, 0xCu);

  }
  if (objc_msgSend(v4, "length"))
  {
    v7 = (void *)objc_opt_class();
    -[IMAccount login](self, "login");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount canonicalFormOfID:](self, "canonicalFormOfID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount authorizationID](self, "authorizationID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount internalName](self, "internalName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPassword:forAccount:forAuthID:forServiceName:", v4, v9, v10, v11);

    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount uniqueID](self, "uniqueID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "passwordUpdatedAccount:", v13);

  }
  else
  {
    -[IMAccount removePassword](self, "removePassword");
  }

}

+ (id)passwordForAccount:(id)a3 forServiceName:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    IMGetKeychainPassword();
    v7 = 0;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)setPassword:(id)a3 forAccount:(id)a4 forAuthID:(id)a5 forServiceName:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  dispatch_semaphore_t v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  dispatch_semaphore_t v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v10, "length") && objc_msgSend(v9, "length"))
  {
    IMSetKeychainPassword();
    v13 = dispatch_semaphore_create(0);
    objc_msgSend(MEMORY[0x1E0D20C18], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1A2049158;
    v16[3] = &unk_1E471EE98;
    v17 = v13;
    v15 = v13;
    objc_msgSend(v14, "setPasswordForProfileID:username:service:password:outRequestID:completionBlock:", v11, v10, v12, v9, 0, v16);

    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  }

}

- (void)removePassword
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[IMAccount uniqueID](self, "uniqueID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_DEFAULT, "Client request to remove password for account: %@", (uint8_t *)&v9, 0xCu);

  }
  v5 = (void *)objc_opt_class();
  -[IMAccount login](self, "login");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAccount canonicalFormOfID:](self, "canonicalFormOfID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAccount internalName](self, "internalName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removePasswordForAccount:forServiceName:", v7, v8);

}

+ (void)removePasswordForAccount:(id)a3 forServiceName:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if (objc_msgSend(v6, "length"))
    IMRemoveKeychainPassword();

}

- (NSString)temporaryPassword
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_class();
  -[IMAccount login](self, "login");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAccount canonicalFormOfID:](self, "canonicalFormOfID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAccount authorizationID](self, "authorizationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAccount internalName](self, "internalName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "temporaryPasswordForAccount:forAuthID:forServiceName:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)setTemporaryPassword:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[IMAccount uniqueID](self, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v6;
    _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_DEFAULT, "Client request to set temporary password for account: %@", (uint8_t *)&v14, 0xCu);

  }
  if (objc_msgSend(v4, "length"))
  {
    v7 = (void *)objc_opt_class();
    -[IMAccount login](self, "login");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount canonicalFormOfID:](self, "canonicalFormOfID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount authorizationID](self, "authorizationID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount internalName](self, "internalName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTemporaryPassword:forAccount:forAuthID:forServiceName:", v4, v9, v10, v11);

    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount uniqueID](self, "uniqueID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "passwordUpdatedAccount:", v13);

  }
  else
  {
    -[IMAccount removeTemporaryPassword](self, "removeTemporaryPassword");
  }

}

+ (id)temporaryPasswordForAccount:(id)a3 forAuthID:(id)a4 forServiceName:(id)a5
{
  id v7;
  id v8;
  id v9;
  dispatch_semaphore_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1A200AD64;
  v22 = sub_1A200AC24;
  v23 = 0;
  if (objc_msgSend(v7, "length"))
  {
    v10 = dispatch_semaphore_create(0);
    objc_msgSend(MEMORY[0x1E0D20C18], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1A20497AC;
    v15[3] = &unk_1E471EEC0;
    v12 = v10;
    v16 = v12;
    v17 = &v18;
    objc_msgSend(v11, "fetchPasswordForProfileID:username:service:outRequestID:completionBlock:", v8, v7, v9, 0, v15);

    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  }
  v13 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v13;
}

+ (void)setTemporaryPassword:(id)a3 forAccount:(id)a4 forAuthID:(id)a5 forServiceName:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  dispatch_semaphore_t v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  dispatch_semaphore_t v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v10, "length"))
  {
    v13 = dispatch_semaphore_create(0);
    objc_msgSend(MEMORY[0x1E0D20C18], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1A20499E0;
    v16[3] = &unk_1E471EE98;
    v17 = v13;
    v15 = v13;
    objc_msgSend(v14, "setPasswordForProfileID:username:service:password:outRequestID:completionBlock:", v11, v10, v12, v9, 0, v16);

    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  }

}

- (void)removeTemporaryPassword
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_opt_class();
  -[IMAccount login](self, "login");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[IMAccount canonicalFormOfID:](self, "canonicalFormOfID:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAccount internalName](self, "internalName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTemporaryPasswordForAccount:forServiceName:", v4, v5);

}

+ (void)removeTemporaryPasswordForAccount:(id)a3 forServiceName:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if (objc_msgSend(v6, "length"))
    IMRemoveTemporaryKeychainPassword();

}

- (void)setInvisible:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  id v6;

  v3 = a3;
  if (-[IMAccount isInvisible](self, "isInvisible") != a3)
  {
    v5 = -[IMAccount capabilities](self, "capabilities");
    -[IMAccount _setBool:forKey:](self, "_setBool:forKey:", (v5 >> 38) & v3, *MEMORY[0x1E0D36CA8]);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "__mainThreadPostNotificationName:object:", CFSTR("__kIMAccountInvisibilityChangedNotification"), self);

  }
}

- (NSString)accountDescription
{
  void *v3;
  int v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  -[IMAccount service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPersistent");

  if (!v4)
  {
    v8 = *MEMORY[0x1E0D36EC8];
    -[IMAccount stringForKey:](self, "stringForKey:", *MEMORY[0x1E0D36EC8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      -[IMAccount stringForKey:](self, "stringForKey:", v8);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[IMAccount login](self, "login");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");

      if (!v13)
      {
        -[IMAccount objectForKey:](self, "objectForKey:", *MEMORY[0x1E0D361D8]);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "length"))
        {
          v6 = v5;
        }
        else
        {
          -[IMAccount uniqueID](self, "uniqueID");
          v6 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_3;
      }
      -[IMAccount login](self, "login");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v11;
    return (NSString *)v7;
  }
  -[IMAccount service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shortName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
  v7 = v6;

  return (NSString *)v7;
}

- (void)setAccountDescription:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  -[IMAccount login](self, "login");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", v4) & 1) != 0)
  {

    v5 = 0;
  }
  else
  {
    v6 = objc_msgSend(v7, "length");

    if (v6)
      v5 = v7;
    else
      v5 = 0;
  }
  -[IMAccount _setString:forKey:](self, "_setString:forKey:", v5, *MEMORY[0x1E0D36EC8]);

}

- (BOOL)hasCustomDescription
{
  void *v2;
  BOOL v3;

  -[IMAccount stringForKey:](self, "stringForKey:", *MEMORY[0x1E0D36EC8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (BOOL)autoLogin
{
  return -[IMAccount BOOLForKey:](self, "BOOLForKey:", *MEMORY[0x1E0D36EA0]);
}

- (void)setAutoLogin:(BOOL)a3
{
  -[IMAccount _setBool:forKey:](self, "_setBool:forKey:", a3, *MEMORY[0x1E0D36EA0]);
}

- (BOOL)useSSL
{
  return -[IMAccount BOOLForKey:](self, "BOOLForKey:", *MEMORY[0x1E0D36FD8]);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IMAccount uniqueID](self, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAccount service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAccount login](self, "login");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IMAccount isActive](self, "isActive"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  -[IMAccount loginStatusMessage](self, "loginStatusMessage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("IMAccount: %p [ID: %@ Service: %@ Login: %@ Active: %@ LoginStatus: %@]"), self, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_serverWithSSL:(BOOL)a3
{
  _QWORD *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = (_QWORD *)MEMORY[0x1E0D36F98];
  if (!a3)
    v4 = (_QWORD *)MEMORY[0x1E0D36F88];
  -[IMAccount stringForKey:](self, "stringForKey:", *v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {
    -[IMAccount login](self, "login");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8)
    {
      -[IMAccount login](self, "login");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "rangeOfString:", CFSTR("@"));
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v11 = v10 + 1;
        if (v10 + 1 < (unint64_t)objc_msgSend(v9, "length"))
        {
          objc_msgSend(v9, "substringFromIndex:", v11);
          v6 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }

    }
    v6 = 0;
    goto LABEL_11;
  }
  v6 = v5;
LABEL_11:

  return v6;
}

- (NSString)server
{
  -[IMAccount useSSL](self, "useSSL");
  return (NSString *)MEMORY[0x1E0DE7D20](self, sel__serverWithSSL_);
}

- (int64_t)port
{
  _BOOL4 v3;
  _QWORD *v4;

  v3 = -[IMAccount useSSL](self, "useSSL");
  v4 = (_QWORD *)MEMORY[0x1E0D36FA0];
  if (!v3)
    v4 = (_QWORD *)MEMORY[0x1E0D36F90];
  return -[IMAccount integerForKey:](self, "integerForKey:", *v4);
}

- (BOOL)goIdle
{
  return !-[IMAccount blockIdleStatus](self, "blockIdleStatus");
}

- (void)setGoIdle:(BOOL)a3
{
  MEMORY[0x1E0DE7D20](self, sel_setBlockIdleStatus_);
}

- (BOOL)allowsVCRelay
{
  uint64_t v3;
  void *v4;

  v3 = *MEMORY[0x1E0D36EE8];
  -[IMAccount objectForKey:](self, "objectForKey:", *MEMORY[0x1E0D36EE8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[IMAccount _setBool:forKey:](self, "_setBool:forKey:", 1, v3);
  return -[IMAccount BOOLForKey:](self, "BOOLForKey:", v3);
}

- (void)setAllowsVCRelay:(BOOL)a3
{
  -[IMAccount _setBool:forKey:](self, "_setBool:forKey:", a3, *MEMORY[0x1E0D36EE8]);
}

- (BOOL)allowsSMSRelay
{
  return -[IMAccount BOOLForKey:](self, "BOOLForKey:", *MEMORY[0x1E0D36180]);
}

- (BOOL)allowsMMSRelay
{
  return -[IMAccount BOOLForKey:](self, "BOOLForKey:", *MEMORY[0x1E0D36178]);
}

- (BOOL)isSMSRelayCapable
{
  return -[IMAccount BOOLForKey:](self, "BOOLForKey:", *MEMORY[0x1E0D36188]);
}

- (BOOL)canActivate
{
  void *v3;
  BOOL v4;

  -[IMAccount service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "isDiscontinued") & 1) == 0 && -[IMAccount invalidSettings](self, "invalidSettings") == 0;

  return v4;
}

- (BOOL)validLogin
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;

  -[IMAccount service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D36240]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  if (v6)
  {
    -[IMAccount login](self, "login");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount canonicalFormOfID:](self, "canonicalFormOfID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMAccount service](self, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serviceProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D36248]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "intValue"))
    {
      if (objc_msgSend(v8, "rangeOfString:", CFSTR("@")) == 0x7FFFFFFFFFFFFFFFLL)
      {

LABEL_9:
        v12 = 0;
        goto LABEL_10;
      }
      v13 = objc_msgSend(v8, "rangeOfString:", CFSTR("@"));

      if (!v13)
        goto LABEL_9;
    }
    else
    {

    }
    v12 = objc_msgSend(v8, "length") != 0;
LABEL_10:

    return v12;
  }
  return 1;
}

- (BOOL)validPort
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[IMAccount service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D36288]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[IMAccount port](self, "port") < 1 || -[IMAccount port](self, "port") >= 0xFFFF)
    v6 = objc_msgSend(v5, "BOOLValue") ^ 1;
  else
    LOBYTE(v6) = 1;

  return v6;
}

- (BOOL)validServer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  -[IMAccount service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D36280]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMAccount server](self, "server");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "length") > 2
    || -[IMAccount BOOLForKey:](self, "BOOLForKey:", *MEMORY[0x1E0D36E98]))
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    v7 = objc_msgSend(v5, "BOOLValue") ^ 1;
  }

  return v7;
}

- (BOOL)isManaged
{
  return -[IMAccount BOOLForKey:](self, "BOOLForKey:", *MEMORY[0x1E0D36F08]);
}

- (int64_t)invalidSettings
{
  if (!-[IMAccount validLogin](self, "validLogin"))
    return 1;
  if (-[IMAccount BOOLForKey:](self, "BOOLForKey:", *MEMORY[0x1E0D36E98]))
    return 0;
  if (!-[IMAccount validServer](self, "validServer"))
    return 2;
  if (-[IMAccount validPort](self, "validPort"))
    return 0;
  return 3;
}

- (void)requestProperty:(id)a3 ofIMHandle:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestProperty:ofPerson:account:", v7, v6, self->_uniqueID);

}

- (void)setValue:(id)a3 ofExtraProperty:(id)a4 ofIMHandle:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:ofProperty:ofPerson:account:", v10, v9, v8, self->_uniqueID);

}

- (NSDictionary)dictionary
{
  id v3;
  void *v4;
  void *v5;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (id)-[NSDictionary mutableCopy](self->_data, "mutableCopy");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  if (!v3)
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[NSMutableDictionary count](self->_dataChanges, "count"))
    objc_msgSend(v3, "addEntriesFromDictionary:", self->_dataChanges);
  -[IMAccount accountPreferences](self, "accountPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("AccountPrefs"));

  -[IMAccount profileInfo](self, "profileInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, *MEMORY[0x1E0D36F20]);

  return (NSDictionary *)v3;
}

- (NSArray)emailDomains
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  objc_msgSend(WeakRetained, "emailDomains");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setCachedAllowList:(id)a3
{
  NSArray *v4;
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)a3;
  if ((-[NSArray count](self->_cachedAllowList, "count") || -[NSArray count](v4, "count"))
    && self->_cachedAllowList != v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v4;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          -[IMAccount canonicalFormOfID:](self, "canonicalFormOfID:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v10);

        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    objc_storeStrong((id *)&self->_cachedAllowList, v5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "__mainThreadPostNotificationName:object:", CFSTR("__kIMAccountPrivacySettingsChangedNotification"), self);

  }
}

- (void)setCachedBlockList:(id)a3
{
  NSArray *v4;
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)a3;
  if ((-[NSArray count](self->_cachedBlockList, "count") || -[NSArray count](v4, "count"))
    && self->_cachedBlockList != v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v4;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          -[IMAccount canonicalFormOfID:](self, "canonicalFormOfID:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v10);

        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    objc_storeStrong((id *)&self->_cachedBlockList, v5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "__mainThreadPostNotificationName:object:", CFSTR("__kIMAccountPrivacySettingsChangedNotification"), self);

  }
}

- (void)setCachedBlockingMode:(unsigned int)a3
{
  id v4;

  if (self->_cachedBlockingMode != a3)
  {
    self->_cachedBlockingMode = a3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "__mainThreadPostNotificationName:object:", CFSTR("__kIMAccountPrivacySettingsChangedNotification"), self);

  }
}

- (void)setCachedBlockIdleStatus:(BOOL)a3
{
  id v4;

  if (self->_blockIdleStatus != a3)
  {
    self->_blockIdleStatus = a3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "__mainThreadPostNotificationName:object:", CFSTR("__kIMAccountPrivacySettingsChangedNotification"), self);

  }
}

- (void)blockMessages:(BOOL)a3 fromID:(id)a4
{
  _BOOL4 v4;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  IMAccount *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  -[IMAccount canonicalFormOfID:](self, "canonicalFormOfID:", a4);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[IMAccount blockingMode](self, "blockingMode");
  -[IMAccount blockList](self, "blockList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAccount allowList](self, "allowList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v4)
  {
    if (v6 <= 1)
    {
      if ((objc_msgSend(v7, "containsObject:", v15) & 1) == 0)
      {
        if (!v7)
        {
          objc_msgSend(MEMORY[0x1E0C99D20], "array");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v7, "arrayByAddingObject:", v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMAccount setBlockList:](self, "setBlockList:", v10);

      }
      v11 = self;
      v12 = 3;
LABEL_8:
      -[IMAccount setBlockingMode:](v11, "setBlockingMode:", v12);
      goto LABEL_33;
    }
    if (v6 != 3)
    {
      if (v6 == 2 && objc_msgSend(v8, "containsObject:", v15))
      {
        v13 = (void *)objc_msgSend(v9, "mutableCopy");
        objc_msgSend(v13, "removeObject:", v15);
LABEL_21:
        -[IMAccount setAllowList:](self, "setAllowList:", v13);
LABEL_32:

        goto LABEL_33;
      }
      goto LABEL_33;
    }
    if ((objc_msgSend(v7, "containsObject:", v15) & 1) != 0)
      goto LABEL_33;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "arrayByAddingObject:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:
    -[IMAccount setBlockList:](self, "setBlockList:", v13);
    goto LABEL_32;
  }
  if (v6 < 2)
    goto LABEL_33;
  if (v6 == 4)
  {
    if ((objc_msgSend(v8, "containsObject:", v15) & 1) == 0)
    {
      IMSingleObjectArray();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMAccount setAllowList:](self, "setAllowList:", v14);

    }
    v11 = self;
    v12 = 2;
    goto LABEL_8;
  }
  if (v6 == 3)
  {
    if (!objc_msgSend(v7, "containsObject:", v15))
      goto LABEL_33;
    v13 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v13, "removeObject:", v15);
    goto LABEL_31;
  }
  if (v6 == 2 && (objc_msgSend(v8, "containsObject:", v15) & 1) == 0)
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "arrayByAddingObject:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
LABEL_33:

}

- (void)setBlockList:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBlockList:account:", v5, self->_uniqueID);

  -[IMAccount setCachedBlockList:](self, "setCachedBlockList:", v5);
}

- (NSArray)blockList
{
  NSArray *cachedBlockList;

  cachedBlockList = self->_cachedBlockList;
  if (cachedBlockList)
    return cachedBlockList;
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setAllowList:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowList:account:", v5, self->_uniqueID);

  -[IMAccount setCachedAllowList:](self, "setCachedAllowList:", v5);
}

- (NSArray)allowList
{
  NSArray *cachedAllowList;

  cachedAllowList = self->_cachedAllowList;
  if (cachedAllowList)
    return cachedAllowList;
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (unsigned)blockingMode
{
  return self->_cachedBlockingMode;
}

- (void)setBlockingMode:(unsigned int)a3
{
  uint64_t v3;
  void *v5;

  v3 = *(_QWORD *)&a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBlockingMode:account:", v3, self->_uniqueID);

  MEMORY[0x1E0DE7D20](self, sel_setCachedBlockingMode_);
}

- (void)setBlockIdleStatus:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBlockIdleStatus:account:", v3, self->_uniqueID);

  MEMORY[0x1E0DE7D20](self, sel_setCachedBlockIdleStatus_);
}

- (BOOL)blockOtherAddresses
{
  return -[IMAccount BOOLForKey:](self, "BOOLForKey:", *MEMORY[0x1E0D36EA8]);
}

- (void)setBlockOtherAddresses:(BOOL)a3
{
  -[IMAccount _setBool:forKey:](self, "_setBool:forKey:", a3, *MEMORY[0x1E0D36EA8]);
  -[IMAccount writeSettings](self, "writeSettings");
}

- (void)clearTargetState
{
  NSArray *targetGroupState;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_targetGroupStateTimeout, 0);
  targetGroupState = self->_targetGroupState;
  self->_targetGroupState = 0;

}

- (BOOL)isAwaitingTargetGroupState
{
  return self->_targetGroupState != 0;
}

+ (id)_groupSummaryFromGroupList:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    v8 = *MEMORY[0x1E0D36C88];
    v9 = *MEMORY[0x1E0D36C80];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKey:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v15 = v14;
        if (v12)
          objc_msgSend(v14, "setObject:forKey:", v12, v8);
        if (objc_msgSend(v13, "count"))
          objc_msgSend(v15, "setObject:forKey:", v13, v9);
        objc_msgSend(v4, "addObject:", v15);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  return v4;
}

- (BOOL)hasTargetGroupStateBeenMet
{
  void *v3;
  void *v4;
  char v5;

  +[IMAccount _groupSummaryFromGroupList:](IMAccount, "_groupSummaryFromGroupList:", self->_lastReceivedGroupState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMAccount _groupSummaryFromGroupList:](IMAccount, "_groupSummaryFromGroupList:", self->_targetGroupState);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToArray:", v4);

  return v5;
}

- (void)targetGroupStateTimeout
{
  BOOL v3;

  v3 = -[IMAccount hasTargetGroupStateBeenMet](self, "hasTargetGroupStateBeenMet");
  -[IMAccount clearTargetState](self, "clearTargetState");
  if (!v3)
    -[IMAccount groupsChanged:error:](self, "groupsChanged:error:", self->_lastReceivedGroupState, 0);
}

- (void)setWaitForTargetState
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_targetGroupStateTimeout, 0);
  -[IMAccount performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_targetGroupStateTimeout, 0, 120.0);
}

- (void)updateWithTargetGroups
{
  -[IMAccount groupsChanged:error:](self, "groupsChanged:error:", self->_targetGroupState, 0);
}

- (void)setTargetGroupsState:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_targetGroupState != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_targetGroupState, a3);
    if (self->_targetGroupState)
      -[IMAccount setWaitForTargetState](self, "setWaitForTargetState");
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_updateWithTargetGroups, 0);
    -[IMAccount performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_updateWithTargetGroups, 0, 0.0);
    v5 = v6;
  }

}

- (void)_applyChangesToTemporaryCache:(id)a3
{
  id v4;
  NSArray *targetGroupState;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  char *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  unint64_t v28;
  id v29;
  id v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  void *v54;
  void *v55;
  int v56;
  id v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *m;
  void *v63;
  void *v64;
  BOOL v65;
  uint64_t v66;
  void *v67;
  void *v68;
  char v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  uint64_t v75;
  id v76;
  void *v77;
  unint64_t v78;
  void *v79;
  void *v80;
  int v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t n;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t ii;
  uint64_t v97;
  id v98;
  void *v99;
  id v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t jj;
  void *v109;
  void *v110;
  int v111;
  id v112;
  IMAccount *v113;
  void *v114;
  void *v115;
  id v116;
  uint64_t v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  char *v125;
  id v126;
  id v127;
  id v128;
  id v129;
  uint64_t v130;
  uint64_t v131;
  id v132;
  void *v133;
  uint64_t v134;
  char *v135;
  id v136;
  id v137;
  id v138;
  char *v139;
  void *v140;
  void *v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  id v145;
  void *v146;
  uint64_t v147;
  void *v148;
  id obj;
  id obja;
  char *objb;
  id objc;
  id objd;
  char *obje;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  _BYTE v191[128];
  _BYTE v192[128];
  _BYTE v193[128];
  _BYTE v194[128];
  _BYTE v195[128];
  _BYTE v196[128];
  _BYTE v197[128];
  _BYTE v198[128];
  _BYTE v199[128];
  uint64_t v200;

  v200 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  targetGroupState = self->_targetGroupState;
  if (!targetGroupState)
    targetGroupState = self->_groups;
  v6 = (id)-[NSArray mutableCopy](targetGroupState, "mutableCopy");
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D36C90]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = self;
  -[IMAccount clearTargetState](self, "clearTargetState");
  v116 = v4;
  v121 = v7;
  if (objc_msgSend(v7, "count"))
  {
    v145 = (id)objc_msgSend(v6, "mutableCopy");
    v187 = 0u;
    v188 = 0u;
    v189 = 0u;
    v190 = 0u;
    objc_msgSend(v7, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v187, v199, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v188;
      v11 = *MEMORY[0x1E0D36C88];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v188 != v10)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v187 + 1) + 8 * i);
          if (objc_msgSend(v6, "count"))
          {
            v14 = 0;
            while (1)
            {
              objc_msgSend(v6, "objectAtIndex:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "objectForKey:", v11);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "isEqualToString:", v13);

              if (v17)
                break;

              if (++v14 >= (unint64_t)objc_msgSend(v6, "count"))
                goto LABEL_15;
            }
            v18 = (void *)objc_msgSend(v15, "mutableCopy");
            objc_msgSend(v121, "objectForKey:", v13);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setObject:forKey:", v19, v11);

            objc_msgSend(v145, "replaceObjectAtIndex:withObject:", v14, v18);
          }
LABEL_15:
          ;
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v187, v199, 16);
      }
      while (v9);
    }

    if (v145 != v6)
    {
      v20 = v145;

      v6 = v20;
    }
    v4 = v116;
    v7 = v121;

  }
  v123 = *MEMORY[0x1E0D36C00];
  objc_msgSend(v4, "objectForKey:");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = (char *)objc_msgSend(v119, "count");
  if (!v125)
    goto LABEL_59;
  if (objc_msgSend(v6, "count"))
    v21 = (id)objc_msgSend(v6, "mutableCopy");
  else
    v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = v21;

  v23 = 0;
  v24 = *MEMORY[0x1E0D36C88];
  v130 = *MEMORY[0x1E0D36C80];
  v140 = v6;
  do
  {
    objc_msgSend(v119, "objectAtIndex:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = v25;
      v27 = 0;
    }
    else
    {
      objc_msgSend(v25, "objectForKey:", v24);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKey:", v130);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v146 = v25;
    obja = v27;
    if (objc_msgSend(v6, "count"))
    {
      v28 = 0;
      v29 = 0;
      do
      {
        objc_msgSend(v6, "objectAtIndex:", v28);
        v30 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKey:", v24);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isEqualToString:", v26);

        if (v32)
        {
          if (v29 != v30)
          {
            v33 = objc_msgSend(v30, "mutableCopy");

            v29 = (id)v33;
          }
          objc_msgSend(v22, "replaceObjectAtIndex:withObject:", v28, v29);
        }

        ++v28;
      }
      while (v28 < objc_msgSend(v6, "count"));
      if (v26)
      {
        v27 = obja;
        if (!v29)
        {
LABEL_39:
          v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v22, "addObject:", v29);
        }
        v135 = v23;
        objc_msgSend(v29, "setObject:forKey:", v26, v24);
        objc_msgSend(v29, "objectForKey:", v130);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (id)objc_msgSend(v34, "mutableCopy");

        if (!v35)
          v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v29, "setObject:forKey:", v35, v130);
        v185 = 0u;
        v186 = 0u;
        v183 = 0u;
        v184 = 0u;
        v36 = v27;
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v183, v198, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v184;
          do
          {
            for (j = 0; j != v38; ++j)
            {
              if (*(_QWORD *)v184 != v39)
                objc_enumerationMutation(v36);
              v41 = *(_QWORD *)(*((_QWORD *)&v183 + 1) + 8 * j);
              if ((objc_msgSend(v35, "containsObject:", v41) & 1) == 0)
                objc_msgSend(v35, "addObject:", v41);
            }
            v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v183, v198, 16);
          }
          while (v38);
        }

        v23 = v135;
        v6 = v140;
      }
      v27 = obja;
      goto LABEL_53;
    }
    if (v26)
      goto LABEL_39;
    v29 = 0;
LABEL_53:

    ++v23;
    v7 = v121;
  }
  while (v23 != v125);
  if (v22 != v6)
  {
    v42 = v22;

    v6 = v42;
  }

  v4 = v116;
LABEL_59:
  v122 = *MEMORY[0x1E0D36E30];
  objc_msgSend(v4, "objectForKey:");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = v43;
  if (objc_msgSend(v43, "count"))
  {
    v141 = v6;
    v44 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0C99DE8], "nonRetainingArray");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v179 = 0u;
    v180 = 0u;
    v181 = 0u;
    v182 = 0u;
    v126 = v43;
    v147 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v179, v197, 16);
    if (v147)
    {
      v131 = *(_QWORD *)v180;
      v46 = *MEMORY[0x1E0D36C88];
      v136 = v44;
      do
      {
        v47 = 0;
        do
        {
          if (*(_QWORD *)v180 != v131)
            objc_enumerationMutation(v126);
          objb = v47;
          v48 = *(_QWORD *)(*((_QWORD *)&v179 + 1) + 8 * (_QWORD)v47);
          v175 = 0u;
          v176 = 0u;
          v177 = 0u;
          v178 = 0u;
          v49 = v44;
          v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v175, v196, 16);
          if (v50)
          {
            v51 = v50;
            v52 = *(_QWORD *)v176;
            do
            {
              for (k = 0; k != v51; ++k)
              {
                if (*(_QWORD *)v176 != v52)
                  objc_enumerationMutation(v49);
                v54 = *(void **)(*((_QWORD *)&v175 + 1) + 8 * k);
                objc_msgSend(v54, "objectForKey:", v46);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                v56 = objc_msgSend(v55, "isEqualToString:", v48);

                if (v56)
                  objc_msgSend(v45, "addObject:", v54);
              }
              v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v175, v196, 16);
            }
            while (v51);
          }

          v47 = objb + 1;
          v44 = v136;
        }
        while (objb + 1 != (char *)v147);
        v147 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v179, v197, 16);
      }
      while (v147);
    }

    v6 = v141;
    if (v141 != v44)
    {
      v57 = v44;

      v6 = v57;
    }
    v43 = v115;
    v4 = v116;
    v7 = v121;

  }
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D36E38]);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "objectForKey:", *MEMORY[0x1E0D36C10]);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = v58;
  if (objc_msgSend(v58, "count"))
  {
    v132 = (id)objc_msgSend(v6, "mutableCopy");
    v59 = objc_msgSend(v132, "count");
    v171 = 0u;
    v172 = 0u;
    v173 = 0u;
    v174 = 0u;
    objc_msgSend(v58, "allKeys");
    v137 = (id)objc_claimAutoreleasedReturnValue();
    objc = (id)objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v171, v195, 16);
    if (objc)
    {
      v60 = v58;
      v142 = *(_QWORD *)v172;
      v61 = *MEMORY[0x1E0D36C88];
      v127 = (id)*MEMORY[0x1E0D36C80];
      do
      {
        for (m = 0; m != objc; m = (char *)m + 1)
        {
          if (*(_QWORD *)v172 != v142)
            objc_enumerationMutation(v137);
          v63 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * (_QWORD)m);
          objc_msgSend(v60, "objectForKey:", v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          if (v64)
            v65 = v59 == 0;
          else
            v65 = 1;
          if (!v65)
          {
            v66 = 0;
            while (1)
            {
              objc_msgSend(v6, "objectAtIndex:", v66);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "objectForKey:", v61);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              v69 = objc_msgSend(v63, "isEqualToString:", v68);

              if ((v69 & 1) != 0)
                break;
              if (v59 == ++v66)
                goto LABEL_95;
            }
            if (v66 != 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(v132, "objectAtIndex:", v66);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              v71 = (void *)objc_msgSend(v70, "mutableCopy");

              objc_msgSend(v148, "objectForKey:", v63);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "setObject:forKey:", v72, v127);

              objc_msgSend(v132, "replaceObjectAtIndex:withObject:", v66, v71);
            }
          }
LABEL_95:

          v60 = v148;
        }
        objc = (id)objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v171, v195, 16);
      }
      while (objc);
    }

    if (v6 != v132)
    {
      v73 = v132;

      v6 = v73;
    }
    v4 = v116;
    v7 = v121;

    v43 = v115;
  }
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D36C18]);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = objc_msgSend(v118, "count");
  if (v117)
  {
    v74 = (id)objc_msgSend(v6, "mutableCopy");
    v75 = 0;
    v76 = (id)*MEMORY[0x1E0D36C88];
    v143 = *MEMORY[0x1E0D36C80];
    v128 = (id)*MEMORY[0x1E0D36C88];
    v133 = v74;
    do
    {
      v120 = v75;
      objc_msgSend(v118, "objectAtIndex:");
      objd = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(objd, "objectForKey:", v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count"))
      {
        v78 = 0;
        v138 = v77;
        do
        {
          objc_msgSend(v74, "objectAtIndex:", v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "objectForKey:", v76);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = objc_msgSend(v77, "isEqualToString:", v80);

          if (v81)
          {
            v82 = (void *)objc_msgSend(v79, "mutableCopy");
            objc_msgSend(v82, "objectForKey:", v143);
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = (id)objc_msgSend(v83, "mutableCopy");

            if (!v84)
              v84 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v85 = v6;
            v169 = 0u;
            v170 = 0u;
            v167 = 0u;
            v168 = 0u;
            objc_msgSend(objd, "objectForKey:", v123);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v167, v194, 16);
            if (v87)
            {
              v88 = v87;
              v89 = *(_QWORD *)v168;
              do
              {
                for (n = 0; n != v88; ++n)
                {
                  if (*(_QWORD *)v168 != v89)
                    objc_enumerationMutation(v86);
                  v91 = *(_QWORD *)(*((_QWORD *)&v167 + 1) + 8 * n);
                  if ((objc_msgSend(v84, "containsObject:", v91) & 1) == 0)
                    objc_msgSend(v84, "addObject:", v91);
                }
                v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v167, v194, 16);
              }
              while (v88);
            }

            v165 = 0u;
            v166 = 0u;
            v163 = 0u;
            v164 = 0u;
            objc_msgSend(objd, "objectForKey:", v122);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v163, v193, 16);
            if (v93)
            {
              v94 = v93;
              v95 = *(_QWORD *)v164;
              do
              {
                for (ii = 0; ii != v94; ++ii)
                {
                  if (*(_QWORD *)v164 != v95)
                    objc_enumerationMutation(v92);
                  v97 = *(_QWORD *)(*((_QWORD *)&v163 + 1) + 8 * ii);
                  if (objc_msgSend(v84, "containsObject:", v97))
                    objc_msgSend(v84, "removeObject:", v97);
                }
                v94 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v163, v193, 16);
              }
              while (v94);
            }

            objc_msgSend(v82, "setObject:forKey:", v84, v143);
            v74 = v133;
            objc_msgSend(v133, "replaceObjectAtIndex:withObject:", v78, v82);

            v6 = v85;
            v76 = v128;
            v77 = v138;
          }

          ++v78;
        }
        while (v78 < objc_msgSend(v6, "count"));
      }

      v75 = v120 + 1;
    }
    while (v120 + 1 != v117);
    if (v6 != v74)
    {
      v98 = v74;

      v6 = v98;
      v74 = v133;
    }
    v7 = v121;
    v43 = v115;

    v4 = v116;
  }
  objc_msgSend(v114, "objectForKey:", *MEMORY[0x1E0D36CA0]);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v99, "count"))
  {
    v100 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v159 = 0u;
    v160 = 0u;
    v161 = 0u;
    v162 = 0u;
    v124 = v99;
    v129 = v99;
    v139 = (char *)objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v159, v192, 16);
    if (v139)
    {
      v134 = *(_QWORD *)v160;
      v101 = *MEMORY[0x1E0D36C88];
      v144 = v6;
      do
      {
        v102 = 0;
        do
        {
          if (*(_QWORD *)v160 != v134)
            objc_enumerationMutation(v129);
          obje = v102;
          v103 = *(_QWORD *)(*((_QWORD *)&v159 + 1) + 8 * (_QWORD)v102);
          v155 = 0u;
          v156 = 0u;
          v157 = 0u;
          v158 = 0u;
          v104 = v6;
          v105 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v155, v191, 16);
          if (v105)
          {
            v106 = v105;
            v107 = *(_QWORD *)v156;
            do
            {
              for (jj = 0; jj != v106; ++jj)
              {
                if (*(_QWORD *)v156 != v107)
                  objc_enumerationMutation(v104);
                v109 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * jj);
                objc_msgSend(v109, "objectForKey:", v101);
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                v111 = objc_msgSend(v110, "isEqualToString:", v103);

                if (v111)
                  objc_msgSend(v100, "addObject:", v109);
              }
              v106 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v155, v191, 16);
            }
            while (v106);
          }

          v102 = obje + 1;
          v6 = v144;
        }
        while (obje + 1 != v139);
        v139 = (char *)objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v159, v192, 16);
      }
      while (v139);
    }

    if (v6 != v100)
    {
      v112 = v100;

      v6 = v112;
    }
    v43 = v115;
    v4 = v116;
    v7 = v121;
    v99 = v124;

  }
  -[IMAccount setTargetGroupsState:](v113, "setTargetGroupsState:", v6);

}

- (void)beginChanges
{
  NSMutableDictionary *v3;
  NSMutableDictionary *coalescedChanges;

  if (!-[IMAccount makingChanges](self, "makingChanges"))
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    coalescedChanges = self->_coalescedChanges;
    self->_coalescedChanges = v3;

  }
  ++self->_coalesceCount;
}

- (BOOL)hasSyncedWithRemoteBuddies
{
  return self->_hasReceivedSync;
}

- (void)_markHasSyncedWithRemoteBuddies
{
  self->_hasReceivedSync = 1;
}

- (void)_ensureGroupsExists:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
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
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        -[IMAccount groupList](self, "groupList");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "containsObject:", v9);

        if ((v11 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMAccount changeBuddyList:add:groups:atLocation:](self, "changeBuddyList:add:groups:atLocation:", 0, 1, v12, -1);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (BOOL)addPeople:(id)a3 toGroups:(id)a4 atLocation:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t i;
  void *v18;
  void *v19;
  char v20;
  int64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[IMAccount _ensureGroupsExists:](self, "_ensureGroupsExists:", v9);
  if ((a5 & 0x8000000000000000) == 0)
    goto LABEL_2;
  v12 = -[IMAccount hasCapability:](self, "hasCapability:", 0x10000000);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = v8;
  v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v13)
    goto LABEL_3;
  v14 = v13;
  v21 = a5;
  v22 = v8;
  v15 = *(_QWORD *)v24;
  v16 = 1;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v24 != v15)
        objc_enumerationMutation(v10);
      v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      if (v12 && objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "authRequestStatus"))
        -[IMAccount requestBuddyListAuthorizationFromIMHandle:](self, "requestBuddyListAuthorizationFromIMHandle:", v18);
      if (objc_msgSend(v18, "isBuddy", v21, v22, (_QWORD)v23))
      {
        objc_msgSend(v18, "groups");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v9, "isSubsetOfSet:", v19);

      }
      else
      {
        v20 = 0;
      }
      v16 &= v20;
    }
    v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  }
  while (v14);

  LODWORD(a5) = v21;
  v8 = v22;
  if ((v16 & 1) == 0)
  {
LABEL_2:
    objc_msgSend(v8, "arrayByApplyingSelector:", &sel_ID);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[IMAccount changeBuddyList:add:groups:atLocation:](self, "changeBuddyList:add:groups:atLocation:", v10, 1, v9, (int)a5);
LABEL_3:

  }
  return 1;
}

- (BOOL)removePeople:(id)a3 fromGroups:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a3, "arrayByApplyingSelector:", &sel_ID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAccount changeBuddyList:add:groups:atLocation:](self, "changeBuddyList:add:groups:atLocation:", v7, 0, v6, 0);

  return 1;
}

- (BOOL)addIMHandle:(id)a3 toGroups:(id)a4 atLocation:(int64_t)a5
{
  id v7;
  void *v8;

  v7 = a4;
  IMSingleObjectArray();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[IMAccount addPeople:toGroups:atLocation:](self, "addPeople:toGroups:atLocation:", v8, v7, a5);

  return a5;
}

- (BOOL)removeIMHandle:(id)a3 fromGroups:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "ID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  IMSingleObjectArray();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAccount changeBuddyList:add:groups:atLocation:](self, "changeBuddyList:add:groups:atLocation:", v8, 0, v6, 0);

  return 1;
}

- (void)addBuddyToBuddyList:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[IMAccount groupList](self, "groupList");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[IMAccount groupList](self, "groupList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      IMSingleObjectArray();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0C99E60];
      -[IMAccount groupList](self, "groupList");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "__imFirstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setWithObject:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMAccount addPeople:toGroups:atLocation:](self, "addPeople:toGroups:atLocation:", v8, v12, 0);

    }
  }

}

- (void)changeBuddyList:(id)a3 add:(BOOL)a4 groups:(id)a5 atLocation:(int64_t)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  id *v16;
  id v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  void *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t *v39;
  NSUInteger v40;
  NSUInteger v41;
  uint64_t v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t k;
  uint64_t v71;
  void *v72;
  char v73;
  unint64_t v74;
  int v75;
  void *v76;
  char v77;
  void *v78;
  id v79;
  void *v80;
  IMAccount *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  void *v88;
  uint64_t v89;
  _BOOL4 v90;
  _BOOL4 v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  uint64_t v113;

  v8 = a4;
  v113 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  -[IMAccount beginChanges](self, "beginChanges");
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v12;
  if (objc_msgSend(v10, "count"))
  {
    v79 = v11;
    v92 = objc_msgSend(v12, "count");
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v87 = (id)objc_claimAutoreleasedReturnValue();
    v13 = a6 >= 0 && v8;
    v90 = v13;
    v91 = v8;
    if (v13)
    {
      v14 = *MEMORY[0x1E0D36E38];
      -[NSMutableDictionary objectForKey:](self->_coalescedChanges, "objectForKey:", *MEMORY[0x1E0D36E38]);
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v15 = objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](self->_coalescedChanges, "setObject:forKey:", v15, v14);
      }
    }
    else
    {
      v15 = 0;
    }
    v83 = (void *)v15;
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
    v31 = objc_msgSend(v10, "count");
    if (v31 >= 1)
    {
      v32 = 0;
      if (v31 <= 1uLL)
        v33 = 1;
      else
        v33 = v31;
      do
      {
        -[IMAccount service](self, "service");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndex:", v32);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "canonicalFormOfID:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addObject:", v36);

        ++v32;
      }
      while (v33 != v32);
    }
    v93 = v30;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v30);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v83;
    v12 = v84;
    if (v92)
    {
      v38 = 0;
      v96 = *MEMORY[0x1E0D36C88];
      v89 = *MEMORY[0x1E0D36C80];
      v39 = (uint64_t *)MEMORY[0x1E0D36C00];
      if (!v91)
        v39 = (uint64_t *)MEMORY[0x1E0D36E30];
      v85 = *MEMORY[0x1E0D36C10];
      v86 = *v39;
      v81 = self;
      do
      {
        v94 = v38;
        objc_msgSend(v12, "objectAtIndex:");
        v97 = objc_claimAutoreleasedReturnValue();
        v40 = -[NSArray count](self->_groups, "count");
        if (v40)
        {
          v41 = v40;
          v42 = 0;
          while (1)
          {
            -[NSArray objectAtIndex:](self->_groups, "objectAtIndex:", v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "objectForKey:", v96);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v44, "isEqualToString:", v97);

            if ((v45 & 1) != 0)
              break;

            if (v41 == ++v42)
              goto LABEL_40;
          }
        }
        else
        {
LABEL_40:
          v43 = 0;
        }
        objc_msgSend(v43, "objectForKey:", v89);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (v46)
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v46);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v95 = 0;
        }
        v47 = (void *)v97;
        if (!v91 || (objc_msgSend(v82, "isSubsetOfSet:", v95) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v97, v96, v93, v86, 0);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "addObject:", v48);

        }
        if (v90)
        {
          v88 = v46;
          if (v43)
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v46);
          else
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = 0u;
          v109 = 0u;
          v106 = 0u;
          v107 = 0u;
          v50 = v93;
          v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v106, v112, 16);
          if (v51)
          {
            v52 = v51;
            v53 = *(_QWORD *)v107;
            do
            {
              for (i = 0; i != v52; ++i)
              {
                if (*(_QWORD *)v107 != v53)
                  objc_enumerationMutation(v50);
                v55 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * i);
                v56 = objc_msgSend(v49, "indexOfObject:", v55);
                if (v56 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  v57 = v56;
                  objc_msgSend(v49, "removeObjectAtIndex:", v56);
                  a6 = (__PAIR128__(a6, v57) - (unint64_t)a6) >> 64;
                }
                if (a6 > (unint64_t)objc_msgSend(v49, "count"))
                  a6 = (int)objc_msgSend(v49, "count");
                objc_msgSend(v49, "insertObject:atIndex:", v55, a6++);
              }
              v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v106, v112, 16);
            }
            while (v52);
          }

          v37 = v83;
          objc_msgSend(v83, "objectForKey:", v85);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v58)
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "setObject:forKey:", v58, v85);
          }
          v47 = (void *)v97;
          objc_msgSend(v58, "setObject:forKey:", v49, v97);

          self = v81;
          v12 = v84;
          v46 = v88;
        }

        v38 = v94 + 1;
      }
      while (v94 + 1 != v92);
    }
    v22 = v93;
    if (objc_msgSend(v87, "count"))
    {
      v59 = *MEMORY[0x1E0D36C18];
      -[NSMutableDictionary objectForKey:](self->_coalescedChanges, "objectForKey:", *MEMORY[0x1E0D36C18]);
      v60 = (id)objc_claimAutoreleasedReturnValue();
      if (!v60)
      {
        v60 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        -[NSMutableDictionary setObject:forKey:](self->_coalescedChanges, "setObject:forKey:", v60, v59);
      }
      objc_msgSend(v60, "addObjectsFromArray:", v87);

    }
    v11 = v79;
    goto LABEL_91;
  }
  if (objc_msgSend(v11, "count"))
  {
    v80 = v11;
    v16 = (id *)MEMORY[0x1E0D36C00];
    if (!v8)
      v16 = (id *)MEMORY[0x1E0D36E30];
    v87 = *v16;
    -[NSMutableDictionary objectForKey:](self->_coalescedChanges, "objectForKey:");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = v8;
    if (!v17)
    {
      v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[NSMutableDictionary setObject:forKey:](self->_coalescedChanges, "setObject:forKey:", v17, v87);
    }
    objc_msgSend(v17, "addObjectsFromArray:", v12);
    -[IMAccount groupList](self, "groupList");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "mutableCopy");

    v21 = v17;
    v22 = v20;
    if (!v18)
    {
      objc_msgSend(v20, "removeObjectsInArray:", v12);
      goto LABEL_88;
    }
    v23 = objc_msgSend(v20, "count");
    if ((a6 & 0x8000000000000000) == 0)
    {
      if (v23 <= a6)
        goto LABEL_88;
      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      v24 = v80;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v102, v111, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v103;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v103 != v27)
              objc_enumerationMutation(v24);
            v29 = *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * j);
            if (objc_msgSend(v22, "containsObject:", v29))
              objc_msgSend(v22, "insertObject:atIndex:", v29, a6);
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v102, v111, 16);
        }
        while (v26);
      }
      goto LABEL_87;
    }
    if (!v23)
      goto LABEL_78;
    v61 = 0;
    v62 = *MEMORY[0x1E0D36C98];
    while (1)
    {
      objc_msgSend(v22, "objectAtIndex:", v61);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMAccount propertiesForGroup:](self, "propertiesForGroup:", v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectForKey:", v62);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      if (v65)
      {
        v66 = v65;
        if (!objc_msgSend(v65, "intValue"))
        {

          if ((v61 & 0x80000000) == 0 && objc_msgSend(v22, "count") > (unint64_t)v61)
          {
            v12 = v84;
            if (objc_msgSend(v84, "count"))
            {
              v74 = 0;
              v75 = v61;
              do
              {
                objc_msgSend(v84, "objectAtIndex:", v74);
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                v77 = objc_msgSend(v22, "containsObject:", v76);

                if ((v77 & 1) == 0)
                {
                  objc_msgSend(v84, "objectAtIndex:", v74);
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "insertObject:atIndex:", v78, v75);

                  ++v75;
                }
                ++v74;
              }
              while (v74 < objc_msgSend(v84, "count"));
            }
LABEL_88:
            -[IMAccount groupList](self, "groupList");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = objc_msgSend(v22, "isEqualToArray:", v72);

            if ((v73 & 1) == 0)
              -[IMAccount reorderGroups:](self, "reorderGroups:", v22);
            v11 = v80;
            v37 = v21;
LABEL_91:

            break;
          }
LABEL_78:
          v100 = 0u;
          v101 = 0u;
          v98 = 0u;
          v99 = 0u;
          v24 = v84;
          v67 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v98, v110, 16);
          if (v67)
          {
            v68 = v67;
            v69 = *(_QWORD *)v99;
            do
            {
              for (k = 0; k != v68; ++k)
              {
                if (*(_QWORD *)v99 != v69)
                  objc_enumerationMutation(v24);
                v71 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * k);
                if ((objc_msgSend(v22, "containsObject:", v71) & 1) == 0)
                  objc_msgSend(v22, "addObject:", v71);
              }
              v68 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v98, v110, 16);
            }
            while (v68);
          }
LABEL_87:

          v12 = v84;
          goto LABEL_88;
        }

      }
      if (++v61 >= (unint64_t)objc_msgSend(v22, "count"))
        goto LABEL_78;
    }
  }
  -[IMAccount endChanges](self, "endChanges");

}

- (void)renameGroup:(id)a3 to:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v6 = a4;
  -[IMAccount groupList](self, "groupList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v15);

  if (v8)
  {
    -[IMAccount beginChanges](self, "beginChanges");
    -[IMAccount groupList](self, "groupList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "renameGroup:to:account:", v15, v6, self->_uniqueID);

    v12 = *MEMORY[0x1E0D36C90];
    -[NSMutableDictionary objectForKey:](self->_coalescedChanges, "objectForKey:", *MEMORY[0x1E0D36C90]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_coalescedChanges, "setObject:forKey:", v13, v12);
    }
    objc_msgSend(v13, "setObject:forKey:", v6, v15);
    v14 = objc_msgSend(v10, "indexOfObject:", v15);
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v10, "replaceObjectAtIndex:withObject:", v14, v6);
      -[IMAccount reorderGroups:](self, "reorderGroups:", v10);
    }
    -[IMAccount endChanges](self, "endChanges");

  }
}

- (void)reorderGroup:(id)a3 order:(id)a4
{
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[IMAccount groupList](self, "groupList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v13);

  if (v8)
  {
    -[IMAccount beginChanges](self, "beginChanges");
    v9 = *MEMORY[0x1E0D36E38];
    -[NSMutableDictionary objectForKey:](self->_coalescedChanges, "objectForKey:", *MEMORY[0x1E0D36E38]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_coalescedChanges, "setObject:forKey:", v10, v9);
    }
    v11 = *MEMORY[0x1E0D36C10];
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D36C10]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v12, v11);
    }
    objc_msgSend(v12, "setObject:forKey:", v6, v13);
    -[IMAccount endChanges](self, "endChanges");

  }
}

- (void)reorderGroups:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    -[IMAccount groupList](self, "groupList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "isEqualToArray:", v5);

    v4 = v9;
    if ((v6 & 1) == 0)
    {
      -[IMAccount beginChanges](self, "beginChanges");
      v7 = *MEMORY[0x1E0D36E38];
      -[NSMutableDictionary objectForKey:](self->_coalescedChanges, "objectForKey:", *MEMORY[0x1E0D36E38]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](self->_coalescedChanges, "setObject:forKey:", v8, v7);
      }
      objc_msgSend(v8, "setObject:forKey:", v9, *MEMORY[0x1E0D36CA0]);
      -[IMAccount endChanges](self, "endChanges");

      v4 = v9;
    }
  }

}

- (id)propertiesForGroup:(id)a3
{
  id v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = -[NSArray count](self->_groups, "count");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *MEMORY[0x1E0D36C88];
    while (1)
    {
      -[NSArray objectAtIndex:](self->_groups, "objectAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "length"))
      {
        if (objc_msgSend(v10, "isEqualToString:", v4))
          break;
      }

      if (v6 == ++v7)
        goto LABEL_6;
    }

  }
  else
  {
LABEL_6:
    v9 = 0;
  }

  return v9;
}

- (id)groupMembers:(id)a3
{
  void *v3;
  void *v4;

  -[IMAccount propertiesForGroup:](self, "propertiesForGroup:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D36C80]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)groupList
{
  NSUInteger v3;
  NSUInteger v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = -[NSArray count](self->_groups, "count");
  if (v3)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v7 = *MEMORY[0x1E0D36C88];
    do
    {
      -[NSArray objectAtIndex:](self->_groups, "objectAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "length"))
        objc_msgSend(v5, "addObject:", v9);

      ++v6;
    }
    while (v4 != v6);
  }
  else
  {
    v5 = 0;
  }
  return (NSArray *)v5;
}

- (id)memberGroups:(id)a3
{
  return -[NSDictionary objectForKey:](self->_members, "objectForKey:", a3);
}

- (void)endChanges
{
  int coalesceCount;
  void *v4;
  NSMutableDictionary *coalescedChanges;
  void *v7;

  coalesceCount = self->_coalesceCount;
  if (coalesceCount <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("IMAccount.m"), 2176, CFSTR("%@ Unmatched endCoalescedChanges"), self);

    coalesceCount = self->_coalesceCount;
  }
  self->_coalesceCount = coalesceCount - 1;
  if (!-[IMAccount makingChanges](self, "makingChanges"))
  {
    if (-[NSMutableDictionary count](self->_coalescedChanges, "count"))
    {
      -[IMAccount _applyChangesToTemporaryCache:](self, "_applyChangesToTemporaryCache:", self->_coalescedChanges);
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "changeGroups:account:", self->_coalescedChanges, self->_uniqueID);

    }
    coalescedChanges = self->_coalescedChanges;
    self->_coalescedChanges = 0;

  }
}

- (BOOL)makingChanges
{
  return self->_coalesceCount > 0;
}

- (void)holdBuddyUpdates
{
  int numHolding;
  void *v4;
  void *v5;

  -[IMAccount beginChanges](self, "beginChanges");
  numHolding = self->_numHolding;
  if (!numHolding)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount uniqueID](self, "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "holdBuddyUpdatesAccount:", v5);

    numHolding = self->_numHolding;
  }
  self->_numHolding = numHolding + 1;
}

- (void)_resumeBuddyUpdatesNow
{
  int numHolding;
  void *v4;
  void *v6;
  id v7;

  numHolding = self->_numHolding;
  if (numHolding <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("IMAccount.m"), 2204, CFSTR("imbalanced update: called a resume without calling a holdBuddyUpdate!"));

    numHolding = self->_numHolding;
  }
  self->_numHolding = numHolding - 1;
  -[IMAccount endChanges](self, "endChanges");
  if (!self->_numHolding)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[IMAccount uniqueID](self, "uniqueID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resumeBuddyUpdatesAccount:", v4);

  }
}

- (void)resumeBuddyUpdates
{
  MEMORY[0x1E0DE7D20](self, sel_performSelector_withObject_afterDelay_ignoreMenuTracking_);
}

- (void)buddyPropertiesChanged:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[IMAccount existingIMHandleWithInfo:](self, "existingIMHandleWithInfo:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)buddyPictureChanged:(id)a3 imageData:(id)a4 imageHash:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v11 = a4;
  v8 = a5;
  -[IMAccount existingIMHandleWithID:](self, "existingIMHandleWithID:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    v10 = v11;
  }
  else
  {

    v10 = 0;
  }
  v12 = v10;
  objc_msgSend(v9, "setCustomPictureData:key:", v10, v8);

}

- (void)setBuddyProperties:(id)a3 buddyPictures:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *context;
  void *v28;
  id v29;
  id obj;
  IMAccount *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v6 = a4;
  if (!self->_hasReceivedSync)
  {
    v32 = v6;
    self->_syncedWithRemoteBuddyList = 1;
    -[IMAccount _markHasSyncedWithRemoteBuddies](self, "_markHasSyncedWithRemoteBuddies");
    context = (void *)MEMORY[0x1A8582D94](-[IMPeople setShouldHidePeople:](self->_buddyList, "setShouldHidePeople:", 0));
    v31 = self;
    -[IMAccount arrayOfAllIMHandles](self, "arrayOfAllIMHandles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v8;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v42 != v10)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "beginNotificationQueue");
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      }
      while (v9);
    }

    objc_msgSend(v29, "allKeys");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "count"))
    {
      objc_msgSend(v29, "allValues");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMAccount buddyPropertiesChanged:](v31, "buddyPropertiesChanged:", v12);

    }
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v32, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v38 != v15)
            objc_enumerationMutation(v13);
          v17 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
          objc_msgSend(v32, "objectForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKey:", CFSTR("data"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKey:", CFSTR("key"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMAccount existingIMHandleWithID:](v31, "existingIMHandleWithID:", v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setCustomPictureData:key:", v19, v20);

        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      }
      while (v14);
    }

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v22 = obj;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v34;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v34 != v24)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * k), "releaseNotificationQueue");
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
      }
      while (v23);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "__mainThreadPostNotificationName:object:", CFSTR("__kIMAccountPropertiesAndPicturesLoadedNotification"), v31);

    objc_autoreleasePoolPop(context);
    v6 = v32;
  }

}

- (void)_registrationStatusChanged:(id)a3
{
  NSString *countryCode;

  countryCode = self->_countryCode;
  self->_countryCode = 0;

  -[IMAccount loginIfActiveRegistered](self, "loginIfActiveRegistered");
}

- (void)_serviceDidReconnect:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_hookupToDaemon);
}

- (void)_serviceDidDisconnect:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_setIMAccountLoginStatus_errorMessage_);
}

- (void)accountWillBeRemoved
{
  IMHandle *loginIMHandle;
  id v4;

  if (!self->_hasBeenRemoved)
  {
    self->_hasBeenRemoved = 1;
    loginIMHandle = self->_loginIMHandle;
    if (loginIMHandle)
    {
      -[IMHandle _stopRetainingAccount:](loginIMHandle, "_stopRetainingAccount:", self);
      +[IMMe me](IMMe, "me");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeLoginIMHandle:", self->_loginIMHandle);

    }
  }
}

- (void)accountDidDeactivate
{
  if (-[IMAccount loginStatus](self, "loginStatus") >= 2)
    MEMORY[0x1E0DE7D20](self, sel_setIMAccountLoginStatus_errorMessage_);
}

- (BOOL)isApprovedForRelay
{
  void *v2;
  char v3;

  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasRelayApprovedAccount");

  return v3;
}

- (BOOL)isRegistered
{
  return MEMORY[0x1E0DE7D20](MEMORY[0x1E0D39648], sel_isAccountRegistered_);
}

- (BOOL)canSendMessages
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  BOOL v16;
  void *v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[IMAccount _aliases](self, "_aliases");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    obj = v2;
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v3)
    {
      v4 = v3;
      v18 = v2;
      v5 = *(_QWORD *)v22;
      v6 = *MEMORY[0x1E0D35140];
      v7 = *MEMORY[0x1E0D36E60];
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v22 != v5)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v9, "objectForKey:", v6);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10 && (objc_msgSend(v10, "BOOLValue") & 1) == 0)
          {

          }
          else
          {
            objc_msgSend(v9, "objectForKey:", v7);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "lowercaseString");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "trimmedString");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = -[IMAccount _aliasIsVisible:](self, "_aliasIsVisible:", v14);

            if (v15)
            {
              v16 = 1;
              goto LABEL_16;
            }
          }
        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v4);
      v16 = 0;
LABEL_16:
      v2 = v18;
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (NSDictionary)registrationFailureAlertInfo
{
  return self->_registrationAlertInfo;
}

- (BOOL)registerAccount
{
  _BOOL4 v3;
  void *v4;
  void *v5;

  v3 = -[IMAccount supportsRegistration](self, "supportsRegistration");
  if (v3)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount uniqueID](self, "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerAccount:", v5);

  }
  return v3;
}

- (BOOL)unregisterAccount
{
  _BOOL4 v3;
  void *v4;
  void *v5;

  v3 = -[IMAccount supportsRegistration](self, "supportsRegistration");
  if (v3)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount uniqueID](self, "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unregisterAccount:", v5);

  }
  return v3;
}

+ (id)nameOfLoginStatus:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (!qword_1ECF124B8[0])
  {
    qword_1ECF124B8[0] = (uint64_t)CFSTR("Offline");

    v4 = (void *)qword_1ECF124C0;
    qword_1ECF124C0 = (uint64_t)CFSTR("Disconnected");

    v5 = (void *)qword_1ECF124C8;
    qword_1ECF124C8 = (uint64_t)CFSTR("Disconnecting...");

    v6 = (void *)qword_1ECF124D0;
    qword_1ECF124D0 = (uint64_t)CFSTR("Connecting...");

    v7 = (void *)qword_1ECF124D8;
    qword_1ECF124D8 = (uint64_t)CFSTR("Connected");

  }
  return (id)qword_1ECF124B8[a3];
}

- (void)_notJustLoggedIn
{
  void *v3;

  self->_justLoggedIn = 0;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__mainThreadPostNotificationName:object:", CFSTR("__kIMAccountNoLongerJustLoggedInNotification"), self);

}

- (NSString)loginStatusMessage
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "nameOfLoginStatus:", self->_loginStatus);
}

- (BOOL)isConnecting
{
  _BOOL4 v3;

  v3 = -[IMAccount isActive](self, "isActive");
  if (v3)
    LOBYTE(v3) = -[IMAccount loginStatus](self, "loginStatus") >= 2 && -[IMAccount loginStatus](self, "loginStatus") < 4;
  return v3;
}

- (void)_syncWithRemoteBuddies
{
  *(_WORD *)&self->_syncedWithRemoteBuddyList = 257;
}

- (void)groupsChanged:(id)a3 error:(id)a4
{
  NSArray *v7;
  NSArray *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  BOOL v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t m;
  void *v44;
  void *v45;
  void *context;
  id v47;
  id v48;
  uint64_t v49;
  NSArray *v50;
  id v51;
  uint64_t v52;
  void *v53;
  id obj;
  id obja;
  uint64_t v56;
  uint64_t v57;
  NSDictionary *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v7 = (NSArray *)a3;
  v50 = v7;
  v47 = a4;
  if (!v47)
  {
    if (!v7)
      goto LABEL_85;
LABEL_6:
    v8 = v7;
    if (self->_targetGroupState != v7)
    {
      if (self->_lastReceivedGroupState != v7)
        objc_storeStrong((id *)&self->_lastReceivedGroupState, a3);
      v8 = v7;
      if (-[IMAccount isAwaitingTargetGroupState](self, "isAwaitingTargetGroupState"))
      {
        if (!-[IMAccount hasTargetGroupStateBeenMet](self, "hasTargetGroupStateBeenMet"))
          goto LABEL_85;
        -[IMAccount clearTargetState](self, "clearTargetState");
        v8 = v7;
      }
    }
    context = (void *)MEMORY[0x1A8582D94]();
    if (self->_groups == v8 || -[NSArray isEqualToArray:](v7, "isEqualToArray:"))
    {
LABEL_84:
      -[IMAccount watchBuddiesIfNecessary](self, "watchBuddiesIfNecessary");
      objc_autoreleasePoolPop(context);
      goto LABEL_85;
    }
    -[IMAccount buddyList](self, "buddyList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "beginCoalescedChanges");

    objc_storeStrong((id *)&self->_groups, a3);
    v48 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v51 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSArray count](self->_groups, "count"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    obj = -[NSArray count](self->_groups, "count");
    if (obj)
    {
      v10 = 0;
      v52 = *MEMORY[0x1E0D36C88];
      v49 = *MEMORY[0x1E0D36C80];
      do
      {
        v57 = v10;
        -[NSArray objectAtIndex:](self->_groups, "objectAtIndex:");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v59;
        if (!v59 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v59, "objectForKey:", v52);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "objectForKey:", v49);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v14 = objc_msgSend(v13, "count");
            v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v61 = v14;
            if (v14)
            {
              for (i = 0; v61 != i; ++i)
              {
                objc_msgSend(v13, "objectAtIndex:", i);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "objectForKey:", v17);
                v18 = (id)objc_claimAutoreleasedReturnValue();
                if (v18)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    goto LABEL_26;

                }
                v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                objc_msgSend(v53, "setObject:forKey:", v18, v17);
LABEL_26:
                -[IMAccount imHandleWithID:](self, "imHandleWithID:", v17);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary objectForKey:](self->_sortOrders, "objectForKey:", v12);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if (v19)
                {
                  objc_msgSend(v15, "addObject:", v19);
                  v21 = objc_msgSend(v15, "indexOfObjectIdenticalTo:", v19);
                  if (v21 != objc_msgSend(v20, "indexOfObjectIdenticalTo:", v19))
                    objc_msgSend(v51, "addObject:", v19);
                }
                if ((objc_msgSend(v18, "containsObject:", v12) & 1) == 0)
                  objc_msgSend(v18, "addObject:", v12);

              }
            }
            objc_msgSend(v48, "setObject:forKey:", v15, v12);

          }
          v11 = v59;
        }

        v10 = v57 + 1;
      }
      while ((id)(v57 + 1) != obj);
    }
    v58 = self->_members;
    v62 = (void *)objc_msgSend(v53, "mutableCopy");
    objc_storeStrong((id *)&self->_members, v53);
    if (v58)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_39;

    }
    v58 = 0;
LABEL_39:
    if (v62)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_43:
        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        -[NSDictionary allKeys](v58, "allKeys");
        obja = (id)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
        if (v60)
        {
          v56 = *(_QWORD *)v72;
          do
          {
            for (j = 0; j != v60; ++j)
            {
              if (*(_QWORD *)v72 != v56)
                objc_enumerationMutation(obja);
              v23 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * j);
              v24 = (void *)MEMORY[0x1E0C99E60];
              -[NSDictionary objectForKey:](v58, "objectForKey:", v23);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "setWithArray:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              v27 = (void *)MEMORY[0x1E0C99E60];
              objc_msgSend(v62, "objectForKey:", v23);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "setWithArray:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v29)
              {
                objc_msgSend(MEMORY[0x1E0C99E60], "set");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v30 = objc_msgSend(v26, "count");
              v31 = objc_msgSend(v29, "count");
              -[IMAccount imHandleWithID:](self, "imHandleWithID:", v23);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v30 != 0) == (v31 == 0))
              {
                if (v30)
                  v33 = v31 == 0;
                else
                  v33 = 0;
                v34 = !v33;
                -[IMAccount imHandle:buddyStatusChanged:](self, "imHandle:buddyStatusChanged:", v32, v34);
              }
              if ((objc_msgSend(v26, "isEqualToSet:", v29) & 1) == 0
                && self->_syncedWithRemoteBuddyList
                && self->_hasReceivedSync)
              {
                objc_msgSend(v32, "postNotificationName:", CFSTR("__kIMHandleGroupsChangedNotification"));
              }
              objc_msgSend(v62, "removeObjectForKey:", v23);

            }
            v60 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
          }
          while (v60);
        }

        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        objc_msgSend(v62, "allKeys");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
        if (v36)
        {
          v37 = *(_QWORD *)v68;
          do
          {
            for (k = 0; k != v36; ++k)
            {
              if (*(_QWORD *)v68 != v37)
                objc_enumerationMutation(v35);
              -[IMAccount imHandleWithID:](self, "imHandleWithID:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * k));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              -[IMAccount imHandle:buddyStatusChanged:](self, "imHandle:buddyStatusChanged:", v39, 1);
              if (self->_syncedWithRemoteBuddyList && self->_hasReceivedSync)
                objc_msgSend(v39, "postNotificationName:", CFSTR("__kIMHandleGroupsChangedNotification"));

            }
            v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
          }
          while (v36);
        }

        objc_storeStrong((id *)&self->_sortOrders, v48);
        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        v40 = v51;
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
        if (v41)
        {
          v42 = *(_QWORD *)v64;
          do
          {
            for (m = 0; m != v41; ++m)
            {
              if (*(_QWORD *)v64 != v42)
                objc_enumerationMutation(v40);
              objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * m), "postNotificationName:", CFSTR("__kIMHandleSortOrderChangedNotification"));
            }
            v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
          }
          while (v41);
        }

        if (!self->_syncedWithRemoteBuddyList)
          -[IMAccount _syncWithRemoteBuddies](self, "_syncWithRemoteBuddies");
        -[IMAccount buddyList](self, "buddyList");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "endCoalescedChanges");

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "__mainThreadPostNotificationName:object:", CFSTR("__kIMAccountGroupsChangedNotification"), self);

        goto LABEL_84;
      }

    }
    v62 = 0;
    goto LABEL_43;
  }
  -[IMAccount clearTargetState](self, "clearTargetState");
  if (v7)
    goto LABEL_6;
  if (-[IMAccount isAwaitingTargetGroupState](self, "isAwaitingTargetGroupState"))
  {
    -[IMAccount clearTargetState](self, "clearTargetState");
    -[IMAccount groupsChanged:error:](self, "groupsChanged:error:", self->_lastReceivedGroupState, 0);
  }
LABEL_85:

}

- (int64_t)compareNames:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[IMAccount serviceName](self, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCompareToString:", v6);
  return v7;
}

- (void)_clearImageCache
{
  id smallImage;
  id accountImage;

  smallImage = self->_smallImage;
  self->_smallImage = 0;

  accountImage = self->_accountImage;
  self->_accountImage = 0;

}

- (NSArray)arrayOfAllIMHandles
{
  void *v3;
  NSMapTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (-[NSMapTable count](self->_imHandles, "count"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMapTable count](self->_imHandles, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = self->_imHandles;
    v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          -[NSMapTable objectForKey:](self->_imHandles, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8), (_QWORD)v12);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

    v10 = (void *)objc_msgSend(v3, "copy");
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock", (_QWORD)v12);
  return (NSArray *)v10;
}

- (Class)imHandleClass
{
  return (Class)objc_opt_class();
}

- (id)imHandleWithInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D36D90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[IMAccount imHandleWithID:](self, "imHandleWithID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "propertiesChanged:", v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)existingIMHandleWithInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D36D90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[IMAccount existingIMHandleWithID:](self, "existingIMHandleWithID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "propertiesChanged:", v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)imHandleWithInfo:(id)a3 alreadyCanonical:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D36D90]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[IMAccount imHandleWithID:alreadyCanonical:](self, "imHandleWithID:alreadyCanonical:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "propertiesChanged:", v6);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)existingIMHandleWithInfo:(id)a3 alreadyCanonical:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D36D90]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[IMAccount existingIMHandleWithID:alreadyCanonical:](self, "existingIMHandleWithID:alreadyCanonical:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "propertiesChanged:", v6);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)existingIMHandleWithID:(id)a3
{
  return -[IMAccount existingIMHandleWithID:alreadyCanonical:](self, "existingIMHandleWithID:alreadyCanonical:", a3, 0);
}

- (id)imHandleWithID:(id)a3 countryCode:(id)a4
{
  id v6;
  id v7;
  IMHandle *v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  char v14;
  void *v15;
  char v16;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    if (objc_msgSend(v6, "length") == 1 && (objc_msgSend(v6, "isEqualToString:", CFSTR("+")) & 1) != 0)
    {
      v8 = 0;
      v9 = v6;
    }
    else
    {
      -[IMAccount canonicalFormOfID:countryCode:](self, "canonicalFormOfID:countryCode:", v6, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isEqualToString:", v10) & 1) != 0)
      {
        v11 = 0;
      }
      else
      {
        IMCleanupPhoneNumber();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v9 = v10;

      -[IMAccount existingIMHandleWithID:alreadyCanonical:](self, "existingIMHandleWithID:alreadyCanonical:", v9, 1);
      v8 = (IMHandle *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        v8 = -[IMHandle initWithAccount:ID:alreadyCanonical:]([IMHandle alloc], "initWithAccount:ID:alreadyCanonical:", self, v9, 1);
        v12 = -[IMAccount defaultHandleCapabilities](self, "defaultHandleCapabilities");
        if (v12)
          -[IMHandle _setCapabilities:](v8, "_setCapabilities:", v12);
      }
      if (v11)
      {
        -[IMHandle originalID](v8, "originalID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v11);

        if ((v14 & 1) == 0)
        {
          objc_msgSend(v11, "trimmedString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v15, "length") < 4)
          {

          }
          else
          {
            v16 = objc_msgSend(v11, "hasPrefix:", CFSTR("+"));

            if ((v16 & 1) == 0)
            {
              -[IMHandle _updateOriginalID:](v8, "_updateOriginalID:", v11);
              -[IMHandle _setOriginalID:](v8, "_setOriginalID:", v11);
            }
          }
        }
      }

    }
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }

  return v8;
}

- (id)existingIMHandleWithID:(id)a3 countryCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSMapTable *imHandles;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  char v16;

  v6 = a3;
  v7 = a4;
  if (v6 && (objc_msgSend(v6, "isEqualToString:", CFSTR("+")) & 1) == 0)
  {
    -[IMAccount canonicalFormOfID:countryCode:](self, "canonicalFormOfID:countryCode:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", v9) & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      IMCleanupPhoneNumber();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[NSRecursiveLock lock](self->_lock, "lock");
    imHandles = self->_imHandles;
    -[IMAccount canonicalFormOfID:countryCode:](self, "canonicalFormOfID:countryCode:", v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](imHandles, "objectForKey:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSRecursiveLock unlock](self->_lock, "unlock");
    if (v10)
    {
      objc_msgSend(v8, "originalID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", v10);

      if ((v14 & 1) == 0)
      {
        objc_msgSend(v10, "trimmedString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v15, "length") < 4)
        {

        }
        else
        {
          v16 = objc_msgSend(v10, "hasPrefix:", CFSTR("+"));

          if ((v16 & 1) == 0)
          {
            objc_msgSend(v8, "_updateOriginalID:", v10);
            objc_msgSend(v8, "_setOriginalID:", v10);
          }
        }
      }
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)sortOrderForIMHandle:(id)a3 inGroup:(id)a4
{
  NSMutableDictionary *sortOrders;
  id v6;
  void *v7;
  unint64_t v8;

  sortOrders = self->_sortOrders;
  v6 = a3;
  -[NSMutableDictionary objectForKey:](sortOrders, "objectForKey:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObjectIdenticalTo:", v6);

  return v8;
}

- (void)setBuddyListAuthorization:(BOOL)a3 forIMHandle:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v6 = a4;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "acceptSubscriptionRequest:from:account:", v4, v7, self->_uniqueID);
}

- (void)requestBuddyListAuthorizationFromIMHandle:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "requestSubscriptionTo:account:", v5, self->_uniqueID);
}

- (id)handlesForCNContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "handlesForCNIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_watchBuddiesIfNecessary
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[IMAccount arrayOfAllIMHandles](self, "arrayOfAllIMHandles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v10, "watchingIMHandle", (_QWORD)v11) & 1) == 0)
          -[IMAccount startWatchingIMHandle:](self, "startWatchingIMHandle:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  self->_needToCheckForWatchedIMHandles = 0;
}

- (void)watchBuddiesIfNecessary
{
  if (-[IMAccount hasCapability:](self, "hasCapability:", 0x200000000))
  {
    if (!self->_needToCheckForWatchedIMHandles)
    {
      self->_needToCheckForWatchedIMHandles = 1;
      -[IMAccount performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__watchBuddiesIfNecessary, 0, 1.0);
    }
  }
}

- (void)startWatchingIMHandle:(id)a3
{
  void *v4;
  void *v5;
  IMHandle *v6;

  v6 = (IMHandle *)a3;
  if (-[IMAccount hasCapability:](self, "hasCapability:", 0x200000000)
    && !-[IMHandle watchingIMHandle](v6, "watchingIMHandle")
    && self->_loginIMHandle != v6)
  {
    -[IMHandle setHasTemporaryWatch:](v6, "setHasTemporaryWatch:", 1);
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMHandle ID](v6, "ID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startWatchingBuddy:account:", v5, self->_uniqueID);

  }
}

- (void)stopWatchingIMHandle:(id)a3
{
  void *v4;
  void *v5;
  IMHandle *v6;

  v6 = (IMHandle *)a3;
  if (-[IMHandle watchingIMHandle](v6, "watchingIMHandle") && self->_loginIMHandle != v6)
  {
    -[IMHandle setHasTemporaryWatch:](v6, "setHasTemporaryWatch:", 0);
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMHandle ID](v6, "ID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopWatchingBuddy:account:", v5, self->_uniqueID);

  }
}

- (void)forgetAllWatches
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[IMAccount hasCapability:](self, "hasCapability:", 0x200000000))
  {
    -[IMAccount arrayOfAllIMHandles](self, "arrayOfAllIMHandles");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setHasTemporaryWatch:", 0, (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)unregisterIMHandleWithID:(id)a3
{
  NSRecursiveLock *lock;
  id v5;

  lock = self->_lock;
  v5 = a3;
  -[NSRecursiveLock lock](lock, "lock");
  -[NSMapTable removeObjectForKey:](self->_imHandles, "removeObjectForKey:", v5);

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

+ (id)arrayOfAllIMHandles
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "arrayOfAllIMHandles");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "count"))
          objc_msgSend(v2, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v2;
}

+ (id)allBuddyListIMHandles
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "buddyList");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "people");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObjectsFromArray:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v2;
}

- (void)disconnectAllIMHandles
{
  void *v3;
  void *v4;
  NSArray *groups;
  NSDictionary *members;
  NSMutableDictionary *sortOrders;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[IMAccount login](self, "login");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAccount imHandleWithID:](self, "imHandleWithID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusChanged:message:", 1, &stru_1E4725068);

  groups = self->_groups;
  self->_groups = 0;

  members = self->_members;
  self->_members = 0;

  sortOrders = self->_sortOrders;
  self->_sortOrders = 0;

  -[IMAccount arrayOfAllIMHandles](self, "arrayOfAllIMHandles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v14);
        +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance", (_QWORD)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "clearSiblingCacheForIMHandle:", v15);

        -[IMAccount buddyList](self, "buddyList");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeIMHandle:", v15);

        objc_msgSend(v15, "statusChanged:message:", 0, &stru_1E4725068);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

}

- (void)imHandle:(id)a3 buddyStatusChanged:(BOOL)a4
{
  _BOOL4 v4;
  IMAccount *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  objc_msgSend(v8, "account");
  v6 = (IMAccount *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    -[IMAccount buddyList](self, "buddyList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isLoginIMHandle") & 1) == 0)
    {
      if (v4)
      {
        objc_msgSend(v8, "setHasTemporaryWatch:", 0);
        if (objc_msgSend(v7, "addIMHandle:", v8) && !objc_msgSend(v8, "status") && self->_hasReceivedSync)
          objc_msgSend(v8, "statusChanged:", 1);
      }
      else
      {
        objc_msgSend(v7, "removeIMHandle:", v8);
      }
      objc_msgSend(v8, "postNotificationName:", CFSTR("__kIMHandleIsBuddyStatusChangedNotification"));
    }

  }
}

- (void)handleSubscriptionRequestFrom:(id)a3 withMessage:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[IMAccount imHandleWithInfo:](self, "imHandleWithInfo:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isBuddy"))
  {
    -[IMAccount setBuddyListAuthorization:forIMHandle:](self, "setBuddyListAuthorization:forIMHandle:", 1, v6);
  }
  else if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v8, CFSTR("Message"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_postNotificationName:userInfo:", CFSTR("__kIMHandleAuthorizationRequestNotification"), v7);

  }
  else
  {
    objc_msgSend(v6, "_postNotificationName:userInfo:", CFSTR("__kIMHandleAuthorizationRequestNotification"), 0);
  }

}

- (void)nowLoggedOut
{
  -[IMAccount disconnectAllIMHandles](self, "disconnectAllIMHandles");
  -[IMAccount invalidSettings](self, "invalidSettings");
}

- (id)chatIDForRoomName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  id v13;
  void *v14;

  objc_msgSend(a3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E4725068);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("@"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "__imFirstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndex:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!objc_msgSend(v8, "length")
    || (-[IMAccount server](self, "server"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "isEqualToString:", v9),
        v9,
        v10))
  {
    -[IMAccount defaultChatSuffix](self, "defaultChatSuffix");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      v12 = v11;

      v8 = v12;
    }

  }
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@@%@"), v7, v8);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = v7;
  }
  v14 = v13;

  return v14;
}

- (id)defaultChatSuffix
{
  void *v3;

  if (-[IMAccount hasCapability:](self, "hasCapability:", 0x8000000000))
  {
    -[IMAccount objectForKey:](self, "objectForKey:", *MEMORY[0x1E0D36EC0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (_FZChatRoomValidity)validityOfChatRoomName:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  BOOL v29;
  uint64_t v30;
  BOOL v31;
  void *v32;
  uint64_t v33;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  -[IMAccount service](self, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D361C8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "intValue");

  if (v9)
    v10 = v5 < 1;
  else
    v10 = 1;
  if (!v10)
  {
    v11 = objc_msgSend(v4, "characterAtIndex:", 0);
    if ((v11 - 58) > 0xFFFFFFF5)
    {
      v27 = v11;
LABEL_30:
      v30 = 2;
      goto LABEL_36;
    }
  }
  -[IMAccount service](self, "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "serviceProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0D361B8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "intValue");

  -[IMAccount service](self, "service");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "serviceProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", *MEMORY[0x1E0D361B0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "intValue");

  -[IMAccount service](self, "service");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "serviceProperties");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKey:", *MEMORY[0x1E0D361C0]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "intValue");

  if (!(v15 | v23))
  {
LABEL_35:
    v30 = 0;
    v27 = 32;
    goto LABEL_36;
  }
  if (v5 < 1)
  {
    v25 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_32:
    if (v23)
    {
      if (v25 == 0x7FFFFFFFFFFFFFFFLL)
      {
        -[IMAccount defaultChatSuffix](self, "defaultChatSuffix");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "length");

        if (!v33)
        {
LABEL_37:
          v27 = 64;
          v30 = 3;
          goto LABEL_36;
        }
      }
    }
    goto LABEL_35;
  }
  v24 = 0;
  v25 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    v26 = objc_msgSend(v4, "characterAtIndex:", v24);
    v27 = v26;
    if (v15)
    {
      v28 = !v19 && (_DWORD)v26 == 32;
      v29 = v28;
      v30 = 1;
      v31 = (v26 - 58) >= 0xFFFFFFF6 || (v26 & 0xFFFFFFDF) - 91 >= 0xFFFFFFE6;
      if (!v31 || v29)
        break;
    }
    if (v23 && (_DWORD)v26 == 64)
    {
      v27 = 64;
      if (!v24)
        goto LABEL_30;
      v30 = 2;
      if (v25 != 0x7FFFFFFFFFFFFFFFLL)
        break;
      v25 = v24;
      if (v5 - 1 == v24)
        goto LABEL_37;
    }
    if (v5 == ++v24)
      goto LABEL_32;
  }
LABEL_36:

  return (_FZChatRoomValidity)(v30 | (v27 << 32));
}

- (NSString)authorizationToken
{
  dispatch_semaphore_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, int, int, int, int, int, id);
  void *v14;
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  if (!-[IMAccount supportsAuthorization](self, "supportsAuthorization"))
    return (NSString *)0;
  v3 = dispatch_semaphore_create(0);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1A200AD64;
  v21 = sub_1A200AC24;
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0D20C18], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAccount authorizationID](self, "authorizationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAccount login](self, "login");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAccount internalName](self, "internalName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = sub_1A2050FD8;
  v14 = &unk_1E471EEE8;
  v16 = &v17;
  v8 = v3;
  v15 = v8;
  objc_msgSend(v4, "fetchAuthTokenForProfileID:username:service:outRequestID:completionBlock:", v5, v6, v7, 0, &v11);

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (objc_msgSend((id)v18[5], "length", v11, v12, v13, v14))
    v9 = (id)v18[5];
  else
    v9 = 0;

  _Block_object_dispose(&v17, 8);
  return (NSString *)v9;
}

- (BOOL)requestNewAuthorizationCredentials
{
  return MEMORY[0x1E0DE7D20](self, sel_authenticateAccount);
}

- (BOOL)authenticateAccount
{
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = -[IMAccount supportsAuthorization](self, "supportsAuthorization");
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[IMAccount uniqueID](self, "uniqueID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_DEFAULT, "Client request to authenticate account: %@", (uint8_t *)&v9, 0xCu);

    }
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount uniqueID](self, "uniqueID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "authenticateAccount:", v7);

  }
  return v3;
}

- (void)enrollDeviceInSMSRelay:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[IMAccount uniqueID](self, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enrollDeviceForSMSRelay:account:", v4, v5);

}

- (void)unEnrollDeviceInSMSRelay:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[IMAccount uniqueID](self, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unEnrollDeviceForSMSRelay:account:", v4, v5);

}

- (void)enrollSelfDeviceInSMSRelay
{
  void *v3;
  id v4;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[IMAccount uniqueID](self, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enrollSelfDeviceForSMSRelay:", v3);

}

- (BOOL)updateAuthorizationCredentials:(id)a3 token:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[IMAccount supportsAuthorization](self, "supportsAuthorization");
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      IMGetEnvironmentName();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v17 = v6;
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_DEFAULT, "Updating token for account %@:%@ (Environment: %@)", buf, 0x20u);

    }
    if (v6)
      -[IMAccount _setObject:forKey:](self, "_setObject:forKey:", v6, *MEMORY[0x1E0D36E90]);
    else
      -[IMAccount _removeObjectForKey:](self, "_removeObjectForKey:", *MEMORY[0x1E0D36E90]);
    objc_msgSend(MEMORY[0x1E0D20C18], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount login](self, "login");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount internalName](self, "internalName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAuthTokenForProfileID:username:service:authToken:selfHandle:outRequestID:completionBlock:", v6, v12, v13, v7, 0, 0, &unk_1E471EF28);

    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateAuthorizationCredentials:token:account:", v6, v7, self->_uniqueID);

    -[IMAccount writeSettings](self, "writeSettings");
  }

  return v8;
}

- (NSString)regionID
{
  return (NSString *)-[IMAccount profileValueForKey:](self, "profileValueForKey:", CFSTR("Region"));
}

- (NSDictionary)profileInfo
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[NSDictionary count](self->_profile, "count"))
    objc_msgSend(v3, "addEntriesFromDictionary:", self->_profile);
  if (-[NSMutableDictionary count](self->_profileChanges, "count"))
    objc_msgSend(v3, "addEntriesFromDictionary:", self->_profileChanges);
  return (NSDictionary *)v3;
}

- (id)profileStringForKey:(id)a3
{
  void *v3;
  id v4;

  -[IMAccount profileValueForKey:](self, "profileValueForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (BOOL)removeProfileValueForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[IMAccount profileValueForKey:](self, "profileValueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[IMAccount setProfileValue:forKey:](self, "setProfileValue:forKey:", 0, v4);

  return v5 != 0;
}

- (BOOL)setProfileValue:(id)a3 forKey:(id)a4
{
  __CFString *v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  BOOL v11;
  void *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *profileChanges;
  const __CFString *v15;
  int v17;
  __CFString *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412546;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_DEFAULT, "Setting profile value: %@   forKey: %@", (uint8_t *)&v17, 0x16u);
    }

    -[IMAccount profileValueForKey:](self, "profileValueForKey:", v7);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v9 != v6)
    {
      if (v6)
      {
LABEL_10:
        if (!self->_profileChanges)
        {
          v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
          profileChanges = self->_profileChanges;
          self->_profileChanges = v13;

        }
        if (v6)
          v15 = v6;
        else
          v15 = &stru_1E4725068;
        -[NSMutableDictionary setObject:forKey:](self->_profileChanges, "setObject:forKey:", v15, v7);
        v11 = 1;
        goto LABEL_17;
      }
      -[NSDictionary objectForKey:](self->_profile, "objectForKey:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {

        goto LABEL_10;
      }
      -[NSMutableDictionary objectForKey:](self->_profileChanges, "objectForKey:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        goto LABEL_10;
    }
    v11 = 0;
LABEL_17:

    goto LABEL_18;
  }
  v11 = 0;
LABEL_18:

  return v11;
}

- (BOOL)setProfileString:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[IMAccount profileStringForKey:](self, "profileStringForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = (!v6 || !v8 || (objc_msgSend(v8, "isEqualToString:", v6) & 1) == 0)
       && -[IMAccount setProfileValue:forKey:](self, "setProfileValue:forKey:", v6, v7);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)validateProfile
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[IMAccount profileInfo](self, "profileInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_DEFAULT, "Requesting validation of profile info: %@", (uint8_t *)&v8, 0xCu);

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAccount uniqueID](self, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateProfileAccount:", v6);

  return 1;
}

- (NSArray)aliasesToRegister
{
  void *v2;
  void *v3;
  void *v4;

  -[IMAccount objectForKey:](self, "objectForKey:", *MEMORY[0x1E0D36FE0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)_IDSCopyOrderedAliasStrings();

  objc_msgSend(v3, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (BOOL)_aliasIsVisible:(id)a3
{
  id v4;
  int v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "hasSuffix:", CFSTR("inbox.appleid.apple.com")) & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    -[IMAccount objectForKey:](self, "objectForKey:", *MEMORY[0x1E0D35178]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsObject:", v4) ^ 1;

  }
  return v5;
}

- (id)_aliasInfoForAlias:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trimmedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[IMAccount _aliases](self, "_aliases", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    v10 = *MEMORY[0x1E0D36E60];
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKey:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lowercaseString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "trimmedString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v15, "isEqualToString:", v5) & 1) != 0)
        {
          v16 = v12;

          goto LABEL_11;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (id)_statuses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[IMAccount _aliases](self, "_aliases", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v14;
    v7 = *MEMORY[0x1E0D36E68];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (!v5)
          v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v9, "objectForKey:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v9, "objectForKey:", v7);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isMakoAccount
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[IMAccount aliasesToRegister](self, "aliasesToRegister", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (!-[IMAccount _aliasIsVisible:](self, "_aliasIsVisible:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)))
        {
          v8 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (BOOL)hasAlias:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(a3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trimmedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    -[IMAccount aliases](self, "aliases");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)hasAlias:(id)a3 type:(int64_t)a4
{
  return MEMORY[0x1E0DE7D20](self, sel_hasAlias_);
}

- (id)aliasesForType:(int64_t)a3
{
  void *v5;
  void *v6;
  _QWORD v8[6];

  -[IMAccount aliases](self, "aliases");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1A2051EB8;
  v8[3] = &unk_1E471EF70;
  v8[4] = self;
  v8[5] = a3;
  objc_msgSend(v5, "__imArrayByApplyingBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)addAlias:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  BOOL v8;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[IMAccount uniqueID](self, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v4;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_DEFAULT, "Client request to add alias: %@   account: %@", (uint8_t *)&v10, 0x16u);

  }
  if (v4)
  {
    IMSingleObjectArray();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[IMAccount addAliases:](self, "addAliases:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)addAliases:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[5];
  uint8_t v32[128];
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[IMAccount uniqueID](self, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v34 = v4;
    v35 = 2112;
    v36 = v6;
    _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_DEFAULT, "Client request to add aliases: %@   account: %@", buf, 0x16u);

  }
  if (-[IMAccount accountType](self, "accountType") == 2)
  {
    v7 = 0;
    v8 = v4;
  }
  else
  {
    v9 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = sub_1A2052334;
    v31[3] = &unk_1E471EF98;
    v31[4] = self;
    objc_msgSend(v4, "__imArrayByApplyingBlock:", v31);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMAccount _aliases](self, "_aliases");
    v29[0] = v9;
    v29[1] = 3221225472;
    v29[2] = sub_1A2052420;
    v29[3] = &unk_1E471EF98;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v30 = v10;
    objc_msgSend(v8, "__imArrayByApplyingBlock:", v29);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      -[IMAccount _aliases](self, "_aliases");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (id)objc_msgSend(v12, "mutableCopy");

      if (!v13)
        v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v23 = v11;
      v14 = v11;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v26;
        v18 = *MEMORY[0x1E0D36E60];
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v26 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), v18, v23);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v20);

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
        }
        while (v16);
      }

      -[IMAccount _setLocalCachedObject:forKey:](self, "_setLocalCachedObject:forKey:", v13, *MEMORY[0x1E0D36E80]);
      if (objc_msgSend(v8, "count"))
      {
        +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addAliases:account:", v14, self->_uniqueID);

      }
      v7 = objc_msgSend(v14, "count", v23) != 0;

      v11 = v24;
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (BOOL)addAlias:(id)a3 type:(int64_t)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  BOOL v8;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[IMAccount uniqueID](self, "uniqueID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v5;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_DEFAULT, "Client request to add alias: %@   account: %@", (uint8_t *)&v10, 0x16u);

  }
  v8 = -[IMAccount addAlias:](self, "addAlias:", v5);

  return v8;
}

- (BOOL)removeAlias:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  BOOL v8;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[IMAccount uniqueID](self, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v4;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_DEFAULT, "Client request to remove alias: %@  account: %@", (uint8_t *)&v10, 0x16u);

  }
  if (v4)
  {
    IMSingleObjectArray();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[IMAccount removeAliases:](self, "removeAliases:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)removeAliases:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[IMAccount uniqueID](self, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v4;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_DEFAULT, "Client request to remove aliases: %@  account: %@", buf, 0x16u);

  }
  if (-[IMAccount accountType](self, "accountType") == 2)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v4, "__imArrayByApplyingBlock:", &unk_1E471EFD8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount _aliases](self, "_aliases");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1A205294C;
    v16[3] = &unk_1E471EF98;
    v10 = v8;
    v17 = v10;
    objc_msgSend(v9, "__imArrayByApplyingBlock:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v11;
      _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_DEFAULT, "Final set of aliases after removes %@", buf, 0xCu);
    }

    if (v11 && objc_msgSend(v11, "count"))
    {
      -[IMAccount _setObject:forKey:](self, "_setObject:forKey:", v11, *MEMORY[0x1E0D36E80]);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMAccount _setObject:forKey:](self, "_setObject:forKey:", v13, *MEMORY[0x1E0D36E80]);

    }
    if (objc_msgSend(v4, "count"))
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeAliases:account:", v4, self->_uniqueID);

    }
    v7 = objc_msgSend(v4, "count") != 0;

  }
  return v7;
}

- (BOOL)removeAlias:(id)a3 type:(int64_t)a4
{
  return MEMORY[0x1E0DE7D20](self, sel_removeAlias_);
}

- (int64_t)typeForAlias:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;

  v3 = (objc_class *)MEMORY[0x1E0CB3780];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "addCharactersInString:", CFSTR("+1234567890#* -()."));
  objc_msgSend(v4, "stringByRemovingCharactersFromSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "trimmedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
    v9 = 1;
  else
    v9 = 2;

  return v9;
}

- (BOOL)unvalidateAlias:(id)a3
{
  void *v4;

  if (!a3)
    return 0;
  IMSingleObjectArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[IMAccount unvalidateAliases:](self, "unvalidateAliases:", v4);

  return (char)self;
}

- (BOOL)unvalidateAliases:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  if (-[IMAccount accountType](self, "accountType") == 2)
  {
    v5 = 0;
    v6 = v4;
  }
  else
  {
    -[IMAccount login](self, "login");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1A8582830]();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_1A2052BDC;
    v12[3] = &unk_1E471EF98;
    v9 = v8;
    v13 = v9;
    objc_msgSend(v4, "__imArrayByApplyingBlock:", v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count"))
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "unvalidateAliases:account:", v6, self->_uniqueID);

    }
    v5 = objc_msgSend(v6, "count") != 0;

  }
  return v5;
}

- (BOOL)validateAlias:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  BOOL v8;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[IMAccount uniqueID](self, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v4;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_DEFAULT, "Client request to validate alias: %@  account: %@", (uint8_t *)&v10, 0x16u);

  }
  if (v4)
  {
    IMSingleObjectArray();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[IMAccount validateAliases:](self, "validateAliases:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)validateAliases:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[IMAccount uniqueID](self, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v4;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_DEFAULT, "Client request to validate aliases: %@  account: %@", (uint8_t *)&v11, 0x16u);

  }
  if (-[IMAccount accountType](self, "accountType") == 2)
  {
    v7 = 0;
    v8 = v4;
  }
  else
  {
    objc_msgSend(v4, "__imArrayByApplyingBlock:", &unk_1E471C230);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count"))
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "validateAliases:account:", v8, self->_uniqueID);

    }
    v7 = objc_msgSend(v8, "count") != 0;
  }

  return v7;
}

- (int64_t)validationStatusForAlias:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  int64_t v11;

  -[IMAccount _aliasInfoForAlias:](self, "_aliasInfoForAlias:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D36E68]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "intValue");

    if (v7 == 3
      || (objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D36E60]),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          -[IMAccount vettedAliases](self, "vettedAliases"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "containsObject:", v8),
          v9,
          v8,
          (v10 & 1) == 0))
    {
      v11 = v7;
    }
    else
    {
      v11 = 3;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (int64_t)validationErrorReasonForAlias:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[IMAccount _aliasInfoForAlias:](self, "_aliasInfoForAlias:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D36E78]),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;
    v7 = (int)objc_msgSend(v5, "intValue");

  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (void)_setObject:(id)a3 forKey:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *dataChanges;
  const __CFString *v9;
  __CFString *v10;

  v10 = (__CFString *)a3;
  v6 = a4;
  if (v6)
  {
    if (!self->_dataChanges)
    {
      v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      dataChanges = self->_dataChanges;
      self->_dataChanges = v7;

    }
    if (v10)
      v9 = v10;
    else
      v9 = &stru_1E4725068;
    -[NSMutableDictionary setObject:forKey:](self->_dataChanges, "setObject:forKey:", v9, v6);
    -[IMAccount _invalidateCachedAliases](self, "_invalidateCachedAliases");
  }

}

- (void)_setLocalCachedObject:(id)a3 forKey:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *localCache;
  const __CFString *v9;
  __CFString *v10;

  v10 = (__CFString *)a3;
  v6 = a4;
  if (v6)
  {
    if (!self->_localCache)
    {
      v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      localCache = self->_localCache;
      self->_localCache = v7;

    }
    if (v10)
      v9 = v10;
    else
      v9 = &stru_1E4725068;
    -[NSMutableDictionary setObject:forKey:](self->_localCache, "setObject:forKey:", v9, v6);
    -[IMAccount _invalidateCachedAliases](self, "_invalidateCachedAliases");
  }

}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (qword_1EE65F450 != -1)
    dispatch_once(&qword_1EE65F450, &unk_1E471EFF8);
  if (objc_msgSend((id)qword_1EE65F448, "containsObject:", v6))
    -[IMAccount _setObject:forKey:](self, "_setObject:forKey:", v7, v6);

}

- (void)removeObjectForKey:(id)a3
{
  -[IMAccount setObject:forKey:](self, "setObject:forKey:", 0, a3);
}

- (void)_removeObjectForKey:(id)a3
{
  -[IMAccount _setObject:forKey:](self, "_setObject:forKey:", 0, a3);
}

- (id)stringForKey:(id)a3
{
  void *v3;
  __CFString *v4;

  -[IMAccount objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = &stru_1E4725068;

  return v4;
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[IMAccount setObject:forKey:](self, "setObject:forKey:", v8, v7);

}

- (void)_setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[IMAccount _setObject:forKey:](self, "_setObject:forKey:", v8, v7);

}

- (int64_t)integerForKey:(id)a3
{
  void *v3;
  int64_t v4;

  -[IMAccount objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[IMAccount setObject:forKey:](self, "setObject:forKey:", v8, v7);

}

- (void)_setInteger:(int64_t)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[IMAccount _setObject:forKey:](self, "_setObject:forKey:", v8, v7);

}

- (void)systemDidWake
{
  self->_asleep = 0;
}

- (void)systemWillSleep
{
  self->_asleep = 1;
}

- (BOOL)isAsleep
{
  uint64_t v3;

  v3 = objc_opt_class();
  return v3 == objc_opt_class() && self->_asleep;
}

- (NSDictionary)_persistentProperties
{
  return self->_accountPersistentProperties;
}

- (id)_persistentPropertyForKey:(id)a3
{
  NSMutableDictionary *accountPersistentPropertiesChanges;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  accountPersistentPropertiesChanges = self->_accountPersistentPropertiesChanges;
  v5 = a3;
  -[NSMutableDictionary objectForKey:](accountPersistentPropertiesChanges, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 312;
  if (!v6)
    v7 = 304;
  objc_msgSend(*(id *)((char *)&self->super.isa + v7), "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_setPersistentPropertyObject:(id)a3 forKey:(id)a4
{
  id v6;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *accountPersistentPropertiesChanges;
  const __CFString *v9;
  __CFString *v10;

  v10 = (__CFString *)a3;
  v6 = a4;
  if (v6)
  {
    if (!self->_accountPersistentPropertiesChanges)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      accountPersistentPropertiesChanges = self->_accountPersistentPropertiesChanges;
      self->_accountPersistentPropertiesChanges = Mutable;

    }
    if (v10)
      v9 = v10;
    else
      v9 = &stru_1E4725068;
    -[NSMutableDictionary setObject:forKey:](self->_accountPersistentPropertiesChanges, "setObject:forKey:", v9, v6);
  }

}

- (void)_removePersistentPropertyForKey:(id)a3
{
  -[IMAccount setObject:forKey:](self, "setObject:forKey:", 0, a3);
}

- (NSDictionary)accountPreferences
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[NSDictionary count](self->_accountPreferences, "count"))
    objc_msgSend(v3, "addEntriesFromDictionary:", self->_accountPreferences);
  if (-[NSMutableDictionary count](self->_accountPreferencesChanges, "count"))
    objc_msgSend(v3, "addEntriesFromDictionary:", self->_accountPreferencesChanges);
  return (NSDictionary *)v3;
}

- (id)objectForPreferenceKey:(id)a3
{
  NSMutableDictionary *accountPreferencesChanges;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  accountPreferencesChanges = self->_accountPreferencesChanges;
  v5 = a3;
  -[NSMutableDictionary objectForKey:](accountPreferencesChanges, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 296;
  if (!v6)
    v7 = 192;
  objc_msgSend(*(id *)((char *)&self->super.isa + v7), "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setObject:(id)a3 forPreferenceKey:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *accountPreferencesChanges;
  const __CFString *v9;
  __CFString *v10;

  v10 = (__CFString *)a3;
  v6 = a4;
  if (v6)
  {
    if (!self->_accountPreferencesChanges)
    {
      v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      accountPreferencesChanges = self->_accountPreferencesChanges;
      self->_accountPreferencesChanges = v7;

    }
    if (v10)
      v9 = v10;
    else
      v9 = &stru_1E4725068;
    -[NSMutableDictionary setObject:forKey:](self->_accountPreferencesChanges, "setObject:forKey:", v9, v6);
  }

}

- (void)removeObjectForPreferenceKey:(id)a3
{
  -[IMAccount setObject:forKey:](self, "setObject:forKey:", 0, a3);
}

- (id)stringForPreferenceKey:(id)a3
{
  void *v3;
  id v4;

  -[IMAccount objectForPreferenceKey:](self, "objectForPreferenceKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (BOOL)BOOLForPreferenceKey:(id)a3
{
  void *v3;
  char v4;

  -[IMAccount objectForPreferenceKey:](self, "objectForPreferenceKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setBool:(BOOL)a3 forPreferenceKey:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[IMAccount setObject:forPreferenceKey:](self, "setObject:forPreferenceKey:", v8, v7);

}

- (int)integerForPreferenceKey:(id)a3
{
  void *v3;
  int v4;

  -[IMAccount objectForPreferenceKey:](self, "objectForPreferenceKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "intValue");
  else
    v4 = 0;

  return v4;
}

- (void)setInteger:(int)a3 forPreferenceKey:(id)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInt:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[IMAccount setObject:forPreferenceKey:](self, "setObject:forPreferenceKey:", v8, v7);

}

- (NSString)displayName
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSString *displayName;
  int v8;
  void *v9;
  __int16 v10;
  NSString *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[IMAccount aliases](self, "aliases");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)_IDSCopyCallerID();
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    displayName = self->_displayName;
    v8 = 138412802;
    v9 = v4;
    v10 = 2112;
    v11 = displayName;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_DEFAULT, " => Returning Caller ID: %@   (Set: %@   Aliases: %@)", (uint8_t *)&v8, 0x20u);
  }

  return (NSString *)v4;
}

- (void)setDisplayName:(id)a3
{
  NSString *v4;
  NSObject *v5;
  NSString *displayName;
  NSObject *v7;
  NSString *v8;
  int v9;
  NSString *v10;
  __int16 v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  if (self->_displayName != v4)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      displayName = self->_displayName;
      v9 = 138412546;
      v10 = displayName;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_DEFAULT, "Asked to change display name from: %@  to: %@", (uint8_t *)&v9, 0x16u);
    }

    if (((-[NSString _appearsToBeEmail](v4, "_appearsToBeEmail") & 1) != 0
       || -[NSString _appearsToBePhoneNumber](v4, "_appearsToBePhoneNumber"))
      && (-[NSString _appearsToBeDSID](v4, "_appearsToBeDSID") & 1) == 0
      && -[IMAccount _updateDisplayName:](self, "_updateDisplayName:", v4))
    {
      objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = self->_displayName;
        v9 = 138412290;
        v10 = v8;
        _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_DEFAULT, " Changed display name to: %@", (uint8_t *)&v9, 0xCu);
      }

      -[IMAccount _setObject:forKey:](self, "_setObject:forKey:", self->_displayName, *MEMORY[0x1E0D36ED0]);
      -[IMAccount writeSettings](self, "writeSettings");
    }
  }

}

- (void)deregisterAsIDSIDQueryControllerDelegate
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  IMAccount *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[IMAccount service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1A200A40C(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        -[IMAccount keyTransparencyIDQueryListenerID](self, "keyTransparencyIDQueryListenerID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412546;
        v10 = v6;
        v11 = 2112;
        v12 = self;
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Removing IDSIDQueryControllerDelegate with listenerID %@ for %@", (uint8_t *)&v9, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0D34310], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccount keyTransparencyIDQueryListenerID](self, "keyTransparencyIDQueryListenerID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeDelegate:forService:listenerID:", self, v4, v8);

  }
}

- (void)idsKTVerifierResultsUpdatedForDestinations:(id)a3 service:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  id v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  const __CFString *v36;
  void *v37;
  uint8_t v38[128];
  uint8_t buf[4];
  _BYTE v40[18];
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v30 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[IMAccount accountDescription](self, "accountDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "allKeys");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v40 = v30;
      *(_WORD *)&v40[8] = 2112;
      *(_QWORD *)&v40[10] = v7;
      v41 = 2112;
      v42 = v9;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Received KTVerifierResult update from IDS for service %@, account %@, uris %@", buf, 0x20u);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set", self);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v5, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v14, "_stripFZIDPrefix");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMKeyTransparencyController sharedController](IMKeyTransparencyController, "sharedController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "ktVerifierResultForHandleID:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          if ((objc_msgSend(v18, "isEqual:", v16) & 1) == 0)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                v20 = objc_msgSend(v16, "uiStatus");
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)v40 = v15;
                *(_WORD *)&v40[8] = 2048;
                *(_QWORD *)&v40[10] = v20;
                _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "Updating status for URI: %@ to KTUIStatus: %lu", buf, 0x16u);
              }

            }
            +[IMKeyTransparencyController sharedController](IMKeyTransparencyController, "sharedController");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setKTVerifierResult:forHandleID:", v16, v15);

            objc_msgSend(v31, "addObject:", v15);
          }
        }
        else if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v40 = 0;
            _os_log_impl(&dword_1A1FF4000, v22, OS_LOG_TYPE_INFO, "IDS tried to update the KTVerifierResult with no URI: %@. Skipping.", buf, 0xCu);
          }

        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v31, "count"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = objc_msgSend(v31, "count");
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v40 = v24;
        *(_WORD *)&v40[4] = 2112;
        *(_QWORD *)&v40[6] = v31;
        _os_log_impl(&dword_1A1FF4000, v23, OS_LOG_TYPE_INFO, "IDS callback triggered update UI for %d changed handles: %@", buf, 0x12u);
      }

    }
    v36 = CFSTR("__kIMChatKTStatusChangedAffectedHandlesKey");
    objc_msgSend(v31, "allObjects");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kIMChatKeyTransparencyStatusChangedNotification"), v29, v26);

  }
}

- (void)setService:(id)a3
{
  objc_storeWeak((id *)&self->_service, a3);
}

- (NSDictionary)accountSubtypeInfo
{
  return self->_accountSubtypeInfo;
}

- (void)setAccountSubtypeInfo:(id)a3
{
  objc_storeStrong((id *)&self->_accountSubtypeInfo, a3);
}

- (void)setRegistrationStatus:(int64_t)a3
{
  self->_registrationStatus = a3;
}

- (void)setRegistrationFailureReason:(int64_t)a3
{
  self->_registrationFailureReason = a3;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (void)setAliases:(id)a3
{
  objc_storeStrong((id *)&self->_aliases, a3);
}

- (void)setVettedAliases:(id)a3
{
  objc_storeStrong((id *)&self->_vettedAliases, a3);
}

- (void)setAccountType:(int64_t)a3
{
  self->_accountType = a3;
}

- (void)setLoginStatus:(unint64_t)a3
{
  self->_loginStatus = a3;
}

- (void)setMyStatus:(unint64_t)a3
{
  self->_myStatus = a3;
}

- (void)setMyStatusMessage:(id)a3
{
  objc_storeStrong((id *)&self->_myStatusMessage, a3);
}

- (void)setMyStatusDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_myStatusDictionary, a3);
}

- (void)setMyIdleSince:(id)a3
{
  objc_storeStrong((id *)&self->_myIdleSince, a3);
}

- (void)setMyPictureData:(id)a3
{
  objc_storeStrong((id *)&self->_myPictureData, a3);
}

- (NSAttributedString)myProfile
{
  return self->_myProfile;
}

- (void)setMyProfile:(id)a3
{
  objc_storeStrong((id *)&self->_myProfile, a3);
}

- (void)setStrippedLogin:(id)a3
{
  objc_storeStrong((id *)&self->_strippedLogin, a3);
}

- (BOOL)justLoggedIn
{
  return self->_justLoggedIn;
}

- (void)setJustLoggedIn:(BOOL)a3
{
  self->_justLoggedIn = a3;
}

- (void)setCapabilities:(unint64_t)a3
{
  self->_capabilities = a3;
}

- (IMPeople)buddyList
{
  return self->_buddyList;
}

- (void)setBuddyList:(id)a3
{
  objc_storeStrong((id *)&self->_buddyList, a3);
}

- (BOOL)blockIdleStatus
{
  return self->_blockIdleStatus;
}

- (void)setAccountPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_accountPreferences, a3);
}

- (void)setLoginIMHandle:(id)a3
{
  objc_storeStrong((id *)&self->_loginIMHandle, a3);
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (NSMapTable)imHandles
{
  return self->_imHandles;
}

- (void)setImHandles:(id)a3
{
  objc_storeStrong((id *)&self->_imHandles, a3);
}

- (NSArray)cachedAllowList
{
  return self->_cachedAllowList;
}

- (NSArray)cachedBlockList
{
  return self->_cachedBlockList;
}

- (NSString)loginID
{
  return self->_loginID;
}

- (void)setLoginID:(id)a3
{
  objc_storeStrong((id *)&self->_loginID, a3);
}

- (NSDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSMutableDictionary)dataChanges
{
  return self->_dataChanges;
}

- (void)setDataChanges:(id)a3
{
  objc_storeStrong((id *)&self->_dataChanges, a3);
}

- (NSMutableDictionary)localCache
{
  return self->_localCache;
}

- (void)setLocalCache:(id)a3
{
  objc_storeStrong((id *)&self->_localCache, a3);
}

- (NSDictionary)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (NSMutableDictionary)profileChanges
{
  return self->_profileChanges;
}

- (void)setProfileChanges:(id)a3
{
  objc_storeStrong((id *)&self->_profileChanges, a3);
}

- (int64_t)profileStatus
{
  return self->_profileStatus;
}

- (void)setProfileStatus:(int64_t)a3
{
  self->_profileStatus = a3;
}

- (NSMutableDictionary)accountPreferencesChanges
{
  return self->_accountPreferencesChanges;
}

- (void)setAccountPreferencesChanges:(id)a3
{
  objc_storeStrong((id *)&self->_accountPreferencesChanges, a3);
}

- (NSDictionary)accountPersistentProperties
{
  return self->_accountPersistentProperties;
}

- (void)setAccountPersistentProperties:(id)a3
{
  objc_storeStrong((id *)&self->_accountPersistentProperties, a3);
}

- (NSMutableDictionary)accountPersistentPropertiesChanges
{
  return self->_accountPersistentPropertiesChanges;
}

- (void)setAccountPersistentPropertiesChanges:(id)a3
{
  objc_storeStrong((id *)&self->_accountPersistentPropertiesChanges, a3);
}

- (NSArray)groups
{
  return self->_groups;
}

- (void)setGroups:(id)a3
{
  objc_storeStrong((id *)&self->_groups, a3);
}

- (NSMutableDictionary)sortOrders
{
  return self->_sortOrders;
}

- (void)setSortOrders:(id)a3
{
  objc_storeStrong((id *)&self->_sortOrders, a3);
}

- (NSDictionary)members
{
  return self->_members;
}

- (void)setMembers:(id)a3
{
  objc_storeStrong((id *)&self->_members, a3);
}

- (NSMutableDictionary)coalescedChanges
{
  return self->_coalescedChanges;
}

- (void)setCoalescedChanges:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedChanges, a3);
}

- (NSArray)targetGroupState
{
  return self->_targetGroupState;
}

- (void)setTargetGroupState:(id)a3
{
  objc_storeStrong((id *)&self->_targetGroupState, a3);
}

- (NSArray)lastReceivedGroupState
{
  return self->_lastReceivedGroupState;
}

- (void)setLastReceivedGroupState:(id)a3
{
  objc_storeStrong((id *)&self->_lastReceivedGroupState, a3);
}

- (NSDictionary)myNowPlaying
{
  return self->_myNowPlaying;
}

- (void)setMyNowPlaying:(id)a3
{
  objc_storeStrong((id *)&self->_myNowPlaying, a3);
}

- (void)setDefaultHandleCapabilities:(unint64_t)a3
{
  self->_defaultHandleCapabilities = a3;
}

- (BOOL)hasCheckedDefaultHandleCapabilities
{
  return self->_hasCheckedDefaultHandleCapabilities;
}

- (void)setHasCheckedDefaultHandleCapabilities:(BOOL)a3
{
  self->_hasCheckedDefaultHandleCapabilities = a3;
}

- (NSDictionary)registrationAlertInfo
{
  return self->_registrationAlertInfo;
}

- (void)setRegistrationAlertInfo:(id)a3
{
  objc_storeStrong((id *)&self->_registrationAlertInfo, a3);
}

- (BOOL)hasPostedOfflineNotification
{
  return self->_hasPostedOfflineNotification;
}

- (void)setHasPostedOfflineNotification:(BOOL)a3
{
  self->_hasPostedOfflineNotification = a3;
}

- (BOOL)useMeCardName
{
  return self->_useMeCardName;
}

- (void)setUseMeCardName:(BOOL)a3
{
  self->_useMeCardName = a3;
}

- (unsigned)cachedBlockingMode
{
  return self->_cachedBlockingMode;
}

- (BOOL)syncedWithRemoteBuddyList
{
  return self->_syncedWithRemoteBuddyList;
}

- (void)setSyncedWithRemoteBuddyList:(BOOL)a3
{
  self->_syncedWithRemoteBuddyList = a3;
}

- (BOOL)hasReceivedSync
{
  return self->_hasReceivedSync;
}

- (void)setHasReceivedSync:(BOOL)a3
{
  self->_hasReceivedSync = a3;
}

- (int)numHolding
{
  return self->_numHolding;
}

- (void)setNumHolding:(int)a3
{
  self->_numHolding = a3;
}

- (int)coalesceCount
{
  return self->_coalesceCount;
}

- (void)setCoalesceCount:(int)a3
{
  self->_coalesceCount = a3;
}

- (BOOL)needToCheckForWatchedIMHandles
{
  return self->_needToCheckForWatchedIMHandles;
}

- (void)setNeedToCheckForWatchedIMHandles:(BOOL)a3
{
  self->_needToCheckForWatchedIMHandles = a3;
}

- (BOOL)hasBeenRemoved
{
  return self->_hasBeenRemoved;
}

- (void)setHasBeenRemoved:(BOOL)a3
{
  self->_hasBeenRemoved = a3;
}

- (id)smallImage
{
  return self->_smallImage;
}

- (void)setSmallImage:(id)a3
{
  objc_storeStrong(&self->_smallImage, a3);
}

- (id)accountImage
{
  return self->_accountImage;
}

- (void)setAccountImage:(id)a3
{
  objc_storeStrong(&self->_accountImage, a3);
}

- (BOOL)asleep
{
  return self->_asleep;
}

- (void)setAsleep:(BOOL)a3
{
  self->_asleep = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyTransparencyIDQueryListenerID, 0);
  objc_storeStrong(&self->_accountImage, 0);
  objc_storeStrong(&self->_smallImage, 0);
  objc_storeStrong((id *)&self->_registrationAlertInfo, 0);
  objc_storeStrong((id *)&self->_myNowPlaying, 0);
  objc_storeStrong((id *)&self->_lastReceivedGroupState, 0);
  objc_storeStrong((id *)&self->_targetGroupState, 0);
  objc_storeStrong((id *)&self->_coalescedChanges, 0);
  objc_storeStrong((id *)&self->_members, 0);
  objc_storeStrong((id *)&self->_sortOrders, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_accountPersistentPropertiesChanges, 0);
  objc_storeStrong((id *)&self->_accountPersistentProperties, 0);
  objc_storeStrong((id *)&self->_accountPreferencesChanges, 0);
  objc_storeStrong((id *)&self->_profileChanges, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_localCache, 0);
  objc_storeStrong((id *)&self->_dataChanges, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_loginID, 0);
  objc_storeStrong((id *)&self->_cachedBlockList, 0);
  objc_storeStrong((id *)&self->_cachedAllowList, 0);
  objc_storeStrong((id *)&self->_imHandles, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_loginIMHandle, 0);
  objc_storeStrong((id *)&self->_accountPreferences, 0);
  objc_storeStrong((id *)&self->_buddyList, 0);
  objc_storeStrong((id *)&self->_strippedLogin, 0);
  objc_storeStrong((id *)&self->_myProfile, 0);
  objc_storeStrong((id *)&self->_myPictureData, 0);
  objc_storeStrong((id *)&self->_myIdleSince, 0);
  objc_storeStrong((id *)&self->_myStatusDictionary, 0);
  objc_storeStrong((id *)&self->_myStatusMessage, 0);
  objc_storeStrong((id *)&self->_vettedAliases, 0);
  objc_storeStrong((id *)&self->_aliases, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_accountSubtypeInfo, 0);
  objc_destroyWeak((id *)&self->_service);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end
