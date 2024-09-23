@implementation FCAssetKeyContentArchive

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
    v7 = -[NSData isEqual:](self->_wrappingKeyID, "isEqual:", v6[2]);
  else
    v7 = 0;

  return v7;
}

- (unint64_t)hash
{
  return -[NSData hash](self->_wrappingKeyID, "hash");
}

- (id)description
{
  FCDescription *v3;
  void *v4;

  v3 = -[FCDescription initWithObject:]([FCDescription alloc], "initWithObject:", self);
  -[FCDescription addField:object:](v3, "addField:object:", CFSTR("wrappingKeyID"), self->_wrappingKeyID);
  -[FCDescription addField:object:](v3, "addField:object:", CFSTR("wrappingKey"), self->_wrappingKey);
  -[FCDescription descriptionString](v3, "descriptionString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCAssetKeyContentArchive)initWithCoder:(id)a3
{
  id v4;
  FCAssetKeyContentArchive *v5;
  uint64_t v6;
  NSData *wrappingKey;
  uint64_t v8;
  NSData *wrappingKeyID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCAssetKeyContentArchive;
  v5 = -[FCAssetKeyContentArchive init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wrappingKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    wrappingKey = v5->_wrappingKey;
    v5->_wrappingKey = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wrappingKeyID"));
    v8 = objc_claimAutoreleasedReturnValue();
    wrappingKeyID = v5->_wrappingKeyID;
    v5->_wrappingKeyID = (NSData *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *wrappingKey;
  id v5;

  wrappingKey = self->_wrappingKey;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", wrappingKey, CFSTR("wrappingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_wrappingKeyID, CFSTR("wrappingKeyID"));

}

- (id)unarchiveIntoContentContext:(id)a3
{
  void *v4;
  void *v5;
  FCContentUnarchiveResult *v6;
  int64_t v7;

  objc_msgSend(a3, "internalContentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetKeyCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWrappingKey:forWrappingKeyID:", self->_wrappingKey, self->_wrappingKeyID);

  v6 = [FCContentUnarchiveResult alloc];
  v7 = -[FCAssetKeyContentArchive storageSize](self, "storageSize");
  return -[FCContentUnarchiveResult initWithInterestToken:storageSize:](v6, "initWithInterestToken:storageSize:", MEMORY[0x1E0C9AA60], v7);
}

- (id)manifest
{
  FCContentManifest *v3;
  void *v4;
  FCContentManifest *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = [FCContentManifest alloc];
  v7[0] = self->_wrappingKeyID;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FCContentManifest initWithAssetWrappingKeyIDs:](v3, "initWithAssetWrappingKeyIDs:", v4);

  return v5;
}

- (int64_t)storageSize
{
  return -[NSData length](self->_wrappingKey, "length");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappingKeyID, 0);
  objc_storeStrong((id *)&self->_wrappingKey, 0);
}

@end
