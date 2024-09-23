@implementation DOCUserInterfaceState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
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
  id v27;

  v27 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[DOCUserInterfaceState configurationDefaultsVersion](self, "configurationDefaultsVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "encodeObject:forKey:", v4, CFSTR("configurationDefaultsVersion"));

  -[DOCUserInterfaceState mostRecentlyVisitedEffectiveTabIdentifier](self, "mostRecentlyVisitedEffectiveTabIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DOCUserInterfaceState mostRecentlyVisitedEffectiveTabIdentifier](self, "mostRecentlyVisitedEffectiveTabIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v6, CFSTR("mostRecentlyVisitedEffectiveTabIdentifier"));

  }
  -[DOCUserInterfaceState mostRecentlyVisitedBrowsedState_Recents](self, "mostRecentlyVisitedBrowsedState_Recents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[DOCUserInterfaceState mostRecentlyVisitedBrowsedState_Recents](self, "mostRecentlyVisitedBrowsedState_Recents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v8, CFSTR("mostRecentlyVisitedBrowsedState_Recents"));

  }
  -[DOCUserInterfaceState mostRecentlyVisitedBrowsedState_Shared](self, "mostRecentlyVisitedBrowsedState_Shared");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[DOCUserInterfaceState mostRecentlyVisitedBrowsedState_Shared](self, "mostRecentlyVisitedBrowsedState_Shared");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v10, CFSTR("mostRecentlyVisitedBrowsedState_Shared"));

  }
  -[DOCUserInterfaceState mostRecentlyVisitedBrowsedState_FullBrowser](self, "mostRecentlyVisitedBrowsedState_FullBrowser");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[DOCUserInterfaceState mostRecentlyVisitedBrowsedState_FullBrowser](self, "mostRecentlyVisitedBrowsedState_FullBrowser");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v12, CFSTR("mostRecentlyVisitedBrowsedState_FullBrowser"));

  }
  -[DOCUserInterfaceState lastUsedOpenSaveLocation](self, "lastUsedOpenSaveLocation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[DOCUserInterfaceState lastUsedOpenSaveLocation](self, "lastUsedOpenSaveLocation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v14, CFSTR("lastUsedOpenSaveLocation"));

  }
  -[DOCUserInterfaceState displayModes](self, "displayModes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[DOCUserInterfaceState displayModes](self, "displayModes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v16, CFSTR("displayModes"));

  }
  -[DOCUserInterfaceState sortingMode](self, "sortingMode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[DOCUserInterfaceState sortingMode](self, "sortingMode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v18, CFSTR("sortingMode"));

  }
  -[DOCUserInterfaceState groupingBehaviors](self, "groupingBehaviors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[DOCUserInterfaceState groupingBehaviors](self, "groupingBehaviors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v20, CFSTR("groupingBehaviors"));

  }
  -[DOCUserInterfaceState userPrefersTiledSidebarHidden](self, "userPrefersTiledSidebarHidden");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[DOCUserInterfaceState userPrefersTiledSidebarHidden](self, "userPrefersTiledSidebarHidden");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v22, CFSTR("userPrefersTiledSidebarHidden"));

  }
  -[DOCUserInterfaceState lastUpdatedDate](self, "lastUpdatedDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[DOCUserInterfaceState lastUpdatedDate](self, "lastUpdatedDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v24, CFSTR("lastUpdatedDate"));

  }
  -[DOCUserInterfaceState sizeSetting](self, "sizeSetting");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[DOCUserInterfaceState sizeSetting](self, "sizeSetting");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v26, CFSTR("sizeSetting"));

  }
}

- (NSMutableDictionary)groupingBehaviors
{
  return self->_groupingBehaviors;
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (NSMutableDictionary)displayModes
{
  return self->_displayModes;
}

- (NSDictionary)sortingMode
{
  return self->_sortingMode;
}

- (NSNumber)userPrefersTiledSidebarHidden
{
  return self->_userPrefersTiledSidebarHidden;
}

- (NSData)lastUsedOpenSaveLocation
{
  return self->_lastUsedOpenSaveLocation;
}

- (DOCUserInterfaceState)initWithCoder:(id)a3
{
  id v4;
  DOCUserInterfaceState *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSMutableDictionary *displayModes;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSMutableDictionary *groupingBehaviors;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSMutableDictionary *v35;
  uint64_t v36;
  NSMutableDictionary *v37;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)DOCUserInterfaceState;
  v5 = -[DOCUserInterfaceState init](&v39, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configurationDefaultsVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCUserInterfaceState setConfigurationDefaultsVersion:](v5, "setConfigurationDefaultsVersion:", objc_msgSend(v6, "unsignedIntegerValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mostRecentlyVisitedEffectiveTabIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCUserInterfaceState setMostRecentlyVisitedEffectiveTabIdentifier:](v5, "setMostRecentlyVisitedEffectiveTabIdentifier:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mostRecentlyVisitedBrowsedState_Recents"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCUserInterfaceState setMostRecentlyVisitedBrowsedState_Recents:](v5, "setMostRecentlyVisitedBrowsedState_Recents:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mostRecentlyVisitedBrowsedState_Shared"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCUserInterfaceState setMostRecentlyVisitedBrowsedState_Shared:](v5, "setMostRecentlyVisitedBrowsedState_Shared:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mostRecentlyVisitedBrowsedState_FullBrowser"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCUserInterfaceState setMostRecentlyVisitedBrowsedState_FullBrowser:](v5, "setMostRecentlyVisitedBrowsedState_FullBrowser:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUsedOpenSaveLocation"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCUserInterfaceState setLastUsedOpenSaveLocation:](v5, "setLastUsedOpenSaveLocation:", v11);

    v12 = (void *)MEMORY[0x24BDBCF20];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("displayModes"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "mutableCopy");
    displayModes = v5->_displayModes;
    v5->_displayModes = (NSMutableDictionary *)v17;

    v19 = (void *)MEMORY[0x24BDBCF20];
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("sortingMode"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCUserInterfaceState setSortingMode:](v5, "setSortingMode:", v23);

    v24 = (void *)MEMORY[0x24BDBCF20];
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    objc_msgSend(v24, "setWithObjects:", v25, v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("groupingBehaviors"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "mutableCopy");
    groupingBehaviors = v5->_groupingBehaviors;
    v5->_groupingBehaviors = (NSMutableDictionary *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userPrefersTiledSidebarHidden"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCUserInterfaceState setUserPrefersTiledSidebarHidden:](v5, "setUserPrefersTiledSidebarHidden:", v31);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdatedDate"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCUserInterfaceState setLastUpdatedDate:](v5, "setLastUpdatedDate:", v32);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sizeSetting"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCUserInterfaceState setSizeSetting:](v5, "setSizeSetting:", v33);

    if (!v5->_groupingBehaviors)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = v5->_groupingBehaviors;
      v5->_groupingBehaviors = (NSMutableDictionary *)v34;

    }
    if (!v5->_displayModes)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = v5->_displayModes;
      v5->_displayModes = (NSMutableDictionary *)v36;

    }
  }

  return v5;
}

- (void)setUserPrefersTiledSidebarHidden:(id)a3
{
  objc_storeStrong((id *)&self->_userPrefersTiledSidebarHidden, a3);
}

- (void)setSortingMode:(id)a3
{
  objc_storeStrong((id *)&self->_sortingMode, a3);
}

- (void)setLastUsedOpenSaveLocation:(id)a3
{
  objc_storeStrong((id *)&self->_lastUsedOpenSaveLocation, a3);
}

- (void)setLastUpdatedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdatedDate, a3);
}

- (void)bumpLastUpdatedDate
{
  NSDate *v3;
  NSDate *lastUpdatedDate;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastUpdatedDate = self->_lastUpdatedDate;
  self->_lastUpdatedDate = v3;

}

- (DOCUserInterfaceState)initWithDefaultSettingsForConfiguration:(id)a3
{
  id v4;
  DOCUserInterfaceState *v5;
  uint64_t v6;
  NSDate *lastUpdatedDate;
  uint64_t v8;
  NSMutableDictionary *groupingBehaviors;
  uint64_t v10;
  NSMutableDictionary *displayModes;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DOCUserInterfaceState;
  v5 = -[DOCUserInterfaceState init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = objc_claimAutoreleasedReturnValue();
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v6;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    groupingBehaviors = v5->_groupingBehaviors;
    v5->_groupingBehaviors = (NSMutableDictionary *)v8;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    displayModes = v5->_displayModes;
    v5->_displayModes = (NSMutableDictionary *)v10;

    v5->_configurationDefaultsVersion = 0;
    -[DOCUserInterfaceState upgradeDefaultSettingsIfNecessaryForConfiguration:](v5, "upgradeDefaultSettingsIfNecessaryForConfiguration:", v4);
  }

  return v5;
}

+ (id)stateWithDefaultSettingsForConfiguration:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDefaultSettingsForConfiguration:", v4);

  return v5;
}

+ (id)unarchivedFromData:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v14;

  v7 = a4;
  v8 = (void *)MEMORY[0x24BDD1620];
  v9 = a3;
  v14 = 0;
  objc_msgSend(v8, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v14;
  if (!v10)
  {
    v12 = docStateStoreHandle;
    if (!docStateStoreHandle)
    {
      DOCInitLogging();
      v12 = docStateStoreHandle;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      +[DOCUserInterfaceState unarchivedFromData:configuration:error:].cold.1((uint64_t)v11, v12);
      if (!a5)
        goto LABEL_8;
    }
    else if (!a5)
    {
      goto LABEL_8;
    }
    *a5 = objc_retainAutorelease(v11);
    goto LABEL_8;
  }
  objc_msgSend(v10, "upgradeDefaultSettingsIfNecessaryForConfiguration:", v7);
LABEL_8:

  return v10;
}

- (void)upgradeDefaultSettingsIfNecessaryForConfiguration:(id)a3
{
  NSNumber *userPrefersTiledSidebarHidden;

  if (!self->_configurationDefaultsVersion && objc_msgSend(a3, "isInUIPDocumentLanding"))
  {
    userPrefersTiledSidebarHidden = self->_userPrefersTiledSidebarHidden;
    self->_userPrefersTiledSidebarHidden = (NSNumber *)MEMORY[0x24BDBD1C8];

  }
  self->_configurationDefaultsVersion = 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)DOCUserInterfaceState;
  -[DOCUserInterfaceState description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCUserInterfaceState lastUpdatedDate](self, "lastUpdatedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCUserInterfaceState userPrefersTiledSidebarHidden](self, "userPrefersTiledSidebarHidden");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ lastUpdatedDate=\"%@\", userPrefersTiledSidebarHidden=(%@)"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  DOCUserInterfaceState *v4;
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
  uint64_t v16;
  NSMutableDictionary *displayModes;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSMutableDictionary *groupingBehaviors;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v4 = -[DOCUserInterfaceState init](+[DOCUserInterfaceState allocWithZone:](DOCUserInterfaceState, "allocWithZone:", a3), "init");
  if (v4)
  {
    -[DOCUserInterfaceState setConfigurationDefaultsVersion:](v4, "setConfigurationDefaultsVersion:", -[DOCUserInterfaceState configurationDefaultsVersion](self, "configurationDefaultsVersion"));
    -[DOCUserInterfaceState mostRecentlyVisitedEffectiveTabIdentifier](self, "mostRecentlyVisitedEffectiveTabIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    -[DOCUserInterfaceState setMostRecentlyVisitedEffectiveTabIdentifier:](v4, "setMostRecentlyVisitedEffectiveTabIdentifier:", v6);

    -[DOCUserInterfaceState mostRecentlyVisitedBrowsedState_Recents](self, "mostRecentlyVisitedBrowsedState_Recents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    -[DOCUserInterfaceState setMostRecentlyVisitedBrowsedState_Recents:](v4, "setMostRecentlyVisitedBrowsedState_Recents:", v8);

    -[DOCUserInterfaceState mostRecentlyVisitedBrowsedState_Shared](self, "mostRecentlyVisitedBrowsedState_Shared");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    -[DOCUserInterfaceState setMostRecentlyVisitedBrowsedState_Shared:](v4, "setMostRecentlyVisitedBrowsedState_Shared:", v10);

    -[DOCUserInterfaceState mostRecentlyVisitedBrowsedState_FullBrowser](self, "mostRecentlyVisitedBrowsedState_FullBrowser");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    -[DOCUserInterfaceState setMostRecentlyVisitedBrowsedState_FullBrowser:](v4, "setMostRecentlyVisitedBrowsedState_FullBrowser:", v12);

    -[DOCUserInterfaceState lastUsedOpenSaveLocation](self, "lastUsedOpenSaveLocation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    -[DOCUserInterfaceState setLastUsedOpenSaveLocation:](v4, "setLastUsedOpenSaveLocation:", v14);

    -[DOCUserInterfaceState displayModes](self, "displayModes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "mutableCopy");
    displayModes = v4->_displayModes;
    v4->_displayModes = (NSMutableDictionary *)v16;

    -[DOCUserInterfaceState sortingMode](self, "sortingMode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");
    -[DOCUserInterfaceState setSortingMode:](v4, "setSortingMode:", v19);

    -[DOCUserInterfaceState groupingBehaviors](self, "groupingBehaviors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "mutableCopy");
    groupingBehaviors = v4->_groupingBehaviors;
    v4->_groupingBehaviors = (NSMutableDictionary *)v21;

    -[DOCUserInterfaceState userPrefersTiledSidebarHidden](self, "userPrefersTiledSidebarHidden");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "copy");
    -[DOCUserInterfaceState setUserPrefersTiledSidebarHidden:](v4, "setUserPrefersTiledSidebarHidden:", v24);

    -[DOCUserInterfaceState lastUpdatedDate](self, "lastUpdatedDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "copy");
    -[DOCUserInterfaceState setLastUpdatedDate:](v4, "setLastUpdatedDate:", v26);

    -[DOCUserInterfaceState sizeSetting](self, "sizeSetting");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "copy");
    -[DOCUserInterfaceState setSizeSetting:](v4, "setSizeSetting:", v28);

  }
  return v4;
}

- (NSString)mostRecentlyVisitedEffectiveTabIdentifier
{
  return self->_mostRecentlyVisitedEffectiveTabIdentifier;
}

- (void)setMostRecentlyVisitedEffectiveTabIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentlyVisitedEffectiveTabIdentifier, a3);
}

- (NSData)mostRecentlyVisitedBrowsedState_Recents
{
  return self->_mostRecentlyVisitedBrowsedState_Recents;
}

- (void)setMostRecentlyVisitedBrowsedState_Recents:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentlyVisitedBrowsedState_Recents, a3);
}

- (NSData)mostRecentlyVisitedBrowsedState_Shared
{
  return self->_mostRecentlyVisitedBrowsedState_Shared;
}

- (void)setMostRecentlyVisitedBrowsedState_Shared:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentlyVisitedBrowsedState_Shared, a3);
}

- (NSData)mostRecentlyVisitedBrowsedState_FullBrowser
{
  return self->_mostRecentlyVisitedBrowsedState_FullBrowser;
}

- (void)setMostRecentlyVisitedBrowsedState_FullBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentlyVisitedBrowsedState_FullBrowser, a3);
}

- (NSNumber)sizeSetting
{
  return self->_sizeSetting;
}

- (void)setSizeSetting:(id)a3
{
  objc_storeStrong((id *)&self->_sizeSetting, a3);
}

- (NSNumber)isInUIPDocumentLanding
{
  return self->_isInUIPDocumentLanding;
}

- (void)setIsInUIPDocumentLanding:(id)a3
{
  objc_storeStrong((id *)&self->_isInUIPDocumentLanding, a3);
}

- (unint64_t)configurationDefaultsVersion
{
  return self->_configurationDefaultsVersion;
}

- (void)setConfigurationDefaultsVersion:(unint64_t)a3
{
  self->_configurationDefaultsVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isInUIPDocumentLanding, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_userPrefersTiledSidebarHidden, 0);
  objc_storeStrong((id *)&self->_displayModes, 0);
  objc_storeStrong((id *)&self->_groupingBehaviors, 0);
  objc_storeStrong((id *)&self->_sortingMode, 0);
  objc_storeStrong((id *)&self->_sizeSetting, 0);
  objc_storeStrong((id *)&self->_lastUsedOpenSaveLocation, 0);
  objc_storeStrong((id *)&self->_mostRecentlyVisitedBrowsedState_FullBrowser, 0);
  objc_storeStrong((id *)&self->_mostRecentlyVisitedBrowsedState_Shared, 0);
  objc_storeStrong((id *)&self->_mostRecentlyVisitedBrowsedState_Recents, 0);
  objc_storeStrong((id *)&self->_mostRecentlyVisitedEffectiveTabIdentifier, 0);
}

+ (void)unarchivedFromData:(uint64_t)a1 configuration:(NSObject *)a2 error:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "+[DOCUserInterfaceState unarchivedFromData:configuration:error:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_2090A2000, a2, OS_LOG_TYPE_ERROR, "%s: Unable to unarchive most recent interface state. Error: %@", (uint8_t *)&v2, 0x16u);
}

@end
