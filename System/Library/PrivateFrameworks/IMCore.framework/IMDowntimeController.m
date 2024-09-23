@implementation IMDowntimeController

- (BOOL)allowedToShowConversationForChat:(id)a3 sync:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _BOOL4 v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  const __CFString *v20;
  int v22;
  id v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = +[IMDowntimeController isContactLimitsFeatureEnabled](IMDowntimeController, "isContactLimitsFeatureEnabled");
  LOBYTE(v8) = 1;
  if (v6 && v7)
  {
    objc_msgSend(v6, "participants");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10
      && (v4
       || (-[IMDowntimeController policyCache](self, "policyCache"),
           v11 = (void *)objc_claimAutoreleasedReturnValue(),
           v12 = objc_msgSend(v11, "isFetchingCommLimitsPolicyForChat:", v6),
           v11,
           (v12 & 1) == 0)))
    {
      -[IMDowntimeController policyCache](self, "policyCache");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "conversationContextForChat:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        LOBYTE(v8) = objc_msgSend(v14, "allowedByScreenTime");
      }
      else
      {
        objc_msgSend(v6, "participantHandleIDs");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        IMHashOfHashesForStringArray(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[IMDowntimeController policyCache](self, "policyCache");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addTrackingForChat:participantIDsHash:", v6, v16);

        -[IMDowntimeController _addObserversToChat:](self, "_addObserversToChat:", v6);
        objc_msgSend(v6, "participantHandleIDs");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[IMDowntimeController _allowedToShowConversationWithHandleIDs:sync:context:participantIDsHash:trackingChat:](self, "_allowedToShowConversationWithHandleIDs:sync:context:participantIDsHash:trackingChat:", v18, v4, 0, v16, v6);

        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v20 = CFSTR("NO");
            v22 = 138412802;
            v23 = v6;
            v24 = 2112;
            if (v8)
              v20 = CFSTR("YES");
            v25 = v20;
            v26 = 2112;
            v27 = v16;
            _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, "Subscribed to Comm Limit policy for chat: %@ allowed: %@ participantIDsHash: %@", (uint8_t *)&v22, 0x20u);
          }

        }
      }

    }
    else
    {
      LOBYTE(v8) = 1;
    }
  }

  return v8;
}

- (IMCommLimitsPolicyCache)policyCache
{
  return self->_policyCache;
}

+ (BOOL)isContactLimitsFeatureEnabled
{
  return 1;
}

- (void)setPolicyCache:(id)a3
{
  objc_storeStrong((id *)&self->_policyCache, a3);
}

- (void)setEmergencyNumbers:(id)a3
{
  NSSet *v4;
  NSSet *stateLock_emergencyNumbersSet;

  v4 = (NSSet *)a3;
  os_unfair_lock_lock(&self->_stateLock);
  stateLock_emergencyNumbersSet = self->_stateLock_emergencyNumbersSet;
  self->_stateLock_emergencyNumbersSet = v4;

  os_unfair_lock_unlock(&self->_stateLock);
}

- (void)setAppPolicyMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_appPolicyMonitor, a3);
}

- (OS_dispatch_queue)screenTimeDispatchQueue
{
  return self->_screenTimeDispatchQueue;
}

- (void)registerForScreenTimeNotifications
{
  NSObject *v3;
  uint8_t v4[16];
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  if (+[IMDowntimeController isContactLimitsFeatureEnabled](IMDowntimeController, "isContactLimitsFeatureEnabled"))
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x2020000000;
    v9 = 0;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = sub_1A200BD10;
    v5[3] = &unk_1E4721B78;
    v5[4] = self;
    v5[5] = &v6;
    -[IMDowntimeController getSTConversation:](self, "getSTConversation:", v5);
    if (*((_BYTE *)v7 + 24))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v3 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v4 = 0;
          _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Delaying registering for screentime state change notification as setup is not finished.", v4, 2u);
        }

      }
    }
    else
    {
      -[IMDowntimeController _doRegisterForScreenTimeNotifications](self, "_doRegisterForScreenTimeNotifications");
    }
    _Block_object_dispose(&v6, 8);
  }
}

- (void)providersChangedForProviderManager:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (+[IMDowntimeController isContactLimitsFeatureEnabled](IMDowntimeController, "isContactLimitsFeatureEnabled", a3))
  {
    v4 = (void *)objc_opt_class();
    -[IMDowntimeController callProviderManager](self, "callProviderManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fetchEmergencyNumbersSetWithProviderManager:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    -[IMDowntimeController setEmergencyNumbers:](self, "setEmergencyNumbers:", v6);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  objc_super v14;

  v10 = a4;
  if ((void *)qword_1EE65D178 == a6)
  {
    if (+[IMDowntimeController isContactLimitsFeatureEnabled](IMDowntimeController, "isContactLimitsFeatureEnabled"))
    {
      v11 = v10;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = sub_1A200B5AC;
      v12[3] = &unk_1E471E7C8;
      v12[4] = self;
      v13 = v11;
      dispatch_async(MEMORY[0x1E0C80D38], v12);

    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)IMDowntimeController;
    -[IMDowntimeController observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, a3, v10, a5, a6);
  }

}

- (void)initializeContext:(id)a3 participantIDsHash:(id)a4 trackingChat:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a5;
  v9 = a4;
  -[IMDowntimeController policyCache](self, "policyCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addTrackingForConversationContext:forParticipantIDsHash:", v11, v9);

  objc_msgSend(v11, "addObserver:forKeyPath:options:context:", self, CFSTR("allowedByScreenTime"), 5, qword_1EE65D178);
  if (v8)
    objc_msgSend(v8, "setAllowedByScreenTime:", objc_msgSend(v11, "allowedByScreenTime"));

}

- (IMDowntimeController)init
{
  IMDowntimeController *v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *screenTimeDispatchQueue;
  dispatch_queue_t v10;
  OS_dispatch_queue *setupDispatchQueue;
  TUCallProviderManager *v12;
  TUCallProviderManager *callProviderManager;
  NSObject *v14;
  uint64_t v15;
  NSMutableDictionary *bundleIDPolicyMap;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[8];
  _QWORD block[4];
  IMDowntimeController *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)IMDowntimeController;
  v2 = -[IMDowntimeController init](&v29, sel_init);
  if (v2)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Setting up screentime downtime controller", buf, 2u);
      }

    }
    v4 = +[IMDowntimeController isContactLimitsFeatureEnabled](IMDowntimeController, "isContactLimitsFeatureEnabled");
    v5 = MEMORY[0x1E0C809B0];
    if (v4)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Contact Limits Feature Active", buf, 2u);
        }

      }
      v2->_stateLock._os_unfair_lock_opaque = 0;
      v7 = (void *)objc_opt_new();
      -[IMDowntimeController setPolicyCache:](v2, "setPolicyCache:", v7);

      v8 = dispatch_queue_create("com.apple.messages.private.IMDowntimeController", 0);
      screenTimeDispatchQueue = v2->_screenTimeDispatchQueue;
      v2->_screenTimeDispatchQueue = (OS_dispatch_queue *)v8;

      v10 = dispatch_queue_create("com.apple.messages.private.IMDowntimeController.setup", 0);
      setupDispatchQueue = v2->_setupDispatchQueue;
      v2->_setupDispatchQueue = (OS_dispatch_queue *)v10;

      v12 = (TUCallProviderManager *)objc_alloc_init(MEMORY[0x1E0DBD1E0]);
      callProviderManager = v2->_callProviderManager;
      v2->_callProviderManager = v12;

      -[TUCallProviderManager addDelegate:queue:](v2->_callProviderManager, "addDelegate:queue:", v2, MEMORY[0x1E0C80D38]);
      v14 = v2->_setupDispatchQueue;
      block[0] = v5;
      block[1] = 3221225472;
      block[2] = sub_1A200D0B4;
      block[3] = &unk_1E471E348;
      v28 = v2;
      dispatch_async(v14, block);

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    bundleIDPolicyMap = v2->_bundleIDPolicyMap;
    v2->_bundleIDPolicyMap = (NSMutableDictionary *)v15;

    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, v2);
    dispatch_get_global_queue(-2, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v24[0] = v5;
    v24[1] = 3221225472;
    v24[2] = sub_1A200CFA0;
    v24[3] = &unk_1E471E460;
    objc_copyWeak(&v25, (id *)buf);
    dispatch_async(v17, v24);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v5;
    v22[1] = 3221225472;
    v22[2] = sub_1A200CF38;
    v22[3] = &unk_1E471E7A0;
    objc_copyWeak(&v23, (id *)buf);
    v20 = (id)objc_msgSend(v18, "addObserverForName:object:queue:usingBlock:", CFSTR("__kIMBalloonPluginManagerInstalledAppsChangedNotification"), 0, v19, v22);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
  return v2;
}

- (void)getSTConversation:(id)a3
{
  os_unfair_lock_s *p_stateLock;
  void (**v5)(id, STConversation *);

  p_stateLock = &self->_stateLock;
  v5 = (void (**)(id, STConversation *))a3;
  os_unfair_lock_lock(p_stateLock);
  v5[2](v5, self->_stateLock_STConversation);

  os_unfair_lock_unlock(p_stateLock);
}

- (void)fetchScreenTimeAppPolicy
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  IMDowntimeController *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[IMBalloonPluginManager sharedInstance](IMBalloonPluginManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "allPlugins");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1A1FF908C;
  v15[3] = &unk_1E4721C08;
  v7 = v4;
  v16 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v15);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v7;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Fetching application downtime policies for bundleIDs: %@", buf, 0xCu);
    }

  }
  -[IMDowntimeController appPolicyMonitor](self, "appPolicyMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = sub_1A20E45F4;
  v12[3] = &unk_1E4721C30;
  v13 = v7;
  v14 = self;
  v11 = v7;
  objc_msgSend(v9, "requestPoliciesForBundleIdentifiers:completionHandler:", v10, v12);

}

- (id)emergencyNumbers
{
  os_unfair_lock_s *p_stateLock;
  NSSet *v4;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = self->_stateLock_emergencyNumbersSet;
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (TUCallProviderManager)callProviderManager
{
  return self->_callProviderManager;
}

- (NSMutableDictionary)bundleIDPolicyMap
{
  return self->_bundleIDPolicyMap;
}

- (DMFApplicationPolicyMonitor)appPolicyMonitor
{
  return self->_appPolicyMonitor;
}

- (void)_doRegisterForScreenTimeNotifications
{
  NSObject *v3;
  const char *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void (*v10)(void *);
  NSObject *v11;
  uint8_t v12[4];
  void *v13;
  uint8_t buf[16];
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = qword_1EE65F3B8;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Registering for screentime state change notification %s", buf, 0xCu);
    }

  }
  v4 = (const char *)qword_1EE65F3B8;
  if (!qword_1EE65F3B8)
  {
    *(_OWORD *)buf = xmmword_1E4721B98;
    v15 = *(_OWORD *)off_1E4721BA8;
    v16 = 635;
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = IMFileLocationTrimFileName();
    v7 = v16;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E4725068);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Unexpected nil '%@' in %s at %s:%d. %@"), CFSTR("IMSTManagementStateStateDidChangeNotificationName"), "-[IMDowntimeController _doRegisterForScreenTimeNotifications]", v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v10)
    {
      v10(v9);
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v12 = 138412290;
        v13 = v9;
        _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", v12, 0xCu);
      }

    }
    v4 = (const char *)qword_1EE65F3B8;
  }
  self->_needsNotificationsRegistering = 0;
  *(_DWORD *)buf = 0;
  notify_register_dispatch(v4, (int *)buf, MEMORY[0x1E0C80D38], &unk_1E4721BE0);
}

- (BOOL)_allowedToShowConversationWithHandleIDs:(id)a3 sync:(BOOL)a4 context:(id *)a5 participantIDsHash:(id)a6 trackingChat:(id)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;
  void *v17;
  id v18;
  uint64_t (**v19)(void *, void *, uint64_t);
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *setupDispatchQueue;
  void *v27;
  id *v29;
  id v30;
  _QWORD block[5];
  uint64_t (**v32)(void *, void *, uint64_t);
  _QWORD aBlock[4];
  id v34;
  id v35;
  IMDowntimeController *v36;
  id v37;
  uint64_t *v38;
  uint64_t *v39;
  BOOL v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;

  v10 = a4;
  v12 = a3;
  v13 = a6;
  v14 = a7;
  if (+[IMDowntimeController isContactLimitsFeatureEnabled](IMDowntimeController, "isContactLimitsFeatureEnabled"))
  {
    v29 = a5;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      IMHashOfHashesForStringArray(v12);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v15;
    v45 = 0;
    v46 = &v45;
    v47 = 0x3032000000;
    v48 = sub_1A200AE64;
    v49 = sub_1A200ACA4;
    v50 = 0;
    v41 = 0;
    v42 = &v41;
    v43 = 0x2020000000;
    v44 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1A200D528;
    aBlock[3] = &unk_1E4721B30;
    v34 = v12;
    v30 = v17;
    v35 = v30;
    v36 = self;
    v38 = &v41;
    v39 = &v45;
    v40 = v10;
    v18 = v14;
    v37 = v18;
    v19 = (uint64_t (**)(void *, void *, uint64_t))_Block_copy(aBlock);
    -[IMDowntimeController emergencyNumbers](self, "emergencyNumbers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDowntimeController STConversation](self, "STConversation");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v20 && v21)
    {
      v16 = v19[2](v19, v20, v21);
    }
    else
    {
      if (v10)
      {
        dispatch_sync((dispatch_queue_t)self->_setupDispatchQueue, &unk_1E4721B50);
        -[IMDowntimeController emergencyNumbers](self, "emergencyNumbers");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDowntimeController STConversation](self, "STConversation");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v19[2](v19, v23, (uint64_t)v24);

      }
      else
      {
        -[IMDowntimeController policyCache](self, "policyCache");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addSentinelContextForParticipantIDsHash:", v30);

        setupDispatchQueue = self->_setupDispatchQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_1A20E4134;
        block[3] = &unk_1E471E8B8;
        block[4] = self;
        v32 = v19;
        dispatch_async(setupDispatchQueue, block);
        v16 = 1;
        v23 = v32;
      }

    }
    if (v29)
      *v29 = objc_retainAutorelease((id)v46[5]);
    if (v18)
    {
      if (*((_BYTE *)v42 + 24))
      {
        v27 = (void *)v46[5];
        if (v27)
          objc_msgSend(v18, "setAllowedByScreenTime:", objc_msgSend(v27, "allowedByScreenTime"));
      }
    }

    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(&v45, 8);

  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (void)_addObserversToChat:(id)a3
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB37D0];
    v5 = a3;
    objc_msgSend(v4, "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("__kIMChatParticipantsDidChangeNotification"), v5);
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__participantsForChatDidChange_, CFSTR("__kIMChatParticipantsDidChangeNotification"), v5);

  }
}

- (id)STConversation
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1A200AE64;
  v9 = sub_1A200ACA4;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1A200C94C;
  v4[3] = &unk_1E4721AB8;
  v4[4] = &v5;
  -[IMDowntimeController getSTConversation:](self, "getSTConversation:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

+ (id)sharedInstance
{
  if (qword_1ECF125B0 != -1)
    dispatch_once(&qword_1ECF125B0, &unk_1E471DEF8);
  return (id)qword_1ECF12610;
}

+ (id)fetchEmergencyNumbersSetWithProviderManager:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "emergencyProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emergencyHandles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "__imArrayByApplyingBlock:", &unk_1E4721A90);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)allowedToShowConversationWithHandleIDs:(id)a3 sync:(BOOL)a4 context:(id *)a5
{
  return MEMORY[0x1E0DE7D20](self, sel_allowedToShowConversationWithHandleIDs_sync_context_participantIDsHash_);
}

- (BOOL)allowedToShowConversationWithHandleIDs:(id)a3 sync:(BOOL)a4 context:(id *)a5 participantIDsHash:(id)a6
{
  return -[IMDowntimeController _allowedToShowConversationWithHandleIDs:sync:context:participantIDsHash:trackingChat:](self, "_allowedToShowConversationWithHandleIDs:sync:context:participantIDsHash:trackingChat:", a3, a4, a5, a6, 0);
}

- (BOOL)isDowntimeLimited
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  IMHashOfHashesForStringArray(&unk_1E475EEF8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDowntimeController policyCache](self, "policyCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextForParticipantIDsHash:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5
    || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5 == v6))
  {
    v8 = (void *)objc_msgSend(objc_alloc((Class)qword_1EE65F3A8), "initWithBundleIdentifier:", CFSTR("com.apple.MobileSMS"));
    objc_msgSend(v8, "allowableByContactsHandles:", &unk_1E475EEF8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDowntimeController initializeContext:participantIDsHash:trackingChat:](self, "initializeContext:participantIDsHash:trackingChat:", v9, v3, 0);
    v7 = objc_msgSend(v9, "applicationCurrentlyLimited");

  }
  else
  {
    v7 = objc_msgSend(v5, "applicationCurrentlyLimited");
  }

  return v7;
}

- (BOOL)isEmergencyHandle:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0CB3500];
  v5 = a3;
  objc_msgSend(v4, "whitespaceAndNewlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDowntimeController emergencyNumbers](self, "emergencyNumbers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v10, "containsObject:", v9);

  return (char)v8;
}

- (void)_participantsForChatDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  if (+[IMDowntimeController isContactLimitsFeatureEnabled](IMDowntimeController, "isContactLimitsFeatureEnabled"))
  {
    objc_msgSend(v4, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[IMDowntimeController conversationContextForChat:](self, "conversationContextForChat:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDowntimeController policyCache](self, "policyCache");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeTrackingForChat:", v5);

      objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("allowedByScreenTime"), qword_1EE65D178);
      -[IMDowntimeController allowedToShowConversationForChat:sync:](self, "allowedToShowConversationForChat:sync:", v5, 0);

    }
    else
    {
      IMLogHandleForCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1A2197AE8((uint64_t)v4, v8);

    }
  }

}

- (id)conversationContextForChat:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (+[IMDowntimeController isContactLimitsFeatureEnabled](IMDowntimeController, "isContactLimitsFeatureEnabled"))
  {
    -[IMDowntimeController policyCache](self, "policyCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "conversationContextForChat:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)allowedToShowAppExtensionWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  if (!a3)
    return 1;
  v4 = a3;
  -[IMDowntimeController bundleIDPolicyMap](self, "bundleIDPolicyMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "integerValue") == 0;
  else
    v7 = 1;

  return v7;
}

- (void)setCallProviderManager:(id)a3
{
  objc_storeStrong((id *)&self->_callProviderManager, a3);
}

- (void)setScreenTimeDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_screenTimeDispatchQueue, a3);
}

- (OS_dispatch_queue)setupDispatchQueue
{
  return self->_setupDispatchQueue;
}

- (void)setSetupDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_setupDispatchQueue, a3);
}

- (void)setBundleIDPolicyMap:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIDPolicyMap, a3);
}

- (BOOL)isRunningFromMacMessagesApp
{
  return self->_isRunningFromMacMessagesApp;
}

- (void)setIsRunningFromMacMessagesApp:(BOOL)a3
{
  self->_isRunningFromMacMessagesApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appPolicyMonitor, 0);
  objc_storeStrong((id *)&self->_bundleIDPolicyMap, 0);
  objc_storeStrong((id *)&self->_policyCache, 0);
  objc_storeStrong((id *)&self->_setupDispatchQueue, 0);
  objc_storeStrong((id *)&self->_screenTimeDispatchQueue, 0);
  objc_storeStrong((id *)&self->_callProviderManager, 0);
  objc_storeStrong((id *)&self->_stateLock_emergencyNumbersSet, 0);
  objc_storeStrong((id *)&self->_stateLock_STConversation, 0);
}

@end
