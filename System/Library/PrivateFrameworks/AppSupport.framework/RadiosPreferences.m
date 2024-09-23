@implementation RadiosPreferences

- (RadiosPreferences)initWithQueue:(id)a3
{
  RadiosPreferences *v4;
  __CFSet *Mutable;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RadiosPreferences;
  v4 = -[RadiosPreferences init](&v7, sel_init);
  if (v4)
  {
    pthread_mutex_lock(&__sValidObjectsLock);
    Mutable = (__CFSet *)__sValidObjects;
    if (!__sValidObjects)
    {
      Mutable = CFSetCreateMutable(0, 0, 0);
      __sValidObjects = (uint64_t)Mutable;
    }
    CFSetAddValue(Mutable, v4);
    pthread_mutex_unlock(&__sValidObjectsLock);
    v4->_dispatchQueue = (OS_dispatch_queue *)a3;
    v4->radios_prefs_log = (OS_os_log *)os_log_create("com.apple.AppSupport", "RadiosPreferences");
    -[RadiosPreferences initializeSCPrefs:](v4, "initializeSCPrefs:", CFSTR("com.apple.radios.plist"));
    v4->_isCachedAirplaneModeValid = 0;
  }
  return v4;
}

- (RadiosPreferences)init
{
  return -[RadiosPreferences initWithQueue:](self, "initWithQueue:", MEMORY[0x1E0C80D38]);
}

- (void)release
{
  objc_super v3;

  pthread_mutex_lock(&__sValidObjectsLock);
  if (-[RadiosPreferences retainCount](self, "retainCount") == 1 && __sValidObjects)
    CFSetRemoveValue((CFMutableSetRef)__sValidObjects, self);
  pthread_mutex_unlock(&__sValidObjectsLock);
  v3.receiver = self;
  v3.super_class = (Class)RadiosPreferences;
  -[RadiosPreferences release](&v3, sel_release);
}

- (void)dealloc
{
  __SCPreferences *prefs;
  objc_super v4;

  prefs = self->_prefs;
  if (prefs)
  {
    SCPreferencesSetDispatchQueue(prefs, 0);
    CFRelease(self->_prefs);
  }

  v4.receiver = self;
  v4.super_class = (Class)RadiosPreferences;
  -[RadiosPreferences dealloc](&v4, sel_dealloc);
}

- (BOOL)airplaneMode
{
  BOOL result;
  void *v4;

  if (self->_isCachedAirplaneModeValid)
    return self->_cachedAirplaneMode;
  v4 = -[RadiosPreferences getValueForKey:](self, "getValueForKey:", CFSTR("AirplaneMode"));
  result = v4 == (void *)*MEMORY[0x1E0C9AE50];
  self->_cachedAirplaneMode = result;
  self->_isCachedAirplaneModeValid = 1;
  return result;
}

+ (BOOL)shouldMirrorAirplaneMode
{
  objc_class *v2;
  void *v3;
  void *v4;
  char v5;
  char v7;
  _QWORD v8[5];
  __int128 v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
  {
    v9 = xmmword_1E2881B20;
    v10 = 0;
    NanoPreferencesSyncLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
  {
    NSLog((NSString *)CFSTR("Class NPSDomainAccessor could not be loaded."), a2);
    return 0;
  }
  *(_QWORD *)&v9 = 0;
  *((_QWORD *)&v9 + 1) = &v9;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v2 = (objc_class *)getNPSDomainAccessorClass_softClass;
  v13 = getNPSDomainAccessorClass_softClass;
  if (!getNPSDomainAccessorClass_softClass)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __getNPSDomainAccessorClass_block_invoke;
    v8[3] = &unk_1E28819F8;
    v8[4] = &v9;
    __getNPSDomainAccessorClass_block_invoke((uint64_t)v8);
    v2 = *(objc_class **)(*((_QWORD *)&v9 + 1) + 40);
  }
  _Block_object_dispose(&v9, 8);
  v3 = (void *)objc_msgSend([v2 alloc], "initWithDomain:", CFSTR("com.apple.nano"));
  v4 = v3;
  if (!v3)
    return 0;
  v5 = objc_msgSend(v3, "BOOLForKey:keyExistsAndHasValidFormat:", CFSTR("mirror-airplane"), &v7);

  if (v7)
    return v5;
  else
    return 0;
}

- (void)setAirplaneMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *radios_prefs_log;
  _DWORD v7[2];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    radios_prefs_log = self->radios_prefs_log;
    if (os_log_type_enabled(radios_prefs_log, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109378;
      v7[1] = 1;
      v8 = 2114;
      v9 = objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n"));
      _os_log_impl(&dword_18EB0F000, radios_prefs_log, OS_LOG_TYPE_DEFAULT, "Setting airplane mode enabled: %i, backtrace:\n%{public}@", (uint8_t *)v7, 0x12u);
    }
  }
  if (objc_msgSend((id)objc_opt_class(), "shouldMirrorAirplaneMode"))
    -[RadiosPreferences setAirplaneModeInNSS:](self, "setAirplaneModeInNSS:", v3);
  else
    -[RadiosPreferences setAirplaneModeWithoutMirroring:](self, "setAirplaneModeWithoutMirroring:", v3);
}

- (void)setAirplaneModeInNSS:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  objc_class *v8;
  uint64_t v9;
  void *v10;
  dispatch_time_t v11;
  NSObject *radios_prefs_log;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  _QWORD v20[5];
  __int128 v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (!NanoSystemSettingsLibraryCore_frameworkLibrary)
  {
    v21 = xmmword_1E2881B38;
    v22 = 0;
    NanoSystemSettingsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (NanoSystemSettingsLibraryCore_frameworkLibrary)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3052000000;
    v17 = __Block_byref_object_copy__0;
    v18 = __Block_byref_object_dispose__0;
    v19 = 0;
    v5 = dispatch_semaphore_create(0);
    v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v7 = dispatch_queue_create("com.apple.AppSupport.AirplaneMode.NSSManager", v6);
    *(_QWORD *)&v21 = 0;
    *((_QWORD *)&v21 + 1) = &v21;
    v22 = 0x3052000000;
    v23 = __Block_byref_object_copy__0;
    v24 = __Block_byref_object_dispose__0;
    v8 = (objc_class *)getNSSManagerClass_softClass;
    v25 = getNSSManagerClass_softClass;
    v9 = MEMORY[0x1E0C809B0];
    if (!getNSSManagerClass_softClass)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __getNSSManagerClass_block_invoke;
      v20[3] = &unk_1E28819F8;
      v20[4] = &v21;
      __getNSSManagerClass_block_invoke((uint64_t)v20);
      v8 = *(objc_class **)(*((_QWORD *)&v21 + 1) + 40);
    }
    _Block_object_dispose(&v21, 8);
    v10 = (void *)objc_msgSend([v8 alloc], "initWithQueue:", v7);
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __42__RadiosPreferences_setAirplaneModeInNSS___block_invoke;
    v13[3] = &unk_1E2881B00;
    v13[4] = v5;
    v13[5] = &v14;
    objc_msgSend(v10, "enableAirplaneMode:completionHandler:", v3, v13);
    v11 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v5, v11) >= 1)
    {
      radios_prefs_log = self->radios_prefs_log;
      if (os_log_type_enabled(radios_prefs_log, OS_LOG_TYPE_FAULT))
        -[RadiosPreferences setAirplaneModeInNSS:].cold.1(v3, radios_prefs_log);
    }

    if (v15[5])
      -[RadiosPreferences setAirplaneModeWithoutMirroring:](self, "setAirplaneModeWithoutMirroring:", v3);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    NSLog((NSString *)CFSTR("Class NSSManager could not be loaded."), a2);
    -[RadiosPreferences setAirplaneModeWithoutMirroring:](self, "setAirplaneModeWithoutMirroring:", v3);
  }
}

intptr_t __42__RadiosPreferences_setAirplaneModeInNSS___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setAirplaneModeWithoutMirroring:(BOOL)a3
{
  _QWORD *v5;
  __CFNotificationCenter *DarwinNotifyCenter;

  v5 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if (!a3)
    v5 = (_QWORD *)MEMORY[0x1E0C9AE40];
  -[RadiosPreferences setValue:forKey:](self, "setValue:forKey:", *v5, CFSTR("AirplaneMode"));
  self->_cachedAirplaneMode = a3;
  self->_isCachedAirplaneModeValid = 1;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("RadiosPreferencesAirplaneModeDidChangeNotification"), 0, 0, 1u);
}

- (BOOL)telephonyStateWithBundleIdentifierOut:(id *)a3
{
  void *v4;
  void *v5;
  char v6;

  v4 = -[RadiosPreferences getValueWithLockForKey:](self, "getValueWithLockForKey:", CFSTR("TelephonyState"));
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TelephonyEnabled")), "BOOLValue");
    v4 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundle_identifier"));
  }
  else
  {
    v6 = 1;
  }
  *a3 = v4;
  return v6;
}

- (void)setTelephonyState:(BOOL)a3 fromBundleID:(id)a4
{
  _BOOL4 v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *CTGreenTeaOsLogHandle;
  NSObject *v9;
  const __CFString *v10;
  const __CFString *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  const __CFString *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v5 = a3;
  v17[2] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("TelephonyEnabled");
  v16[1] = CFSTR("bundle_identifier");
  v17[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v17[1] = a4;
  -[RadiosPreferences setValue:forKey:](self, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2), CFSTR("TelephonyState"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("RadiosPreferencesAirplaneModeDidChangeNotification"), 0, 0, 1u);
  objc_msgSend(a4, "UTF8String");
  ct_green_tea_logger_create();
  CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle();
  if (CTGreenTeaOsLogHandle)
  {
    v9 = CTGreenTeaOsLogHandle;
    if (os_log_type_enabled(CTGreenTeaOsLogHandle, OS_LOG_TYPE_INFO))
    {
      v10 = CFSTR("On");
      if (v5)
        v11 = CFSTR("Off");
      else
        v11 = CFSTR("On");
      if (!v5)
        v10 = CFSTR("Off");
      v12 = 138412546;
      v13 = v11;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_18EB0F000, v9, OS_LOG_TYPE_INFO, "Cellular Enabled: %@ ==>> %@", (uint8_t *)&v12, 0x16u);
    }
  }
  ct_green_tea_logger_destroy();
}

- (void)refresh
{
  self->_isCachedAirplaneModeValid = 0;
  -[RadiosPreferences synchronize](self, "synchronize");
}

- (void)initializeSCPrefs:(id)a3
{
  const __CFString *v5;
  _QWORD v6[2];
  __int128 v7;
  uint64_t v8;

  v5 = (const __CFString *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier");
  if (!v5)
    v5 = (const __CFString *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processName");
  self->_prefs = SCPreferencesCreateWithAuthorization((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v5, (CFStringRef)a3, 0);
  v6[0] = 0;
  v7 = 0u;
  v8 = 0;
  v6[1] = self;
  -[RadiosPreferences setCallback:withContext:](self, "setCallback:withContext:", RadioPreferencesCallback, v6);
  SCPreferencesSetDispatchQueue(self->_prefs, (dispatch_queue_t)self->_dispatchQueue);
}

- (void)notifyTarget:(unsigned int)a3
{
  int applySkipCount;
  BOOL v5;
  int v6;

  if ((a3 & 2) != 0)
  {
    if (!-[RadiosPreferences notifyForExternalChangeOnly](self, "notifyForExternalChangeOnly")
      || !self->_applySkipCount)
    {
      if (self->_delegate)
      {
        -[RadiosPreferences refresh](self, "refresh");
        -[RadiosPreferencesDelegate airplaneModeChanged](self->_delegate, "airplaneModeChanged");
        -[RadiosPreferences synchronize](self, "synchronize");
      }
    }
    applySkipCount = self->_applySkipCount;
    v5 = __OFSUB__(applySkipCount, 1);
    v6 = applySkipCount - 1;
    if (v6 < 0 == v5)
      self->_applySkipCount = v6;
  }
}

- (void)synchronize
{
  SCPreferencesSynchronize(self->_prefs);
}

- (void)getValueForKey:(id)a3
{
  return (void *)SCPreferencesGetValue(self->_prefs, (CFStringRef)a3);
}

- (void)getValueWithLockForKey:(id)a3
{
  CFPropertyListRef Value;

  if (!SCPreferencesLock(self->_prefs, 1u))
  {
    if (SCError() != 3005)
      return 0;
    SCPreferencesSynchronize(self->_prefs);
    if (!SCPreferencesLock(self->_prefs, 1u))
      return 0;
  }
  Value = SCPreferencesGetValue(self->_prefs, (CFStringRef)a3);
  SCPreferencesUnlock(self->_prefs);
  return (void *)Value;
}

- (void)setValue:(void *)a3 forKey:(id)a4
{
  if (SCPreferencesLock(self->_prefs, 1u)
    || SCError() == 3005 && (SCPreferencesSynchronize(self->_prefs), SCPreferencesLock(self->_prefs, 1u)))
  {
    if (SCPreferencesSetValue(self->_prefs, (CFStringRef)a4, a3) && SCPreferencesCommitChanges(self->_prefs))
    {
      if (SCPreferencesApplyChanges(self->_prefs))
      {
        ++self->_applySkipCount;
        -[RadiosPreferences synchronize](self, "synchronize");
      }
    }
    SCPreferencesUnlock(self->_prefs);
  }
}

- (void)setCallback:(void *)a3 withContext:(id *)a4
{
  SCPreferencesSetCallback(self->_prefs, (SCPreferencesCallBack)a3, (SCPreferencesContext *)a4);
}

- (RadiosPreferencesDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (RadiosPreferencesDelegate *)a3;
}

- (BOOL)notifyForExternalChangeOnly
{
  return self->notifyForExternalChangeOnly;
}

- (void)setNotifyForExternalChangeOnly:(BOOL)a3
{
  self->notifyForExternalChangeOnly = a3;
}

- (void)setAirplaneModeInNSS:(char)a1 .cold.1(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_fault_impl(&dword_18EB0F000, a2, OS_LOG_TYPE_FAULT, "Call to NanoSystemSettings to %d airplane mode timed out", (uint8_t *)v2, 8u);
}

@end
