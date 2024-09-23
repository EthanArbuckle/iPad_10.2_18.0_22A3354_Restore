@implementation NARApplication

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NARApplication)initWithCoder:(id)a3
{
  id v4;
  NARApplication *v5;
  uint64_t v6;
  NSDictionary *infoPlist;
  uint64_t v8;
  NSDictionary *localizedStrings;
  uint64_t v10;
  NSDictionary *iTunesPlistStrings;
  void *v12;
  uint64_t v13;
  NSString *launchServicesBundleType;
  uint64_t v15;
  NARApplicationState *appState;
  uint64_t v17;
  NSArray *appTags;
  void *v19;
  void *v20;
  char v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NARApplication;
  v5 = -[NARApplication init](&v23, sel_init);
  if (v5)
  {
    if (initWithCoder__onceToken != -1)
      dispatch_once(&initWithCoder__onceToken, &__block_literal_global_0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__plistClasses, CFSTR("infoPlist"));
    v6 = objc_claimAutoreleasedReturnValue();
    infoPlist = v5->_infoPlist;
    v5->_infoPlist = (NSDictionary *)v6;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__plistClasses, CFSTR("localizedStrings"));
    v8 = objc_claimAutoreleasedReturnValue();
    localizedStrings = v5->_localizedStrings;
    v5->_localizedStrings = (NSDictionary *)v8;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__plistClasses, CFSTR("iTunesPlistStrings"));
    v10 = objc_claimAutoreleasedReturnValue();
    iTunesPlistStrings = v5->_iTunesPlistStrings;
    v5->_iTunesPlistStrings = (NSDictionary *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sequenceNumber"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sequenceNumber = objc_msgSend(v12, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("launchServicesBundleType"));
    v13 = objc_claimAutoreleasedReturnValue();
    launchServicesBundleType = v5->_launchServicesBundleType;
    v5->_launchServicesBundleType = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appState"));
    v15 = objc_claimAutoreleasedReturnValue();
    appState = v5->_appState;
    v5->_appState = (NARApplicationState *)v15;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__plistClasses, CFSTR("appTags"));
    v17 = objc_claimAutoreleasedReturnValue();
    appTags = v5->_appTags;
    v5->_appTags = (NSArray *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supportsForegroundApplication"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
      v21 = objc_msgSend(v19, "BOOLValue");
    else
      v21 = 1;
    v5->_supportsForegroundApplication = v21;

  }
  return v5;
}

void __32__NARApplication_initWithCoder___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)initWithCoder__plistClasses;
  initWithCoder__plistClasses = v7;

}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *infoPlist;
  id v5;
  void *v6;
  id v7;

  infoPlist = self->_infoPlist;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", infoPlist, CFSTR("infoPlist"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedStrings, CFSTR("localizedStrings"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iTunesPlistStrings, CFSTR("iTunesPlistStrings"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_sequenceNumber);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("sequenceNumber"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_launchServicesBundleType, CFSTR("launchServicesBundleType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appState, CFSTR("appState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appTags, CFSTR("appTags"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_supportsForegroundApplication);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("supportsForegroundApplication"));

}

- (NSString)applicationIdentifier
{
  void *v2;
  void *v3;

  -[NARApplication infoPlist](self, "infoPlist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDBD288]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)bundleName
{
  void *v2;
  void *v3;

  -[NARApplication infoPlist](self, "infoPlist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDBD298]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDictionary)localizedBundleNames
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NARApplication localizedStrings](self, "localizedStrings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__NARApplication_localizedBundleNames__block_invoke;
  v7[3] = &unk_24E06CD18;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

  return (NSDictionary *)v5;
}

void __38__NARApplication_localizedBundleNames__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BDBD298]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

- (NSString)bundleVersion
{
  void *v2;
  void *v3;

  -[NARApplication infoPlist](self, "infoPlist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDBD2A0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)localizedDisplayName
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[NARApplication localizedDisplayNames](self, "localizedDisplayNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferredLocalizations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "objectForKeyedSubscript:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v7 = (void *)v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "languageCode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "objectForKeyedSubscript:", v13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        -[NARApplication infoPlist](self, "infoPlist");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDBD1D0]);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v7)
        {
          -[NARApplication bundleName](self, "bundleName");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v7)
          {
            -[NARApplication applicationIdentifier](self, "applicationIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "componentsSeparatedByString:", CFSTR("."));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "lastObject");
            v7 = (void *)objc_claimAutoreleasedReturnValue();

          }
        }
      }

    }
  }

  return (NSString *)v7;
}

- (NSDictionary)localizedDisplayNames
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NARApplication localizedStrings](self, "localizedStrings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__NARApplication_localizedDisplayNames__block_invoke;
  v7[3] = &unk_24E06CD18;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

  return (NSDictionary *)v5;
}

void __39__NARApplication_localizedDisplayNames__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BDBD1D0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

- (NSString)vendorName
{
  void *v2;
  void *v3;

  -[NARApplication iTunesPlistStrings](self, "iTunesPlistStrings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("artistName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)itemName
{
  void *v2;
  void *v3;

  -[NARApplication iTunesPlistStrings](self, "iTunesPlistStrings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("itemName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)supportedSchemes
{
  void *v2;
  void *v3;

  -[NARApplication infoPlist](self, "infoPlist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDBD1E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)isHidden
{
  return -[NSArray containsObject:](self->_appTags, "containsObject:", CFSTR("hidden"));
}

- (NSArray)localizations
{
  void *v2;
  void *v3;

  -[NARApplication localizedStrings](self, "localizedStrings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)objectForInfoDictionaryKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NARApplication infoPlist](self, "infoPlist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)objectForInfoDictionaryKey:(id)a3 localization:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[NARApplication localizedStrings](self, "localizedStrings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NARApplication;
  -[NARApplication description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NARApplication applicationIdentifier](self, "applicationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[NARApplication supportsForegroundApplication](self, "supportsForegroundApplication"))
  {
    objc_msgSend(v5, "stringByAppendingString:", CFSTR(" <HEADLESS>"));
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return v5;
}

- (NARGlance)glance
{
  return 0;
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  self->_sequenceNumber = a3;
}

- (NSString)launchServicesBundleType
{
  return self->_launchServicesBundleType;
}

- (void)setLaunchServicesBundleType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)parentApplicationBundleIdentifier
{
  return self->_parentApplicationBundleIdentifier;
}

- (NSArray)appTags
{
  return self->_appTags;
}

- (void)setAppTags:(id)a3
{
  objc_storeStrong((id *)&self->_appTags, a3);
}

- (BOOL)supportsForegroundApplication
{
  return self->_supportsForegroundApplication;
}

- (void)setSupportsForegroundApplication:(BOOL)a3
{
  self->_supportsForegroundApplication = a3;
}

- (NARApplicationState)appState
{
  return self->_appState;
}

- (void)setAppState:(id)a3
{
  objc_storeStrong((id *)&self->_appState, a3);
}

- (NSDictionary)infoPlist
{
  return self->_infoPlist;
}

- (void)setInfoPlist:(id)a3
{
  objc_storeStrong((id *)&self->_infoPlist, a3);
}

- (NSDictionary)localizedStrings
{
  return self->_localizedStrings;
}

- (void)setLocalizedStrings:(id)a3
{
  objc_storeStrong((id *)&self->_localizedStrings, a3);
}

- (NSDictionary)iTunesPlistStrings
{
  return self->_iTunesPlistStrings;
}

- (void)setITunesPlistStrings:(id)a3
{
  objc_storeStrong((id *)&self->_iTunesPlistStrings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iTunesPlistStrings, 0);
  objc_storeStrong((id *)&self->_localizedStrings, 0);
  objc_storeStrong((id *)&self->_infoPlist, 0);
  objc_storeStrong((id *)&self->_appState, 0);
  objc_storeStrong((id *)&self->_appTags, 0);
  objc_storeStrong((id *)&self->_parentApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_launchServicesBundleType, 0);
}

@end
