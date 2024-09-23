@implementation FTSelectedPNRSubscription

- (FTSelectedPNRSubscription)init
{
  FTSelectedPNRSubscription *v2;
  NSRecursiveLock *v3;
  NSRecursiveLock *lock;
  id v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  CoreTelephonyClient *coreTelephonyClient;
  const char *v10;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FTSelectedPNRSubscription;
  v2 = -[FTSelectedPNRSubscription init](&v13, sel_init);
  if (v2)
  {
    v3 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    lock = v2->_lock;
    v2->_lock = v3;

    v5 = objc_alloc(MEMORY[0x1E0CA6E38]);
    im_primary_queue();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend_initWithQueue_(v5, v7, (uint64_t)v6);
    coreTelephonyClient = v2->_coreTelephonyClient;
    v2->_coreTelephonyClient = (CoreTelephonyClient *)v8;

    objc_msgSend_setDelegate_(v2->_coreTelephonyClient, v10, (uint64_t)v2);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_1A4C904CC, CFSTR("FTSelectedPNRSubscriptionChangedDistributedNotification"), 0, CFNotificationSuspensionBehaviorCoalesce);
  }
  return v2;
}

+ (FTSelectedPNRSubscription)sharedInstance
{
  if (qword_1ECF9D820 != -1)
    dispatch_once(&qword_1ECF9D820, &unk_1E4DD93B0);
  return (FTSelectedPNRSubscription *)(id)qword_1ECF9D868;
}

+ (BOOL)isPhoneNumber:(id)a3 equivalentToExistingPhoneNumber:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  _BOOL4 v30;
  NSObject *v31;
  const __CFString *v32;
  int v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  const __CFString *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend_length(v5, v7, v8) || objc_msgSend_length(v6, v9, v10))
  {
    if (objc_msgSend_length(v5, v9, v10) && objc_msgSend_length(v6, v11, v12))
    {
      objc_msgSend__IDFromFZIDType_(v6, v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__stripFZIDPrefix(v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend__IDFromFZIDType_(v5, v18, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__stripFZIDPrefix(v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend_hasPrefix_(v17, v23, (uint64_t)CFSTR("+")))
      {
        objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E0CB3500], v24, (uint64_t)CFSTR("+"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByRemovingCharactersFromSet_(v17, v26, (uint64_t)v25);
        v27 = objc_claimAutoreleasedReturnValue();

        v17 = (void *)v27;
      }
      v30 = (_FTAreIDsEquivalent(v22, v17) & 1) != 0
         || (_FTAreIDsEquivalent(v17, v22) & 1) != 0
         || objc_msgSend_rangeOfString_(v17, v28, (uint64_t)v22) != 0x7FFFFFFFFFFFFFFFLL
         || objc_msgSend_rangeOfString_(v22, v28, (uint64_t)v17) != 0x7FFFFFFFFFFFFFFFLL;
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v28, v29);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = CFSTR("NO");
        v34 = 138412802;
        v35 = v5;
        v36 = 2112;
        if (v30)
          v32 = CFSTR("YES");
        v37 = v6;
        v38 = 2112;
        v39 = v32;
        _os_log_impl(&dword_1A4C7F000, v31, OS_LOG_TYPE_DEFAULT, "Determined whether phone numbers are equivalent { phoneNumber: %@, existingPhoneNumber: %@, equivalent: %@ }", (uint8_t *)&v34, 0x20u);
      }

    }
    else
    {
      LOBYTE(v30) = 0;
    }
  }
  else
  {
    LOBYTE(v30) = 1;
  }

  return v30;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("FTSelectedPNRSubscriptionChangedDistributedNotification"), 0);
  v4.receiver = self;
  v4.super_class = (Class)FTSelectedPNRSubscription;
  -[FTSelectedPNRSubscription dealloc](&v4, sel_dealloc);
}

- (void)subscriptionInfoDidChange
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint8_t v7[16];

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Subscription info did change -- clearing cached selected phone number registration subscription", v7, 2u);
  }

  objc_msgSend__protected_invalidateCache(self, v5, v6);
}

- (void)phoneNumberChanged:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1A4C7F000, v7, OS_LOG_TYPE_DEFAULT, "Phone number changed -- clearing cached selected phone number registration subscription { context: %@ }", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend__protected_invalidateCache(self, v8, v9);
}

- (void)phoneNumberAvailable:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1A4C7F000, v7, OS_LOG_TYPE_DEFAULT, "Phone number became available -- clearing cached selected phone number registration subscription { context: %@ }", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend__protected_invalidateCache(self, v8, v9);
}

- (void)activeSubscriptionsDidChange
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint8_t v7[16];

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Active subscriptions did change -- clearing cached selected phone number registration subscription", v7, 2u);
  }

  objc_msgSend__protected_invalidateCache(self, v5, v6);
}

- (void)dualSimCapabilityDidChange
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint8_t v7[16];

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Dual SIM capability did change -- clearing cached selected phone number registration subscription", v7, 2u);
  }

  objc_msgSend__protected_invalidateCache(self, v5, v6);
}

- (id)_protected_reevaluateCacheIfNeededAndPersistUpdate:(BOOL)a3
{
  _BOOL8 v3;
  FTSelectedPNRSubscriptionCache *v5;
  const char *v6;
  void *v7;
  id v8;
  const char *v9;
  const char *v10;
  void *v11;
  id v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  CoreTelephonyClient *coreTelephonyClient;
  const char *v19;
  uint64_t DualSimCapability;
  id v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t isIdentityFallbackProhibitedForDeviceBasedOnCapability_subscriptionInfo;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  id v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  void *v46;
  id v47;
  const char *v48;
  FTSelectedPNRSubscriptionCache *cache;
  FTSelectedPNRSubscriptionCache *v50;
  FTSelectedPNRSubscriptionCache *v51;
  const char *v52;
  uint64_t v53;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;

  v3 = a3;
  objc_msgSend_lock(self->_lock, a2, a3);
  if (!self->_isCacheValid)
  {
    v5 = objc_alloc_init(FTSelectedPNRSubscriptionCache);
    v59 = 0;
    objc_msgSend__reevaluateCachedSubscriptionWithError_(self, v6, (uint64_t)&v59);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v59;
    objc_msgSend_setSubscriptionInfo_(v5, v9, (uint64_t)v7);

    v58 = 0;
    objc_msgSend__reevaluateCachedActiveSubscriptionWithError_(self, v10, (uint64_t)&v58);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v58;
    objc_msgSend_setActiveSubscriptionInfo_(v5, v13, (uint64_t)v11);

    objc_msgSend_subscriptionInfo(v5, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__reevaluateDualIdentityModeWithSubscriptionInfo_(self, v17, (uint64_t)v16);

    coreTelephonyClient = self->_coreTelephonyClient;
    v57 = 0;
    DualSimCapability = objc_msgSend_getDualSimCapability_(coreTelephonyClient, v19, (uint64_t)&v57);
    v21 = v57;
    objc_msgSend_setDualSIMCapability_(v5, v22, DualSimCapability);
    if (v21)
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v23, v24);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_1A4CBA6EC();

    }
    v26 = objc_msgSend_dualSIMCapability(v5, v23, v24);
    objc_msgSend_subscriptionInfo(v5, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    isIdentityFallbackProhibitedForDeviceBasedOnCapability_subscriptionInfo = objc_msgSend__isIdentityFallbackProhibitedForDeviceBasedOnCapability_subscriptionInfo_(self, v30, v26, v29);

    objc_msgSend_subscriptionInfo(v5, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_activeSubscriptionInfo(v5, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0;
    objc_msgSend__reevaluateCachedSelectedPhoneNumberRegistrationWithSubscription_activeContexts_fallbackProhibited_persistUpdate_error_(self, v38, (uint64_t)v34, v37, isIdentityFallbackProhibitedForDeviceBasedOnCapability_subscriptionInfo, v3, &v56);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v56;
    objc_msgSend_setSelectedContext_(v5, v41, (uint64_t)v39);

    objc_msgSend_selectedContext(v5, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0;
    objc_msgSend__reevaluateCachedSelectedPhoneNumberWithContext_error_(self, v45, (uint64_t)v44, &v55);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v55;
    objc_msgSend_setPhoneNumber_(v5, v48, (uint64_t)v46);

    cache = self->_cache;
    self->_cache = v5;
    v50 = v5;

    self->_isCacheValid = v8 == 0;
  }
  v51 = self->_cache;
  objc_msgSend_unlock(self->_lock, v52, v53);
  return v51;
}

- (void)_distributed_invalidateCache
{
  uint64_t v2;
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v5[16];

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, v2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A4C7F000, v3, OS_LOG_TYPE_DEFAULT, "Posting distributed notification to invalidate selected phone number subscription caches in other processes", v5, 2u);
  }

  byte_1EE788B20 = 1;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotificationWithOptions(DarwinNotifyCenter, CFSTR("FTSelectedPNRSubscriptionChangedDistributedNotification"), 0, 0, 0);
  im_dispatch_after_primary_queue();
}

- (void)_protected_invalidateCache
{
  uint64_t v2;
  FTSelectedPNRSubscriptionCache *cache;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self->_lock, a2, v2);
  cache = self->_cache;
  self->_cache = 0;

  self->_isCacheValid = 0;
  objc_msgSend_unlock(self->_lock, v5, v6);
}

- (id)selectedPhoneNumberRegistrationSubscriptionWithError:(id *)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend__protected_reevaluateCacheIfNeededAndPersistUpdate_(self, a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_selectedContext(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)persistSelectedPhoneNumberRegistrationSubscriptionIfNeeded
{
  uint64_t v2;
  const char *v4;
  id v5;

  objc_msgSend__protected_invalidateCache(self, a2, v2);
  v5 = (id)objc_msgSend__protected_reevaluateCacheIfNeededAndPersistUpdate_(self, v4, 1);
}

- (BOOL)isSelectedPhoneNumberRegistrationSubscriptionContext:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  int isEqualToString;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  _BOOL4 v35;
  NSObject *v36;
  const __CFString *v38;
  int v39;
  id v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  const __CFString *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend__protected_reevaluateCacheIfNeededAndPersistUpdate_(self, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_selectedContext(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedInstance(FTUserConfiguration, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_selectedPhoneNumberRegistrationSubscriptionLabels(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend_slotID(v4, v19, v20);
  v24 = objc_msgSend_slotID(v9, v22, v23);
  objc_msgSend_labelID(v4, v25, v26);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = 0;
  if (v29 && v18)
  {
    objc_msgSend_labelID(v4, v27, v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v31, v32, (uint64_t)v18);

  }
  if (v21 == v24)
    v35 = 1;
  else
    v35 = isEqualToString;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v33, v34);
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    v38 = CFSTR("NO");
    v39 = 138413058;
    v40 = v4;
    if (v35)
      v38 = CFSTR("YES");
    v41 = 2112;
    v42 = v9;
    v43 = 2112;
    v44 = v18;
    v45 = 2112;
    v46 = v38;
    _os_log_debug_impl(&dword_1A4C7F000, v36, OS_LOG_TYPE_DEBUG, "Determined if provided subscription context is selected IDS phone number subscription context { context: %@, selectedContext: %@, persistedLabel: %@, isMatching: %@ }", (uint8_t *)&v39, 0x2Au);
  }

  return v35;
}

- (id)selectedRegistrationPhoneNumberWithError:(id *)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend__protected_reevaluateCacheIfNeededAndPersistUpdate_(self, a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_phoneNumber(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)setSelectedPhoneNumberRegistrationSubscriptionNumber:(id)a3
{
  id v4;
  CoreTelephonyClient *coreTelephonyClient;
  const char *v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  id v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *i;
  void *v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  NSObject *v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  id v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  id v55;
  id v56;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  void *v64;
  uint8_t buf[4];
  id v66;
  __int16 v67;
  id v68;
  __int16 v69;
  id v70;
  __int16 v71;
  void *v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  coreTelephonyClient = self->_coreTelephonyClient;
  v63 = 0;
  objc_msgSend_getSubscriptionInfoWithError_(coreTelephonyClient, v6, (uint64_t)&v63);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v63;
  objc_msgSend_subscriptions(v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0x1E0D36000uLL;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v66 = v7;
    v67 = 2112;
    v68 = v8;
    _os_log_impl(&dword_1A4C7F000, v15, OS_LOG_TYPE_DEFAULT, "Loaded subscription info { info: %@, error: %@ }", buf, 0x16u);
  }

  if (objc_msgSend_count(v11, v16, v17))
  {
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v20 = v11;
    v24 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v59, v73, 16);
    if (v24)
    {
      v58 = v11;
      v25 = *(_QWORD *)v60;
      while (2)
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(_QWORD *)v60 != v25)
            objc_enumerationMutation(v20);
          if (v4)
          {
            v27 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i);
            v28 = objc_msgSend_slotID(v27, v22, v23);
            v30 = v28 == 1 ? &unk_1E4DE6538 : &unk_1E4DE6520;
            if (v28 == 2
               ? objc_msgSend_isEqualToNumber_(&unk_1E4DE6550, v29, (uint64_t)v4)
               : objc_msgSend_isEqualToNumber_(v30, v29, (uint64_t)v4))
            {
              v24 = v27;
              goto LABEL_25;
            }
          }
        }
        v24 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v59, v73, 16);
        if (v24)
          continue;
        break;
      }
LABEL_25:
      v11 = v58;
      v12 = 0x1E0D36000;
    }

    v36 = 0;
  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v18, v19);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v8)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v66 = v7;
        v67 = 2112;
        v68 = v11;
        v69 = 2112;
        v70 = v8;
        _os_log_error_impl(&dword_1A4C7F000, v33, OS_LOG_TYPE_ERROR, "Failed to fetch subscriptions { subscriptionInfo: %@, subscriptions: %@, error: %@ }", buf, 0x20u);
      }

      v36 = v8;
    }
    else
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        sub_1A4CBA74C();

      v36 = 0;
    }
    v24 = 0;
  }
  objc_msgSend_registration(*(void **)(v12 + 2728), v34, v35);
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_labelID(v24, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v66 = v4;
    v67 = 2112;
    v68 = v40;
    v69 = 2112;
    v70 = v24;
    v71 = 2112;
    v72 = v11;
    _os_log_impl(&dword_1A4C7F000, v37, OS_LOG_TYPE_DEFAULT, "Selected new phone number registration subscription context { subscriptionNumber: %@, labelID: %@, selectedSubscription: %@, availableSubscriptions: %@ }", buf, 0x2Au);

  }
  objc_msgSend_sharedInstance(FTUserConfiguration, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_labelID(v24, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v46;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v47, (uint64_t)&v64, 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSelectedPhoneNumberRegistrationSubscriptionLabels_(v43, v49, (uint64_t)v48);

  objc_msgSend__protected_invalidateCache(self, v50, v51);
  objc_msgSend__distributed_invalidateCache(self, v52, v53);
  v55 = (id)objc_msgSend__protected_reevaluateCacheIfNeededAndPersistUpdate_(self, v54, 0);
  v56 = v36;

  return v56;
}

- (BOOL)isDeviceInDualPhoneIdentityMode
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  char v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  int doesSubscriptionInfoContainMultipleLabels;
  const char *v14;
  uint64_t v15;
  char v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  const char *v57;
  char isEqualToString;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;

  objc_msgSend__protected_reevaluateCacheIfNeededAndPersistUpdate_(self, a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_dualSIMCapability(v3, v4, v5);
  v8 = objc_msgSend__isInDualPhoneIdentityModeBasedOnCapability_(self, v7, v6);
  objc_msgSend_subscriptionInfo(v3, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  doesSubscriptionInfoContainMultipleLabels = objc_msgSend__doesSubscriptionInfoContainMultipleLabels_(self, v12, (uint64_t)v11);

  if ((v8 & 1) != 0 || (v16 = 0, doesSubscriptionInfoContainMultipleLabels))
  {
    objc_msgSend_activeSubscriptionInfo(v3, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_subscriptions(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v20, v21, v22) == 1)
    {
      objc_msgSend_activeSubscriptionInfo(v3, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_subscriptions(v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_labelID(v31, v32, v33);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        objc_msgSend_selectedContext(v3, v34, v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_labelID(v37, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (v40)
        {
          v64 = v40;
          objc_msgSend_activeSubscriptionInfo(v3, v41, v42);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_subscriptions(v62, v43, v44);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_firstObject(v61, v45, v46);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_labelID(v60, v47, v48);
          v65 = v37;
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_selectedContext(v3, v50, v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_labelID(v52, v53, v54);
          v63 = v28;
          v55 = v25;
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v49, v57, (uint64_t)v56);

          v25 = v55;
          v28 = v63;

          v37 = v65;
          v40 = v64;
        }
        else
        {
          isEqualToString = 0;
        }

      }
      else
      {
        isEqualToString = 0;
      }

      v16 = isEqualToString ^ 1;
    }
    else
    {

      v16 = 1;
    }
  }

  return v16;
}

- (BOOL)_isInDualPhoneIdentityModeBasedOnCapability:(int64_t)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  int isDeviceInDualPhoneIdentityMode;
  const char *v8;
  uint64_t v9;
  _BOOL4 v11;
  NSObject *v12;
  const __CFString *v13;
  const __CFString *v14;
  int v16;
  const __CFString *v17;
  __int16 v18;
  int64_t v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend_sharedInstance(FTUserConfiguration, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isDeviceInDualPhoneIdentityMode = objc_msgSend_isDeviceInDualPhoneIdentityMode(v4, v5, v6);

  if (a3 == 2 || a3 == 4)
    v11 = isDeviceInDualPhoneIdentityMode;
  else
    v11 = 0;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v8, v9);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = CFSTR("NO");
    if (v11)
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    v16 = 138412802;
    v17 = v14;
    if (isDeviceInDualPhoneIdentityMode)
      v13 = CFSTR("YES");
    v18 = 2048;
    v19 = a3;
    v20 = 2112;
    v21 = v13;
    _os_log_impl(&dword_1A4C7F000, v12, OS_LOG_TYPE_DEFAULT, "Determined if device is in dual phone identity mode { isDualIdentity: %@, dualSIMCapability: %ld, isDeviceInDualPhoneIdentityMode: %@ }", (uint8_t *)&v16, 0x20u);
  }

  return v11;
}

- (BOOL)_isIdentityFallbackProhibitedForDeviceBasedOnCapability:(int64_t)a3 subscriptionInfo:(id)a4
{
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  char v14;
  BOOL v15;

  objc_msgSend_sharedInstance(FTUserConfiguration, a2, a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_selectedPhoneNumberRegistrationSubscriptionLabels(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend__isInDualPhoneIdentityModeBasedOnCapability_(self, v13, a3);
  if (v12)
    v15 = v14;
  else
    v15 = 0;

  return v15;
}

- (id)_reevaluateCachedSubscriptionWithError:(id *)a3
{
  CoreTelephonyClient *coreTelephonyClient;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  coreTelephonyClient = self->_coreTelephonyClient;
  v14 = 0;
  objc_msgSend_getSubscriptionInfoWithError_(coreTelephonyClient, a2, (uint64_t)&v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1A4C7F000, v9, OS_LOG_TYPE_DEFAULT, "Loaded subscription info { info: %@, error: %@ }", buf, 0x16u);
  }

  if (v6)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1A4CBA7C8();

  }
  if (a3)
    *a3 = objc_retainAutorelease(v6);

  return v5;
}

- (id)_reevaluateCachedActiveSubscriptionWithError:(id *)a3
{
  CoreTelephonyClient *coreTelephonyClient;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  coreTelephonyClient = self->_coreTelephonyClient;
  v14 = 0;
  objc_msgSend_getActiveContexts_(coreTelephonyClient, a2, (uint64_t)&v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1A4C7F000, v9, OS_LOG_TYPE_DEFAULT, "Loaded active contexts { contexts: %@, error: %@ }", buf, 0x16u);
  }

  if (v6)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1A4CBA828();

  }
  if (a3)
    *a3 = objc_retainAutorelease(v6);

  return v5;
}

- (BOOL)_doesSubscriptionInfoContainMultipleLabels:(id)a3
{
  void *v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend_subscriptions(a3, a2, (uint64_t)a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v16, v20, 16);
  if (v7)
  {
    v8 = 0;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v3);
        objc_msgSend_labelID(*(void **)(*((_QWORD *)&v16 + 1) + 8 * i), v5, v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend_length(v11, v12, v13);

        if (v14)
          ++v8;
      }
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v5, (uint64_t)&v16, v20, 16);
    }
    while (v7);
    LOBYTE(v7) = v8 > 1;
  }

  return v7;
}

- (BOOL)_doesSubscriptionInfoContainMultipleUniqueLabels:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  BOOL v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend_subscriptions(v3, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v26, v30, 16);
  if (v9)
  {
    v12 = v9;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v7);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend_labelID(v15, v10, v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend_length(v16, v17, v18);

        if (v19)
        {
          objc_msgSend_labelID(v15, v10, v11);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v4, v21, (uint64_t)v20);

        }
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v26, v30, 16);
    }
    while (v12);
  }

  v24 = (unint64_t)objc_msgSend_count(v4, v22, v23) > 1;
  return v24;
}

- (void)_reevaluateDualIdentityModeWithSubscriptionInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  char isDeviceInDualPhoneIdentityMode;
  const char *v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_sharedInstance(FTUserConfiguration, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isDeviceInDualPhoneIdentityMode = objc_msgSend_isDeviceInDualPhoneIdentityMode(v7, v8, v9);

  if ((isDeviceInDualPhoneIdentityMode & 1) == 0
    && objc_msgSend__doesSubscriptionInfoContainMultipleUniqueLabels_(self, v11, (uint64_t)v4))
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v4;
      _os_log_impl(&dword_1A4C7F000, v14, OS_LOG_TYPE_DEFAULT, "Determined that device has entered dual identity mode { subscriptionInfo: %@ }", (uint8_t *)&v19, 0xCu);
    }

    objc_msgSend_sharedInstance(FTUserConfiguration, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setIsDeviceInDualPhoneIdentityMode_(v17, v18, 1);

  }
}

- (id)_subscriptionFromAvailableSubscriptions:(id)a3 matchingSelectedLabel:(id)a4
{
  id v5;
  id v6;
  id v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v5;
  v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v19, v23, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        objc_msgSend_labelID(v14, v9, v10, (_QWORD)v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v15;
        if (v6 && v15 && objc_msgSend_isEqualToString_(v15, v16, (uint64_t)v6))
        {
          v11 = v14;

          goto LABEL_13;
        }

      }
      v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v19, v23, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_13:

  return v11;
}

- (id)_firstPresentSubscriptionFromAvailableSubscriptions:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = a3;
  v7 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend_labelID(v10, v5, v6, (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_length(v11, v12, v13))
        {
          v7 = v10;

          goto LABEL_11;
        }

      }
      v7 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v5, (uint64_t)&v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)_reevaluateCachedSelectedPhoneNumberRegistrationWithSubscription:(id)a3 activeContexts:(id)a4 fallbackProhibited:(BOOL)a5 persistUpdate:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v11;
  const char *v12;
  uint64_t v13;
  id v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  const char *v57;
  const char *v58;
  void *v59;
  const char *v60;
  NSObject *v61;
  const char *v62;
  uint64_t v63;
  NSObject *v64;
  const char *v65;
  uint64_t v66;
  NSObject *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  void *v72;
  uint8_t buf[4];
  id v74;
  __int16 v75;
  NSObject *v76;
  void *v77;
  _QWORD v78[2];

  v7 = a6;
  v8 = a5;
  v78[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v14 = a4;
  if (self->_coreTelephonyClient)
  {
    objc_msgSend_sharedInstance(FTUserConfiguration, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_selectedPhoneNumberRegistrationSubscriptionLabels(v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v18, v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_sharedInstance(FTUserConfiguration, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_selectedPhoneNumberRegistrationSubscriptionNumber(v24, v25, v26);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_subscriptions(v11, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_count(v29, v30, v31))
    {
      v46 = 0;
LABEL_24:
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v32, v33);
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v74 = v46;
        v75 = 2112;
        v76 = v21;
        _os_log_impl(&dword_1A4C7F000, v61, OS_LOG_TYPE_DEFAULT, "Determined selected phone number registration subscription context { selectedSubscription: %@, persistedLabel: %@ }", buf, 0x16u);
      }

      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v62, v63);
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v74 = v29;
        _os_log_impl(&dword_1A4C7F000, v64, OS_LOG_TYPE_DEFAULT, "Available subscriptions { available: %@ }", buf, 0xCu);
      }

      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v65, v66);
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_subscriptions(v14, v68, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v74 = v70;
        _os_log_impl(&dword_1A4C7F000, v67, OS_LOG_TYPE_DEFAULT, "Active subscriptions { active: %@ }", buf, 0xCu);

      }
      goto LABEL_31;
    }
    objc_msgSend__subscriptionFromAvailableSubscriptions_matchingSelectedLabel_(self, v32, (uint64_t)v29, v21);
    v34 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)v34;
    if (v34)
    {
      v38 = 0;
    }
    else if ((unint64_t)objc_msgSend_count(v29, v35, v36) < 2
           || (objc_msgSend__firstPresentSubscriptionFromAvailableSubscriptions_(self, v47, (uint64_t)v29),
               v34 = objc_claimAutoreleasedReturnValue(),
               (v38 = (void *)v34) == 0))
    {
      objc_msgSend_firstObject(v29, v47, v48);
      v34 = objc_claimAutoreleasedReturnValue();
      v38 = (void *)v34;
    }
    if (v8)
      v49 = v37;
    else
      v49 = (void *)v34;
    v46 = v49;
    objc_msgSend_labelID(v46, v50, v51);
    v52 = objc_claimAutoreleasedReturnValue();
    v55 = (void *)v52;
    if (v7 && v52)
    {
      objc_msgSend_sharedInstance(FTUserConfiguration, v53, v54);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v78[0] = v55;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v57, (uint64_t)v78, 1);
    }
    else
    {
      if (v21 || !v72 || !v52)
        goto LABEL_23;
      objc_msgSend_sharedInstance(FTUserConfiguration, v53, v54);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v55;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v58, (uint64_t)&v77, 1);
    }
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSelectedPhoneNumberRegistrationSubscriptionLabels_(v56, v60, (uint64_t)v59);

LABEL_23:
    goto LABEL_24;
  }
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v12, v13);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    sub_1A4CBA888(v21, v39, v40, v41, v42, v43, v44, v45);
  v46 = 0;
LABEL_31:

  return v46;
}

- (id)_reevaluateCachedSelectedPhoneNumberWithContext:(id)a3 error:(id *)a4
{
  const char *v6;
  uint64_t v7;
  id v8;
  CoreTelephonyClient *coreTelephonyClient;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  id v32;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  NSObject *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v8)
  {
    coreTelephonyClient = self->_coreTelephonyClient;
    v34 = 0;
    objc_msgSend_getPhoneNumber_error_(coreTelephonyClient, v6, (uint64_t)v8, &v34);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v34;
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v10)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        sub_1A4CBA954();

      objc_msgSend_number(v10, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_1A4CBA8F4();

      v11 = v11;
      v18 = 0;
      v19 = v11;
    }
  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v6, v7);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_1A4CBA8B8(v11);
    v18 = 0;
    v19 = 0;
    v10 = 0;
  }

  if (!objc_msgSend_length(v18, v20, v21))
  {
    v24 = (void *)CTSettingCopyMyPhoneNumber();
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v24;
      _os_log_impl(&dword_1A4C7F000, v27, OS_LOG_TYPE_DEFAULT, "No selected registration phone number found -- falling back { phoneNumberFallbackValue: %@ }", buf, 0xCu);
    }

    if (objc_msgSend_length(v24, v28, v29))
    {
      v30 = v24;

      v18 = v30;
    }

  }
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v22, v23);
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v36 = v18;
    v37 = 2112;
    v38 = v10;
    v39 = 2112;
    v40 = v19;
    _os_log_impl(&dword_1A4C7F000, v31, OS_LOG_TYPE_DEFAULT, "Returning selected registration phone number for device { phoneNumber: %@, phoneNumberInfo: %@, clientError: %@ }", buf, 0x20u);
  }

  if (a4)
    *a4 = objc_retainAutorelease(v19);
  v32 = v18;

  return v32;
}

- (BOOL)isPhoneNumberEmergencyNumber:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CoreTelephonyClient *coreTelephonyClient;
  char isEmergencyNumber_number_error;
  const char *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  const char *v26;
  char isPhoneNumberEmergencyNumber;
  __int128 v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((IMStringIsInHardcodedEmergencyNumberSet() & 1) != 0)
  {
LABEL_16:
    isPhoneNumberEmergencyNumber = 1;
  }
  else
  {
    objc_msgSend__protected_reevaluateCacheIfNeededAndPersistUpdate_(self, v5, 0);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_subscriptionInfo(v30, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_subscriptions(v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v32, v42, 16);
    if (v13)
    {
      v16 = v13;
      v17 = *(_QWORD *)v33;
      *(_QWORD *)&v15 = 138412802;
      v29 = v15;
      while (2)
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v33 != v17)
            objc_enumerationMutation(v11);
          v19 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v18);
          coreTelephonyClient = self->_coreTelephonyClient;
          v31 = 0;
          isEmergencyNumber_number_error = objc_msgSend_isEmergencyNumber_number_error_(coreTelephonyClient, v14, v19, v4, &v31, v29);
          v24 = v31;
          if (v24)
          {
            objc_msgSend_registration(MEMORY[0x1E0D36AA8], v22, v23);
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v29;
              v37 = v4;
              v38 = 2112;
              v39 = v19;
              v40 = 2112;
              v41 = v24;
              _os_log_error_impl(&dword_1A4C7F000, v25, OS_LOG_TYPE_ERROR, "Failed to check if number is emergency number { phoneNumber: %@, context: %@, error: %@ }", buf, 0x20u);
            }

          }
          if ((isEmergencyNumber_number_error & 1) != 0)
          {

            goto LABEL_16;
          }
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v32, v42, 16);
        if (v16)
          continue;
        break;
      }
    }

    isPhoneNumberEmergencyNumber = objc_msgSend__legacy_isPhoneNumberEmergencyNumber_(self, v26, (uint64_t)v4);
  }

  return isPhoneNumberEmergencyNumber;
}

- (BOOL)_legacy_isPhoneNumberEmergencyNumber:(id)a3
{
  const char *v3;
  uint64_t v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t IsEmergencyNumber;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  if (qword_1EE788A48 != -1)
    dispatch_once(&qword_1EE788A48, &unk_1E4DD9A28);
  if (qword_1EE788A50)
  {
    IsEmergencyNumber = _CTServerConnectionIsEmergencyNumber();
    if ((_DWORD)IsEmergencyNumber)
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v6, v7);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1A4CBA9F0(IsEmergencyNumber, IsEmergencyNumber, v9);

    }
  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v3, v4);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1A4CBA9C0(v10, v11, v12, v13, v14, v15, v16, v17);

  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
