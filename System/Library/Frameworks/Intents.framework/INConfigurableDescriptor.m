@implementation INConfigurableDescriptor

- (INConfigurableDescriptor)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 intentClassName:(id)a5
{
  id v8;
  id v9;
  id v10;
  INConfigurableDescriptor *v11;
  uint64_t v12;
  NSString *extensionBundleIdentifier;
  uint64_t v14;
  NSString *kind;
  uint64_t v16;
  NSString *intentClassName;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)INConfigurableDescriptor;
  v11 = -[INConfigurableDescriptor init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    extensionBundleIdentifier = v11->_extensionBundleIdentifier;
    v11->_extensionBundleIdentifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    kind = v11->_kind;
    v11->_kind = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    intentClassName = v11->_intentClassName;
    v11->_intentClassName = (NSString *)v16;

  }
  return v11;
}

- (BOOL)supportsIntent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v22;
  id v23;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  objc_msgSend(v6, "appIntentIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("appintent:%@"), v7);
  else
    objc_msgSend(v4, "_className");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[INConfigurableDescriptor intentClassName](self, "intentClassName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", v8);

  if (v10)
  {
    v23 = 0;
    -[INConfigurableDescriptor _extensionRecordWithError:](self, "_extensionRecordWithError:", &v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v23;
    if (v11)
    {
      v13 = objc_alloc(MEMORY[0x1E0CA5870]);
      objc_msgSend(v4, "_intents_bundleIdForLaunching");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v12;
      v15 = (void *)objc_msgSend(v13, "initWithBundleIdentifier:allowPlaceholder:error:", v14, 0, &v22);
      v16 = v22;

      if (v15)
      {
        objc_msgSend(v11, "containingBundleRecord");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "bundleIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "bundleIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqualToString:", v19);

      }
      else
      {
        v20 = 0;
      }

      v12 = v16;
    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("extensionBundleIdentifier: %@, kind: %@, intentClassName: %@"), self->_extensionBundleIdentifier, self->_kind, self->_intentClassName);
}

- (id)_extensionRecordWithError:(id *)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = objc_alloc(MEMORY[0x1E0CA5848]);
  -[INConfigurableDescriptor extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithBundleIdentifier:error:", v6, a3);

  return v7;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (NSString)intentClassName
{
  return self->_intentClassName;
}

- (NSString)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_intentClassName, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
}

@end
