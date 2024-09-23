@implementation FLFollowUpItem

- (unint64_t)sqlID
{
  return self->_sqlID;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setTypeIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setSqlID:(unint64_t)a3
{
  self->_sqlID = a3;
}

- (void)setShouldPersistWhenDismissed:(BOOL)a3
{
  self->_shouldPersistWhenDismissed = a3;
}

- (void)setShouldPersistWhenActivated:(BOOL)a3
{
  self->_shouldPersistWhenActivated = a3;
}

- (void)setRepresentingBundlePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setInformativeText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setInformativeFooterText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setExtensionIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (void)setDisplayStyle:(unint64_t)a3
{
  self->_displayStyle = a3;
}

- (void)setCollectionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)setCategoryIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (void)setBundleIconName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setActions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (void)setNotification:(id)a3
{
  objc_storeStrong((id *)&self->_notification, a3);
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setShowInSettings:(BOOL)a3
{
  __CFString *v4;
  NSString *targetBundleIdentifier;

  self->_showInSettings = a3;
  if (a3)
  {
    v4 = CFSTR("com.apple.Preferences");
    targetBundleIdentifier = self->_targetBundleIdentifier;
    self->_targetBundleIdentifier = &v4->isa;
  }
  else
  {
    targetBundleIdentifier = self->_targetBundleIdentifier;
    self->_targetBundleIdentifier = 0;
  }

}

- (FLFollowUpItem)initWithoutDefaults
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FLFollowUpItem;
  return -[FLFollowUpItem init](&v3, sel_init);
}

- (void)set_userInfoData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;

  if (a3)
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    -[FLFollowUpItem setUserInfo:](self, "setUserInfo:", v4);

    -[FLFollowUpItem userInfo](self, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      _FLLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[FLFollowUpItem set_userInfoData:].cold.1();

    }
  }
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateMachServiceName, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIconName, 0);
  objc_storeStrong((id *)&self->_representingBundlePath, 0);
  objc_storeStrong((id *)&self->_informativeFooterText, 0);
  objc_storeStrong((id *)&self->_informativeText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_targetBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_collectionIdentifier, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (void)setTargetBundleIdentifier:(id)a3
{
  id v4;
  NSString *v5;
  NSString *targetBundleIdentifier;
  char v7;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  targetBundleIdentifier = self->_targetBundleIdentifier;
  self->_targetBundleIdentifier = v5;

  v7 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Preferences"));
  self->_showInSettings = v7;
}

+ (id)_expirationDateFormatter
{
  if (_expirationDateFormatter_onceToken != -1)
    dispatch_once(&_expirationDateFormatter_onceToken, &__block_literal_global_0);
  return (id)_expirationDateFormatter_formatter;
}

uint64_t __42__FLFollowUpItem__expirationDateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_expirationDateFormatter_formatter;
  _expirationDateFormatter_formatter = (uint64_t)v0;

  objc_msgSend((id)_expirationDateFormatter_formatter, "setTimeStyle:", 0);
  return objc_msgSend((id)_expirationDateFormatter_formatter, "setDateStyle:", 2);
}

- (FLFollowUpItem)init
{
  FLFollowUpItem *v2;
  FLFollowUpItem *v3;
  void *v4;
  uint64_t v5;
  NSString *uniqueIdentifier;
  NSString *groupIdentifier;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FLFollowUpItem;
  v2 = -[FLFollowUpItem init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_showInSettings = 1;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v3->_uniqueIdentifier;
    v3->_uniqueIdentifier = (NSString *)v5;

    groupIdentifier = v3->_groupIdentifier;
    v3->_groupIdentifier = (NSString *)CFSTR("com.apple.followup.group.device");

    objc_storeStrong((id *)&v3->_targetBundleIdentifier, CFSTR("com.apple.Preferences"));
    objc_storeStrong((id *)&v3->_categoryIdentifier, CFSTR("com.apple.followupd.FLDefaultCategory"));
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *uniqueIdentifier;
  id v5;

  uniqueIdentifier = self->_uniqueIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uniqueIdentifier, CFSTR("_uniqueIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_notification, CFSTR("_notification"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_showInSettings, CFSTR("_showInSettings"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("_title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_informativeText, CFSTR("_informativeText"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_displayStyle, CFSTR("_displayStyle"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldPersistWhenActivated, CFSTR("_shouldPersistWhenActivated"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldPersistWhenDismissed, CFSTR("_shouldPersistWhenDismissed"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actions, CFSTR("_actions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userInfo, CFSTR("_userInfo"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sqlID, CFSTR("_sqlID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientIdentifier, CFSTR("_clientIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_delegateMachServiceName, CFSTR("_delegateMachServiceName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extensionIdentifier, CFSTR("_extensionIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupIdentifier, CFSTR("_groupIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_collectionIdentifier, CFSTR("_collectionIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_targetBundleIdentifier, CFSTR("_targetBundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_representingBundlePath, CFSTR("_representingBundlePath"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIconName, CFSTR("_bundleIconName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_informativeFooterText, CFSTR("_informativeFooterText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_categoryIdentifier, CFSTR("_categoryIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("_expirationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountIdentifier, CFSTR("_accountIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_typeIdentifier, CFSTR("_typeIdentifier"));

}

- (FLFollowUpItem)initWithCoder:(id)a3
{
  id v4;
  FLFollowUpItem *v5;
  uint64_t v6;
  NSString *uniqueIdentifier;
  uint64_t v8;
  FLFollowUpNotification *notification;
  uint64_t v10;
  NSString *title;
  uint64_t v12;
  NSString *informativeText;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *actions;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSDictionary *userInfo;
  uint64_t v27;
  NSString *clientIdentifier;
  uint64_t v29;
  NSString *delegateMachServiceName;
  uint64_t v31;
  NSString *extensionIdentifier;
  uint64_t v33;
  NSString *groupIdentifier;
  uint64_t v35;
  NSString *collectionIdentifier;
  uint64_t v37;
  NSString *targetBundleIdentifier;
  uint64_t v39;
  NSString *representingBundlePath;
  uint64_t v41;
  NSString *bundleIconName;
  uint64_t v43;
  NSString *informativeFooterText;
  uint64_t v45;
  NSString *categoryIdentifier;
  uint64_t v47;
  NSDate *expirationDate;
  uint64_t v49;
  NSString *accountIdentifier;
  uint64_t v51;
  NSString *typeIdentifier;

  v4 = a3;
  v5 = -[FLFollowUpItem init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_uniqueIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_notification"));
    v8 = objc_claimAutoreleasedReturnValue();
    notification = v5->_notification;
    v5->_notification = (FLFollowUpNotification *)v8;

    v5->_showInSettings = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_showInSettings"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_title"));
    v10 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_informativeText"));
    v12 = objc_claimAutoreleasedReturnValue();
    informativeText = v5->_informativeText;
    v5->_informativeText = (NSString *)v12;

    v5->_displayStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_displayStyle"));
    v5->_shouldPersistWhenActivated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldPersistWhenActivated"));
    v5->_shouldPersistWhenDismissed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldPersistWhenDismissed"));
    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("_actions"));
    v17 = objc_claimAutoreleasedReturnValue();
    actions = v5->_actions;
    v5->_actions = (NSArray *)v17;

    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, v21, v22, v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("_userInfo"));
    v25 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v25;

    v5->_sqlID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_sqlID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_clientIdentifier"));
    v27 = objc_claimAutoreleasedReturnValue();
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_delegateMachServiceName"));
    v29 = objc_claimAutoreleasedReturnValue();
    delegateMachServiceName = v5->_delegateMachServiceName;
    v5->_delegateMachServiceName = (NSString *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_extensionIdentifier"));
    v31 = objc_claimAutoreleasedReturnValue();
    extensionIdentifier = v5->_extensionIdentifier;
    v5->_extensionIdentifier = (NSString *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_groupIdentifier"));
    v33 = objc_claimAutoreleasedReturnValue();
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_collectionIdentifier"));
    v35 = objc_claimAutoreleasedReturnValue();
    collectionIdentifier = v5->_collectionIdentifier;
    v5->_collectionIdentifier = (NSString *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_targetBundleIdentifier"));
    v37 = objc_claimAutoreleasedReturnValue();
    targetBundleIdentifier = v5->_targetBundleIdentifier;
    v5->_targetBundleIdentifier = (NSString *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_representingBundlePath"));
    v39 = objc_claimAutoreleasedReturnValue();
    representingBundlePath = v5->_representingBundlePath;
    v5->_representingBundlePath = (NSString *)v39;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundleIconName"));
    v41 = objc_claimAutoreleasedReturnValue();
    bundleIconName = v5->_bundleIconName;
    v5->_bundleIconName = (NSString *)v41;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_informativeFooterText"));
    v43 = objc_claimAutoreleasedReturnValue();
    informativeFooterText = v5->_informativeFooterText;
    v5->_informativeFooterText = (NSString *)v43;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_categoryIdentifier"));
    v45 = objc_claimAutoreleasedReturnValue();
    categoryIdentifier = v5->_categoryIdentifier;
    v5->_categoryIdentifier = (NSString *)v45;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_expirationDate"));
    v47 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v47;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_accountIdentifier"));
    v49 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v49;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_typeIdentifier"));
    v51 = objc_claimAutoreleasedReturnValue();
    typeIdentifier = v5->_typeIdentifier;
    v5->_typeIdentifier = (NSString *)v51;

  }
  return v5;
}

- (NSData)_userInfoData
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;

  -[FLFollowUpItem userInfo](self, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB38B0];
    -[FLFollowUpItem userInfo](self, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    objc_msgSend(v4, "dataWithPropertyList:format:options:error:", v5, 200, 0, &v9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;

    if (!v3)
    {
      _FLLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[FLFollowUpItem _userInfoData].cold.1();

    }
  }
  return (NSData *)v3;
}

- (BOOL)_shouldAdjustInstanceToMidnight
{
  void *v2;
  void *v3;
  char v4;

  -[FLFollowUpItem userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FLUserInfoPropertyAdjustExpirationToMidnight"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (id)_midnightAdjustedDate
{
  NSDate *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  NSDate *v10;
  NSObject *v11;
  NSDate *expirationDate;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  NSDate *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = self->_expirationDate;
  -[FLFollowUpItem expirationDate](self, "expirationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || !-[FLFollowUpItem _shouldAdjustInstanceToMidnight](self, "_shouldAdjustInstanceToMidnight"))
  {

    return v3;
  }
  +[FLEnvironment currentEnvironment](FLEnvironment, "currentEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "normalizeExpirationToMidnight");

  if (!v6)
    return v3;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLFollowUpItem expirationDate](self, "expirationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components:fromDate:", 30, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dateWithEra:year:month:day:hour:minute:second:nanosecond:", objc_msgSend(v9, "era"), objc_msgSend(v9, "year"), objc_msgSend(v9, "month"), objc_msgSend(v9, "day"), 23, 59, 0, 0);
  v10 = (NSDate *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    _FLLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      expirationDate = self->_expirationDate;
      *(_DWORD *)buf = 138412802;
      v15 = v9;
      v16 = 2112;
      v17 = v7;
      v18 = 2112;
      v19 = expirationDate;
      _os_log_error_impl(&dword_1B8D53000, v11, OS_LOG_TYPE_ERROR, "Could not build midnight adjusted date with comoponents %@ from calendar %@, reverting to expiration date as is %@", buf, 0x20u);
    }

    v10 = self->_expirationDate;
  }

  return v10;
}

- (BOOL)isExpired
{
  void *v2;
  void *v3;
  BOOL v4;

  -[FLFollowUpItem _midnightAdjustedDate](self, "_midnightAdjustedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v2, "compare:", v3) == -1;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)displayExpirationDate
{
  void *v3;
  void *v4;
  int v5;
  void *v6;

  -[FLFollowUpItem expirationDate](self, "expirationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[FLFollowUpItem userInfo](self, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("FLUserInfoPropertyDontDisplayDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v5 = objc_opt_isKindOfClass() ^ 1;
  LOBYTE(v6) = v5 & (v3 != 0);
  if ((v5 & 1) == 0 && v3)
    LODWORD(v6) = objc_msgSend(v4, "BOOLValue") ^ 1;

  return (char)v6;
}

- (id)formattedExpirationDate
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
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int64_t v21;
  void *v22;

  -[FLFollowUpItem _midnightAdjustedDate](self, "_midnightAdjustedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[FLFollowUpItem userInfo](self, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FLUserInfoPropertyAbsoluteFormat"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[FLFollowUpItem userInfo](self, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("FLUserInfoPropertyRelativeZeroDay"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[FLFollowUpItem userInfo](self, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("FLUserInfoPropertyRelativeSingleDay"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[FLFollowUpItem userInfo](self, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("FLUserInfoPropertyRelativePluralDaysFormat"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if (((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[FLFollowUpItem userInfo](self, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("FLUserInfoPropertyRelativeIsCeiling"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = objc_msgSend(v13, "BOOLValue");
      else
        v14 = 0;
      v21 = +[FLFollowUpItem _daysRemaining:ceiling:](FLFollowUpItem, "_daysRemaining:ceiling:", v3, v14);
      if (v21 == 1)
      {
        v16 = v9;
        goto LABEL_17;
      }
      if (!v21)
      {
        v16 = v7;
        goto LABEL_17;
      }
      v22 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringWithFormat:", v11, v20);
    }
    else
    {
      if (v5)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[FLFollowUpItem _expirationDateFormatter](FLFollowUpItem, "_expirationDateFormatter");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringFromDate:", v3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v5, v13);
          v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
          v17 = v16;
LABEL_20:

          goto LABEL_21;
        }
      }
      +[FLFollowUpItem _expirationDateFormatter](FLFollowUpItem, "_expirationDateFormatter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringFromDate:", v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)MEMORY[0x1E0CB3940];
      FLLoc(CFSTR("ITEM_EXPIRATION_FORMAT"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringWithFormat:", v20, v13);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_20;
  }
  v17 = 0;
LABEL_21:

  return v17;
}

- (id)_informativeNotificationTextOrDate
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  _BOOL4 v8;

  -[FLFollowUpItem notification](self, "notification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "informativeText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[FLFollowUpItem notification](self, "notification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "informativeText");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = &stru_1E6F1F920;
  if (!-[__CFString isEqualToString:](v6, "isEqualToString:"))
  {

    goto LABEL_7;
  }
  v8 = -[FLFollowUpItem displayExpirationDate](self, "displayExpirationDate");

  if (v8)
  {
    -[FLFollowUpItem formattedExpirationDate](self, "formattedExpirationDate");
    v5 = v4;
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  }
  return v4;
}

+ (int64_t)_daysRemaining:(id)a3 ceiling:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v4 = a4;
  v5 = a3;
  +[FLEnvironment currentEnvironment](FLEnvironment, "currentEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oneDayTimeInterval");
  v8 = v7;

  objc_msgSend(v5, "timeIntervalSinceNow");
  v10 = v9;

  v11 = ceil(v10 / v8);
  v12 = floor(v10 / v8);
  if (v4)
    return (uint64_t)v11;
  return (uint64_t)v12;
}

- (id)description
{
  uint64_t v3;
  NSArray *actions;
  NSString *title;
  FLFollowUpNotification *notification;
  NSString *bundleIconName;
  NSString *representingBundlePath;
  NSString *informativeFooterText;
  NSString *categoryIdentifier;
  void *v11;
  void *v12;
  void *v13;
  NSString *collectionIdentifier;
  NSString *extensionIdentifier;
  NSString *typeIdentifier;
  NSString *accountIdentifier;
  NSString *targetBundleIdentifier;
  NSString *groupIdentifier;
  NSString *clientIdentifier;
  NSString *uniqueIdentifier;
  void *v23;
  void *v24;

  v24 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "description");
  v3 = objc_claimAutoreleasedReturnValue();
  uniqueIdentifier = self->_uniqueIdentifier;
  v23 = (void *)v3;
  groupIdentifier = self->_groupIdentifier;
  clientIdentifier = self->_clientIdentifier;
  actions = self->_actions;
  typeIdentifier = self->_typeIdentifier;
  accountIdentifier = self->_accountIdentifier;
  title = self->_title;
  targetBundleIdentifier = self->_targetBundleIdentifier;
  notification = self->_notification;
  collectionIdentifier = self->_collectionIdentifier;
  representingBundlePath = self->_representingBundlePath;
  bundleIconName = self->_bundleIconName;
  informativeFooterText = self->_informativeFooterText;
  categoryIdentifier = self->_categoryIdentifier;
  extensionIdentifier = self->_extensionIdentifier;
  -[FLFollowUpItem _styleFlagsString](self, "_styleFlagsString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLFollowUpItem _priorityFlagString](self, "_priorityFlagString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("<%@: %p - UID:%@\nEID:%@\nTBI:%@\nClientID:%@\nGID:%@\nCollection:%@\nAccountID:%@\nTypeID:%@\ntitle:%@\nactions:%@\nnotification:%@\nrepresentingBundlePath:%@\nbundleIconName:%@\ninformativeFooterText:%@\nCategoryID:%@\nStyle:%@\nPriority:%@\nExpires:%@"), v23, self, uniqueIdentifier, extensionIdentifier, targetBundleIdentifier, clientIdentifier, groupIdentifier, collectionIdentifier, accountIdentifier, typeIdentifier, title, actions, notification, representingBundlePath, bundleIconName, informativeFooterText,
    categoryIdentifier,
    v11,
    v12,
    self->_expirationDate);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_styleFlagsString
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  -[FLFollowUpItem displayStyle](self, "displayStyle");
  v3 = (void *)MEMORY[0x1E0CB3940];
  if ((-[FLFollowUpItem displayStyle](self, "displayStyle") & 0x10) != 0)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if ((-[FLFollowUpItem displayStyle](self, "displayStyle") & 8) != 0)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if ((-[FLFollowUpItem displayStyle](self, "displayStyle") & 2) != 0)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("omit badge: %@, badge only: %@, zero action: %@"), v4, v5, v6);
}

- (id)_priorityFlagString
{
  if ((-[FLFollowUpItem displayStyle](self, "displayStyle") & 1) != 0)
    return CFSTR("High");
  if ((-[FLFollowUpItem displayStyle](self, "displayStyle") & 4) != 0)
    return CFSTR("Critical");
  return CFSTR("Default");
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (NSString)collectionIdentifier
{
  return self->_collectionIdentifier;
}

- (FLFollowUpNotification)notification
{
  return self->_notification;
}

- (BOOL)showInSettings
{
  return self->_showInSettings;
}

- (NSString)targetBundleIdentifier
{
  return self->_targetBundleIdentifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)informativeText
{
  return self->_informativeText;
}

- (NSString)informativeFooterText
{
  return self->_informativeFooterText;
}

- (NSString)representingBundlePath
{
  return self->_representingBundlePath;
}

- (NSString)bundleIconName
{
  return self->_bundleIconName;
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (NSString)categoryIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)extensionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)accountIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)typeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (NSArray)actions
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 152, 1);
}

- (BOOL)shouldPersistWhenActivated
{
  return self->_shouldPersistWhenActivated;
}

- (BOOL)shouldPersistWhenDismissed
{
  return self->_shouldPersistWhenDismissed;
}

- (NSString)delegateMachServiceName
{
  return self->_delegateMachServiceName;
}

- (void)setDelegateMachServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (BOOL)isHSA2LoginItem
{
  void *v2;
  void *v3;
  char v4;

  -[FLFollowUpItem userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FLHSA2LoginNotification"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isHSA2PasswordResetItem
{
  void *v2;
  void *v3;
  char v4;

  -[FLFollowUpItem userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FLHSA2PasswordResetNotification"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)_userInfoData
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1B8D53000, v0, v1, "%@: Failed to serialize userInfo for item %@ with error %@");
}

- (void)set_userInfoData:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1B8D53000, v0, v1, "%@: Failed to deserialize userInfo for item %@ with error %@");
}

@end
