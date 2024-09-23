@implementation HUNoiseSettings

- (id)_valueForPreferenceKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[HUNoiseSettings domainAccessor](self, "domainAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "synchronize");

  -[HUNoiseSettings domainAccessor](self, "domainAccessor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NPSDomainAccessor)domainAccessor
{
  NPSDomainAccessor *domainAccessor;
  id v4;
  NPSDomainAccessor *v5;
  NPSDomainAccessor *v6;

  domainAccessor = self->_domainAccessor;
  if (!domainAccessor)
  {
    v4 = objc_alloc(MEMORY[0x1E0D51610]);
    v5 = (NPSDomainAccessor *)objc_msgSend(v4, "initWithDomain:", kAXSNoisePreferenceDomain);
    v6 = self->_domainAccessor;
    self->_domainAccessor = v5;

    domainAccessor = self->_domainAccessor;
  }
  return domainAccessor;
}

- (BOOL)onboardingCompleted
{
  return AXSettingsReturnBoolValue(CFSTR("OnboardingCompleted"));
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7 != -1)
    dispatch_once(&sharedInstance_onceToken_7, &__block_literal_global_17);
  return (id)sharedInstance_Settings_3;
}

void __33__HUNoiseSettings_sharedInstance__block_invoke()
{
  HUNoiseSettings *v0;
  void *v1;

  v0 = objc_alloc_init(HUNoiseSettings);
  v1 = (void *)sharedInstance_Settings_3;
  sharedInstance_Settings_3 = (uint64_t)v0;

}

- (HUNoiseSettings)init
{
  HUNoiseSettings *v2;
  NSLock *v3;
  NSLock *synchronizeDomainsLock;
  NSMutableSet *v5;
  NSMutableSet *registeredNotifications;
  NSMutableSet *v7;
  NSMutableSet *synchronizePreferences;
  NSMutableDictionary *v9;
  NSMutableDictionary *updateBlocks;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HUNoiseSettings;
  v2 = -[HUNoiseSettings init](&v15, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    synchronizeDomainsLock = v2->_synchronizeDomainsLock;
    v2->_synchronizeDomainsLock = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    registeredNotifications = v2->_registeredNotifications;
    v2->_registeredNotifications = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    synchronizePreferences = v2->_synchronizePreferences;
    v2->_synchronizePreferences = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    updateBlocks = v2->_updateBlocks;
    v2->_updateBlocks = v9;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)AccessibilitySettingsChangedOnCompanion, CFSTR("NanoNoiseSettingsChanged"), 0, (CFNotificationSuspensionBehavior)0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, sel_pairedWatchDidChange_, *MEMORY[0x1E0D517D0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel_pairedWatchDidChange_, *MEMORY[0x1E0D517A8], 0);

  }
  return v2;
}

- (void)pairedWatchDidChange:(id)a3
{
  NPSDomainAccessor *domainAccessor;

  domainAccessor = self->_domainAccessor;
  self->_domainAccessor = 0;

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HUNoiseSettings;
  -[HUNoiseSettings dealloc](&v4, sel_dealloc);
}

- (void)_handlePreferenceChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_AXNotification_"), &stru_1EA8EC4E0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSLock lock](self->_synchronizeDomainsLock, "lock");
  -[HUNoiseSettings synchronizePreferences](self, "synchronizePreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v8);

  -[HUNoiseSettings updateBlocks](self, "updateBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  -[NSLock unlock](self->_synchronizeDomainsLock, "unlock");
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &__block_literal_global_55);

}

void __44__HUNoiseSettings__handlePreferenceChanged___block_invoke(uint64_t a1, void *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  objc_msgSend(a2, "objectAtIndexedSubscript:", 1);
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v2[2]();
    v2 = v3;
  }

}

- (id)notificationForPreferenceKey:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("_AXNotification_"), a3);
}

- (id)notificationForNoiseEnabled
{
  return -[HUNoiseSettings notificationForPreferenceKey:](self, "notificationForPreferenceKey:", CFSTR("NoiseEnabled"));
}

- (id)_preferenceKeyForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  if (_preferenceKeyForSelector__onceToken != -1)
    dispatch_once(&_preferenceKeyForSelector__onceToken, &__block_literal_global_59_1);
  v4 = (void *)_preferenceKeyForSelector__SelectorMap;
  NSStringFromSelector(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = CFSTR("UnknownKey");
  v8 = v7;

  return v8;
}

void __45__HUNoiseSettings__preferenceKeyForSelector___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;

  v12 = objc_alloc(MEMORY[0x1E0C99D80]);
  NSStringFromSelector(sel_noiseEnabled);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_onboardingCompleted);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_notificationsEnabled);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_notificationThreshold);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_notificationMuteDate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_currentLeq);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_leqTimestamp);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_leqDuration);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_migratedThreshold);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_thresholdVersion);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_internalLoggingEnabled);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v12, "initWithObjectsAndKeys:", CFSTR("NoiseEnabled"), v13, CFSTR("OnboardingCompleted"), v0, CFSTR("NotificationsEnabled"), v1, CFSTR("NotificationsThreshold"), v2, CFSTR("NotificationsMuteDate"), v3, CFSTR("CurrentLeq"), v4, CFSTR("LeqTimestamp"), v5, CFSTR("LeqDuration"), v6, CFSTR("ThresholdMigration"),
          v7,
          CFSTR("ThresholdVersion"),
          v8,
          CFSTR("NoiseInternalLogging"),
          v9,
          0);
  v11 = (void *)_preferenceKeyForSelector__SelectorMap;
  _preferenceKeyForSelector__SelectorMap = v10;

}

- (void)_registerForNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (_registerForNotification__onceToken != -1)
    dispatch_once(&_registerForNotification__onceToken, &__block_literal_global_85);
  v5 = (void *)_registerForNotification__RegistrationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__HUNoiseSettings__registerForNotification___block_invoke_2;
  v7[3] = &unk_1EA8E81F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performSynchronousWritingBlock:", v7);

}

void __44__HUNoiseSettings__registerForNotification___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CF3940]);
  v1 = (void *)_registerForNotification__RegistrationQueue;
  _registerForNotification__RegistrationQueue = (uint64_t)v0;

}

void __44__HUNoiseSettings__registerForNotification___block_invoke_2(uint64_t a1)
{
  __CFString *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "registeredNotifications");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "notificationForPreferenceKey:", *(_QWORD *)(a1 + 40));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axSettingsHandlePreferenceChanged, v2, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  }
}

- (void)registerUpdateBlock:(id)a3 forRetrieveSelector:(SEL)a4 withListener:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HUNoiseSettingsListenerHelper *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock lock](self->_synchronizeDomainsLock, "lock");
  -[HUNoiseSettings updateBlocks](self, "updateBlocks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  -[NSLock unlock](self->_synchronizeDomainsLock, "unlock");
  -[HUNoiseSettings _preferenceKeyForSelector:](self, "_preferenceKeyForSelector:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v25[0] = v10;
    v15 = (void *)MEMORY[0x1DF0EB808](v8);
    v25[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "addObject:", v16);
    objc_getAssociatedObject(v9, &AXHASettingsDestructionHelperKey);
    v17 = (HUNoiseSettingsListenerHelper *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v17 = -[HUNoiseSettingsListenerHelper initWithListenerAddress:]([HUNoiseSettingsListenerHelper alloc], "initWithListenerAddress:", v9);
      objc_setAssociatedObject(v9, &AXHASettingsDestructionHelperKey, v17, (void *)1);
    }
    -[HUNoiseSettingsListenerHelper addSelectorKey:](v17, "addSelectorKey:", a4);
    -[HUNoiseSettings _registerForNotification:](self, "_registerForNotification:", v13);

  }
  else
  {
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __72__HUNoiseSettings_registerUpdateBlock_forRetrieveSelector_withListener___block_invoke;
    v23 = &unk_1EA8E8A30;
    v24 = v10;
    objc_msgSend(v14, "indexesOfObjectsPassingTest:", &v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count", v20, v21, v22, v23))
      objc_msgSend(v14, "removeObjectsAtIndexes:", v18);

  }
  -[NSLock lock](self->_synchronizeDomainsLock, "lock");
  -[HUNoiseSettings updateBlocks](self, "updateBlocks");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v14, v13);

  -[NSLock unlock](self->_synchronizeDomainsLock, "unlock");
}

uint64_t __72__HUNoiseSettings_registerUpdateBlock_forRetrieveSelector_withListener___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)preferenceIsSetForRetrieveSelector:(SEL)a3
{
  HUNoiseSettings *v3;
  void *v4;
  void *v5;

  v3 = self;
  -[HUNoiseSettings _preferenceKeyForSelector:](self, "_preferenceKeyForSelector:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNoiseSettings _valueForPreferenceKey:](v3, "_valueForPreferenceKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = v5 != 0;

  return (char)v3;
}

- (void)_setValue:(id)a3 forPreferenceKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  __CFNotificationCenter *DarwinNotifyCenter;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[HUNoiseSettings domainAccessor](self, "domainAccessor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

  -[HUNoiseSettings domainAccessor](self, "domainAccessor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "synchronize");

  v11 = (void *)objc_opt_new();
  v12 = kAXSNoisePreferenceDomain;
  v13 = (void *)MEMORY[0x1E0C99E60];
  v18[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "synchronizeNanoDomain:keys:", v12, v15);

  -[HUNoiseSettings notificationForPreferenceKey:](self, "notificationForPreferenceKey:", v6);
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, v16, 0, 0, 1u);
  }

}

- (void)_synchronizeIfNecessary:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSLock lock](self->_synchronizeDomainsLock, "lock");
  -[HUNoiseSettings synchronizePreferences](self, "synchronizePreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v5))
  {
    CFPreferencesAppSynchronize((CFStringRef)kAXSNoisePreferenceDomain);
    objc_msgSend(v4, "removeObject:", v5);
  }
  -[NSLock unlock](self->_synchronizeDomainsLock, "unlock");

}

- (BOOL)noiseEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("NoiseEnabled"));
}

- (void)setNoiseEnabled:(BOOL)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNoiseSettings _setValue:forPreferenceKey:](self, "_setValue:forPreferenceKey:", v4, CFSTR("NoiseEnabled"));

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v5, "isHealthDataSubmissionAllowed");

  if ((_DWORD)v4)
    AnalyticsSendEventLazy();
}

id __35__HUNoiseSettings_setNoiseEnabled___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)setOnboardingCompleted:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HUNoiseSettings _setValue:forPreferenceKey:](self, "_setValue:forPreferenceKey:", v4, CFSTR("OnboardingCompleted"));

}

- (BOOL)notificationsEnabled
{
  void *v3;
  void *v4;
  char v5;

  -[HUNoiseSettings notificationsEnabledOverride](self, "notificationsEnabledOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return AXSettingsReturnBoolValue(CFSTR("NotificationsEnabled"));
  -[HUNoiseSettings notificationsEnabledOverride](self, "notificationsEnabledOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setNotificationsEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HUNoiseSettings _setValue:forPreferenceKey:](self, "_setValue:forPreferenceKey:", v4, CFSTR("NotificationsEnabled"));

}

- (unint64_t)notificationThreshold
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[HUNoiseSettings notificationsThreshholdOverride](self, "notificationsThreshholdOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return AXSettingsReturnUnsignedIntegerValue(CFSTR("NotificationsThreshold"), 90);
  -[HUNoiseSettings notificationsThreshholdOverride](self, "notificationsThreshholdOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  return v5;
}

- (void)setNotificationThreshold:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HUNoiseSettings _setValue:forPreferenceKey:](self, "_setValue:forPreferenceKey:", v4, CFSTR("NotificationsThreshold"));

}

- (NSDate)notificationMuteDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", AXSettingsReturnDoubleValue(CFSTR("NotificationsMuteDate")));
}

- (void)setNotificationMuteDate:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HUNoiseSettings _setValue:forPreferenceKey:](self, "_setValue:forPreferenceKey:", v5, CFSTR("NotificationsMuteDate"));

}

- (double)currentLeq
{
  return AXSettingsReturnDoubleValue(CFSTR("CurrentLeq"));
}

- (void)setCurrentLeq:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HUNoiseSettings _setValue:forPreferenceKey:](self, "_setValue:forPreferenceKey:", v4, CFSTR("CurrentLeq"));

}

- (NSDate)leqTimestamp
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", AXSettingsReturnDoubleValue(CFSTR("LeqTimestamp")));
}

- (void)setLeqTimestamp:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HUNoiseSettings _setValue:forPreferenceKey:](self, "_setValue:forPreferenceKey:", v5, CFSTR("LeqTimestamp"));

}

- (double)leqDuration
{
  return AXSettingsReturnDoubleValue(CFSTR("LeqDuration"));
}

- (void)setLeqDuration:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HUNoiseSettings _setValue:forPreferenceKey:](self, "_setValue:forPreferenceKey:", v4, CFSTR("LeqDuration"));

}

- (BOOL)migratedThreshold
{
  return AXSettingsReturnBoolValue(CFSTR("ThresholdMigration"));
}

- (void)setMigratedThreshold:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HUNoiseSettings _setValue:forPreferenceKey:](self, "_setValue:forPreferenceKey:", v4, CFSTR("ThresholdMigration"));

}

- (unint64_t)thresholdVersion
{
  return AXSettingsReturnUnsignedIntegerValue(CFSTR("ThresholdVersion"), 0);
}

- (void)setThresholdVersion:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HUNoiseSettings _setValue:forPreferenceKey:](self, "_setValue:forPreferenceKey:", v4, CFSTR("ThresholdVersion"));

}

- (BOOL)internalLoggingEnabled
{
  return AXSettingsReturnBoolValue(CFSTR("NoiseInternalLogging"));
}

- (void)setInternalLoggingEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HUNoiseSettings _setValue:forPreferenceKey:](self, "_setValue:forPreferenceKey:", v4, CFSTR("NoiseInternalLogging"));

}

- (NSString)launchNoiseOnboardingTitle
{
  return (NSString *)HUNoiseLocString(CFSTR("ENABLE_NOISE"));
}

- (NSString)environmentalMeasurementsTitleDescription
{
  return (NSString *)HUNoiseLocString(CFSTR("ENVIRONMENTAL_TITLE"));
}

- (NSString)environmentalMeasurementsFooterDescription
{
  return (NSString *)HUNoiseLocString(CFSTR("ENVIRONMENTAL_MEASUREMENT_FOOTER"));
}

- (NSString)noiseThresholdSectionTitle
{
  return (NSString *)HUNoiseLocString(CFSTR("NOISE_NOTIFICATIONS"));
}

- (NSString)noiseThresholdTitleDescription
{
  return (NSString *)HUNoiseLocString(CFSTR("NOISE_THRESHOLD"));
}

- (NSAttributedString)noiseThresholdFooterDescriptionWithLink
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[HUNoiseSettings noiseThresholdFooterDescription](self, "noiseThresholdFooterDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v3);
  v11 = CFSTR("NSLink");
  -[HUNoiseSettings noiseThresholdFooterLinkURL](self, "noiseThresholdFooterLinkURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNoiseSettings noiseThresholdFooterLinkTitle](self, "noiseThresholdFooterLinkTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "rangeOfString:", v7);
  objc_msgSend(v4, "setAttributes:range:", v6, v8, v9);

  return (NSAttributedString *)v4;
}

- (NSString)noiseThresholdFooterDescription
{
  void *v3;
  void *v4;
  void *v6;

  HUNoiseLocString(CFSTR("NOISE_THRESHOLD_FOOTER"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNoiseSettings noiseThresholdFooterLinkTitle](self, "noiseThresholdFooterLinkTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AXCFormattedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)noiseThresholdFooterLinkTitle
{
  return (NSString *)HUNoiseLocString(CFSTR("NOISE_THRESHOLD_FOOTER_LINK"));
}

- (NSURL)noiseThresholdFooterLinkURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/HT209593"));
}

- (int64_t)noiseThresholdMinutesThreshold
{
  return 3;
}

- (int64_t)noiseThresholdCurrentValue
{
  if (-[HUNoiseSettings notificationsEnabled](self, "notificationsEnabled"))
    return -[HUNoiseSettings notificationThreshold](self, "notificationThreshold");
  else
    return 0;
}

- (NSArray)noiseThresholdOptions
{
  return (NSArray *)&unk_1EA9005B0;
}

- (id)localizedNoiseThresholdValue:(int64_t)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    HUNoiseLocString(CFSTR("DECIBELS"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    AXCFormattedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    HUNoiseLocString(CFSTR("OFF"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)localizedNoiseThresholdDetailValue:(int64_t)a3
{
  __CFString *v3;
  void *v4;
  __CFString *v5;
  void *v6;

  if (a3 > 89)
  {
    switch(a3)
    {
      case 'Z':
        v3 = CFSTR("LIMIT_90DB");
        goto LABEL_14;
      case '_':
        v3 = CFSTR("LIMIT_95DB");
        goto LABEL_14;
      case 'd':
        v3 = CFSTR("LIMIT_100DB");
        goto LABEL_14;
    }
LABEL_17:
    HUNoiseLocString(CFSTR("NO_NOTIFICATIONS"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = &stru_1EA8EC4E0;
    goto LABEL_15;
  }
  if (a3)
  {
    if (a3 == 80)
    {
      v3 = CFSTR("LIMIT_80DB");
      goto LABEL_14;
    }
    if (a3 == 85)
    {
      v3 = CFSTR("LIMIT_85DB");
LABEL_14:
      HUNoiseLocString(v3);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      HUNoiseLocString(CFSTR("LIMIT_PER_DAY"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      AXCFormattedString();
      v4 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
      return v4;
    }
    goto LABEL_17;
  }
  HUNoiseLocString(CFSTR("NO_NOTIFICATIONS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (NSString)noiseThresholdValueFooterDescription
{
  void *v3;
  void *v4;

  if (-[HUNoiseSettings noiseThresholdCurrentValue](self, "noiseThresholdCurrentValue") < 1)
    HUNoiseLocString(CFSTR("THRESHOLD_DESCRIPTION_FOOTER_NO_DECIBELS"));
  else
    HUNoiseLocString(CFSTR("THRESHOLD_DESCRIPTION_FOOTER"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNoiseSettings noiseThresholdMinutesThreshold](self, "noiseThresholdMinutesThreshold");
  AXCFormattedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setNotificationsEnabledOverride:(id)a3
{
  objc_storeStrong((id *)&self->_notificationsEnabledOverride, a3);
}

- (void)setNotificationsThreshholdOverride:(id)a3
{
  objc_storeStrong((id *)&self->_notificationsThreshholdOverride, a3);
}

- (BOOL)hearingProtectionDeviceAvailable
{
  return AXSettingsReturnBoolValue(CFSTR("HearingProtectionDeviceAvailablePreference"));
}

- (void)setHearingProtectionDeviceAvailable:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  HCHPInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Set hearingProtectionDeviceAvailable %d"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUNoiseSettings setHearingProtectionDeviceAvailable:]", 644, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x1E0D2F938];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F938], OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v6);
    v9 = v7;
    *(_DWORD *)buf = 136446210;
    v12 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNoiseSettings _setValue:forPreferenceKey:](self, "_setValue:forPreferenceKey:", v10, CFSTR("HearingProtectionDeviceAvailablePreference"));

}

- (NSNumber)notificationsEnabledOverride
{
  return self->_notificationsEnabledOverride;
}

- (NSNumber)notificationsThreshholdOverride
{
  return self->_notificationsThreshholdOverride;
}

- (NSMutableSet)registeredNotifications
{
  return self->_registeredNotifications;
}

- (void)setRegisteredNotifications:(id)a3
{
  objc_storeStrong((id *)&self->_registeredNotifications, a3);
}

- (NSMutableSet)synchronizePreferences
{
  return self->_synchronizePreferences;
}

- (void)setSynchronizePreferences:(id)a3
{
  objc_storeStrong((id *)&self->_synchronizePreferences, a3);
}

- (NSMutableDictionary)updateBlocks
{
  return self->_updateBlocks;
}

- (void)setUpdateBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_updateBlocks, a3);
}

- (void)setDomainAccessor:(id)a3
{
  objc_storeStrong((id *)&self->_domainAccessor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainAccessor, 0);
  objc_storeStrong((id *)&self->_updateBlocks, 0);
  objc_storeStrong((id *)&self->_synchronizePreferences, 0);
  objc_storeStrong((id *)&self->_registeredNotifications, 0);
  objc_storeStrong((id *)&self->_notificationsThreshholdOverride, 0);
  objc_storeStrong((id *)&self->_notificationsEnabledOverride, 0);
  objc_storeStrong((id *)&self->_synchronizeDomainsLock, 0);
}

@end
