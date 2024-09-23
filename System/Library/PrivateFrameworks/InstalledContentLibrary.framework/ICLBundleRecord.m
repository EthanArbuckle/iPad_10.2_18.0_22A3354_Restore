@implementation ICLBundleRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICLBundleRecord)initWithCoder:(id)a3
{
  id v4;
  ICLBundleRecord *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  uint64_t v8;
  NSString *bundleVersion;
  uint64_t v10;
  NSString *bundleShortVersion;
  uint64_t v12;
  NSURL *bundleURL;
  uint64_t v14;
  NSString *signerIdentity;
  uint64_t v16;
  NSNumber *signatureVersion;
  uint64_t v18;
  NSString *signerOrganization;
  uint64_t v20;
  NSString *teamIdentifier;
  uint64_t v22;
  NSString *codeInfoIdentifier;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSNumber *staticDiskUsage;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSArray *counterpartIdentifiers;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSDictionary *entitlements;
  uint64_t v42;
  NSURL *dataContainerURL;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  NSDictionary *environmentVariables;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  NSDictionary *groupContainers;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  NSDictionary *personasRecordMap;

  v4 = a3;
  v5 = -[ICLBundleRecord init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleVersion"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleShortVersion"));
    v10 = objc_claimAutoreleasedReturnValue();
    bundleShortVersion = v5->_bundleShortVersion;
    v5->_bundleShortVersion = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    bundleURL = v5->_bundleURL;
    v5->_bundleURL = (NSURL *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signerIdentity"));
    v14 = objc_claimAutoreleasedReturnValue();
    signerIdentity = v5->_signerIdentity;
    v5->_signerIdentity = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signatureVersion"));
    v16 = objc_claimAutoreleasedReturnValue();
    signatureVersion = v5->_signatureVersion;
    v5->_signatureVersion = (NSNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signerOrganization"));
    v18 = objc_claimAutoreleasedReturnValue();
    signerOrganization = v5->_signerOrganization;
    v5->_signerOrganization = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("teamIdentifier"));
    v20 = objc_claimAutoreleasedReturnValue();
    teamIdentifier = v5->_teamIdentifier;
    v5->_teamIdentifier = (NSString *)v20;

    v5->_codeSigningInfoNotAuthoritative = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("codeSigningInfoNotAuthoritative"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("codeInfoIdentifier"));
    v22 = objc_claimAutoreleasedReturnValue();
    codeInfoIdentifier = v5->_codeInfoIdentifier;
    v5->_codeInfoIdentifier = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("codeSignerType"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_codeSignerType = objc_msgSend(v24, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("profileValidationType"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_profileValidationType = objc_msgSend(v25, "unsignedIntegerValue");

    v5->_isPlaceholder = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPlaceholder"));
    v5->_isNoLongerCompatible = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isNoLongerCompatible"));
    v5->_hasSettingsBundle = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasSettingsBundle"));
    v5->_isContainerized = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isContainerized"));
    v5->_hasAppGroupContainers = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasAppGroupContainers"));
    v5->_hasSystemContainer = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasSystemContainer"));
    v5->_hasSystemGroupContainers = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasSystemGroupContainers"));
    v5->_isOnMountedDiskImage = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isOnMountedDiskImage"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("compatibilityState"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_compatibilityState = objc_msgSend(v26, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationType"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_applicationType = objc_msgSend(v27, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("staticDiskUsage"));
    v28 = objc_claimAutoreleasedReturnValue();
    staticDiskUsage = v5->_staticDiskUsage;
    v5->_staticDiskUsage = (NSNumber *)v28;

    v30 = (void *)MEMORY[0x1E0C99E60];
    v31 = objc_opt_class();
    objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("counterpartIdentifiers"));
    v33 = objc_claimAutoreleasedReturnValue();
    counterpartIdentifiers = v5->_counterpartIdentifiers;
    v5->_counterpartIdentifiers = (NSArray *)v33;

    v35 = (void *)MEMORY[0x1E0C99E60];
    v36 = objc_opt_class();
    v37 = objc_opt_class();
    v38 = objc_opt_class();
    objc_msgSend(v35, "setWithObjects:", v36, v37, v38, objc_opt_class(), 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v39, CFSTR("entitlements"));
    v40 = objc_claimAutoreleasedReturnValue();
    entitlements = v5->_entitlements;
    v5->_entitlements = (NSDictionary *)v40;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataContainerURL"));
    v42 = objc_claimAutoreleasedReturnValue();
    dataContainerURL = v5->_dataContainerURL;
    v5->_dataContainerURL = (NSURL *)v42;

    v44 = (void *)MEMORY[0x1E0C99E60];
    v45 = objc_opt_class();
    objc_msgSend(v44, "setWithObjects:", v45, objc_opt_class(), 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v46, CFSTR("environmentVariables"));
    v47 = objc_claimAutoreleasedReturnValue();
    environmentVariables = v5->_environmentVariables;
    v5->_environmentVariables = (NSDictionary *)v47;

    v49 = (void *)MEMORY[0x1E0C99E60];
    v50 = objc_opt_class();
    v51 = objc_opt_class();
    objc_msgSend(v49, "setWithObjects:", v50, v51, objc_opt_class(), 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v52, CFSTR("groupContainers"));
    v53 = objc_claimAutoreleasedReturnValue();
    groupContainers = v5->_groupContainers;
    v5->_groupContainers = (NSDictionary *)v53;

    v55 = (void *)MEMORY[0x1E0C99E60];
    v56 = objc_opt_class();
    v57 = objc_opt_class();
    objc_msgSend(v55, "setWithObjects:", v56, v57, objc_opt_class(), 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v58, CFSTR("personasRecordMap"));
    v59 = objc_claimAutoreleasedReturnValue();
    personasRecordMap = v5->_personasRecordMap;
    v5->_personasRecordMap = (NSDictionary *)v59;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v4 = a3;
  -[ICLBundleRecord bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleIdentifier"));

  -[ICLBundleRecord bundleVersion](self, "bundleVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bundleVersion"));

  -[ICLBundleRecord bundleShortVersion](self, "bundleShortVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("bundleShortVersion"));

  -[ICLBundleRecord bundleURL](self, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("bundleURL"));

  -[ICLBundleRecord signerIdentity](self, "signerIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("signerIdentity"));

  -[ICLBundleRecord signatureVersion](self, "signatureVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("signatureVersion"));

  -[ICLBundleRecord signerOrganization](self, "signerOrganization");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("signerOrganization"));

  -[ICLBundleRecord teamIdentifier](self, "teamIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("teamIdentifier"));

  objc_msgSend(v4, "encodeBool:forKey:", -[ICLBundleRecord codeSigningInfoNotAuthoritative](self, "codeSigningInfoNotAuthoritative"), CFSTR("codeSigningInfoNotAuthoritative"));
  -[ICLBundleRecord codeInfoIdentifier](self, "codeInfoIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("codeInfoIdentifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICLBundleRecord codeSignerType](self, "codeSignerType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("codeSignerType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICLBundleRecord profileValidationType](self, "profileValidationType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("profileValidationType"));

  objc_msgSend(v4, "encodeBool:forKey:", -[ICLBundleRecord isPlaceholder](self, "isPlaceholder"), CFSTR("isPlaceholder"));
  objc_msgSend(v4, "encodeBool:forKey:", -[ICLBundleRecord isNoLongerCompatible](self, "isNoLongerCompatible"), CFSTR("isNoLongerCompatible"));
  objc_msgSend(v4, "encodeBool:forKey:", -[ICLBundleRecord hasSettingsBundle](self, "hasSettingsBundle"), CFSTR("hasSettingsBundle"));
  objc_msgSend(v4, "encodeBool:forKey:", -[ICLBundleRecord isContainerized](self, "isContainerized"), CFSTR("isContainerized"));
  objc_msgSend(v4, "encodeBool:forKey:", -[ICLBundleRecord hasAppGroupContainers](self, "hasAppGroupContainers"), CFSTR("hasAppGroupContainers"));
  objc_msgSend(v4, "encodeBool:forKey:", -[ICLBundleRecord hasSystemContainer](self, "hasSystemContainer"), CFSTR("hasSystemContainer"));
  objc_msgSend(v4, "encodeBool:forKey:", -[ICLBundleRecord hasSystemGroupContainers](self, "hasSystemGroupContainers"), CFSTR("hasSystemGroupContainers"));
  objc_msgSend(v4, "encodeBool:forKey:", -[ICLBundleRecord isOnMountedDiskImage](self, "isOnMountedDiskImage"), CFSTR("isOnMountedDiskImage"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICLBundleRecord compatibilityState](self, "compatibilityState"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("compatibilityState"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICLBundleRecord applicationType](self, "applicationType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("applicationType"));

  -[ICLBundleRecord staticDiskUsage](self, "staticDiskUsage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("staticDiskUsage"));

  -[ICLBundleRecord counterpartIdentifiers](self, "counterpartIdentifiers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("counterpartIdentifiers"));

  -[ICLBundleRecord entitlements](self, "entitlements");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("entitlements"));

  -[ICLBundleRecord dataContainerURL](self, "dataContainerURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("dataContainerURL"));

  -[ICLBundleRecord environmentVariables](self, "environmentVariables");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("environmentVariables"));

  -[ICLBundleRecord groupContainers](self, "groupContainers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("groupContainers"));

  -[ICLBundleRecord personasRecordMap](self, "personasRecordMap");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("personasRecordMap"));

}

- (ICLBundleRecord)initWithLegacyRecordDictionary:(id)a3
{
  id v4;
  ICLBundleRecord *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  char v36;
  uint64_t v37;
  void *v38;
  char v39;
  void *v40;
  char v41;
  uint64_t v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  uint64_t v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  id v65;
  id v66;
  uint64_t v67;
  void *v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  id v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  id v83;
  void *v84;
  void *v86;
  _QWORD v87[4];
  id v88;

  v4 = a3;
  v5 = -[ICLBundleRecord init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE78]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;

    -[ICLBundleRecord setBundleIdentifier:](v5, "setBundleIdentifier:", v8);
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE90]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v10 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;

    -[ICLBundleRecord setBundleVersion:](v5, "setBundleVersion:", v11);
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AAF0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v13 = v12;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;

    -[ICLBundleRecord setBundleShortVersion:](v5, "setBundleShortVersion:", v14);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Path"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v16 = v15;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;

    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v17, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICLBundleRecord setBundleURL:](v5, "setBundleURL:", v18);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SignerIdentity"), v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v20 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;

    -[ICLBundleRecord setSignerIdentity:](v5, "setSignerIdentity:", v21);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SignatureVersion"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v23 = v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;

    -[ICLBundleRecord setSignatureVersion:](v5, "setSignatureVersion:", v24);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SignerOrganization"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v26 = v25;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v27 = v26;
    else
      v27 = 0;

    -[ICLBundleRecord setSignerOrganization:](v5, "setSignerOrganization:", v27);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TeamIdentifier"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v29 = v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v30 = v29;
    else
      v30 = 0;

    -[ICLBundleRecord setTeamIdentifier:](v5, "setTeamIdentifier:", v30);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CodeSigningInfoNotAuthoritative"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLBundleRecord setCodeSigningInfoNotAuthoritative:](v5, "setCodeSigningInfoNotAuthoritative:", MIBooleanValue(v31, 0));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CodeInfoIdentifier"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v33 = v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v34 = v33;
    else
      v34 = 0;

    -[ICLBundleRecord setCodeInfoIdentifier:](v5, "setCodeInfoIdentifier:", v34);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ProfileValidated"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = MIBooleanValue(v35, 0);

    if ((v36 & 1) != 0)
    {
      v37 = 3;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IsAdHocSigned"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = MIBooleanValue(v38, 0);

      if ((v39 & 1) != 0)
      {
        v37 = 1;
      }
      else if (-[ICLBundleRecord isPlaceholder](v5, "isPlaceholder"))
      {
        v37 = 6;
      }
      else
      {
        v37 = 2;
      }
    }
    -[ICLBundleRecord setCodeSignerType:](v5, "setCodeSignerType:", v37);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UPPValidated"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = MIBooleanValue(v40, 0);

    if ((v41 & 1) != 0)
    {
      v42 = 2;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FreeProfileValidated"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = MIBooleanValue(v43, 0);

      if (v44)
        v42 = 3;
      else
        v42 = 1;
    }
    -[ICLBundleRecord setProfileValidationType:](v5, "setProfileValidationType:", v42);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IsPlaceholder"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLBundleRecord setIsPlaceholder:](v5, "setIsPlaceholder:", MIBooleanValue(v45, 0));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IsNoLongerCompatible"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLBundleRecord setIsNoLongerCompatible:](v5, "setIsNoLongerCompatible:", MIBooleanValue(v46, 0));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HasSettingsBundle"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLBundleRecord setHasSettingsBundle:](v5, "setHasSettingsBundle:", MIBooleanValue(v47, 0));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IsContainerized"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLBundleRecord setIsContainerized:](v5, "setIsContainerized:", MIBooleanValue(v48, 0));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HasAppGroupContainers"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLBundleRecord setHasAppGroupContainers:](v5, "setHasAppGroupContainers:", MIBooleanValue(v49, 0));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HasSystemContainer"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLBundleRecord setHasSystemContainer:](v5, "setHasSystemContainer:", MIBooleanValue(v50, 0));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HasSystemGroupContainers"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLBundleRecord setHasSystemGroupContainers:](v5, "setHasSystemGroupContainers:", MIBooleanValue(v51, 0));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IsOnMountedDiskImage"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLBundleRecord setIsOnMountedDiskImage:](v5, "setIsOnMountedDiskImage:", MIBooleanValue(v52, 0));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CompatibilityState"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v54 = v53;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v55 = v54;
    else
      v55 = 0;

    -[ICLBundleRecord setCompatibilityState:](v5, "setCompatibilityState:", objc_msgSend(v55, "unsignedIntegerValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ApplicationType"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v56, "isEqualToString:", CFSTR("Any")) & 1) != 0)
    {
      v57 = 6;
    }
    else if ((objc_msgSend(v56, "isEqualToString:", CFSTR("CoreServices")) & 1) != 0)
    {
      v57 = 1;
    }
    else if ((objc_msgSend(v56, "isEqualToString:", CFSTR("System")) & 1) != 0)
    {
      v57 = 2;
    }
    else if ((objc_msgSend(v56, "isEqualToString:", CFSTR("SystemAppPlaceholder")) & 1) != 0)
    {
      v57 = 3;
    }
    else if ((objc_msgSend(v56, "isEqualToString:", CFSTR("User")) & 1) != 0)
    {
      v57 = 4;
    }
    else if (objc_msgSend(v56, "isEqualToString:", CFSTR("Internal")))
    {
      v57 = 5;
    }
    else
    {
      v57 = 0;
    }
    -[ICLBundleRecord setApplicationType:](v5, "setApplicationType:", v57);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("StaticDiskUsage"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v59 = v58;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v60 = v59;
    else
      v60 = 0;

    -[ICLBundleRecord setStaticDiskUsage:](v5, "setStaticDiskUsage:", v60);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LSCounterpartIdentifiers"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v62 = v61;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v63 = v62;
    else
      v63 = 0;

    if (v63)
    {
      objc_opt_class();
      if (MIArrayContainsOnlyClass(v63))
        -[ICLBundleRecord setCounterpartIdentifiers:](v5, "setCounterpartIdentifiers:", v63);
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Entitlements"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v65 = v64;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v66 = v65;
    else
      v66 = 0;

    if (v66)
    {
      v67 = objc_opt_class();
      if (MIDictionaryContainsOnlyClasses(v66, v67, 0))
        -[ICLBundleRecord setEntitlements:](v5, "setEntitlements:", v66);
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Container"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v69 = v68;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v70 = v69;
    else
      v70 = 0;

    if (v70)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v70, 1);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICLBundleRecord setDataContainerURL:](v5, "setDataContainerURL:", v71);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EnvironmentVariables"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v73 = v72;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v74 = v73;
    else
      v74 = 0;

    if (v74)
    {
      v75 = objc_opt_class();
      v76 = objc_opt_class();
      if (MIDictionaryContainsOnlyClasses(v74, v75, v76))
        -[ICLBundleRecord setEnvironmentVariables:](v5, "setEnvironmentVariables:", v74);
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("GroupContainers"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v78 = v77;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v79 = v78;
    else
      v79 = 0;

    if (v79)
    {
      v80 = objc_opt_class();
      v81 = objc_opt_class();
      if (MIDictionaryContainsOnlyClasses(v79, v80, v81))
      {
        v82 = (void *)objc_opt_new();
        v87[0] = MEMORY[0x1E0C809B0];
        v87[1] = 3221225472;
        v87[2] = __50__ICLBundleRecord_initWithLegacyRecordDictionary___block_invoke;
        v87[3] = &unk_1E6CB7220;
        v88 = v82;
        v83 = v82;
        objc_msgSend(v79, "enumerateKeysAndObjectsUsingBlock:", v87);
        v84 = (void *)objc_msgSend(v83, "copy");
        -[ICLBundleRecord setGroupContainers:](v5, "setGroupContainers:", v84);

      }
    }

  }
  return v5;
}

void __50__ICLBundleRecord_initWithLegacyRecordDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0C99E98];
  v6 = a2;
  objc_msgSend(v5, "fileURLWithPath:isDirectory:", a3, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

- (id)copyWithZone:(_NSZone *)a3
{
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[ICLBundleRecord bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setBundleIdentifier:", v7);

  -[ICLBundleRecord bundleVersion](self, "bundleVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setBundleVersion:", v9);

  -[ICLBundleRecord bundleShortVersion](self, "bundleShortVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setBundleShortVersion:", v11);

  -[ICLBundleRecord bundleURL](self, "bundleURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setBundleURL:", v13);

  -[ICLBundleRecord signerIdentity](self, "signerIdentity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  objc_msgSend(v5, "setSignerIdentity:", v15);

  -[ICLBundleRecord signatureVersion](self, "signatureVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);
  objc_msgSend(v5, "setSignatureVersion:", v17);

  -[ICLBundleRecord signerOrganization](self, "signerOrganization");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copyWithZone:", a3);
  objc_msgSend(v5, "setSignerOrganization:", v19);

  -[ICLBundleRecord teamIdentifier](self, "teamIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copyWithZone:", a3);
  objc_msgSend(v5, "setTeamIdentifier:", v21);

  objc_msgSend(v5, "setCodeSigningInfoNotAuthoritative:", -[ICLBundleRecord codeSigningInfoNotAuthoritative](self, "codeSigningInfoNotAuthoritative"));
  -[ICLBundleRecord codeInfoIdentifier](self, "codeInfoIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copyWithZone:", a3);
  objc_msgSend(v5, "setCodeInfoIdentifier:", v23);

  objc_msgSend(v5, "setCodeSignerType:", -[ICLBundleRecord codeSignerType](self, "codeSignerType"));
  objc_msgSend(v5, "setProfileValidationType:", -[ICLBundleRecord profileValidationType](self, "profileValidationType"));
  objc_msgSend(v5, "setIsPlaceholder:", -[ICLBundleRecord isPlaceholder](self, "isPlaceholder"));
  objc_msgSend(v5, "setIsNoLongerCompatible:", -[ICLBundleRecord isNoLongerCompatible](self, "isNoLongerCompatible"));
  objc_msgSend(v5, "setHasSettingsBundle:", -[ICLBundleRecord hasSettingsBundle](self, "hasSettingsBundle"));
  objc_msgSend(v5, "setIsContainerized:", -[ICLBundleRecord isContainerized](self, "isContainerized"));
  objc_msgSend(v5, "setHasAppGroupContainers:", -[ICLBundleRecord hasAppGroupContainers](self, "hasAppGroupContainers"));
  objc_msgSend(v5, "setHasSystemContainer:", -[ICLBundleRecord hasSystemContainer](self, "hasSystemContainer"));
  objc_msgSend(v5, "setHasSystemGroupContainers:", -[ICLBundleRecord hasSystemGroupContainers](self, "hasSystemGroupContainers"));
  objc_msgSend(v5, "setIsOnMountedDiskImage:", -[ICLBundleRecord isOnMountedDiskImage](self, "isOnMountedDiskImage"));
  objc_msgSend(v5, "setCompatibilityState:", -[ICLBundleRecord compatibilityState](self, "compatibilityState"));
  objc_msgSend(v5, "setApplicationType:", -[ICLBundleRecord applicationType](self, "applicationType"));
  -[ICLBundleRecord staticDiskUsage](self, "staticDiskUsage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copyWithZone:", a3);
  objc_msgSend(v5, "setStaticDiskUsage:", v25);

  -[ICLBundleRecord counterpartIdentifiers](self, "counterpartIdentifiers");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "copyWithZone:", a3);
  objc_msgSend(v5, "setCounterpartIdentifiers:", v27);

  -[ICLBundleRecord entitlements](self, "entitlements");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v28, "copyWithZone:", a3);
  objc_msgSend(v5, "setEntitlements:", v29);

  -[ICLBundleRecord dataContainerURL](self, "dataContainerURL");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v30, "copyWithZone:", a3);
  objc_msgSend(v5, "setDataContainerURL:", v31);

  -[ICLBundleRecord environmentVariables](self, "environmentVariables");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v32, "copyWithZone:", a3);
  objc_msgSend(v5, "setEnvironmentVariables:", v33);

  -[ICLBundleRecord groupContainers](self, "groupContainers");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v34, "copyWithZone:", a3);
  objc_msgSend(v5, "setGroupContainers:", v35);

  -[ICLBundleRecord personasRecordMap](self, "personasRecordMap");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v36, "copyWithZone:", a3);
  objc_msgSend(v5, "setPersonasRecordMap:", v37);

  return v5;
}

- (NSDictionary)legacyRecordDictionary
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  _QWORD v44[4];
  id v45;

  v3 = (void *)objc_opt_new();
  v4 = -[ICLBundleRecord applicationType](self, "applicationType") - 1;
  if (v4 <= 5)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", off_1E6CB7268[v4], CFSTR("ApplicationType"));
  -[ICLBundleRecord bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0C9AE78]);

  -[ICLBundleRecord bundleVersion](self, "bundleVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0C9AE90]);

  -[ICLBundleRecord bundleShortVersion](self, "bundleShortVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0C9AAF0]);

  -[ICLBundleRecord bundleURL](self, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("Path"));

  -[ICLBundleRecord signerIdentity](self, "signerIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("SignerIdentity"));

  -[ICLBundleRecord signatureVersion](self, "signatureVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("SignatureVersion"));

  -[ICLBundleRecord signerOrganization](self, "signerOrganization");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("SignerOrganization"));

  -[ICLBundleRecord teamIdentifier](self, "teamIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("TeamIdentifier"));

  v14 = -[ICLBundleRecord codeSigningInfoNotAuthoritative](self, "codeSigningInfoNotAuthoritative");
  v15 = MEMORY[0x1E0C9AAA0];
  v16 = MEMORY[0x1E0C9AAB0];
  if (v14)
    v17 = MEMORY[0x1E0C9AAB0];
  else
    v17 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("CodeSigningInfoNotAuthoritative"));
  -[ICLBundleRecord codeInfoIdentifier](self, "codeInfoIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("CodeInfoIdentifier"));

  if (-[ICLBundleRecord codeSignerType](self, "codeSignerType") == 3)
    v19 = v16;
  else
    v19 = v15;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("ProfileValidated"));
  if (-[ICLBundleRecord profileValidationType](self, "profileValidationType") == 2)
    v20 = v16;
  else
    v20 = v15;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("UPPValidated"));
  if (-[ICLBundleRecord profileValidationType](self, "profileValidationType") == 3)
    v21 = v16;
  else
    v21 = v15;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("FreeProfileValidated"));
  if (-[ICLBundleRecord codeSignerType](self, "codeSignerType") == 1)
    v22 = v16;
  else
    v22 = v15;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("IsAdHocSigned"));
  if (-[ICLBundleRecord isPlaceholder](self, "isPlaceholder"))
    v23 = v16;
  else
    v23 = v15;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("IsPlaceholder"));
  if (-[ICLBundleRecord isNoLongerCompatible](self, "isNoLongerCompatible"))
    v24 = v16;
  else
    v24 = v15;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("IsNoLongerCompatible"));
  if (-[ICLBundleRecord hasSettingsBundle](self, "hasSettingsBundle"))
    v25 = v16;
  else
    v25 = v15;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("HasSettingsBundle"));
  if (-[ICLBundleRecord isContainerized](self, "isContainerized"))
    v26 = v16;
  else
    v26 = v15;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("IsContainerized"));
  if (-[ICLBundleRecord hasAppGroupContainers](self, "hasAppGroupContainers"))
    v27 = v16;
  else
    v27 = v15;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("HasAppGroupContainers"));
  if (-[ICLBundleRecord hasSystemContainer](self, "hasSystemContainer"))
    v28 = v16;
  else
    v28 = v15;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("HasSystemContainer"));
  if (-[ICLBundleRecord hasSystemGroupContainers](self, "hasSystemGroupContainers"))
    v29 = v16;
  else
    v29 = v15;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("HasSystemGroupContainers"));
  if (-[ICLBundleRecord isOnMountedDiskImage](self, "isOnMountedDiskImage"))
    v30 = v16;
  else
    v30 = v15;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("IsOnMountedDiskImage"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICLBundleRecord compatibilityState](self, "compatibilityState"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("CompatibilityState"));

  -[ICLBundleRecord staticDiskUsage](self, "staticDiskUsage");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("StaticDiskUsage"));

  -[ICLBundleRecord counterpartIdentifiers](self, "counterpartIdentifiers");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("LSCounterpartIdentifiers"));

  -[ICLBundleRecord entitlements](self, "entitlements");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("Entitlements"));

  -[ICLBundleRecord dataContainerURL](self, "dataContainerURL");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "path");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("Container"));

  -[ICLBundleRecord environmentVariables](self, "environmentVariables");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("EnvironmentVariables"));

  -[ICLBundleRecord groupContainers](self, "groupContainers");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)objc_opt_new();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __41__ICLBundleRecord_legacyRecordDictionary__block_invoke;
    v44[3] = &unk_1E6CB7248;
    v40 = v39;
    v45 = v40;
    objc_msgSend(v38, "enumerateKeysAndObjectsUsingBlock:", v44);
    v41 = (void *)objc_msgSend(v40, "copy");
    if (v41)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("GroupContainers"));

  }
  v42 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v42;
}

void __41__ICLBundleRecord_legacyRecordDictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "path");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (BOOL)isEqual:(id)a3
{
  ICLBundleRecord *v4;
  ICLBundleRecord *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  BOOL v29;
  _BOOL4 v30;
  BOOL v31;
  void *v32;
  void *v33;
  BOOL v34;
  unint64_t v35;
  unint64_t v36;
  _BOOL4 v37;
  _BOOL4 v38;
  _BOOL4 v39;
  _BOOL4 v40;
  _BOOL4 v41;
  _BOOL4 v42;
  _BOOL4 v43;
  _BOOL4 v44;
  unint64_t v45;
  unint64_t v46;
  void *v47;
  void *v48;
  BOOL v49;
  void *v50;
  void *v51;
  BOOL v52;
  void *v53;
  void *v54;
  BOOL v55;
  void *v56;
  void *v57;
  BOOL v58;
  void *v59;
  void *v60;
  BOOL v61;
  void *v62;
  void *v63;
  BOOL v64;
  void *v65;
  void *v66;
  BOOL v67;

  v4 = (ICLBundleRecord *)a3;
  if (self == v4)
  {
    v31 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[ICLBundleRecord bundleIdentifier](self, "bundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICLBundleRecord bundleIdentifier](v5, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MICompareObjects(v6, v7);

      if (v8)
      {
        -[ICLBundleRecord bundleVersion](self, "bundleVersion");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICLBundleRecord bundleVersion](v5, "bundleVersion");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = MICompareObjects(v9, v10);

        if (v11)
        {
          -[ICLBundleRecord bundleShortVersion](self, "bundleShortVersion");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICLBundleRecord bundleShortVersion](v5, "bundleShortVersion");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = MICompareObjects(v12, v13);

          if (v14)
          {
            -[ICLBundleRecord bundleURL](self, "bundleURL");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICLBundleRecord bundleURL](v5, "bundleURL");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = MICompareObjects(v15, v16);

            if (v17)
            {
              -[ICLBundleRecord signerIdentity](self, "signerIdentity");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[ICLBundleRecord signerIdentity](v5, "signerIdentity");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = MICompareObjects(v18, v19);

              if (v20)
              {
                -[ICLBundleRecord signatureVersion](self, "signatureVersion");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                -[ICLBundleRecord signatureVersion](v5, "signatureVersion");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = MICompareObjects(v21, v22);

                if (v23)
                {
                  -[ICLBundleRecord signerOrganization](self, "signerOrganization");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  -[ICLBundleRecord signerOrganization](v5, "signerOrganization");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = MICompareObjects(v24, v25);

                  if (v26)
                  {
                    -[ICLBundleRecord teamIdentifier](self, "teamIdentifier");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    -[ICLBundleRecord teamIdentifier](v5, "teamIdentifier");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    v29 = MICompareObjects(v27, v28);

                    if (v29)
                    {
                      v30 = -[ICLBundleRecord codeSigningInfoNotAuthoritative](self, "codeSigningInfoNotAuthoritative");
                      if (v30 == -[ICLBundleRecord codeSigningInfoNotAuthoritative](v5, "codeSigningInfoNotAuthoritative"))
                      {
                        -[ICLBundleRecord codeInfoIdentifier](self, "codeInfoIdentifier");
                        v32 = (void *)objc_claimAutoreleasedReturnValue();
                        -[ICLBundleRecord codeInfoIdentifier](v5, "codeInfoIdentifier");
                        v33 = (void *)objc_claimAutoreleasedReturnValue();
                        v34 = MICompareObjects(v32, v33);

                        if (v34)
                        {
                          v35 = -[ICLBundleRecord codeSignerType](self, "codeSignerType");
                          if (v35 == -[ICLBundleRecord codeSignerType](v5, "codeSignerType"))
                          {
                            v36 = -[ICLBundleRecord profileValidationType](self, "profileValidationType");
                            if (v36 == -[ICLBundleRecord profileValidationType](v5, "profileValidationType"))
                            {
                              v37 = -[ICLBundleRecord isPlaceholder](self, "isPlaceholder");
                              if (v37 == -[ICLBundleRecord isPlaceholder](v5, "isPlaceholder"))
                              {
                                v38 = -[ICLBundleRecord isNoLongerCompatible](self, "isNoLongerCompatible");
                                if (v38 == -[ICLBundleRecord isNoLongerCompatible](v5, "isNoLongerCompatible"))
                                {
                                  v39 = -[ICLBundleRecord hasSettingsBundle](self, "hasSettingsBundle");
                                  if (v39 == -[ICLBundleRecord hasSettingsBundle](v5, "hasSettingsBundle"))
                                  {
                                    v40 = -[ICLBundleRecord isContainerized](self, "isContainerized");
                                    if (v40 == -[ICLBundleRecord isContainerized](v5, "isContainerized"))
                                    {
                                      v41 = -[ICLBundleRecord hasAppGroupContainers](self, "hasAppGroupContainers");
                                      if (v41 == -[ICLBundleRecord hasAppGroupContainers](v5, "hasAppGroupContainers"))
                                      {
                                        v42 = -[ICLBundleRecord hasSystemContainer](self, "hasSystemContainer");
                                        if (v42 == -[ICLBundleRecord hasSystemContainer](v5, "hasSystemContainer"))
                                        {
                                          v43 = -[ICLBundleRecord hasSystemGroupContainers](self, "hasSystemGroupContainers");
                                          if (v43 == -[ICLBundleRecord hasSystemGroupContainers](v5, "hasSystemGroupContainers"))
                                          {
                                            v44 = -[ICLBundleRecord isOnMountedDiskImage](self, "isOnMountedDiskImage");
                                            if (v44 == -[ICLBundleRecord isOnMountedDiskImage](v5, "isOnMountedDiskImage"))
                                            {
                                              v45 = -[ICLBundleRecord compatibilityState](self, "compatibilityState");
                                              if (v45 == -[ICLBundleRecord compatibilityState](v5, "compatibilityState"))
                                              {
                                                v46 = -[ICLBundleRecord applicationType](self, "applicationType");
                                                if (v46 == -[ICLBundleRecord applicationType](v5, "applicationType"))
                                                {
                                                  -[ICLBundleRecord staticDiskUsage](self, "staticDiskUsage");
                                                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                                                  -[ICLBundleRecord staticDiskUsage](v5, "staticDiskUsage");
                                                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                                                  v49 = MICompareObjects(v47, v48);

                                                  if (v49)
                                                  {
                                                    -[ICLBundleRecord counterpartIdentifiers](self, "counterpartIdentifiers");
                                                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                                                    -[ICLBundleRecord counterpartIdentifiers](v5, "counterpartIdentifiers");
                                                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                                                    v52 = MICompareObjects(v50, v51);

                                                    if (v52)
                                                    {
                                                      -[ICLBundleRecord entitlements](self, "entitlements");
                                                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                                                      -[ICLBundleRecord entitlements](v5, "entitlements");
                                                      v54 = (void *)objc_claimAutoreleasedReturnValue();
                                                      v55 = MICompareObjects(v53, v54);

                                                      if (v55)
                                                      {
                                                        -[ICLBundleRecord dataContainerURL](self, "dataContainerURL");
                                                        v56 = (void *)objc_claimAutoreleasedReturnValue();
                                                        -[ICLBundleRecord dataContainerURL](v5, "dataContainerURL");
                                                        v57 = (void *)objc_claimAutoreleasedReturnValue();
                                                        v58 = MICompareObjects(v56, v57);

                                                        if (v58)
                                                        {
                                                          -[ICLBundleRecord environmentVariables](self, "environmentVariables");
                                                          v59 = (void *)objc_claimAutoreleasedReturnValue();
                                                          -[ICLBundleRecord environmentVariables](v5, "environmentVariables");
                                                          v60 = (void *)objc_claimAutoreleasedReturnValue();
                                                          v61 = MICompareObjects(v59, v60);

                                                          if (v61)
                                                          {
                                                            -[ICLBundleRecord groupContainers](self, "groupContainers");
                                                            v62 = (void *)objc_claimAutoreleasedReturnValue();
                                                            -[ICLBundleRecord groupContainers](v5, "groupContainers");
                                                            v63 = (void *)objc_claimAutoreleasedReturnValue();
                                                            v64 = MICompareObjects(v62, v63);

                                                            if (v64)
                                                            {
                                                              -[ICLBundleRecord personasRecordMap](self, "personasRecordMap");
                                                              v65 = (void *)objc_claimAutoreleasedReturnValue();
                                                              -[ICLBundleRecord personasRecordMap](v5, "personasRecordMap");
                                                              v66 = (void *)objc_claimAutoreleasedReturnValue();
                                                              v67 = MICompareObjects(v65, v66);

                                                              if (v67)
                                                              {
                                                                v31 = 1;
LABEL_123:

                                                                goto LABEL_124;
                                                              }
                                                              if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                                              {
LABEL_122:
                                                                v31 = 0;
                                                                goto LABEL_123;
                                                              }
                                                            }
                                                            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                                            {
                                                              goto LABEL_122;
                                                            }
                                                          }
                                                          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                                          {
                                                            goto LABEL_122;
                                                          }
                                                        }
                                                        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                                        {
                                                          goto LABEL_122;
                                                        }
                                                      }
                                                      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                                      {
                                                        goto LABEL_122;
                                                      }
                                                    }
                                                    else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                                    {
                                                      goto LABEL_122;
                                                    }
                                                  }
                                                  else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                                  {
                                                    goto LABEL_122;
                                                  }
                                                }
                                                else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                                {
                                                  goto LABEL_122;
                                                }
                                              }
                                              else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                              {
                                                goto LABEL_122;
                                              }
                                            }
                                            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                            {
                                              goto LABEL_122;
                                            }
                                          }
                                          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                          {
                                            goto LABEL_122;
                                          }
                                        }
                                        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                        {
                                          goto LABEL_122;
                                        }
                                      }
                                      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                      {
                                        goto LABEL_122;
                                      }
                                    }
                                    else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                    {
                                      goto LABEL_122;
                                    }
                                  }
                                  else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                  {
                                    goto LABEL_122;
                                  }
                                }
                                else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                {
                                  goto LABEL_122;
                                }
                              }
                              else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                              {
                                goto LABEL_122;
                              }
                            }
                            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                            {
                              goto LABEL_122;
                            }
                          }
                          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                          {
                            goto LABEL_122;
                          }
                        }
                        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                        {
                          goto LABEL_122;
                        }
                      }
                      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                      {
                        goto LABEL_122;
                      }
                    }
                    else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                    {
                      goto LABEL_122;
                    }
                  }
                  else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                  {
                    goto LABEL_122;
                  }
                }
                else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                {
                  goto LABEL_122;
                }
              }
              else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
              {
                goto LABEL_122;
              }
            }
            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
            {
              goto LABEL_122;
            }
          }
          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
            goto LABEL_122;
          }
        }
        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
          goto LABEL_122;
        }
      }
      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
        goto LABEL_122;
      }
      MOLogWrite();
      goto LABEL_122;
    }
    v31 = 0;
  }
LABEL_124:

  return v31;
}

- (unint64_t)hash
{
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;

  v3 = -[ICLBundleRecord codeSigningInfoNotAuthoritative](self, "codeSigningInfoNotAuthoritative");
  v4 = -[ICLBundleRecord isPlaceholder](self, "isPlaceholder");
  v5 = 2;
  if (!v4)
    v5 = 0;
  v6 = v5 | v3;
  if (-[ICLBundleRecord isNoLongerCompatible](self, "isNoLongerCompatible"))
    v7 = 4;
  else
    v7 = 0;
  v8 = -[ICLBundleRecord hasSettingsBundle](self, "hasSettingsBundle");
  v9 = 8;
  if (!v8)
    v9 = 0;
  v10 = v6 | v7 | v9;
  if (-[ICLBundleRecord isContainerized](self, "isContainerized"))
    v11 = 16;
  else
    v11 = 0;
  v12 = -[ICLBundleRecord hasAppGroupContainers](self, "hasAppGroupContainers");
  v13 = 32;
  if (!v12)
    v13 = 0;
  v14 = v11 | v13;
  v15 = -[ICLBundleRecord hasSystemContainer](self, "hasSystemContainer");
  v16 = 64;
  if (!v15)
    v16 = 0;
  v17 = v10 | v14 | v16;
  if (-[ICLBundleRecord hasSystemGroupContainers](self, "hasSystemGroupContainers"))
    v18 = 128;
  else
    v18 = 0;
  v19 = -[ICLBundleRecord isOnMountedDiskImage](self, "isOnMountedDiskImage");
  v20 = 256;
  if (!v19)
    v20 = 0;
  v21 = v18 ^ v20;
  -[ICLBundleRecord bundleIdentifier](self, "bundleIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v21 ^ objc_msgSend(v22, "hash");

  -[ICLBundleRecord bundleVersion](self, "bundleVersion");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v17 ^ v23 ^ objc_msgSend(v24, "hash");

  -[ICLBundleRecord bundleShortVersion](self, "bundleShortVersion");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "hash");

  -[ICLBundleRecord bundleURL](self, "bundleURL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v27 ^ objc_msgSend(v28, "hash");

  -[ICLBundleRecord signerIdentity](self, "signerIdentity");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v29 ^ objc_msgSend(v30, "hash");

  -[ICLBundleRecord signatureVersion](self, "signatureVersion");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v31 ^ objc_msgSend(v32, "hash");

  -[ICLBundleRecord signerOrganization](self, "signerOrganization");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v33 ^ objc_msgSend(v34, "hash");

  -[ICLBundleRecord teamIdentifier](self, "teamIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v25 ^ v35 ^ objc_msgSend(v36, "hash");

  -[ICLBundleRecord codeInfoIdentifier](self, "codeInfoIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "hash");

  -[ICLBundleRecord staticDiskUsage](self, "staticDiskUsage");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v39 ^ objc_msgSend(v40, "hash");

  -[ICLBundleRecord counterpartIdentifiers](self, "counterpartIdentifiers");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v41 ^ objc_msgSend(v42, "hash");

  -[ICLBundleRecord entitlements](self, "entitlements");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v43 ^ objc_msgSend(v44, "hash");

  -[ICLBundleRecord dataContainerURL](self, "dataContainerURL");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v45 ^ objc_msgSend(v46, "hash");

  -[ICLBundleRecord environmentVariables](self, "environmentVariables");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v47 ^ objc_msgSend(v48, "hash");

  -[ICLBundleRecord groupContainers](self, "groupContainers");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v37 ^ v49 ^ objc_msgSend(v50, "hash");

  -[ICLBundleRecord personasRecordMap](self, "personasRecordMap");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "hash");

  v54 = v53 ^ -[ICLBundleRecord codeSignerType](self, "codeSignerType");
  v55 = v54 ^ -[ICLBundleRecord profileValidationType](self, "profileValidationType");
  v56 = v55 ^ -[ICLBundleRecord compatibilityState](self, "compatibilityState");
  return v51 ^ v56 ^ -[ICLBundleRecord applicationType](self, "applicationType");
}

- (id)description
{
  void *v2;
  void *v3;

  -[ICLBundleRecord legacyRecordDictionary](self, "legacyRecordDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)bundleRecordArrayToInfoDictionaryArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "legacyRecordDictionary", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    v11 = (void *)objc_msgSend(v4, "copy");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)infoDictionaryArrayToBundleRecordArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  ICLBundleRecord *v11;
  ICLBundleRecord *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          v11 = [ICLBundleRecord alloc];
          v12 = -[ICLBundleRecord initWithLegacyRecordDictionary:](v11, "initWithLegacyRecordDictionary:", v10, (_QWORD)v15);
          objc_msgSend(v4, "addObject:", v12);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

    v13 = (void *)objc_msgSend(v4, "copy");
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)bundleShortVersion
{
  return self->_bundleShortVersion;
}

- (void)setBundleShortVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (void)setBundleURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)signerIdentity
{
  return self->_signerIdentity;
}

- (void)setSignerIdentity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)signatureVersion
{
  return self->_signatureVersion;
}

- (void)setSignatureVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)signerOrganization
{
  return self->_signerOrganization;
}

- (void)setSignerOrganization:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (void)setTeamIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)codeSigningInfoNotAuthoritative
{
  return self->_codeSigningInfoNotAuthoritative;
}

- (void)setCodeSigningInfoNotAuthoritative:(BOOL)a3
{
  self->_codeSigningInfoNotAuthoritative = a3;
}

- (NSString)codeInfoIdentifier
{
  return self->_codeInfoIdentifier;
}

- (void)setCodeInfoIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (unint64_t)codeSignerType
{
  return self->_codeSignerType;
}

- (void)setCodeSignerType:(unint64_t)a3
{
  self->_codeSignerType = a3;
}

- (unint64_t)profileValidationType
{
  return self->_profileValidationType;
}

- (void)setProfileValidationType:(unint64_t)a3
{
  self->_profileValidationType = a3;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

- (BOOL)isNoLongerCompatible
{
  return self->_isNoLongerCompatible;
}

- (void)setIsNoLongerCompatible:(BOOL)a3
{
  self->_isNoLongerCompatible = a3;
}

- (BOOL)hasSettingsBundle
{
  return self->_hasSettingsBundle;
}

- (void)setHasSettingsBundle:(BOOL)a3
{
  self->_hasSettingsBundle = a3;
}

- (BOOL)isContainerized
{
  return self->_isContainerized;
}

- (void)setIsContainerized:(BOOL)a3
{
  self->_isContainerized = a3;
}

- (BOOL)hasAppGroupContainers
{
  return self->_hasAppGroupContainers;
}

- (void)setHasAppGroupContainers:(BOOL)a3
{
  self->_hasAppGroupContainers = a3;
}

- (BOOL)hasSystemContainer
{
  return self->_hasSystemContainer;
}

- (void)setHasSystemContainer:(BOOL)a3
{
  self->_hasSystemContainer = a3;
}

- (BOOL)hasSystemGroupContainers
{
  return self->_hasSystemGroupContainers;
}

- (void)setHasSystemGroupContainers:(BOOL)a3
{
  self->_hasSystemGroupContainers = a3;
}

- (BOOL)isOnMountedDiskImage
{
  return self->_isOnMountedDiskImage;
}

- (void)setIsOnMountedDiskImage:(BOOL)a3
{
  self->_isOnMountedDiskImage = a3;
}

- (unint64_t)compatibilityState
{
  return self->_compatibilityState;
}

- (void)setCompatibilityState:(unint64_t)a3
{
  self->_compatibilityState = a3;
}

- (unint64_t)applicationType
{
  return self->_applicationType;
}

- (void)setApplicationType:(unint64_t)a3
{
  self->_applicationType = a3;
}

- (NSNumber)staticDiskUsage
{
  return self->_staticDiskUsage;
}

- (void)setStaticDiskUsage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSArray)counterpartIdentifiers
{
  return self->_counterpartIdentifiers;
}

- (void)setCounterpartIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSDictionary)entitlements
{
  return self->_entitlements;
}

- (void)setEntitlements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSURL)dataContainerURL
{
  return self->_dataContainerURL;
}

- (void)setDataContainerURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSDictionary)environmentVariables
{
  return self->_environmentVariables;
}

- (void)setEnvironmentVariables:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSDictionary)groupContainers
{
  return self->_groupContainers;
}

- (void)setGroupContainers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSDictionary)personasRecordMap
{
  return self->_personasRecordMap;
}

- (void)setPersonasRecordMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personasRecordMap, 0);
  objc_storeStrong((id *)&self->_groupContainers, 0);
  objc_storeStrong((id *)&self->_environmentVariables, 0);
  objc_storeStrong((id *)&self->_dataContainerURL, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_counterpartIdentifiers, 0);
  objc_storeStrong((id *)&self->_staticDiskUsage, 0);
  objc_storeStrong((id *)&self->_codeInfoIdentifier, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_signerOrganization, 0);
  objc_storeStrong((id *)&self->_signatureVersion, 0);
  objc_storeStrong((id *)&self->_signerIdentity, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_bundleShortVersion, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
