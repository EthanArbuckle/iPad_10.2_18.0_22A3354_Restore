@implementation CLKComplicationDescriptor

- (CLKComplicationDescriptor)initWithIdentifier:(NSString *)identifier displayName:(NSString *)displayName supportedFamilies:(NSArray *)supportedFamilies
{
  NSString *v8;
  NSString *v9;
  NSArray *v10;
  CLKComplicationDescriptor *v11;
  uint64_t v12;
  NSString *v13;
  uint64_t v14;
  NSString *v15;
  uint64_t v16;
  NSArray *v17;
  uint64_t v18;
  NSLocale *locale;
  objc_super v21;

  v8 = identifier;
  v9 = displayName;
  v10 = supportedFamilies;
  v21.receiver = self;
  v21.super_class = (Class)CLKComplicationDescriptor;
  v11 = -[CLKComplicationDescriptor init](&v21, sel_init);
  if (v11)
  {
    v12 = -[NSString copy](v8, "copy");
    v13 = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v14 = -[NSString copy](v9, "copy");
    v15 = v11->_displayName;
    v11->_displayName = (NSString *)v14;

    v16 = -[NSArray copy](v10, "copy");
    v17 = v11->_supportedFamilies;
    v11->_supportedFamilies = (NSArray *)v16;

    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v18 = objc_claimAutoreleasedReturnValue();
    locale = v11->_locale;
    v11->_locale = (NSLocale *)v18;

  }
  return v11;
}

- (CLKComplicationDescriptor)initWithIdentifier:(NSString *)identifier displayName:(NSString *)displayName supportedFamilies:(NSArray *)supportedFamilies userInfo:(NSDictionary *)userInfo
{
  NSDictionary *v10;
  CLKComplicationDescriptor *v11;
  uint64_t v12;
  NSDictionary *v13;

  v10 = userInfo;
  v11 = -[CLKComplicationDescriptor initWithIdentifier:displayName:supportedFamilies:](self, "initWithIdentifier:displayName:supportedFamilies:", identifier, displayName, supportedFamilies);
  if (v11)
  {
    v12 = -[NSDictionary copy](v10, "copy");
    v13 = v11->_userInfo;
    v11->_userInfo = (NSDictionary *)v12;

  }
  return v11;
}

- (CLKComplicationDescriptor)initWithIdentifier:(NSString *)identifier displayName:(NSString *)displayName supportedFamilies:(NSArray *)supportedFamilies userActivity:(NSUserActivity *)userActivity
{
  NSUserActivity *v10;
  CLKComplicationDescriptor *v11;
  CLKUserActivity *v12;
  CLKUserActivity *clkUserActivity;

  v10 = userActivity;
  v11 = -[CLKComplicationDescriptor initWithIdentifier:displayName:supportedFamilies:](self, "initWithIdentifier:displayName:supportedFamilies:", identifier, displayName, supportedFamilies);
  if (v11)
  {
    v12 = -[CLKUserActivity initWithUserActivity:]([CLKUserActivity alloc], "initWithUserActivity:", v10);
    clkUserActivity = v11->_clkUserActivity;
    v11->_clkUserActivity = v12;

  }
  return v11;
}

+ (id)legacyComplicationDescriptor
{
  void *v3;
  void *v4;

  CLKAllComplicationFamilies();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "legacyComplicationDescriptorWithSupportedFamilies:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)legacyComplicationDescriptorWithSupportedFamilies:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:displayName:supportedFamilies:", CFSTR("CLKDefaultComplicationIdentifier"), &stru_24CBFCB28, v4);

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("[\n_identifier:%@ \n_displayName:%@ \n_supportedFamilies:%@ \n_locale:%@] "), self->_identifier, self->_displayName, self->_supportedFamilies, self->_locale);
}

- (NSUserActivity)userActivity
{
  return -[CLKUserActivity userActivity](self->_clkUserActivity, "userActivity");
}

- (BOOL)hasUserInfo
{
  void *v3;
  CLKUserActivity *clkUserActivity;

  -[CLKComplicationDescriptor identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("CLKDefaultComplicationIdentifier")) || self->_userInfo)
  {

    return 1;
  }
  clkUserActivity = self->_clkUserActivity;

  return clkUserActivity != 0;
}

- (void)validate
{
  NSArray *supportedFamilies;
  uint64_t v4;
  NSDictionary *userInfo;
  void *v6;
  CLKUserActivity *clkUserActivity;
  void *v8;
  void *v9;
  id v10;

  if (!self->_identifier)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("CLKComplicationDescriptor: identifier cannot be nil"));
  if (!self->_displayName)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("CLKComplicationDescriptor: displayName cannot be nil"));
  supportedFamilies = self->_supportedFamilies;
  if (supportedFamilies)
  {
    v4 = objc_opt_class();
    CLKValidateArray(supportedFamilies, v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("CLKComplicationDescriptor: supportedFamilies cannot be nil"));
  }
  userInfo = self->_userInfo;
  if (userInfo)
  {
    +[CLKComplicationDescriptor allowedDictionaryClasses](CLKComplicationDescriptor, "allowedDictionaryClasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CLKRecursivelyValidateDictionary(userInfo, v6);

  }
  clkUserActivity = self->_clkUserActivity;
  if (clkUserActivity)
  {
    -[CLKUserActivity userActivity](clkUserActivity, "userActivity");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CLKComplicationDescriptor allowedDictionaryClasses](CLKComplicationDescriptor, "allowedDictionaryClasses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CLKRecursivelyValidateDictionary(v8, v9);

  }
}

+ (id)allowedDictionaryClasses
{
  if (allowedDictionaryClasses_onceToken != -1)
    dispatch_once(&allowedDictionaryClasses_onceToken, &__block_literal_global_4);
  return (id)allowedDictionaryClasses__allowedDictionaryClasses;
}

void __53__CLKComplicationDescriptor_allowedDictionaryClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)allowedDictionaryClasses__allowedDictionaryClasses;
  allowedDictionaryClasses__allowedDictionaryClasses = v6;

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSArray copyWithZone:](self->_supportedFamilies, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = -[NSDictionary copyWithZone:](self->_userInfo, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  objc_storeStrong((id *)(v5 + 56), self->_clkUserActivity);
  *(_BYTE *)(v5 + 8) = self->_needsAppNotify;
  objc_storeStrong((id *)(v5 + 48), self->_locale);
  v14 = -[CLKWidgetComplicationDescriptor copy](self->_widgetDescriptor, "copy");
  v15 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CLKComplicationDescriptor identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualForIdNameAndLocale:(id)a3
{
  id v4;
  void *v5;
  NSString *identifier;
  uint64_t v7;
  id v8;
  id v9;
  NSString *displayName;
  id v11;
  id v12;
  NSLocale *locale;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0BE20], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  v7 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __55__CLKComplicationDescriptor_isEqualForIdNameAndLocale___block_invoke;
  v21[3] = &unk_24CBF9EC0;
  v8 = v4;
  v22 = v8;
  v9 = (id)objc_msgSend(v5, "appendString:counterpart:", identifier, v21);
  displayName = self->_displayName;
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __55__CLKComplicationDescriptor_isEqualForIdNameAndLocale___block_invoke_2;
  v19[3] = &unk_24CBF9EC0;
  v11 = v8;
  v20 = v11;
  v12 = (id)objc_msgSend(v5, "appendString:counterpart:", displayName, v19);
  locale = self->_locale;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __55__CLKComplicationDescriptor_isEqualForIdNameAndLocale___block_invoke_3;
  v17[3] = &unk_24CBF9EE8;
  v18 = v11;
  v14 = v11;
  v15 = (id)objc_msgSend(v5, "appendObject:counterpart:", locale, v17);
  LOBYTE(locale) = objc_msgSend(v5, "isEqual");

  return (char)locale;
}

id __55__CLKComplicationDescriptor_isEqualForIdNameAndLocale___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

id __55__CLKComplicationDescriptor_isEqualForIdNameAndLocale___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 24);
}

id __55__CLKComplicationDescriptor_isEqualForIdNameAndLocale___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 48);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CLKComplicationDescriptor identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLKComplicationDescriptor)initWithCoder:(id)a3
{
  id v4;
  CLKComplicationDescriptor *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *displayName;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *supportedFamilies;
  void *v15;
  uint64_t v16;
  NSDictionary *userInfo;
  void *v18;
  CLKUserActivity *v19;
  CLKUserActivity *clkUserActivity;
  void *v21;
  uint64_t v22;
  NSLocale *locale;
  uint64_t v24;
  CLKWidgetComplicationDescriptor *widgetDescriptor;
  CLKComplicationDescriptor *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CLKComplicationDescriptor;
  v5 = -[CLKComplicationDescriptor init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v8 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v8;

    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("supportedFamilies"));
    v13 = objc_claimAutoreleasedReturnValue();
    supportedFamilies = v5->_supportedFamilies;
    v5->_supportedFamilies = (NSArray *)v13;

    +[CLKComplicationDescriptor allowedDictionaryClasses](CLKComplicationDescriptor, "allowedDictionaryClasses");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("userInfo"));
    v16 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userActivity"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[CLKUserActivity initWithEncodedUserActivity:]([CLKUserActivity alloc], "initWithEncodedUserActivity:", v18);
    clkUserActivity = v5->_clkUserActivity;
    v5->_clkUserActivity = v19;

    v5->_needsAppNotify = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("needsAppNotify"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locale"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v21);
      v22 = objc_claimAutoreleasedReturnValue();
      locale = v5->_locale;
      v5->_locale = (NSLocale *)v22;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("widgetDescriptor"));
    v24 = objc_claimAutoreleasedReturnValue();
    widgetDescriptor = v5->_widgetDescriptor;
    v5->_widgetDescriptor = (CLKWidgetComplicationDescriptor *)v24;

    v26 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  void *v5;
  void *v6;
  id v7;

  identifier = self->_identifier;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_supportedFamilies, CFSTR("supportedFamilies"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_userInfo, CFSTR("userInfo"));
  -[CLKUserActivity encodedUserActivity](self->_clkUserActivity, "encodedUserActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("userActivity"));

  objc_msgSend(v7, "encodeBool:forKey:", self->_needsAppNotify, CFSTR("needsAppNotify"));
  -[NSLocale localeIdentifier](self->_locale, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("locale"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_widgetDescriptor, CFSTR("widgetDescriptor"));
}

- (id)JSONObjectRepresentation
{
  const __CFString *identifier;
  NSArray *supportedFamilies;
  void *v5;
  void *v6;
  NSString *displayName;
  NSDictionary *userInfo;
  CLKUserActivity *clkUserActivity;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  identifier = (const __CFString *)self->_identifier;
  if (!identifier)
    identifier = CFSTR("CLKDefaultComplicationIdentifier");
  v15[0] = CFSTR("identifier");
  v15[1] = CFSTR("supportedFamilies");
  supportedFamilies = self->_supportedFamilies;
  if (!supportedFamilies)
    supportedFamilies = (NSArray *)MEMORY[0x24BDBD1A8];
  v16[0] = identifier;
  v16[1] = supportedFamilies;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  displayName = self->_displayName;
  if (displayName)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", displayName, CFSTR("displayName"));
  userInfo = self->_userInfo;
  if (userInfo)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", userInfo, CFSTR("userInfo"));
  clkUserActivity = self->_clkUserActivity;
  if (clkUserActivity)
  {
    -[CLKUserActivity encodedUserActivity](clkUserActivity, "encodedUserActivity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("userActivity"));

  }
  if (self->_needsAppNotify)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("needsAppNotify"));

  }
  -[NSLocale localeIdentifier](self->_locale, "localeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("locale"));

  -[CLKWidgetComplicationDescriptor JSONObjectRepresentation](self->_widgetDescriptor, "JSONObjectRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("widgetDescriptor"));

  return v6;
}

- (CLKComplicationDescriptor)initWithJSONObjectRepresentation:(id)a3
{
  id v4;
  CLKComplicationDescriptor *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  __CFString *v9;
  NSString *v10;
  uint64_t v11;
  NSString *displayName;
  uint64_t v13;
  NSString *v14;
  uint64_t v15;
  NSArray *supportedFamilies;
  uint64_t v17;
  NSDictionary *userInfo;
  void *v19;
  CLKUserActivity *v20;
  CLKUserActivity *clkUserActivity;
  void *v22;
  void *v23;
  uint64_t v24;
  NSLocale *locale;
  void *v26;
  CLKWidgetComplicationDescriptor *v27;
  void *v28;
  uint64_t v29;
  CLKWidgetComplicationDescriptor *widgetDescriptor;
  CLKComplicationDescriptor *v31;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CLKComplicationDescriptor;
  v5 = -[CLKComplicationDescriptor init](&v33, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    if (!v5->_identifier)
      goto LABEL_6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDD0E20], CFSTR("CLKComplicationDescriptor identifier is disallowed class %@"), objc_opt_class());
    if (!v5->_identifier)
    {
LABEL_6:
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v8, "unsignedIntegerValue"));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v9 = v8;
        else
          v9 = CFSTR("CLKDefaultComplicationIdentifier");
      }
      v10 = v5->_identifier;
      v5->_identifier = &v9->isa;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("displayName"));
    v11 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v11;

    if (!v5->_displayName)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localizedDisplayName"));
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v5->_displayName;
      v5->_displayName = (NSString *)v13;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("supportedFamilies"));
    v15 = objc_claimAutoreleasedReturnValue();
    supportedFamilies = v5->_supportedFamilies;
    v5->_supportedFamilies = (NSArray *)v15;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userInfo"));
    v17 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v17;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userActivity"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[CLKUserActivity initWithEncodedUserActivity:]([CLKUserActivity alloc], "initWithEncodedUserActivity:", v19);
    clkUserActivity = v5->_clkUserActivity;
    v5->_clkUserActivity = v20;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("needsAppNotify"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_needsAppNotify = objc_msgSend(v22, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locale"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v23);
      v24 = objc_claimAutoreleasedReturnValue();
      locale = v5->_locale;
      v5->_locale = (NSLocale *)v24;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("widgetDescriptor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = [CLKWidgetComplicationDescriptor alloc];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("widgetDescriptor"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[CLKWidgetComplicationDescriptor initWithJSONObjectRepresentation:](v27, "initWithJSONObjectRepresentation:", v28);
      widgetDescriptor = v5->_widgetDescriptor;
      v5->_widgetDescriptor = (CLKWidgetComplicationDescriptor *)v29;

    }
    v31 = v5;

  }
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSArray)supportedFamilies
{
  return self->_supportedFamilies;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (BOOL)needsAppNotify
{
  return self->_needsAppNotify;
}

- (void)setNeedsAppNotify:(BOOL)a3
{
  self->_needsAppNotify = a3;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (CLKUserActivity)clkUserActivity
{
  return self->_clkUserActivity;
}

- (void)setClkUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_clkUserActivity, a3);
}

- (CLKWidgetComplicationDescriptor)widgetDescriptor
{
  return self->_widgetDescriptor;
}

- (void)setWidgetDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_widgetDescriptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetDescriptor, 0);
  objc_storeStrong((id *)&self->_clkUserActivity, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_supportedFamilies, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
