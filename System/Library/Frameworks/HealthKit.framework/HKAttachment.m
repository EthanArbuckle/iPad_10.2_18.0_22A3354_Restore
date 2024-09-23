@implementation HKAttachment

- (HKAttachment)initWithIdentifier:(id)a3 name:(id)a4 typeIdentifier:(id)a5 size:(int64_t)a6 creationDate:(id)a7 metadata:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  HKAttachment *v19;
  HKAttachment *v20;
  uint64_t v21;
  UTType *contentType;
  id v24;
  objc_super v25;

  v24 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)HKAttachment;
  v19 = -[HKAttachment init](&v25, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_identifier, a3);
    objc_storeStrong((id *)&v20->_name, a4);
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v16);
    v21 = objc_claimAutoreleasedReturnValue();
    contentType = v20->_contentType;
    v20->_contentType = (UTType *)v21;

    v20->_size = a6;
    objc_storeStrong((id *)&v20->_creationDate, a7);
    objc_storeStrong((id *)&v20->_metadata, a8);
  }

  return v20;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HKAttachment *v5;
  HKAttachment *v6;
  NSUUID *identifier;
  void *v8;
  NSString *name;
  NSString *v10;
  uint64_t v11;
  NSString *v12;
  void *v13;
  char v14;
  int v15;
  UTType *contentType;
  void *v17;
  int64_t size;
  NSDate *creationDate;
  NSDictionary *metadata;
  NSDictionary *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v26;
  uint64_t v27;
  void *v28;

  v5 = (HKAttachment *)a3;
  if (self == v5)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      identifier = self->_identifier;
      -[HKAttachment identifier](v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSUUID isEqual:](identifier, "isEqual:", v8))
      {
        LOBYTE(v15) = 1;
LABEL_29:

        v14 = v15 ^ 1;
        goto LABEL_30;
      }
      name = self->_name;
      -[HKAttachment name](v6, "name");
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (name != v10)
      {
        -[HKAttachment name](v6, "name");
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          LOBYTE(v15) = 1;
          goto LABEL_28;
        }
        v3 = (void *)v11;
        v12 = self->_name;
        -[HKAttachment name](v6, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v12, "isEqualToString:", v13))
        {
          LOBYTE(v15) = 1;
LABEL_27:

          goto LABEL_28;
        }
        v28 = v13;
      }
      contentType = self->_contentType;
      -[HKAttachment contentType](v6, "contentType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[UTType isEqual:](contentType, "isEqual:", v17)
        || (size = self->_size, size != -[HKAttachment size](v6, "size")))
      {

        LOBYTE(v15) = 1;
        goto LABEL_26;
      }
      creationDate = self->_creationDate;
      -[HKAttachment creationDate](v6, "creationDate");
      v27 = objc_claimAutoreleasedReturnValue();
      if (-[NSDate isEqualToDate:](creationDate, "isEqualToDate:"))
      {
        metadata = self->_metadata;
        v21 = metadata;
        if (!metadata)
        {
          -[HKAttachment metadata](v6, "metadata");
          v22 = objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            v26 = 0;
            LOBYTE(v15) = 0;
            v24 = (void *)v27;
LABEL_24:

            goto LABEL_25;
          }
          v26 = (void *)v22;
          v21 = self->_metadata;
        }
        -[HKAttachment metadata](v6, "metadata");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = !-[NSDictionary isEqualToDictionary:](v21, "isEqualToDictionary:", v23);

        v24 = (void *)v27;
        if (!metadata)
          goto LABEL_24;
      }
      else
      {
        LOBYTE(v15) = 1;
        v24 = (void *)v27;
      }
LABEL_25:

LABEL_26:
      v13 = v28;
      if (name != v10)
        goto LABEL_27;
LABEL_28:

      goto LABEL_29;
    }
    v14 = 0;
  }
LABEL_30:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HKAttachment *v4;
  NSUUID *identifier;
  NSString *name;
  void *v7;
  HKAttachment *v8;

  v4 = +[HKAttachment allocWithZone:](HKAttachment, "allocWithZone:", a3);
  identifier = self->_identifier;
  name = self->_name;
  -[UTType identifier](self->_contentType, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HKAttachment initWithIdentifier:name:typeIdentifier:size:creationDate:metadata:](v4, "initWithIdentifier:name:typeIdentifier:size:creationDate:metadata:", identifier, name, v7, self->_size, self->_creationDate, self->_metadata);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  void *v5;
  id v6;

  identifier = self->_identifier;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", identifier, CFSTR("Identifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_name, CFSTR("Name"));
  -[UTType identifier](self->_contentType, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("TypeIdentifier"));

  objc_msgSend(v6, "encodeInteger:forKey:", self->_size, CFSTR("Size"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_creationDate, CFSTR("CreationDate"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_metadata, CFSTR("Metadata"));

}

- (HKAttachment)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  HKAttachment *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TypeIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Size"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CreationDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "hk_secureCodingClasses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("Metadata"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  if (v5 && v6 && v7 && v8 >= 1 && v9)
  {
    self = -[HKAttachment initWithIdentifier:name:typeIdentifier:size:creationDate:metadata:](self, "initWithIdentifier:name:typeIdentifier:size:creationDate:metadata:", v5, v6, v7, v8, v9, v11);
    v12 = self;
  }

  return v12;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (UTType)contentType
{
  return (UTType *)objc_getProperty(self, a2, 24, 1);
}

- (NSInteger)size
{
  return self->_size;
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
