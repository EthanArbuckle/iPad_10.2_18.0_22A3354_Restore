@implementation INAppDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_documentTypes, 0);
  objc_storeStrong((id *)&self->_supportedIntents, 0);
  objc_storeStrong((id *)&self->_counterpartIdentifiers, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
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
  unint64_t v16;

  -[INAppDescriptor localizedName](self, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[INAppDescriptor bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[INAppDescriptor extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[INAppDescriptor counterpartIdentifiers](self, "counterpartIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[INAppDescriptor teamIdentifier](self, "teamIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[INAppDescriptor supportedIntents](self, "supportedIntents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[INAppDescriptor documentTypes](self, "documentTypes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 ^ v14 ^ objc_msgSend(v15, "hash");

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  INAppDescriptor *v4;
  INAppDescriptor *v5;
  INAppDescriptor *v6;
  int v7;
  INAppDescriptor *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  int v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  id v56;

  v4 = (INAppDescriptor *)a3;
  if (self == v4)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    if (-[INAppDescriptor isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      if (v5)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v6 = v5;
        else
          v6 = 0;
      }
      else
      {
        v6 = 0;
      }
      v8 = v6;

      -[INAppDescriptor localizedName](self, "localizedName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[INAppDescriptor localizedName](v8, "localizedName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v9;
      v12 = v10;
      v13 = v12;
      if (v11 == v12)
      {

      }
      else
      {
        LOBYTE(v7) = 0;
        v14 = v12;
        v15 = v11;
        if (!v11 || !v12)
          goto LABEL_63;
        v16 = objc_msgSend(v11, "isEqualToString:", v12);

        if (!v16)
        {
          LOBYTE(v7) = 0;
LABEL_64:

          goto LABEL_65;
        }
      }
      -[INAppDescriptor bundleIdentifier](self, "bundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[INAppDescriptor bundleIdentifier](v8, "bundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v17;
      v19 = v18;
      v14 = v19;
      if (v15 == v19)
      {

      }
      else
      {
        LOBYTE(v7) = 0;
        v20 = v19;
        v21 = v15;
        if (!v15 || !v19)
          goto LABEL_62;
        v22 = objc_msgSend(v15, "isEqualToString:", v19);

        if (!v22)
        {
          LOBYTE(v7) = 0;
LABEL_63:

          goto LABEL_64;
        }
      }
      -[INAppDescriptor extensionBundleIdentifier](self, "extensionBundleIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[INAppDescriptor extensionBundleIdentifier](v8, "extensionBundleIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v23;
      v25 = v24;
      v20 = v25;
      v56 = v21;
      if (v21 == v25)
      {

      }
      else
      {
        LOBYTE(v7) = 0;
        v26 = v25;
        if (!v21 || !v25)
          goto LABEL_61;
        v7 = objc_msgSend(v21, "isEqualToString:", v25);

        if (!v7)
          goto LABEL_62;
      }
      v55 = v20;
      -[INAppDescriptor counterpartIdentifiers](self, "counterpartIdentifiers");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[INAppDescriptor counterpartIdentifiers](v8, "counterpartIdentifiers");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v27;
      v30 = v28;
      v53 = v30;
      v54 = v29;
      if (v29 == v30)
      {

      }
      else
      {
        LOBYTE(v7) = 0;
        if (!v29)
        {
          v31 = v30;
          v20 = v55;
          goto LABEL_59;
        }
        v31 = v30;
        v20 = v55;
        if (!v30)
        {
LABEL_59:

          goto LABEL_60;
        }
        v32 = objc_msgSend(v29, "isEqualToSet:", v30);

        if (!v32)
        {
          LOBYTE(v7) = 0;
          v20 = v55;
LABEL_60:
          v26 = v53;
          v21 = v54;
LABEL_61:

          v21 = v56;
LABEL_62:

          goto LABEL_63;
        }
      }
      -[INAppDescriptor teamIdentifier](self, "teamIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[INAppDescriptor teamIdentifier](v8, "teamIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v33;
      v35 = v34;
      v51 = v29;
      v52 = v35;
      if (v29 != v35)
      {
        LOBYTE(v7) = 0;
        if (v29)
        {
          v36 = v35;
          v20 = v55;
          if (v35)
          {
            v37 = objc_msgSend(v29, "isEqualToString:", v35);

            if (!v37)
            {
              LOBYTE(v7) = 0;
              v20 = v55;
              v31 = v52;
              goto LABEL_59;
            }
LABEL_40:
            -[INAppDescriptor supportedIntents](self, "supportedIntents");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[INAppDescriptor supportedIntents](v8, "supportedIntents");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = v38;
            v41 = v39;
            v49 = v41;
            v50 = v40;
            if (v40 == v41)
            {

            }
            else
            {
              LOBYTE(v7) = 0;
              if (!v40)
              {
                v42 = v41;
                v20 = v55;
                goto LABEL_56;
              }
              v42 = v41;
              v20 = v55;
              if (!v41)
              {
LABEL_56:

                goto LABEL_57;
              }
              v43 = objc_msgSend(v40, "isEqual:", v41);

              if (!v43)
              {
                LOBYTE(v7) = 0;
                v20 = v55;
LABEL_57:
                v36 = v49;
                v29 = v50;
                goto LABEL_58;
              }
            }
            -[INAppDescriptor documentTypes](self, "documentTypes", v49, v40);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            -[INAppDescriptor documentTypes](v8, "documentTypes");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = v44;
            v46 = v45;
            v47 = v46;
            if (v40 == v46)
            {
              LOBYTE(v7) = 1;
            }
            else
            {
              LOBYTE(v7) = 0;
              if (v40)
              {
                v20 = v55;
                if (v46)
                  LOBYTE(v7) = objc_msgSend(v40, "isEqualToSet:", v46);
                goto LABEL_54;
              }
            }
            v20 = v55;
LABEL_54:

            v42 = v47;
            goto LABEL_56;
          }
        }
        else
        {
          v36 = v35;
          v20 = v55;
        }
LABEL_58:

        v29 = v51;
        v31 = v52;
        goto LABEL_59;
      }

      goto LABEL_40;
    }
    LOBYTE(v7) = 0;
  }
LABEL_65:

  return v7;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (NSSet)supportedIntents
{
  return self->_supportedIntents;
}

- (NSSet)documentTypes
{
  return self->_documentTypes;
}

- (NSSet)counterpartIdentifiers
{
  return self->_counterpartIdentifiers;
}

- (INAppDescriptor)initWithLocalizedName:(id)a3 bundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 counterpartIdentifiers:(id)a6 teamIdentifier:(id)a7 supportedIntents:(id)a8 bundleURL:(id)a9 documentTypes:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  INAppDescriptor *v24;
  uint64_t v25;
  NSString *localizedName;
  uint64_t v27;
  NSString *bundleIdentifier;
  uint64_t v29;
  NSString *extensionBundleIdentifier;
  uint64_t v31;
  NSSet *counterpartIdentifiers;
  uint64_t v33;
  NSString *teamIdentifier;
  uint64_t v35;
  NSSet *supportedIntents;
  uint64_t v37;
  NSSet *documentTypes;
  INAppDescriptor *v39;
  objc_super v41;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v41.receiver = self;
  v41.super_class = (Class)INAppDescriptor;
  v24 = -[INAppDescriptor init](&v41, sel_init);
  if (v24)
  {
    v25 = objc_msgSend(v16, "copy");
    localizedName = v24->_localizedName;
    v24->_localizedName = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    bundleIdentifier = v24->_bundleIdentifier;
    v24->_bundleIdentifier = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    extensionBundleIdentifier = v24->_extensionBundleIdentifier;
    v24->_extensionBundleIdentifier = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    counterpartIdentifiers = v24->_counterpartIdentifiers;
    v24->_counterpartIdentifiers = (NSSet *)v31;

    v33 = objc_msgSend(v20, "copy");
    teamIdentifier = v24->_teamIdentifier;
    v24->_teamIdentifier = (NSString *)v33;

    v35 = objc_msgSend(v21, "copy");
    supportedIntents = v24->_supportedIntents;
    v24->_supportedIntents = (NSSet *)v35;

    objc_storeStrong((id *)&v24->_bundleURL, a9);
    v37 = objc_msgSend(v23, "copy");
    documentTypes = v24->_documentTypes;
    v24->_documentTypes = (NSSet *)v37;

    v39 = v24;
  }

  return v24;
}

- (INAppDescriptor)initWithApplicationRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  INAppDescriptor *v12;

  v4 = a3;
  objc_msgSend(v4, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "in_counterpartIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "teamIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "in_supportedIntents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "in_documentTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[INAppDescriptor initWithLocalizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:documentTypes:](self, "initWithLocalizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:documentTypes:", v5, v6, 0, v7, v8, v9, v10, v11);
  return v12;
}

- (INAppDescriptor)initWithBundleIdentifier:(id)a3
{
  return -[INAppDescriptor initWithLocalizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:documentTypes:](self, "initWithLocalizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:documentTypes:", 0, a3, 0, 0, 0, 0, 0, 0);
}

- (INAppDescriptor)descriptorWithExtensionBundleIdentifier:(id)a3
{
  INAppDescriptor *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  INAppDescriptor *v13;

  v4 = self;
  v5 = a3;
  -[INAppDescriptor localizedName](v4, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor bundleIdentifier](v4, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor counterpartIdentifiers](v4, "counterpartIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor teamIdentifier](v4, "teamIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor supportedIntents](v4, "supportedIntents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor bundleURL](v4, "bundleURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor documentTypes](v4, "documentTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[INAppDescriptor initWithLocalizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:documentTypes:](v4, "initWithLocalizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:documentTypes:", v6, v7, v5, v8, v9, v10, v11, v12);

  return v13;
}

- (INAppDescriptor)descriptorWithRecord:(id)a3
{
  INAppDescriptor *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  INAppDescriptor *v14;

  v4 = self;
  v5 = a3;
  objc_msgSend(v5, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor extensionBundleIdentifier](v4, "extensionBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "in_counterpartIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "teamIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "in_supportedIntents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "in_documentTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[INAppDescriptor initWithLocalizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:documentTypes:](v4, "initWithLocalizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:documentTypes:", v6, v7, v8, v9, v10, v11, v12, v13);
  return v14;
}

- (id)description
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
  objc_super v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v15.receiver = self;
  v15.super_class = (Class)INAppDescriptor;
  -[INAppDescriptor description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor localizedName](self, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor teamIdentifier](self, "teamIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor supportedIntents](self, "supportedIntents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor counterpartIdentifiers](self, "counterpartIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor bundleURL](self, "bundleURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor documentTypes](self, "documentTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: localizedName: %@, bundleId: %@, extensionBundleId: %@, teamId: %@, intents: %@, counterpartIds: %@, bundleURL: %@, documentTypes: %@"), v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (LSApplicationRecord)applicationRecord
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[INAppDescriptor bundleURL](self, "bundleURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3
    || (v4 = objc_alloc(MEMORY[0x1E0CA5870]),
        -[INAppDescriptor bundleURL](self, "bundleURL"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = (void *)objc_msgSend(v4, "initWithURL:allowPlaceholder:error:", v5, 0, 0),
        v5,
        !v6))
  {
    v7 = objc_alloc(MEMORY[0x1E0CA5870]);
    -[INAppDescriptor bundleIdentifier](self, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v7, "initWithBundleIdentifier:allowPlaceholder:error:", v8, 0, 0);

  }
  return (LSApplicationRecord *)v6;
}

- (BOOL)isInstalled
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;

  -[INAppDescriptor extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CA5848]);
    -[INAppDescriptor extensionBundleIdentifier](self, "extensionBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithBundleIdentifier:error:", v5, 0);

    if (v6)
      return 1;
  }
  -[INAppDescriptor applicationRecord](self, "applicationRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "applicationState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v10, "isInstalled");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (INAppDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  INAppDescriptor *v17;
  uint64_t v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedName"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionBundleIdentifier"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("counterpartIdentifiers"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("teamIdentifier"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("supportedIntents"));
  v11 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleURL"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("documentTypes"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)v11;
  v17 = -[INAppDescriptor initWithLocalizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:documentTypes:](self, "initWithLocalizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:documentTypes:", v25, v24, v23, v22, v21, v11, v20, v15);
  v18 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresUserConfirmation"));

  -[INAppDescriptor setRequiresUserConfirmation:](v17, "setRequiresUserConfirmation:", v18);
  return v17;
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
  id v12;

  v12 = a3;
  -[INAppDescriptor localizedName](self, "localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v4, CFSTR("localizedName"));

  -[INAppDescriptor bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("bundleIdentifier"));

  -[INAppDescriptor extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v6, CFSTR("extensionBundleIdentifier"));

  -[INAppDescriptor counterpartIdentifiers](self, "counterpartIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("counterpartIdentifiers"));

  -[INAppDescriptor teamIdentifier](self, "teamIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v8, CFSTR("teamIdentifier"));

  -[INAppDescriptor supportedIntents](self, "supportedIntents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v9, CFSTR("supportedIntents"));

  -[INAppDescriptor bundleURL](self, "bundleURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v10, CFSTR("bundleURL"));

  -[INAppDescriptor documentTypes](self, "documentTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("documentTypes"));

  objc_msgSend(v12, "encodeBool:forKey:", -[INAppDescriptor requiresUserConfirmation](self, "requiresUserConfirmation"), CFSTR("requiresUserConfirmation"));
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (BOOL)requiresUserConfirmation
{
  return self->_requiresUserConfirmation;
}

- (void)setRequiresUserConfirmation:(BOOL)a3
{
  self->_requiresUserConfirmation = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
