@implementation CADDatabaseInitializationOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteClientIdentity, 0);
  objc_storeStrong((id *)&self->_mockPermissions, 0);
  objc_storeStrong((id *)&self->_privacyClientIdentity, 0);
  objc_storeStrong((id *)&self->_allowedSourceIdentifiers, 0);
  objc_storeStrong((id *)&self->_calendarDataContainerProvider, 0);
  objc_storeStrong((id *)&self->_databaseDirectory, 0);
  objc_storeStrong((id *)&self->_managementBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_changeTrackingClientId, 0);
}

- (id)validOptionsForConnection:(id)a3
{
  id v4;
  CADDatabaseInitializationOptions *v5;
  void *v6;
  CADDefaultPermissionValidator *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  CADCombinedPermissionValidator *v12;
  NSArray **p_allowedSourceIdentifiers;
  CADChangeTrackingClientId *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  v5 = objc_alloc_init(CADDatabaseInitializationOptions);
  objc_msgSend(v4, "permissionValidator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = [CADDefaultPermissionValidator alloc];
    objc_msgSend(v4, "identity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tccPermissionChecker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CADDefaultPermissionValidator initWithClientIdentity:tccPermissionChecker:](v7, "initWithClientIdentity:tccPermissionChecker:", v8, v9);

    v6 = (void *)v10;
  }
  v11 = objc_msgSend(v6, "testingAccessLevelGranted");
  if (v11 && self->_mockPermissions)
  {
    v12 = -[CADCombinedPermissionValidator initWithPermissionValidator:andValidator:]([CADCombinedPermissionValidator alloc], "initWithPermissionValidator:andValidator:", v6, self->_mockPermissions);

    -[CADDatabaseInitializationOptions setMockPermissions:](v5, "setMockPermissions:", self->_mockPermissions);
    v6 = v12;
  }
  -[CADDatabaseInitializationOptions setAllowDelegateSources:](v5, "setAllowDelegateSources:", self->_allowDelegateSources);
  -[CADDatabaseInitializationOptions setChangeTrackingClientId:](v5, "setChangeTrackingClientId:", self->_changeTrackingClientId);
  if (objc_msgSend(v6, "allowsIntegrations"))
    -[CADDatabaseInitializationOptions setAllowIntegrations:](v5, "setAllowIntegrations:", self->_allowIntegrations);
  if (objc_msgSend(v6, "eventAccessLevel")
    || (v11 | objc_msgSend(v6, "hasReminderAccess")) == 1)
  {
    -[CADDatabaseInitializationOptions setDatabaseInitOptions:](v5, "setDatabaseInitOptions:", self->_databaseInitOptions);
    -[CADDatabaseInitializationOptions setEnablePropertyModificationLogging:](v5, "setEnablePropertyModificationLogging:", self->_enablePropertyModificationLogging);
    -[CADDatabaseInitializationOptions setManagement:](v5, "setManagement:", self->_management);
    p_allowedSourceIdentifiers = &self->_allowedSourceIdentifiers;
LABEL_11:
    -[CADDatabaseInitializationOptions setAllowedSourceIdentifiers:](v5, "setAllowedSourceIdentifiers:", *p_allowedSourceIdentifiers);
    goto LABEL_12;
  }
  p_allowedSourceIdentifiers = &self->_allowedSourceIdentifiers;
  if (!-[NSArray count](self->_allowedSourceIdentifiers, "count"))
    goto LABEL_11;
LABEL_12:
  if (v11)
  {
    -[CADDatabaseInitializationOptions setUnitTesting:](v5, "setUnitTesting:", self->_unitTesting);
    -[CADDatabaseInitializationOptions setCalendarDataContainerProvider:](v5, "setCalendarDataContainerProvider:", self->_calendarDataContainerProvider);
  }
  else if (!objc_msgSend(v6, "allowsCustomDatabasePath"))
  {
    goto LABEL_16;
  }
  -[CADDatabaseInitializationOptions setDatabaseDirectory:](v5, "setDatabaseDirectory:", self->_databaseDirectory);
LABEL_16:
  -[CADDatabaseInitializationOptions changeTrackingClientId](self, "changeTrackingClientId");
  v14 = (CADChangeTrackingClientId *)objc_claimAutoreleasedReturnValue();
  if (-[CADChangeTrackingClientId hasCustomClientId](v14, "hasCustomClientId"))
  {
    v15 = objc_msgSend(v6, "hasChangeIdTrackingOverrideEntitlement");

    if ((v15 & 1) != 0)
      goto LABEL_20;
    v14 = objc_alloc_init(CADChangeTrackingClientId);
    -[CADDatabaseInitializationOptions setChangeTrackingClientId:](v5, "setChangeTrackingClientId:", v14);
  }

LABEL_20:
  if (objc_msgSend(v6, "isRemoteUIExtension"))
    -[CADDatabaseInitializationOptions setRemoteClientIdentity:](v5, "setRemoteClientIdentity:", self->_remoteClientIdentity);
  if (objc_msgSend(v6, "hasManagedConfigurationBundleIDOverrideEntitlement"))
    -[CADDatabaseInitializationOptions setManagementBundleIdentifier:](v5, "setManagementBundleIdentifier:", self->_managementBundleIdentifier);
  if (_os_feature_enabled_impl() && self->_privacyClientIdentity)
  {
    objc_msgSend(v4, "identity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      objc_msgSend(v16, "auditToken");
    PAAuthenticatedClientIdentity();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADDatabaseInitializationOptions setPrivacyClientIdentity:](v5, "setPrivacyClientIdentity:", v18);

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  NSString *managementBundleIdentifier;
  CADChangeTrackingClientId *changeTrackingClientId;
  NSURL *databaseDirectory;
  CalCalendarDataContainerProvider *calendarDataContainerProvider;
  uint64_t management;
  void *v10;
  void *v11;
  void *v12;
  uint64_t databaseInitOptions;
  void *v15;
  void *v16;
  objc_super v17;

  v16 = (void *)MEMORY[0x1E0CB3940];
  v17.receiver = self;
  v17.super_class = (Class)CADDatabaseInitializationOptions;
  -[CADDatabaseInitializationOptions description](&v17, sel_description);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  databaseInitOptions = self->_databaseInitOptions;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enablePropertyModificationLogging);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_unitTesting);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  changeTrackingClientId = self->_changeTrackingClientId;
  managementBundleIdentifier = self->_managementBundleIdentifier;
  databaseDirectory = self->_databaseDirectory;
  calendarDataContainerProvider = self->_calendarDataContainerProvider;
  management = self->_management;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowDelegateSources);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowIntegrations);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: {databaseInitOptions = %i, enablePropertyModificationLogging = %@, unitTesting = %@, management = %i, managementBundleID = %@, changeTrackingID = %@, databaseDirectory = %@, containerProvider = %@, allowDelegateSources: %@, allowIntegrations: %@, allowedSourceIdentifiers: %@, privacyClientIdentity: %@, mockPermissions: %@, remoteClientIdentity: %@}"), v15, databaseInitOptions, v3, v4, management, managementBundleIdentifier, changeTrackingClientId, databaseDirectory, calendarDataContainerProvider, v10, v11, self->_allowedSourceIdentifiers, self->_privacyClientIdentity, self->_mockPermissions, self->_remoteClientIdentity);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)setChangeTrackingClientId:(id)a3
{
  objc_storeStrong((id *)&self->_changeTrackingClientId, a3);
}

- (void)setAllowedSourceIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_allowedSourceIdentifiers, a3);
}

- (void)setAllowDelegateSources:(BOOL)a3
{
  self->_allowDelegateSources = a3;
}

- (CADDatabaseInitializationOptions)init
{
  CADDatabaseInitializationOptions *v2;
  CADDatabaseInitializationOptions *v3;
  uint64_t v4;
  CADChangeTrackingClientId *changeTrackingClientId;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CADDatabaseInitializationOptions;
  v2 = -[CADDatabaseInitializationOptions init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_enablePropertyModificationLogging = 1;
    v2->_allowDelegateSources = 1;
    v4 = objc_opt_new();
    changeTrackingClientId = v3->_changeTrackingClientId;
    v3->_changeTrackingClientId = (CADChangeTrackingClientId *)v4;

  }
  return v3;
}

- (void)setEnablePropertyModificationLogging:(BOOL)a3
{
  self->_enablePropertyModificationLogging = a3;
}

- (void)setDatabaseInitOptions:(int)a3
{
  self->_databaseInitOptions = a3;
}

- (void)setDatabaseDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_databaseDirectory, a3);
}

- (void)setCalendarDataContainerProvider:(id)a3
{
  objc_storeStrong((id *)&self->_calendarDataContainerProvider, a3);
}

- (CADMockPermissionValidator)mockPermissions
{
  return self->_mockPermissions;
}

- (void)setManagement:(int)a3
{
  self->_management = a3;
}

- (void)setUnitTesting:(BOOL)a3
{
  self->_unitTesting = a3;
}

- (NSArray)allowedSourceIdentifiers
{
  return self->_allowedSourceIdentifiers;
}

- (BOOL)allowDelegateSources
{
  return self->_allowDelegateSources;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqualToOptions:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  NSString *managementBundleIdentifier;
  CADChangeTrackingClientId *changeTrackingClientId;
  NSURL *databaseDirectory;
  CalCalendarDataContainerProvider *calendarDataContainerProvider;
  NSArray *allowedSourceIdentifiers;
  OS_tcc_identity *privacyClientIdentity;
  CADMockPermissionValidator *mockPermissions;
  ClientIdentity *remoteClientIdentity;
  char v14;

  v4 = a3;
  v5 = v4;
  if (v4
    && self->_databaseInitOptions == *((_DWORD *)v4 + 3)
    && self->_enablePropertyModificationLogging == *((unsigned __int8 *)v4 + 8)
    && self->_unitTesting == *((unsigned __int8 *)v4 + 9)
    && self->_allowDelegateSources == *((unsigned __int8 *)v4 + 10)
    && self->_allowIntegrations == *((unsigned __int8 *)v4 + 11)
    && self->_management == *((_DWORD *)v4 + 4)
    && ((managementBundleIdentifier = self->_managementBundleIdentifier,
         !((unint64_t)managementBundleIdentifier | v5[4]))
     || -[NSString isEqual:](managementBundleIdentifier, "isEqual:"))
    && ((changeTrackingClientId = self->_changeTrackingClientId,
         changeTrackingClientId == (CADChangeTrackingClientId *)v5[3])
     || -[CADChangeTrackingClientId isEqualToChangeTrackingClientId:](changeTrackingClientId, "isEqualToChangeTrackingClientId:"))&& ((databaseDirectory = self->_databaseDirectory, databaseDirectory == (NSURL *)v5[5])|| -[NSURL isEqual:](databaseDirectory, "isEqual:"))&& ((calendarDataContainerProvider = self->_calendarDataContainerProvider, !((unint64_t)calendarDataContainerProvider | v5[6]))|| -[CalCalendarDataContainerProvider isEqual:](calendarDataContainerProvider, "isEqual:"))&& ((allowedSourceIdentifiers = self->_allowedSourceIdentifiers, !((unint64_t)allowedSourceIdentifiers | v5[7]))|| -[NSArray isEqual:](allowedSourceIdentifiers, "isEqual:"))&& ((privacyClientIdentity = self->_privacyClientIdentity, !((unint64_t)privacyClientIdentity | v5[8]))|| -[OS_tcc_identity isEqual:](privacyClientIdentity, "isEqual:"))&& ((mockPermissions = self->_mockPermissions, !((unint64_t)mockPermissions | v5[9]))|| -[CADMockPermissionValidator isEqual:](mockPermissions, "isEqual:")))
  {
    remoteClientIdentity = self->_remoteClientIdentity;
    if ((unint64_t)remoteClientIdentity | v5[10])
      v14 = -[ClientIdentity isEqual:](remoteClientIdentity, "isEqual:");
    else
      v14 = 1;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)unitTesting
{
  return self->_unitTesting;
}

- (void)purifyOptions
{
  void *v3;
  void *v4;
  int v5;

  if ((-[CADDatabaseInitializationOptions databaseInitOptions](self, "databaseInitOptions") & 0x20) != 0)
  {
    -[CADDatabaseInitializationOptions databaseDirectory](self, "databaseDirectory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "relativeString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", CFSTR(":memory:"));

    if (v5)
      -[CADDatabaseInitializationOptions setDatabaseDirectory:](self, "setDatabaseDirectory:", 0);
  }
}

- (int)databaseInitOptions
{
  return self->_databaseInitOptions;
}

- (BOOL)enablePropertyModificationLogging
{
  return self->_enablePropertyModificationLogging;
}

- (CalCalendarDataContainerProvider)calendarDataContainerProvider
{
  return self->_calendarDataContainerProvider;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  ClientIdentity *remoteClientIdentity;
  const void *v9;
  const void *v10;
  CFDataRef Data;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "encodeInt:forKey:", self->_databaseInitOptions, CFSTR("opts"));
  -[CADDatabaseInitializationOptions changeTrackingClientId](self, "changeTrackingClientId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v4, CFSTR("changeTrackingClientIdKey"));

  objc_msgSend(v12, "encodeBool:forKey:", self->_enablePropertyModificationLogging, CFSTR("log"));
  -[CADDatabaseInitializationOptions databaseDirectory](self, "databaseDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3910]);
    -[CADDatabaseInitializationOptions databaseDirectory](self, "databaseDirectory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "initWithURL:readonly:", v7, 0);

  }
  objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("directory"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_calendarDataContainerProvider, CFSTR("containerProvider"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_unitTesting, CFSTR("test"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_allowDelegateSources, CFSTR("dels"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_allowIntegrations, CFSTR("allowIntegrations"));
  objc_msgSend(v12, "encodeInt:forKey:", self->_management, CFSTR("mgmt"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_managementBundleIdentifier, CFSTR("managementBundleIDKey"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_allowedSourceIdentifiers, CFSTR("allowedSourceIdentifiers"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_mockPermissions, CFSTR("mockPermissions"));
  remoteClientIdentity = self->_remoteClientIdentity;
  if (remoteClientIdentity)
    objc_msgSend(v12, "encodeObject:forKey:", remoteClientIdentity, CFSTR("remoteClientIdentity"));
  if (self->_privacyClientIdentity)
  {
    v9 = (const void *)tcc_identity_copy_external_representation();
    if (v9)
    {
      v10 = v9;
      Data = CFPropertyListCreateData(0, v9, kCFPropertyListBinaryFormat_v1_0, 0, 0);
      objc_msgSend(v12, "encodeObject:forKey:", Data, CFSTR("PrivacyClientIdentity"));
      CFRelease(v10);

    }
  }

}

- (CADChangeTrackingClientId)changeTrackingClientId
{
  return self->_changeTrackingClientId;
}

- (NSURL)databaseDirectory
{
  return self->_databaseDirectory;
}

- (CADDatabaseInitializationOptions)initWithCoder:(id)a3
{
  id v4;
  CADDatabaseInitializationOptions *v5;
  uint64_t v6;
  CADChangeTrackingClientId *changeTrackingClientId;
  void *v8;
  uint64_t v9;
  CalCalendarDataContainerProvider *calendarDataContainerProvider;
  uint64_t v11;
  NSURL *databaseDirectory;
  uint64_t v13;
  NSString *managementBundleIdentifier;
  uint64_t v15;
  NSArray *allowedSourceIdentifiers;
  uint64_t v17;
  CADMockPermissionValidator *mockPermissions;
  uint64_t v19;
  ClientIdentity *remoteClientIdentity;
  const __CFData *v21;
  CFPropertyListRef v22;
  const void *v23;
  uint64_t v24;
  OS_tcc_identity *privacyClientIdentity;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CADDatabaseInitializationOptions;
  v5 = -[CADDatabaseInitializationOptions init](&v27, sel_init);
  if (v5)
  {
    v5->_databaseInitOptions = objc_msgSend(v4, "decodeIntForKey:", CFSTR("opts"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("changeTrackingClientIdKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    changeTrackingClientId = v5->_changeTrackingClientId;
    v5->_changeTrackingClientId = (CADChangeTrackingClientId *)v6;

    v5->_enablePropertyModificationLogging = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("log"));
    v5->_unitTesting = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("test"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("directory"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containerProvider"));
    v9 = objc_claimAutoreleasedReturnValue();
    calendarDataContainerProvider = v5->_calendarDataContainerProvider;
    v5->_calendarDataContainerProvider = (CalCalendarDataContainerProvider *)v9;

    objc_msgSend(v8, "url");
    v11 = objc_claimAutoreleasedReturnValue();
    databaseDirectory = v5->_databaseDirectory;
    v5->_databaseDirectory = (NSURL *)v11;

    v5->_allowDelegateSources = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dels"));
    v5->_allowIntegrations = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowIntegrations"));
    v5->_management = objc_msgSend(v4, "decodeIntForKey:", CFSTR("mgmt"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("managementBundleIDKey"));
    v13 = objc_claimAutoreleasedReturnValue();
    managementBundleIdentifier = v5->_managementBundleIdentifier;
    v5->_managementBundleIdentifier = (NSString *)v13;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("allowedSourceIdentifiers"));
    v15 = objc_claimAutoreleasedReturnValue();
    allowedSourceIdentifiers = v5->_allowedSourceIdentifiers;
    v5->_allowedSourceIdentifiers = (NSArray *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mockPermissions"));
    v17 = objc_claimAutoreleasedReturnValue();
    mockPermissions = v5->_mockPermissions;
    v5->_mockPermissions = (CADMockPermissionValidator *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteClientIdentity"));
    v19 = objc_claimAutoreleasedReturnValue();
    remoteClientIdentity = v5->_remoteClientIdentity;
    v5->_remoteClientIdentity = (ClientIdentity *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrivacyClientIdentity"));
    v21 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = CFPropertyListCreateWithData(0, v21, 0, 0, 0);
      if (v22)
      {
        v23 = v22;
        v24 = tcc_identity_create_from_external_representation();
        privacyClientIdentity = v5->_privacyClientIdentity;
        v5->_privacyClientIdentity = (OS_tcc_identity *)v24;

        CFRelease(v23);
      }
    }

  }
  return v5;
}

- (int)management
{
  return self->_management;
}

- (ClientIdentity)remoteClientIdentity
{
  return self->_remoteClientIdentity;
}

- (NSString)managementBundleIdentifier
{
  return self->_managementBundleIdentifier;
}

- (void)setManagementBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_managementBundleIdentifier, a3);
}

- (BOOL)allowIntegrations
{
  return self->_allowIntegrations;
}

- (void)setAllowIntegrations:(BOOL)a3
{
  self->_allowIntegrations = a3;
}

- (OS_tcc_identity)privacyClientIdentity
{
  return self->_privacyClientIdentity;
}

- (void)setPrivacyClientIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_privacyClientIdentity, a3);
}

- (void)setMockPermissions:(id)a3
{
  objc_storeStrong((id *)&self->_mockPermissions, a3);
}

- (void)setRemoteClientIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_remoteClientIdentity, a3);
}

@end
