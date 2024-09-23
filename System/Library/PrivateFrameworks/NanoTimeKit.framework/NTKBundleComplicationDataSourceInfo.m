@implementation NTKBundleComplicationDataSourceInfo

- (NTKBundleComplicationDataSourceInfo)initWithDataSourceClass:(Class)a3
{
  NTKBundleComplicationDataSourceInfo *v4;
  NTKBundleComplicationDataSourceInfo *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  uint64_t v8;
  NSString *appIdentifier;
  uint64_t v10;
  NSString *localizedAppName;
  uint64_t v12;
  NSString *localizedComplicationName;
  uint64_t v14;
  NSString *sectionIdentifier;
  uint64_t v16;
  NSString *appGroupIdentifier;
  uint64_t v18;
  NSNumber *legacyNTKComplicationType;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)NTKBundleComplicationDataSourceInfo;
  v4 = -[NTKBundleComplicationDataSourceInfo init](&v21, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_dataSourceClass, a3);
    -[objc_class bundleIdentifier](a3, "bundleIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    -[objc_class appIdentifier](a3, "appIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    appIdentifier = v5->_appIdentifier;
    v5->_appIdentifier = (NSString *)v8;

    -[objc_class localizedAppName](a3, "localizedAppName");
    v10 = objc_claimAutoreleasedReturnValue();
    localizedAppName = v5->_localizedAppName;
    v5->_localizedAppName = (NSString *)v10;

    -[objc_class localizedComplicationName](a3, "localizedComplicationName");
    v12 = objc_claimAutoreleasedReturnValue();
    localizedComplicationName = v5->_localizedComplicationName;
    v5->_localizedComplicationName = (NSString *)v12;

    -[objc_class sectionIdentifier](a3, "sectionIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    sectionIdentifier = v5->_sectionIdentifier;
    v5->_sectionIdentifier = (NSString *)v14;

    -[objc_class appGroupIdentifier](a3, "appGroupIdentifier");
    v16 = objc_claimAutoreleasedReturnValue();
    appGroupIdentifier = v5->_appGroupIdentifier;
    v5->_appGroupIdentifier = (NSString *)v16;

    -[objc_class legacyNTKComplicationType](a3, "legacyNTKComplicationType");
    v18 = objc_claimAutoreleasedReturnValue();
    legacyNTKComplicationType = v5->_legacyNTKComplicationType;
    v5->_legacyNTKComplicationType = (NSNumber *)v18;

    v5->_useComplicationDescriptorsOnCompanion = -[objc_class useComplicationDescriptorsOnCompanion](a3, "useComplicationDescriptorsOnCompanion");
    v5->_hash = -[objc_class hash](a3, "hash");
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  Class *v4;
  BOOL v5;

  v4 = (Class *)a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4[3] == self->_dataSourceClass;

  return v5;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (Class)dataSourceClass
{
  return self->_dataSourceClass;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (NSString)localizedAppName
{
  return self->_localizedAppName;
}

- (NSString)localizedComplicationName
{
  return self->_localizedComplicationName;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (NSString)appGroupIdentifier
{
  return self->_appGroupIdentifier;
}

- (NSNumber)legacyNTKComplicationType
{
  return self->_legacyNTKComplicationType;
}

- (BOOL)useComplicationDescriptorsOnCompanion
{
  return self->_useComplicationDescriptorsOnCompanion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyNTKComplicationType, 0);
  objc_storeStrong((id *)&self->_appGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedComplicationName, 0);
  objc_storeStrong((id *)&self->_localizedAppName, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_dataSourceClass, 0);
}

@end
