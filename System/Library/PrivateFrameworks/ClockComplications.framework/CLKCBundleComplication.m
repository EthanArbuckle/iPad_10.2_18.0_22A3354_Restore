@implementation CLKCBundleComplication

+ (id)complicationWithBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4 complicationDescriptor:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBundleIdentifier:appBundleIdentifier:complicationDescriptor:", v10, v9, v8);

  return v11;
}

+ (id)complicationWithBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBundleIdentifier:appBundleIdentifier:complicationDescriptor:", v7, v6, 0);

  return v8;
}

- (CLKCBundleComplication)initWithBundleIdentifier:(id)a3 appBundleIdentifier:(id)a4 complicationDescriptor:(id)a5
{
  id v8;
  id v9;
  id v10;
  CLKCBundleComplication *v11;
  uint64_t v12;
  NSString *bundleIdentifier;
  uint64_t v14;
  NSString *appBundleIdentifier;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CLKCBundleComplication;
  v11 = -[CLKCBundleComplication init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    bundleIdentifier = v11->_bundleIdentifier;
    v11->_bundleIdentifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    appBundleIdentifier = v11->_appBundleIdentifier;
    v11->_appBundleIdentifier = (NSString *)v14;

    objc_storeStrong((id *)&v11->_complicationDescriptor, a5);
  }

  return v11;
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
  v9.super_class = (Class)CLKCBundleComplication;
  -[CLKCBundleComplication description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKCBundleComplication bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKCBundleComplication appBundleIdentifier](self, "appBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: bundleId=%@, appBundleId=%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[CLKCBundleComplication bundleIdentifier](self, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7 || objc_msgSend(v6, "isEqual:", v7))
    {
      -[CLKCBundleComplication complicationDescriptor](self, "complicationDescriptor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "complicationDescriptor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == v9)
        v10 = 1;
      else
        v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[CLKCBundleComplication bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CLKCBundleComplication complicationDescriptor](self, "complicationDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLKCBundleComplication)initWithCoder:(id)a3
{
  id v4;
  CLKCBundleComplication *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  uint64_t v8;
  NSString *appBundleIdentifier;
  uint64_t v10;
  CLKComplicationDescriptor *complicationDescriptor;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLKCBundleComplication;
  v5 = -[CLKCBundleComplication init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CLKCBundleComplicationBundleIdentifierKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CLKCBundleComplicationAppBundleIdentifierKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    appBundleIdentifier = v5->_appBundleIdentifier;
    v5->_appBundleIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CLKCBundleComplicationComplicationDescriptorKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    complicationDescriptor = v5->_complicationDescriptor;
    v5->_complicationDescriptor = (CLKComplicationDescriptor *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleIdentifier;
  id v5;

  bundleIdentifier = self->_bundleIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleIdentifier, CFSTR("CLKCBundleComplicationBundleIdentifierKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appBundleIdentifier, CFSTR("CLKCBundleComplicationAppBundleIdentifierKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_complicationDescriptor, CFSTR("CLKCBundleComplicationComplicationDescriptorKey"));

}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (CLKComplicationDescriptor)complicationDescriptor
{
  return self->_complicationDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationDescriptor, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
