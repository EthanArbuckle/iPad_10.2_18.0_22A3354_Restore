@implementation DMFApp

+ (id)stringForInstallationState:(unint64_t)a3
{
  if (a3 > 8)
    return CFSTR("Unknown");
  else
    return off_1E6ED7AD8[a3];
}

- (BOOL)isEqual:(id)a3
{
  DMFApp *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (DMFApp *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[DMFApp bundleIdentifier](self, "bundleIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMFApp bundleIdentifier](v4, "bundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
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

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setType:", -[DMFApp type](self, "type"));
  -[DMFApp displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayName:", v5);

  -[DMFApp bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBundleIdentifier:", v6);

  -[DMFApp storeItemIdentifier](self, "storeItemIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStoreItemIdentifier:", v7);

  -[DMFApp externalVersionIdentifier](self, "externalVersionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExternalVersionIdentifier:", v8);

  -[DMFApp distributorIdentifier](self, "distributorIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDistributorIdentifier:", v9);

  -[DMFApp version](self, "version");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVersion:", v10);

  -[DMFApp shortVersion](self, "shortVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShortVersion:", v11);

  -[DMFApp staticUsage](self, "staticUsage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStaticUsage:", v12);

  -[DMFApp dynamicUsage](self, "dynamicUsage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDynamicUsage:", v13);

  -[DMFApp onDemandResourcesUsage](self, "onDemandResourcesUsage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOnDemandResourcesUsage:", v14);

  -[DMFApp sharedUsage](self, "sharedUsage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSharedUsage:", v15);

  objc_msgSend(v4, "setInstallationState:", -[DMFApp installationState](self, "installationState"));
  objc_msgSend(v4, "setIsPlaceholder:", -[DMFApp isPlaceholder](self, "isPlaceholder"));
  objc_msgSend(v4, "setIsRestricted:", -[DMFApp isRestricted](self, "isRestricted"));
  objc_msgSend(v4, "setIsBlocked:", -[DMFApp isBlocked](self, "isBlocked"));
  objc_msgSend(v4, "setIsUserBasedVPP:", -[DMFApp isUserBasedVPP](self, "isUserBasedVPP"));
  objc_msgSend(v4, "setIsDeviceBasedVPP:", -[DMFApp isDeviceBasedVPP](self, "isDeviceBasedVPP"));
  objc_msgSend(v4, "setIsLicenseExpired:", -[DMFApp isLicenseExpired](self, "isLicenseExpired"));
  objc_msgSend(v4, "setIsLicenseRevoked:", -[DMFApp isLicenseRevoked](self, "isLicenseRevoked"));
  objc_msgSend(v4, "setIsUPP:", -[DMFApp isUPP](self, "isUPP"));
  objc_msgSend(v4, "setIsValidated:", -[DMFApp isValidated](self, "isValidated"));
  objc_msgSend(v4, "setIsAppClip:", -[DMFApp isAppClip](self, "isAppClip"));
  objc_msgSend(v4, "setIsAppStoreVendable:", -[DMFApp isAppStoreVendable](self, "isAppStoreVendable"));
  objc_msgSend(v4, "setIsBetaApp:", -[DMFApp isBetaApp](self, "isBetaApp"));
  objc_msgSend(v4, "setIsAdHocCodeSigned:", -[DMFApp isAdHocCodeSigned](self, "isAdHocCodeSigned"));
  objc_msgSend(v4, "setHasUpdateAvailable:", -[DMFApp hasUpdateAvailable](self, "hasUpdateAvailable"));
  -[DMFApp VPNUUIDString](self, "VPNUUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVPNUUIDString:", v16);

  -[DMFApp cellularSliceUUIDString](self, "cellularSliceUUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCellularSliceUUIDString:", v17);

  -[DMFApp contentFilterUUIDString](self, "contentFilterUUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentFilterUUIDString:", v18);

  -[DMFApp DNSProxyUUIDString](self, "DNSProxyUUIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDNSProxyUUIDString:", v19);

  -[DMFApp relayUUIDString](self, "relayUUIDString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRelayUUIDString:", v20);

  -[DMFApp associatedDomains](self, "associatedDomains");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAssociatedDomains:", v21);

  -[DMFApp associatedDomainsEnableDirectDownloads](self, "associatedDomainsEnableDirectDownloads");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAssociatedDomainsEnableDirectDownloads:", v22);

  -[DMFApp removable](self, "removable");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemovable:", v23);

  -[DMFApp tapToPayScreenLock](self, "tapToPayScreenLock");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTapToPayScreenLock:", v24);

  -[DMFApp allowUserToHide](self, "allowUserToHide");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowUserToHide:", v25);

  -[DMFApp allowUserToLock](self, "allowUserToLock");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowUserToLock:", v26);

  -[DMFApp configuration](self, "configuration");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConfiguration:", v27);

  -[DMFApp feedback](self, "feedback");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFeedback:", v28);

  -[DMFApp sourceIdentifier](self, "sourceIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSourceIdentifier:", v29);

  -[DMFApp managementInformation](self, "managementInformation");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setManagementInformation:", v30);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFApp)initWithCoder:(id)a3
{
  id v4;
  DMFApp *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *displayName;
  void *v10;
  uint64_t v11;
  NSString *bundleIdentifier;
  void *v13;
  uint64_t v14;
  NSNumber *storeItemIdentifier;
  void *v16;
  uint64_t v17;
  NSNumber *externalVersionIdentifier;
  void *v19;
  uint64_t v20;
  NSString *distributorIdentifier;
  void *v22;
  uint64_t v23;
  NSString *version;
  void *v25;
  uint64_t v26;
  NSString *shortVersion;
  void *v28;
  uint64_t v29;
  NSNumber *staticUsage;
  void *v31;
  uint64_t v32;
  NSNumber *dynamicUsage;
  void *v34;
  uint64_t v35;
  NSNumber *onDemandResourcesUsage;
  void *v37;
  uint64_t v38;
  NSNumber *sharedUsage;
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
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  NSString *VPNUUIDString;
  void *v58;
  uint64_t v59;
  NSString *cellularSliceUUIDString;
  void *v61;
  uint64_t v62;
  NSString *contentFilterUUIDString;
  void *v64;
  uint64_t v65;
  NSString *DNSProxyUUIDString;
  void *v67;
  uint64_t v68;
  NSString *relayUUIDString;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  NSArray *associatedDomains;
  void *v75;
  uint64_t v76;
  NSNumber *associatedDomainsEnableDirectDownloads;
  void *v78;
  uint64_t v79;
  NSNumber *removable;
  void *v81;
  uint64_t v82;
  NSNumber *tapToPayScreenLock;
  void *v84;
  uint64_t v85;
  NSNumber *allowUserToHide;
  void *v87;
  uint64_t v88;
  NSNumber *allowUserToLock;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  NSDictionary *configuration;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  NSDictionary *feedback;
  void *v112;
  uint64_t v113;
  NSString *sourceIdentifier;
  void *v115;
  uint64_t v116;
  DMFAppManagementInformation *managementInformation;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  void *v124;
  objc_super v125;

  v4 = a3;
  v125.receiver = self;
  v125.super_class = (Class)DMFApp;
  v5 = -[DMFApp init](&v125, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v6, "integerValue");

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("displayName"));
    v8 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v8;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("bundleIdentifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v11;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("storeItemIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    storeItemIdentifier = v5->_storeItemIdentifier;
    v5->_storeItemIdentifier = (NSNumber *)v14;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("externalVersionIdentifier"));
    v17 = objc_claimAutoreleasedReturnValue();
    externalVersionIdentifier = v5->_externalVersionIdentifier;
    v5->_externalVersionIdentifier = (NSNumber *)v17;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("distributorIdentifier"));
    v20 = objc_claimAutoreleasedReturnValue();
    distributorIdentifier = v5->_distributorIdentifier;
    v5->_distributorIdentifier = (NSString *)v20;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("version"));
    v23 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (NSString *)v23;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("shortVersion"));
    v26 = objc_claimAutoreleasedReturnValue();
    shortVersion = v5->_shortVersion;
    v5->_shortVersion = (NSString *)v26;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("staticUsage"));
    v29 = objc_claimAutoreleasedReturnValue();
    staticUsage = v5->_staticUsage;
    v5->_staticUsage = (NSNumber *)v29;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("dynamicUsage"));
    v32 = objc_claimAutoreleasedReturnValue();
    dynamicUsage = v5->_dynamicUsage;
    v5->_dynamicUsage = (NSNumber *)v32;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("onDemandResourcesUsage"));
    v35 = objc_claimAutoreleasedReturnValue();
    onDemandResourcesUsage = v5->_onDemandResourcesUsage;
    v5->_onDemandResourcesUsage = (NSNumber *)v35;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("sharedUsage"));
    v38 = objc_claimAutoreleasedReturnValue();
    sharedUsage = v5->_sharedUsage;
    v5->_sharedUsage = (NSNumber *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installationState"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_installationState = objc_msgSend(v40, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isPlaceholder"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isPlaceholder = objc_msgSend(v41, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isRestricted"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isRestricted = objc_msgSend(v42, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isBlocked"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isBlocked = objc_msgSend(v43, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isUserBasedVPP"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isUserBasedVPP = objc_msgSend(v44, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isDeviceBasedVPP"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isDeviceBasedVPP = objc_msgSend(v45, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isLicenseExpired"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isLicenseExpired = objc_msgSend(v46, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isLicenseRevoked"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isLicenseRevoked = objc_msgSend(v47, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isUPP"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isUPP = objc_msgSend(v48, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isValidated"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isValidated = objc_msgSend(v49, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isAppClip"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isAppClip = objc_msgSend(v50, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isAppStoreVendable"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isAppStoreVendable = objc_msgSend(v51, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isBetaApp"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isBetaApp = objc_msgSend(v52, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isAdHocCodeSigned"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isAdHocCodeSigned = objc_msgSend(v53, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hasUpdateAvailable"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hasUpdateAvailable = objc_msgSend(v54, "BOOLValue");

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v55, CFSTR("VPNUUIDString"));
    v56 = objc_claimAutoreleasedReturnValue();
    VPNUUIDString = v5->_VPNUUIDString;
    v5->_VPNUUIDString = (NSString *)v56;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v58, CFSTR("cellularSliceUUIDString"));
    v59 = objc_claimAutoreleasedReturnValue();
    cellularSliceUUIDString = v5->_cellularSliceUUIDString;
    v5->_cellularSliceUUIDString = (NSString *)v59;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v61, CFSTR("contentFilterUUIDString"));
    v62 = objc_claimAutoreleasedReturnValue();
    contentFilterUUIDString = v5->_contentFilterUUIDString;
    v5->_contentFilterUUIDString = (NSString *)v62;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v64, CFSTR("DNSProxyUUIDString"));
    v65 = objc_claimAutoreleasedReturnValue();
    DNSProxyUUIDString = v5->_DNSProxyUUIDString;
    v5->_DNSProxyUUIDString = (NSString *)v65;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v67, CFSTR("relayUUIDString"));
    v68 = objc_claimAutoreleasedReturnValue();
    relayUUIDString = v5->_relayUUIDString;
    v5->_relayUUIDString = (NSString *)v68;

    v70 = (void *)MEMORY[0x1E0C99E60];
    v71 = objc_opt_class();
    objc_msgSend(v70, "setWithObjects:", v71, objc_opt_class(), 0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v72, CFSTR("associatedDomains"));
    v73 = objc_claimAutoreleasedReturnValue();
    associatedDomains = v5->_associatedDomains;
    v5->_associatedDomains = (NSArray *)v73;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v75, CFSTR("associatedDomainsEnableDirectDownloads"));
    v76 = objc_claimAutoreleasedReturnValue();
    associatedDomainsEnableDirectDownloads = v5->_associatedDomainsEnableDirectDownloads;
    v5->_associatedDomainsEnableDirectDownloads = (NSNumber *)v76;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v78, CFSTR("removable"));
    v79 = objc_claimAutoreleasedReturnValue();
    removable = v5->_removable;
    v5->_removable = (NSNumber *)v79;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v81, CFSTR("tapToPayScreenLock"));
    v82 = objc_claimAutoreleasedReturnValue();
    tapToPayScreenLock = v5->_tapToPayScreenLock;
    v5->_tapToPayScreenLock = (NSNumber *)v82;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v84, CFSTR("allowUserToHide"));
    v85 = objc_claimAutoreleasedReturnValue();
    allowUserToHide = v5->_allowUserToHide;
    v5->_allowUserToHide = (NSNumber *)v85;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v87, CFSTR("allowUserToLock"));
    v88 = objc_claimAutoreleasedReturnValue();
    allowUserToLock = v5->_allowUserToLock;
    v5->_allowUserToLock = (NSNumber *)v88;

    v123 = (void *)MEMORY[0x1E0C99E60];
    v121 = objc_opt_class();
    v119 = objc_opt_class();
    v90 = objc_opt_class();
    v91 = objc_opt_class();
    v92 = objc_opt_class();
    v93 = objc_opt_class();
    v94 = objc_opt_class();
    v95 = objc_opt_class();
    v96 = objc_opt_class();
    v97 = objc_opt_class();
    objc_msgSend(v123, "setWithObjects:", v121, v119, v90, v91, v92, v93, v94, v95, v96, v97, objc_opt_class(), 0);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v98, CFSTR("configuration"));
    v99 = objc_claimAutoreleasedReturnValue();
    configuration = v5->_configuration;
    v5->_configuration = (NSDictionary *)v99;

    v124 = (void *)MEMORY[0x1E0C99E60];
    v122 = objc_opt_class();
    v120 = objc_opt_class();
    v101 = objc_opt_class();
    v102 = objc_opt_class();
    v103 = objc_opt_class();
    v104 = objc_opt_class();
    v105 = objc_opt_class();
    v106 = objc_opt_class();
    v107 = objc_opt_class();
    v108 = objc_opt_class();
    objc_msgSend(v124, "setWithObjects:", v122, v120, v101, v102, v103, v104, v105, v106, v107, v108, objc_opt_class(), 0);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v109, CFSTR("feedback"));
    v110 = objc_claimAutoreleasedReturnValue();
    feedback = v5->_feedback;
    v5->_feedback = (NSDictionary *)v110;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v112, CFSTR("sourceIdentifier"));
    v113 = objc_claimAutoreleasedReturnValue();
    sourceIdentifier = v5->_sourceIdentifier;
    v5->_sourceIdentifier = (NSString *)v113;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v115, CFSTR("managementInformation"));
    v116 = objc_claimAutoreleasedReturnValue();
    managementInformation = v5->_managementInformation;
    v5->_managementInformation = (DMFAppManagementInformation *)v116;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
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
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[DMFApp type](self, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("type"));

  -[DMFApp displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("displayName"));

  -[DMFApp bundleIdentifier](self, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("bundleIdentifier"));

  -[DMFApp storeItemIdentifier](self, "storeItemIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("storeItemIdentifier"));

  -[DMFApp externalVersionIdentifier](self, "externalVersionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("externalVersionIdentifier"));

  -[DMFApp distributorIdentifier](self, "distributorIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("distributorIdentifier"));

  -[DMFApp version](self, "version");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("version"));

  -[DMFApp shortVersion](self, "shortVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v13, CFSTR("shortVersion"));

  -[DMFApp staticUsage](self, "staticUsage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v14, CFSTR("staticUsage"));

  -[DMFApp dynamicUsage](self, "dynamicUsage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v15, CFSTR("dynamicUsage"));

  -[DMFApp onDemandResourcesUsage](self, "onDemandResourcesUsage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v16, CFSTR("onDemandResourcesUsage"));

  -[DMFApp sharedUsage](self, "sharedUsage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v17, CFSTR("sharedUsage"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DMFApp installationState](self, "installationState"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v18, CFSTR("installationState"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFApp isPlaceholder](self, "isPlaceholder"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v19, CFSTR("isPlaceholder"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFApp isRestricted](self, "isRestricted"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v20, CFSTR("isRestricted"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFApp isBlocked](self, "isBlocked"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v21, CFSTR("isBlocked"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFApp isUserBasedVPP](self, "isUserBasedVPP"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v22, CFSTR("isUserBasedVPP"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFApp isDeviceBasedVPP](self, "isDeviceBasedVPP"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v23, CFSTR("isDeviceBasedVPP"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFApp isLicenseExpired](self, "isLicenseExpired"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v24, CFSTR("isLicenseExpired"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFApp isLicenseRevoked](self, "isLicenseRevoked"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v25, CFSTR("isLicenseRevoked"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFApp isUPP](self, "isUPP"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v26, CFSTR("isUPP"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFApp isValidated](self, "isValidated"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v27, CFSTR("isValidated"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFApp isAppClip](self, "isAppClip"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v28, CFSTR("isAppClip"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFApp isAppStoreVendable](self, "isAppStoreVendable"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v29, CFSTR("isAppStoreVendable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFApp isBetaApp](self, "isBetaApp"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v30, CFSTR("isBetaApp"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFApp isAdHocCodeSigned](self, "isAdHocCodeSigned"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v31, CFSTR("isAdHocCodeSigned"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFApp hasUpdateAvailable](self, "hasUpdateAvailable"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v32, CFSTR("hasUpdateAvailable"));

  -[DMFApp VPNUUIDString](self, "VPNUUIDString");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v33, CFSTR("VPNUUIDString"));

  -[DMFApp cellularSliceUUIDString](self, "cellularSliceUUIDString");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v34, CFSTR("cellularSliceUUIDString"));

  -[DMFApp contentFilterUUIDString](self, "contentFilterUUIDString");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v35, CFSTR("contentFilterUUIDString"));

  -[DMFApp DNSProxyUUIDString](self, "DNSProxyUUIDString");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v36, CFSTR("DNSProxyUUIDString"));

  -[DMFApp relayUUIDString](self, "relayUUIDString");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v37, CFSTR("relayUUIDString"));

  -[DMFApp associatedDomains](self, "associatedDomains");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v38, CFSTR("associatedDomains"));

  -[DMFApp associatedDomainsEnableDirectDownloads](self, "associatedDomainsEnableDirectDownloads");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v39, CFSTR("associatedDomainsEnableDirectDownloads"));

  -[DMFApp removable](self, "removable");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v40, CFSTR("removable"));

  -[DMFApp tapToPayScreenLock](self, "tapToPayScreenLock");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v41, CFSTR("tapToPayScreenLock"));

  -[DMFApp allowUserToHide](self, "allowUserToHide");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v42, CFSTR("allowUserToHide"));

  -[DMFApp allowUserToLock](self, "allowUserToLock");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v43, CFSTR("allowUserToLock"));

  -[DMFApp configuration](self, "configuration");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v44, CFSTR("configuration"));

  -[DMFApp feedback](self, "feedback");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v45, CFSTR("feedback"));

  -[DMFApp sourceIdentifier](self, "sourceIdentifier");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v46, CFSTR("sourceIdentifier"));

  -[DMFApp managementInformation](self, "managementInformation");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v47, CFSTR("managementInformation"));

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
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@:%p {\n"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFApp _stringForType:](self, "_stringForType:", -[DMFApp type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Type                           : %@\n"), v4);

  -[DMFApp displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Display Name                   : %@\n"), v5);

  -[DMFApp bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Bundle Identifier              : %@\n"), v6);

  -[DMFApp storeItemIdentifier](self, "storeItemIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Store Item Identifier          : %@\n"), v7);

  -[DMFApp externalVersionIdentifier](self, "externalVersionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("External Version Identifier    : %@\n"), v8);

  -[DMFApp distributorIdentifier](self, "distributorIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Distributor Identifier         : %@\n"), v9);

  -[DMFApp version](self, "version");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Version                        : %@\n"), v10);

  -[DMFApp shortVersion](self, "shortVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Short Version                  : %@\n"), v11);

  -[DMFApp staticUsage](self, "staticUsage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Static Usage                   : %@\n"), v12);

  -[DMFApp dynamicUsage](self, "dynamicUsage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Dynamic Usage                  : %@\n"), v13);

  -[DMFApp onDemandResourcesUsage](self, "onDemandResourcesUsage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("On Demand Resources Usage      : %@\n"), v14);

  -[DMFApp sharedUsage](self, "sharedUsage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Shared Usage                   : %@\n"), v15);

  +[DMFApp stringForInstallationState:](DMFApp, "stringForInstallationState:", -[DMFApp installationState](self, "installationState"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Installation State             : %@\n"), v16);

  if (-[DMFApp isPlaceholder](self, "isPlaceholder"))
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("Is Placeholder                 : %@\n"), v17);
  if (-[DMFApp isRestricted](self, "isRestricted"))
    v18 = CFSTR("YES");
  else
    v18 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("Is Restricted                  : %@\n"), v18);
  if (-[DMFApp isBlocked](self, "isBlocked"))
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("Is Blocked                     : %@\n"), v19);
  if (-[DMFApp isUserBasedVPP](self, "isUserBasedVPP"))
    v20 = CFSTR("YES");
  else
    v20 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("Is User Based VPP              : %@\n"), v20);
  if (-[DMFApp isDeviceBasedVPP](self, "isDeviceBasedVPP"))
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("Is Device Based VPP            : %@\n"), v21);
  if (-[DMFApp isLicenseExpired](self, "isLicenseExpired"))
    v22 = CFSTR("YES");
  else
    v22 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("Is License Expired             : %@\n"), v22);
  if (-[DMFApp isLicenseRevoked](self, "isLicenseRevoked"))
    v23 = CFSTR("YES");
  else
    v23 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("Is License Revoked             : %@\n"), v23);
  if (-[DMFApp isUPP](self, "isUPP"))
    v24 = CFSTR("YES");
  else
    v24 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("Is UPP                         : %@\n"), v24);
  if (-[DMFApp isValidated](self, "isValidated"))
    v25 = CFSTR("YES");
  else
    v25 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("Is Validated                   : %@\n"), v25);
  if (-[DMFApp isAppClip](self, "isAppClip"))
    v26 = CFSTR("YES");
  else
    v26 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("Is App Clip                    : %@\n"), v26);
  if (-[DMFApp isAppStoreVendable](self, "isAppStoreVendable"))
    v27 = CFSTR("YES");
  else
    v27 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("Is App Store Vendable          : %@\n"), v27);
  if (-[DMFApp isBetaApp](self, "isBetaApp"))
    v28 = CFSTR("YES");
  else
    v28 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("Is Beta App                    : %@\n"), v28);
  if (-[DMFApp isAdHocCodeSigned](self, "isAdHocCodeSigned"))
    v29 = CFSTR("YES");
  else
    v29 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("Is Ad Hoc Code Signed          : %@\n"), v29);
  if (-[DMFApp hasUpdateAvailable](self, "hasUpdateAvailable"))
    v30 = CFSTR("YES");
  else
    v30 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("Has Update Available           : %@\n"), v30);
  -[DMFApp VPNUUIDString](self, "VPNUUIDString");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("VPN UUID String                : %@\n"), v31);

  -[DMFApp cellularSliceUUIDString](self, "cellularSliceUUIDString");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("CellularSlice UUID String      : %@\n"), v32);

  -[DMFApp contentFilterUUIDString](self, "contentFilterUUIDString");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("ContentFilter UUID String      : %@\n"), v33);

  -[DMFApp DNSProxyUUIDString](self, "DNSProxyUUIDString");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("DNS Proxy UUID String          : %@\n"), v34);

  -[DMFApp relayUUIDString](self, "relayUUIDString");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Relay UUID String              : %@\n"), v35);

  -[DMFApp associatedDomains](self, "associatedDomains");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Associated Domains             : %@\n"), v36);

  -[DMFApp associatedDomainsEnableDirectDownloads](self, "associatedDomainsEnableDirectDownloads");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v37, "BOOLValue"))
    v38 = CFSTR("YES");
  else
    v38 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("AD Enabled Direct Downloads    : %@\n"), v38);

  -[DMFApp removable](self, "removable");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    -[DMFApp removable](self, "removable");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v40, "BOOLValue"))
      v41 = CFSTR("YES");
    else
      v41 = CFSTR("NO");
    objc_msgSend(v3, "appendFormat:", CFSTR("Is Removable                   : %@\n"), v41);

  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("Is Removable                   : %@\n"), CFSTR("YES"));
  }

  -[DMFApp tapToPayScreenLock](self, "tapToPayScreenLock");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    -[DMFApp tapToPayScreenLock](self, "tapToPayScreenLock");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v43, "BOOLValue"))
      v44 = CFSTR("YES");
    else
      v44 = CFSTR("NO");
    objc_msgSend(v3, "appendFormat:", CFSTR("Is Tap To Pay Screen Lock      : %@\n"), v44);

  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("Is Tap To Pay Screen Lock      : %@\n"), CFSTR("NO"));
  }

  v45 = (void *)objc_opt_class();
  -[DMFApp allowUserToHide](self, "allowUserToHide");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "descriptionForBool:showWhenUnassigned:valueWhenUnassigned:", v46, 1, 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Allow User To Hide             : %@\n"), v47);

  v48 = (void *)objc_opt_class();
  -[DMFApp allowUserToLock](self, "allowUserToLock");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "descriptionForBool:showWhenUnassigned:valueWhenUnassigned:", v49, 1, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Allow User To Lock             : %@\n"), v50);

  -[DMFApp configuration](self, "configuration");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Configuration                  : %@\n"), v51);

  -[DMFApp feedback](self, "feedback");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Feedback                       : %@\n"), v52);

  -[DMFApp sourceIdentifier](self, "sourceIdentifier");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("sourceIdentifier               : %@\n"), v53);

  -[DMFApp managementInformation](self, "managementInformation");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Management Information         : %@\n"), v54);

  objc_msgSend(v3, "appendString:", CFSTR("}>"));
  v55 = (void *)objc_msgSend(v3, "copy");

  return v55;
}

+ (id)descriptionForBool:(id)a3 showWhenUnassigned:(BOOL)a4 valueWhenUnassigned:(BOOL)a5
{
  int v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  __CFString *v11;
  __CFString *v12;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    v5 = objc_msgSend(v7, "BOOLValue");
  }
  else if (v6)
  {
    v9 = CFSTR("Unassigned (NO)");
    v10 = CFSTR("Unassigned (YES)");
    goto LABEL_6;
  }
  v9 = CFSTR("NO");
  v10 = CFSTR("YES");
LABEL_6:
  if (v5)
    v11 = (__CFString *)v10;
  else
    v11 = (__CFString *)v9;
  v12 = v11;

  return v12;
}

- (id)_stringForType:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 2)
    v3 = CFSTR("User");
  if (a3 == 1)
    return CFSTR("System");
  else
    return (id)v3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)storeItemIdentifier
{
  return self->_storeItemIdentifier;
}

- (void)setStoreItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)externalVersionIdentifier
{
  return self->_externalVersionIdentifier;
}

- (void)setExternalVersionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)distributorIdentifier
{
  return self->_distributorIdentifier;
}

- (void)setDistributorIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)shortVersion
{
  return self->_shortVersion;
}

- (void)setShortVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)staticUsage
{
  return self->_staticUsage;
}

- (void)setStaticUsage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)dynamicUsage
{
  return self->_dynamicUsage;
}

- (void)setDynamicUsage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)onDemandResourcesUsage
{
  return self->_onDemandResourcesUsage;
}

- (void)setOnDemandResourcesUsage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)sharedUsage
{
  return self->_sharedUsage;
}

- (void)setSharedUsage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (unint64_t)installationState
{
  return self->_installationState;
}

- (void)setInstallationState:(unint64_t)a3
{
  self->_installationState = a3;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

- (BOOL)isRestricted
{
  return self->_isRestricted;
}

- (void)setIsRestricted:(BOOL)a3
{
  self->_isRestricted = a3;
}

- (BOOL)isBlocked
{
  return self->_isBlocked;
}

- (void)setIsBlocked:(BOOL)a3
{
  self->_isBlocked = a3;
}

- (BOOL)isUserBasedVPP
{
  return self->_isUserBasedVPP;
}

- (void)setIsUserBasedVPP:(BOOL)a3
{
  self->_isUserBasedVPP = a3;
}

- (BOOL)isDeviceBasedVPP
{
  return self->_isDeviceBasedVPP;
}

- (void)setIsDeviceBasedVPP:(BOOL)a3
{
  self->_isDeviceBasedVPP = a3;
}

- (BOOL)isLicenseExpired
{
  return self->_isLicenseExpired;
}

- (void)setIsLicenseExpired:(BOOL)a3
{
  self->_isLicenseExpired = a3;
}

- (BOOL)isLicenseRevoked
{
  return self->_isLicenseRevoked;
}

- (void)setIsLicenseRevoked:(BOOL)a3
{
  self->_isLicenseRevoked = a3;
}

- (BOOL)isUPP
{
  return self->_isUPP;
}

- (void)setIsUPP:(BOOL)a3
{
  self->_isUPP = a3;
}

- (BOOL)isValidated
{
  return self->_isValidated;
}

- (void)setIsValidated:(BOOL)a3
{
  self->_isValidated = a3;
}

- (BOOL)isAppClip
{
  return self->_isAppClip;
}

- (void)setIsAppClip:(BOOL)a3
{
  self->_isAppClip = a3;
}

- (BOOL)isAppStoreVendable
{
  return self->_isAppStoreVendable;
}

- (void)setIsAppStoreVendable:(BOOL)a3
{
  self->_isAppStoreVendable = a3;
}

- (BOOL)isBetaApp
{
  return self->_isBetaApp;
}

- (void)setIsBetaApp:(BOOL)a3
{
  self->_isBetaApp = a3;
}

- (BOOL)isAdHocCodeSigned
{
  return self->_isAdHocCodeSigned;
}

- (void)setIsAdHocCodeSigned:(BOOL)a3
{
  self->_isAdHocCodeSigned = a3;
}

- (BOOL)hasUpdateAvailable
{
  return self->_hasUpdateAvailable;
}

- (void)setHasUpdateAvailable:(BOOL)a3
{
  self->_hasUpdateAvailable = a3;
}

- (NSString)VPNUUIDString
{
  return self->_VPNUUIDString;
}

- (void)setVPNUUIDString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)cellularSliceUUIDString
{
  return self->_cellularSliceUUIDString;
}

- (void)setCellularSliceUUIDString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)contentFilterUUIDString
{
  return self->_contentFilterUUIDString;
}

- (void)setContentFilterUUIDString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)DNSProxyUUIDString
{
  return self->_DNSProxyUUIDString;
}

- (void)setDNSProxyUUIDString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)relayUUIDString
{
  return self->_relayUUIDString;
}

- (void)setRelayUUIDString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSArray)associatedDomains
{
  return self->_associatedDomains;
}

- (void)setAssociatedDomains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSNumber)associatedDomainsEnableDirectDownloads
{
  return self->_associatedDomainsEnableDirectDownloads;
}

- (void)setAssociatedDomainsEnableDirectDownloads:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSNumber)removable
{
  return self->_removable;
}

- (void)setRemovable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSNumber)tapToPayScreenLock
{
  return self->_tapToPayScreenLock;
}

- (void)setTapToPayScreenLock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSNumber)allowUserToHide
{
  return self->_allowUserToHide;
}

- (void)setAllowUserToHide:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSNumber)allowUserToLock
{
  return self->_allowUserToLock;
}

- (void)setAllowUserToLock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSDictionary)feedback
{
  return self->_feedback;
}

- (void)setFeedback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (DMFAppManagementInformation)managementInformation
{
  return self->_managementInformation;
}

- (void)setManagementInformation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managementInformation, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_allowUserToLock, 0);
  objc_storeStrong((id *)&self->_allowUserToHide, 0);
  objc_storeStrong((id *)&self->_tapToPayScreenLock, 0);
  objc_storeStrong((id *)&self->_removable, 0);
  objc_storeStrong((id *)&self->_associatedDomainsEnableDirectDownloads, 0);
  objc_storeStrong((id *)&self->_associatedDomains, 0);
  objc_storeStrong((id *)&self->_relayUUIDString, 0);
  objc_storeStrong((id *)&self->_DNSProxyUUIDString, 0);
  objc_storeStrong((id *)&self->_contentFilterUUIDString, 0);
  objc_storeStrong((id *)&self->_cellularSliceUUIDString, 0);
  objc_storeStrong((id *)&self->_VPNUUIDString, 0);
  objc_storeStrong((id *)&self->_sharedUsage, 0);
  objc_storeStrong((id *)&self->_onDemandResourcesUsage, 0);
  objc_storeStrong((id *)&self->_dynamicUsage, 0);
  objc_storeStrong((id *)&self->_staticUsage, 0);
  objc_storeStrong((id *)&self->_shortVersion, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_distributorIdentifier, 0);
  objc_storeStrong((id *)&self->_externalVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_storeItemIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
