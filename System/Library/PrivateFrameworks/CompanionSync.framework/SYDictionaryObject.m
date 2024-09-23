@implementation SYDictionaryObject

- (SYDictionaryObject)initWithProperties:(id)a3
{
  id v4;
  SYDictionaryObject *v5;
  SYDictionaryObject *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SYDictionaryObject;
  v5 = -[SYDictionaryObject init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[SYDictionaryObject setProperties:](v5, "setProperties:", v4);

  return v6;
}

- (void)setProperties:(id)a3
{
  NSDictionary *v4;
  NSDictionary *properties;
  id v6;

  v4 = (NSDictionary *)a3;
  -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("kSYDictionaryObjectSyncIDKey"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("Invalid dictionary"), CFSTR("SYDictionaryObject properties dictionaries must contain an NSString for the kSYDictionaryObjectSyncIDKey key"));
  properties = self->_properties;
  self->_properties = v4;

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SYDictionaryObject properties](self, "properties");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SYDictProperties"));

}

- (SYDictionaryObject)initWithCoder:(id)a3
{
  id v4;
  SYDictionaryObject *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SYDictionaryObject;
  v5 = -[SYDictionaryObject init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SYDictProperties"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYDictionaryObject setProperties:](v5, "setProperties:", v6);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)syncId
{
  void *v2;
  void *v3;

  -[SYDictionaryObject properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kSYDictionaryObjectSyncIDKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
