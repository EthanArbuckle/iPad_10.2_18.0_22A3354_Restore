@implementation CSFAvailability

+ (id)dispatchQueue
{
  if (dispatchQueue_onceToken != -1)
    dispatch_once(&dispatchQueue_onceToken, &__block_literal_global);
  return (id)dispatchQueue_queue;
}

void __32__CSFAvailability_dispatchQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.csf.availability", 0);
  v1 = (void *)dispatchQueue_queue;
  dispatchQueue_queue = (uint64_t)v0;

}

+ (id)currentAvailability
{
  uint64_t v3;
  _BOOL4 v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  NSObject *v13;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a1, "_syncUnavailabilityReasons");
  v4 = +[GMBypass gmEligibilityBypass](_TtC25CloudSubscriptionFeatures8GMBypass, "gmEligibilityBypass");
  _CSFGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v15 = 136315138;
      v16 = "+[CSFAvailability currentAvailability]";
      _os_log_impl(&dword_1A5B4D000, v5, OS_LOG_TYPE_DEFAULT, "%s Eligibility bypass is set to YES. Skipping ramp eligibility checks.", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    if (v6)
    {
      v15 = 136315138;
      v16 = "+[CSFAvailability currentAvailability]";
      _os_log_impl(&dword_1A5B4D000, v5, OS_LOG_TYPE_DEFAULT, "%s Checking for device eligibility from feature cache.", (uint8_t *)&v15, 0xCu);
    }

    +[CSFFeatureManager cachedFeatureObjectWithId:](CSFFeatureManager, "cachedFeatureObjectWithId:", CFSTR("cloud.llm"));
    v5 = objc_claimAutoreleasedReturnValue();
    _CSFGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v8)
      {
        v15 = 136315138;
        v16 = "+[CSFAvailability currentAvailability]";
        _os_log_impl(&dword_1A5B4D000, v7, OS_LOG_TYPE_DEFAULT, "%s Found feature in cache. Checking if user has been granted access.", (uint8_t *)&v15, 0xCu);
      }

      v9 = -[NSObject canUse](v5, "canUse");
      _CSFGetLogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v11)
        {
          v15 = 136315138;
          v16 = "+[CSFAvailability currentAvailability]";
          _os_log_impl(&dword_1A5B4D000, v10, OS_LOG_TYPE_DEFAULT, "%s User has been granted access.", (uint8_t *)&v15, 0xCu);
        }

      }
      else
      {
        if (v11)
        {
          v15 = 136315138;
          v16 = "+[CSFAvailability currentAvailability]";
          _os_log_impl(&dword_1A5B4D000, v10, OS_LOG_TYPE_DEFAULT, "%s User has not been granted access.", (uint8_t *)&v15, 0xCu);
        }

        v3 |= 0x10uLL;
      }
    }
    else
    {
      if (v8)
      {
        v15 = 136315138;
        v16 = "+[CSFAvailability currentAvailability]";
        _os_log_impl(&dword_1A5B4D000, v7, OS_LOG_TYPE_DEFAULT, "%s Unable to fetch device availability as no cached feature object was found.", (uint8_t *)&v15, 0xCu);
      }

      v3 |= 0x100uLL;
      +[CSFFeatureManager requestFeatureWithId:completion:](CSFFeatureManager, "requestFeatureWithId:completion:", CFSTR("cloud.llm"), &__block_literal_global_5);
    }
  }

  objc_msgSend(a1, "_availabilityGivenUnavailabilityReasons:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _CSFGetLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315394;
    v16 = "+[CSFAvailability currentAvailability]";
    v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_1A5B4D000, v13, OS_LOG_TYPE_DEFAULT, "%s Returning result: %@", (uint8_t *)&v15, 0x16u);
  }

  return v12;
}

+ (void)currentAvailabilityWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  +[CSFAvailability dispatchQueue](CSFAvailability, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__CSFAvailability_currentAvailabilityWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4F6E308;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __60__CSFAvailability_currentAvailabilityWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  NSObject *v15;
  _BYTE *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t v24[4];
  const char *v25;
  _BYTE buf[24];
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 40), "_syncUnavailabilityReasons");
  if (!+[GMBypass gmEligibilityBypass](_TtC25CloudSubscriptionFeatures8GMBypass, "gmEligibilityBypass"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v27 = __Block_byref_object_copy_;
    v28 = __Block_byref_object_dispose_;
    v29 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy_;
    v22 = __Block_byref_object_dispose_;
    v23 = 0;
    v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    _CSFGetLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v24 = 136315138;
      v25 = "+[CSFAvailability currentAvailabilityWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1A5B4D000, v5, OS_LOG_TYPE_DEFAULT, "%s getting feature for availability check.", v24, 0xCu);
    }

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __60__CSFAvailability_currentAvailabilityWithCompletionHandler___block_invoke_7;
    v14[3] = &unk_1E4F6E2E0;
    v16 = buf;
    v17 = &v18;
    v6 = v4;
    v15 = v6;
    +[CSFFeatureManager requestFeatureWithId:completion:](CSFFeatureManager, "requestFeatureWithId:completion:", CFSTR("cloud.llm"), v14);
    v7 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 90000000000);
    dispatch_group_wait(v6, v7);
    if (v19[5])
    {
      _CSFGetLogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)v19[5], "localizedDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        __60__CSFAvailability_currentAvailabilityWithCompletionHandler___block_invoke_cold_3(v9, v24, v8);
      }
    }
    else
    {
      v13 = *(void **)(*(_QWORD *)&buf[8] + 40);
      if (v13)
      {
        if ((objc_msgSend(v13, "canUse") & 1) != 0)
          goto LABEL_12;
        _CSFGetLogSystem();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          __60__CSFAvailability_currentAvailabilityWithCompletionHandler___block_invoke_cold_2();
        v10 = 16;
LABEL_11:

        v2 |= v10;
LABEL_12:

        _Block_object_dispose(&v18, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_13;
      }
      _CSFGetLogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __60__CSFAvailability_currentAvailabilityWithCompletionHandler___block_invoke_cold_1(v8);
    }
    v10 = 256;
    goto LABEL_11;
  }
  _CSFGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "+[CSFAvailability currentAvailabilityWithCompletionHandler:]_block_invoke";
    _os_log_impl(&dword_1A5B4D000, v3, OS_LOG_TYPE_DEFAULT, "%s Eligibility bypass is set to YES. Skipping ramp eligibility checks.", buf, 0xCu);
  }

LABEL_13:
  objc_msgSend(*(id *)(a1 + 40), "_availabilityGivenUnavailabilityReasons:", v2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _CSFGetLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "+[CSFAvailability currentAvailabilityWithCompletionHandler:]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    _os_log_impl(&dword_1A5B4D000, v12, OS_LOG_TYPE_DEFAULT, "%s Returning result: %@", buf, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__CSFAvailability_currentAvailabilityWithCompletionHandler___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (int64_t)_syncUnavailabilityReasons
{
  void *v2;
  int64_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  CSFGMOptIn *v10;
  BOOL v11;
  NSObject *v12;
  uint8_t v14[16];

  +[CSFEligibilityFetcher current](CSFEligibilityFetcher, "current");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "deviceEligibile") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    _CSFGetLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      +[CSFAvailability _syncUnavailabilityReasons].cold.6();

    v3 = 1;
  }
  if ((objc_msgSend(v2, "languageEligible") & 1) == 0)
  {
    _CSFGetLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      +[CSFAvailability _syncUnavailabilityReasons].cold.5();

    v3 |= 2uLL;
  }
  if ((objc_msgSend(v2, "regionEligible") & 1) == 0)
  {
    _CSFGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      +[CSFAvailability _syncUnavailabilityReasons].cold.4();

    v3 |= 4uLL;
  }
  if (+[GMBypass gmEligibilityBypass](_TtC25CloudSubscriptionFeatures8GMBypass, "gmEligibilityBypass"))
  {
    _CSFGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1A5B4D000, v7, OS_LOG_TYPE_DEFAULT, "gmBypass is enabled, skipping the asset and opt-in status checks.", v14, 2u);
    }

  }
  else
  {
    if (!+[Assets assetsFinishedDownloading](_TtC25CloudSubscriptionFeatures6Assets, "assetsFinishedDownloading"))
    {
      _CSFGetLogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        +[CSFAvailability _syncUnavailabilityReasons].cold.3();

      v3 |= 0x20uLL;
    }
    if (!+[Assets userHasEnoughStorage](_TtC25CloudSubscriptionFeatures6Assets, "userHasEnoughStorage"))
    {
      _CSFGetLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        +[CSFAvailability _syncUnavailabilityReasons].cold.2();

      v3 |= 0x40uLL;
    }
    v10 = objc_alloc_init(CSFGMOptIn);
    v11 = -[CSFGMOptIn isOptedIn](v10, "isOptedIn");

    if (!v11)
    {
      _CSFGetLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        +[CSFAvailability _syncUnavailabilityReasons].cold.1();

      v3 |= 0x80uLL;
    }
  }

  return v3;
}

+ (id)_availabilityGivenUnavailabilityReasons:(int64_t)a3
{
  CSFAvailability *v4;
  uint64_t v5;
  int64_t v6;

  v4 = [CSFAvailability alloc];
  if (a3)
  {
    v5 = 2;
    v6 = a3;
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  return -[CSFAvailability initWithStatus:withUnavailabilityReasons:](v4, "initWithStatus:withUnavailabilityReasons:", v5, v6);
}

+ (id)_descriptionForUnavailabilityReasons:(int64_t)a3
{
  __int16 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "addObject:", CFSTR("deviceNotCapable"));
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v5, "addObject:", CFSTR("selectedLanguageIneligible"));
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(v5, "addObject:", CFSTR("regionIneligible"));
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(v5, "addObject:", CFSTR("accessNotGranted"));
  if ((v3 & 0x20) == 0)
  {
LABEL_6:
    if ((v3 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(v5, "addObject:", CFSTR("assetIsNotReady"));
  if ((v3 & 0x40) == 0)
  {
LABEL_7:
    if ((v3 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v5, "addObject:", CFSTR("shortOfStorage"));
  if ((v3 & 0x80) == 0)
  {
LABEL_8:
    if ((v3 & 0x100) == 0)
      goto LABEL_9;
LABEL_19:
    objc_msgSend(v5, "addObject:", CFSTR("unableToFetchAvailability"));
    if ((v3 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_18:
  objc_msgSend(v5, "addObject:", CFSTR("notOptedIn"));
  if ((v3 & 0x100) != 0)
    goto LABEL_19;
LABEL_9:
  if ((v3 & 0x200) != 0)
LABEL_10:
    objc_msgSend(v5, "addObject:", CFSTR("unknown"));
LABEL_11:
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("[%@]"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", -[CSFAvailability status](self, "status"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("status"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CSFAvailability unavailabiltyReasons](self, "unavailabiltyReasons"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("unavailabilityReasons"));

}

- (CSFAvailability)initWithCoder:(id)a3
{
  id v4;
  CSFAvailability *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSFAvailability;
  v5 = -[CSFAvailability init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("status"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSFAvailability setStatus:](v5, "setStatus:", objc_msgSend(v6, "integerValue"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unavailabilityReasons"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSFAvailability setUnavailabiltyReasons:](v5, "setUnavailabiltyReasons:", objc_msgSend(v7, "integerValue"));

  }
  return v5;
}

- (CSFAvailability)initWithStatus:(int64_t)a3 withUnavailabilityReasons:(int64_t)a4
{
  CSFAvailability *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSFAvailability;
  result = -[CSFAvailability init](&v7, sel_init);
  if (result)
  {
    result->_status = a3;
    result->_unavailabiltyReasons = a4;
  }
  return result;
}

- (id)description
{
  __CFString *v3;
  void *v4;
  void *v5;

  if (-[CSFAvailability status](self, "status"))
  {
    if (-[CSFAvailability status](self, "status") == 1)
    {
      v3 = CFSTR("CSFAvailability: limited");
    }
    else
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      +[CSFAvailability _descriptionForUnavailabilityReasons:](CSFAvailability, "_descriptionForUnavailabilityReasons:", -[CSFAvailability unavailabiltyReasons](self, "unavailabiltyReasons"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("<CSFAvailability: unavailable - %@>"), v5);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v3 = CFSTR("CSFAvailability: available");
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)status
{
  return self->_status;
}

- (int64_t)unavailabiltyReasons
{
  return self->_unavailabiltyReasons;
}

- (BOOL)shouldShowGM
{
  NSObject *v3;
  void *v4;
  void *v5;
  BOOL v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (+[CSFGMFeatureFlags anyFeatureEnabled](_TtC25CloudSubscriptionFeatures17CSFGMFeatureFlags, "anyFeatureEnabled"))
  {
    if (!-[CSFAvailability status](self, "status"))
    {
      _CSFGetLogSystem();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_1A5B4D000, v3, OS_LOG_TYPE_DEFAULT, "Availability status is available. Should show GM.", (uint8_t *)&v8, 2u);
      }
      goto LABEL_15;
    }
    if ((-[CSFAvailability unavailabiltyReasons](self, "unavailabiltyReasons") & 1) == 0
      && (-[CSFAvailability unavailabiltyReasons](self, "unavailabiltyReasons") & 2) == 0
      && (-[CSFAvailability unavailabiltyReasons](self, "unavailabiltyReasons") & 4) == 0)
    {
      _CSFGetLogSystem();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        +[CSFAvailability _descriptionForUnavailabilityReasons:](CSFAvailability, "_descriptionForUnavailabilityReasons:", -[CSFAvailability unavailabiltyReasons](self, "unavailabiltyReasons"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138412290;
        v9 = v4;
        _os_log_impl(&dword_1A5B4D000, v3, OS_LOG_TYPE_DEFAULT, "Availability status is unavailable but device is HW/Locale/Region eligible. Should show GM. Unavailability reasons: %@", (uint8_t *)&v8, 0xCu);

      }
LABEL_15:
      v6 = 1;
      goto LABEL_16;
    }
    _CSFGetLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      +[CSFAvailability _descriptionForUnavailabilityReasons:](CSFAvailability, "_descriptionForUnavailabilityReasons:", -[CSFAvailability unavailabiltyReasons](self, "unavailabiltyReasons"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1A5B4D000, v3, OS_LOG_TYPE_DEFAULT, "Should not display GM as device is not HW/Locale/Region eligible. Unavailability reasons: %@", (uint8_t *)&v8, 0xCu);

    }
  }
  else
  {
    _CSFGetLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1A5B4D000, v3, OS_LOG_TYPE_DEFAULT, "No GM feature flags enabled. Should not show GM.", (uint8_t *)&v8, 2u);
    }
  }
  v6 = 0;
LABEL_16:

  return v6;
}

- (BOOL)deviceHasEnoughStorage
{
  return (-[CSFAvailability unavailabiltyReasons](self, "unavailabiltyReasons") & 0x40) == 0;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void)setUnavailabiltyReasons:(int64_t)a3
{
  self->_unavailabiltyReasons = a3;
}

void __60__CSFAvailability_currentAvailabilityWithCompletionHandler___block_invoke_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "+[CSFAvailability currentAvailabilityWithCompletionHandler:]_block_invoke";
  _os_log_error_impl(&dword_1A5B4D000, log, OS_LOG_TYPE_ERROR, "%s Requested features but none were returned.", (uint8_t *)&v1, 0xCu);
}

void __60__CSFAvailability_currentAvailabilityWithCompletionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A5B4D000, v0, v1, "Server has not granted access.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__CSFAvailability_currentAvailabilityWithCompletionHandler___block_invoke_cold_3(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315394;
  *(_QWORD *)(buf + 4) = "+[CSFAvailability currentAvailabilityWithCompletionHandler:]_block_invoke_2";
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a1;
  _os_log_error_impl(&dword_1A5B4D000, log, OS_LOG_TYPE_ERROR, "%s Error requesting features: %@", buf, 0x16u);

}

+ (void)_syncUnavailabilityReasons
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A5B4D000, v0, v1, "Hardware is ineligible.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
