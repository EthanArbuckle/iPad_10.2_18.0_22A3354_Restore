@implementation CADMockPermissionValidator

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CADMockPermissionValidator)init
{
  CADMockPermissionValidator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CADMockPermissionValidator;
  result = -[CADMockPermissionValidator init](&v3, sel_init);
  if (result)
  {
    *(int64x2_t *)&result->_eventAuthorization = vdupq_n_s64(3uLL);
    result->_canModifyCalendarDatabase = 1;
  }
  return result;
}

- (int)eventAccessLevel
{
  return CADEventAccessTypeFromAuthStatus(self->_eventAuthorization);
}

- (void)setEventAccessLevel:(int)a3
{
  int64_t v3;

  if (a3 > 2)
    v3 = 0;
  else
    v3 = qword_1B6A8C3B0[a3];
  self->_eventAuthorization = v3;
}

- (BOOL)hasReminderAccess
{
  return self->_remindersAuthorization == 3;
}

- (void)setHasReminderAccess:(BOOL)a3
{
  int64_t v3;

  v3 = 2;
  if (a3)
    v3 = 3;
  self->_remindersAuthorization = v3;
}

- (CADMockPermissionValidator)initWithCoder:(id)a3
{
  id v4;
  CADMockPermissionValidator *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CADMockPermissionValidator;
  v5 = -[CADMockPermissionValidator init](&v7, sel_init);
  if (v5)
  {
    v5->_eventAuthorization = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("eventAuthorization"));
    v5->_remindersAuthorization = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("remindersAuthorization"));
    v5->_isFirstPartyCalendarApp = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFirstPartyCalendarApp"));
    v5->_isCalendarDaemon = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCalendarDaemon"));
    v5->_canAccessDatabaseBookmarks = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canAccessDatabaseBookmarks"));
    v5->_canModifySuggestedEventCalendar = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canModifySuggestedEventCalendar"));
    v5->_canMakeSpotlightChanges = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canMakeSpotlightChanges"));
    v5->_canModifyBirthdayCalendar = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canModifyBirthdayCalendar"));
    v5->_canRequestDiagnostics = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canRequestDiagnostics"));
    v5->_canModifyCalendarDatabase = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canModifyCalendarDatabase"));
    v5->_testingAccessLevelGranted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("testingAccessLevelGranted"));
    v5->_internalAccessLevelGranted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("internalAccessLevelGranted"));
    v5->_storageManagementAccessGranted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("storageManagementAccessGranted"));
    v5->_hasSyncClientEntitlement = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasSyncClientEntitlement"));
    v5->_hasCalendarToolEntitlement = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasCalendarToolEntitlement"));
    v5->_hasChangeIdTrackingOverrideEntitlement = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasChangeIdTrackingOverrideEntitlement"));
    v5->_hasNotificationCountEntitlement = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasNotificationCountEntitlement"));
    v5->_hasManagedConfigurationBundleIDOverrideEntitlement = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasManagedConfigurationBundleIDOverrideEntitlement"));
    v5->_shouldTrustClientEnforcedManagedConfigurationAccess = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldTrustClientEnforcedManagedConfigurationAccess"));
    v5->_allowsCustomDatabasePath = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsCustomDatabasePath"));
    v5->_allowsIntegrations = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsIntegrations"));
    v5->_hasCalendarTCCBypassEntitlement = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasCalendarTCCBypassEntitlement"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t eventAuthorization_low;
  id v5;

  eventAuthorization_low = LODWORD(self->_eventAuthorization);
  v5 = a3;
  objc_msgSend(v5, "encodeInt:forKey:", eventAuthorization_low, CFSTR("eventAuthorization"));
  objc_msgSend(v5, "encodeInt:forKey:", LODWORD(self->_remindersAuthorization), CFSTR("remindersAuthorization"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isFirstPartyCalendarApp, CFSTR("isFirstPartyCalendarApp"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isCalendarDaemon, CFSTR("isCalendarDaemon"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_canAccessDatabaseBookmarks, CFSTR("canAccessDatabaseBookmarks"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_canModifySuggestedEventCalendar, CFSTR("canModifySuggestedEventCalendar"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_canMakeSpotlightChanges, CFSTR("canMakeSpotlightChanges"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_canModifyBirthdayCalendar, CFSTR("canModifyBirthdayCalendar"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_canRequestDiagnostics, CFSTR("canRequestDiagnostics"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_canModifyCalendarDatabase, CFSTR("canModifyCalendarDatabase"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_testingAccessLevelGranted, CFSTR("testingAccessLevelGranted"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_internalAccessLevelGranted, CFSTR("internalAccessLevelGranted"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_storageManagementAccessGranted, CFSTR("storageManagementAccessGranted"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasSyncClientEntitlement, CFSTR("hasSyncClientEntitlement"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasCalendarToolEntitlement, CFSTR("hasCalendarToolEntitlement"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasChangeIdTrackingOverrideEntitlement, CFSTR("hasChangeIdTrackingOverrideEntitlement"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasNotificationCountEntitlement, CFSTR("hasNotificationCountEntitlement"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasManagedConfigurationBundleIDOverrideEntitlement, CFSTR("hasManagedConfigurationBundleIDOverrideEntitlement"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldTrustClientEnforcedManagedConfigurationAccess, CFSTR("shouldTrustClientEnforcedManagedConfigurationAccess"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_allowsCustomDatabasePath, CFSTR("allowsCustomDatabasePath"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_allowsIntegrations, CFSTR("allowsIntegrations"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasCalendarTCCBypassEntitlement, CFSTR("hasCalendarTCCBypassEntitlement"));

}

- (int64_t)eventAuthorization
{
  return self->_eventAuthorization;
}

- (void)setEventAuthorization:(int64_t)a3
{
  self->_eventAuthorization = a3;
}

- (int64_t)remindersAuthorization
{
  return self->_remindersAuthorization;
}

- (void)setRemindersAuthorization:(int64_t)a3
{
  self->_remindersAuthorization = a3;
}

- (BOOL)isFirstPartyCalendarApp
{
  return self->_isFirstPartyCalendarApp;
}

- (void)setIsFirstPartyCalendarApp:(BOOL)a3
{
  self->_isFirstPartyCalendarApp = a3;
}

- (BOOL)isCalendarDaemon
{
  return self->_isCalendarDaemon;
}

- (void)setIsCalendarDaemon:(BOOL)a3
{
  self->_isCalendarDaemon = a3;
}

- (BOOL)isRemoteUIExtension
{
  return self->_isRemoteUIExtension;
}

- (void)setIsRemoteUIExtension:(BOOL)a3
{
  self->_isRemoteUIExtension = a3;
}

- (BOOL)canAccessDatabaseBookmarks
{
  return self->_canAccessDatabaseBookmarks;
}

- (void)setCanAccessDatabaseBookmarks:(BOOL)a3
{
  self->_canAccessDatabaseBookmarks = a3;
}

- (BOOL)canModifySuggestedEventCalendar
{
  return self->_canModifySuggestedEventCalendar;
}

- (void)setCanModifySuggestedEventCalendar:(BOOL)a3
{
  self->_canModifySuggestedEventCalendar = a3;
}

- (BOOL)canMakeSpotlightChanges
{
  return self->_canMakeSpotlightChanges;
}

- (void)setCanMakeSpotlightChanges:(BOOL)a3
{
  self->_canMakeSpotlightChanges = a3;
}

- (BOOL)canModifyBirthdayCalendar
{
  return self->_canModifyBirthdayCalendar;
}

- (void)setCanModifyBirthdayCalendar:(BOOL)a3
{
  self->_canModifyBirthdayCalendar = a3;
}

- (BOOL)canRequestDiagnostics
{
  return self->_canRequestDiagnostics;
}

- (void)setCanRequestDiagnostics:(BOOL)a3
{
  self->_canRequestDiagnostics = a3;
}

- (BOOL)canModifyCalendarDatabase
{
  return self->_canModifyCalendarDatabase;
}

- (void)setCanModifyCalendarDatabase:(BOOL)a3
{
  self->_canModifyCalendarDatabase = a3;
}

- (BOOL)testingAccessLevelGranted
{
  return self->_testingAccessLevelGranted;
}

- (void)setTestingAccessLevelGranted:(BOOL)a3
{
  self->_testingAccessLevelGranted = a3;
}

- (BOOL)internalAccessLevelGranted
{
  return self->_internalAccessLevelGranted;
}

- (void)setInternalAccessLevelGranted:(BOOL)a3
{
  self->_internalAccessLevelGranted = a3;
}

- (BOOL)storageManagementAccessGranted
{
  return self->_storageManagementAccessGranted;
}

- (void)setStorageManagementAccessGranted:(BOOL)a3
{
  self->_storageManagementAccessGranted = a3;
}

- (BOOL)hasSyncClientEntitlement
{
  return self->_hasSyncClientEntitlement;
}

- (void)setHasSyncClientEntitlement:(BOOL)a3
{
  self->_hasSyncClientEntitlement = a3;
}

- (BOOL)hasCalendarToolEntitlement
{
  return self->_hasCalendarToolEntitlement;
}

- (void)setHasCalendarToolEntitlement:(BOOL)a3
{
  self->_hasCalendarToolEntitlement = a3;
}

- (BOOL)hasChangeIdTrackingOverrideEntitlement
{
  return self->_hasChangeIdTrackingOverrideEntitlement;
}

- (void)setHasChangeIdTrackingOverrideEntitlement:(BOOL)a3
{
  self->_hasChangeIdTrackingOverrideEntitlement = a3;
}

- (BOOL)hasNotificationCountEntitlement
{
  return self->_hasNotificationCountEntitlement;
}

- (void)setHasNotificationCountEntitlement:(BOOL)a3
{
  self->_hasNotificationCountEntitlement = a3;
}

- (BOOL)hasManagedConfigurationBundleIDOverrideEntitlement
{
  return self->_hasManagedConfigurationBundleIDOverrideEntitlement;
}

- (void)setHasManagedConfigurationBundleIDOverrideEntitlement:(BOOL)a3
{
  self->_hasManagedConfigurationBundleIDOverrideEntitlement = a3;
}

- (BOOL)shouldTrustClientEnforcedManagedConfigurationAccess
{
  return self->_shouldTrustClientEnforcedManagedConfigurationAccess;
}

- (void)setShouldTrustClientEnforcedManagedConfigurationAccess:(BOOL)a3
{
  self->_shouldTrustClientEnforcedManagedConfigurationAccess = a3;
}

- (BOOL)allowsCustomDatabasePath
{
  return self->_allowsCustomDatabasePath;
}

- (void)setAllowsCustomDatabasePath:(BOOL)a3
{
  self->_allowsCustomDatabasePath = a3;
}

- (BOOL)allowsIntegrations
{
  return self->_allowsIntegrations;
}

- (void)setAllowsIntegrations:(BOOL)a3
{
  self->_allowsIntegrations = a3;
}

- (BOOL)hasCalendarTCCBypassEntitlement
{
  return self->_hasCalendarTCCBypassEntitlement;
}

- (void)setHasCalendarTCCBypassEntitlement:(BOOL)a3
{
  self->_hasCalendarTCCBypassEntitlement = a3;
}

@end
