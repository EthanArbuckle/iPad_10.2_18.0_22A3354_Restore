@implementation CADDefaultPermissionValidator

- (int)eventAccessLevel
{
  -[CADDefaultPermissionValidator _loadAccessPermissionsIfNeeded](self, "_loadAccessPermissionsIfNeeded");
  return CADEventAccessTypeFromAuthStatus(self->_eventAuthorization);
}

- (void)_loadAccessPermissionsIfNeeded
{
  id v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  if (!self->_allowedEntityTypesValid)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D0BB00]);
    v4 = objc_msgSend(v3, "dataIsAccessible");

    if (v4)
    {
      if (-[CADDefaultPermissionValidator hasSyncClientEntitlement](self, "hasSyncClientEntitlement"))
      {
        *(int64x2_t *)&self->_eventAuthorization = vdupq_n_s64(3uLL);
      }
      else
      {
        v5 = -[CADTCCPermissionChecker eventAuthorization](self->_tccPermissionChecker, "eventAuthorization");
        self->_eventAuthorization = CalAuthorizationStatusFromTCCAuthRight(*MEMORY[0x1E0DB10E8], v5);
        v6 = -[CADTCCPermissionChecker remindersAuthorization](self->_tccPermissionChecker, "remindersAuthorization");
        self->_remindersAuthorization = CalAuthorizationStatusFromTCCAuthRight(*MEMORY[0x1E0DB1198], v6);
      }
    }
    else
    {
      self->_eventAuthorization = 0;
      self->_remindersAuthorization = 0;
    }
    self->_allowedEntityTypesValid = 1;
  }
}

- (BOOL)hasSyncClientEntitlement
{
  return -[CADDefaultPermissionValidator _valueForBooleanEntitlement:defaultValue:](self, "_valueForBooleanEntitlement:defaultValue:", CFSTR("com.apple.private.calendar.syncclient"), 0);
}

- (CADDefaultPermissionValidator)initWithClientIdentity:(id)a3
{
  id v4;
  CADAuditTokenTCCPermissionChecker *v5;
  CADAuditTokenTCCPermissionChecker *v6;
  CADDefaultPermissionValidator *v7;
  _OWORD v9[2];

  v4 = a3;
  v5 = [CADAuditTokenTCCPermissionChecker alloc];
  if (v4)
    objc_msgSend(v4, "auditToken");
  else
    memset(v9, 0, sizeof(v9));
  v6 = -[CADAuditTokenTCCPermissionChecker initWithAuditToken:](v5, "initWithAuditToken:", v9);
  v7 = -[CADDefaultPermissionValidator initWithClientIdentity:tccPermissionChecker:](self, "initWithClientIdentity:tccPermissionChecker:", v4, v6);

  return v7;
}

- (BOOL)_valueForBooleanEntitlement:(id)a3 defaultValue:(BOOL)a4
{
  void *v4;
  char v5;
  _QWORD v7[4];
  BOOL v8;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__CADDefaultPermissionValidator__valueForBooleanEntitlement_defaultValue___block_invoke;
  v7[3] = &__block_descriptor_33_e9__16__0_v8l;
  v8 = a4;
  -[CADDefaultPermissionValidator _valueForEntitlement:loadBlock:](self, "_valueForEntitlement:loadBlock:", a3, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (id)_valueForEntitlement:(id)a3 loadBlock:(id)a4
{
  __CFString *v6;
  void (**v7)(id, CFTypeRef);
  os_unfair_lock_s *p_lock;
  __SecTask *task;
  const __CFAllocator *v10;
  id WeakRetained;
  void *v12;
  CFTypeRef v13;
  NSObject *v14;
  void *v15;
  CFErrorRef error;
  audit_token_t token;
  uint8_t buf[4];
  __CFString *v20;
  __int16 v21;
  CFErrorRef v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = (void (**)(id, CFTypeRef))a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  task = self->_task;
  if (!task)
  {
    v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    WeakRetained = objc_loadWeakRetained((id *)&self->_identity);
    v12 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "auditToken");
    else
      memset(&token, 0, sizeof(token));
    self->_task = SecTaskCreateWithAuditToken(v10, &token);

    task = self->_task;
  }
  v13 = 0;
  error = 0;
  if (v6 && task)
    v13 = SecTaskCopyValueForEntitlement(task, v6, &error);
  os_unfair_lock_unlock(p_lock);
  if (!v13)
  {
    if (error)
    {
      v14 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v20 = v6;
        v21 = 2112;
        v22 = error;
        _os_log_impl(&dword_1B6A18000, v14, OS_LOG_TYPE_ERROR, "CADPermissionValidator: An error occurred while checking for entitlement %{public}@. Error: %@", buf, 0x16u);
      }
    }
  }
  v7[2](v7, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    CFRelease(v13);

  return v15;
}

uint64_t __74__CADDefaultPermissionValidator__valueForBooleanEntitlement_defaultValue___block_invoke(uint64_t a1, CFTypeRef cf)
{
  _BOOL8 v2;
  CFTypeID v4;

  v2 = *(_BYTE *)(a1 + 32) != 0;
  if (cf)
  {
    v4 = CFGetTypeID(cf);
    v2 = v4 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)cf) != 0;
  }
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2);
}

- (BOOL)isRemoteUIExtension
{
  return -[CADDefaultPermissionValidator _valueForBooleanEntitlement:defaultValue:](self, "_valueForBooleanEntitlement:defaultValue:", CFSTR("com.apple.private.calendar.eventkitui-remoteui-extension"), 0);
}

- (BOOL)hasManagedConfigurationBundleIDOverrideEntitlement
{
  return -[CADDefaultPermissionValidator _valueForBooleanEntitlement:defaultValue:](self, "_valueForBooleanEntitlement:defaultValue:", CFSTR("com.apple.private.calendar.managedConfigurationBundleIDOverride"), 0);
}

- (BOOL)allowsCustomDatabasePath
{
  return -[CADDefaultPermissionValidator _valueForBooleanEntitlement:defaultValue:](self, "_valueForBooleanEntitlement:defaultValue:", CFSTR("com.apple.private.calendar.custom-database-path"), 0);
}

- (BOOL)hasReminderAccess
{
  -[CADDefaultPermissionValidator _loadAccessPermissionsIfNeeded](self, "_loadAccessPermissionsIfNeeded");
  return self->_remindersAuthorization == 3;
}

- (BOOL)shouldTrustClientEnforcedManagedConfigurationAccess
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_identity);
  objc_msgSend(WeakRetained, "applicationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (shouldTrustClientEnforcedManagedConfigurationAccess_onceToken != -1)
    dispatch_once(&shouldTrustClientEnforcedManagedConfigurationAccess_onceToken, &__block_literal_global_46_0);
  v4 = objc_msgSend((id)shouldTrustClientEnforcedManagedConfigurationAccess_whitelistedBundleIDs, "containsObject:", v3);

  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_identity);
  objc_storeStrong((id *)&self->_tccPermissionChecker, 0);
}

- (BOOL)testingAccessLevelGranted
{
  return -[CADDefaultPermissionValidator _valueForBooleanEntitlement:defaultValue:](self, "_valueForBooleanEntitlement:defaultValue:", CFSTR("com.apple.private.calendar.daemon.access-level.testing"), 0);
}

- (void)dealloc
{
  __SecTask *task;
  objc_super v4;

  task = self->_task;
  if (task)
  {
    CFRelease(task);
    self->_task = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CADDefaultPermissionValidator;
  -[CADDefaultPermissionValidator dealloc](&v4, sel_dealloc);
}

- (BOOL)canModifySuggestedEventCalendar
{
  return -[CADDefaultPermissionValidator _valueForBooleanEntitlement:defaultValue:](self, "_valueForBooleanEntitlement:defaultValue:", CFSTR("com.apple.private.calendar.allow-suggestions"), 0);
}

- (int64_t)remindersAuthorization
{
  -[CADDefaultPermissionValidator _loadAccessPermissionsIfNeeded](self, "_loadAccessPermissionsIfNeeded");
  return self->_remindersAuthorization;
}

- (int64_t)eventAuthorization
{
  -[CADDefaultPermissionValidator _loadAccessPermissionsIfNeeded](self, "_loadAccessPermissionsIfNeeded");
  return self->_eventAuthorization;
}

- (CADDefaultPermissionValidator)initWithClientIdentity:(id)a3 tccPermissionChecker:(id)a4
{
  id v6;
  id v7;
  CADDefaultPermissionValidator *v8;
  CADDefaultPermissionValidator *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CADDefaultPermissionValidator;
  v8 = -[CADDefaultPermissionValidator init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v8->_identity, v6);
    objc_storeStrong((id *)&v9->_tccPermissionChecker, a4);
  }

  return v9;
}

- (BOOL)isFirstPartyCalendarApp
{
  return -[CADDefaultPermissionValidator _valueForBooleanEntitlement:defaultValue:](self, "_valueForBooleanEntitlement:defaultValue:", CFSTR("com.apple.private.calendar"), 0);
}

- (BOOL)isCalendarDaemon
{
  return -[CADDefaultPermissionValidator _valueForBooleanEntitlement:defaultValue:](self, "_valueForBooleanEntitlement:defaultValue:", CFSTR("com.apple.private.calendar.calaccessd"), 0);
}

- (BOOL)canAccessDatabaseBookmarks
{
  BOOL v3;
  BOOL v4;

  v3 = -[CADDefaultPermissionValidator _valueForStringEntitlement:matchesString:](self, "_valueForStringEntitlement:matchesString:", CFSTR("com.apple.application-identifier"), CFSTR("com.apple.Automator"));
  v4 = -[CADDefaultPermissionValidator _valueForStringEntitlement:matchesString:](self, "_valueForStringEntitlement:matchesString:", CFSTR("com.apple.application-identifier"), CFSTR("com.apple.shortcuts"));
  return v3
      || v4
      || -[CADDefaultPermissionValidator isFirstPartyCalendarApp](self, "isFirstPartyCalendarApp")
      || -[CADDefaultPermissionValidator isCalendarDaemon](self, "isCalendarDaemon")
      || -[CADDefaultPermissionValidator testingAccessLevelGranted](self, "testingAccessLevelGranted")
      || -[CADDefaultPermissionValidator hasSyncClientEntitlement](self, "hasSyncClientEntitlement");
}

- (BOOL)canMakeSpotlightChanges
{
  return -[CADDefaultPermissionValidator _valueForBooleanEntitlement:defaultValue:](self, "_valueForBooleanEntitlement:defaultValue:", CFSTR("com.apple.private.calaccessd.spotlight"), 0);
}

- (BOOL)canModifyBirthdayCalendar
{
  return -[CADDefaultPermissionValidator _valueForBooleanEntitlement:defaultValue:](self, "_valueForBooleanEntitlement:defaultValue:", CFSTR("com.apple.private.calendar.allow-birthday-modification"), 0);
}

- (BOOL)canRequestDiagnostics
{
  return -[CADDefaultPermissionValidator _valueForBooleanEntitlement:defaultValue:](self, "_valueForBooleanEntitlement:defaultValue:", CFSTR("com.apple.private.calendar.allow-diagnostics-collection"), 0);
}

- (BOOL)canModifyCalendarDatabase
{
  return 1;
}

- (BOOL)internalAccessLevelGranted
{
  int has_internal_content;

  has_internal_content = os_variant_has_internal_content();
  if (has_internal_content)
    LOBYTE(has_internal_content) = -[CADDefaultPermissionValidator _valueForBooleanEntitlement:defaultValue:](self, "_valueForBooleanEntitlement:defaultValue:", CFSTR("com.apple.private.calendar.daemon.access-level.internal"), 0);
  return has_internal_content;
}

- (BOOL)storageManagementAccessGranted
{
  BOOL v3;
  id WeakRetained;
  void *v5;
  char v6;

  v3 = -[CADDefaultPermissionValidator _valueForBooleanEntitlement:defaultValue:](self, "_valueForBooleanEntitlement:defaultValue:", CFSTR("com.apple.private.calendar.storagemanagement"), 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_identity);
  objc_msgSend(WeakRetained, "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Preferences"));

  return v3 | v6;
}

- (BOOL)hasCalendarTCCBypassEntitlement
{
  void *v2;
  char v3;

  -[CADDefaultPermissionValidator _valueForEntitlement:loadBlock:](self, "_valueForEntitlement:loadBlock:", CFSTR("com.apple.private.tcc.allow"), &__block_literal_global_29);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

id __64__CADDefaultPermissionValidator_hasCalendarTCCBypassEntitlement__block_invoke(int a1, void *cf)
{
  CFTypeID v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  CFStringRef *v10;
  uint64_t i;
  const __CFString *v12;
  CFTypeID v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (cf && (v3 = CFGetTypeID(cf), v3 == CFArrayGetTypeID()))
    v4 = cf;
  else
    v4 = (void *)MEMORY[0x1E0C9AA60];
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v17;
    v10 = (CFStringRef *)MEMORY[0x1E0DB10E8];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        v12 = *(const __CFString **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v13 = CFGetTypeID(v12);
        if (v13 == CFStringGetTypeID())
          v8 |= CFStringCompare(v12, *v10, 0) == kCFCompareEqualTo;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8 & 1, (_QWORD)v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)hasCalendarToolEntitlement
{
  int has_internal_content;

  has_internal_content = os_variant_has_internal_content();
  if (has_internal_content)
    LOBYTE(has_internal_content) = -[CADDefaultPermissionValidator _valueForBooleanEntitlement:defaultValue:](self, "_valueForBooleanEntitlement:defaultValue:", CFSTR("com.apple.private.calendar.iamcalendar_tool"), 0);
  return has_internal_content;
}

- (BOOL)hasChangeIdTrackingOverrideEntitlement
{
  return -[CADDefaultPermissionValidator _valueForBooleanEntitlement:defaultValue:](self, "_valueForBooleanEntitlement:defaultValue:", CFSTR("com.apple.private.calendar.changeIdTrackingOverride"), 0);
}

- (BOOL)hasNotificationCountEntitlement
{
  return -[CADDefaultPermissionValidator _valueForBooleanEntitlement:defaultValue:](self, "_valueForBooleanEntitlement:defaultValue:", CFSTR("com.apple.private.calendar.notificationCount"), 0);
}

void __84__CADDefaultPermissionValidator_shouldTrustClientEnforcedManagedConfigurationAccess__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.datadetectors.DDActionsService"), CFSTR("com.apple.mobilemail"), CFSTR("com.apple.mobilesafari"), CFSTR("com.apple.Bridge"), CFSTR("com.apple.calendar.EventKitUIRemoteUIExtension"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)shouldTrustClientEnforcedManagedConfigurationAccess_whitelistedBundleIDs;
  shouldTrustClientEnforcedManagedConfigurationAccess_whitelistedBundleIDs = v0;

}

- (BOOL)allowsIntegrations
{
  return -[CADDefaultPermissionValidator _valueForBooleanEntitlement:defaultValue:](self, "_valueForBooleanEntitlement:defaultValue:", CFSTR("com.apple.private.calendar.allow-integrations"), 0);
}

- (BOOL)_valueForStringEntitlement:(id)a3 matchesString:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  -[CADDefaultPermissionValidator _valueForEntitlement:loadBlock:](self, "_valueForEntitlement:loadBlock:", a3, &__block_literal_global_63_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v6, "isEqual:", v7);

  return (char)self;
}

id __74__CADDefaultPermissionValidator__valueForStringEntitlement_matchesString___block_invoke(int a1, void *cf)
{
  CFTypeID v3;
  void *v4;

  if (cf)
  {
    v3 = CFGetTypeID(cf);
    if (v3 == CFStringGetTypeID())
      v4 = cf;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (ClientIdentity)identity
{
  return (ClientIdentity *)objc_loadWeakRetained((id *)&self->_identity);
}

@end
