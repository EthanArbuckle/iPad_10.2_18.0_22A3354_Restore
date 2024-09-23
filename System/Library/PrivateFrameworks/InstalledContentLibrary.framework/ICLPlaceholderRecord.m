@implementation ICLPlaceholderRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICLPlaceholderRecord)initWithCoder:(id)a3
{
  id v4;
  ICLPlaceholderRecord *v5;
  uint64_t v6;
  NSURL *bundleContainerURL;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *parentIdentifiers;
  uint64_t v13;
  NSString *appManagementDomain;
  void *v15;
  uint64_t v16;
  NSString *alternateIconName;
  uint64_t v18;
  NSDate *installDate;
  uint64_t v20;
  NSNumber *lsInstallType;
  uint64_t v22;
  ICLSinfInfo *sinfInfo;
  uint64_t v24;
  NSData *uniqueInstallID;
  uint64_t v26;
  NSData *installSessionID;
  uint64_t v28;
  NSString *linkedParentBundleID;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)ICLPlaceholderRecord;
  v5 = -[ICLBundleRecord initWithCoder:](&v31, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleContainerURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleContainerURL = v5->_bundleContainerURL;
    v5->_bundleContainerURL = (NSURL *)v6;

    v5->_isOnDemandInstallCapable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isOnDemandInstallCapable"));
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("parentIdentifiers"));
    v11 = objc_claimAutoreleasedReturnValue();
    parentIdentifiers = v5->_parentIdentifiers;
    v5->_parentIdentifiers = (NSArray *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appManagementDomain"));
    v13 = objc_claimAutoreleasedReturnValue();
    appManagementDomain = v5->_appManagementDomain;
    v5->_appManagementDomain = (NSString *)v13;

    v5->_isSwiftPlaygroundsApp = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSwiftPlaygroundsApp"));
    v5->_isDeletable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDeletable"));
    v5->_isBeta = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isBeta"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placeholderFailureReason"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_placeholderFailureReason = objc_msgSend(v15, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alternateIconName"));
    v16 = objc_claimAutoreleasedReturnValue();
    alternateIconName = v5->_alternateIconName;
    v5->_alternateIconName = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    installDate = v5->_installDate;
    v5->_installDate = (NSDate *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lsInstallType"));
    v20 = objc_claimAutoreleasedReturnValue();
    lsInstallType = v5->_lsInstallType;
    v5->_lsInstallType = (NSNumber *)v20;

    v5->_isWebNotificationBundle = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isWebNotificationBundle"));
    v5->_isEligibleForWatchAppInstall = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEligibleForWatchAppInstall"));
    v5->_isMarketplace = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isMarketplace"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sinfInfo"));
    v22 = objc_claimAutoreleasedReturnValue();
    sinfInfo = v5->_sinfInfo;
    v5->_sinfInfo = (ICLSinfInfo *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueInstallID"));
    v24 = objc_claimAutoreleasedReturnValue();
    uniqueInstallID = v5->_uniqueInstallID;
    v5->_uniqueInstallID = (NSData *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installSessionID"));
    v26 = objc_claimAutoreleasedReturnValue();
    installSessionID = v5->_installSessionID;
    v5->_installSessionID = (NSData *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("linkedParentBundleID"));
    v28 = objc_claimAutoreleasedReturnValue();
    linkedParentBundleID = v5->_linkedParentBundleID;
    v5->_linkedParentBundleID = (NSString *)v28;

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
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)ICLPlaceholderRecord;
  v4 = a3;
  -[ICLBundleRecord encodeWithCoder:](&v16, sel_encodeWithCoder_, v4);
  -[ICLPlaceholderRecord bundleContainerURL](self, "bundleContainerURL", v16.receiver, v16.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleContainerURL"));

  objc_msgSend(v4, "encodeBool:forKey:", -[ICLPlaceholderRecord isOnDemandInstallCapable](self, "isOnDemandInstallCapable"), CFSTR("isOnDemandInstallCapable"));
  -[ICLPlaceholderRecord parentIdentifiers](self, "parentIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("parentIdentifiers"));

  -[ICLPlaceholderRecord appManagementDomain](self, "appManagementDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("appManagementDomain"));

  objc_msgSend(v4, "encodeBool:forKey:", -[ICLPlaceholderRecord isSwiftPlaygroundsApp](self, "isSwiftPlaygroundsApp"), CFSTR("isSwiftPlaygroundsApp"));
  objc_msgSend(v4, "encodeBool:forKey:", -[ICLPlaceholderRecord isDeletable](self, "isDeletable"), CFSTR("isDeletable"));
  objc_msgSend(v4, "encodeBool:forKey:", -[ICLPlaceholderRecord isBeta](self, "isBeta"), CFSTR("isBeta"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICLPlaceholderRecord placeholderFailureReason](self, "placeholderFailureReason"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("placeholderFailureReason"));

  -[ICLPlaceholderRecord alternateIconName](self, "alternateIconName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("alternateIconName"));

  -[ICLPlaceholderRecord installDate](self, "installDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("installDate"));

  -[ICLPlaceholderRecord lsInstallType](self, "lsInstallType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("lsInstallType"));

  objc_msgSend(v4, "encodeBool:forKey:", -[ICLPlaceholderRecord isWebNotificationBundle](self, "isWebNotificationBundle"), CFSTR("isWebNotificationBundle"));
  objc_msgSend(v4, "encodeBool:forKey:", -[ICLPlaceholderRecord isEligibleForWatchAppInstall](self, "isEligibleForWatchAppInstall"), CFSTR("isEligibleForWatchAppInstall"));
  objc_msgSend(v4, "encodeBool:forKey:", -[ICLPlaceholderRecord isMarketplace](self, "isMarketplace"), CFSTR("isMarketplace"));
  -[ICLPlaceholderRecord sinfInfo](self, "sinfInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("sinfInfo"));

  -[ICLPlaceholderRecord uniqueInstallID](self, "uniqueInstallID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("uniqueInstallID"));

  -[ICLPlaceholderRecord installSessionID](self, "installSessionID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("installSessionID"));

  -[ICLPlaceholderRecord linkedParentBundleID](self, "linkedParentBundleID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("linkedParentBundleID"));

}

- (ICLPlaceholderRecord)initWithLegacyRecordDictionary:(id)a3
{
  id v4;
  ICLPlaceholderRecord *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
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
  void *v33;
  ICLSinfInfo *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)ICLPlaceholderRecord;
  v5 = -[ICLBundleRecord initWithLegacyRecordDictionary:](&v45, sel_initWithLegacyRecordDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BundleContainer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v8, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICLPlaceholderRecord setBundleContainerURL:](v5, "setBundleContainerURL:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IsOnDemandInstallCapable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLPlaceholderRecord setIsOnDemandInstallCapable:](v5, "setIsOnDemandInstallCapable:", MIBooleanValue(v10, 0));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ParentIdentifiers"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v12 = v11;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    if (v13)
    {
      objc_opt_class();
      if (MIArrayContainsOnlyClass(v13))
        -[ICLPlaceholderRecord setParentIdentifiers:](v5, "setParentIdentifiers:", v13);
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppManagementDomain"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v15 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;

    -[ICLPlaceholderRecord setAppManagementDomain:](v5, "setAppManagementDomain:", v16);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IsSwiftPlaygroundsApp"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLPlaceholderRecord setIsSwiftPlaygroundsApp:](v5, "setIsSwiftPlaygroundsApp:", MIBooleanValue(v17, 0));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IsDeletable"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLPlaceholderRecord setIsDeletable:](v5, "setIsDeletable:", MIBooleanValue(v18, 0));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PlaceholderFailureReason"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v20 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;

    -[ICLPlaceholderRecord setPlaceholderFailureReason:](v5, "setPlaceholderFailureReason:", objc_msgSend(v21, "unsignedIntegerValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AlternateIconName"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v23 = v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;

    -[ICLPlaceholderRecord setAlternateIconName:](v5, "setAlternateIconName:", v24);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppInstallDate"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v26 = v25;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v27 = v26;
    else
      v27 = 0;

    -[ICLPlaceholderRecord setInstallDate:](v5, "setInstallDate:", v27);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LSInstallType"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v29 = v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v30 = v29;
    else
      v30 = 0;

    -[ICLPlaceholderRecord setLsInstallType:](v5, "setLsInstallType:", v30);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IsWebNotificationBundle"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLPlaceholderRecord setIsWebNotificationBundle:](v5, "setIsWebNotificationBundle:", MIBooleanValue(v31, 0));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IsEligibleForWatchAppInstall"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLPlaceholderRecord setIsEligibleForWatchAppInstall:](v5, "setIsEligibleForWatchAppInstall:", MIBooleanValue(v32, 0));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IsMarketplace"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLPlaceholderRecord setIsMarketplace:](v5, "setIsMarketplace:", MIBooleanValue(v33, 0));

    v34 = -[ICLSinfInfo initWithLegacySinfInfoDictionary:]([ICLSinfInfo alloc], "initWithLegacySinfInfoDictionary:", v4);
    -[ICLPlaceholderRecord setSinfInfo:](v5, "setSinfInfo:", v34);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UniqueInstallID"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v36 = v35;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v37 = v36;
    else
      v37 = 0;

    -[ICLPlaceholderRecord setUniqueInstallID:](v5, "setUniqueInstallID:", v37);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("InstallSessionID"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v39 = v38;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v40 = v39;
    else
      v40 = 0;

    -[ICLPlaceholderRecord setInstallSessionID:](v5, "setInstallSessionID:", v40);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LinkedParentBundleID"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v42 = v41;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v43 = v42;
    else
      v43 = 0;

    -[ICLPlaceholderRecord setLinkedParentBundleID:](v5, "setLinkedParentBundleID:", v43);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
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
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)ICLPlaceholderRecord;
  v5 = -[ICLBundleRecord copyWithZone:](&v27, sel_copyWithZone_);
  -[ICLPlaceholderRecord bundleContainerURL](self, "bundleContainerURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setBundleContainerURL:", v7);

  objc_msgSend(v5, "setIsOnDemandInstallCapable:", -[ICLPlaceholderRecord isOnDemandInstallCapable](self, "isOnDemandInstallCapable"));
  -[ICLPlaceholderRecord parentIdentifiers](self, "parentIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setParentIdentifiers:", v9);

  -[ICLPlaceholderRecord appManagementDomain](self, "appManagementDomain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setAppManagementDomain:", v11);

  objc_msgSend(v5, "setIsSwiftPlaygroundsApp:", -[ICLPlaceholderRecord isSwiftPlaygroundsApp](self, "isSwiftPlaygroundsApp"));
  objc_msgSend(v5, "setIsDeletable:", -[ICLPlaceholderRecord isDeletable](self, "isDeletable"));
  objc_msgSend(v5, "setIsBeta:", -[ICLPlaceholderRecord isBeta](self, "isBeta"));
  objc_msgSend(v5, "setPlaceholderFailureReason:", -[ICLPlaceholderRecord placeholderFailureReason](self, "placeholderFailureReason"));
  -[ICLPlaceholderRecord alternateIconName](self, "alternateIconName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setAlternateIconName:", v13);

  -[ICLPlaceholderRecord installDate](self, "installDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  objc_msgSend(v5, "setInstallDate:", v15);

  -[ICLPlaceholderRecord lsInstallType](self, "lsInstallType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);
  objc_msgSend(v5, "setLsInstallType:", v17);

  objc_msgSend(v5, "setIsWebNotificationBundle:", -[ICLPlaceholderRecord isWebNotificationBundle](self, "isWebNotificationBundle"));
  objc_msgSend(v5, "setIsEligibleForWatchAppInstall:", -[ICLPlaceholderRecord isEligibleForWatchAppInstall](self, "isEligibleForWatchAppInstall"));
  objc_msgSend(v5, "setIsMarketplace:", -[ICLPlaceholderRecord isMarketplace](self, "isMarketplace"));
  -[ICLPlaceholderRecord sinfInfo](self, "sinfInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copyWithZone:", a3);
  objc_msgSend(v5, "setSinfInfo:", v19);

  -[ICLPlaceholderRecord uniqueInstallID](self, "uniqueInstallID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copyWithZone:", a3);
  objc_msgSend(v5, "setUniqueInstallID:", v21);

  -[ICLPlaceholderRecord installSessionID](self, "installSessionID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copyWithZone:", a3);
  objc_msgSend(v5, "setInstallSessionID:", v23);

  -[ICLPlaceholderRecord linkedParentBundleID](self, "linkedParentBundleID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copyWithZone:", a3);
  objc_msgSend(v5, "setLinkedParentBundleID:", v25);

  return v5;
}

- (id)legacyRecordDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;

  v3 = (void *)objc_opt_new();
  v29.receiver = self;
  v29.super_class = (Class)ICLPlaceholderRecord;
  -[ICLBundleRecord legacyRecordDictionary](&v29, sel_legacyRecordDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  -[ICLPlaceholderRecord bundleContainerURL](self, "bundleContainerURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("BundleContainer"));

  v7 = -[ICLPlaceholderRecord isOnDemandInstallCapable](self, "isOnDemandInstallCapable");
  v8 = MEMORY[0x1E0C9AAA0];
  v9 = MEMORY[0x1E0C9AAB0];
  if (v7)
    v10 = MEMORY[0x1E0C9AAB0];
  else
    v10 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("IsOnDemandInstallCapable"));
  -[ICLPlaceholderRecord parentIdentifiers](self, "parentIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("ParentIdentifiers"));

  -[ICLPlaceholderRecord appManagementDomain](self, "appManagementDomain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("AppManagementDomain"));

  if (-[ICLPlaceholderRecord isSwiftPlaygroundsApp](self, "isSwiftPlaygroundsApp"))
    v13 = v9;
  else
    v13 = v8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("IsSwiftPlaygroundsApp"));
  if (-[ICLPlaceholderRecord isDeletable](self, "isDeletable"))
    v14 = v9;
  else
    v14 = v8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("IsDeletable"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICLPlaceholderRecord placeholderFailureReason](self, "placeholderFailureReason"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("PlaceholderFailureReason"));

  -[ICLPlaceholderRecord alternateIconName](self, "alternateIconName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("AlternateIconName"));

  -[ICLPlaceholderRecord installDate](self, "installDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("AppInstallDate"));

  -[ICLPlaceholderRecord lsInstallType](self, "lsInstallType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("LSInstallType"));

  if (-[ICLPlaceholderRecord isWebNotificationBundle](self, "isWebNotificationBundle"))
    v19 = v9;
  else
    v19 = v8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("IsWebNotificationBundle"));
  if (-[ICLPlaceholderRecord isEligibleForWatchAppInstall](self, "isEligibleForWatchAppInstall"))
    v20 = v9;
  else
    v20 = v8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("IsEligibleForWatchAppInstall"));
  if (-[ICLPlaceholderRecord isMarketplace](self, "isMarketplace"))
    v21 = v9;
  else
    v21 = v8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("IsMarketplace"));
  -[ICLPlaceholderRecord sinfInfo](self, "sinfInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "legacySinfInfoDictionary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v23);

  -[ICLPlaceholderRecord uniqueInstallID](self, "uniqueInstallID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("UniqueInstallID"));

  -[ICLPlaceholderRecord installSessionID](self, "installSessionID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("InstallSessionID"));

  -[ICLPlaceholderRecord linkedParentBundleID](self, "linkedParentBundleID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("LinkedParentBundleID"));

  v27 = (void *)objc_msgSend(v3, "copy");
  return v27;
}

- (BOOL)isEqual:(id)a3
{
  ICLPlaceholderRecord *v4;
  ICLPlaceholderRecord *v5;
  void *v6;
  void *v7;
  BOOL v8;
  _BOOL4 v9;
  BOOL v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  BOOL v16;
  _BOOL4 v17;
  _BOOL4 v18;
  _BOOL4 v19;
  unint64_t v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  BOOL v32;
  _BOOL4 v33;
  _BOOL4 v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  BOOL v39;
  void *v40;
  void *v41;
  BOOL v42;
  void *v43;
  void *v44;
  BOOL v45;
  objc_super v46;

  v4 = (ICLPlaceholderRecord *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v46.receiver = self;
      v46.super_class = (Class)ICLPlaceholderRecord;
      if (-[ICLBundleRecord isEqual:](&v46, sel_isEqual_, v4))
      {
        v5 = v4;
        -[ICLPlaceholderRecord bundleContainerURL](self, "bundleContainerURL");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICLPlaceholderRecord bundleContainerURL](v5, "bundleContainerURL");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = MICompareObjects(v6, v7);

        if (v8)
        {
          v9 = -[ICLPlaceholderRecord isOnDemandInstallCapable](self, "isOnDemandInstallCapable");
          if (v9 == -[ICLPlaceholderRecord isOnDemandInstallCapable](v5, "isOnDemandInstallCapable"))
          {
            -[ICLPlaceholderRecord parentIdentifiers](self, "parentIdentifiers");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICLPlaceholderRecord parentIdentifiers](v5, "parentIdentifiers");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = MICompareObjects(v11, v12);

            if (v13)
            {
              -[ICLPlaceholderRecord appManagementDomain](self, "appManagementDomain");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[ICLPlaceholderRecord appManagementDomain](v5, "appManagementDomain");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = MICompareObjects(v14, v15);

              if (v16)
              {
                v17 = -[ICLPlaceholderRecord isSwiftPlaygroundsApp](self, "isSwiftPlaygroundsApp");
                if (v17 == -[ICLPlaceholderRecord isSwiftPlaygroundsApp](v5, "isSwiftPlaygroundsApp"))
                {
                  v18 = -[ICLPlaceholderRecord isDeletable](self, "isDeletable");
                  if (v18 == -[ICLPlaceholderRecord isDeletable](v5, "isDeletable"))
                  {
                    v19 = -[ICLPlaceholderRecord isBeta](self, "isBeta");
                    if (v19 == -[ICLPlaceholderRecord isBeta](v5, "isBeta"))
                    {
                      v20 = -[ICLPlaceholderRecord placeholderFailureReason](self, "placeholderFailureReason");
                      if (v20 == -[ICLPlaceholderRecord placeholderFailureReason](v5, "placeholderFailureReason"))
                      {
                        -[ICLPlaceholderRecord alternateIconName](self, "alternateIconName");
                        v21 = (void *)objc_claimAutoreleasedReturnValue();
                        -[ICLPlaceholderRecord alternateIconName](v5, "alternateIconName");
                        v22 = (void *)objc_claimAutoreleasedReturnValue();
                        v23 = MICompareObjects(v21, v22);

                        if (v23)
                        {
                          -[ICLPlaceholderRecord installDate](self, "installDate");
                          v24 = (void *)objc_claimAutoreleasedReturnValue();
                          -[ICLPlaceholderRecord installDate](v5, "installDate");
                          v25 = (void *)objc_claimAutoreleasedReturnValue();
                          v26 = MICompareObjects(v24, v25);

                          if (v26)
                          {
                            -[ICLPlaceholderRecord lsInstallType](self, "lsInstallType");
                            v27 = (void *)objc_claimAutoreleasedReturnValue();
                            -[ICLPlaceholderRecord lsInstallType](v5, "lsInstallType");
                            v28 = (void *)objc_claimAutoreleasedReturnValue();
                            v29 = MICompareObjects(v27, v28);

                            if (v29)
                            {
                              -[ICLPlaceholderRecord sinfInfo](self, "sinfInfo");
                              v30 = (void *)objc_claimAutoreleasedReturnValue();
                              -[ICLPlaceholderRecord sinfInfo](v5, "sinfInfo");
                              v31 = (void *)objc_claimAutoreleasedReturnValue();
                              v32 = MICompareObjects(v30, v31);

                              if (v32)
                              {
                                v33 = -[ICLPlaceholderRecord isWebNotificationBundle](self, "isWebNotificationBundle");
                                if (v33 == -[ICLPlaceholderRecord isWebNotificationBundle](v5, "isWebNotificationBundle"))
                                {
                                  v35 = -[ICLPlaceholderRecord isEligibleForWatchAppInstall](self, "isEligibleForWatchAppInstall");
                                  if (v35 == -[ICLPlaceholderRecord isEligibleForWatchAppInstall](v5, "isEligibleForWatchAppInstall"))
                                  {
                                    v36 = -[ICLPlaceholderRecord isMarketplace](self, "isMarketplace");
                                    if (v36 == -[ICLPlaceholderRecord isMarketplace](v5, "isMarketplace"))
                                    {
                                      -[ICLPlaceholderRecord uniqueInstallID](self, "uniqueInstallID");
                                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                                      -[ICLPlaceholderRecord uniqueInstallID](v5, "uniqueInstallID");
                                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                                      v39 = MICompareObjects(v37, v38);

                                      if (v39)
                                      {
                                        -[ICLPlaceholderRecord installSessionID](self, "installSessionID");
                                        v40 = (void *)objc_claimAutoreleasedReturnValue();
                                        -[ICLPlaceholderRecord installSessionID](v5, "installSessionID");
                                        v41 = (void *)objc_claimAutoreleasedReturnValue();
                                        v42 = MICompareObjects(v40, v41);

                                        if (v42)
                                        {
                                          -[ICLPlaceholderRecord linkedParentBundleID](self, "linkedParentBundleID");
                                          v43 = (void *)objc_claimAutoreleasedReturnValue();
                                          -[ICLPlaceholderRecord linkedParentBundleID](v5, "linkedParentBundleID");
                                          v44 = (void *)objc_claimAutoreleasedReturnValue();
                                          v45 = MICompareObjects(v43, v44);

                                          if (v45)
                                          {
                                            v10 = 1;
                                            goto LABEL_59;
                                          }
                                          if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                          {
LABEL_58:
                                            v10 = 0;
LABEL_59:

                                            goto LABEL_60;
                                          }
                                        }
                                        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                        {
                                          goto LABEL_58;
                                        }
                                      }
                                      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                      {
                                        goto LABEL_58;
                                      }
                                    }
                                    else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                    {
                                      goto LABEL_58;
                                    }
                                  }
                                  else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                  {
                                    goto LABEL_58;
                                  }
                                }
                                else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                {
                                  goto LABEL_58;
                                }
                              }
                              else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                              {
                                goto LABEL_58;
                              }
                            }
                            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                            {
                              goto LABEL_58;
                            }
                          }
                          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                          {
                            goto LABEL_58;
                          }
                        }
                        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                        {
                          goto LABEL_58;
                        }
                      }
                      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                      {
                        goto LABEL_58;
                      }
                    }
                    else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                    {
                      goto LABEL_58;
                    }
                  }
                  else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                  {
                    goto LABEL_58;
                  }
                }
                else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                {
                  goto LABEL_58;
                }
              }
              else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
              {
                goto LABEL_58;
              }
            }
            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
            {
              goto LABEL_58;
            }
          }
          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
            goto LABEL_58;
          }
        }
        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
          goto LABEL_58;
        }
        MOLogWrite();
        goto LABEL_58;
      }
    }
    v10 = 0;
  }
LABEL_60:

  return v10;
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
  objc_super v37;

  v3 = -[ICLPlaceholderRecord isOnDemandInstallCapable](self, "isOnDemandInstallCapable");
  v4 = -[ICLPlaceholderRecord isSwiftPlaygroundsApp](self, "isSwiftPlaygroundsApp");
  v5 = 2;
  if (!v4)
    v5 = 0;
  v6 = v5 | v3;
  if (-[ICLPlaceholderRecord isDeletable](self, "isDeletable"))
    v7 = 4;
  else
    v7 = 0;
  v8 = -[ICLPlaceholderRecord isBeta](self, "isBeta");
  v9 = 8;
  if (!v8)
    v9 = 0;
  v10 = v6 | v7 | v9 | (16 * (-[ICLPlaceholderRecord placeholderFailureReason](self, "placeholderFailureReason") != 0));
  if (-[ICLPlaceholderRecord isWebNotificationBundle](self, "isWebNotificationBundle"))
    v11 = 32;
  else
    v11 = 0;
  v12 = -[ICLPlaceholderRecord isEligibleForWatchAppInstall](self, "isEligibleForWatchAppInstall");
  v13 = 64;
  if (!v12)
    v13 = 0;
  v14 = v10 | v11 | v13;
  if (-[ICLPlaceholderRecord isMarketplace](self, "isMarketplace"))
    v15 = 128;
  else
    v15 = 0;
  -[ICLPlaceholderRecord bundleContainerURL](self, "bundleContainerURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");

  -[ICLPlaceholderRecord parentIdentifiers](self, "parentIdentifiers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17 ^ objc_msgSend(v18, "hash");

  -[ICLPlaceholderRecord appManagementDomain](self, "appManagementDomain");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19 ^ objc_msgSend(v20, "hash");

  -[ICLPlaceholderRecord alternateIconName](self, "alternateIconName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v21 ^ objc_msgSend(v22, "hash");

  -[ICLPlaceholderRecord installDate](self, "installDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v14 ^ v23 ^ objc_msgSend(v24, "hash");

  -[ICLPlaceholderRecord lsInstallType](self, "lsInstallType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "hash");

  -[ICLPlaceholderRecord sinfInfo](self, "sinfInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v27 ^ objc_msgSend(v28, "hash");

  -[ICLPlaceholderRecord uniqueInstallID](self, "uniqueInstallID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v29 ^ objc_msgSend(v30, "hash");

  -[ICLPlaceholderRecord installSessionID](self, "installSessionID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v31 ^ objc_msgSend(v32, "hash");

  -[ICLPlaceholderRecord linkedParentBundleID](self, "linkedParentBundleID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v33 ^ objc_msgSend(v34, "hash");

  v37.receiver = self;
  v37.super_class = (Class)ICLPlaceholderRecord;
  return v25 ^ v35 ^ -[ICLBundleRecord hash](&v37, sel_hash);
}

- (NSURL)bundleContainerURL
{
  return self->_bundleContainerURL;
}

- (void)setBundleContainerURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (BOOL)isOnDemandInstallCapable
{
  return self->_isOnDemandInstallCapable;
}

- (void)setIsOnDemandInstallCapable:(BOOL)a3
{
  self->_isOnDemandInstallCapable = a3;
}

- (NSArray)parentIdentifiers
{
  return self->_parentIdentifiers;
}

- (void)setParentIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)appManagementDomain
{
  return self->_appManagementDomain;
}

- (void)setAppManagementDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (BOOL)isSwiftPlaygroundsApp
{
  return self->_isSwiftPlaygroundsApp;
}

- (void)setIsSwiftPlaygroundsApp:(BOOL)a3
{
  self->_isSwiftPlaygroundsApp = a3;
}

- (BOOL)isDeletable
{
  return self->_isDeletable;
}

- (void)setIsDeletable:(BOOL)a3
{
  self->_isDeletable = a3;
}

- (BOOL)isBeta
{
  return self->_isBeta;
}

- (void)setIsBeta:(BOOL)a3
{
  self->_isBeta = a3;
}

- (unint64_t)placeholderFailureReason
{
  return self->_placeholderFailureReason;
}

- (void)setPlaceholderFailureReason:(unint64_t)a3
{
  self->_placeholderFailureReason = a3;
}

- (NSString)alternateIconName
{
  return self->_alternateIconName;
}

- (void)setAlternateIconName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSDate)installDate
{
  return self->_installDate;
}

- (void)setInstallDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSNumber)lsInstallType
{
  return self->_lsInstallType;
}

- (void)setLsInstallType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (BOOL)isWebNotificationBundle
{
  return self->_isWebNotificationBundle;
}

- (void)setIsWebNotificationBundle:(BOOL)a3
{
  self->_isWebNotificationBundle = a3;
}

- (ICLSinfInfo)sinfInfo
{
  return self->_sinfInfo;
}

- (void)setSinfInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSData)uniqueInstallID
{
  return self->_uniqueInstallID;
}

- (void)setUniqueInstallID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSData)installSessionID
{
  return self->_installSessionID;
}

- (void)setInstallSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSString)linkedParentBundleID
{
  return self->_linkedParentBundleID;
}

- (void)setLinkedParentBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (BOOL)isEligibleForWatchAppInstall
{
  return self->_isEligibleForWatchAppInstall;
}

- (void)setIsEligibleForWatchAppInstall:(BOOL)a3
{
  self->_isEligibleForWatchAppInstall = a3;
}

- (BOOL)isMarketplace
{
  return self->_isMarketplace;
}

- (void)setIsMarketplace:(BOOL)a3
{
  self->_isMarketplace = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedParentBundleID, 0);
  objc_storeStrong((id *)&self->_installSessionID, 0);
  objc_storeStrong((id *)&self->_uniqueInstallID, 0);
  objc_storeStrong((id *)&self->_sinfInfo, 0);
  objc_storeStrong((id *)&self->_lsInstallType, 0);
  objc_storeStrong((id *)&self->_installDate, 0);
  objc_storeStrong((id *)&self->_alternateIconName, 0);
  objc_storeStrong((id *)&self->_appManagementDomain, 0);
  objc_storeStrong((id *)&self->_parentIdentifiers, 0);
  objc_storeStrong((id *)&self->_bundleContainerURL, 0);
}

@end
