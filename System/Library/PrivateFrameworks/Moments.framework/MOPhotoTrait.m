@implementation MOPhotoTrait

- (MOPhotoTrait)initWithIdentifier:(id)a3 name:(id)a4 relevantAssetUUIDs:(id)a5
{
  id v9;
  id v10;
  id v11;
  MOPhotoTrait *v12;
  MOPhotoTrait *v13;
  uint64_t v14;
  NSArray *relevantAssetUUIDs;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MOPhotoTrait;
  v12 = -[MOPhotoTrait init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_name, a4);
    v14 = objc_msgSend(v11, "copy");
    relevantAssetUUIDs = v13->_relevantAssetUUIDs;
    v13->_relevantAssetUUIDs = (NSArray *)v14;

  }
  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MOPhotoTrait identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOPhotoTrait name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOPhotoTrait relevantAssetUUIDs](self, "relevantAssetUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<MOPhotoTrait localIdentifier, %@, name, %@, relevantAssetUUIDs, %@,>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relevantAssetUUIDs, CFSTR("relevantAssetUUIDs"));

}

- (MOPhotoTrait)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  MOPhotoTrait *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("relevantAssetUUIDs"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[MOPhotoTrait initWithIdentifier:name:relevantAssetUUIDs:](self, "initWithIdentifier:name:relevantAssetUUIDs:", v5, v6, v10);
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOPhotoTrait *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MOPhotoTrait *v11;

  v4 = [MOPhotoTrait alloc];
  -[MOPhotoTrait identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[MOPhotoTrait name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[MOPhotoTrait relevantAssetUUIDs](self, "relevantAssetUUIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  v11 = -[MOPhotoTrait initWithIdentifier:name:relevantAssetUUIDs:](v4, "initWithIdentifier:name:relevantAssetUUIDs:", v6, v8, v10);

  return v11;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSArray)relevantAssetUUIDs
{
  return self->_relevantAssetUUIDs;
}

- (void)setRelevantAssetUUIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevantAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
