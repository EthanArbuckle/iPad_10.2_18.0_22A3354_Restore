@implementation IMFocusStateManager

- (BOOL)shouldDisplayFocusFilterBanner
{
  if (-[IMFocusStateManager deviceSupportsFocusFiltering](self, "deviceSupportsFocusFiltering")
    && -[IMFocusStateManager focusFilterActionIsEnabled](self, "focusFilterActionIsEnabled"))
  {
    return MEMORY[0x1E0DE7D20](self, sel_hasActiveFocusMode);
  }
  else
  {
    return 0;
  }
}

- (BOOL)focusFilterActionIsEnabled
{
  return self->_focusFilterActionIsEnabled;
}

- (BOOL)deviceSupportsFocusFiltering
{
  return 1;
}

- (BOOL)shouldFilterConversationsByFocus
{
  int v3;

  v3 = -[IMFocusStateManager shouldDisplayFocusFilterBanner](self, "shouldDisplayFocusFilterBanner");
  if (v3)
    LOBYTE(v3) = MEMORY[0x1E0DE7D20](self, sel_userSwitchForFocusFilteringIsEnabled);
  return v3;
}

- (void)setRegisteredAsStateUpdateListener:(BOOL)a3
{
  self->_registeredAsStateUpdateListener = a3;
}

- (void)setFocusFilterActionIsEnabled:(BOOL)a3
{
  if (self->_focusFilterActionIsEnabled != a3)
  {
    self->_focusFilterActionIsEnabled = a3;
    -[IMFocusStateManager _notifyDelegatesOfDNDStateChange](self, "_notifyDelegatesOfDNDStateChange");
  }
}

- (void)setDndState:(id)a3
{
  objc_storeStrong((id *)&self->_dndState, a3);
}

- (BOOL)registeredAsStateUpdateListener
{
  return self->_registeredAsStateUpdateListener;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  objc_super v14;
  _QWORD block[5];
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("conversationListFocusFilterActionEnabled")))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_INFO, "Received KVO notification for conversationListFocusFilterActionEnabled", buf, 2u);
      }

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19E24A3DC;
    block[3] = &unk_1E3FB6B98;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)IMFocusStateManager;
    -[IMFocusStateManager observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (IMFocusStateManager)init
{
  IMFocusStateManager *v2;
  NSObject *v3;
  uint64_t v4;
  NSHashTable *delegates;
  objc_super v7;
  uint8_t buf[4];
  IMFocusStateManager *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)IMFocusStateManager;
  v2 = -[IMFocusStateManager init](&v7, sel_init);
  if (v2)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v9 = v2;
        _os_log_impl(&dword_19E239000, v3, OS_LOG_TYPE_INFO, "IMFocusStateManager init: %p", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    delegates = v2->_delegates;
    v2->_delegates = (NSHashTable *)v4;

    v2->_userSwitchForFocusFilteringIsEnabled = 1;
  }
  return v2;
}

- (DNDStateService)dndStateService
{
  DNDStateService *dndStateService;
  DNDStateService *v4;
  DNDStateService *v5;

  dndStateService = self->_dndStateService;
  if (!dndStateService)
  {
    objc_msgSend((id)MEMORY[0x1A1AE7D4C](CFSTR("DNDStateService"), CFSTR("DoNotDisturb")), "serviceForClientIdentifier:", CFSTR("com.apple.messages"));
    v4 = (DNDStateService *)objc_claimAutoreleasedReturnValue();
    v5 = self->_dndStateService;
    self->_dndStateService = v4;

    dndStateService = self->_dndStateService;
  }
  return dndStateService;
}

- (void)addDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint8_t v11[8];
  _QWORD v12[4];
  id v13;
  _BYTE buf[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v4;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Adding IMFocusStateManagerDelegate: %@", buf, 0xCu);
    }

  }
  -[NSHashTable addObject:](self->_delegates, "addObject:", v4);
  if (!-[IMFocusStateManager registeredAsStateUpdateListener](self, "registeredAsStateUpdateListener"))
  {
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    -[IMFocusStateManager dndStateService](self, "dndStateService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_19E24B058;
    v12[3] = &unk_1E3FB6D70;
    objc_copyWeak(&v13, (id *)buf);
    objc_msgSend(v6, "addStateUpdateListener:withCompletionHandler:", self, v12);

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_19E239000, v7, OS_LOG_TYPE_INFO, "Registering for NSUserDefaults KVO.", v11, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "messagesAppDomain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", self, CFSTR("conversationListFocusFilterActionEnabled"), 5, 0);

    objc_msgSend(MEMORY[0x1E0C99EA0], "messagesAppDomain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "conversationListFocusFilterActionEnabled");

    -[IMFocusStateManager _fetchInitialDNDStateSynchronously:](self, "_fetchInitialDNDStateSynchronously:", v10);
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }

}

- (void)_notifyDelegatesOfDNDStateChange
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  void *v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NSHashTable allObjects](self->_delegates, "allObjects");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v3)
  {
    v5 = *(_QWORD *)v12;
    *(_QWORD *)&v4 = 138412290;
    v10 = v4;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v6);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v10;
            v16 = v7;
            _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "Notifying %@ of dnd state change", buf, 0xCu);
          }

        }
        objc_msgSend(v7, "focusStateDidChange", v10, (_QWORD)v11);
        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v3);
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "Finished notifying all delegates of dnd state change", buf, 2u);
    }

  }
}

- (void)_fetchInitialDNDStateSynchronously:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void (**v6)(void *, void *, id);
  NSObject *v7;
  void *v8;
  void *v9;
  void (**v10)(void *, void *, id);
  NSObject *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  void (**v15)(void *, void *, id);
  id v16;
  uint8_t buf[16];
  _QWORD aBlock[4];
  id v19;
  id location;

  v3 = a3;
  location = 0;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_19E24A510;
  aBlock[3] = &unk_1E3FB6D98;
  objc_copyWeak(&v19, &location);
  v6 = (void (**)(void *, void *, id))_Block_copy(aBlock);
  if (v3)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v7, OS_LOG_TYPE_INFO, "Fetching DND state synchronously", buf, 2u);
      }

    }
    -[IMFocusStateManager dndStateService](self, "dndStateService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v8, "queryCurrentStateWithError:", &v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void (**)(void *, void *, id))v16;

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "DND state synchronously received", buf, 2u);
      }

    }
    v6[2](v6, v9, v10);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v12, OS_LOG_TYPE_INFO, "Fetching DND state asynchronously", buf, 2u);
      }

    }
    -[IMFocusStateManager dndStateService](self, "dndStateService");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = sub_19E2A4120;
    v14[3] = &unk_1E3FB6DE8;
    v15 = v6;
    objc_msgSend(v13, "queryCurrentStateWithCompletionHandler:", v14);

    v10 = v15;
  }

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

+ (IMFocusStateManager)sharedManager
{
  if (qword_1ECFC7128 != -1)
    dispatch_once(&qword_1ECFC7128, &unk_1E3FB3668);
  return (IMFocusStateManager *)(id)qword_1ECFC6F68;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  IMFocusStateManager *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v6 = self;
      _os_log_impl(&dword_19E239000, v3, OS_LOG_TYPE_INFO, "IMFocusStateManager dealloc: %p", buf, 0xCu);
    }

  }
  v4.receiver = self;
  v4.super_class = (Class)IMFocusStateManager;
  -[IMFocusStateManager dealloc](&v4, sel_dealloc);
}

- (void)setUserSwitchForFocusFilteringIsEnabled:(BOOL)a3
{
  if (self->_userSwitchForFocusFilteringIsEnabled != a3)
  {
    self->_userSwitchForFocusFilteringIsEnabled = a3;
    -[IMFocusStateManager _notifyDelegatesOfDNDStateChange](self, "_notifyDelegatesOfDNDStateChange");
  }
}

- (id)activeFocusName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[IMFocusStateManager dndState](self, "dndState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeModeConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)activeFocusSymbolName
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  -[IMFocusStateManager dndState](self, "dndState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeModeConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "symbolImageName");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5;
  else
    v6 = CFSTR("moon.fill");
  v7 = v6;

  return v7;
}

- (BOOL)activeFocusModeMatchesConversationWithHandleStrings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[IMFocusStateManager dndState](self, "dndState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeModeConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = +[IMFocusStateManager focusConfiguration:matchesConversationWithHandleStrings:](IMFocusStateManager, "focusConfiguration:matchesConversationWithHandleStrings:", v7, v4);
  return (char)v5;
}

- (BOOL)activeFocusModeMatchesConversationWithHandles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[IMFocusStateManager dndState](self, "dndState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeModeConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = +[IMFocusStateManager focusConfiguration:matchesConversationWithHandles:](IMFocusStateManager, "focusConfiguration:matchesConversationWithHandles:", v7, v4);
  return (char)v5;
}

+ (BOOL)focusConfiguration:(id)a3 matchesConversationWithHandleStrings:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(a1, "_dndContactHandleForAddress:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13), (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v15 = (void *)objc_msgSend(v8, "copy");
  v16 = objc_msgSend(a1, "focusConfiguration:matchesConversationWithHandles:", v6, v15);

  return v16;
}

+ (BOOL)focusConfiguration:(id)a3 matchesConversationWithHandles:(id)a4
{
  return MEMORY[0x1E0DE7D20](a1, sel__shouldDisplayConversationWithHandles_withFocusConfiguration_);
}

- (void)removeDelegate:(id)a3
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
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Removing IMFocusStateManagerDelegate: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  -[NSHashTable removeObject:](self->_delegates, "removeObject:", v4);

}

- (BOOL)hasActiveFocusMode
{
  void *v2;
  void *v3;
  BOOL v4;

  -[IMFocusStateManager dndState](self, "dndState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeModeConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "Received dnd state update: %@", buf, 0xCu);
    }

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_19E2A44C0;
  v10[3] = &unk_1E3FB4EF8;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

+ (BOOL)_shouldDisplayConversationWithHandles:(id)a3 withFocusConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  char v10;
  BOOL v11;

  v6 = a3;
  if (a4)
  {
    v7 = a4;
    objc_msgSend(v7, "senderConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "senderConfigurationType");

    if (v9 == 2)
    {
      v11 = 1;
    }
    else
    {
      if (v9 == 1)
      {
        v10 = objc_msgSend(a1, "_conversationWithHandles:isAllowedInFocusWithInclusiveSenderConfiguration:", v6, v8);
      }
      else
      {
        if (v9)
        {
          v11 = 0;
          goto LABEL_11;
        }
        v10 = objc_msgSend(a1, "_conversationWithHandles:isAllowedInFocusWithExclusiveSenderConfiguration:", v6, v8);
      }
      v11 = v10;
    }
LABEL_11:

    goto LABEL_12;
  }
  v11 = 1;
LABEL_12:

  return v11;
}

+ (BOOL)_conversationWithHandles:(id)a3 isAllowedInFocusWithExclusiveSenderConfiguration:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  BOOL v18;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "allowedContacts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v26;
      v20 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v13 = v6;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v22;
            while (2)
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v22 != v16)
                  objc_enumerationMutation(v13);
                if ((objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "matchesContactHandle:", v12) & 1) != 0)
                {

                  v18 = 1;
                  goto LABEL_21;
                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
              if (v15)
                continue;
              break;
            }
          }

          v10 = v20;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        v18 = 0;
      }
      while (v9);
    }
    else
    {
      v18 = 0;
    }
LABEL_21:

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (BOOL)_conversationWithHandles:(id)a3 isAllowedInFocusWithInclusiveSenderConfiguration:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  BOOL v18;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "deniedContacts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v26;
      v20 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v13 = v6;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v22;
            while (2)
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v22 != v16)
                  objc_enumerationMutation(v13);
                if ((objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "matchesContactHandle:", v12) & 1) != 0)
                {

                  v18 = 0;
                  goto LABEL_21;
                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
              if (v15)
                continue;
              break;
            }
          }

          v10 = v20;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        v18 = 1;
      }
      while (v9);
    }
    else
    {
      v18 = 1;
    }
LABEL_21:

  }
  else
  {
    v18 = 1;
  }

  return v18;
}

+ (id)_dndContactHandleForAddress:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "_appearsToBeEmail"))
    v4 = 1;
  else
    v4 = 2;
  v5 = objc_alloc_init((Class)MEMORY[0x1A1AE7D4C](CFSTR("DNDMutableContactHandle"), CFSTR("DoNotDisturb")));
  objc_msgSend(v5, "setValue:", v3);

  objc_msgSend(v5, "setType:", v4);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (BOOL)userSwitchForFocusFilteringIsEnabled
{
  return self->_userSwitchForFocusFilteringIsEnabled;
}

- (void)setDndStateService:(id)a3
{
  objc_storeStrong((id *)&self->_dndStateService, a3);
}

- (DNDState)dndState
{
  return self->_dndState;
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_delegates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_dndState, 0);
  objc_storeStrong((id *)&self->_dndStateService, 0);
}

@end
