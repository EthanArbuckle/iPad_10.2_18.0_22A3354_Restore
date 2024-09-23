@implementation INAppIntentDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedEntities, 0);
  objc_storeStrong((id *)&self->_intentIdentifier, 0);
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)INAppIntentDescriptor;
  v3 = -[INAppDescriptor hash](&v9, sel_hash);
  -[INAppIntentDescriptor intentIdentifier](self, "intentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[INAppIntentDescriptor supportedEntities](self, "supportedEntities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v3;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  INAppIntentDescriptor *v4;
  unsigned int v5;
  INAppIntentDescriptor *v6;
  INAppIntentDescriptor *v7;
  int v8;
  INAppIntentDescriptor *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  objc_super v21;

  v4 = (INAppIntentDescriptor *)a3;
  if (self == v4)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    if (-[INAppIntentDescriptor isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v21.receiver = self;
      v21.super_class = (Class)INAppIntentDescriptor;
      v5 = -[INAppDescriptor isEqual:](&v21, sel_isEqual_, v4);
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

      if (!v5)
      {
        LOBYTE(v8) = 0;
LABEL_26:

        goto LABEL_27;
      }
      -[INAppIntentDescriptor intentIdentifier](self, "intentIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[INAppIntentDescriptor intentIdentifier](v9, "intentIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v10;
      v13 = v11;
      v14 = v13;
      if (v12 == v13)
      {

      }
      else
      {
        LOBYTE(v8) = 0;
        v15 = v13;
        v16 = v12;
        if (!v12 || !v13)
        {
LABEL_24:

LABEL_25:
          goto LABEL_26;
        }
        v8 = objc_msgSend(v12, "isEqualToString:", v13);

        if (!v8)
          goto LABEL_25;
      }
      -[INAppIntentDescriptor supportedEntities](self, "supportedEntities");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[INAppIntentDescriptor supportedEntities](v9, "supportedEntities");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v17;
      v19 = v18;
      v15 = v19;
      if (v16 == v19)
      {
        LOBYTE(v8) = 1;
      }
      else
      {
        LOBYTE(v8) = 0;
        if (v16 && v19)
          LOBYTE(v8) = objc_msgSend(v16, "isEqualToSet:", v19);
      }

      goto LABEL_24;
    }
    LOBYTE(v8) = 0;
  }
LABEL_27:

  return v8;
}

- (NSString)intentIdentifier
{
  return self->_intentIdentifier;
}

- (NSSet)supportedEntities
{
  return self->_supportedEntities;
}

- (INAppIntentDescriptor)initWithIntentIdentifier:(id)a3 applicationRecord:(id)a4
{
  return -[INAppIntentDescriptor initWithIntentIdentifier:applicationRecord:supportedAppIntents:supportedEntities:](self, "initWithIntentIdentifier:applicationRecord:supportedAppIntents:supportedEntities:", a3, a4, 0, 0);
}

- (INAppIntentDescriptor)initWithIntentIdentifier:(id)a3 applicationRecord:(id)a4 supportedAppIntents:(id)a5 supportedEntities:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  INAppIntentDescriptor *v19;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v11, "localizedName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "in_counterpartIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "teamIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "in_documentTypes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[INAppIntentDescriptor initWithIntentIdentifier:localizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:supportedEntities:bundleURL:documentTypes:](self, "initWithIntentIdentifier:localizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:supportedEntities:bundleURL:documentTypes:", v12, v13, v14, 0, v15, v16, v10, v9, v17, v18);
  return v19;
}

- (INAppIntentDescriptor)initWithIntentIdentifier:(id)a3 localizedName:(id)a4 bundleIdentifier:(id)a5 extensionBundleIdentifier:(id)a6 counterpartIdentifiers:(id)a7 teamIdentifier:(id)a8 supportedIntents:(id)a9 supportedEntities:(id)a10 bundleURL:(id)a11 documentTypes:(id)a12
{
  id v17;
  id v18;
  INAppIntentDescriptor *v19;
  uint64_t v20;
  NSString *intentIdentifier;
  uint64_t v22;
  NSSet *supportedEntities;
  INAppIntentDescriptor *v24;
  objc_super v27;

  v17 = a3;
  v18 = a10;
  v27.receiver = self;
  v27.super_class = (Class)INAppIntentDescriptor;
  v19 = -[INAppDescriptor initWithLocalizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:documentTypes:](&v27, sel_initWithLocalizedName_bundleIdentifier_extensionBundleIdentifier_counterpartIdentifiers_teamIdentifier_supportedIntents_bundleURL_documentTypes_, a4, a5, a6, a7, a8, a9, a11, a12);
  if (v19)
  {
    v20 = objc_msgSend(v17, "copy");
    intentIdentifier = v19->_intentIdentifier;
    v19->_intentIdentifier = (NSString *)v20;

    v22 = objc_msgSend(v18, "copy");
    supportedEntities = v19->_supportedEntities;
    v19->_supportedEntities = (NSSet *)v22;

    v24 = v19;
  }

  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)INAppIntentDescriptor;
  -[INAppDescriptor description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppIntentDescriptor intentIdentifier](self, "intentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppIntentDescriptor supportedEntities](self, "supportedEntities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, intentIdentifier: %@, supportedEntities: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (INAppIntentDescriptor)initWithCoder:(id)a3
{
  id v4;
  INAppIntentDescriptor *v5;
  uint64_t v6;
  NSString *intentIdentifier;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSSet *supportedEntities;
  INAppIntentDescriptor *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INAppIntentDescriptor;
  v5 = -[INAppDescriptor initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intentIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    intentIdentifier = v5->_intentIdentifier;
    v5->_intentIdentifier = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("supportedEntities"));
    v11 = objc_claimAutoreleasedReturnValue();
    supportedEntities = v5->_supportedEntities;
    v5->_supportedEntities = (NSSet *)v11;

    v13 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)INAppIntentDescriptor;
  v4 = a3;
  -[INAppDescriptor encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[INAppIntentDescriptor intentIdentifier](self, "intentIdentifier", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("intentIdentifier"));

  -[INAppIntentDescriptor supportedEntities](self, "supportedEntities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("supportedEntities"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
