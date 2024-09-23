@implementation WFAppContentLocation

- (WFAppContentLocation)initWithAppDescriptor:(id)a3 serializedAppDescriptor:(id)a4 identifier:(id)a5 managedLevel:(unint64_t)a6 promptingBehaviour:(unint64_t)a7
{
  unint64_t v14;
  unint64_t v15;
  id v16;
  WFAppContentLocation *v17;
  WFAppContentLocation *v18;
  WFAppContentLocation *v19;
  void *v21;
  objc_super v22;

  v14 = (unint64_t)a3;
  v15 = (unint64_t)a4;
  v16 = a5;
  if (!(v14 | v15))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAppContentLocation.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("descriptor || serializedAppDescriptor"));

  }
  v22.receiver = self;
  v22.super_class = (Class)WFAppContentLocation;
  v17 = -[WFContentLocation initWithIdentifier:promptingBehaviour:](&v22, sel_initWithIdentifier_promptingBehaviour_, v16, a7);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_appDescriptor, a3);
    objc_storeStrong((id *)&v18->_serializedAppDescriptor, a4);
    v18->_managedLevel = a6;
    v19 = v18;
  }

  return v18;
}

- (id)localizedTitle
{
  void *v2;
  void *v3;
  NSString *localizedTitle;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *v10;

  localizedTitle = self->_localizedTitle;
  if (!localizedTitle)
  {
    -[WFAppContentLocation appDescriptor](self, "appDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
    {
      -[WFAppContentLocation appDescriptor](self, "appDescriptor");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "applicationRecord");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = (NSString *)objc_msgSend(v8, "copy");
    v10 = self->_localizedTitle;
    self->_localizedTitle = v9;

    if (!v7)
    {

    }
    localizedTitle = self->_localizedTitle;
  }
  return localizedTitle;
}

- (INAppDescriptor)appDescriptor
{
  INAppDescriptor *appDescriptor;
  void *v4;
  void *v5;
  INAppDescriptor *v6;
  INAppDescriptor *v7;

  appDescriptor = self->_appDescriptor;
  if (!appDescriptor)
  {
    if (self->_serializedAppDescriptor)
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9BD0]), "initWithSerializedRepresentation:", self->_serializedAppDescriptor);
      objc_msgSend(MEMORY[0x24BDD9BF0], "sharedResolver");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "resolvedAppMatchingDescriptor:", v4);
      v6 = (INAppDescriptor *)objc_claimAutoreleasedReturnValue();
      v7 = self->_appDescriptor;
      self->_appDescriptor = v6;

      appDescriptor = self->_appDescriptor;
    }
    else
    {
      appDescriptor = 0;
    }
  }
  return appDescriptor;
}

- (NSDictionary)serializedAppDescriptor
{
  void *serializedAppDescriptor;
  NSDictionary *v4;
  NSDictionary *v5;

  serializedAppDescriptor = self->_serializedAppDescriptor;
  if (!serializedAppDescriptor)
  {
    serializedAppDescriptor = self->_appDescriptor;
    if (serializedAppDescriptor)
    {
      objc_msgSend(serializedAppDescriptor, "serializedRepresentation");
      v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v5 = self->_serializedAppDescriptor;
      self->_serializedAppDescriptor = v4;

      serializedAppDescriptor = self->_serializedAppDescriptor;
    }
  }
  return (NSDictionary *)serializedAppDescriptor;
}

- (id)app
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[WFAppContentLocation appDescriptor](self, "appDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
LABEL_6:
    v6 = 0;
    return v6;
  }
  -[WFAppContentLocation appDescriptor](self, "appDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    getWFWorkflowExecutionLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WFAppContentLocation appDescriptor](self, "appDescriptor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315394;
      v12 = "-[WFAppContentLocation app]";
      v13 = 2114;
      v14 = v9;
      _os_log_impl(&dword_20BBAD000, v7, OS_LOG_TYPE_ERROR, "%s Failed to get application record for bundleIdentifier: %{public}@", (uint8_t *)&v11, 0x16u);

    }
    goto LABEL_6;
  }
  return v6;
}

- (id)localizedMDMDescription
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;

  -[WFAppContentLocation appDescriptor](self, "appDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[WFAppContentLocation managedLevel](self, "managedLevel");
    v6 = (void *)MEMORY[0x24BDD17C8];
    if (v5 == 2)
      v7 = CFSTR("the managed “%@” app");
    else
      v7 = CFSTR("the unmanaged “%@” app");
    WFLocalizedString(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v8, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10.receiver = self;
    v10.super_class = (Class)WFAppContentLocation;
    if (-[WFContentLocation isEqual:](&v10, sel_isEqual_, v4))
    {
      -[WFAppContentLocation appDescriptor](self, "appDescriptor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appDescriptor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualForSmartPromptPurposes:", v6);

    }
    else
    {
      v7 = 0;
    }
    v8 = v4;
  }
  else
  {

    v8 = 0;
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WFAppContentLocation appDescriptor](self, "appDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hashForSmartPromptPurposes");

  return v3;
}

- (WFAppContentLocation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  WFAppContentLocation *v16;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appDescriptor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("serializedAppDescriptor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("managedLevel"));
  v15 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("promptingBehaviour"));

  v16 = -[WFAppContentLocation initWithAppDescriptor:serializedAppDescriptor:identifier:managedLevel:promptingBehaviour:](self, "initWithAppDescriptor:serializedAppDescriptor:identifier:managedLevel:promptingBehaviour:", v5, v13, CFSTR("com.apple.shortcuts.appdestination"), v14, v15);
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFAppContentLocation;
  v4 = a3;
  -[WFContentLocation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_appDescriptor, CFSTR("appDescriptor"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_serializedAppDescriptor, CFSTR("serializedAppDescriptor"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFAppContentLocation managedLevel](self, "managedLevel"), CFSTR("managedLevel"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFContentLocation promptingBehaviour](self, "promptingBehaviour"), CFSTR("promptingBehaviour"));

}

- (id)wfSerializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v9.receiver = self;
  v9.super_class = (Class)WFAppContentLocation;
  -[WFContentLocation wfSerializedRepresentation](&v9, sel_wfSerializedRepresentation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFAppContentLocation serializedAppDescriptor](self, "serializedAppDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v6, CFSTR("appDescriptor"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[WFAppContentLocation managedLevel](self, "managedLevel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v7, CFSTR("managedLevel"));

  return v5;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAppContentLocation appDescriptor](self, "appDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, app descriptor: %@, promptingBehaviour: %tu>"), v5, self, v6, -[WFContentLocation promptingBehaviour](self, "promptingBehaviour"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (unint64_t)managedLevel
{
  return self->_managedLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedAppDescriptor, 0);
  objc_storeStrong((id *)&self->_appDescriptor, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->localizedTitle, 0);
}

+ (id)locationWithSystemAppBundleIdentifier:(id)a3
{
  return (id)objc_msgSend(a1, "locationWithSystemAppBundleIdentifier:promptingBehaviour:", a3, 0);
}

+ (id)locationWithSystemAppBundleIdentifier:(id)a3 promptingBehaviour:(unint64_t)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (objc_class *)MEMORY[0x24BDD9BD0];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithBundleIdentifier:", v7);

  objc_msgSend(MEMORY[0x24BDD9BF0], "sharedResolver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resolvedAppMatchingDescriptor:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "locationWithAppDescriptor:promptingBehaviour:", v10, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)locationWithAppDescriptor:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "locationWithAppDescriptor:promptingBehaviour:", v4, objc_msgSend(v4, "isThirdParty"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)locationWithAppDescriptor:(id)a3 promptingBehaviour:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  +[WFManagedConfigurationProfile defaultProfile](WFManagedConfigurationProfile, "defaultProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isAppManaged:", v8);

  if (v9)
    v10 = 2;
  else
    v10 = 1;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAppDescriptor:serializedAppDescriptor:identifier:managedLevel:promptingBehaviour:", v6, 0, CFSTR("com.apple.shortcuts.appdestination"), v10, a4);

  return v11;
}

+ (id)locationWithAppDescriptor:(id)a3 managedLevel:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "locationWithAppDescriptor:managedLevel:promptingBehaviour:", a3, a4, 0);
}

+ (id)locationWithAppDescriptor:(id)a3 managedLevel:(unint64_t)a4 promptingBehaviour:(unint64_t)a5
{
  id v8;
  void *v9;

  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAppDescriptor:serializedAppDescriptor:identifier:managedLevel:promptingBehaviour:", v8, 0, CFSTR("com.apple.shortcuts.appdestination"), a4, a5);

  return v9;
}

+ (id)platformFileManagerLocation
{
  return (id)objc_msgSend(a1, "locationWithSystemAppBundleIdentifier:", *MEMORY[0x24BEC16B8]);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("appDescriptor"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
LABEL_6:
    objc_msgSend(v4, "wfObjectOfClass:forKeyPath:", objc_opt_class(), CFSTR("managedLevel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");

    v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAppDescriptor:serializedAppDescriptor:identifier:managedLevel:promptingBehaviour:", 0, v5, CFSTR("com.apple.shortcuts.appdestination"), v10, 0);
    goto LABEL_7;
  }
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  getWFWorkflowExecutionLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v5 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v13 = 136315138;
      v14 = "+[WFAppContentLocation objectWithWFSerializedRepresentation:]";
      _os_log_impl(&dword_20BBAD000, v5, OS_LOG_TYPE_DEBUG, "%s Reading legacy bundle identifier from WFAppContentLocation and upgrading to app descriptor", (uint8_t *)&v13, 0xCu);
    }

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9BD0]), "initWithBundleIdentifier:", v6);
    objc_msgSend(v8, "serializedRepresentation");
    v5 = objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v13 = 136315138;
    v14 = "+[WFAppContentLocation objectWithWFSerializedRepresentation:]";
    _os_log_impl(&dword_20BBAD000, v5, OS_LOG_TYPE_ERROR, "%s Failed to decode app descriptor from WFAppContentLocation", (uint8_t *)&v13, 0xCu);
  }
  v11 = 0;
LABEL_7:

  return v11;
}

@end
