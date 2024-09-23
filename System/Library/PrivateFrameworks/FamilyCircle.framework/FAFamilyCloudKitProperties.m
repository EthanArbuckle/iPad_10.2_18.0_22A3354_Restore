@implementation FAFamilyCloudKitProperties

- (FAFamilyCloudKitProperties)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  FAFamilyCloudKitProperties *v5;
  uint64_t v6;
  NSDictionary *dictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FAFamilyCloudKitProperties;
  v5 = -[FAFamilyCloudKitProperties init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v6;

  }
  return v5;
}

- (FAFamilyCloudKitProperties)initWithCoder:(id)a3
{
  id v4;
  FAFamilyCloudKitProperties *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSDictionary *dictionary;

  v4 = a3;
  v5 = -[FAFamilyCloudKitProperties init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_dictionary"));
    v11 = objc_claimAutoreleasedReturnValue();
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v11;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_dictionary, CFSTR("_dictionary"));
}

- (NSString)bundleID
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("ck-bundle-id"));
}

- (NSString)shareID
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("ck-share-id"));
}

- (NSString)zoneID
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("ck-zone-id"));
}

- (NSString)participantID
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("ck-participant-id"));
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

@end
