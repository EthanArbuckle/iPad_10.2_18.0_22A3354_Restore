@implementation WFAccountContentLocation

- (WFAccountContentLocation)initWithAccountIdentifier:(id)a3 appDescriptor:(id)a4 serializedAppDescriptor:(id)a5 managedLevel:(unint64_t)a6 promptingBehaviour:(unint64_t)a7
{
  id v13;
  id v14;
  WFAccountContentLocation *v15;
  WFAccountContentLocation *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  WFAccountContentLocation *v22;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v24.receiver = self;
  v24.super_class = (Class)WFAccountContentLocation;
  v15 = -[WFAppContentLocation initWithAppDescriptor:serializedAppDescriptor:identifier:managedLevel:promptingBehaviour:](&v24, sel_initWithAppDescriptor_serializedAppDescriptor_identifier_managedLevel_promptingBehaviour_, v14, a5, CFSTR("com.apple.shortcuts.accountDestination"), a6, a7);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accountIdentifier, a3);
    +[WFManagedConfigurationProfile defaultProfile](WFManagedConfigurationProfile, "defaultProfile");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isAccountBasedSourceApp:", v18);

    if (v19)
    {
      objc_msgSend(v17, "accountWithIdentifier:", v13);
      v20 = objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        getWFContentGraphLogObject();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          v26 = "-[WFAccountContentLocation initWithAccountIdentifier:appDescriptor:serializedAppDescriptor:managedLevel:"
                "promptingBehaviour:]";
          _os_log_impl(&dword_20BBAD000, v21, OS_LOG_TYPE_FAULT, "%s Creating a WFAccountContentLocation, but could not get account info or it doesn't exist", buf, 0xCu);
        }

        v20 = 0;
      }
    }
    else
    {
      getWFContentGraphLogObject();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v26 = "-[WFAccountContentLocation initWithAccountIdentifier:appDescriptor:serializedAppDescriptor:managedLevel:pr"
              "omptingBehaviour:]";
        _os_log_impl(&dword_20BBAD000, v20, OS_LOG_TYPE_FAULT, "%s Creating a WFAccountContentLocation, but the given bundle identifier isn't account-based", buf, 0xCu);
      }
    }

    v22 = v16;
  }

  return v16;
}

- (id)appContentLocation
{
  void *v3;
  void *v4;

  -[WFAppContentLocation appDescriptor](self, "appDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFAppContentLocation locationWithAppDescriptor:managedLevel:promptingBehaviour:](WFAppContentLocation, "locationWithAppDescriptor:managedLevel:promptingBehaviour:", v3, -[WFAppContentLocation managedLevel](self, "managedLevel"), -[WFContentLocation promptingBehaviour](self, "promptingBehaviour"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)localizedMDMDescription
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
  unint64_t v12;
  void *v13;
  __CFString *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  __CFString *v18;
  void *v20;

  -[WFAppContentLocation app](self, "app");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "localizedName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAccountContentLocation accountIdentifier](self, "accountIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[WFManagedConfigurationProfile defaultProfile](WFManagedConfigurationProfile, "defaultProfile");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "accountWithIdentifier:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(v8, "displayAccount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accountDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[WFAppContentLocation managedLevel](self, "managedLevel");
    if (v5 && v11)
    {
      v13 = (void *)MEMORY[0x24BDD17C8];
      if (v12 == 2)
        v14 = CFSTR("the managed “%1$@” account of the “%2$@” app");
      else
        v14 = CFSTR("the unmanaged “%1$@” account of the “%2$@” app");
      WFLocalizedString(v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v5;
    }
    else
    {
      if (v5)
      {
        v15 = (void *)MEMORY[0x24BDD17C8];
        if (v12 == 2)
          v16 = CFSTR("the managed “%@” app");
        else
          v16 = CFSTR("the unmanaged “%@” app");
        WFLocalizedString(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringWithFormat:", v17, v5, v20);
        goto LABEL_21;
      }
      if (!v11)
      {
        v9 = 0;
        goto LABEL_22;
      }
      v13 = (void *)MEMORY[0x24BDD17C8];
      if (v12 == 2)
        v18 = CFSTR("the managed “%@” account");
      else
        v18 = CFSTR("the unmanaged “%@” account");
      WFLocalizedString(v18);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "localizedStringWithFormat:", v17, v11, v20);
LABEL_21:
    v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
    goto LABEL_23;
  }
  v9 = 0;
LABEL_23:

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
    v10.super_class = (Class)WFAccountContentLocation;
    if (-[WFAppContentLocation isEqual:](&v10, sel_isEqual_, v4))
    {
      -[WFAccountContentLocation accountIdentifier](self, "accountIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accountIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

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
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[WFAppContentLocation appDescriptor](self, "appDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashForSmartPromptPurposes");
  -[WFAccountContentLocation accountIdentifier](self, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (WFAccountContentLocation)initWithCoder:(id)a3
{
  id v3;
  WFAccountContentLocation *v4;
  void *v5;
  void *v6;
  void *v7;
  WFAccountContentLocation *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFAccountContentLocation;
  v3 = a3;
  v4 = -[WFAppContentLocation initWithCoder:](&v10, sel_initWithCoder_, v3);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"), v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFAppContentLocation appDescriptor](v4, "appDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAppContentLocation serializedAppDescriptor](v4, "serializedAppDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFAccountContentLocation initWithAccountIdentifier:appDescriptor:serializedAppDescriptor:managedLevel:promptingBehaviour:](v4, "initWithAccountIdentifier:appDescriptor:serializedAppDescriptor:managedLevel:promptingBehaviour:", v5, v6, v7, -[WFAppContentLocation managedLevel](v4, "managedLevel"), -[WFContentLocation promptingBehaviour](v4, "promptingBehaviour"));

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFAccountContentLocation;
  v4 = a3;
  -[WFAppContentLocation encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFAccountContentLocation accountIdentifier](self, "accountIdentifier", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("accountIdentifier"));

}

- (id)wfSerializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v8.receiver = self;
  v8.super_class = (Class)WFAccountContentLocation;
  -[WFAppContentLocation wfSerializedRepresentation](&v8, sel_wfSerializedRepresentation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFAccountContentLocation accountIdentifier](self, "accountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKeyPath:", v6, CFSTR("accountIdentifier"));

  return v5;
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
  -[WFAppContentLocation appDescriptor](self, "appDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAccountContentLocation accountIdentifier](self, "accountIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, app descriptor: %@, accountIdentifier: %@, promptingBehaviour: %tu>"), v5, self, v6, v7, -[WFContentLocation promptingBehaviour](self, "promptingBehaviour"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

+ (id)locationWithAccountIdentifier:(id)a3 appDescriptor:(id)a4
{
  return (id)objc_msgSend(a1, "locationWithAccountIdentifier:appDescriptor:promptingBehaviour:", a3, a4, 0);
}

+ (id)locationWithAccountIdentifier:(id)a3 appDescriptor:(id)a4 promptingBehaviour:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v8 = a4;
  v9 = a3;
  +[WFManagedConfigurationProfile defaultProfile](WFManagedConfigurationProfile, "defaultProfile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isAccountManaged:", v9))
    v11 = 2;
  else
    v11 = 1;
  objc_msgSend(a1, "locationWithAccountIdentifier:appDescriptor:managedLevel:promptingBehaviour:", v9, v8, v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)locationWithAccountIdentifier:(id)a3 appDescriptor:(id)a4 managedLevel:(unint64_t)a5
{
  return (id)objc_msgSend(a1, "locationWithAccountIdentifier:appDescriptor:managedLevel:promptingBehaviour:", a3, a4, a5, 0);
}

+ (id)locationWithAccountIdentifier:(id)a3 appDescriptor:(id)a4 managedLevel:(unint64_t)a5 promptingBehaviour:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;

  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAccountIdentifier:appDescriptor:serializedAppDescriptor:managedLevel:promptingBehaviour:", v11, v10, 0, a5, a6);

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "wfObjectOfClass:forKeyPath:", objc_opt_class(), CFSTR("accountIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___WFAccountContentLocation;
    objc_msgSendSuper2(&v11, sel_objectWithWFSerializedRepresentation_, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      -[NSObject appDescriptor](v6, "appDescriptor");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "locationWithAccountIdentifier:appDescriptor:managedLevel:", v5, v8, -[NSObject managedLevel](v7, "managedLevel"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      getWFWorkflowExecutionLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v13 = "+[WFAccountContentLocation objectWithWFSerializedRepresentation:]";
        _os_log_impl(&dword_20BBAD000, v8, OS_LOG_TYPE_ERROR, "%s Failed to decode WFAccountContentLocation as WFAppContentLocation to read bundleIdentifier", buf, 0xCu);
      }
      v9 = 0;
    }

  }
  else
  {
    getWFWorkflowExecutionLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "+[WFAccountContentLocation objectWithWFSerializedRepresentation:]";
      _os_log_impl(&dword_20BBAD000, v7, OS_LOG_TYPE_ERROR, "%s Failed to decode accountIdentifier on WFAccountContentLocation", buf, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

@end
