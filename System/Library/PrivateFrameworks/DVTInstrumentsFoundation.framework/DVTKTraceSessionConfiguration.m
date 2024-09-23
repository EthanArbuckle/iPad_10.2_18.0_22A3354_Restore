@implementation DVTKTraceSessionConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DVTKTraceSessionConfiguration)init
{
  DVTKTraceSessionConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DVTKTraceSessionConfiguration;
  result = -[DVTKTraceSessionConfiguration init](&v3, sel_init);
  if (result)
    result->_collectionInterval = 100;
  return result;
}

- (DVTKTraceSessionConfiguration)initWithCoder:(id)a3
{
  id v4;
  DVTKTraceSessionConfiguration *v5;
  uint64_t v6;
  NSData *bitmap;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSDictionary *providers;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DVTKTraceSessionConfiguration;
  v5 = -[DVTKTraceSessionConfiguration init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bitmap"));
    v6 = objc_claimAutoreleasedReturnValue();
    bitmap = v5->_bitmap;
    v5->_bitmap = (NSData *)v6;

    v5->_useExisting = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_useExisting"));
    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_providers"));
    v11 = objc_claimAutoreleasedReturnValue();
    providers = v5->_providers;
    v5->_providers = (NSDictionary *)v11;

    v5->_collectionInterval = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_collectionInterval"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *bitmap;
  id v5;

  bitmap = self->_bitmap;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bitmap, CFSTR("_bitmap"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_useExisting, CFSTR("_useExisting"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_providers, CFSTR("_providers"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_collectionInterval, CFSTR("_collectionInterval"));

}

- (NSData)bitmap
{
  return self->_bitmap;
}

- (void)setBitmap:(id)a3
{
  objc_storeStrong((id *)&self->_bitmap, a3);
}

- (BOOL)useExisting
{
  return self->_useExisting;
}

- (void)setUseExisting:(BOOL)a3
{
  self->_useExisting = a3;
}

- (NSDictionary)providers
{
  return self->_providers;
}

- (void)setProviders:(id)a3
{
  objc_storeStrong((id *)&self->_providers, a3);
}

- (unint64_t)collectionInterval
{
  return self->_collectionInterval;
}

- (void)setCollectionInterval:(unint64_t)a3
{
  self->_collectionInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providers, 0);
  objc_storeStrong((id *)&self->_bitmap, 0);
}

@end
