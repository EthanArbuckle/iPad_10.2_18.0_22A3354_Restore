@implementation IDSCTAdapter

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_19BA9B428;
  block[3] = &unk_1E3C1C798;
  block[4] = a1;
  if (qword_1ECDD48F0 != -1)
    dispatch_once(&qword_1ECDD48F0, block);
  return (id)qword_1ECDD48F8;
}

- (IDSCTAdapter)initWithCoreTelephonyClient:(id)a3 systemMonitor:(id)a4
{
  id v7;
  id v8;
  IDSCTAdapter *v9;
  IDSCTAdapter *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *registrationStateByLabelID;
  IDSCTAdapterCache *v13;
  id cache;
  const char *v15;
  double v16;
  const char *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  NSHashTable *listeners;
  const char *v22;
  uint64_t v23;
  double v24;
  const char *v25;
  double v26;
  objc_super v28;

  v7 = a3;
  v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)IDSCTAdapter;
  v9 = -[IDSCTAdapter init](&v28, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    registrationStateByLabelID = v10->_registrationStateByLabelID;
    v10->_registrationStateByLabelID = v11;

    v13 = objc_alloc_init(IDSCTAdapterCache);
    cache = v10->_cache;
    v10->_cache = v13;

    objc_storeStrong(&v10->_coreTelephonyClient, a3);
    objc_msgSend_setDelegate_(v10->_coreTelephonyClient, v15, (uint64_t)v10, v16);
    objc_msgSend_weakObjectsHashTable(MEMORY[0x1E0CB3690], v17, v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    listeners = v10->_listeners;
    v10->_listeners = (NSHashTable *)v20;

    objc_storeStrong((id *)&v10->_systemMonitor, a4);
    if ((objc_msgSend_isActive(v10->_systemMonitor, v22, v23, v24) & 1) == 0)
      objc_msgSend_setActive_(v10->_systemMonitor, v25, 1, v26);
    objc_msgSend_addListener_(v10->_systemMonitor, v25, (uint64_t)v10, v26);
  }

  return v10;
}

- (void)dealloc
{
  double v2;
  objc_super v4;

  objc_msgSend_removeListener_(self->_systemMonitor, a2, (uint64_t)self, v2);
  v4.receiver = self;
  v4.super_class = (Class)IDSCTAdapter;
  -[IDSCTAdapter dealloc](&v4, sel_dealloc);
}

- (BOOL)dualSIMCapabilityEnabled
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_19BA9B6AC;
  v4[3] = &unk_1E3C21D40;
  v4[4] = self;
  v4[5] = &v5;
  objc_msgSend__locked_accessCache_(self, a2, (uint64_t)v4, COERCE_DOUBLE(3221225472));
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isAnySIMUsable
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_19BA9B8E8;
  v4[3] = &unk_1E3C21D40;
  v4[4] = self;
  v4[5] = &v5;
  objc_msgSend__locked_accessCache_(self, a2, (uint64_t)v4, COERCE_DOUBLE(3221225472));
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isAnySIMInserted
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_19BA9BC7C;
  v4[3] = &unk_1E3C21D40;
  v4[4] = self;
  v4[5] = &v5;
  objc_msgSend__locked_accessCache_(self, a2, (uint64_t)v4, COERCE_DOUBLE(3221225472));
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)hasMultipleSIMs
{
  double v2;
  void *v3;
  const char *v4;
  double v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  BOOL v10;

  objc_msgSend_currentSIMsWithError_(self, a2, 0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___imArrayByApplyingBlock_(v3, v4, (uint64_t)&unk_1E3C1B950, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (unint64_t)objc_msgSend_count(v6, v7, v8, v9) > 1;

  return v10;
}

- (BOOL)supportsIdentification
{
  char v2;
  _QWORD v4[7];
  _QWORD v5[3];
  char v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v6 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_19BA9C0AC;
  v4[3] = &unk_1E3C21D68;
  v4[4] = self;
  v4[5] = v5;
  v4[6] = &v7;
  objc_msgSend__locked_accessCache_(self, a2, (uint64_t)v4, COERCE_DOUBLE(3221225472));
  v2 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(&v7, 8);
  return v2;
}

- (BOOL)doesAnySIMSupportsSimultaneousVoiceAndDataRightNow
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_19BA9C634;
  v4[3] = &unk_1E3C21D40;
  v4[4] = self;
  v4[5] = &v5;
  objc_msgSend__locked_accessCache_(self, a2, (uint64_t)v4, COERCE_DOUBLE(3221225472));
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)_legacy_supportsSMSIdentification
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  double v5;
  const void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  double v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  NSObject *v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  unsigned __int8 v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  _WORD v25[11];

  *(_QWORD *)&v25[7] = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v18 = 0u;
  v19 = 0u;
  if (qword_1EE40B4E0 != -1)
    dispatch_once(&qword_1EE40B4E0, &unk_1E3C1B550);
  if (qword_1EE40B4F0 != -1)
    dispatch_once(&qword_1EE40B4F0, &unk_1E3C21D88);
  v21 = -86;
  v2 = off_1EE40B4D8(*MEMORY[0x1E0C9AE00], nullsub_4, &v18);
  if (!v2)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v3, v4, v5, v18, v19, v20);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v16, OS_LOG_TYPE_DEFAULT, "Could not create CT server connection to query _CTServerConnectionIsPhoneNumberRegistrationSupported", buf, 2u);
    }

    return 1;
  }
  v6 = (const void *)v2;
  v7 = off_1EE40B4E8(v2, &v21);
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v8, v9, v10, v18, v19, v20);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    v23 = v21;
    v24 = 1024;
    *(_DWORD *)v25 = v7;
    v25[2] = 2048;
    *(_QWORD *)&v25[3] = v7 >> 32;
    _os_log_impl(&dword_19B949000, v11, OS_LOG_TYPE_DEFAULT, "_CTServerConnectionIsPhoneNumberRegistrationSupported returned value { registrationSupported: %d, error: (%d:%ld) }", buf, 0x18u);
  }

  CFRelease(v6);
  if ((_DWORD)v7)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v12, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v23 = v7;
      v24 = 2048;
      *(_QWORD *)v25 = v7 >> 32;
      _os_log_impl(&dword_19B949000, v15, OS_LOG_TYPE_DEFAULT, "Failed to query _CTServerConnectionIsPhoneNumberRegistrationSupported from CT { error: (%d:%ld) }", buf, 0x12u);
    }

    return 1;
  }
  return v21 != 0;
}

- (id)carrierBundleValueFromAllSIMsForKey:(id)a3 ofType:(Class)a4 withFallback:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  double v14;
  uint64_t v15;
  const char *v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  double v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend_currentSIMsWithError_(self, v11, 0, 0.0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v25, v14, v29, 16);
  if (v15)
  {
    v18 = v15;
    v19 = *(_QWORD *)v26;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v12);
        objc_msgSend_carrierBundleValueFromSIM_forKey_ofType_withFallback_(self, v16, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v20), v17, v8, a4, v9);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
          objc_msgSend_addObject_(v10, v21, (uint64_t)v22, v23);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v16, (uint64_t)&v25, v17, v29, 16);
    }
    while (v18);
  }

  return v10;
}

- (id)carrierBundleValueFromSIM:(id)a3 forKey:(id)a4 ofType:(Class)a5 withFallback:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  uint64_t v19;
  void *v20;
  id v21;
  const char *v22;
  double v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  double v27;
  id coreTelephonyClient;
  void *v29;
  const char *v30;
  uint64_t v31;
  NSObject *v32;
  double v33;
  char isKindOfClass;
  const char *v35;
  uint64_t v36;
  double v37;
  NSObject *v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  id v44;
  void *v46;
  id v47;
  id v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  id v52;
  __int16 v53;
  Class v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend_SIMIdentifier(v10, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_SIMForIdentifier_(self, v17, (uint64_t)v16, v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v19;
  }
  objc_msgSend_context(v10, v13, v14, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc(MEMORY[0x1E0CA6D00]);
  v26 = (void *)objc_msgSend_initWithBundleType_(v21, v22, 1, v23);
  if (v20)
  {
    coreTelephonyClient = self->_coreTelephonyClient;
    v48 = 0;
    v29 = (void *)objc_msgSend_copyCarrierBundleValue_key_bundleType_error_(coreTelephonyClient, v24, (uint64_t)v20, v27, v11, v26, &v48);
    v32 = v48;
    if (v29)
    {
      isKindOfClass = objc_opt_isKindOfClass();
      objc_msgSend_sms(MEMORY[0x1E0D36AA8], v35, v36, v37);
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if ((isKindOfClass & 1) != 0)
      {
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v50 = v11;
          v51 = 2112;
          v52 = v29;
          _os_log_impl(&dword_19B949000, v39, OS_LOG_TYPE_DEFAULT, "Found carrier bundle value { key: %@, value: %@ }", buf, 0x16u);
        }

        v40 = v29;
        goto LABEL_22;
      }
      if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
      {
        v46 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138413058;
        v50 = v11;
        v51 = 2112;
        v52 = v12;
        v53 = 2112;
        v54 = a5;
        v55 = 2112;
        v56 = v46;
        v47 = v46;
        _os_log_fault_impl(&dword_19B949000, v39, OS_LOG_TYPE_FAULT, "Unexpected type loading carrier bundle value { key: %@, fallbackValue: %@, expectedClass: %@, foundClass: %@ }", buf, 0x2Au);

      }
    }
    else
    {
      objc_msgSend_sms(MEMORY[0x1E0D36AA8], v30, v31, v33);
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = v41;
      if (v32)
      {
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v50 = v11;
          v51 = 2112;
          v52 = v12;
          v53 = 2112;
          v54 = (Class)v32;
          _os_log_error_impl(&dword_19B949000, v42, OS_LOG_TYPE_ERROR, "Failed to load carrier bundle value { key: %@, fallbackValue: %@, carrierBundleError: %@ }", buf, 0x20u);
        }
      }
      else if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        sub_19BAF95C0();
      }

    }
    v40 = 0;
LABEL_22:

    goto LABEL_23;
  }
  objc_msgSend_sms(MEMORY[0x1E0D36AA8], v24, v25, v27);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v50 = v11;
    v51 = 2112;
    v52 = v12;
    v53 = 2112;
    v54 = 0;
    _os_log_impl(&dword_19B949000, v32, OS_LOG_TYPE_DEFAULT, "Unable to load subscription context to look up carrier bundle value -- falling back { key: %@, fallbackValue: %@, subscriptionError: %@ }", buf, 0x20u);
  }
  v40 = 0;
LABEL_23:

  if (v40)
    v43 = v40;
  else
    v43 = v12;
  v44 = v43;

  return v44;
}

- (id)_unlocked_currentSIMsWithError:(id *)a3
{
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  id coreTelephonyClient;
  void *v17;
  const char *v18;
  uint64_t v19;
  id v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  double v28;
  void *v29;
  const char *v30;
  double v31;
  const char *v32;
  uint64_t v33;
  double v34;
  NSObject *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  double v40;
  void *v41;
  id v43;
  uint8_t buf[4];
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend_cache(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sims(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    goto LABEL_12;
  coreTelephonyClient = self->_coreTelephonyClient;
  v43 = 0;
  objc_msgSend_getSubscriptionInfoWithError_(coreTelephonyClient, v13, (uint64_t)&v43, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v43;
  if (v17)
  {
    objc_msgSend_subscriptions(v17, v18, v19, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___imArrayByApplyingBlock_(v22, v23, (uint64_t)&unk_1E3C21DC8, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cache(self, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSims_(v29, v30, (uint64_t)v25, v31);

    objc_msgSend_sms(MEMORY[0x1E0D36AA8], v32, v33, v34);
    v35 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    *(_DWORD *)buf = 138412290;
    v45 = v17;
    v36 = "Loaded subscription contexts { subInfo: %@ }";
  }
  else
  {
    objc_msgSend_sms(MEMORY[0x1E0D36AA8], v18, v19, v21);
    v35 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    *(_DWORD *)buf = 138412290;
    v45 = v20;
    v36 = "Unable to load subscription contexts { subError: %@ }";
  }
  _os_log_impl(&dword_19B949000, v35, OS_LOG_TYPE_DEFAULT, v36, buf, 0xCu);
LABEL_8:

  if (a3 && v20)
    *a3 = objc_retainAutorelease(v20);

LABEL_12:
  objc_msgSend_cache(self, v13, v14, v15);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sims(v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

- (id)currentSIMsWithError:(id *)a3
{
  void *v4;
  id v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_19BA9D60C;
  v18 = sub_19BA9D61C;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_19BA9D60C;
  v12 = sub_19BA9D61C;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_19BA9D624;
  v7[3] = &unk_1E3C21DF0;
  v7[4] = self;
  v7[5] = &v14;
  v7[6] = &v8;
  objc_msgSend__locked_accessCache_(self, a2, (uint64_t)v7, COERCE_DOUBLE(3221225472));
  if (a3)
  {
    v4 = (void *)v9[5];
    if (v4)
      *a3 = objc_retainAutorelease(v4);
  }
  v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

- (id)SIMForIdentifier:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  double v8;
  const char *v9;
  uint64_t v10;
  id v11;
  double v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  const char *v17;
  double v18;
  char isEqualToString;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend_currentSIMsWithError_(self, v5, 0, 0.0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v21, v8, v25, 16);
  if (v11)
  {
    v13 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v6);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        objc_msgSend_SIMIdentifier(v15, v9, v10, v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v16, v17, (uint64_t)v4, v18);

        if ((isEqualToString & 1) != 0)
        {
          v11 = v15;
          goto LABEL_11;
        }
      }
      v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v21, v12, v25, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_11:

  return v11;
}

- (id)contextForSim:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  uint64_t v11;
  void *v12;
  id coreTelephonyClient;
  const char *v14;
  double v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  double v20;
  void *v21;
  int isReady;
  const char *v23;
  uint64_t v24;
  double v25;
  NSObject *v26;
  const __CFString *v27;
  void *v28;
  id v29;
  NSObject *v30;
  id v32;
  uint8_t buf[4];
  const __CFString *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend_SIMIdentifier(v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_SIMForIdentifier_(self, v9, (uint64_t)v8, v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v11;
  }
  objc_msgSend_context(v4, v5, v6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  coreTelephonyClient = self->_coreTelephonyClient;
  v32 = 0;
  objc_msgSend_getPNRContext_outError_(coreTelephonyClient, v14, (uint64_t)v12, v15, &v32);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v32;
  v21 = v17;
  if (!v16 || v17)
  {
    objc_msgSend_sms(MEMORY[0x1E0D36AA8], v18, v19, v20);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_19BAF9630();

    v29 = 0;
  }
  else
  {
    isReady = objc_msgSend_isReady(v16, v18, v19, v20);
    objc_msgSend_sms(MEMORY[0x1E0D36AA8], v23, v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      if (isReady)
        v27 = CFSTR("YES");
      v34 = v27;
      v35 = 2112;
      v36 = v16;
      v37 = 2112;
      v38 = v4;
      _os_log_impl(&dword_19B949000, v26, OS_LOG_TYPE_DEFAULT, "Fetched SIMContext for SIM {validContext: %@, PNRContext: %@, context: %@}", buf, 0x20u);
    }

    if (isReady)
      v28 = v16;
    else
      v28 = 0;
    v29 = v28;
  }

  return v29;
}

- (BOOL)isPNRNumber:(id)a3 andPhoneBookNumber:(id)a4 differentEnoughFromSIMIdentifier:(id)a5 toReregisterWithNewNumber:(id *)a6
{
  id v9;
  id v10;
  const char *v11;
  double v12;
  void *v13;
  id v14;
  const char *v15;
  double v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  const char *v26;
  double v27;
  char isEqualToString;
  void *v29;
  id v30;
  const char *v31;
  double v32;
  const char *v33;
  uint64_t v34;
  double v35;
  NSObject *v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  double v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  int v45;
  double v46;
  void *v47;
  int v48;
  void *v49;
  void *v51;
  const char *v52;
  uint64_t v53;
  double v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  double v58;
  id *v59;
  id v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  double v64;
  void *v65;
  void *v66;
  id v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  id v74;
  uint8_t buf[4];
  id v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  id v80;
  __int16 v81;
  void *v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v69 = a3;
  v9 = a4;
  v10 = a5;
  v74 = 0;
  objc_msgSend_currentSIMsWithError_(self, v11, (uint64_t)&v74, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v74;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v14 = v13;
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v70, v16, v83, 16);
  if (!v17)
    goto LABEL_9;
  v21 = v17;
  v22 = *(_QWORD *)v71;
  while (2)
  {
    for (i = 0; i != v21; ++i)
    {
      if (*(_QWORD *)v71 != v22)
        objc_enumerationMutation(v14);
      v24 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
      objc_msgSend_SIMIdentifier(v24, v18, v19, v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v25, v26, (uint64_t)v10, v27);

      if ((isEqualToString & 1) != 0)
      {
        v30 = v24;
        objc_msgSend_contextForSim_(self, v31, (uint64_t)v30, v32);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v30)
          goto LABEL_17;
        objc_msgSend_sms(MEMORY[0x1E0D36AA8], v33, v34, v35);
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = v9;
        v38 = v69;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          v76 = v69;
          v77 = 2112;
          v78 = v37;
          v79 = 2112;
          v80 = v30;
          v81 = 2112;
          v82 = v29;
          _os_log_impl(&dword_19B949000, v36, OS_LOG_TYPE_DEFAULT, "** Checking for phone number change { phoneNumber: %@, phoneBookNumber: %@, matchingSIM: %@, matchingSIMContext: %@ }", buf, 0x2Au);
        }

        if (v29)
        {
          objc_msgSend_phoneNumberOnSIM(v29, v39, v40, v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = sub_19BA9DD38(v42, v37);
          if (v45)
          {
            objc_msgSend_phoneNumberOnSIM(v29, v43, v44, v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            if ((sub_19BA9DD38(v47, v69) & 1) != 0)
            {
              v48 = 1;
              goto LABEL_33;
            }
            if (!v69)
            {
              v48 = 0;
              goto LABEL_33;
            }
            v65 = v47;
LABEL_30:
            objc_msgSend_phoneNumber(v29, v43, v44, v46, v65);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = sub_19BA9DD38(v61, v69);

            v47 = v66;
            if (!v45)
            {
LABEL_34:

              v59 = a6;
              v49 = v68;
              if (!a6 || !v48)
                goto LABEL_19;
              objc_msgSend_phoneNumberOnSIM(v29, v62, v63, v64);
              v60 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_37;
            }
LABEL_33:

            goto LABEL_34;
          }
          if (v69)
            goto LABEL_30;

        }
        else
        {
          objc_msgSend_phoneNumber(v30, v39, v40, v41);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          if ((sub_19BA9DD38(v51, v37) & 1) != 0)
          {
            objc_msgSend_phoneNumber(v30, v52, v53, v54);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = sub_19BA9DD38(v55, v69);

            v29 = 0;
            v59 = a6;
            if (!a6)
              goto LABEL_18;
            v49 = v68;
            if (!v48)
              goto LABEL_19;
            objc_msgSend_phoneNumber(v30, v56, v57, v58);
            v60 = (id)objc_claimAutoreleasedReturnValue();
            v29 = 0;
LABEL_37:
            *v59 = v60;
            LOBYTE(v48) = 1;
            goto LABEL_19;
          }

          v29 = 0;
        }
        LOBYTE(v48) = 0;
        goto LABEL_18;
      }
    }
    v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v18, (uint64_t)&v70, v20, v83, 16);
    if (v21)
      continue;
    break;
  }
LABEL_9:

  v29 = 0;
  v30 = 0;
LABEL_17:
  LOBYTE(v48) = 0;
  v37 = v9;
  v38 = v69;
LABEL_18:
  v49 = v68;
LABEL_19:

  return v48;
}

+ (BOOL)isPhoneNumber:(id)a3 equivalentToExistingPhoneNumber:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  const char *v13;
  uint64_t v14;
  double v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  double v28;
  void *v29;
  const char *v30;
  double v31;
  const char *v32;
  double v33;
  void *v34;
  const char *v35;
  double v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  double v40;
  _BOOL4 v41;
  NSObject *v42;
  const __CFString *v43;
  int v45;
  id v46;
  __int16 v47;
  id v48;
  __int16 v49;
  const __CFString *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend_length(v5, v7, v8, v9) || objc_msgSend_length(v6, v10, v11, v12))
  {
    if (objc_msgSend_length(v5, v10, v11, v12) && objc_msgSend_length(v6, v13, v14, v15))
    {
      objc_msgSend__IDFromFZIDType_(v6, v16, 0, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__stripFZIDPrefix(v18, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend__IDFromFZIDType_(v5, v23, 0, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__stripFZIDPrefix(v25, v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend_hasPrefix_(v22, v30, (uint64_t)CFSTR("+"), v31))
      {
        objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v32, (uint64_t)CFSTR("+"), v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByRemovingCharactersFromSet_(v22, v35, (uint64_t)v34, v36);
        v37 = objc_claimAutoreleasedReturnValue();

        v22 = (void *)v37;
      }
      v41 = (_IDSAreIDsEquivalent(v29, v22) & 1) != 0
         || (_IDSAreIDsEquivalent(v22, v29) & 1) != 0
         || objc_msgSend_rangeOfString_(v22, v38, (uint64_t)v29, v40) != 0x7FFFFFFFFFFFFFFFLL
         || objc_msgSend_rangeOfString_(v29, v38, (uint64_t)v22, v40) != 0x7FFFFFFFFFFFFFFFLL;
      objc_msgSend_sms(MEMORY[0x1E0D36AA8], v38, v39, v40);
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v43 = CFSTR("NO");
        v45 = 138412802;
        v46 = v5;
        v47 = 2112;
        if (v41)
          v43 = CFSTR("YES");
        v48 = v6;
        v49 = 2112;
        v50 = v43;
        _os_log_impl(&dword_19B949000, v42, OS_LOG_TYPE_DEFAULT, "Determined whether phone numbers are equivalent { phoneNumber: %@, existingPhoneNumber: %@, equivalent: %@ }", (uint8_t *)&v45, 0x20u);
      }

    }
    else
    {
      LOBYTE(v41) = 0;
    }
  }
  else
  {
    LOBYTE(v41) = 1;
  }

  return v41;
}

- (BOOL)isPhoneNumberEmergencyNumber:(id)a3
{
  id v4;
  const char *v5;
  BOOL v6;
  void *v7;
  const char *v8;
  double v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id coreTelephonyClient;
  void *v19;
  const char *v20;
  double v21;
  char isEmergencyNumber_number_error;
  id v23;
  const char *v24;
  uint64_t v25;
  double v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  double v30;
  void *v31;
  __int128 v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((IMStringIsInHardcodedEmergencyNumberSet() & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend_currentSIMsWithError_(self, v5, 0, 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v35, v9, v45, 16);
    if (v10)
    {
      v14 = v10;
      v15 = *(_QWORD *)v36;
      *(_QWORD *)&v13 = 138412802;
      v33 = v13;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v36 != v15)
            objc_enumerationMutation(v7);
          v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          coreTelephonyClient = self->_coreTelephonyClient;
          objc_msgSend_context(v17, v11, v12, *(double *)&v13, v33);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 0;
          isEmergencyNumber_number_error = objc_msgSend_isEmergencyNumber_number_error_(coreTelephonyClient, v20, (uint64_t)v19, v21, v4, &v34);
          v23 = v34;

          if (v23)
          {
            objc_msgSend_sms(MEMORY[0x1E0D36AA8], v24, v25, v26);
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend_context(v17, v28, v29, v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v33;
              v40 = v4;
              v41 = 2112;
              v42 = v31;
              v43 = 2112;
              v44 = v23;
              _os_log_error_impl(&dword_19B949000, v27, OS_LOG_TYPE_ERROR, "Failed to check if number is emergency number { phoneNumber: %@, context: %@, error: %@ }", buf, 0x20u);

            }
          }

          if ((isEmergencyNumber_number_error & 1) != 0)
          {
            v6 = 1;
            goto LABEL_17;
          }
        }
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v11, (uint64_t)&v35, *(double *)&v13, v45, 16);
        if (v14)
          continue;
        break;
      }
    }
    v6 = 0;
LABEL_17:

  }
  return v6;
}

- (id)CTPNRForSIM:(id)a3
{
  id v3;
  IDSCTPNR *v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;

  v3 = a3;
  v4 = [IDSCTPNR alloc];
  v5 = objc_alloc(MEMORY[0x1E0CA6E38]);
  v8 = (void *)objc_msgSend_initWithQueue_(v5, v6, 0, v7);
  v11 = (void *)objc_msgSend__initWithCoreTelephonyClient_SIM_(v4, v9, (uint64_t)v8, v10, v3);

  return v11;
}

- (void)addListener:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  const char *v6;
  double v7;

  if (a3)
  {
    p_lock = &self->_lock;
    v5 = a3;
    os_unfair_lock_lock(p_lock);
    objc_msgSend_addObject_(self->_listeners, v6, (uint64_t)v5, v7);

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)removeListener:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  const char *v6;
  double v7;

  if (a3)
  {
    p_lock = &self->_lock;
    v5 = a3;
    os_unfair_lock_lock(p_lock);
    objc_msgSend_removeObject_(self->_listeners, v6, (uint64_t)v5, v7);

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)_unlocked_iterateListenersForSelector:(SEL)a3 block:(id)a4
{
  void (**v5)(id, _QWORD);
  NSHashTable *v6;
  const char *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD))a4;
  os_unfair_lock_assert_owner(&self->_lock);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_listeners;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v16, v8, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v5[2](v5, v13);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v14, (uint64_t)&v16, v15, v20, 16);
    }
    while (v10);
  }

}

- (void)_iterateListenersForSelector:(SEL)a3 block:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  const char *v8;
  double v9;

  p_lock = &self->_lock;
  v7 = a4;
  os_unfair_lock_lock(p_lock);
  objc_msgSend__unlocked_iterateListenersForSelector_block_(self, v8, (uint64_t)a3, v9, v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)_checkRegistrationStateForContext:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  const char *v6;
  uint64_t v7;
  double v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  double v12;
  void *v13;
  id coreTelephonyClient;
  const char *v15;
  double v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  id v20;
  double v21;
  void *v22;
  uint64_t isReady;
  const char *v24;
  double v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  double v29;
  void *v30;
  int v31;
  const char *v32;
  uint64_t v33;
  double v34;
  const char *v35;
  double v36;
  const char *v37;
  double v38;
  NSObject *v39;
  NSObject *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_labelID(v4, v6, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v9, v10, v12);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v4;
      _os_log_impl(&dword_19B949000, v39, OS_LOG_TYPE_DEFAULT, "No label ID found for context -- ignoring { context: %@ }", buf, 0xCu);
    }

    goto LABEL_15;
  }
  objc_msgSend_objectForKeyedSubscript_(self->_registrationStateByLabelID, v9, (uint64_t)v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  coreTelephonyClient = self->_coreTelephonyClient;
  v44 = 0;
  objc_msgSend_getPNRContext_outError_(coreTelephonyClient, v15, (uint64_t)v4, v16, &v44);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v44;
  if (v17)
  {
    v22 = (void *)MEMORY[0x1E0CB37E8];
    isReady = objc_msgSend_isReady(v17, v18, v19, v21);
    objc_msgSend_numberWithBool_(v22, v24, isReady, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v26;
    if (!v13
      || !v26
      || (v31 = objc_msgSend_BOOLValue(v26, v27, v28, v29),
          v31 != objc_msgSend_BOOLValue(v13, v32, v33, v34)))
    {
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = sub_19BA9E7E8;
      v41[3] = &unk_1E3C21E18;
      v42 = v4;
      v43 = v30;
      objc_msgSend__unlocked_iterateListenersForSelector_block_(self, v37, (uint64_t)sel_SIM_didUpdateRegistrationState_, v38, v41);

    }
    objc_msgSend_setObject_forKeyedSubscript_(self->_registrationStateByLabelID, v35, (uint64_t)v30, v36, v11);
  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v18, v19, v21);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v20;
      _os_log_impl(&dword_19B949000, v40, OS_LOG_TYPE_DEFAULT, "Failed loading PNRContext -- exiting { error: %@ }", buf, 0xCu);
    }

    os_unfair_lock_unlock(p_lock);
    v30 = 0;
  }

  if (v17)
LABEL_15:
    os_unfair_lock_unlock(p_lock);

}

- (void)_locked_accessCache:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)dualSimCapabilityDidChange
{
  uint64_t v2;
  double v3;
  NSObject *v5;
  const char *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  objc_msgSend_sms(MEMORY[0x1E0D36AA8], a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "Sim cap changed -- clearing value", buf, 2u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_19BA9E944;
  v7[3] = &unk_1E3C1F898;
  v7[4] = self;
  objc_msgSend__locked_accessCache_(self, v6, (uint64_t)v7, COERCE_DOUBLE(3221225472));
}

- (void)SIMStatusDidChange:(id)a3 status:(id)a4
{
  double v4;
  NSObject *v6;
  const char *v7;
  _QWORD v8[5];
  uint8_t buf[16];

  objc_msgSend_sms(MEMORY[0x1E0D36AA8], a2, (uint64_t)a3, v4, a4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v6, OS_LOG_TYPE_DEFAULT, "Sim status changed -- clearing value", buf, 2u);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_19BA9EA24;
  v8[3] = &unk_1E3C1F898;
  v8[4] = self;
  objc_msgSend__locked_accessCache_(self, v7, (uint64_t)v8, COERCE_DOUBLE(3221225472));
}

- (void)subscriptionInfoDidChange
{
  uint64_t v2;
  double v3;
  NSObject *v5;
  const char *v6;
  const char *v7;
  double v8;
  _QWORD v9[5];
  uint8_t buf[16];

  objc_msgSend_sms(MEMORY[0x1E0D36AA8], a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "Sub info changed -- clearing value", buf, 2u);
  }

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_19BA9EB1C;
  v9[3] = &unk_1E3C1F898;
  v9[4] = self;
  objc_msgSend__locked_accessCache_(self, v6, (uint64_t)v9, COERCE_DOUBLE(3221225472));
  objc_msgSend__iterateListenersForSelector_block_(self, v7, (uint64_t)sel_SIMInformationDidChange, v8, &unk_1E3C1BC70);
}

- (void)phoneNumberChanged:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  NSObject *v9;
  const char *v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  _QWORD v15[5];
  uint8_t buf[16];

  v4 = (void *)MEMORY[0x1E0D36AA8];
  v5 = a3;
  objc_msgSend_sms(v4, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v9, OS_LOG_TYPE_DEFAULT, "Phone number changed -- clearing value", buf, 2u);
  }

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_19BA9EC50;
  v15[3] = &unk_1E3C1F898;
  v15[4] = self;
  objc_msgSend__locked_accessCache_(self, v10, (uint64_t)v15, COERCE_DOUBLE(3221225472));
  objc_msgSend__iterateListenersForSelector_block_(self, v11, (uint64_t)sel_SIMInformationDidChange, v12, &unk_1E3C21E58);
  objc_msgSend__checkRegistrationStateForContext_(self, v13, (uint64_t)v5, v14);

}

- (void)context:(id)a3 pnrSupportChanged:(BOOL)a4
{
  double v4;
  NSObject *v6;
  const char *v7;
  const char *v8;
  double v9;
  _QWORD v10[5];
  uint8_t buf[16];

  objc_msgSend_sms(MEMORY[0x1E0D36AA8], a2, (uint64_t)a3, v4, a4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v6, OS_LOG_TYPE_DEFAULT, "PNR support changed -- clearing value", buf, 2u);
  }

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_19BA9ED60;
  v10[3] = &unk_1E3C1F898;
  v10[4] = self;
  objc_msgSend__locked_accessCache_(self, v7, (uint64_t)v10, COERCE_DOUBLE(3221225472));
  objc_msgSend__iterateListenersForSelector_block_(self, v8, (uint64_t)sel_SIMInformationDidChange, v9, &unk_1E3C21E78);
}

- (void)pnrReadyStateNotification:(id)a3 regState:(BOOL)a4
{
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  double v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  double v13;
  _QWORD v14[5];
  uint8_t buf[16];

  v5 = (void *)MEMORY[0x1E0D36AA8];
  v6 = a3;
  objc_msgSend_sms(v5, v7, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v10, OS_LOG_TYPE_DEFAULT, "PNR ready state changed -- clearing value", buf, 2u);
  }

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_19BA9EE6C;
  v14[3] = &unk_1E3C1F898;
  v14[4] = self;
  objc_msgSend__locked_accessCache_(self, v11, (uint64_t)v14, COERCE_DOUBLE(3221225472));
  objc_msgSend__checkRegistrationStateForContext_(self, v12, (uint64_t)v6, v13);

}

- (void)carrierBundleChange:(id)a3
{
  double v3;
  NSObject *v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  uint8_t v10[16];

  objc_msgSend_sms(MEMORY[0x1E0D36AA8], a2, (uint64_t)a3, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "Carrier bundle changed -- clearing value", v10, 2u);
  }

  objc_msgSend__iterateListenersForSelector_block_(self, v6, (uint64_t)sel_carrierBundleInformationDidChange, v7, &unk_1E3C21E98);
  objc_msgSend__iterateListenersForSelector_block_(self, v8, (uint64_t)sel_SIMInformationDidChange, v9, &unk_1E3C1BC90);
}

- (void)operatorBundleChange:(id)a3
{
  double v3;
  NSObject *v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  uint8_t v10[16];

  objc_msgSend_sms(MEMORY[0x1E0D36AA8], a2, (uint64_t)a3, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "Operator bundle changed -- clearing value", v10, 2u);
  }

  objc_msgSend__iterateListenersForSelector_block_(self, v6, (uint64_t)sel_carrierBundleInformationDidChange, v7, &unk_1E3C21EB8);
  objc_msgSend__iterateListenersForSelector_block_(self, v8, (uint64_t)sel_SIMInformationDidChange, v9, &unk_1E3C1BCF0);
}

- (void)didDetectSimDeactivation:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  double v10;
  NSObject *v11;
  id v12;
  id v13;
  const char *v14;
  double v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  objc_msgSend_sms(MEMORY[0x1E0D36AA8], v8, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v11, OS_LOG_TYPE_DEFAULT, "Detected sim deactivation", buf, 2u);
  }

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_19BA9F124;
  v16[3] = &unk_1E3C21E18;
  v17 = v6;
  v18 = v7;
  v12 = v7;
  v13 = v6;
  objc_msgSend__iterateListenersForSelector_block_(self, v14, (uint64_t)sel_SIM_didDeactivateWithInfo_, v15, v16);

}

- (void)context:(id)a3 capabilitiesChanged:(id)a4
{
  double v4;
  NSObject *v6;
  const char *v7;
  _QWORD v8[5];
  uint8_t buf[16];

  objc_msgSend_sms(MEMORY[0x1E0D36AA8], a2, (uint64_t)a3, v4, a4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B949000, v6, OS_LOG_TYPE_DEFAULT, "Sim capabilitiesChanged -- clearing value", buf, 2u);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_19BA9F238;
  v8[3] = &unk_1E3C1F898;
  v8[4] = self;
  objc_msgSend__locked_accessCache_(self, v7, (uint64_t)v8, COERCE_DOUBLE(3221225472));
}

- (void)systemApplicationDidBecomeActive
{
  ((void (*)(IDSCTAdapter *, char *))MEMORY[0x1E0DE7D20])(self, sel_subscriptionInfoDidChange);
}

- (NSHashTable)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
  objc_storeStrong((id *)&self->_listeners, a3);
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return (CoreTelephonyClient *)self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
  objc_storeStrong(&self->_coreTelephonyClient, a3);
}

- (IDSCTAdapterCache)cache
{
  return (IDSCTAdapterCache *)self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong(&self->_cache, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSMutableDictionary)registrationStateByLabelID
{
  return self->_registrationStateByLabelID;
}

- (void)setRegistrationStateByLabelID:(id)a3
{
  objc_storeStrong((id *)&self->_registrationStateByLabelID, a3);
}

- (IMSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_systemMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_registrationStateByLabelID, 0);
  objc_storeStrong(&self->_cache, 0);
  objc_storeStrong(&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
}

@end
