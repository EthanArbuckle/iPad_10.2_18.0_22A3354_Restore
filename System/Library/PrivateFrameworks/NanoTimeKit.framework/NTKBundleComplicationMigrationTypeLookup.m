@implementation NTKBundleComplicationMigrationTypeLookup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *buildVersion;
  id v5;

  buildVersion = self->_buildVersion;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", buildVersion, CFSTR("buildVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dictionary, CFSTR("dictionary"));

}

- (NTKBundleComplicationMigrationTypeLookup)initWithCoder:(id)a3
{
  id v4;
  NTKBundleComplicationMigrationTypeLookup *v5;
  uint64_t v6;
  NSString *buildVersion;
  uint64_t v8;
  uint64_t v9;
  NSDictionary *dictionary;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NTKBundleComplicationMigrationTypeLookup;
  v5 = -[NTKBundleComplicationMigrationTypeLookup init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("buildVersion"));
    v6 = objc_claimAutoreleasedReturnValue();
    buildVersion = v5->_buildVersion;
    v5->_buildVersion = (NSString *)v6;

    v8 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v8, objc_opt_class(), CFSTR("dictionary"));
    v9 = objc_claimAutoreleasedReturnValue();
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v9;

  }
  return v5;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_buildVersion, a3);
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_dictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
}

@end
