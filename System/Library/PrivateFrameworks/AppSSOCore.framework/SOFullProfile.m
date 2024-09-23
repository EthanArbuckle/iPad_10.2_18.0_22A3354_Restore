@implementation SOFullProfile

- (id)copyProfileForClient
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SOFullProfile;
  return -[SOProfile copyWithZone:](&v3, sel_copyWithZone_, 0);
}

+ (int64_t)profileTypeWithString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Redirect")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Credential")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (int64_t)screenLockedBehaviorWithString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cancel")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DoNotHandle")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (int64_t)authMethodWithString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Password")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UserSecureEnclaveKey")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SmartCard")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1000;
  }

  return v4;
}

- (SOFullProfile)initWithProfileData:(id)a3
{
  id v4;
  SOFullProfile *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char isKindOfClass;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  uint64_t v32;
  void *v33;
  void *v34;
  char v35;
  uint64_t v36;
  void *v37;
  void *v38;
  char v39;
  uint64_t v40;
  void *v41;
  void *v42;
  char v43;
  uint64_t v44;
  void *v45;
  void *v46;
  char v47;
  NSObject *v48;
  SOFullProfile *v49;
  void *v50;
  objc_super v52;

  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)SOFullProfile;
  v5 = -[SOFullProfile init](&v52, sel_init);
  if (v5)
  {
    v6 = (void *)objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Type"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SOProfile setType:](v5, "setType:", objc_msgSend(v6, "profileTypeWithString:", v7));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("URLPrefix"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SOProfile setURLPrefix:](v5, "setURLPrefix:", v8);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Hosts"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SOProfile setHosts:](v5, "setHosts:", v9);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ExtensionData"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SOFullProfile setExtensionData:](v5, "setExtensionData:", v10);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Realm"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SOProfile setRealm:](v5, "setRealm:", v11);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DeniedBundleIdentifiers"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SOProfile setDeniedBundleIdentifiers:](v5, "setDeniedBundleIdentifiers:", v12);

    v13 = (void *)objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ScreenLockedBehavior"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SOProfile setScreenLockedBehavior:](v5, "setScreenLockedBehavior:", objc_msgSend(v13, "screenLockedBehaviorWithString:", v14));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RegistrationToken"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SOFullProfile setPssoRegistrationToken:](v5, "setPssoRegistrationToken:", v15);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PlatformSSO"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SOFullProfile setPlatformSSO:](v5, "setPlatformSSO:", v16);

    -[SOFullProfile platformSSO](v5, "platformSSO");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("AuthenticationMethod"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      -[SOFullProfile platformSSO](v5, "platformSSO");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (id)objc_msgSend(v19, "mutableCopy");

      if (!v20)
        v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v21 = (void *)objc_opt_class();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AuthenticationMethod"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SOProfile setPssoAuthenticationMethod:](v5, "setPssoAuthenticationMethod:", objc_msgSend(v21, "authMethodWithString:", v22));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AuthenticationMethod"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, CFSTR("AuthenticationMethod"));

      -[SOFullProfile setPlatformSSO:](v5, "setPlatformSSO:", v20);
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Extension"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Extension"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("BundleIdentifier"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[SOProfile setExtensionBundleIdentifier:](v5, "setExtensionBundleIdentifier:", v27);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Extension"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("TeamIdentifier"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SOFullProfile setExtensionTeamIdentifier:](v5, "setExtensionTeamIdentifier:", v29);

    }
    -[SOProfile extensionBundleIdentifier](v5, "extensionBundleIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v31 = objc_opt_isKindOfClass();

    if ((v31 & 1) == 0)
    {
      SO_LOG_SOFullProfile();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        -[SOFullProfile initWithProfileData:].cold.7();
      goto LABEL_36;
    }
    -[SOFullProfile extensionData](v5, "extensionData");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v33 = (void *)v32;
      -[SOFullProfile extensionData](v5, "extensionData");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v35 = objc_opt_isKindOfClass();

      if ((v35 & 1) == 0)
      {
        SO_LOG_SOFullProfile();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          -[SOFullProfile initWithProfileData:].cold.6();
        goto LABEL_36;
      }
    }
    -[SOProfile realm](v5, "realm");
    v36 = objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      v37 = (void *)v36;
      -[SOProfile realm](v5, "realm");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v39 = objc_opt_isKindOfClass();

      if ((v39 & 1) == 0)
      {
        SO_LOG_SOFullProfile();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          -[SOFullProfile initWithProfileData:].cold.5();
        goto LABEL_36;
      }
    }
    -[SOProfile deniedBundleIdentifiers](v5, "deniedBundleIdentifiers");
    v40 = objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      v41 = (void *)v40;
      -[SOProfile deniedBundleIdentifiers](v5, "deniedBundleIdentifiers");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v43 = objc_opt_isKindOfClass();

      if ((v43 & 1) == 0)
      {
        SO_LOG_SOFullProfile();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          -[SOFullProfile initWithProfileData:].cold.4();
        goto LABEL_36;
      }
    }
    if (-[SOProfile type](v5, "type") == 1)
    {
      -[SOProfile URLPrefix](v5, "URLPrefix");
      v44 = objc_claimAutoreleasedReturnValue();
      if (v44)
      {
        v45 = (void *)v44;
        -[SOProfile URLPrefix](v5, "URLPrefix");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v47 = objc_opt_isKindOfClass();

        if ((v47 & 1) == 0)
        {
          SO_LOG_SOFullProfile();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            -[SOFullProfile initWithProfileData:].cold.2();
LABEL_36:

          v49 = 0;
          goto LABEL_37;
        }
      }
    }
    else if (-[SOProfile type](v5, "type") != 2)
    {
      SO_LOG_SOFullProfile();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        -[SOFullProfile initWithProfileData:].cold.3();
      goto LABEL_36;
    }
    if (!-[SOProfile screenLockedBehavior](v5, "screenLockedBehavior"))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ScreenLockedBehavior"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      if (v50)
      {
        SO_LOG_SOFullProfile();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          -[SOFullProfile initWithProfileData:].cold.1();
        goto LABEL_36;
      }
      -[SOProfile setScreenLockedBehavior:](v5, "setScreenLockedBehavior:", 1);
    }
  }
  v49 = v5;
LABEL_37:

  return v49;
}

- (void)removeURLPrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SOProfile URLPrefix](self, "URLPrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "arrayByExcludingObjectsInArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOProfile setURLPrefix:](self, "setURLPrefix:", v7);

}

- (id)description
{
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[11];
  _QWORD v31[13];

  v31[11] = *MEMORY[0x1E0C80C00];
  v30[0] = CFSTR("Type");
  objc_msgSend((id)objc_opt_class(), "stringWithProfileType:", -[SOProfile type](self, "type"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v29;
  v30[1] = CFSTR("URLPrefix");
  -[SOProfile URLPrefix](self, "URLPrefix");
  v3 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v3;
  if (v3)
    v4 = (const __CFString *)v3;
  else
    v4 = CFSTR("<null>");
  v31[1] = v4;
  v30[2] = CFSTR("Hosts");
  -[SOProfile hosts](self, "hosts");
  v5 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v5;
  if (v5)
    v6 = (const __CFString *)v5;
  else
    v6 = CFSTR("<null>");
  v31[2] = v6;
  v30[3] = CFSTR("BundleIdentifier");
  -[SOProfile extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = CFSTR("<null>");
  v31[3] = v9;
  v30[4] = CFSTR("TeamIdentifier");
  -[SOFullProfile extensionTeamIdentifier](self, "extensionTeamIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = CFSTR("<null>");
  v31[4] = v12;
  v30[5] = CFSTR("Realm");
  -[SOProfile realm](self, "realm");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = CFSTR("<null>");
  v31[5] = v15;
  v30[6] = CFSTR("DeniedBundleIdentifiers");
  -[SOProfile deniedBundleIdentifiers](self, "deniedBundleIdentifiers");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (const __CFString *)v16;
  else
    v18 = CFSTR("<null>");
  v31[6] = v18;
  v30[7] = CFSTR("ScreenLockedBehavior");
  objc_msgSend((id)objc_opt_class(), "stringWithScreenLockedBehavior:", -[SOProfile screenLockedBehavior](self, "screenLockedBehavior"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[7] = v19;
  v30[8] = CFSTR("AuthenticationMethod");
  objc_msgSend((id)objc_opt_class(), "stringWithAuthenticationMethod:", -[SOProfile pssoAuthenticationMethod](self, "pssoAuthenticationMethod"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[8] = v20;
  v30[9] = CFSTR("RegistrationToken");
  -[SOFullProfile pssoRegistrationToken](self, "pssoRegistrationToken");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = CFSTR("present");
  if (!v21)
    v22 = CFSTR("<null>");
  v31[9] = v22;
  v30[10] = CFSTR("PlatformSSO");
  -[SOFullProfile platformSSO](self, "platformSSO");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[10] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 11);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "description");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setType:", -[SOProfile type](self, "type"));
  -[SOProfile URLPrefix](self, "URLPrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setURLPrefix:", v6);

  -[SOProfile hosts](self, "hosts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setHosts:", v8);

  -[SOProfile realm](self, "realm");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setRealm:", v10);

  -[SOProfile extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setExtensionBundleIdentifier:", v12);

  v13 = (void *)-[NSString copy](self->_extensionTeamIdentifier, "copy");
  objc_msgSend(v4, "setExtensionTeamIdentifier:", v13);

  v14 = (void *)-[NSDictionary copy](self->_extensionData, "copy");
  objc_msgSend(v4, "setExtensionData:", v14);

  -[SOProfile deniedBundleIdentifiers](self, "deniedBundleIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setDeniedBundleIdentifiers:", v16);

  objc_msgSend(v4, "setScreenLockedBehavior:", -[SOProfile screenLockedBehavior](self, "screenLockedBehavior"));
  objc_msgSend(v4, "setPlatformSSO:", self->_platformSSO);
  objc_msgSend(v4, "setPssoRegistrationToken:", 0);
  return v4;
}

- (id)copyProfile
{
  return -[SOFullProfile copyWithZone:](self, "copyWithZone:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SOFullProfile)initWithCoder:(id)a3
{
  id v4;
  SOFullProfile *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *extensionTeamIdentifier;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSDictionary *extensionData;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSDictionary *platformSSO;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSString *pssoRegistrationToken;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SOFullProfile;
  v5 = -[SOProfile initWithCoder:](&v32, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_extensionTeamIdentifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    extensionTeamIdentifier = v5->_extensionTeamIdentifier;
    v5->_extensionTeamIdentifier = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_extensionData);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    extensionData = v5->_extensionData;
    v5->_extensionData = (NSDictionary *)v17;

    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, v21, v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_platformSSO);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    platformSSO = v5->_platformSSO;
    v5->_platformSSO = (NSDictionary *)v25;

    v27 = objc_opt_class();
    NSStringFromSelector(sel_pssoRegistrationToken);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    pssoRegistrationToken = v5->_pssoRegistrationToken;
    v5->_pssoRegistrationToken = (NSString *)v29;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *extensionTeamIdentifier;
  void *v6;
  NSDictionary *extensionData;
  void *v8;
  NSDictionary *platformSSO;
  void *v10;
  NSString *pssoRegistrationToken;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SOFullProfile;
  v4 = a3;
  -[SOProfile encodeWithCoder:](&v13, sel_encodeWithCoder_, v4);
  extensionTeamIdentifier = self->_extensionTeamIdentifier;
  NSStringFromSelector(sel_extensionTeamIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", extensionTeamIdentifier, v6, v13.receiver, v13.super_class);

  extensionData = self->_extensionData;
  NSStringFromSelector(sel_extensionData);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", extensionData, v8);

  platformSSO = self->_platformSSO;
  NSStringFromSelector(sel_platformSSO);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", platformSSO, v10);

  pssoRegistrationToken = self->_pssoRegistrationToken;
  NSStringFromSelector(sel_pssoRegistrationToken);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", pssoRegistrationToken, v12);

}

- (NSString)extensionTeamIdentifier
{
  return self->_extensionTeamIdentifier;
}

- (void)setExtensionTeamIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_extensionTeamIdentifier, a3);
}

- (NSDictionary)extensionData
{
  return self->_extensionData;
}

- (void)setExtensionData:(id)a3
{
  objc_storeStrong((id *)&self->_extensionData, a3);
}

- (NSString)pssoRegistrationToken
{
  return self->_pssoRegistrationToken;
}

- (void)setPssoRegistrationToken:(id)a3
{
  objc_storeStrong((id *)&self->_pssoRegistrationToken, a3);
}

- (NSDictionary)platformSSO
{
  return self->_platformSSO;
}

- (void)setPlatformSSO:(id)a3
{
  objc_storeStrong((id *)&self->_platformSSO, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platformSSO, 0);
  objc_storeStrong((id *)&self->_pssoRegistrationToken, 0);
  objc_storeStrong((id *)&self->_extensionData, 0);
  objc_storeStrong((id *)&self->_extensionTeamIdentifier, 0);
}

- (void)initWithProfileData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CF39B000, v0, v1, "invalid profile (screenLockedBehavior): %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithProfileData:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CF39B000, v0, v1, "invalid profile (URLPrefix): %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithProfileData:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CF39B000, v0, v1, "invalid profile (type): %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithProfileData:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CF39B000, v0, v1, "invalid profile (deniedBundleIdentifiers): %@{private}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithProfileData:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CF39B000, v0, v1, "invalid profile (realm): %@{private}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithProfileData:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CF39B000, v0, v1, "invalid profile (extensionData): %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithProfileData:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CF39B000, v0, v1, "invalid profile (extensionBundleIdentifier): %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
