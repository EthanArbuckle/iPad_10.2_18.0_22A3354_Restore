@implementation NSSUsageDataAppBundle

- (NSSUsageDataAppBundle)initWithName:(id)a3 bundleIdentifier:(id)a4 bundleVersion:(id)a5 vendor:(id)a6 size:(id)a7 supportsPurge:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSSUsageDataAppBundle *v18;
  NSSUsageDataAppBundle *v19;
  id v22;
  objc_super v23;

  v22 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)NSSUsageDataAppBundle;
  v18 = -[NSSUsageDataAppBundle init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_name, a3);
    objc_storeStrong((id *)&v19->_bundleIdentifier, a4);
    objc_storeStrong((id *)&v19->_bundleVersion, a5);
    objc_storeStrong((id *)&v19->_vendor, a6);
    objc_storeStrong((id *)&v19->_size, a7);
    v19->_supportsManualPurge = a8;
  }

  return v19;
}

- (id)withSize:(id)a3 purge:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSSUsageDataAppBundle *v7;

  v4 = a4;
  v6 = a3;
  v7 = -[NSSUsageDataAppBundle initWithName:bundleIdentifier:bundleVersion:vendor:size:supportsPurge:]([NSSUsageDataAppBundle alloc], "initWithName:bundleIdentifier:bundleVersion:vendor:size:supportsPurge:", self->_name, self->_bundleIdentifier, self->_bundleVersion, self->_vendor, v6, v4);

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (NSString)vendor
{
  return self->_vendor;
}

- (BOOL)supportsManualPurge
{
  return self->_supportsManualPurge;
}

- (NSSSizeVector)size
{
  return self->_size;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_vendor, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (id)mergeWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSSUsageDataAppBundle *v9;

  v4 = a3;
  if (v4)
  {
    -[NSSUsageDataAppBundle size](self, "size");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "size");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "plus:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSSUsageDataAppBundle supportsManualPurge](self, "supportsManualPurge"))
      v8 = 1;
    else
      v8 = objc_msgSend(v4, "supportsManualPurge");
    -[NSSUsageDataAppBundle withSize:purge:](self, "withSize:purge:", v7, v8);
    v9 = (NSSUsageDataAppBundle *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = self;
  }

  return v9;
}

@end
