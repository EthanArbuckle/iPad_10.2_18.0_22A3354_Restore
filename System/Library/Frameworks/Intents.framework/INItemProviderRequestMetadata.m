@implementation INItemProviderRequestMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (INItemProviderRequestMetadata)initWithMetadata:(id)a3 supportedContentTypes:(id)a4
{
  id v6;
  id v7;
  INItemProviderRequestMetadata *v8;
  uint64_t v9;
  NSData *metadata;
  uint64_t v11;
  NSArray *supportedContentTypes;
  INItemProviderRequestMetadata *v13;

  v6 = a3;
  v7 = a4;
  v8 = -[INItemProviderRequestMetadata init](self, "init");
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    metadata = v8->_metadata;
    v8->_metadata = (NSData *)v9;

    v11 = objc_msgSend(v7, "copy");
    supportedContentTypes = v8->_supportedContentTypes;
    v8->_supportedContentTypes = (NSArray *)v11;

    v13 = v8;
  }

  return v8;
}

- (INItemProviderRequestMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  INItemProviderRequestMetadata *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadata"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("supportedContentTypes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[INItemProviderRequestMetadata initWithMetadata:supportedContentTypes:](self, "initWithMetadata:supportedContentTypes:", v5, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *metadata;
  id v5;

  metadata = self->_metadata;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", metadata, CFSTR("metadata"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedContentTypes, CFSTR("supportedContentTypes"));

}

- (NSData)metadata
{
  return self->_metadata;
}

- (NSArray)supportedContentTypes
{
  return self->_supportedContentTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedContentTypes, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
