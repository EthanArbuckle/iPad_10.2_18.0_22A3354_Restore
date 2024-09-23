@implementation WFContentAttribution

- (WFContentAttribution)initWithDisclosureLevel:(unint64_t)a3 origin:(id)a4 disclosureWarnings:(id)a5 originalItemIdentifiers:(id)a6 count:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  WFContentAttribution *v17;
  WFContentAttribution *v18;
  uint64_t v19;
  NSOrderedSet *disclosureWarnings;
  NSOrderedSet *v21;
  NSOrderedSet *privateItemIdentifiers;
  WFContentAttribution *v23;
  objc_super v25;
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!v13)
  {
    getWFSecurityLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[WFContentAttribution initWithDisclosureLevel:origin:disclosureWarnings:originalItemIdentifiers:count:]";
      _os_log_impl(&dword_20BBAD000, v16, OS_LOG_TYPE_FAULT, "%s WFContentAttribution being created with a nil origin!", buf, 0xCu);
    }

  }
  v25.receiver = self;
  v25.super_class = (Class)WFContentAttribution;
  v17 = -[WFContentAttribution init](&v25, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_disclosureLevel = a3;
    objc_storeStrong((id *)&v17->_origin, a4);
    v18->_count = a7;
    objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v14);
    v19 = objc_claimAutoreleasedReturnValue();
    disclosureWarnings = v18->_disclosureWarnings;
    v18->_disclosureWarnings = (NSOrderedSet *)v19;

    if (a3 == 1)
    {
      v21 = (NSOrderedSet *)v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF00], "orderedSet");
      v21 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
    }
    privateItemIdentifiers = v18->_privateItemIdentifiers;
    v18->_privateItemIdentifiers = v21;

    v23 = v18;
  }

  return v18;
}

- (id)attributionByReplacingAccountWithAppOrigin
{
  void *v3;
  char isKindOfClass;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  WFContentAttribution *v11;

  -[WFContentAttribution origin](self, "origin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[WFContentAttribution origin](self, "origin");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WFContentAttribution disclosureLevel](self, "disclosureLevel");
    objc_msgSend(v5, "appContentLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentAttribution disclosureWarnings](self, "disclosureWarnings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentAttribution privateItemIdentifiers](self, "privateItemIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFContentAttribution attributionWithDisclosureLevel:origin:disclosureWarnings:originalItemIdentifiers:count:](WFContentAttribution, "attributionWithDisclosureLevel:origin:disclosureWarnings:originalItemIdentifiers:count:", v6, v7, v9, v10, -[WFContentAttribution count](self, "count"));
    v11 = (WFContentAttribution *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = self;
  }
  return v11;
}

- (id)attributionByUpdatingItemsCount:(unint64_t)a3
{
  WFContentAttribution *v5;
  WFContentAttribution *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (-[WFContentAttribution count](self, "count") == a3)
  {
    v5 = self;
  }
  else
  {
    v6 = [WFContentAttribution alloc];
    v7 = -[WFContentAttribution disclosureLevel](self, "disclosureLevel");
    -[WFContentAttribution origin](self, "origin");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentAttribution disclosureWarnings](self, "disclosureWarnings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentAttribution privateItemIdentifiers](self, "privateItemIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[WFContentAttribution initWithDisclosureLevel:origin:disclosureWarnings:originalItemIdentifiers:count:](v6, "initWithDisclosureLevel:origin:disclosureWarnings:originalItemIdentifiers:count:", v7, v8, v10, v11, a3);

  }
  return v5;
}

- (id)identifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[WFContentAttribution origin](self, "origin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.Shortcuts.attribution_%@_%lu"), v5, -[WFContentAttribution disclosureLevel](self, "disclosureLevel"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)count
{
  unint64_t result;
  void *v4;

  result = self->_count;
  if (!result)
  {
    -[WFContentAttribution privateItemIdentifiers](self, "privateItemIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_count = objc_msgSend(v4, "count");

    return self->_count;
  }
  return result;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  v3 = -[WFContentAttribution disclosureLevel](self, "disclosureLevel");
  v4 = -[WFContentAttribution count](self, "count");
  -[WFContentAttribution origin](self, "origin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[WFContentAttribution privateItemIdentifiers](self, "privateItemIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v3 ^ v4 ^ v6 ^ objc_msgSend(v7, "hash") ^ 0x9E3779B97F4A7C15;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  WFContentAttribution *v4;
  WFContentAttribution *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (WFContentAttribution *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else if (-[WFContentAttribution isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[WFContentAttribution disclosureLevel](self, "disclosureLevel");
    if (v6 == -[WFContentAttribution disclosureLevel](v5, "disclosureLevel"))
    {
      -[WFContentAttribution origin](self, "origin");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFContentAttribution origin](v5, "origin");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8)
        && (v9 = -[WFContentAttribution count](self, "count"), v9 == -[WFContentAttribution count](v5, "count")))
      {
        -[WFContentAttribution privateItemIdentifiers](self, "privateItemIdentifiers");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFContentAttribution privateItemIdentifiers](v5, "privateItemIdentifiers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToOrderedSet:", v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (WFContentAttribution)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  WFContentAttribution *v17;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("disclosureLevel"));
  +[WFDisclosureWarning allDisclosureWarningClasses](WFDisclosureWarning, "allDisclosureWarningClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setByAddingObject:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("disclosureWarnings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("privateItemIdentifiers"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFContentLocation allContentLocationClasses](WFContentLocation, "allContentLocationClasses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("origin"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("count"));
  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[WFContentAttribution initWithDisclosureLevel:origin:disclosureWarnings:originalItemIdentifiers:count:](self, "initWithDisclosureLevel:origin:disclosureWarnings:originalItemIdentifiers:count:", v5, v14, v8, v16, v15);

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "encodeInteger:forKey:", -[WFContentAttribution disclosureLevel](self, "disclosureLevel"), CFSTR("disclosureLevel"));
  -[WFContentAttribution disclosureWarnings](self, "disclosureWarnings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("disclosureWarnings"));

  -[WFContentAttribution origin](self, "origin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("origin"));

  -[WFContentAttribution privateItemIdentifiers](self, "privateItemIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("privateItemIdentifiers"));

  objc_msgSend(v9, "encodeInteger:forKey:", -[WFContentAttribution count](self, "count"), CFSTR("count"));
}

- (id)wfSerializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[3];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[WFContentAttribution origin](self, "origin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wfSerializedRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDBCED8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[WFContentAttribution disclosureLevel](self, "disclosureLevel", CFSTR("disclosureLevel")));
    v6 = objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    v13[1] = v4;
    v12[1] = CFSTR("origin");
    v12[2] = CFSTR("count");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[WFContentAttribution count](self, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryWithDictionary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    getWFSecurityLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      -[WFContentAttribution origin](self, "origin");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v15 = "-[WFContentAttribution wfSerializedRepresentation]";
      v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_20BBAD000, v6, OS_LOG_TYPE_FAULT, "%s Could not serialize origin: %{public}@", buf, 0x16u);

    }
    v9 = 0;
  }

  return v9;
}

- (id)wfSerializedRepresentationWithPrivateItemIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WFContentAttribution wfSerializedRepresentation](self, "wfSerializedRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[WFContentAttribution privateItemIdentifiers](self, "privateItemIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("privateItemIdentifiers"));

  return v4;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentAttribution origin](self, "origin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, origin: %@, count: %lu>"), v5, self, v7, -[WFContentAttribution count](self, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (unint64_t)disclosureLevel
{
  return self->_disclosureLevel;
}

- (WFContentLocation)origin
{
  return self->_origin;
}

- (NSOrderedSet)privateItemIdentifiers
{
  return self->_privateItemIdentifiers;
}

- (void)setPrivateItemIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_privateItemIdentifiers, a3);
}

- (NSOrderedSet)disclosureWarnings
{
  return self->_disclosureWarnings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disclosureWarnings, 0);
  objc_storeStrong((id *)&self->_privateItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_origin, 0);
}

+ (id)attributionWithDisclosureLevel:(unint64_t)a3 origin:(id)a4 originalItemIdentifiers:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = objc_alloc((Class)a1);
  v11 = objc_msgSend(v8, "count");
  v12 = (void *)objc_msgSend(v10, "initWithDisclosureLevel:origin:disclosureWarnings:originalItemIdentifiers:count:", a3, v9, MEMORY[0x24BDBD1A8], v8, v11);

  return v12;
}

+ (id)attributionWithDisclosureLevel:(unint64_t)a3 origin:(id)a4 disclosureWarnings:(id)a5 originalItemIdentifiers:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDisclosureLevel:origin:disclosureWarnings:originalItemIdentifiers:count:", a3, v12, v11, v10, objc_msgSend(v10, "count"));

  return v13;
}

+ (id)attributionWithDisclosureLevel:(unint64_t)a3 origin:(id)a4 originalItemIdentifier:(id)a5
{
  return (id)objc_msgSend(a1, "attributionWithDisclosureLevel:origin:disclosureWarnings:originalItemIdentifier:", a3, a4, MEMORY[0x24BDBD1A8], a5);
}

+ (id)attributionWithDisclosureLevel:(unint64_t)a3 origin:(id)a4 disclosureWarnings:(id)a5 originalItemIdentifier:(id)a6
{
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v10 = (void *)MEMORY[0x24BDBCF00];
  v11 = a5;
  v12 = a4;
  if (a6)
  {
    objc_msgSend(v10, "orderedSetWithObject:", a6);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_opt_new();
  }
  v14 = (void *)v13;
  objc_msgSend(a1, "attributionWithDisclosureLevel:origin:disclosureWarnings:originalItemIdentifiers:", a3, v12, v11, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)shortcutsAppAttribution
{
  return (id)objc_msgSend(a1, "shortcutsAppAttributionWithDisclosureLevel:", 0);
}

+ (id)shortcutsAppAttributionWithDisclosureLevel:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = objc_alloc(MEMORY[0x24BDD9BD0]);
  v6 = (void *)objc_msgSend(v5, "initWithBundleIdentifier:", *MEMORY[0x24BEC17D8]);
  objc_msgSend(MEMORY[0x24BDD9BF0], "sharedResolver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resolvedAppMatchingDescriptor:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFAppContentLocation locationWithAppDescriptor:](WFAppContentLocation, "locationWithAppDescriptor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  objc_msgSend(a1, "attributionWithDisclosureLevel:origin:originalItemIdentifiers:", a3, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("disclosureLevel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(v4, "valueForKey:", CFSTR("origin"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentLocation objectWithWFSerializedRepresentation:](WFContentLocation, "objectWithWFSerializedRepresentation:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  if (v8)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("privateItemIdentifiers"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF00]), "initWithArray:", v11);
    else
      v12 = 0;
    v15 = objc_alloc((Class)a1);
    v14 = (void *)objc_msgSend(v15, "initWithDisclosureLevel:origin:disclosureWarnings:originalItemIdentifiers:count:", v6, v8, MEMORY[0x24BDBD1A8], v12, v10);

  }
  else
  {
    getWFSecurityLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315138;
      v18 = "+[WFContentAttribution objectWithWFSerializedRepresentation:]";
      _os_log_impl(&dword_20BBAD000, v13, OS_LOG_TYPE_ERROR, "%s Attempted to initialize a serialized WFContentAttribution with nil origin", (uint8_t *)&v17, 0xCu);
    }

    v14 = 0;
  }

  return v14;
}

+ (id)attributionWithAppDescriptor:(id)a3 disclosureLevel:(unint64_t)a4
{
  void *v6;
  void *v7;

  +[WFAppContentLocation locationWithAppDescriptor:](WFAppContentLocation, "locationWithAppDescriptor:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "attributionWithDisclosureLevel:origin:originalItemIdentifier:", a4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)attributionWithAppDescriptor:(id)a3 accountIdentifier:(id)a4 disclosureLevel:(unint64_t)a5 managedLevel:(unint64_t)a6
{
  void *v8;
  void *v9;

  if (a4)
    +[WFAccountContentLocation locationWithAccountIdentifier:appDescriptor:managedLevel:](WFAccountContentLocation, "locationWithAccountIdentifier:appDescriptor:managedLevel:", a4, a3, a6);
  else
    +[WFAppContentLocation locationWithAppDescriptor:](WFAppContentLocation, "locationWithAppDescriptor:", a3, 0, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "attributionWithDisclosureLevel:origin:originalItemIdentifier:", a5, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)attributionWithDisclosureLevel:(unint64_t)a3 origin:(id)a4 disclosureWarnings:(id)a5 originalItemIdentifiers:(id)a6 count:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDisclosureLevel:origin:disclosureWarnings:originalItemIdentifiers:count:", a3, v14, v13, v12, a7);

  return v15;
}

@end
