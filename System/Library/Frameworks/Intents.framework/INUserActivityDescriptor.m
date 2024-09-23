@implementation INUserActivityDescriptor

- (INUserActivityDescriptor)initWithUserActivityType:(id)a3 bundleIdentifier:(id)a4
{
  return -[INUserActivityDescriptor initWithUserActivityType:localizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:](self, "initWithUserActivityType:localizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:", a3, 0, a4, 0, 0, 0, 0, 0);
}

- (INUserActivityDescriptor)initWithUserActivityType:(id)a3 localizedName:(id)a4 bundleIdentifier:(id)a5 extensionBundleIdentifier:(id)a6 counterpartIdentifiers:(id)a7 teamIdentifier:(id)a8 supportedIntents:(id)a9 bundleURL:(id)a10
{
  id v16;
  INUserActivityDescriptor *v17;
  uint64_t v18;
  NSString *userActivityType;
  INUserActivityDescriptor *v20;
  objc_super v22;

  v16 = a3;
  v22.receiver = self;
  v22.super_class = (Class)INUserActivityDescriptor;
  v17 = -[INAppDescriptor initWithLocalizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:documentTypes:](&v22, sel_initWithLocalizedName_bundleIdentifier_extensionBundleIdentifier_counterpartIdentifiers_teamIdentifier_supportedIntents_bundleURL_documentTypes_, a4, a5, a6, a7, a8, a9, a10, 0);
  if (v17)
  {
    v18 = objc_msgSend(v16, "copy");
    userActivityType = v17->_userActivityType;
    v17->_userActivityType = (NSString *)v18;

    v20 = v17;
  }

  return v17;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)INUserActivityDescriptor;
  -[INAppDescriptor description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INUserActivityDescriptor userActivityType](self, "userActivityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, userActivityType: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)appDescriptor
{
  INAppDescriptor *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  INAppDescriptor *v12;

  v3 = [INAppDescriptor alloc];
  -[INAppDescriptor localizedName](self, "localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor counterpartIdentifiers](self, "counterpartIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor teamIdentifier](self, "teamIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor supportedIntents](self, "supportedIntents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor bundleURL](self, "bundleURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor documentTypes](self, "documentTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[INAppDescriptor initWithLocalizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:documentTypes:](v3, "initWithLocalizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:documentTypes:", v4, v5, v6, v7, v8, v9, v10, v11);

  -[INAppDescriptor setRequiresUserConfirmation:](v12, "setRequiresUserConfirmation:", -[INAppDescriptor requiresUserConfirmation](self, "requiresUserConfirmation"));
  return v12;
}

- (INUserActivityDescriptor)descriptorWithAppDescriptor:(id)a3
{
  id v4;
  INUserActivityDescriptor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  INUserActivityDescriptor *v14;

  v4 = a3;
  v5 = [INUserActivityDescriptor alloc];
  -[INUserActivityDescriptor userActivityType](self, "userActivityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "counterpartIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "teamIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "supportedIntents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[INUserActivityDescriptor initWithUserActivityType:localizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:](v5, "initWithUserActivityType:localizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:", v6, v7, v8, v9, v10, v11, v12, v13);
  -[INAppDescriptor setRequiresUserConfirmation:](v14, "setRequiresUserConfirmation:", -[INAppDescriptor requiresUserConfirmation](self, "requiresUserConfirmation"));
  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)INUserActivityDescriptor;
  v3 = -[INAppDescriptor hash](&v7, sel_hash);
  -[INUserActivityDescriptor userActivityType](self, "userActivityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  INUserActivityDescriptor *v4;
  unsigned int v5;
  INUserActivityDescriptor *v6;
  INUserActivityDescriptor *v7;
  char v8;
  INUserActivityDescriptor *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  objc_super v16;

  v4 = (INUserActivityDescriptor *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (-[INUserActivityDescriptor isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v16.receiver = self;
    v16.super_class = (Class)INUserActivityDescriptor;
    v5 = -[INAppDescriptor isEqual:](&v16, sel_isEqual_, v4);
    v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v9 = v7;

    if (v5)
    {
      -[INUserActivityDescriptor userActivityType](self, "userActivityType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[INUserActivityDescriptor userActivityType](v9, "userActivityType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v10;
      v13 = v11;
      v14 = v13;
      if (v12 == v13)
      {
        v8 = 1;
      }
      else
      {
        v8 = 0;
        if (v12 && v13)
          v8 = objc_msgSend(v12, "isEqualToString:", v13);
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (INUserActivityDescriptor)initWithCoder:(id)a3
{
  id v4;
  INUserActivityDescriptor *v5;
  uint64_t v6;
  NSString *userActivityType;
  INUserActivityDescriptor *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INUserActivityDescriptor;
  v5 = -[INAppDescriptor initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userActivityType"));
    v6 = objc_claimAutoreleasedReturnValue();
    userActivityType = v5->_userActivityType;
    v5->_userActivityType = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)INUserActivityDescriptor;
  v4 = a3;
  -[INAppDescriptor encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[INUserActivityDescriptor userActivityType](self, "userActivityType", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("userActivityType"));

}

- (NSString)userActivityType
{
  return self->_userActivityType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivityType, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
