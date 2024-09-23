@implementation MRURouteRecommender

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_25);
  return (id)sharedInstance___sharedInstance;
}

void __37__MRURouteRecommender_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = v0;

}

- (MRURouteRecommender)init
{
  MRURouteRecommender *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *donationQueue;
  NSArray *donatedRoutes;
  uint64_t v7;
  NSUserDefaults *userDefaults;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MRURouteRecommender;
  v2 = -[MRURouteRecommender init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.MRURouteRecommender.IRDonations", v3);
    donationQueue = v2->_donationQueue;
    v2->_donationQueue = (OS_dispatch_queue *)v4;

    *(_QWORD *)&v2->_recommendedRoutesLock._os_unfair_lock_opaque = 0;
    donatedRoutes = v2->_donatedRoutes;
    v2->_donatedRoutes = (NSArray *)MEMORY[0x1E0C9AA60];

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mediaremote"));
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v7;

    -[NSUserDefaults addObserver:forKeyPath:options:context:](v2->_userDefaults, "addObserver:forKeyPath:options:context:", v2, CFSTR("IRContextUpdate"), 0, 0);
    -[MRURouteRecommender initializeSessionWhenAppropriate](v2, "initializeSessionWhenAppropriate");
  }
  return v2;
}

- (id)irCandidateFor:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (objc_class *)MEMORY[0x1E0D3E4E8];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "routeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithCandidateIdentifier:", v6);

  v8 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v4, "nodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "msv_map:", &__block_literal_global_143);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateNodes:", v11);

  return v7;
}

id __38__MRURouteRecommender_irCandidateFor___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (objc_class *)MEMORY[0x1E0D3E500];
  v3 = a2;
  v4 = objc_alloc_init(v2);
  objc_msgSend(v3, "avOutputDeviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAvOutpuDeviceIdentifier:", v5);

  objc_msgSend(v3, "rapportIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRapportIdentifier:", v6);

  objc_msgSend(v3, "idsIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIdsIdentifier:", v7);
  return v4;
}

- (NSArray)recommendedRoutes
{
  os_unfair_lock_s *p_recommendedRoutesLock;
  NSArray *v4;

  p_recommendedRoutesLock = &self->_recommendedRoutesLock;
  os_unfair_lock_lock(&self->_recommendedRoutesLock);
  v4 = self->_recommendedRoutes;
  os_unfair_lock_unlock(p_recommendedRoutesLock);
  return v4;
}

- (void)setRecommendedRoutes:(id)a3
{
  NSArray *v4;
  NSArray *recommendedRoutes;

  v4 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_recommendedRoutesLock);
  recommendedRoutes = self->_recommendedRoutes;
  self->_recommendedRoutes = v4;

  os_unfair_lock_unlock(&self->_recommendedRoutesLock);
}

- (void)updateRecommendations
{
  NSObject *v3;
  _QWORD block[5];

  -[MRURouteRecommender donationQueue](self, "donationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MRURouteRecommender_updateRecommendations__block_invoke;
  block[3] = &unk_1E5818C88;
  block[4] = self;
  dispatch_async(v3, block);

}

void __44__MRURouteRecommender_updateRecommendations__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "session");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "requestCurrentContext");

}

- (NSArray)donatedRoutes
{
  os_unfair_lock_s *p_donatedRoutesLock;
  NSArray *v4;

  p_donatedRoutesLock = &self->_donatedRoutesLock;
  os_unfair_lock_lock(&self->_donatedRoutesLock);
  v4 = self->_donatedRoutes;
  os_unfair_lock_unlock(p_donatedRoutesLock);
  return v4;
}

- (void)setDonatedRoutes:(id)a3
{
  NSArray *v4;
  NSArray *donatedRoutes;

  v4 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_donatedRoutesLock);
  donatedRoutes = self->_donatedRoutes;
  self->_donatedRoutes = v4;

  os_unfair_lock_unlock(&self->_donatedRoutesLock);
}

- (void)addDonatedRoute:(id)a3
{
  os_unfair_lock_s *p_donatedRoutesLock;
  NSArray **p_donatedRoutes;
  NSArray *donatedRoutes;
  NSArray *v7;
  NSArray *v8;
  id v9;

  v9 = a3;
  p_donatedRoutesLock = &self->_donatedRoutesLock;
  os_unfair_lock_lock(&self->_donatedRoutesLock);
  donatedRoutes = self->_donatedRoutes;
  p_donatedRoutes = &self->_donatedRoutes;
  v7 = donatedRoutes;
  if (!-[NSArray containsObject:](v7, "containsObject:", v9))
  {
    -[NSArray arrayByAddingObject:](*p_donatedRoutes, "arrayByAddingObject:", v9);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)p_donatedRoutes, v8);
    v7 = v8;
  }
  os_unfair_lock_unlock(p_donatedRoutesLock);

}

- (id)recommendationForGroupedOutputDevices:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  MRURecommendation *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  objc_msgSend(MEMORY[0x1E0D4C578], "routeWithOutputDevices:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[MRURouteRecommender recommendedRoutes](self, "recommendedRoutes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __61__MRURouteRecommender_recommendationForGroupedOutputDevices___block_invoke;
    v18[3] = &unk_1E581A470;
    v7 = v4;
    v19 = v7;
    objc_msgSend(v5, "msv_firstWhere:", v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = v8;
    }
    else
    {
      -[MRURouteRecommender donatedRoutes](self, "donatedRoutes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v6;
      v14 = 3221225472;
      v15 = __61__MRURouteRecommender_recommendationForGroupedOutputDevices___block_invoke_2;
      v16 = &unk_1E581A498;
      v17 = v7;
      objc_msgSend(v10, "msv_firstWhere:", &v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v9 = objc_alloc_init(MRURecommendation);
        -[MRURecommendation setRoute:](v9, "setRoute:", v11, v13, v14, v15, v16);
        -[MRURecommendation setClassification:](v9, "setClassification:", 0);
      }
      else
      {
        v9 = 0;
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __61__MRURouteRecommender_recommendationForGroupedOutputDevices___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "routeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "routeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

uint64_t __61__MRURouteRecommender_recommendationForGroupedOutputDevices___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "routeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "routeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (void)donateGroupedOutputDevices:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  NSObject *v17;
  MRURouteRecommender *v18;
  uint8_t buf[4];
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MRURouteRecommender session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D4C578], "routeWithOutputDevices:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      if (-[NSObject donateAsCandidate](v6, "donateAsCandidate"))
      {
        -[MRURouteRecommender donationQueue](self, "donationQueue");
        v8 = objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __50__MRURouteRecommender_donateGroupedOutputDevices___block_invoke;
        v16[3] = &unk_1E5818CB0;
        v17 = v7;
        v18 = self;
        dispatch_async(v8, v16);

        v9 = v17;
      }
      else
      {
        _MRLogForCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v7;
          _os_log_impl(&dword_1AA991000, v9, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR NOT donating %@", buf, 0xCu);
        }
      }

    }
  }
  else
  {
    _MRLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MRURouteRecommender donateGroupedOutputDevices:].cold.1((uint64_t)v4, v7, v10, v11, v12, v13, v14, v15);
  }

}

uint64_t __50__MRURouteRecommender_donateGroupedOutputDevices___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1AA991000, v2, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR updateRouteCandidate: %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "irCandidateFor:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateCandidate:", v5);

  return objc_msgSend(*(id *)(a1 + 40), "addDonatedRoute:", *(_QWORD *)(a1 + 32));
}

- (void)initializeSessionWhenAppropriate
{
  NSObject *v3;
  uint64_t v4;
  uint32_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  _QWORD handler[4];
  id v12;
  id location;
  uint8_t buf[4];
  uint32_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  -[MRURouteRecommender donationQueue](self, "donationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __55__MRURouteRecommender_initializeSessionWhenAppropriate__block_invoke;
  handler[3] = &unk_1E581A290;
  objc_copyWeak(&v12, &location);
  v5 = notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &self->_firstUnlockToken, v3, handler);

  if (v5)
  {
    _MRLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v15 = v5;
      _os_log_impl(&dword_1AA991000, v6, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR Failed to register for first unlock notification (status = %d)", buf, 8u);
    }

  }
  if (MKBDeviceUnlockedSinceBoot() == 1)
  {
    -[MRURouteRecommender donationQueue](self, "donationQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __55__MRURouteRecommender_initializeSessionWhenAppropriate__block_invoke_149;
    block[3] = &unk_1E5818E18;
    objc_copyWeak(&v10, &location);
    dispatch_async(v7, block);

    objc_destroyWeak(&v10);
  }
  else
  {
    _MRLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AA991000, v8, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR Device not yet unlocked since boot", buf, 2u);
    }

  }
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __55__MRURouteRecommender_initializeSessionWhenAppropriate__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  _MRLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AA991000, v2, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR Received first unlock notification", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "initializeSession");

}

void __55__MRURouteRecommender_initializeSessionWhenAppropriate__block_invoke_149(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "initializeSession");

}

- (void)initializeSession
{
  void *v3;
  int v4;
  int v5;
  int v6;
  int v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  __CFString *v11;
  id v12;
  void *v13;
  NSObject *v14;
  const __CFString *v15;
  const __CFString *v16;
  int v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D4C650], "currentSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportRouteRecommendations");

  if (v4)
  {
    v5 = objc_msgSend(MEMORY[0x1E0D4D070], "hasEntitlement:inGroup:", CFSTR("com.apple.intelligentroutingd.xpc.media"), CFSTR("com.apple.security.exception.mach-lookup.global-name"));
    v6 = objc_msgSend(MEMORY[0x1E0D4D070], "hasBoolEntitlement:", CFSTR("com.apple.intelligentrouting.recommendationservice"));
    v7 = v6;
    if (v5 && (v6 & 1) != 0)
    {
      -[MRURouteRecommender serviceToken](self, "serviceToken");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      _MRLogForCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v10)
        {
          -[MRURouteRecommender serviceToken](self, "serviceToken");
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v17 = 138412290;
          v18 = v11;
          _os_log_impl(&dword_1AA991000, v9, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR Using persisted token %@", (uint8_t *)&v17, 0xCu);

        }
        v12 = objc_alloc_init(MEMORY[0x1E0D3E510]);
        -[MRURouteRecommender setSession:](self, "setSession:", v12);

        -[MRURouteRecommender session](self, "session");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setDelegate:", self);

        -[MRURouteRecommender setMode:](self, "setMode:", 0);
      }
      else
      {
        if (v10)
        {
          LOWORD(v17) = 0;
          _os_log_impl(&dword_1AA991000, v9, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR No persisted token :(", (uint8_t *)&v17, 2u);
        }

      }
      if (notify_is_valid_token(self->_firstUnlockToken))
        notify_cancel(self->_firstUnlockToken);
    }
    else
    {
      _MRLogForCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = CFSTR("NO");
        if (v5)
          v16 = CFSTR("YES");
        else
          v16 = CFSTR("NO");
        if (v7)
          v15 = CFSTR("YES");
        v17 = 138412546;
        v18 = v16;
        v19 = 2112;
        v20 = v15;
        _os_log_impl(&dword_1AA991000, v14, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR MRUClient hasLookupException: %@, hasIRBooleanEntitlement: %@ - won't try to create a session", (uint8_t *)&v17, 0x16u);
      }

    }
  }
}

- (IRServiceToken)serviceToken
{
  return (IRServiceToken *)objc_msgSend(MEMORY[0x1E0D3E508], "serviceTokenForServiceIdentifier:", *MEMORY[0x1E0D4BCC8]);
}

- (void)setMode:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  NSObject *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  self->_mode = a3;
  _MRLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 134217984;
    v21 = a3;
    _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR Mode set to %ld", (uint8_t *)&v20, 0xCu);
  }

  -[MRURouteRecommender session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0D3E4F0]);
    -[MRURouteRecommender serviceToken](self, "serviceToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithServiceToken:", v8);

    -[NSObject setMode:](v9, "setMode:", a3);
    _MRLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[MRURouteRecommender session](self, "session");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRURouteRecommender session](self, "session");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 134218498;
      v21 = (int64_t)v11;
      v22 = 2112;
      v23 = v12;
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_1AA991000, v10, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR Will call (%p)%@ runWithConfiguration: %@", (uint8_t *)&v20, 0x20u);

    }
    -[MRURouteRecommender session](self, "session");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "runWithConfiguration:", v9);

  }
  else
  {
    _MRLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MRURouteRecommender setMode:].cold.1(a3, v9, v14, v15, v16, v17, v18, v19);
  }

}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _MRLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v7;
    _os_log_impl(&dword_1AA991000, v8, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR session:didFailWithError: %@", (uint8_t *)&v15, 0xCu);
  }

  -[MRURouteRecommender session](self, "session");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 == v6)
  {
    objc_msgSend(v7, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D3E4E0]);

    if (v11)
    {
      if (objc_msgSend(v7, "code") == -12887)
      {
        _MRLogForCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v15 = 134217984;
          v16 = v6;
          _os_log_impl(&dword_1AA991000, v12, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR Client session %p invalidated, recreating", (uint8_t *)&v15, 0xCu);
        }

        -[MRURouteRecommender initializeSession](self, "initializeSession");
      }
      else if (objc_msgSend(v7, "code") == -12889)
      {
        _MRLogForCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[MRURouteRecommender session:didFailWithError:].cold.2(self, (uint64_t)v6, v13);

        _MRLogForCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          -[MRURouteRecommender session:didFailWithError:].cold.1(self, (uint64_t)v6, v14);

        -[MRURouteRecommender setSession:](self, "setSession:", 0);
      }
    }
  }
  else
  {

  }
}

- (void)session:(id)a3 didUpdateContext:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _MRLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v5;
    _os_log_impl(&dword_1AA991000, v6, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR session:didUpdateContext: %@", buf, 0xCu);
  }

  -[MRURouteRecommender defaultsContext](self, "defaultsContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D3E4D8]);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(v10, "contextIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "candidateResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _MRLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v12;
    _os_log_impl(&dword_1AA991000, v13, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR got %@", buf, 0xCu);
  }

  objc_msgSend(v12, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __48__MRURouteRecommender_session_didUpdateContext___block_invoke;
  v18[3] = &unk_1E581A4C0;
  v19 = v11;
  v15 = v11;
  objc_msgSend(v14, "msv_map:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRURouteRecommender setRecommendedRoutes:](self, "setRecommendedRoutes:", v16);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "postNotificationName:object:", MRURouteRecommenderDidUpdateRecommendationsNotification, self);

}

MRURecommendation *__48__MRURouteRecommender_session_didUpdateContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[MRURecommendation recommendationWithIRCandidateResult:contextIdentifier:](MRURecommendation, "recommendationWithIRCandidateResult:contextIdentifier:", a2, *(_QWORD *)(a1 + 32));
}

- (void)session:(id)a3 suspendedWithReason:(int64_t)a4
{
  NSObject *v5;
  int v6;
  int64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a4;
    _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR session:suspendedWithReason: %ld", (uint8_t *)&v6, 0xCu);
  }

}

- (void)session:(id)a3 suspensionReasonEnded:(int64_t)a4 isNoLongerSuspended:(BOOL)a5
{
  _BOOL4 v5;
  NSObject *v7;
  int v8;
  int64_t v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v5 = a5;
  v12 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134218240;
    v9 = a4;
    v10 = 1024;
    v11 = v5;
    _os_log_impl(&dword_1AA991000, v7, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR session:suspensionReasonEnded:isNoLongerSuspended: %ld %d", (uint8_t *)&v8, 0x12u);
  }

}

- (id)defaultsContext
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[MRURouteRecommender userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("IRContextUpdate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[MRIRRouteRecommendationContext fromObject:](MRIRRouteRecommendationContext, "fromObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _MRLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v11 = 138412290;
      v12 = v4;
      v7 = "[MRDRRC].URR Overriding context with %@";
      v8 = v5;
      v9 = 12;
LABEL_6:
      _os_log_impl(&dword_1AA991000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v11, v9);
    }
  }
  else if (v6)
  {
    v11 = 138412546;
    v12 = 0;
    v13 = 2112;
    v14 = v3;
    v7 = "[MRDRRC].URR Not overriding with %@, %@";
    v8 = v5;
    v9 = 22;
    goto LABEL_6;
  }

  return v4;
}

- (id)sortEndpointRoutes:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  id v27;
  id v28;
  id v29;
  id v30;
  id obj;
  void *v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MRURouteRecommender session](self, "session");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5 && (v6 = (void *)v5, v7 = objc_msgSend(v4, "count"), v6, v7 > 1))
  {
    v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[MRURouteRecommender recommendedRoutes](self, "recommendedRoutes");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v27 = v4;
    obj = v4;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    if (v9)
    {
      v10 = v9;
      v33 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v37 != v33)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v13 = v12;
          else
            v13 = 0;
          v14 = v13;
          objc_msgSend(v14, "endpointObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(MEMORY[0x1E0D4C578], "routeWithEndpoint:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v34[0] = MEMORY[0x1E0C809B0];
            v34[1] = 3221225472;
            v34[2] = __42__MRURouteRecommender_sortEndpointRoutes___block_invoke;
            v34[3] = &unk_1E581A470;
            v17 = v16;
            v35 = v17;
            objc_msgSend(v32, "msv_firstWhere:", v34);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "classification");
            if ((unint64_t)(v19 - 2) >= 3)
            {
              if (v19 == 1)
              {
                v20 = v28;
                v21 = 1;
              }
              else
              {
                v21 = 0;
                v20 = v30;
              }
            }
            else
            {
              v20 = v29;
              v21 = 2;
            }
            v22 = v20;
            _MRLogForCategory();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              v41 = v12;
              v42 = 2048;
              v43 = v21;
              v44 = 2112;
              v45 = v18;
              _os_log_impl(&dword_1AA991000, v23, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR %@ got %lu - %@", buf, 0x20u);
            }

            objc_msgSend(v22, "addObject:", v12);
          }
          else
          {
            objc_msgSend(v30, "addObject:", v12);
          }

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
      }
      while (v10);
    }

    objc_msgSend(v29, "arrayByAddingObjectsFromArray:", v30);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "arrayByAddingObjectsFromArray:", v28);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    _MRLogForCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v41 = v29;
      v42 = 2112;
      v43 = (uint64_t)v30;
      v44 = 2112;
      v45 = v28;
      v46 = 2112;
      v47 = v8;
      _os_log_impl(&dword_1AA991000, v25, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR promoted: %@ medium: %@, bottom: %@ = %@", buf, 0x2Au);
    }

    v4 = v27;
  }
  else
  {
    v8 = v4;
  }

  return v8;
}

uint64_t __42__MRURouteRecommender_sortEndpointRoutes___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "routeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "route");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "routeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  return v7;
}

- (void)donatePickerChoiceFor:(id)a3 bundleID:(id)a4 isEligibleApp:(BOOL)a5 reason:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  NSObject *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  NSObject *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  NSObject *v39;
  uint64_t v40;

  v7 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[MRURouteRecommender session](self, "session");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D4C578], "routeWithEndpoint:", v10);
    v14 = objc_claimAutoreleasedReturnValue();
    -[MRURouteRecommender lastDonatedPickerChoice](self, "lastDonatedPickerChoice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[NSObject isEqual:](v14, "isEqual:", v15);

    if (v16)
    {
      _MRLogForCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v30 = 138412290;
        v31 = v14;
        _os_log_impl(&dword_1AA991000, v17, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR Not dropping duplicate picker choice for %@ - picks are distributed", (uint8_t *)&v30, 0xCu);
      }

    }
    -[MRURouteRecommender setLastDonatedPickerChoice:](self, "setLastDonatedPickerChoice:", v14);
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0D3E4F8]), "initWithEventType:eventSubType:", 0, 0);
    v19 = v18;
    if (v11)
    {
      -[NSObject setBundleID:](v18, "setBundleID:", v11);
      -[NSObject setIsEligibleApp:](v19, "setIsEligibleApp:", v7);
    }
    -[MRURouteRecommender irCandidateFor:](self, "irCandidateFor:", v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "candidateIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    _MRLogForCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (v21)
    {
      if (v23)
      {
        v30 = 138412802;
        v31 = v19;
        v32 = 2112;
        v33 = v20;
        v34 = 2112;
        v35 = v12;
        _os_log_impl(&dword_1AA991000, v22, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR EVENT: MRU is adding %@ for candidate %@ - reason: %@", (uint8_t *)&v30, 0x20u);
      }

      -[MRURouteRecommender session](self, "session");
      v22 = objc_claimAutoreleasedReturnValue();
      -[NSObject addEvent:forCandidate:](v22, "addEvent:forCandidate:", v19, v20);
    }
    else if (v23)
    {
      v30 = 138413314;
      v31 = v19;
      v32 = 2112;
      v33 = v20;
      v34 = 2112;
      v35 = v14;
      v36 = 2112;
      v37 = v10;
      v38 = 2112;
      v39 = v12;
      _os_log_impl(&dword_1AA991000, v22, OS_LOG_TYPE_DEFAULT, "[MRDRRC].URR EVENT: MRU is DROPPING %@ for candidate %@, no candidate identifier - route: %@, endpoint: %@ - reason: %@", (uint8_t *)&v30, 0x34u);
    }

  }
  else
  {
    _MRLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MRURouteRecommender donatePickerChoiceFor:bundleID:isEligibleApp:reason:].cold.1((uint64_t)v10, v14, v24, v25, v26, v27, v28, v29);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  -[MRURouteRecommender userDefaults](self, "userDefaults");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v8 && objc_msgSend(v11, "isEqualToString:", CFSTR("IRContextUpdate")))
  {
    -[MRURouteRecommender session](self, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRURouteRecommender session:didUpdateContext:](self, "session:didUpdateContext:", v10, MEMORY[0x1E0C9AA70]);

  }
}

- (IRSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void)setServiceToken:(id)a3
{
  objc_storeStrong((id *)&self->_serviceToken, a3);
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (int64_t)mode
{
  return self->_mode;
}

- (OS_dispatch_queue)donationQueue
{
  return self->_donationQueue;
}

- (void)setDonationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_donationQueue, a3);
}

- (os_unfair_lock_s)recommendedRoutesLock
{
  return self->_recommendedRoutesLock;
}

- (os_unfair_lock_s)donatedRoutesLock
{
  return self->_donatedRoutesLock;
}

- (int)firstUnlockToken
{
  return self->_firstUnlockToken;
}

- (void)setFirstUnlockToken:(int)a3
{
  self->_firstUnlockToken = a3;
}

- (MRRouteRepresentable)lastDonatedPickerChoice
{
  return self->_lastDonatedPickerChoice;
}

- (void)setLastDonatedPickerChoice:(id)a3
{
  objc_storeStrong((id *)&self->_lastDonatedPickerChoice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDonatedPickerChoice, 0);
  objc_storeStrong((id *)&self->_donationQueue, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_serviceToken, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_donatedRoutes, 0);
  objc_storeStrong((id *)&self->_recommendedRoutes, 0);
}

- (void)donateGroupedOutputDevices:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AA991000, a2, a3, "[MRDRRC].URR won't donateGroupedOutputDevices:%@ because session is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)setMode:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AA991000, a2, a3, "[MRDRRC].URR won't setMode:%ld because session is nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)session:(NSObject *)a3 didFailWithError:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "serviceToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1AA991000, a3, OS_LOG_TYPE_FAULT, "Token %@ invalidated for session %p, in client process, clearing session", v5, 0x16u);

  OUTLINED_FUNCTION_1();
}

- (void)session:(NSObject *)a3 didFailWithError:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "serviceToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1AA991000, a3, OS_LOG_TYPE_ERROR, "[MRDRRC].URR Token %@ invalidated for session %p, in client process, clearing session", v5, 0x16u);

  OUTLINED_FUNCTION_1();
}

- (void)donatePickerChoiceFor:(uint64_t)a3 bundleID:(uint64_t)a4 isEligibleApp:(uint64_t)a5 reason:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AA991000, a2, a3, "[MRDRRC].URR won't donatePickerChoiceFor:%@ because session is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
