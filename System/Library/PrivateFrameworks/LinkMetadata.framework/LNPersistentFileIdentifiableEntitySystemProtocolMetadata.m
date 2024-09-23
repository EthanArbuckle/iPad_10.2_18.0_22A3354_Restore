@implementation LNPersistentFileIdentifiableEntitySystemProtocolMetadata

- (LNPersistentFileIdentifiableEntitySystemProtocolMetadata)initWithSupportedContentTypes:(id)a3
{
  id v5;
  LNPersistentFileIdentifiableEntitySystemProtocolMetadata *v6;
  LNPersistentFileIdentifiableEntitySystemProtocolMetadata *v7;
  LNPersistentFileIdentifiableEntitySystemProtocolMetadata *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LNPersistentFileIdentifiableEntitySystemProtocolMetadata;
  v6 = -[LNPersistentFileIdentifiableEntitySystemProtocolMetadata init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_supportedContentTypes, a3);
    v8 = v7;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LNPersistentFileIdentifiableEntitySystemProtocolMetadata supportedContentTypes](self, "supportedContentTypes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("supportedContentTypes"));

}

- (LNPersistentFileIdentifiableEntitySystemProtocolMetadata)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  LNPersistentFileIdentifiableEntitySystemProtocolMetadata *v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("supportedContentTypes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[LNPersistentFileIdentifiableEntitySystemProtocolMetadata initWithSupportedContentTypes:](self, "initWithSupportedContentTypes:", v8);
  return v9;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNPersistentFileIdentifiableEntitySystemProtocolMetadata supportedContentTypes](self, "supportedContentTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, supportedContentTypes: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[LNPersistentFileIdentifiableEntitySystemProtocolMetadata supportedContentTypes](self, "supportedContentTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  LNPersistentFileIdentifiableEntitySystemProtocolMetadata *v4;
  LNPersistentFileIdentifiableEntitySystemProtocolMetadata *v5;
  LNPersistentFileIdentifiableEntitySystemProtocolMetadata *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v4 = (LNPersistentFileIdentifiableEntitySystemProtocolMetadata *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[LNPersistentFileIdentifiableEntitySystemProtocolMetadata supportedContentTypes](self, "supportedContentTypes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNPersistentFileIdentifiableEntitySystemProtocolMetadata supportedContentTypes](v6, "supportedContentTypes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7;
      v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        v12 = 1;
      }
      else
      {
        v12 = 0;
        if (v9 && v10)
          v12 = objc_msgSend(v9, "isEqualToArray:", v10);
      }

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (NSArray)supportedContentTypes
{
  return self->_supportedContentTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedContentTypes, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
