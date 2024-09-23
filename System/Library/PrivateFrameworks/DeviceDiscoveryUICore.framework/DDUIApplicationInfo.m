@implementation DDUIApplicationInfo

- (DDUIApplicationInfo)initWithApplicationID:(id)a3 serviceIdentifier:(id)a4 bundleID:(id)a5 appName:(id)a6 adamID:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  DDUIApplicationInfo *v17;
  DDUIApplicationInfo *v18;
  DDUIApplicationInfo *v19;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = v15;
  v17 = 0;
  if (v12 && v14 && v15)
  {
    v22.receiver = self;
    v22.super_class = (Class)DDUIApplicationInfo;
    v18 = -[DDUIApplicationInfo init](&v22, sel_init);
    v19 = v18;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_applicationID, a3);
      objc_storeStrong((id *)&v19->_serviceIdentifier, a4);
      objc_storeStrong((id *)&v19->_bundleID, a5);
      objc_storeStrong((id *)&v19->_appName, a6);
      v19->_adamID = a7;
    }
    self = v19;
    v17 = self;
  }

  return v17;
}

- (DDUIApplicationInfo)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  DDUIApplicationInfo *v10;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DDUIMessageApplicationIDKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DDUIMessageServiceIDKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DDUIMessageBundleIDKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DDUIMessageAppNameKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DDUIMessageAdamIDKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    self = -[DDUIApplicationInfo initWithApplicationID:serviceIdentifier:bundleID:appName:adamID:](self, "initWithApplicationID:serviceIdentifier:bundleID:appName:adamID:", v5, v6, v7, v8, objc_msgSend(v9, "unsignedLongLongValue"));
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("DDUIMessageApplicationIDKey");
  -[DDUIApplicationInfo applicationID](self, "applicationID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("DDUIMessageServiceIDKey");
  -[DDUIApplicationInfo serviceIdentifier](self, "serviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("DDUIMessageBundleIDKey");
  -[DDUIApplicationInfo bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("DDUIMessageAppNameKey");
  -[DDUIApplicationInfo appName](self, "appName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v10[4] = CFSTR("DDUIMessageAdamIDKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[DDUIApplicationInfo adamID](self, "adamID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; applicationID = \"%@\"; serviceIdentifier = \"%@\"; bundleID = \"%@\"; appName = \"%@\"; adamID = %llu>"),
               objc_opt_class(),
               self,
               self->_applicationID,
               self->_serviceIdentifier,
               self->_bundleID,
               self->_appName,
               self->_adamID);
}

- (NSString)bundleIDPrefixedServiceIdentifier
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), self->_bundleID, self->_serviceIdentifier);
}

- (NSString)applicationID
{
  return self->_applicationID;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)appName
{
  return self->_appName;
}

- (unint64_t)adamID
{
  return self->_adamID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationID, 0);
}

@end
