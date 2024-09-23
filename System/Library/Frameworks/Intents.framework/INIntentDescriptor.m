@implementation INIntentDescriptor

- (INIntentDescriptor)initWithIntent:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  INIntentDescriptor *v33;
  void *v34;
  id v35;
  id v36;

  v3 = a3;
  objc_msgSend(v3, "launchId");
  v35 = 0;
  v36 = 0;
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  INExtractAppInfoFromSiriLaunchIdWithoutLaunchServices(v34, &v36, &v35);
  v4 = v36;
  v30 = v35;
  v5 = v3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = objc_msgSend(v5, "preferredCallProvider");
      v31 = v5;
    }
    else
    {

      v6 = 0;
      v31 = 0;
    }
    v8 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = objc_msgSend(v8, "preferredCallProvider");
      v29 = v8;
    }
    else
    {

      v29 = 0;
    }
    v9 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v9;
    else
      v7 = 0;
  }
  else
  {
    v6 = 0;
    v31 = 0;
    v29 = 0;
    v7 = 0;
  }

  objc_msgSend(v5, "_className");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v12;
  v15 = 2;
  if (!v7)
    v15 = v6;
  v28 = v15;

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, 0);
  objc_msgSend(v16, "localizedName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionBundleId");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_uiExtensionBundleId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "in_counterpartIdentifiers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "teamIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "in_documentTypes");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v4;
  v27 = v4;
  v24 = (void *)v22;
  v33 = -[INIntentDescriptor initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:](self, "initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:", v14, v17, v23, 0, v26, v18, v19, v20, v28, v21, v30, v22);

  return v33;
}

- (INIntentDescriptor)initWithIntentTypeName:(id)a3
{
  id v4;
  int v5;
  id v6;
  id v7;
  INIntentDescriptor *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  id v17;

  v4 = a3;
  v16 = 0;
  v17 = 0;
  v5 = INParseCustomIntentTypeName(v4, &v17, &v16);
  v6 = v17;
  v7 = v16;
  if (v5)
  {
    self = -[INIntentDescriptor initWithIntentClassName:launchableAppBundleId:](self, "initWithIntentClassName:launchableAppBundleId:", v6, v7);
    v8 = self;
  }
  else
  {
    INIntentSchemaGetIntentDescriptionWithType(v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      NSStringFromClass((Class)objc_msgSend(v9, "facadeClass"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0C99E60];
      NSStringFromClass((Class)objc_msgSend(v10, "facadeClass"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWithObject:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[INIntentDescriptor initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:](self, "initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:", v11, 0, 0, 0, 0, 0, 0, 0, 0, v14, 0, 0);

      v8 = self;
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (INIntentDescriptor)initWithIntentClassName:(id)a3 launchableAppBundleId:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  INIntentDescriptor *v15;

  v6 = (objc_class *)MEMORY[0x1E0CA5870];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v7, 0, 0);
  objc_msgSend(v9, "localizedName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "in_counterpartIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "teamIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "in_documentTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[INIntentDescriptor initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:](self, "initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:", v8, v10, v7, 0, 0, 0, v11, v12, 0, v13, 0, v14);

  return v15;
}

- (INIntentDescriptor)initWithIntentClassName:(id)a3 extensionBundleId:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  INIntentDescriptor *v10;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "setWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[INIntentDescriptor initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:](self, "initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:", v8, 0, 0, 0, v7, 0, 0, 0, 0, v9, 0, 0);

  return v10;
}

- (INIntentDescriptor)initWithIntentClassName:(id)a3 localizedName:(id)a4 bundleIdentifier:(id)a5 displayableBundleIdentifier:(id)a6 extensionBundleIdentifier:(id)a7 uiExtensionBundleIdentifier:(id)a8 counterpartIdentifiers:(id)a9 teamIdentifier:(id)a10 preferredCallProvider:(int64_t)a11 supportedIntents:(id)a12 bundleURL:(id)a13 documentTypes:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  INIntentDescriptor *v29;
  uint64_t v30;
  NSString *intentClassName;
  uint64_t v32;
  NSString *uiExtensionBundleIdentifier;
  INIntentDescriptor *v34;
  id v37;
  id v38;
  objc_super v39;

  v38 = a3;
  v37 = a8;
  v19 = a14;
  v20 = a13;
  v21 = a12;
  v22 = a10;
  v23 = a9;
  v24 = a7;
  v25 = a6;
  v26 = a4;
  v27 = (id)objc_msgSend(a5, "copy");
  v28 = (void *)objc_msgSend(v25, "copy");

  if (!v27 && v28)
  {
    v27 = v28;
LABEL_6:
    v27 = v27;
    v28 = v27;
    goto LABEL_7;
  }
  if (!v28 && v27)
    goto LABEL_6;
LABEL_7:
  v39.receiver = self;
  v39.super_class = (Class)INIntentDescriptor;
  v29 = -[INAppDescriptor initWithLocalizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:documentTypes:](&v39, sel_initWithLocalizedName_bundleIdentifier_extensionBundleIdentifier_counterpartIdentifiers_teamIdentifier_supportedIntents_bundleURL_documentTypes_, v26, v27, v24, v23, v22, v21, v20, v19);

  if (v29)
  {
    v30 = objc_msgSend(v38, "copy");
    intentClassName = v29->_intentClassName;
    v29->_intentClassName = (NSString *)v30;

    objc_storeStrong((id *)&v29->_displayableBundleIdentifier, v28);
    v32 = objc_msgSend(v37, "copy");
    uiExtensionBundleIdentifier = v29->_uiExtensionBundleIdentifier;
    v29->_uiExtensionBundleIdentifier = (NSString *)v32;

    v29->_preferredCallProvider = a11;
    v34 = v29;
  }

  return v29;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)INIntentDescriptor;
  -[INAppDescriptor description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentDescriptor intentClassName](self, "intentClassName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentDescriptor displayableBundleIdentifier](self, "displayableBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentDescriptor uiExtensionBundleIdentifier](self, "uiExtensionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, intentClassName: %@, displayableBundleId: %@, uiExtensionBundleId: %@, preferredCallProvider: %li"), v4, v5, v6, v7, -[INIntentDescriptor preferredCallProvider](self, "preferredCallProvider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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

- (id)displayableAppDescriptor
{
  void *v3;
  void *v4;
  int v5;
  INAppDescriptor *v6;
  INAppDescriptor *v7;
  INAppDescriptor *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  -[INAppDescriptor bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentDescriptor displayableBundleIdentifier](self, "displayableBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if (v5)
  {
    -[INIntentDescriptor appDescriptor](self, "appDescriptor");
    v6 = (INAppDescriptor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[INIntentDescriptor displayableApplicationRecord](self, "displayableApplicationRecord");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[INAppDescriptor initWithApplicationRecord:]([INAppDescriptor alloc], "initWithApplicationRecord:", v18);
    v8 = [INAppDescriptor alloc];
    -[INAppDescriptor localizedName](v7, "localizedName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[INAppDescriptor bundleIdentifier](v7, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[INAppDescriptor extensionBundleIdentifier](self, "extensionBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[INAppDescriptor counterpartIdentifiers](v7, "counterpartIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[INAppDescriptor teamIdentifier](v7, "teamIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[INAppDescriptor supportedIntents](v7, "supportedIntents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[INAppDescriptor bundleURL](v7, "bundleURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[INAppDescriptor documentTypes](v7, "documentTypes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[INAppDescriptor initWithLocalizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:documentTypes:](v8, "initWithLocalizedName:bundleIdentifier:extensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:supportedIntents:bundleURL:documentTypes:", v9, v10, v11, v12, v13, v14, v15, v16);

  }
  return v6;
}

- (LSApplicationRecord)launchableApplicationRecord
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CA5870]);
  -[INAppDescriptor bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, 0);

  return (LSApplicationRecord *)v5;
}

- (LSApplicationRecord)displayableApplicationRecord
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CA5870]);
  -[INIntentDescriptor displayableBundleIdentifier](self, "displayableBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, 0);
  }
  else
  {
    -[INAppDescriptor bundleIdentifier](self, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v6, 0, 0);

  }
  return (LSApplicationRecord *)v5;
}

- (INIntentDescriptor)descriptorWithAppDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  INIntentDescriptor *v16;
  INIntentDescriptor *v17;
  void *v18;
  void *v19;
  INIntentDescriptor *v20;

  v4 = a3;
  v16 = [INIntentDescriptor alloc];
  -[INIntentDescriptor intentClassName](self, "intentClassName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = self;
  -[INIntentDescriptor uiExtensionBundleIdentifier](self, "uiExtensionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "counterpartIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "teamIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[INIntentDescriptor preferredCallProvider](self, "preferredCallProvider");
  objc_msgSend(v4, "supportedIntents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[INIntentDescriptor initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:](v16, "initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:", v5, v19, v18, v15, v6, v7, v14, v8, v9, v10, v11, v12);
  -[INAppDescriptor setRequiresUserConfirmation:](v17, "setRequiresUserConfirmation:", -[INAppDescriptor requiresUserConfirmation](v20, "requiresUserConfirmation"));
  return v17;
}

- (INIntentDescriptor)descriptorWithPreferredCallProvider:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  INIntentDescriptor *v12;
  void *v14;
  void *v15;
  void *v16;
  INIntentDescriptor *v17;
  void *v19;

  v17 = [INIntentDescriptor alloc];
  -[INIntentDescriptor intentClassName](self, "intentClassName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor localizedName](self, "localizedName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor bundleIdentifier](self, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  -[INIntentDescriptor uiExtensionBundleIdentifier](self, "uiExtensionBundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor counterpartIdentifiers](self, "counterpartIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor teamIdentifier](self, "teamIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor supportedIntents](self, "supportedIntents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor bundleURL](self, "bundleURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor documentTypes](self, "documentTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)v5;
  v12 = -[INIntentDescriptor initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:](v17, "initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:", v19, v16, v15, v4, v5, v14, v6, v7, a3, v8, v9, v10);

  -[INAppDescriptor setRequiresUserConfirmation:](v12, "setRequiresUserConfirmation:", -[INAppDescriptor requiresUserConfirmation](self, "requiresUserConfirmation"));
  return v12;
}

- (id)mergeWithDescriptor:(id)a3
{
  INIntentDescriptor *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  INIntentDescriptor *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  INIntentDescriptor *v54;
  uint64_t v55;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;

  v4 = (INIntentDescriptor *)a3;
  -[INIntentDescriptor intentClassName](self, "intentClassName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[INIntentDescriptor intentClassName](v4, "intentClassName");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  -[INAppDescriptor localizedName](self, "localizedName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    -[INAppDescriptor localizedName](v4, "localizedName");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  -[INAppDescriptor bundleIdentifier](self, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    -[INAppDescriptor bundleIdentifier](v4, "bundleIdentifier");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  -[INIntentDescriptor displayableBundleIdentifier](self, "displayableBundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = v17;
  }
  else
  {
    -[INIntentDescriptor displayableBundleIdentifier](v4, "displayableBundleIdentifier");
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = v19;

  -[INAppDescriptor extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    v23 = v21;
  }
  else
  {
    -[INAppDescriptor extensionBundleIdentifier](v4, "extensionBundleIdentifier");
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  v62 = v23;

  -[INIntentDescriptor uiExtensionBundleIdentifier](self, "uiExtensionBundleIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    v26 = v24;
  }
  else
  {
    -[INIntentDescriptor uiExtensionBundleIdentifier](v4, "uiExtensionBundleIdentifier");
    v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  v61 = v26;

  -[INAppDescriptor counterpartIdentifiers](self, "counterpartIdentifiers");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    v29 = v27;
  }
  else
  {
    -[INAppDescriptor counterpartIdentifiers](v4, "counterpartIdentifiers");
    v29 = (id)objc_claimAutoreleasedReturnValue();
  }
  v60 = v29;

  -[INAppDescriptor teamIdentifier](self, "teamIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
  {
    v32 = v30;
  }
  else
  {
    -[INAppDescriptor teamIdentifier](v4, "teamIdentifier");
    v32 = (id)objc_claimAutoreleasedReturnValue();
  }
  v59 = v32;

  -[INAppDescriptor bundleURL](self, "bundleURL");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  v58 = v8;
  if (v33)
  {
    v35 = v33;
  }
  else
  {
    -[INAppDescriptor bundleURL](v4, "bundleURL");
    v35 = (id)objc_claimAutoreleasedReturnValue();
  }
  v36 = v35;

  if (-[INIntentDescriptor preferredCallProvider](self, "preferredCallProvider"))
    v37 = self;
  else
    v37 = v4;
  v38 = -[INIntentDescriptor preferredCallProvider](v37, "preferredCallProvider");
  -[INAppDescriptor documentTypes](self, "documentTypes");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  v57 = v38;
  if (v39)
  {
    v41 = v39;
  }
  else
  {
    -[INAppDescriptor documentTypes](v4, "documentTypes");
    v41 = (id)objc_claimAutoreleasedReturnValue();
  }
  v42 = v41;

  -[INAppDescriptor supportedIntents](self, "supportedIntents");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    -[INAppDescriptor supportedIntents](self, "supportedIntents");
    v44 = v20;
    v45 = v16;
    v46 = v12;
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)objc_msgSend(v47, "mutableCopy");

    v12 = v46;
    v16 = v45;
    v20 = v44;
  }
  else
  {
    v48 = (void *)objc_opt_new();
  }

  -[INAppDescriptor supportedIntents](v4, "supportedIntents");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "unionSet:", v49);

  if ((objc_msgSend(v16, "isEqualToString:", v20) & 1) == 0)
  {
    v50 = v16;
    v51 = v12;
    v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v20, 0, 0);
    objc_msgSend(v52, "localizedName");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53)
    {
      objc_msgSend(v52, "localizedName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = v51;
    }

    v16 = v50;
  }
  v54 = -[INIntentDescriptor initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:]([INIntentDescriptor alloc], "initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:", v58, v12, v16, v20, v62, v61, v60, v59, v57, v48, v36, v42);
  v55 = -[INAppDescriptor requiresUserConfirmation](self, "requiresUserConfirmation")
     || -[INAppDescriptor requiresUserConfirmation](v4, "requiresUserConfirmation");
  -[INAppDescriptor setRequiresUserConfirmation:](v54, "setRequiresUserConfirmation:", v55);

  return v54;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)INIntentDescriptor;
  v3 = -[INAppDescriptor hash](&v11, sel_hash);
  -[INIntentDescriptor intentClassName](self, "intentClassName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[INIntentDescriptor displayableBundleIdentifier](self, "displayableBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[INIntentDescriptor uiExtensionBundleIdentifier](self, "uiExtensionBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash") ^ v3;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  INIntentDescriptor *v4;
  unsigned int v5;
  INIntentDescriptor *v6;
  INIntentDescriptor *v7;
  int v8;
  INIntentDescriptor *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  int64_t v26;
  objc_super v28;

  v4 = (INIntentDescriptor *)a3;
  if (self == v4)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    if (-[INIntentDescriptor isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v28.receiver = self;
      v28.super_class = (Class)INIntentDescriptor;
      v5 = -[INAppDescriptor isEqual:](&v28, sel_isEqual_, v4);
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
LABEL_35:

        goto LABEL_36;
      }
      -[INIntentDescriptor intentClassName](self, "intentClassName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[INIntentDescriptor intentClassName](v9, "intentClassName");
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
          goto LABEL_33;
        v17 = objc_msgSend(v12, "isEqualToString:", v13);

        if (!v17)
        {
          LOBYTE(v8) = 0;
LABEL_34:

          goto LABEL_35;
        }
      }
      -[INIntentDescriptor displayableBundleIdentifier](self, "displayableBundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[INIntentDescriptor displayableBundleIdentifier](v9, "displayableBundleIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v18;
      v20 = v19;
      v15 = v20;
      if (v16 == v20)
      {

      }
      else
      {
        LOBYTE(v8) = 0;
        v21 = v20;
        v22 = v16;
        if (!v16 || !v20)
          goto LABEL_32;
        v8 = objc_msgSend(v16, "isEqualToString:", v20);

        if (!v8)
          goto LABEL_33;
      }
      -[INIntentDescriptor uiExtensionBundleIdentifier](self, "uiExtensionBundleIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[INIntentDescriptor uiExtensionBundleIdentifier](v9, "uiExtensionBundleIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v23;
      v25 = v24;
      v21 = v25;
      if (v22 == v25)
      {

      }
      else
      {
        if (!v22 || !v25)
        {

          LOBYTE(v8) = 0;
          goto LABEL_32;
        }
        v8 = objc_msgSend(v22, "isEqualToString:", v25);

        if (!v8)
          goto LABEL_32;
      }
      v26 = -[INIntentDescriptor preferredCallProvider](self, "preferredCallProvider");
      LOBYTE(v8) = v26 == -[INIntentDescriptor preferredCallProvider](v9, "preferredCallProvider");
LABEL_32:

LABEL_33:
      goto LABEL_34;
    }
    LOBYTE(v8) = 0;
  }
LABEL_36:

  return v8;
}

- (BOOL)hasCustomUIExtension
{
  void *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  INIntentDescriptor *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  -[INIntentDescriptor _uiExtensionsWithError:](self, "_uiExtensionsWithError:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  v5 = objc_msgSend(v3, "count");
  if (!v5 && !v3)
  {
    v6 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v10 = "-[INIntentDescriptor hasCustomUIExtension]";
      v11 = 2114;
      v12 = self;
      v13 = 2114;
      v14 = v4;
      _os_log_error_impl(&dword_18BEBC000, v6, OS_LOG_TYPE_ERROR, "%s Failed to match UI extensions for execution info %{public}@: %{public}@", buf, 0x20u);
    }
  }

  return v5 != 0;
}

- (BOOL)canRunOnLocalDevice
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  INIntentDescriptor *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CA5870]);
  -[INAppDescriptor bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, 0);

  objc_msgSend(v5, "applicationState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isInstalled");

  if (v7
    && (objc_msgSend(v5, "in_supportedIntents"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        -[INIntentDescriptor intentClassName](self, "intentClassName"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "containsObject:", v9),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    v11 = 1;
  }
  else
  {
    v17 = 0;
    -[INIntentDescriptor _extensionsWithError:](self, "_extensionsWithError:", &v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v17;
    v14 = objc_msgSend(v12, "count");
    v11 = v14 != 0;
    if (!v14)
    {
      if (v13)
      {
        v15 = INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v19 = "-[INIntentDescriptor canRunOnLocalDevice]";
          v20 = 2114;
          v21 = self;
          v22 = 2114;
          v23 = v13;
          _os_log_error_impl(&dword_18BEBC000, v15, OS_LOG_TYPE_ERROR, "%s Failed to match extensions for execution info %{public}@: %{public}@", buf, 0x20u);
        }
      }
    }

  }
  return v11;
}

- (id)_matchingAttributesForExtensionPoint:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CB2A28]);

  -[INIntentDescriptor intentClassName](self, "intentClassName");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    v22[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("IntentsSupported"));

  }
  -[INAppDescriptor bundleURL](self, "bundleURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[INAppDescriptor bundleIdentifier](self, "bundleIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (!v11 && v12)
  {
    -[INIntentDescriptor launchableApplicationRecord](self, "launchableApplicationRecord");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v11 || !v13)
  {
    if (v11)
    {
      objc_msgSend(v11, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D7D448]);

    }
    a4 = v7;
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot match extensions for \"%@\" because it does not have a bundle URL"), v13, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2938];
    v21 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 2005, v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

- (id)_extensionsWithError:(id *)a3
{
  NSArray *extensions;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  NSArray *v15;
  NSArray *v16;
  uint64_t v17;
  void *v18;
  NSArray *v19;
  NSArray *v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  extensions = self->_extensions;
  if (extensions)
    return extensions;
  -[INAppDescriptor extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[INIntentDescriptor _matchingAttributesForExtensionPoint:error:](self, "_matchingAttributesForExtensionPoint:error:", CFSTR("com.apple.intents-service"), a3);
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      objc_msgSend(MEMORY[0x1E0CB35D8], "extensionsWithMatchingAttributes:error:", v17, a3);
      v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v20 = self->_extensions;
      self->_extensions = v19;

      goto LABEL_9;
    }
LABEL_13:

    return 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_13;
  v8 = v7;
  objc_msgSend(v7, "attributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("IntentsSupported"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentDescriptor intentClassName](self, "intentClassName");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[INIntentDescriptor intentClassName](self, "intentClassName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v10, "containsObject:", v13);

    if (!v14)
    {

      goto LABEL_13;
    }
  }
  v22[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v16 = self->_extensions;
  self->_extensions = v15;

LABEL_9:
  extensions = self->_extensions;
  return extensions;
}

- (id)_uiExtensionsWithError:(id *)a3
{
  NSArray *uiExtensions;
  void *v6;
  uint64_t v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;
  uint64_t v11;
  void *v12;
  NSArray *v13;
  NSArray *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  uiExtensions = self->_uiExtensions;
  if (uiExtensions)
    return uiExtensions;
  -[INIntentDescriptor uiExtensionBundleIdentifier](self, "uiExtensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[INIntentDescriptor _matchingAttributesForExtensionPoint:error:](self, "_matchingAttributesForExtensionPoint:error:", CFSTR("com.apple.intents-ui-service"), a3);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(MEMORY[0x1E0CB35D8], "extensionsWithMatchingAttributes:error:", v11, a3);
      v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v14 = self->_uiExtensions;
      self->_uiExtensions = v13;

      goto LABEL_7;
    }
LABEL_10:

    return 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", v6, a3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_10;
  v8 = (void *)v7;
  v16[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v10 = self->_uiExtensions;
  self->_uiExtensions = v9;

LABEL_7:
  uiExtensions = self->_uiExtensions;
  return uiExtensions;
}

- (INIntentDescriptor)initWithCoder:(id)a3
{
  id v4;
  INIntentDescriptor *v5;
  uint64_t v6;
  NSString *intentClassName;
  uint64_t v8;
  NSString *displayableBundleIdentifier;
  uint64_t v10;
  NSString *uiExtensionBundleIdentifier;
  INIntentDescriptor *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)INIntentDescriptor;
  v5 = -[INAppDescriptor initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intentClassName"));
    v6 = objc_claimAutoreleasedReturnValue();
    intentClassName = v5->_intentClassName;
    v5->_intentClassName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayableBundleIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    displayableBundleIdentifier = v5->_displayableBundleIdentifier;
    v5->_displayableBundleIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uiExtensionBundleIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    uiExtensionBundleIdentifier = v5->_uiExtensionBundleIdentifier;
    v5->_uiExtensionBundleIdentifier = (NSString *)v10;

    v5->_preferredCallProvider = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("preferredCallProvider"));
    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)INIntentDescriptor;
  v4 = a3;
  -[INAppDescriptor encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[INIntentDescriptor intentClassName](self, "intentClassName", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("intentClassName"));

  -[INIntentDescriptor displayableBundleIdentifier](self, "displayableBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("displayableBundleIdentifier"));

  -[INIntentDescriptor uiExtensionBundleIdentifier](self, "uiExtensionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("uiExtensionBundleIdentifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[INIntentDescriptor preferredCallProvider](self, "preferredCallProvider"), CFSTR("preferredCallProvider"));
}

- (NSString)intentClassName
{
  return self->_intentClassName;
}

- (NSString)displayableBundleIdentifier
{
  return self->_displayableBundleIdentifier;
}

- (NSString)uiExtensionBundleIdentifier
{
  return self->_uiExtensionBundleIdentifier;
}

- (int64_t)preferredCallProvider
{
  return self->_preferredCallProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiExtensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_displayableBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_intentClassName, 0);
  objc_storeStrong((id *)&self->_uiExtensions, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
