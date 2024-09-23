@implementation CADCombinedPermissionValidator

- (CADCombinedPermissionValidator)initWithPermissionValidator:(id)a3 andValidator:(id)a4
{
  id v7;
  id v8;
  CADCombinedPermissionValidator *v9;
  CADCombinedPermissionValidator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CADCombinedPermissionValidator;
  v9 = -[CADCombinedPermissionValidator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_validator1, a3);
    objc_storeStrong((id *)&v10->_validator2, a4);
  }

  return v10;
}

- (int64_t)eventAuthorization
{
  return _minimumAuthStatus(-[CADPermissionValidator eventAuthorization](self->_validator1, "eventAuthorization"), -[CADPermissionValidator eventAuthorization](self->_validator2, "eventAuthorization"));
}

- (int64_t)remindersAuthorization
{
  return _minimumAuthStatus(-[CADPermissionValidator remindersAuthorization](self->_validator1, "remindersAuthorization"), -[CADPermissionValidator remindersAuthorization](self->_validator2, "remindersAuthorization"));
}

- (int)eventAccessLevel
{
  return CADEventAccessTypeFromAuthStatus(-[CADCombinedPermissionValidator eventAuthorization](self, "eventAuthorization"));
}

- (BOOL)hasReminderAccess
{
  return -[CADCombinedPermissionValidator remindersAuthorization](self, "remindersAuthorization") == 3;
}

- (BOOL)isFirstPartyCalendarApp
{
  int v3;

  v3 = -[CADPermissionValidator isFirstPartyCalendarApp](self->_validator1, "isFirstPartyCalendarApp");
  if (v3)
    LOBYTE(v3) = -[CADPermissionValidator isFirstPartyCalendarApp](self->_validator2, "isFirstPartyCalendarApp");
  return v3;
}

- (BOOL)isCalendarDaemon
{
  int v3;

  v3 = -[CADPermissionValidator isCalendarDaemon](self->_validator1, "isCalendarDaemon");
  if (v3)
    LOBYTE(v3) = -[CADPermissionValidator isCalendarDaemon](self->_validator2, "isCalendarDaemon");
  return v3;
}

- (BOOL)isRemoteUIExtension
{
  int v3;

  v3 = -[CADPermissionValidator isRemoteUIExtension](self->_validator1, "isRemoteUIExtension");
  if (v3)
    LOBYTE(v3) = -[CADPermissionValidator isRemoteUIExtension](self->_validator2, "isRemoteUIExtension");
  return v3;
}

- (BOOL)canAccessDatabaseBookmarks
{
  int v3;

  v3 = -[CADPermissionValidator canAccessDatabaseBookmarks](self->_validator1, "canAccessDatabaseBookmarks");
  if (v3)
    LOBYTE(v3) = -[CADPermissionValidator canAccessDatabaseBookmarks](self->_validator2, "canAccessDatabaseBookmarks");
  return v3;
}

- (BOOL)canModifySuggestedEventCalendar
{
  int v3;

  v3 = -[CADPermissionValidator canModifySuggestedEventCalendar](self->_validator1, "canModifySuggestedEventCalendar");
  if (v3)
    LOBYTE(v3) = -[CADPermissionValidator canModifySuggestedEventCalendar](self->_validator2, "canModifySuggestedEventCalendar");
  return v3;
}

- (BOOL)canMakeSpotlightChanges
{
  int v3;

  v3 = -[CADPermissionValidator canMakeSpotlightChanges](self->_validator1, "canMakeSpotlightChanges");
  if (v3)
    LOBYTE(v3) = -[CADPermissionValidator canMakeSpotlightChanges](self->_validator2, "canMakeSpotlightChanges");
  return v3;
}

- (BOOL)canModifyBirthdayCalendar
{
  int v3;

  v3 = -[CADPermissionValidator canModifyBirthdayCalendar](self->_validator1, "canModifyBirthdayCalendar");
  if (v3)
    LOBYTE(v3) = -[CADPermissionValidator canModifyBirthdayCalendar](self->_validator2, "canModifyBirthdayCalendar");
  return v3;
}

- (BOOL)canRequestDiagnostics
{
  int v3;

  v3 = -[CADPermissionValidator canRequestDiagnostics](self->_validator1, "canRequestDiagnostics");
  if (v3)
    LOBYTE(v3) = -[CADPermissionValidator canRequestDiagnostics](self->_validator2, "canRequestDiagnostics");
  return v3;
}

- (BOOL)canModifyCalendarDatabase
{
  int v3;

  v3 = -[CADPermissionValidator canModifyCalendarDatabase](self->_validator1, "canModifyCalendarDatabase");
  if (v3)
    LOBYTE(v3) = -[CADPermissionValidator canModifyCalendarDatabase](self->_validator2, "canModifyCalendarDatabase");
  return v3;
}

- (BOOL)testingAccessLevelGranted
{
  int v3;

  v3 = -[CADPermissionValidator testingAccessLevelGranted](self->_validator1, "testingAccessLevelGranted");
  if (v3)
    LOBYTE(v3) = -[CADPermissionValidator testingAccessLevelGranted](self->_validator2, "testingAccessLevelGranted");
  return v3;
}

- (BOOL)internalAccessLevelGranted
{
  int v3;

  v3 = -[CADPermissionValidator internalAccessLevelGranted](self->_validator1, "internalAccessLevelGranted");
  if (v3)
    LOBYTE(v3) = -[CADPermissionValidator internalAccessLevelGranted](self->_validator2, "internalAccessLevelGranted");
  return v3;
}

- (BOOL)storageManagementAccessGranted
{
  int v3;

  v3 = -[CADPermissionValidator storageManagementAccessGranted](self->_validator1, "storageManagementAccessGranted");
  if (v3)
    LOBYTE(v3) = -[CADPermissionValidator storageManagementAccessGranted](self->_validator2, "storageManagementAccessGranted");
  return v3;
}

- (BOOL)hasSyncClientEntitlement
{
  int v3;

  v3 = -[CADPermissionValidator hasSyncClientEntitlement](self->_validator1, "hasSyncClientEntitlement");
  if (v3)
    LOBYTE(v3) = -[CADPermissionValidator hasSyncClientEntitlement](self->_validator2, "hasSyncClientEntitlement");
  return v3;
}

- (BOOL)hasCalendarToolEntitlement
{
  int v3;

  v3 = -[CADPermissionValidator hasCalendarToolEntitlement](self->_validator1, "hasCalendarToolEntitlement");
  if (v3)
    LOBYTE(v3) = -[CADPermissionValidator hasCalendarToolEntitlement](self->_validator2, "hasCalendarToolEntitlement");
  return v3;
}

- (BOOL)hasChangeIdTrackingOverrideEntitlement
{
  int v3;

  v3 = -[CADPermissionValidator hasChangeIdTrackingOverrideEntitlement](self->_validator1, "hasChangeIdTrackingOverrideEntitlement");
  if (v3)
    LOBYTE(v3) = -[CADPermissionValidator hasChangeIdTrackingOverrideEntitlement](self->_validator2, "hasChangeIdTrackingOverrideEntitlement");
  return v3;
}

- (BOOL)hasNotificationCountEntitlement
{
  int v3;

  v3 = -[CADPermissionValidator hasNotificationCountEntitlement](self->_validator1, "hasNotificationCountEntitlement");
  if (v3)
    LOBYTE(v3) = -[CADPermissionValidator hasNotificationCountEntitlement](self->_validator2, "hasNotificationCountEntitlement");
  return v3;
}

- (BOOL)hasManagedConfigurationBundleIDOverrideEntitlement
{
  int v3;

  v3 = -[CADPermissionValidator hasManagedConfigurationBundleIDOverrideEntitlement](self->_validator1, "hasManagedConfigurationBundleIDOverrideEntitlement");
  if (v3)
    LOBYTE(v3) = -[CADPermissionValidator hasManagedConfigurationBundleIDOverrideEntitlement](self->_validator2, "hasManagedConfigurationBundleIDOverrideEntitlement");
  return v3;
}

- (BOOL)shouldTrustClientEnforcedManagedConfigurationAccess
{
  int v3;

  v3 = -[CADPermissionValidator shouldTrustClientEnforcedManagedConfigurationAccess](self->_validator1, "shouldTrustClientEnforcedManagedConfigurationAccess");
  if (v3)
    LOBYTE(v3) = -[CADPermissionValidator shouldTrustClientEnforcedManagedConfigurationAccess](self->_validator2, "shouldTrustClientEnforcedManagedConfigurationAccess");
  return v3;
}

- (BOOL)allowsCustomDatabasePath
{
  int v3;

  v3 = -[CADPermissionValidator allowsCustomDatabasePath](self->_validator1, "allowsCustomDatabasePath");
  if (v3)
    LOBYTE(v3) = -[CADPermissionValidator allowsCustomDatabasePath](self->_validator2, "allowsCustomDatabasePath");
  return v3;
}

- (BOOL)allowsIntegrations
{
  int v3;

  v3 = -[CADPermissionValidator allowsIntegrations](self->_validator1, "allowsIntegrations");
  if (v3)
    LOBYTE(v3) = -[CADPermissionValidator allowsIntegrations](self->_validator2, "allowsIntegrations");
  return v3;
}

- (BOOL)hasCalendarTCCBypassEntitlement
{
  int v3;

  v3 = -[CADPermissionValidator hasCalendarTCCBypassEntitlement](self->_validator1, "hasCalendarTCCBypassEntitlement");
  if (v3)
    LOBYTE(v3) = -[CADPermissionValidator hasCalendarTCCBypassEntitlement](self->_validator2, "hasCalendarTCCBypassEntitlement");
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validator2, 0);
  objc_storeStrong((id *)&self->_validator1, 0);
}

@end
