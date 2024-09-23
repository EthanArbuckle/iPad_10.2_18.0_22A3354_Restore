@implementation DMFApplication

- (DMFApplication)initWithApplicationIdentifier:(id)a3 bundleIdentifier:(id)a4 name:(id)a5 iconData:(id)a6 bundleVersion:(id)a7 shortVersionString:(id)a8 applicationType:(id)a9 adamID:(id)a10 externalVersionIdentifier:(id)a11 betaExternalVersionIdentifier:(id)a12 staticUsage:(id)a13 dynamicUsage:(id)a14 onDemandResourcesUsage:(id)a15 unusedRedemptionCode:(id)a16 attributes:(id)a17 configuration:(id)a18 feedback:(id)a19 state:(unint64_t)a20 managementFlags:(unint64_t)a21 isManaged:(BOOL)a22 isValidated:(BOOL)a23 isInstalled:(BOOL)a24 isPlaceholder:(BOOL)a25 isAppUpdate:(BOOL)a26 isBetaApp:(BOOL)a27 isRemoveable:(BOOL)a28 fileSharingEnabled:(BOOL)a29 progress:(id)a30
{
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  DMFApplication *v45;
  uint64_t v46;
  NSString *applicationIdentifier;
  uint64_t v48;
  NSString *bundleIdentifier;
  uint64_t v50;
  NSString *name;
  uint64_t v52;
  NSData *iconData;
  uint64_t v54;
  NSString *applicationType;
  uint64_t v56;
  NSNumber *adamID;
  uint64_t v58;
  NSNumber *externalVersionIdentifier;
  uint64_t v60;
  NSNumber *betaExternalVersionIdentifier;
  uint64_t v62;
  NSNumber *staticUsage;
  uint64_t v64;
  NSNumber *dynamicUsage;
  uint64_t v66;
  NSNumber *onDemandResourcesUsage;
  uint64_t v68;
  NSString *unusedRedemptionCode;
  uint64_t v70;
  NSDictionary *attributes;
  uint64_t v72;
  NSDictionary *configuration;
  uint64_t v74;
  NSDictionary *feedback;
  id obj;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  objc_super v89;

  v82 = a3;
  v87 = a4;
  v35 = a5;
  v88 = a6;
  obj = a7;
  v81 = a7;
  v36 = a8;
  v80 = a8;
  v37 = a9;
  v86 = a10;
  v85 = a11;
  v84 = a12;
  v83 = a13;
  v38 = v35;
  v39 = a14;
  v40 = a15;
  v41 = a16;
  v42 = a17;
  v43 = a18;
  v44 = a19;
  v79 = a30;
  v89.receiver = self;
  v89.super_class = (Class)DMFApplication;
  v45 = -[DMFApplication init](&v89, sel_init);
  if (v45)
  {
    v46 = objc_msgSend(v82, "copy");
    applicationIdentifier = v45->_applicationIdentifier;
    v45->_applicationIdentifier = (NSString *)v46;

    v48 = objc_msgSend(v87, "copy");
    bundleIdentifier = v45->_bundleIdentifier;
    v45->_bundleIdentifier = (NSString *)v48;

    v50 = objc_msgSend(v38, "copy");
    name = v45->_name;
    v45->_name = (NSString *)v50;

    v52 = objc_msgSend(v88, "copy");
    iconData = v45->_iconData;
    v45->_iconData = (NSData *)v52;

    objc_storeStrong((id *)&v45->_bundleVersion, obj);
    objc_storeStrong((id *)&v45->_shortVersionString, v36);
    v54 = objc_msgSend(v37, "copy");
    applicationType = v45->_applicationType;
    v45->_applicationType = (NSString *)v54;

    v56 = objc_msgSend(v86, "copy");
    adamID = v45->_adamID;
    v45->_adamID = (NSNumber *)v56;

    v58 = objc_msgSend(v85, "copy");
    externalVersionIdentifier = v45->_externalVersionIdentifier;
    v45->_externalVersionIdentifier = (NSNumber *)v58;

    v60 = objc_msgSend(v84, "copy");
    betaExternalVersionIdentifier = v45->_betaExternalVersionIdentifier;
    v45->_betaExternalVersionIdentifier = (NSNumber *)v60;

    v62 = objc_msgSend(v83, "copy");
    staticUsage = v45->_staticUsage;
    v45->_staticUsage = (NSNumber *)v62;

    v64 = objc_msgSend(v39, "copy");
    dynamicUsage = v45->_dynamicUsage;
    v45->_dynamicUsage = (NSNumber *)v64;

    v66 = objc_msgSend(v40, "copy");
    onDemandResourcesUsage = v45->_onDemandResourcesUsage;
    v45->_onDemandResourcesUsage = (NSNumber *)v66;

    v68 = objc_msgSend(v41, "copy");
    unusedRedemptionCode = v45->_unusedRedemptionCode;
    v45->_unusedRedemptionCode = (NSString *)v68;

    v70 = objc_msgSend(v42, "copy");
    attributes = v45->_attributes;
    v45->_attributes = (NSDictionary *)v70;

    v72 = objc_msgSend(v43, "copy");
    configuration = v45->_configuration;
    v45->_configuration = (NSDictionary *)v72;

    v74 = objc_msgSend(v44, "copy");
    feedback = v45->_feedback;
    v45->_feedback = (NSDictionary *)v74;

    v45->_state = a20;
    v45->_managementFlags = a21;
    v45->_isManaged = a22;
    v45->_isValidated = a23;
    v45->_isInstalled = a24;
    v45->_isPlaceholder = a25;
    v45->_isAppUpdate = a26;
    v45->_isBetaApp = a27;
    v45->_isRemoveable = a28;
    v45->_fileSharingEnabled = a29;
    objc_storeStrong((id *)&v45->_progress, a30);
  }

  return v45;
}

- (DMFApplication)initWithBundleIdentifier:(id)a3 name:(id)a4 iconData:(id)a5 applicationType:(id)a6 adamID:(id)a7 externalVersionNumber:(id)a8 betaExternalVersionIdentifier:(id)a9 isInstalled:(BOOL)a10 isPlaceholder:(BOOL)a11 isAppUpdate:(BOOL)a12 isBetaApp:(BOOL)a13 isRemoveable:(BOOL)a14 fileSharingEnabled:(BOOL)a15 progress:(id)a16
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  DMFApplication *v29;
  uint64_t v30;
  NSString *bundleIdentifier;
  uint64_t v32;
  NSString *name;
  uint64_t v34;
  NSData *iconData;
  uint64_t v36;
  NSString *applicationType;
  uint64_t v38;
  NSNumber *adamID;
  uint64_t v40;
  NSNumber *externalVersionIdentifier;
  uint64_t v42;
  NSNumber *betaExternalVersionIdentifier;
  id v45;
  objc_super v46;

  v45 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v25 = a7;
  v26 = a8;
  v27 = a9;
  v28 = a16;
  v46.receiver = self;
  v46.super_class = (Class)DMFApplication;
  v29 = -[DMFApplication init](&v46, sel_init);
  if (v29)
  {
    v30 = objc_msgSend(v45, "copy");
    bundleIdentifier = v29->_bundleIdentifier;
    v29->_bundleIdentifier = (NSString *)v30;

    v32 = objc_msgSend(v22, "copy");
    name = v29->_name;
    v29->_name = (NSString *)v32;

    v34 = objc_msgSend(v23, "copy");
    iconData = v29->_iconData;
    v29->_iconData = (NSData *)v34;

    v36 = objc_msgSend(v24, "copy");
    applicationType = v29->_applicationType;
    v29->_applicationType = (NSString *)v36;

    v38 = objc_msgSend(v25, "copy");
    adamID = v29->_adamID;
    v29->_adamID = (NSNumber *)v38;

    v40 = objc_msgSend(v26, "copy");
    externalVersionIdentifier = v29->_externalVersionIdentifier;
    v29->_externalVersionIdentifier = (NSNumber *)v40;

    v42 = objc_msgSend(v27, "copy");
    betaExternalVersionIdentifier = v29->_betaExternalVersionIdentifier;
    v29->_betaExternalVersionIdentifier = (NSNumber *)v42;

    v29->_isInstalled = a10;
    v29->_isPlaceholder = a11;
    v29->_isAppUpdate = a12;
    v29->_isBetaApp = a13;
    v29->_isRemoveable = a14;
    v29->_fileSharingEnabled = a15;
    objc_storeStrong((id *)&v29->_progress, a16);
  }

  return v29;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4;
  BOOL v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  void *v12;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v27 = objc_alloc((Class)objc_opt_class());
  -[DMFApplication applicationIdentifier](self, "applicationIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFApplication bundleIdentifier](self, "bundleIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFApplication name](self, "name");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFApplication iconData](self, "iconData");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFApplication bundleVersion](self, "bundleVersion");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFApplication shortVersionString](self, "shortVersionString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFApplication applicationType](self, "applicationType");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFApplication adamID](self, "adamID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFApplication externalVersionIdentifier](self, "externalVersionIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFApplication betaExternalVersionIdentifier](self, "betaExternalVersionIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFApplication staticUsage](self, "staticUsage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFApplication dynamicUsage](self, "dynamicUsage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFApplication onDemandResourcesUsage](self, "onDemandResourcesUsage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFApplication unusedRedemptionCode](self, "unusedRedemptionCode");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFApplication attributes](self, "attributes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFApplication configuration](self, "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFApplication feedback](self, "feedback");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[DMFApplication state](self, "state");
  v16 = -[DMFApplication managementFlags](self, "managementFlags");
  v4 = -[DMFApplication isManaged](self, "isManaged");
  v5 = -[DMFApplication isValidated](self, "isValidated");
  v6 = -[DMFApplication isInstalled](self, "isInstalled");
  v7 = -[DMFApplication isPlaceholder](self, "isPlaceholder");
  v8 = -[DMFApplication isAppUpdate](self, "isAppUpdate");
  v9 = -[DMFApplication isBetaApp](self, "isBetaApp");
  v10 = -[DMFApplication isRemoveable](self, "isRemoveable");
  v11 = -[DMFApplication fileSharingEnabled](self, "fileSharingEnabled");
  -[DMFApplication progress](self, "progress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HIBYTE(v14) = v11;
  BYTE6(v14) = v10;
  BYTE5(v14) = v9;
  BYTE4(v14) = v8;
  BYTE3(v14) = v7;
  BYTE2(v14) = v6;
  BYTE1(v14) = v5;
  LOBYTE(v14) = v4;
  v28 = (void *)objc_msgSend(v27, "initWithApplicationIdentifier:bundleIdentifier:name:iconData:bundleVersion:shortVersionString:applicationType:adamID:externalVersionIdentifier:betaExternalVersionIdentifier:staticUsage:dynamicUsage:onDemandResourcesUsage:unusedRedemptionCode:attributes:configuration:feedback:state:managementFlags:isManaged:isValidated:isInstalled:isPlaceholder:isAppUpdate:isBetaApp:isRemoveable:fileSharingEnabled:progress:", v35, v34, v33, v32, v31, v26, v30, v29, v25, v15, v24, v23, v22, v21,
                  v20,
                  v19,
                  v18,
                  v17,
                  v16,
                  v14,
                  v12);

  return v28;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (DMFApplication)initWithCoder:(id)a3
{
  id v4;
  DMFApplication *v5;
  void *v6;
  uint64_t v7;
  NSString *applicationIdentifier;
  void *v9;
  uint64_t v10;
  NSString *bundleIdentifier;
  void *v12;
  uint64_t v13;
  NSString *name;
  void *v15;
  uint64_t v16;
  NSData *iconData;
  void *v18;
  uint64_t v19;
  NSString *bundleVersion;
  void *v21;
  uint64_t v22;
  NSString *shortVersionString;
  void *v24;
  uint64_t v25;
  NSString *applicationType;
  void *v27;
  uint64_t v28;
  NSNumber *adamID;
  void *v30;
  uint64_t v31;
  NSNumber *externalVersionIdentifier;
  void *v33;
  uint64_t v34;
  NSNumber *betaExternalVersionIdentifier;
  void *v36;
  uint64_t v37;
  NSNumber *staticUsage;
  void *v39;
  uint64_t v40;
  NSNumber *dynamicUsage;
  void *v42;
  uint64_t v43;
  NSNumber *onDemandResourcesUsage;
  void *v45;
  uint64_t v46;
  NSString *unusedRedemptionCode;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  NSDictionary *attributes;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  NSDictionary *configuration;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  NSDictionary *feedback;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  DMFApplicationInstallProgress *progress;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  objc_super v104;

  v4 = a3;
  v104.receiver = self;
  v104.super_class = (Class)DMFApplication;
  v5 = -[DMFApplication init](&v104, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("applicationIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("bundleIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v10;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("name"));
    v13 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v13;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("iconData"));
    v16 = objc_claimAutoreleasedReturnValue();
    iconData = v5->_iconData;
    v5->_iconData = (NSData *)v16;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("bundleVersion"));
    v19 = objc_claimAutoreleasedReturnValue();
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v19;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("shortVersionString"));
    v22 = objc_claimAutoreleasedReturnValue();
    shortVersionString = v5->_shortVersionString;
    v5->_shortVersionString = (NSString *)v22;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("applicationType"));
    v25 = objc_claimAutoreleasedReturnValue();
    applicationType = v5->_applicationType;
    v5->_applicationType = (NSString *)v25;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("adamID"));
    v28 = objc_claimAutoreleasedReturnValue();
    adamID = v5->_adamID;
    v5->_adamID = (NSNumber *)v28;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("externalVersionIdentifier"));
    v31 = objc_claimAutoreleasedReturnValue();
    externalVersionIdentifier = v5->_externalVersionIdentifier;
    v5->_externalVersionIdentifier = (NSNumber *)v31;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("betaExternalVersionIdentifier"));
    v34 = objc_claimAutoreleasedReturnValue();
    betaExternalVersionIdentifier = v5->_betaExternalVersionIdentifier;
    v5->_betaExternalVersionIdentifier = (NSNumber *)v34;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("staticUsage"));
    v37 = objc_claimAutoreleasedReturnValue();
    staticUsage = v5->_staticUsage;
    v5->_staticUsage = (NSNumber *)v37;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v39, CFSTR("dynamicUsage"));
    v40 = objc_claimAutoreleasedReturnValue();
    dynamicUsage = v5->_dynamicUsage;
    v5->_dynamicUsage = (NSNumber *)v40;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v42, CFSTR("onDemandResourcesUsage"));
    v43 = objc_claimAutoreleasedReturnValue();
    onDemandResourcesUsage = v5->_onDemandResourcesUsage;
    v5->_onDemandResourcesUsage = (NSNumber *)v43;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v45, CFSTR("unusedRedemptionCode"));
    v46 = objc_claimAutoreleasedReturnValue();
    unusedRedemptionCode = v5->_unusedRedemptionCode;
    v5->_unusedRedemptionCode = (NSString *)v46;

    v101 = (void *)MEMORY[0x1E0C99E60];
    v98 = objc_opt_class();
    v95 = objc_opt_class();
    v48 = objc_opt_class();
    v49 = objc_opt_class();
    v50 = objc_opt_class();
    v51 = objc_opt_class();
    v52 = objc_opt_class();
    v53 = objc_opt_class();
    v54 = objc_opt_class();
    v55 = objc_opt_class();
    objc_msgSend(v101, "setWithObjects:", v98, v95, v48, v49, v50, v51, v52, v53, v54, v55, objc_opt_class(), 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v56, CFSTR("attributes"));
    v57 = objc_claimAutoreleasedReturnValue();
    attributes = v5->_attributes;
    v5->_attributes = (NSDictionary *)v57;

    v102 = (void *)MEMORY[0x1E0C99E60];
    v99 = objc_opt_class();
    v96 = objc_opt_class();
    v59 = objc_opt_class();
    v60 = objc_opt_class();
    v61 = objc_opt_class();
    v62 = objc_opt_class();
    v63 = objc_opt_class();
    v64 = objc_opt_class();
    v65 = objc_opt_class();
    v66 = objc_opt_class();
    objc_msgSend(v102, "setWithObjects:", v99, v96, v59, v60, v61, v62, v63, v64, v65, v66, objc_opt_class(), 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v67, CFSTR("configuration"));
    v68 = objc_claimAutoreleasedReturnValue();
    configuration = v5->_configuration;
    v5->_configuration = (NSDictionary *)v68;

    v103 = (void *)MEMORY[0x1E0C99E60];
    v100 = objc_opt_class();
    v97 = objc_opt_class();
    v70 = objc_opt_class();
    v71 = objc_opt_class();
    v72 = objc_opt_class();
    v73 = objc_opt_class();
    v74 = objc_opt_class();
    v75 = objc_opt_class();
    v76 = objc_opt_class();
    v77 = objc_opt_class();
    objc_msgSend(v103, "setWithObjects:", v100, v97, v70, v71, v72, v73, v74, v75, v76, v77, objc_opt_class(), 0);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v78, CFSTR("feedback"));
    v79 = objc_claimAutoreleasedReturnValue();
    feedback = v5->_feedback;
    v5->_feedback = (NSDictionary *)v79;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_state = objc_msgSend(v81, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("managementFlags"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_managementFlags = objc_msgSend(v82, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isManaged"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isManaged = objc_msgSend(v83, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isValidated"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isValidated = objc_msgSend(v84, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isInstalled"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isInstalled = objc_msgSend(v85, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isPlaceholder"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isPlaceholder = objc_msgSend(v86, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isAppUpdate"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isAppUpdate = objc_msgSend(v87, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isBetaApp"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isBetaApp = objc_msgSend(v88, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isRemoveable"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isRemoveable = objc_msgSend(v89, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileSharingEnabled"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_fileSharingEnabled = objc_msgSend(v90, "BOOLValue");

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v91, CFSTR("progress"));
    v92 = objc_claimAutoreleasedReturnValue();
    progress = v5->_progress;
    v5->_progress = (DMFApplicationInstallProgress *)v92;

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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v4 = a3;
  -[DMFApplication applicationIdentifier](self, "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("applicationIdentifier"));

  -[DMFApplication bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bundleIdentifier"));

  -[DMFApplication name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("name"));

  -[DMFApplication iconData](self, "iconData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("iconData"));

  -[DMFApplication bundleVersion](self, "bundleVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("bundleVersion"));

  -[DMFApplication shortVersionString](self, "shortVersionString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("shortVersionString"));

  -[DMFApplication applicationType](self, "applicationType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("applicationType"));

  -[DMFApplication adamID](self, "adamID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("adamID"));

  -[DMFApplication externalVersionIdentifier](self, "externalVersionIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("externalVersionIdentifier"));

  -[DMFApplication betaExternalVersionIdentifier](self, "betaExternalVersionIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("betaExternalVersionIdentifier"));

  -[DMFApplication staticUsage](self, "staticUsage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("staticUsage"));

  -[DMFApplication dynamicUsage](self, "dynamicUsage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("dynamicUsage"));

  -[DMFApplication onDemandResourcesUsage](self, "onDemandResourcesUsage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("onDemandResourcesUsage"));

  -[DMFApplication unusedRedemptionCode](self, "unusedRedemptionCode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("unusedRedemptionCode"));

  -[DMFApplication attributes](self, "attributes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("attributes"));

  -[DMFApplication configuration](self, "configuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("configuration"));

  -[DMFApplication feedback](self, "feedback");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("feedback"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DMFApplication state](self, "state"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("state"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DMFApplication managementFlags](self, "managementFlags"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("managementFlags"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFApplication isManaged](self, "isManaged"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("isManaged"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFApplication isValidated](self, "isValidated"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, CFSTR("isValidated"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFApplication isInstalled](self, "isInstalled"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v26, CFSTR("isInstalled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFApplication isPlaceholder](self, "isPlaceholder"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, CFSTR("isPlaceholder"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFApplication isAppUpdate](self, "isAppUpdate"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v28, CFSTR("isAppUpdate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFApplication isBetaApp](self, "isBetaApp"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v29, CFSTR("isBetaApp"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFApplication isRemoveable](self, "isRemoveable"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v30, CFSTR("isRemoveable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFApplication fileSharingEnabled](self, "fileSharingEnabled"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v31, CFSTR("fileSharingEnabled"));

  -[DMFApplication progress](self, "progress");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v32, CFSTR("progress"));

}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  unint64_t v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;

  -[DMFApplication applicationIdentifier](self, "applicationIdentifier");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v49, "hash");
  -[DMFApplication bundleIdentifier](self, "bundleIdentifier");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v48, "hash") ^ v3;
  -[DMFApplication name](self, "name");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v47, "hash");
  -[DMFApplication iconData](self, "iconData");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ v5 ^ objc_msgSend(v46, "hash");
  -[DMFApplication bundleVersion](self, "bundleVersion");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v45, "hash");
  -[DMFApplication shortVersionString](self, "shortVersionString");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 ^ objc_msgSend(v44, "hash");
  -[DMFApplication applicationType](self, "applicationType");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ v8 ^ objc_msgSend(v43, "hash");
  -[DMFApplication adamID](self, "adamID");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v42, "hash");
  -[DMFApplication externalVersionIdentifier](self, "externalVersionIdentifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 ^ objc_msgSend(v41, "hash");
  -[DMFApplication betaExternalVersionIdentifier](self, "betaExternalVersionIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 ^ objc_msgSend(v40, "hash");
  -[DMFApplication staticUsage](self, "staticUsage");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9 ^ v12 ^ objc_msgSend(v39, "hash");
  -[DMFApplication dynamicUsage](self, "dynamicUsage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  -[DMFApplication onDemandResourcesUsage](self, "onDemandResourcesUsage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");
  -[DMFApplication unusedRedemptionCode](self, "unusedRedemptionCode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17 ^ objc_msgSend(v18, "hash");
  -[DMFApplication attributes](self, "attributes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19 ^ objc_msgSend(v20, "hash");
  -[DMFApplication configuration](self, "configuration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v13 ^ v21 ^ objc_msgSend(v22, "hash");
  -[DMFApplication feedback](self, "feedback");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "hash");
  v26 = v25 ^ -[DMFApplication state](self, "state");
  v27 = v26 ^ -[DMFApplication managementFlags](self, "managementFlags");
  v28 = v27 ^ -[DMFApplication isManaged](self, "isManaged");
  v29 = v28 ^ -[DMFApplication isValidated](self, "isValidated");
  v30 = v23 ^ v29 ^ -[DMFApplication isInstalled](self, "isInstalled");
  v31 = -[DMFApplication isPlaceholder](self, "isPlaceholder");
  v32 = v31 ^ -[DMFApplication isAppUpdate](self, "isAppUpdate");
  v33 = v32 ^ -[DMFApplication isBetaApp](self, "isBetaApp");
  v34 = v33 ^ -[DMFApplication isRemoveable](self, "isRemoveable");
  v35 = v34 ^ -[DMFApplication fileSharingEnabled](self, "fileSharingEnabled");
  -[DMFApplication progress](self, "progress");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v30 ^ v35 ^ objc_msgSend(v36, "hash");

  return v37;
}

- (BOOL)isEqual:(id)a3
{
  DMFApplication *v4;
  DMFApplication *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  void *v16;
  void *v17;
  unint64_t v18;
  int v19;
  void *v20;
  void *v21;
  unint64_t v22;
  int v23;
  void *v24;
  void *v25;
  unint64_t v26;
  int v27;
  void *v28;
  void *v29;
  unint64_t v30;
  int v31;
  void *v32;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  int v36;
  void *v37;
  void *v38;
  unint64_t v39;
  int v40;
  void *v41;
  void *v42;
  unint64_t v43;
  unint64_t v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  unint64_t v49;
  int v50;
  void *v51;
  void *v52;
  unint64_t v53;
  int v54;
  void *v55;
  void *v56;
  unint64_t v57;
  unint64_t v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  unint64_t v63;
  int v64;
  void *v65;
  void *v66;
  unint64_t v67;
  unint64_t v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  unint64_t v73;
  void *v74;
  void *v75;
  unint64_t v76;
  void *v77;
  void *v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  _BOOL4 v82;
  _BOOL4 v83;
  _BOOL4 v84;
  char v85;
  _BOOL4 v86;
  _BOOL4 v88;
  _BOOL4 v89;
  _BOOL4 v90;
  _BOOL4 v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  void *v95;
  unint64_t v96;
  void *v97;
  unint64_t v98;
  void *v99;
  void *v100;
  unint64_t v101;
  void *v102;
  void *v103;
  unint64_t v104;
  void *v105;
  unint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  unint64_t v110;
  int v111;
  int v112;
  int v113;
  DMFApplication *v114;
  unint64_t v115;
  void *v116;
  void *v117;
  unint64_t v118;
  void *v119;
  unint64_t v120;
  unint64_t v121;
  void *v122;
  unint64_t v123;
  unint64_t v124;
  unint64_t v125;
  void *v126;

  v4 = (DMFApplication *)a3;
  if (self == v4)
  {
    v85 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DMFApplication applicationIdentifier](self, "applicationIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMFApplication applicationIdentifier](v5, "applicationIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      if (v8 | v9)
      {
        v10 = objc_msgSend((id)v8, "isEqual:", v9);

        if (!v10)
        {
          v85 = 0;
LABEL_80:

          goto LABEL_81;
        }
      }
      -[DMFApplication bundleIdentifier](self, "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMFApplication bundleIdentifier](v5, "bundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v11;
      v14 = v12;
      v126 = (void *)v13;
      if (v13 | v14)
      {
        v15 = objc_msgSend((id)v13, "isEqual:", v14);

        if (!v15)
        {
          v85 = 0;
LABEL_79:

          goto LABEL_80;
        }
      }
      -[DMFApplication name](self, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMFApplication name](v5, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v16;
      v125 = v17;
      if (v18 | v125)
      {
        v19 = objc_msgSend((id)v18, "isEqual:", v125);

        if (!v19)
        {
          v85 = 0;
LABEL_78:

          goto LABEL_79;
        }
      }
      v123 = v18;
      -[DMFApplication iconData](self, "iconData");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMFApplication iconData](v5, "iconData");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v20;
      v124 = v21;
      if (v22 | v124)
      {
        v23 = objc_msgSend((id)v22, "isEqual:", v124);

        if (!v23)
        {
          v85 = 0;
          v18 = v123;
LABEL_77:

          goto LABEL_78;
        }
      }
      v120 = v22;
      -[DMFApplication bundleVersion](self, "bundleVersion");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMFApplication bundleVersion](v5, "bundleVersion");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v24;
      v121 = v25;
      v122 = (void *)v26;
      if (v26 | v121)
      {
        v27 = objc_msgSend((id)v26, "isEqual:", v121);

        if (!v27)
        {
          v85 = 0;
          v18 = v123;
LABEL_76:

          goto LABEL_77;
        }
      }
      -[DMFApplication shortVersionString](self, "shortVersionString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMFApplication shortVersionString](v5, "shortVersionString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v28;
      v118 = v29;
      v119 = (void *)v30;
      if (v30 | v118)
      {
        v31 = objc_msgSend((id)v30, "isEqual:", v118);

        if (!v31)
        {
          v85 = 0;
          v18 = v123;
LABEL_75:

          goto LABEL_76;
        }
      }
      -[DMFApplication applicationType](self, "applicationType");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMFApplication applicationType](v5, "applicationType");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v32;
      v35 = v33;
      v117 = (void *)v34;
      if (v34 | v35)
      {
        v36 = objc_msgSend((id)v34, "isEqual:", v35);

        if (!v36)
        {
          v85 = 0;
          v18 = v123;
          v22 = v120;
LABEL_74:

          goto LABEL_75;
        }
      }
      v110 = v35;
      -[DMFApplication adamID](self, "adamID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMFApplication adamID](v5, "adamID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v37;
      v115 = v38;
      v116 = (void *)v39;
      if (v39 | v115)
      {
        v40 = objc_msgSend((id)v39, "isEqual:", v115);

        if (!v40)
        {
          v85 = 0;
          v18 = v123;
          v22 = v120;
          v35 = v110;
LABEL_73:

          goto LABEL_74;
        }
      }
      -[DMFApplication externalVersionIdentifier](self, "externalVersionIdentifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMFApplication externalVersionIdentifier](v5, "externalVersionIdentifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v41;
      v44 = v42;
      v108 = (void *)v44;
      v109 = (void *)v43;
      if (v43 | v44)
      {
        v45 = (void *)v44;
        v46 = objc_msgSend((id)v43, "isEqual:", v44);

        if (!v46)
        {
          v85 = 0;
          v18 = v123;
          v22 = v120;
          v35 = v110;
LABEL_72:

          goto LABEL_73;
        }
      }
      -[DMFApplication betaExternalVersionIdentifier](self, "betaExternalVersionIdentifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMFApplication betaExternalVersionIdentifier](v5, "betaExternalVersionIdentifier");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v47;
      v106 = v48;
      v107 = (void *)v49;
      if (v49 | v106)
      {
        v50 = objc_msgSend((id)v49, "isEqual:", v106);

        if (!v50)
        {
          v85 = 0;
          v18 = v123;
          v22 = v120;
          v35 = v110;
LABEL_71:

          goto LABEL_72;
        }
      }
      -[DMFApplication staticUsage](self, "staticUsage");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMFApplication staticUsage](v5, "staticUsage");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v51;
      v104 = v52;
      v105 = (void *)v53;
      if (v53 | v104)
      {
        v54 = objc_msgSend((id)v53, "isEqual:", v104);

        if (!v54)
        {
          v85 = 0;
          v18 = v123;
          v22 = v120;
          v35 = v110;
LABEL_70:

          goto LABEL_71;
        }
      }
      -[DMFApplication dynamicUsage](self, "dynamicUsage");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMFApplication dynamicUsage](v5, "dynamicUsage");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v55;
      v58 = v56;
      v103 = (void *)v58;
      if (v57 | v58)
      {
        v59 = (void *)v58;
        v60 = objc_msgSend((id)v57, "isEqual:", v58);

        if (!v60)
        {
          v85 = 0;
          v18 = v123;
          v22 = v120;
          v35 = v110;
LABEL_69:

          goto LABEL_70;
        }
      }
      -[DMFApplication onDemandResourcesUsage](self, "onDemandResourcesUsage");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMFApplication onDemandResourcesUsage](v5, "onDemandResourcesUsage");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v61;
      v101 = v62;
      v102 = (void *)v63;
      if (v63 | v101)
      {
        v64 = objc_msgSend((id)v63, "isEqual:", v101);

        if (!v64)
        {
          v85 = 0;
          v18 = v123;
          v22 = v120;
          v35 = v110;
LABEL_68:

          goto LABEL_69;
        }
      }
      -[DMFApplication unusedRedemptionCode](self, "unusedRedemptionCode");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMFApplication unusedRedemptionCode](v5, "unusedRedemptionCode");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v65;
      v68 = v66;
      v100 = (void *)v68;
      if (v67 | v68)
      {
        v69 = (void *)v68;
        v70 = objc_msgSend((id)v67, "isEqual:", v68);

        if (!v70)
        {
          v85 = 0;
          v18 = v123;
          v35 = v110;
LABEL_67:

          v22 = v120;
          goto LABEL_68;
        }
      }
      -[DMFApplication attributes](self, "attributes");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMFApplication attributes](v5, "attributes");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v71;
      v98 = v72;
      v99 = (void *)v73;
      if (v73 | v98)
      {
        v111 = objc_msgSend((id)v73, "isEqual:", v98);

        if (!v111)
        {
          v85 = 0;
          v18 = v123;
          v35 = v110;
LABEL_66:

          goto LABEL_67;
        }
      }
      -[DMFApplication configuration](self, "configuration");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMFApplication configuration](v5, "configuration");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = v74;
      v96 = v75;
      v97 = (void *)v76;
      if (v76 | v96)
      {
        v112 = objc_msgSend((id)v76, "isEqual:", v96);

        if (!v112)
        {
          v85 = 0;
          v18 = v123;
          v35 = v110;
LABEL_65:

          goto LABEL_66;
        }
      }
      -[DMFApplication feedback](self, "feedback");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMFApplication feedback](v5, "feedback");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v77;
      v94 = v78;
      v95 = (void *)v79;
      if (v79 | v94)
      {
        v113 = objc_msgSend((id)v79, "isEqual:", v94);

        if (!v113)
          goto LABEL_62;
      }
      v80 = -[DMFApplication state](self, "state");
      v35 = v110;
      if (v80 != -[DMFApplication state](v5, "state")
        || (v81 = -[DMFApplication managementFlags](self, "managementFlags"),
            v81 != -[DMFApplication managementFlags](v5, "managementFlags"))
        || (v82 = -[DMFApplication isManaged](self, "isManaged"), v82 != -[DMFApplication isManaged](v5, "isManaged"))
        || (v83 = -[DMFApplication isValidated](self, "isValidated"),
            v83 != -[DMFApplication isValidated](v5, "isValidated"))
        || (v84 = -[DMFApplication isInstalled](self, "isInstalled"),
            v84 != -[DMFApplication isInstalled](v5, "isInstalled")))
      {
        v85 = 0;
        v18 = v123;
LABEL_64:

        goto LABEL_65;
      }
      v86 = -[DMFApplication isPlaceholder](self, "isPlaceholder");
      if (v86 == -[DMFApplication isPlaceholder](v5, "isPlaceholder"))
      {
        v88 = -[DMFApplication isAppUpdate](self, "isAppUpdate");
        v114 = v5;
        if (v88 == -[DMFApplication isAppUpdate](v5, "isAppUpdate")
          && (v89 = -[DMFApplication isBetaApp](self, "isBetaApp"), v89 == -[DMFApplication isBetaApp](v5, "isBetaApp"))
          && (v90 = -[DMFApplication isRemoveable](self, "isRemoveable"),
              v90 == -[DMFApplication isRemoveable](v5, "isRemoveable"))
          && (v91 = -[DMFApplication fileSharingEnabled](self, "fileSharingEnabled"),
              v91 == -[DMFApplication fileSharingEnabled](v5, "fileSharingEnabled")))
        {
          -[DMFApplication progress](self, "progress");
          v92 = objc_claimAutoreleasedReturnValue();
          -[DMFApplication progress](v114, "progress");
          v93 = objc_claimAutoreleasedReturnValue();
          if (v92 | v93)
            v85 = objc_msgSend((id)v92, "isEqual:", v93);
          else
            v85 = 1;

        }
        else
        {
          v85 = 0;
        }
        v18 = v123;
        v5 = v114;
      }
      else
      {
LABEL_62:
        v85 = 0;
        v18 = v123;
      }
      v35 = v110;
      goto LABEL_64;
    }
    v85 = 0;
  }
LABEL_81:

  return v85;
}

- (id)description
{
  void *v3;
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
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  void *v25;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@:%p {\n"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFApplication applicationIdentifier](self, "applicationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tApplication Identifier           : %@\n"), v4);

  -[DMFApplication bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tBundle Identifier                : %@\n"), v5);

  -[DMFApplication name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tName                             : %@\n"), v6);

  -[DMFApplication adamID](self, "adamID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tAdam ID                          : %@\n"), v7);

  -[DMFApplication externalVersionIdentifier](self, "externalVersionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tExternal Version Identifier      : %@\n"), v8);

  -[DMFApplication betaExternalVersionIdentifier](self, "betaExternalVersionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tBeta External Version Identifier : %@\n"), v9);

  -[DMFApplication bundleVersion](self, "bundleVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tBundle Version                   : %@\n"), v10);

  -[DMFApplication shortVersionString](self, "shortVersionString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tShort Version String             : %@\n"), v11);

  -[DMFApplication unusedRedemptionCode](self, "unusedRedemptionCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tUnused Redemption Code           : %@\n"), v12);

  -[DMFApplication attributes](self, "attributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tAttributes                       : %@\n"), v13);

  -[DMFApplication configuration](self, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tConfiguration                    : %@\n"), v14);

  -[DMFApplication feedback](self, "feedback");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tFeedback                         : %@\n"), v15);

  -[DMFApplication progress](self, "progress");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tProgress                         : %@\n"), v16);

  if (-[DMFApplication isManaged](self, "isManaged"))
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("\tIs Managed                       : %@\n"), v17);
  if (-[DMFApplication isValidated](self, "isValidated"))
    v18 = CFSTR("YES");
  else
    v18 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("\tIs Validated                     : %@\n"), v18);
  if (-[DMFApplication isInstalled](self, "isInstalled"))
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("\tIs Installed                     : %@\n"), v19);
  if (-[DMFApplication isPlaceholder](self, "isPlaceholder"))
    v20 = CFSTR("YES");
  else
    v20 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("\tIs Placeholder                   : %@\n"), v20);
  if (-[DMFApplication isAppUpdate](self, "isAppUpdate"))
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("\tIs App Update                    : %@\n"), v21);
  if (-[DMFApplication isBetaApp](self, "isBetaApp"))
    v22 = CFSTR("YES");
  else
    v22 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("\tIs Beta App                      : %@\n"), v22);
  if (-[DMFApplication isRemoveable](self, "isRemoveable"))
    v23 = CFSTR("YES");
  else
    v23 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("\tIs Removable                     : %@\n"), v23);
  if (-[DMFApplication fileSharingEnabled](self, "fileSharingEnabled"))
    v24 = CFSTR("YES");
  else
    v24 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("\tFile Sharing Enabled             : %@\n"), v24);
  objc_msgSend(v3, "appendString:", CFSTR("}>"));
  v25 = (void *)objc_msgSend(v3, "copy");

  return v25;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSData)iconData
{
  return self->_iconData;
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (NSString)shortVersionString
{
  return self->_shortVersionString;
}

- (NSString)applicationType
{
  return self->_applicationType;
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (NSNumber)externalVersionIdentifier
{
  return self->_externalVersionIdentifier;
}

- (NSNumber)betaExternalVersionIdentifier
{
  return self->_betaExternalVersionIdentifier;
}

- (NSNumber)staticUsage
{
  return self->_staticUsage;
}

- (NSNumber)dynamicUsage
{
  return self->_dynamicUsage;
}

- (NSNumber)onDemandResourcesUsage
{
  return self->_onDemandResourcesUsage;
}

- (NSString)unusedRedemptionCode
{
  return self->_unusedRedemptionCode;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (NSDictionary)feedback
{
  return self->_feedback;
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)managementFlags
{
  return self->_managementFlags;
}

- (BOOL)isManaged
{
  return self->_isManaged;
}

- (BOOL)isValidated
{
  return self->_isValidated;
}

- (BOOL)isInstalled
{
  return self->_isInstalled;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (BOOL)isAppUpdate
{
  return self->_isAppUpdate;
}

- (BOOL)isBetaApp
{
  return self->_isBetaApp;
}

- (BOOL)isRemoveable
{
  return self->_isRemoveable;
}

- (BOOL)isTapToPayScreenLock
{
  return self->_isTapToPayScreenLock;
}

- (BOOL)fileSharingEnabled
{
  return self->_fileSharingEnabled;
}

- (DMFApplicationInstallProgress)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_unusedRedemptionCode, 0);
  objc_storeStrong((id *)&self->_onDemandResourcesUsage, 0);
  objc_storeStrong((id *)&self->_dynamicUsage, 0);
  objc_storeStrong((id *)&self->_staticUsage, 0);
  objc_storeStrong((id *)&self->_betaExternalVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_externalVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_applicationType, 0);
  objc_storeStrong((id *)&self->_shortVersionString, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end
