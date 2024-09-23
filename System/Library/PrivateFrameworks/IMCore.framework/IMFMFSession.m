@implementation IMFMFSession

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, 0, 0);

  v4.receiver = self;
  v4.super_class = (Class)IMFMFSession;
  -[IMFMFSession dealloc](&v4, sel_dealloc);
}

- (IMFMFSession)init
{
  IMFMFSession *v2;
  IMFMFSession *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMFMFSession;
  v2 = -[IMFMFSession init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[IMFMFSession _initializeFindMySessionIfInAllowedProcess](v2, "_initializeFindMySessionIfInAllowedProcess");
  return v3;
}

- (void)_initializeFindMySessionIfInAllowedProcess
{
  char v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  objc_class *v11;
  id v12;
  id fmlSession;
  NSObject *v14;
  NSObject *v15;
  objc_class *v16;
  FMFSession *v17;
  FMFSession *session;
  FMFSession *v19;
  void *v20;
  uint8_t v21[16];
  uint8_t buf[16];

  v3 = objc_msgSend(MEMORY[0x1E0D397F8], "deviceIsLockedDown");
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isWaldoEnabled");

  if ((IMIsRunningInImagent() & 1) != 0)
  {
    v6 = 1;
    if ((v3 & 1) != 0)
    {
LABEL_13:
      IMLogHandleForCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_1A2198288();
LABEL_15:

      return;
    }
  }
  else
  {
    v6 = IMIsRunningInMessagesUIProcess();
    if ((v3 & 1) != 0)
      goto LABEL_13;
  }
  if (!(v5 ^ 1 | v6))
    goto LABEL_13;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isFindMyLocateSessionEnabled");

  v9 = IMOSLoggingEnabled();
  if (v8)
  {
    if (v9)
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "FindMyLocateSession is enabled. Attempting to configure the session.", buf, 2u);
      }

    }
    v11 = -[IMFMFSession __FMLSessionClass](self, "__FMLSessionClass");
    if (v11)
    {
      v12 = objc_alloc_init(v11);
      fmlSession = self->_fmlSession;
      self->_fmlSession = v12;

      -[IMFMFSession setFmfProvisionedState:](self, "setFmfProvisionedState:", 0);
      -[IMFMFSession _configureFindMyLocateSession](self, "_configureFindMyLocateSession");
      return;
    }
    IMLogHandleForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1A219825C();
    goto LABEL_15;
  }
  if (v9)
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "FindMyLocateSession is disabled. Attempting to configure the legacy FMFSession.", v21, 2u);
    }

  }
  v16 = -[IMFMFSession __FMFSessionClass](self, "__FMFSessionClass");
  if (v16)
  {
    v17 = (FMFSession *)objc_msgSend([v16 alloc], "initWithDelegate:", self);
    session = self->_session;
    self->_session = v17;

    v19 = self->_session;
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFSession setDelegateQueue:](v19, "setDelegateQueue:", v20);

    -[IMFMFSession _updateActiveDevice](self, "_updateActiveDevice");
    -[IMFMFSession setFmfProvisionedState:](self, "setFmfProvisionedState:", 0);
  }
}

- (void)_configureFindMyLocateSession
{
  -[IMFMFSession _setUpFindMyLocateSessionCallbacks](self, "_setUpFindMyLocateSessionCallbacks");
  MEMORY[0x1E0DE7D20](self, sel__startFMLSessionMonitoring);
}

- (void)_setUpFindMyLocateSessionCallbacks
{
  void *v3;
  int v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  void *v13;
  char v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFindMyLocateSessionEnabled");

  if (v4)
  {
    location = 0;
    objc_initWeak(&location, self);
    -[IMFMFSession fmlSession](self, "fmlSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[IMFMFSession fmlSession](self, "fmlSession");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = sub_1A21330F4;
      v21[3] = &unk_1E4722CC0;
      objc_copyWeak(&v22, &location);
      objc_msgSend(v7, "setLocationUpdateCallback:", v21);

      objc_destroyWeak(&v22);
    }
    else
    {
      IMLogHandleForCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1A219830C();

    }
    -[IMFMFSession fmlSession](self, "fmlSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[IMFMFSession fmlSession](self, "fmlSession");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = sub_1A21331F4;
      v19[3] = &unk_1E4722D10;
      objc_copyWeak(&v20, &location);
      objc_msgSend(v11, "setFriendshipUpdateCallback:", v19);

      objc_destroyWeak(&v20);
    }
    else
    {
      IMLogHandleForCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1A21982E0();

    }
    -[IMFMFSession fmlSession](self, "fmlSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[IMFMFSession fmlSession](self, "fmlSession");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = sub_1A2133450;
      v17[3] = &unk_1E4722D38;
      objc_copyWeak(&v18, &location);
      objc_msgSend(v15, "setMeDeviceUpdateCallback:", v17);

      objc_destroyWeak(&v18);
    }
    else
    {
      IMLogHandleForCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1A21982B4();

    }
    objc_destroyWeak(&location);
  }
}

- (void)_startFMLSessionMonitoring
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  char v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  char v17;
  NSObject *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFindMyLocateSessionEnabled");

  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "_startFMLSessionMonitoring: kicking off initial updates.", buf, 2u);
      }

    }
    -[IMFMFSession fmlSession](self, "fmlSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[IMFMFSession fmlSession](self, "fmlSession");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject startUpdatingFriendsWithInitialUpdates:completion:](v8, "startUpdatingFriendsWithInitialUpdates:completion:", 0, &unk_1E471DB58);
    }
    else
    {
      IMLogHandleForCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1A21983F8();
    }

    -[IMFMFSession fmlSession](self, "fmlSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    v11 = MEMORY[0x1E0C809B0];
    if ((v10 & 1) != 0)
    {
      -[IMFMFSession fmlSession](self, "fmlSession");
      v12 = objc_claimAutoreleasedReturnValue();
      v20[0] = v11;
      v20[1] = 3221225472;
      v20[2] = sub_1A21339D4;
      v20[3] = &unk_1E4722D80;
      v20[4] = self;
      -[NSObject getFriendsSharingLocationsWithMeWithCompletion:](v12, "getFriendsSharingLocationsWithMeWithCompletion:", v20);
    }
    else
    {
      IMLogHandleForCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1A21983CC();
    }

    -[IMFMFSession fmlSession](self, "fmlSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[IMFMFSession fmlSession](self, "fmlSession");
      v15 = objc_claimAutoreleasedReturnValue();
      v19[0] = v11;
      v19[1] = 3221225472;
      v19[2] = sub_1A2133BAC;
      v19[3] = &unk_1E4722D80;
      v19[4] = self;
      -[NSObject getFriendsFollowingMyLocationWithCompletion:](v15, "getFriendsFollowingMyLocationWithCompletion:", v19);
    }
    else
    {
      IMLogHandleForCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_1A21983CC();
    }

    -[IMFMFSession fmlSession](self, "fmlSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      -[IMFMFSession fmlSession](self, "fmlSession");
      v18 = objc_claimAutoreleasedReturnValue();
      -[NSObject startMonitoringActiveLocationSharingDeviceChangeWithCompletion:](v18, "startMonitoringActiveLocationSharingDeviceChangeWithCompletion:", &unk_1E471C530);
    }
    else
    {
      IMLogHandleForCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_1A21983A0();
    }

  }
}

+ (id)sharedInstance
{
  if (qword_1ECF125D8 != -1)
    dispatch_once(&qword_1ECF125D8, &unk_1E471DEB8);
  return (id)qword_1ECF12638;
}

- (BOOL)restrictLocationSharing
{
  void *v3;
  int v4;
  objc_class *v5;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFindMyLocateSessionEnabled");

  if (v4)
  {
    v5 = -[IMFMFSession __FMLSessionClass](self, "__FMLSessionClass");
    if (v5)
      return MEMORY[0x1E0DE7D20](v5, sel_FMFRestricted);
  }
  else
  {
    v5 = -[IMFMFSession __FMFSessionClass](self, "__FMFSessionClass");
    if (v5)
      return MEMORY[0x1E0DE7D20](v5, sel_FMFRestricted);
  }
  return 0;
}

- (BOOL)disableLocationSharing
{
  void *v3;
  int v4;
  objc_class *v5;
  int v6;
  objc_class *v7;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFindMyLocateSessionEnabled");

  if (!v4)
  {
    v7 = -[IMFMFSession __FMFSessionClass](self, "__FMFSessionClass");
    if (v7)
    {
      if (!-[objc_class FMFAllowed](v7, "FMFAllowed"))
        goto LABEL_4;
LABEL_7:
      v6 = !-[IMFMFSession imIsProvisionedForLocationSharing](self, "imIsProvisionedForLocationSharing");
      return v6 | objc_msgSend(MEMORY[0x1E0D397F8], "deviceIsLockedDown");
    }
LABEL_8:
    LOBYTE(v6) = 0;
    return v6 | objc_msgSend(MEMORY[0x1E0D397F8], "deviceIsLockedDown");
  }
  v5 = -[IMFMFSession __FMLSessionClass](self, "__FMLSessionClass");
  if (!v5)
    goto LABEL_8;
  if ((-[objc_class FMFAllowed](v5, "FMFAllowed") & 1) != 0)
    goto LABEL_7;
LABEL_4:
  LOBYTE(v6) = 1;
  return v6 | objc_msgSend(MEMORY[0x1E0D397F8], "deviceIsLockedDown");
}

- (BOOL)imIsProvisionedForLocationSharing
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  int v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[IMFMFSession fmfProvisionedState](self, "fmfProvisionedState"))
    return -[IMFMFSession fmfProvisionedState](self, "fmfProvisionedState") == 1;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[IMFMFSession _accountStore](self, "_accountStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aa_primaryAppleAccountWithPreloadedDataclasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_10;
  v6 = *(id *)MEMORY[0x1A8582938]("ACAccountDataclassShareLocation", CFSTR("Accounts"));
  if (!v6)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "IMFMFSession - Failed to weak link ACAccountDataclassShareLocation", (uint8_t *)&v16, 2u);
      }

    }
    goto LABEL_10;
  }
  v7 = v6;
  v8 = objc_msgSend(v5, "isProvisionedForDataclass:", v6);

  if (v8)
  {
LABEL_10:
    v9 = 1;
    goto LABEL_11;
  }
  v9 = 2;
LABEL_11:
  -[IMFMFSession setFmfProvisionedState:](self, "setFmfProvisionedState:", v9);
  v11 = *(id *)MEMORY[0x1A8582938]("ACAccountStoreDidChangeNotification", CFSTR("Accounts"));
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__accountStoreDidChangeNotification_, v11, 0);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "IMFMFSession - Failed to weak link ACAccountStoreDidChangeNotification", (uint8_t *)&v16, 2u);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v16 = 136315394;
      v17 = "-[IMFMFSession imIsProvisionedForLocationSharing]";
      v18 = 2048;
      v19 = v9;
      _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "%s provisioned state generated is %lu", (uint8_t *)&v16, 0x16u);
    }

  }
  return -[IMFMFSession fmfProvisionedState](self, "fmfProvisionedState") == 1;
}

- (id)_accountStore
{
  if (qword_1EE65EAD0 != -1)
    dispatch_once(&qword_1EE65EAD0, &unk_1E4722DA0);
  return (id)qword_1EE65EB00;
}

- (void)_accountStoreDidChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Account store did change, invalidating FMF provision state", v6, 2u);
    }

  }
  -[IMFMFSession setFmfProvisionedState:](self, "setFmfProvisionedState:", 0);

}

- (id)findMyHandlesForChat:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "participants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "ID", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMFindMyHandle handleWithIdentifier:](IMFindMyHandle, "handleWithIdentifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)findMyURLForChat:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[IMFMFSession findMyHandlesForChat:](self, "findMyHandlesForChat:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v10, "fmfHandle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "fmfHandle");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = &stru_1E4725068;
  }
  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByAddingPercentEncodingWithAllowedCharacters:](v14, "stringByAddingPercentEncodingWithAllowedCharacters:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("findmy://fr/%@"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)allSiblingFindMyHandlesForChat:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "participants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "findMySiblingHandles", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "unionSet:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)sendMappingPacket:(id)a3 toHandle:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Forwarding mapping packet: %@ to daemon for ID: %@", (uint8_t *)&v12, 0x16u);
    }

  }
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMFMFSession establishingAccountID](self, "establishingAccountID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendMappingPacket:toHandle:account:", v6, v10, v11);

}

- (void)_startRefreshingLocationForFMLHandles:(id)a3 priority:(int64_t)a4 isFromGroup:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  NSObject *v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  int64_t v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v18 = v8;
      if (v5)
        v10 = CFSTR("YES");
      v19 = 2048;
      v20 = a4;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "_startRefreshingLocationForFMLHandles handles: %@, priority: %ld, isFromGroup: %@", buf, 0x20u);
    }

  }
  if (objc_msgSend(v8, "count")
    && (-[IMFMFSession fmlSession](self, "fmlSession"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_opt_respondsToSelector(),
        v11,
        (v12 & 1) != 0))
  {
    -[IMFMFSession fmlSession](self, "fmlSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1A2134BB0;
    v15[3] = &unk_1E4722DC8;
    v16 = v8;
    objc_msgSend(v13, "startRefreshingLocationForHandles:priority:isFromGroup:reverseGeocode:completion:", v16, 0, v5, 1, v15);

    v14 = v16;
  }
  else
  {
    IMLogHandleForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1A21984E4();
  }

}

- (void)startTrackingLocationForHandle:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "findMyHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFindMyLocateSessionEnabled");

  if (v6)
  {
    objc_msgSend(v4, "fmlHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "fmlHandle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMFMFSession _startRefreshingLocationForFMLHandles:priority:isFromGroup:](self, "_startRefreshingLocationForFMLHandles:priority:isFromGroup:", v9, 0, 0);

    }
  }
  else
  {
    objc_msgSend(v4, "fmfHandle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[IMFMFSession session](self, "session");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v4, "fmfHandle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWithObjects:", v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addHandles:", v14);

    }
  }

}

- (void)startTrackingLocationForChat:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  _BOOL8 v11;
  void *v12;
  uint8_t v13[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "", v13, 2u);
    }

  }
  -[IMFMFSession allSiblingFindMyHandlesForChat:](self, "allSiblingFindMyHandlesForChat:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isFindMyLocateSessionEnabled");

  if (v8)
  {
    objc_msgSend(v6, "__im_fmlHandles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "chatStyle");
    if (objc_msgSend(v9, "count"))
    {
      v11 = v10 != 45;
      objc_msgSend(v9, "allObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMFMFSession _startRefreshingLocationForFMLHandles:priority:isFromGroup:](self, "_startRefreshingLocationForFMLHandles:priority:isFromGroup:", v12, 0, v11);
LABEL_10:

    }
  }
  else
  {
    objc_msgSend(v6, "__im_fmfHandles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      -[IMFMFSession session](self, "session");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addHandles:", v9);
      goto LABEL_10;
    }
  }

}

- (void)_stopTrackingLocationForFMLHandles:(id)a3 priority:(int64_t)a4 isFromGroup:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  NSObject *v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  int64_t v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v18 = v8;
      if (v5)
        v10 = CFSTR("YES");
      v19 = 2048;
      v20 = a4;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "_stopTrackingLocationForFMLHandles handles: %@, priority: %ld, isFromGroup: %@", buf, 0x20u);
    }

  }
  if (objc_msgSend(v8, "count")
    && (-[IMFMFSession fmlSession](self, "fmlSession"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_opt_respondsToSelector(),
        v11,
        (v12 & 1) != 0))
  {
    -[IMFMFSession fmlSession](self, "fmlSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1A2135190;
    v15[3] = &unk_1E4722DC8;
    v16 = v8;
    objc_msgSend(v13, "stopRefreshingLocationForHandles:priority:isFromGroup:completion:", v16, a4, v5, v15);

    v14 = v16;
  }
  else
  {
    IMLogHandleForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1A21984E4();
  }

}

- (void)stopTrackingLocationForHandle:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "findMyHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFindMyLocateSessionEnabled");

  if (v6)
  {
    objc_msgSend(v4, "fmlHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "fmlHandle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMFMFSession _stopTrackingLocationForFMLHandles:priority:isFromGroup:](self, "_stopTrackingLocationForFMLHandles:priority:isFromGroup:", v9, 0, 0);

    }
  }
  else
  {
    objc_msgSend(v4, "fmfHandle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[IMFMFSession session](self, "session");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v4, "fmfHandle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWithObjects:", v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeHandles:", v14);

    }
  }

}

- (void)stopTrackingLocationForChat:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  _BOOL8 v11;
  void *v12;
  id v13;

  v13 = a3;
  -[IMFMFSession allSiblingFindMyHandlesForChat:](self, "allSiblingFindMyHandlesForChat:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFindMyLocateSessionEnabled");

  if (v6)
  {
    objc_msgSend(v4, "__im_fmlHandles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v13, "chatStyle");
    if (objc_msgSend(v7, "count"))
    {
      -[IMFMFSession fmlSession](self, "fmlSession");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) != 0)
      {
        v11 = v8 != 45;
        objc_msgSend(v7, "allObjects");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMFMFSession _stopTrackingLocationForFMLHandles:priority:isFromGroup:](self, "_stopTrackingLocationForFMLHandles:priority:isFromGroup:", v12, 0, v11);
LABEL_7:

      }
    }
  }
  else
  {
    objc_msgSend(v4, "__im_fmfHandles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      -[IMFMFSession session](self, "session");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeHandles:", v7);
      goto LABEL_7;
    }
  }

}

- (id)_dateFromShareDuration:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nextDateAfterDate:matchingUnit:value:options:", v5, 32, 4, 1024);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 3600.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)startSharingWithHandle:(id)a3 inChat:(id)a4 withDuration:(int64_t)a5
{
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  v8 = (void *)MEMORY[0x1E0D39840];
  v9 = a4;
  objc_msgSend(v8, "sharedFeatureFlags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isFindMyLocateSessionEnabled");

  if (v11)
  {
    objc_msgSend(v17, "findMyHandle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fmlHandle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v13);
    else
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMFMFSession _startSharingWithFMLHandles:inChat:withDuration:](self, "_startSharingWithFMLHandles:inChat:withDuration:", v15, v9, a5);
  }
  else
  {
    -[IMFMFSession _dateFromShareDuration:](self, "_dateFromShareDuration:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "findMyHandle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fmfHandle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v15);
    else
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    -[IMFMFSession _startSharingWithFMFHandles:inChat:untilDate:](self, "_startSharingWithFMFHandles:inChat:untilDate:", v16, v9, v13);

    v9 = (id)v16;
  }

}

- (void)stopSharingWithHandle:(id)a3 inChat:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0D39840];
  v8 = a3;
  objc_msgSend(v7, "sharedFeatureFlags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isFindMyLocateSessionEnabled");

  objc_msgSend(v8, "findMyHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v11, "fmlHandle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v14[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0C9AA60];
    }
    -[IMFMFSession _stopSharingWithFMLHandles:inChat:](self, "_stopSharingWithFMLHandles:inChat:", v13, v6);
  }
  else
  {
    objc_msgSend(v11, "fmfHandle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
    else
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMFMFSession _stopSharingWithFMFHandles:inChat:](self, "_stopSharingWithFMFHandles:inChat:", v13, v6);
  }

}

- (void)startSharingWithChat:(id)a3 withDuration:(int64_t)a4
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isFindMyLocateSessionEnabled");

  -[IMFMFSession findMyHandlesForChat:](self, "findMyHandlesForChat:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "__im_fmlHandles");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMFMFSession _startSharingWithFMLHandles:inChat:withDuration:](self, "_startSharingWithFMLHandles:inChat:withDuration:", v10, v12, a4);
  }
  else
  {
    objc_msgSend(v8, "__im_fmfHandles");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count"))
    {
      -[IMFMFSession _dateFromShareDuration:](self, "_dateFromShareDuration:", a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMFMFSession _startSharingWithFMFHandles:inChat:untilDate:](self, "_startSharingWithFMFHandles:inChat:untilDate:", v10, v12, v11);

    }
  }

}

- (void)stopSharingWithChat:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFindMyLocateSessionEnabled");

  -[IMFMFSession allSiblingFindMyHandlesForChat:](self, "allSiblingFindMyHandlesForChat:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "__im_fmlHandles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMFMFSession _stopSharingWithFMLHandles:inChat:](self, "_stopSharingWithFMLHandles:inChat:", v9, v10);

  }
  else
  {
    objc_msgSend(v6, "__im_fmfHandles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count"))
      -[IMFMFSession _stopSharingWithFMFHandles:inChat:](self, "_stopSharingWithFMFHandles:inChat:", v8, v10);
  }

}

- (id)findMyLocationForHandle:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "findMyHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMFMFSession findMyLocationForFindMyHandle:](self, "findMyLocationForFindMyHandle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)findMyLocationForFindMyHandle:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFindMyLocateSessionEnabled");

  if (!v6)
  {
    objc_msgSend(v4, "fmfHandle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[IMFMFSession session](self, "session");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "fmfHandle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "cachedLocationForHandle:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[IMFindMyLocation locationWithFMFLocation:](IMFindMyLocation, "locationWithFMFLocation:", v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_17;
    }
    IMLogHandleForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1A2198640();
LABEL_14:

    v13 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v4, "fmlHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    IMLogHandleForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1A21985E8();
    goto LABEL_14;
  }
  -[IMFMFSession fmlSession](self, "fmlSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) == 0)
  {
    IMLogHandleForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1A2198614();
    goto LABEL_14;
  }
  -[IMFMFSession fmlSession](self, "fmlSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fmlHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cachedLocationForHandle:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    +[IMFindMyLocation locationWithFMLLocation:](IMFindMyLocation, "locationWithFMLLocation:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

LABEL_17:
  return v13;
}

- (id)findMyLocationForHandleOrSibling:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _UNKNOWN **v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _UNKNOWN **v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v39;
  void *v40;
  id obj;
  IMFMFSession *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMFMFSession findMyHandlesSharingLocationWithMe](self, "findMyHandlesSharingLocationWithMe");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v6)
  {
    -[IMFMFSession findMyLocationForHandle:](self, "findMyLocationForHandle:", v4);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "fmfLocation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "location");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {

    }
    else
    {
      objc_msgSend(v34, "fmlLocation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v37)
      {
        v21 = 0;
        goto LABEL_40;
      }
    }
    v21 = v34;
LABEL_40:

    goto LABEL_41;
  }
  v39 = v4;
  v40 = (void *)v6;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend(MEMORY[0x1E0D397A8], "phoneNumbersForCNContact:", v6);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  v42 = self;
  if (!v8)
    goto LABEL_18;
  v9 = v8;
  v10 = *(_QWORD *)v48;
  v11 = &off_1E471A000;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v48 != v10)
        objc_enumerationMutation(obj);
      IMInternationalForPhoneNumberWithOptions();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11[152], "handleWithIdentifier:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "containsObject:", v14) & 1) == 0)
      {

        goto LABEL_14;
      }
      v15 = v5;
      v16 = v11;
      -[IMFMFSession findMyLocationForFindMyHandle:](self, "findMyLocationForFindMyHandle:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fmfLocation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "location");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {

LABEL_12:
        v21 = v17;
        goto LABEL_13;
      }
      objc_msgSend(v17, "fmlLocation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        goto LABEL_12;
      v21 = 0;
LABEL_13:

      self = v42;
      v11 = v16;
      v5 = v15;
      if (v21)
        goto LABEL_35;
LABEL_14:
      ++v12;
    }
    while (v9 != v12);
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    v9 = v22;
  }
  while (v22);
LABEL_18:

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(MEMORY[0x1E0D397A8], "emailsForCNContact:", v40);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (!v23)
    goto LABEL_34;
  v24 = v23;
  v25 = *(_QWORD *)v44;
  while (2)
  {
    v26 = 0;
    while (2)
    {
      if (*(_QWORD *)v44 != v25)
        objc_enumerationMutation(obj);
      objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v26), "lowercaseString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[IMFindMyHandle handleWithIdentifier:](IMFindMyHandle, "handleWithIdentifier:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "containsObject:", v28) & 1) != 0)
      {
        -[IMFMFSession findMyLocationForFindMyHandle:](self, "findMyLocationForFindMyHandle:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "fmfLocation");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "location");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {

          goto LABEL_28;
        }
        objc_msgSend(v29, "fmlLocation");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
LABEL_28:
          v21 = v29;
        else
          v21 = 0;

        self = v42;
        if (v21)
          goto LABEL_35;
      }
      else
      {

      }
      if (v24 != ++v26)
        continue;
      break;
    }
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    v24 = v33;
    if (v33)
      continue;
    break;
  }
LABEL_34:
  v21 = 0;
LABEL_35:

  v4 = v39;
  v7 = v40;
LABEL_41:

  return v21;
}

- (void)refreshLocationForHandle:(id)a3 inChat:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  IMFMFSession *v20;
  id v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isFindMyLocateSessionEnabled");

  if ((v9 & 1) == 0)
  {
    -[IMFMFSession _callerIDForChat:](self, "_callerIDForChat:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fmfHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v6, "fmfHandle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWithObject:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[IMFMFSession session](self, "session");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = sub_1A213624C;
      v17[3] = &unk_1E4722DF0;
      v18 = v14;
      v19 = v10;
      v20 = self;
      v21 = v6;
      v16 = v14;
      objc_msgSend(v15, "refreshLocationForHandles:callerId:priority:completion:", v16, v19, 1, v17);

    }
    else
    {
      IMLogHandleForCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1A219866C();
    }

  }
}

- (void)refreshLocationForChat:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  IMFMFSession *v16;
  id v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFindMyLocateSessionEnabled");

  if ((v6 & 1) == 0)
  {
    -[IMFMFSession _callerIDForChat:](self, "_callerIDForChat:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allSiblingFindMyHandles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "__im_fmfHandles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMFMFSession session](self, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1A2136494;
    v13[3] = &unk_1E4722DF0;
    v14 = v9;
    v15 = v7;
    v16 = self;
    v17 = v4;
    v11 = v7;
    v12 = v9;
    objc_msgSend(v10, "refreshLocationForHandles:callerId:priority:completion:", v12, v11, 1, v13);

  }
}

- (BOOL)handleIsSharingLocationWithMe:(id)a3
{
  void *v4;

  objc_msgSend(a3, "findMyHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[IMFMFSession findMyHandleIsSharingLocationWithMe:](self, "findMyHandleIsSharingLocationWithMe:", v4);

  return (char)self;
}

- (id)findMyHandlesSharingLocationWithMe
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFindMyLocateSessionEnabled");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMFMFSession fmlSession](self, "fmlSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[IMFMFSession fmlSession](self, "fmlSession");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cachedFriendsSharingLocationsWithMe");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = v9;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D20], "array");
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v17 = v11;

      v5 = v17;
    }
    v18 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "__im_findMyHandlesWithFMLFriends:", v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[IMFMFSession session](self, "session");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "getHandlesSharingLocationsWithMe");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v15;

    objc_msgSend(MEMORY[0x1E0C99E60], "__im_findMyHandlesWithFMFHandles:", v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (BOOL)findMyHandleIsSharingLocationWithMe:(id)a3
{
  id v4;
  void *v5;
  char v6;

  if (!a3)
    return 0;
  v4 = a3;
  -[IMFMFSession findMyHandlesSharingLocationWithMe](self, "findMyHandlesSharingLocationWithMe");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (BOOL)chatHasParticipantsSharingLocationWithMe:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMFMFSession findMyHandlesSharingLocationWithMe](self, "findMyHandlesSharingLocationWithMe");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v4, "findMyHandles", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(v5, "containsObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i)) & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (BOOL)chatHasSiblingParticipantsSharingLocationWithMe:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMFMFSession findMyHandlesSharingLocationWithMe](self, "findMyHandlesSharingLocationWithMe");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v4, "allSiblingFindMyHandles", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(v5, "containsObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i)) & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (BOOL)allChatParticipantsSharingLocationWithMe:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMFMFSession findMyHandlesSharingLocationWithMe](self, "findMyHandlesSharingLocationWithMe");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "findMyHandles", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        if (!objc_msgSend(v5, "containsObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i)))
        {
          v11 = 0;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_11:

  return v11;
}

- (BOOL)handleIsFollowingMyLocation:(id)a3
{
  void *v4;

  objc_msgSend(a3, "findMyHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[IMFMFSession findMyHandleIsFollowingMyLocation:](self, "findMyHandleIsFollowingMyLocation:", v4);

  return (char)self;
}

- (BOOL)findMyHandleIsFollowingMyLocation:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFindMyLocateSessionEnabled");

  if (!v6)
  {
    -[IMFMFSession session](self, "session");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "getHandlesFollowingMyLocation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "fmfHandle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v4, "fmfHandle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v12, "containsObject:", v15);

    }
    else
    {
      v16 = 0;
    }
LABEL_12:

    goto LABEL_13;
  }
  if (v4)
  {
    -[IMFMFSession fmlSession](self, "fmlSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = (void *)MEMORY[0x1E0C99E60];
      -[IMFMFSession fmlSession](self, "fmlSession");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cachedFriendsFollowingMyLocation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setWithArray:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        objc_msgSend(MEMORY[0x1E0C99E60], "__im_findMyHandlesWithFMLFriends:", v12);
      else
        objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "containsObject:", v4);
      goto LABEL_12;
    }
  }
  v16 = 0;
LABEL_13:

  return v16;
}

- (BOOL)_canShareLocationWithFMLHandle:(id)a3 isFromGroup:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  NSObject *v12;
  const __CFString *v13;
  const __CFString *v14;
  NSObject *v15;
  int v17;
  id v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6
    && (-[IMFMFSession fmlSession](self, "fmlSession"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_opt_respondsToSelector(),
        v7,
        (v8 & 1) != 0))
  {
    -[IMFMFSession fmlSession](self, "fmlSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "cachedCanShareLocationWithHandle:isFromGroup:", v6, v4);

    v11 = v10 == 0;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = CFSTR("NO");
        v17 = 138413058;
        v18 = v6;
        if (v4)
          v14 = CFSTR("YES");
        else
          v14 = CFSTR("NO");
        v20 = v14;
        v19 = 2112;
        if (!v10)
          v13 = CFSTR("YES");
        v21 = 2048;
        v22 = v10;
        v23 = 2112;
        v24 = v13;
        _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "FindMyLocateSession cachedCanShareLocationWithHandle: %@ isGroup: %@ shareState: %lu canShare: %@", (uint8_t *)&v17, 0x2Au);
      }

    }
  }
  else
  {
    IMLogHandleForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1A21986CC();

    v11 = 0;
  }

  return v11;
}

- (BOOL)chatHasParticipantsFollowingMyLocation:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  BOOL v24;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "chatStyle");
  if (v5 == 45)
  {
    v6 = 0;
  }
  else
  {
    -[IMFMFSession fmfGroupIdGroup](self, "fmfGroupIdGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[IMFMFSession _callerIDForChat:](self, "_callerIDForChat:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v4, "participants");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v36;
    v26 = v4;
    v27 = v7;
    while (2)
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v36 != v29)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isFindMyLocateSessionEnabled");

        if (v11)
        {
          v12 = v6;
          v33 = 0u;
          v34 = 0u;
          v31 = 0u;
          v32 = 0u;
          objc_msgSend(v9, "findMySiblingHandles");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v32;
            while (2)
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v32 != v16)
                  objc_enumerationMutation(v13);
                objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "fmlHandle");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = -[IMFMFSession _canShareLocationWithFMLHandle:isFromGroup:](self, "_canShareLocationWithFMLHandle:isFromGroup:", v18, v5 != 45);

                if (v19)
                {

                  v24 = 1;
                  v6 = v12;
                  v4 = v26;
                  v7 = v27;
                  goto LABEL_26;
                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
              if (v15)
                continue;
              break;
            }
          }

          v6 = v12;
          v7 = v27;
        }
        else
        {
          objc_msgSend(v9, "findMyHandle");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "fmfHandle");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            -[IMFMFSession session](self, "session");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "canShareLocationWithHandle:groupId:callerId:", v21, v6, v7);

            if ((v23 & 1) != 0)
            {
              v24 = 1;
              v4 = v26;
              goto LABEL_26;
            }
          }
        }
      }
      v24 = 0;
      v4 = v26;
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v28)
        continue;
      break;
    }
  }
  else
  {
    v24 = 0;
  }
LABEL_26:

  return v24;
}

- (BOOL)allChatParticipantsFollowingMyLocation:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "chatStyle");
  if (v5 == 45)
  {
    v30 = 0;
  }
  else
  {
    -[IMFMFSession fmfGroupIdGroup](self, "fmfGroupIdGroup");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[IMFMFSession _callerIDForChat:](self, "_callerIDForChat:", v4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v4, "participants");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v37;
    v9 = 0x1E0D39000uLL;
    v27 = v4;
    while (2)
    {
      v10 = 0;
      v28 = v7;
      do
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v10);
        objc_msgSend(*(id *)(v9 + 2112), "sharedFeatureFlags");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isFindMyLocateSessionEnabled");

        if (v13)
        {
          v14 = v8;
          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          objc_msgSend(v11, "findMySiblingHandles");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v33;
            while (2)
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v33 != v18)
                  objc_enumerationMutation(v15);
                objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "fmlHandle");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = -[IMFMFSession _canShareLocationWithFMLHandle:isFromGroup:](self, "_canShareLocationWithFMLHandle:isFromGroup:", v20, v5 != 45);

                if (v21)
                {

                  v8 = v14;
                  v9 = 0x1E0D39000;
                  v7 = v28;
                  goto LABEL_23;
                }
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
              if (v17)
                continue;
              break;
            }
          }

LABEL_28:
          LOBYTE(v23) = 0;
LABEL_29:
          v4 = v27;
          goto LABEL_30;
        }
        objc_msgSend(v11, "findMyHandle");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "fmfHandle");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
          goto LABEL_29;
        -[IMFMFSession session](self, "session");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "canShareLocationWithHandle:groupId:callerId:", v23, v30, v29);

        if (!v25)
          goto LABEL_28;
LABEL_23:
        ++v10;
      }
      while (v10 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      LOBYTE(v23) = 1;
      v4 = v27;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    LOBYTE(v23) = 1;
  }
LABEL_30:

  return (char)v23;
}

- (id)timedOfferExpirationForChat:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "chatStyle") == 45)
    -[IMFMFSession fmfGroupIdOneToOne](self, "fmfGroupIdOneToOne");
  else
    -[IMFMFSession fmfGroupIdGroup](self, "fmfGroupIdGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMFMFSession _callerIDForChat:](self, "_callerIDForChat:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v24 = v4;
  objc_msgSend(v4, "participants");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v28;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "findMyHandle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isFindMyLocateSessionEnabled");

        if (!v13)
        {
          -[IMFMFSession session](self, "session");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "fmfHandle");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "getOfferExpirationForHandle:groupId:callerId:", v19, v5, v25);
          v20 = objc_claimAutoreleasedReturnValue();
LABEL_14:
          v21 = (void *)v20;

          if (!v8)
            goto LABEL_18;
          goto LABEL_15;
        }
        objc_msgSend(v11, "fmlHandle");
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)v14;
          -[IMFMFSession fmlSession](self, "fmlSession");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_opt_respondsToSelector();

          if ((v17 & 1) != 0)
          {
            -[IMFMFSession fmlSession](self, "fmlSession");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "fmlHandle");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "cachedOfferExpirationForHandle:groupId:", v19, v5);
            v20 = objc_claimAutoreleasedReturnValue();
            goto LABEL_14;
          }
        }
        v21 = 0;
        if (!v8)
        {
LABEL_18:
          v8 = v21;
          goto LABEL_19;
        }
LABEL_15:
        if (objc_msgSend(v21, "compare:", v8) == 1)
        {
          v22 = v21;

          v8 = v22;
        }
LABEL_19:

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (!v7)
        goto LABEL_23;
    }
  }
  v8 = 0;
LABEL_23:

  return v8;
}

- (void)_updateActiveDevice
{
  void *v3;
  int v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFindMyLocateSessionEnabled");

  if (v4)
  {
    -[IMFMFSession fmlSession](self, "fmlSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0)
      return;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Calling FindMyLocateSession getActiveLocationSharingDeviceWithCompletion", buf, 2u);
      }

    }
    -[IMFMFSession fmlSession](self, "fmlSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1A2137878;
    v10[3] = &unk_1E4722E18;
    v10[4] = self;
    objc_msgSend(v8, "getActiveLocationSharingDeviceWithCompletion:", v10);
  }
  else
  {
    -[IMFMFSession session](self, "session");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1A21379F4;
    v9[3] = &unk_1E4722E40;
    v9[4] = self;
    objc_msgSend(v8, "getActiveLocationSharingDevice:", v9);
  }

}

- (void)makeThisDeviceActiveDevice
{
  void *v3;
  int v4;
  NSObject *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFindMyLocateSessionEnabled");

  if (v4)
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1A2198790();

  }
  else
  {
    -[IMFMFSession session](self, "session");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setActiveDevice:completion:", 0, &unk_1E4722E60);

  }
}

- (void)didReceiveLocation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "FMF didReceiveLocation %@", (uint8_t *)&v8, 0xCu);
    }

  }
  objc_msgSend(v4, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMFindMyHandle handleWithFMFHandle:](IMFindMyHandle, "handleWithFMFHandle:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMFMFSession didReceiveLocationForHandle:](self, "didReceiveLocationForHandle:", v7);
}

- (void)didReceiveLocationForHandle:(id)a3
{
  -[IMFMFSession _postNotification:object:userInfo:](self, "_postNotification:object:userInfo:", CFSTR("__kIMFMFSessionLocationReceivedNotification"), a3, 0);
}

- (void)friendshipRequestReceived:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "FMF friendshipRequestReceived %@", (uint8_t *)&v8, 0xCu);
    }

  }
  objc_msgSend(v4, "fromHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMFindMyHandle handleWithFMFHandle:](IMFindMyHandle, "handleWithFMFHandle:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMFMFSession _postRelationshipStatusDidChangeNotificationWithIMFindMyHandle:](self, "_postRelationshipStatusDidChangeNotificationWithIMFindMyHandle:", v7);
}

- (void)friendshipWasRemoved:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "FMF friendshipWasRemoved %@", (uint8_t *)&v7, 0xCu);
    }

  }
  +[IMFindMyHandle handleWithFMFHandle:](IMFindMyHandle, "handleWithFMFHandle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMFMFSession _postRelationshipStatusDidChangeNotificationWithIMFindMyHandle:](self, "_postRelationshipStatusDidChangeNotificationWithIMFindMyHandle:", v6);

}

- (void)didStartSharingMyLocationWithHandle:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "FMF didStartSharingMyLocationWithHandle %@", (uint8_t *)&v7, 0xCu);
    }

  }
  +[IMFindMyHandle handleWithFMFHandle:](IMFindMyHandle, "handleWithFMFHandle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMFMFSession _postRelationshipStatusDidChangeNotificationWithIMFindMyHandle:](self, "_postRelationshipStatusDidChangeNotificationWithIMFindMyHandle:", v6);

}

- (void)didStopSharingMyLocationWithHandle:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "FMF didStopSharingMyLocationWithHandle %@", (uint8_t *)&v7, 0xCu);
    }

  }
  +[IMFindMyHandle handleWithFMFHandle:](IMFindMyHandle, "handleWithFMFHandle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMFMFSession _postRelationshipStatusDidChangeNotificationWithIMFindMyHandle:](self, "_postRelationshipStatusDidChangeNotificationWithIMFindMyHandle:", v6);

}

- (void)didStartAbilityToGetLocationForHandle:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "FMF didStartAbilityToGetLocationForHandle %@", (uint8_t *)&v7, 0xCu);
    }

  }
  +[IMFindMyHandle handleWithFMFHandle:](IMFindMyHandle, "handleWithFMFHandle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMFMFSession _postRelationshipStatusDidChangeNotificationWithIMFindMyHandle:](self, "_postRelationshipStatusDidChangeNotificationWithIMFindMyHandle:", v6);

}

- (void)didStopAbilityToGetLocationForHandle:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "FMF didStopAbilityToGetLocationForHandle %@", (uint8_t *)&v7, 0xCu);
    }

  }
  +[IMFindMyHandle handleWithFMFHandle:](IMFindMyHandle, "handleWithFMFHandle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMFMFSession _postRelationshipStatusDidChangeNotificationWithIMFindMyHandle:](self, "_postRelationshipStatusDidChangeNotificationWithIMFindMyHandle:", v6);

}

- (void)didChangeActiveLocationSharingDevice:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "FMF didChangeActiveLocationSharingDevice %@", (uint8_t *)&v6, 0xCu);
    }

  }
  -[IMFMFSession _updateActiveDevice](self, "_updateActiveDevice");

}

- (id)_bestAccountForAddresses:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  +[IMService iMessageService](IMServiceImpl, "iMessageService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IMPreferredSendingAccountForAddressesWantsGroupWithFallbackService(v3, 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "_isUsableForSending") & 1) == 0)
  {
    +[IMService smsService](IMServiceImpl, "smsService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "accountsForService:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "__imFirstObject");
      v9 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v9;
    }

  }
  return v5;
}

- (void)_startSharingWithFMLHandles:(id)a3 inChat:(id)a4 withDuration:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  int64_t v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  int64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "joinState"))
  {
    objc_msgSend(v9, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMFMFSession setEstablishingAccountID:](self, "setEstablishingAccountID:", v11);

    v12 = objc_msgSend(v9, "chatStyle");
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v8;
        v24 = 2048;
        v25 = a5;
        _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "_startSharingWithFMLHandles calling sendFriendshipOfferToHandles: %@, with duration: %ld", buf, 0x16u);
      }

    }
    -[IMFMFSession fmlSession](self, "fmlSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[IMFMFSession fmlSession](self, "fmlSession");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "allObjects");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = sub_1A2138848;
      v19[3] = &unk_1E4722E88;
      v20 = v8;
      v21 = a5;
      objc_msgSend(v16, "sendFriendshipOfferToHandles:expiration:isFromGroup:completion:", v17, a5, v12 != 45, v19);

    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v18, OS_LOG_TYPE_INFO, "_startSharingWithFMLHandles not sharing because we've left the chat", buf, 2u);
    }

  }
}

- (void)_startSharingWithFMFHandles:(id)a3 inChat:(id)a4 untilDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "joinState"))
  {
    objc_msgSend(v9, "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMFMFSession setEstablishingAccountID:](self, "setEstablishingAccountID:", v12);

    if (objc_msgSend(v9, "chatStyle") == 45)
      -[IMFMFSession fmfGroupIdOneToOne](self, "fmfGroupIdOneToOne");
    else
      -[IMFMFSession fmfGroupIdGroup](self, "fmfGroupIdGroup");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMFMFSession _callerIDForChat:](self, "_callerIDForChat:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        v26 = v8;
        v27 = 2112;
        v28 = v10;
        v29 = 2112;
        v30 = v15;
        v31 = 2112;
        v32 = v14;
        _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "willSendFriendshipOfferToHandles %@ untilDate %@ callerId %@ groupId %@", buf, 0x2Au);
      }

    }
    -[IMFMFSession session](self, "session");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1A2138C50;
    v20[3] = &unk_1E4722EB0;
    v21 = v8;
    v22 = v10;
    v23 = v15;
    v24 = v14;
    v18 = v14;
    v19 = v15;
    objc_msgSend(v17, "sendFriendshipOfferToHandles:groupId:callerId:endDate:completion:", v21, v18, v19, v22, v20);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "_startSharingWithFMFHandles not sharing because we've left the chat", buf, 2u);
    }

  }
}

- (void)_stopSharingWithFMFHandles:(id)a3 inChat:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "chatStyle") == 45)
    -[IMFMFSession fmfGroupIdOneToOne](self, "fmfGroupIdOneToOne");
  else
    -[IMFMFSession fmfGroupIdGroup](self, "fmfGroupIdGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMFMFSession _callerIDForChat:](self, "_callerIDForChat:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v20 = v6;
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "willStopSharingMyLocationWithHandles %@ callerId %@ groupId %@", buf, 0x20u);
    }

  }
  -[IMFMFSession session](self, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1A2138F68;
  v15[3] = &unk_1E4722ED8;
  v16 = v6;
  v17 = v9;
  v18 = v8;
  v12 = v8;
  v13 = v9;
  v14 = v6;
  objc_msgSend(v11, "stopSharingMyLocationWithHandles:groupId:callerId:completion:", v14, v12, v13, v15);

}

- (void)_stopSharingWithFMLHandles:(id)a3 inChat:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  void *v10;
  char v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  BOOL v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "_stopSharingWithFMLHandles %@ inChat: %@", buf, 0x16u);
    }

  }
  v9 = objc_msgSend(v7, "chatStyle");
  if (objc_msgSend(v6, "count"))
  {
    -[IMFMFSession fmlSession](self, "fmlSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[IMFMFSession fmlSession](self, "fmlSession");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = sub_1A2139248;
      v13[3] = &unk_1E4722F00;
      v14 = v6;
      v15 = v9 != 45;
      objc_msgSend(v12, "stopSharingLocationWith:isFromGroup:completion:", v14, v9 != 45, v13);

    }
  }

}

- (id)_callerIDForChat:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "lastAddressedHandleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v6 = (void *)MEMORY[0x1A858292C](CFSTR("FMFHandle"), CFSTR("FMF"));
  v7 = 0;
  if (v4 && v6)
  {
    objc_msgSend(v6, "handleWithId:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)_postRelationshipStatusDidChangeNotificationWithIMFindMyHandle:(id)a3
{
  -[IMFMFSession _postNotification:object:userInfo:](self, "_postNotification:object:userInfo:", CFSTR("__kIMFMFSessionRelationshipStatusDidChangeNotification"), a3, 0);
}

- (void)_postNotification:(id)a3 object:(id)a4 userInfo:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138412802;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Posting FMF notification: %@  object: %@ userInfo: %@", (uint8_t *)&v12, 0x20u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "__mainThreadPostNotificationName:object:userInfo:", v7, v8, v9);

}

- (Class)__FMFSessionClass
{
  if (qword_1EE65F300 != -1)
    dispatch_once(&qword_1EE65F300, &unk_1E4722F20);
  return (Class)(id)qword_1EE65F2F8;
}

- (Class)__FMLSessionClass
{
  if (qword_1EE65EAF8 != -1)
    dispatch_once(&qword_1EE65EAF8, &unk_1E4722F40);
  return (Class)(id)qword_1EE65EAC8;
}

- (id)fmfGroupIdOneToOne
{
  if (qword_1EE65F6F0 != -1)
    dispatch_once(&qword_1EE65F6F0, &unk_1E4722F60);
  return (id)qword_1EE65F6E8;
}

- (id)fmfGroupIdGroup
{
  if (qword_1EE65F700 != -1)
    dispatch_once(&qword_1EE65F700, &unk_1E4722F80);
  return (id)qword_1EE65F6F8;
}

- (FMFSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (IMFindMyDevice)activeDevice
{
  return self->_activeDevice;
}

- (void)setActiveDevice:(id)a3
{
  objc_storeStrong((id *)&self->_activeDevice, a3);
}

- (NSString)establishingAccountID
{
  return self->_establishingAccountID;
}

- (void)setEstablishingAccountID:(id)a3
{
  objc_storeStrong((id *)&self->_establishingAccountID, a3);
}

- (id)fmlSession
{
  return self->_fmlSession;
}

- (void)setFmlSession:(id)a3
{
  objc_storeStrong(&self->_fmlSession, a3);
}

- (unint64_t)fmfProvisionedState
{
  return self->_fmfProvisionedState;
}

- (void)setFmfProvisionedState:(unint64_t)a3
{
  self->_fmfProvisionedState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fmlSession, 0);
  objc_storeStrong((id *)&self->_establishingAccountID, 0);
  objc_storeStrong((id *)&self->_activeDevice, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
