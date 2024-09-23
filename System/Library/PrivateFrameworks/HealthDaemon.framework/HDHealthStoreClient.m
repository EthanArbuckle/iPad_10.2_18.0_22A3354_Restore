@implementation HDHealthStoreClient

- (HDHealthStoreClient)initWithXPCClient:(id)a3 configuration:(id)a4 profile:(id)a5 databaseAccessibilityAssertions:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HDHealthStoreClient *v15;
  HDHealthStoreClient *v16;
  uint64_t v17;
  HKHealthStoreConfiguration *configuration;
  HDClientAuthorizationOracle *authorizationOracle;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *defaultSourceBundleIdentifier;
  void *v26;
  void *v27;
  uint64_t v28;
  NSString *sourceBundleIdentifier;
  NSString *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  uint64_t v34;
  __CFString *v35;
  NSString *sourceVersion;
  objc_super v38;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v38.receiver = self;
  v38.super_class = (Class)HDHealthStoreClient;
  v15 = -[HDHealthStoreClient init](&v38, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_XPCClient, a3);
    objc_storeStrong((id *)&v16->_profile, a5);
    v17 = objc_msgSend(v12, "copy");
    configuration = v16->_configuration;
    v16->_configuration = (HKHealthStoreConfiguration *)v17;

    objc_storeStrong((id *)&v16->_databaseAccessibilityAssertions, a6);
    authorizationOracle = v16->_authorizationOracle;
    v16->_authorizationOracle = 0;

    v16->_propertyLock._os_unfair_lock_opaque = 0;
    objc_msgSend(v11, "process");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CB6C18];
    objc_msgSend(v20, "entitlements");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bundleIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_sourceBundleIdentifierWithEntitlements:processBundleIdentifier:isExtension:", v22, v23, objc_msgSend(v20, "isExtension"));
    v24 = objc_claimAutoreleasedReturnValue();
    defaultSourceBundleIdentifier = v16->_defaultSourceBundleIdentifier;
    v16->_defaultSourceBundleIdentifier = (NSString *)v24;

    objc_msgSend(v12, "sourceBundleIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v12, "sourceBundleIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "copy");
      sourceBundleIdentifier = v16->_sourceBundleIdentifier;
      v16->_sourceBundleIdentifier = (NSString *)v28;

    }
    else
    {
      v30 = v16->_defaultSourceBundleIdentifier;
      v27 = v16->_sourceBundleIdentifier;
      v16->_sourceBundleIdentifier = v30;
    }

    if (objc_msgSend(v20, "hasEntitlement:", *MEMORY[0x1E0CB4760]))
    {
      objc_msgSend(v13, "daemon");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "behavior");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "currentOSVersion");
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v12, "sourceVersion");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v31, "copy");
      v32 = (void *)v34;
      v35 = &stru_1E6D11BB8;
      if (v34)
        v35 = (__CFString *)v34;
      v33 = v35;
    }
    sourceVersion = v16->_sourceVersion;
    v16->_sourceVersion = &v33->isa;

  }
  return v16;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)-[HDXPCClient connection](self->_XPCClient, "connection");
}

- (HDXPCProcess)process
{
  return (HDXPCProcess *)-[HDXPCClient process](self->_XPCClient, "process");
}

- (_HKEntitlements)entitlements
{
  void *v2;
  void *v3;

  -[HDHealthStoreClient process](self, "process");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_HKEntitlements *)v3;
}

- (BOOL)hasRequiredEntitlement:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[HDHealthStoreClient process](self, "process");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "hasRequiredEntitlement:error:", v6, a4);

  return (char)a4;
}

- (BOOL)hasEntitlement:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HDHealthStoreClient process](self, "process");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasEntitlement:", v4);

  return v6;
}

- (id)valueForEntitlement:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HDHealthStoreClient process](self, "process");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForEntitlement:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)hasRequiredArrayEntitlement:(id)a3 containing:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  -[HDHealthStoreClient process](self, "process");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v10, "hasRequiredArrayEntitlement:containing:error:", v9, v8, a5);

  return (char)a5;
}

- (BOOL)hasArrayEntitlement:(id)a3 containing:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[HDHealthStoreClient process](self, "process");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasArrayEntitlement:containing:", v7, v6);

  return v9;
}

- (BOOL)shouldBypassAuthorization
{
  void *v2;
  char v3;

  -[HDHealthStoreClient process](self, "process");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasEntitlement:", *MEMORY[0x1E0CB47D8]);

  return v3;
}

- (BOOL)hasPrivateMetadataAccess
{
  void *v3;
  char v4;
  void *v5;

  -[HDHealthStoreClient process](self, "process");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasEntitlement:", *MEMORY[0x1E0CB59B8]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[HDHealthStoreClient process](self, "process");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "hasEntitlement:", *MEMORY[0x1E0CB59B0]);

  }
  return v4;
}

- (BOOL)verifyHealthRecordsPermissionGrantedWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;
  char v9;

  if (-[HDHealthStoreClient hasRequiredEntitlement:error:](self, "hasRequiredEntitlement:error:", *MEMORY[0x1E0CB59B0], a3))
  {
    return 1;
  }
  -[HDHealthStoreClient entitlements](self, "entitlements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CB5120];
  v7 = objc_msgSend(v5, "hasAccessEntitlementWithIdentifier:", *MEMORY[0x1E0CB5120]);

  if ((v7 & 1) != 0)
    return 1;
  -[HDHealthStoreClient entitlements](self, "entitlements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasPrivateAccessEntitlementWithIdentifier:", *MEMORY[0x1E0CB5998]);

  if ((v9 & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 4, CFSTR("Missing %@ entitlement."), v6);
  return 0;
}

- (HDClientAuthorizationOracle)authorizationOracle
{
  os_unfair_lock_s *p_propertyLock;
  HDClientAuthorizationOracle *v4;
  NSString *sourceBundleIdentifier;
  void *v6;
  void *v7;
  void *v8;
  HDClientAuthorizationOracle *v9;
  HDClientAuthorizationOracle *authorizationOracle;

  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock(&self->_propertyLock);
  if (!self->_authorizationOracle)
  {
    v4 = [HDClientAuthorizationOracle alloc];
    sourceBundleIdentifier = self->_sourceBundleIdentifier;
    -[HDHealthStoreClient process](self, "process");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entitlements");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDHealthStoreClient profile](self, "profile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HDClientAuthorizationOracle initWithSourceBundleIdentifier:entitlements:profile:](v4, "initWithSourceBundleIdentifier:entitlements:profile:", sourceBundleIdentifier, v7, v8);
    authorizationOracle = self->_authorizationOracle;
    self->_authorizationOracle = v9;

  }
  os_unfair_lock_unlock(p_propertyLock);
  return self->_authorizationOracle;
}

- (_TtC12HealthDaemon29HDHealthStoreClientAssertions)databaseAccessibilityAssertions
{
  os_unfair_lock_s *p_propertyLock;
  _TtC12HealthDaemon29HDHealthStoreClientAssertions *v4;
  _TtC12HealthDaemon29HDHealthStoreClientAssertions *databaseAccessibilityAssertions;

  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock(&self->_propertyLock);
  if (!self->_databaseAccessibilityAssertions)
  {
    v4 = objc_alloc_init(_TtC12HealthDaemon29HDHealthStoreClientAssertions);
    databaseAccessibilityAssertions = self->_databaseAccessibilityAssertions;
    self->_databaseAccessibilityAssertions = v4;

  }
  os_unfair_lock_unlock(p_propertyLock);
  return self->_databaseAccessibilityAssertions;
}

- (void)addAssertionMapping:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HDHealthStoreClient databaseAccessibilityAssertions](self, "databaseAccessibilityAssertions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAssertionMappingWithAssertion:", v4);

}

- (void)removeAssertionMappingForAssertion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _TtC12HealthDaemon29HDHealthStoreClientAssertions *databaseAccessibilityAssertions;

  v4 = a3;
  -[HDHealthStoreClient databaseAccessibilityAssertions](self, "databaseAccessibilityAssertions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAssertionMappingWithAssertion:", v4);

  -[HDHealthStoreClient accessibilityAssertions](self, "accessibilityAssertions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    databaseAccessibilityAssertions = self->_databaseAccessibilityAssertions;
    self->_databaseAccessibilityAssertions = 0;

  }
}

- (id)firstAssertion
{
  void *v2;
  void *v3;

  -[HDHealthStoreClient databaseAccessibilityAssertions](self, "databaseAccessibilityAssertions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityAssertions
{
  void *v2;
  void *v3;

  -[HDHealthStoreClient databaseAccessibilityAssertions](self, "databaseAccessibilityAssertions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityAssertions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)assertionForHKDatabaseAccessibilityAssertion:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HDHealthStoreClient databaseAccessibilityAssertions](self, "databaseAccessibilityAssertions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertionForHKDatabaseAccessibilityAssertionWithHkDatabaseAccessibilityAssertion:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)invalidateAssertions
{
  id v2;

  -[HDHealthStoreClient databaseAccessibilityAssertions](self, "databaseAccessibilityAssertions");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateAssertions");

}

- (HDXPCClient)XPCClient
{
  return (HDXPCClient *)objc_getProperty(self, a2, 32, 1);
}

- (HDProfile)profile
{
  return (HDProfile *)objc_getProperty(self, a2, 40, 1);
}

- (HKHealthStoreConfiguration)configuration
{
  return (HKHealthStoreConfiguration *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)sourceBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)sourceVersion
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)defaultSourceBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultSourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceVersion, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_XPCClient, 0);
  objc_storeStrong((id *)&self->_databaseAccessibilityAssertions, 0);
  objc_storeStrong((id *)&self->_authorizationOracle, 0);
}

- (id)filterWithQueryFilter:(id)a3 objectType:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[HDHealthStoreClient hasEntitlement:](self, "hasEntitlement:", *MEMORY[0x1E0CB59B0]))
  {
    if (v6)
      objc_msgSend(v8, "addObject:", v6);
  }
  else
  {
    if (v6)
    {
      if (!-[HDHealthStoreClient hasPrivateMetadataAccess](self, "hasPrivateMetadataAccess"))
      {
        objc_msgSend(v6, "filterIgnoringPrivateMetadata");
        v9 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v9;
      }
      objc_msgSend(v8, "addObject:", v6);
    }
    -[HDHealthStoreClient profile](self, "profile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "daemon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "behavior");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "supportsSampleExpiration");

    if (v13)
    {
      if (self)
      {
        v14 = (void *)MEMORY[0x1E0C99D48];
        v15 = v7;
        objc_msgSend(v14, "currentCalendar");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *MEMORY[0x1E0CB6120];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "hk_startOfDateBySubtractingDays:fromDate:", v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = (void *)MEMORY[0x1E0CB7018];
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "endDateFilterWithOperatorType:date:dataTypes:", 3, v19, v21);
        self = (HDHealthStoreClient *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v8, "addObject:", self);

    }
  }
  if ((unint64_t)objc_msgSend(v8, "count") < 2)
    objc_msgSend(v8, "firstObject");
  else
    objc_msgSend(MEMORY[0x1E0CB6F30], "andFilterWithSubfilters:", v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)baseDataEntityEncodingOptions
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (-[HDHealthStoreClient hasPrivateMetadataAccess](self, "hasPrivateMetadataAccess"))
    return 0;
  v3 = CFSTR("ExcludePrivateMetadata");
  v4[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_isAuthorizedToAccessProfile:(id)a3
{
  id v4;
  BOOL v5;
  void *v7;
  uint64_t v8;

  v4 = a3;
  if (-[HDHealthStoreClient hasEntitlement:](self, "hasEntitlement:", *MEMORY[0x1E0CB59B0])
    || objc_msgSend(v4, "profileType") == 1)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v4, "profileIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "type");

    v5 = v8 == 100 && _HDIsUnitTesting != 0;
  }

  return v5;
}

@end
