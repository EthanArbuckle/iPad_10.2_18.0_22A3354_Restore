@implementation NTKBundleComplicationIdentifierCacheModel

- (NTKBundleComplicationIdentifierCacheModel)initWithBuildVersion:(id)a3
{
  id v5;
  NTKBundleComplicationIdentifierCacheModel *v6;
  NTKBundleComplicationIdentifierCacheModel *v7;
  uint64_t v8;
  NSDictionary *dataSourceToBundleIdentifier;
  uint64_t v10;
  NSDictionary *legacyComplicationTypeToDataSourceIdentifier;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKBundleComplicationIdentifierCacheModel;
  v6 = -[NTKBundleComplicationIdentifierCacheModel init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_buildVersion, a3);
    v8 = objc_opt_new();
    dataSourceToBundleIdentifier = v7->_dataSourceToBundleIdentifier;
    v7->_dataSourceToBundleIdentifier = (NSDictionary *)v8;

    v10 = objc_opt_new();
    legacyComplicationTypeToDataSourceIdentifier = v7->_legacyComplicationTypeToDataSourceIdentifier;
    v7->_legacyComplicationTypeToDataSourceIdentifier = (NSDictionary *)v10;

  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *buildVersion;
  id v5;

  buildVersion = self->_buildVersion;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", buildVersion, CFSTR("NTKBundleComplicationIdentifierCacheModelBuildVersionKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dataSourceToBundleIdentifier, CFSTR("NTKBundleComplicationIdentifierCacheModelDatasourceToBundleIdentifierKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_legacyComplicationTypeToDataSourceIdentifier, CFSTR("NTKBundleComplicationIdentifierCacheModeLegacyComplicationTypeToDataSourceIdentifierKey"));

}

- (NTKBundleComplicationIdentifierCacheModel)initWithCoder:(id)a3
{
  id v4;
  NTKBundleComplicationIdentifierCacheModel *v5;
  uint64_t v6;
  NSString *buildVersion;
  uint64_t v8;
  uint64_t v9;
  NSDictionary *dataSourceToBundleIdentifier;
  uint64_t v11;
  uint64_t v12;
  NSDictionary *legacyComplicationTypeToDataSourceIdentifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NTKBundleComplicationIdentifierCacheModel;
  v5 = -[NTKBundleComplicationIdentifierCacheModel init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NTKBundleComplicationIdentifierCacheModelBuildVersionKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    buildVersion = v5->_buildVersion;
    v5->_buildVersion = (NSString *)v6;

    v8 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v8, objc_opt_class(), CFSTR("NTKBundleComplicationIdentifierCacheModelDatasourceToBundleIdentifierKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    dataSourceToBundleIdentifier = v5->_dataSourceToBundleIdentifier;
    v5->_dataSourceToBundleIdentifier = (NSDictionary *)v9;

    v11 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v11, objc_opt_class(), CFSTR("NTKBundleComplicationIdentifierCacheModeLegacyComplicationTypeToDataSourceIdentifierKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    legacyComplicationTypeToDataSourceIdentifier = v5->_legacyComplicationTypeToDataSourceIdentifier;
    v5->_legacyComplicationTypeToDataSourceIdentifier = (NSDictionary *)v12;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSDictionary)dataSourceToBundleIdentifier
{
  return self->_dataSourceToBundleIdentifier;
}

- (void)setDataSourceToBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)legacyComplicationTypeToDataSourceIdentifier
{
  return self->_legacyComplicationTypeToDataSourceIdentifier;
}

- (void)setLegacyComplicationTypeToDataSourceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyComplicationTypeToDataSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_dataSourceToBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
}

@end
