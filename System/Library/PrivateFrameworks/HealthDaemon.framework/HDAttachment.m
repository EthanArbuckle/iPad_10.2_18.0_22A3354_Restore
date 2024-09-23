@implementation HDAttachment

- (HDAttachment)initWithIdentifier:(id)a3 name:(id)a4 type:(id)a5 hash:(id)a6 size:(unint64_t)a7 creationDate:(id)a8 metadata:(id)a9 encryptionKey:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  HDAttachment *v20;
  HDAttachment *v21;
  uint64_t v22;
  NSDictionary *metadata;
  uint64_t v24;
  HDEncryptedArchiveSymmetricKey *encryptionKey;
  id v28;
  id v29;
  id v30;
  objc_super v31;

  v30 = a3;
  v29 = a4;
  v28 = a5;
  v16 = a6;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  v31.receiver = self;
  v31.super_class = (Class)HDAttachment;
  v20 = -[HDAttachment init](&v31, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_identifier, a3);
    objc_storeStrong((id *)&v21->_name, a4);
    objc_storeStrong((id *)&v21->_type, a5);
    objc_storeStrong((id *)&v21->_fileHash, a6);
    v21->_size = a7;
    objc_storeStrong((id *)&v21->_creationDate, a8);
    v22 = objc_msgSend(v18, "copy");
    metadata = v21->_metadata;
    v21->_metadata = (NSDictionary *)v22;

    v24 = objc_msgSend(v19, "copy");
    encryptionKey = v21->_encryptionKey;
    v21->_encryptionKey = (HDEncryptedArchiveSymmetricKey *)v24;

  }
  return v21;
}

- (id)hkAttachment
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB62D0]), "initWithIdentifier:name:typeIdentifier:size:creationDate:metadata:", self->_identifier, self->_name, self->_type, self->_size, self->_creationDate, self->_metadata);
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HDAttachment *v5;
  HDAttachment *v6;
  NSUUID *identifier;
  void *v8;
  NSString *name;
  NSString *v10;
  uint64_t v11;
  NSString *v12;
  void *v13;
  char v14;
  NSString *type;
  NSString *v16;
  uint64_t v17;
  NSString *v18;
  NSString *fileHash;
  uint64_t v20;
  NSString *v21;
  void *v22;
  unint64_t v23;
  NSString *v24;
  unint64_t size;
  NSDate *creationDate;
  uint64_t v27;
  NSDate *v28;
  void *v29;
  void *metadata;
  uint64_t v31;
  NSDictionary *v32;
  HDEncryptedArchiveSymmetricKey *encryptionKey;
  uint64_t v34;
  HDEncryptedArchiveSymmetricKey *v35;
  uint64_t v36;
  HDEncryptedArchiveSymmetricKey *v37;
  void *v38;
  void *v39;
  void *v41;
  HDEncryptedArchiveSymmetricKey *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSString *v49;
  void *v50;
  NSString *v51;
  NSString *v52;
  void *v53;
  void *v54;

  v5 = (HDAttachment *)a3;
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
      -[HDAttachment identifier](v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSUUID isEqual:](identifier, "isEqual:", v8))
      {
        v14 = 0;
LABEL_54:

        goto LABEL_55;
      }
      name = self->_name;
      -[HDAttachment name](v6, "name");
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (name != v10)
      {
        -[HDAttachment name](v6, "name");
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v14 = 0;
          goto LABEL_53;
        }
        v54 = (void *)v11;
        v12 = self->_name;
        -[HDAttachment name](v6, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v12, "isEqualToString:", v13))
        {
          v14 = 0;
LABEL_52:

          goto LABEL_53;
        }
        v53 = v13;
      }
      type = self->_type;
      -[HDAttachment type](v6, "type");
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (type != v16)
      {
        -[HDAttachment type](v6, "type");
        v17 = objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
LABEL_31:

LABEL_32:
          v14 = 0;
          goto LABEL_51;
        }
        v50 = (void *)v17;
        v18 = self->_type;
        -[HDAttachment type](v6, "type");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v18, "isEqualToString:", v3))
        {
LABEL_30:

          goto LABEL_31;
        }
      }
      v52 = type;
      fileHash = self->_fileHash;
      -[HDAttachment fileHash](v6, "fileHash");
      v51 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (fileHash == v51)
      {
        v49 = fileHash;
        size = self->_size;
        if (size == -[HDAttachment size](v6, "size"))
          goto LABEL_23;
      }
      else
      {
        -[HDAttachment fileHash](v6, "fileHash");
        v20 = objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v48 = (void *)v20;
          v49 = fileHash;
          v21 = self->_fileHash;
          -[HDAttachment fileHash](v6, "fileHash");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[NSString isEqualToString:](v21, "isEqualToString:", v22))
          {

            if (v52 == v16)
            {

              goto LABEL_32;
            }
            goto LABEL_30;
          }
          v47 = v22;
          v23 = self->_size;
          if (v23 != -[HDAttachment size](v6, "size"))
          {
            v14 = 0;
            v24 = v51;
LABEL_46:

LABEL_47:
            goto LABEL_48;
          }
LABEL_23:
          creationDate = self->_creationDate;
          -[HDAttachment creationDate](v6, "creationDate");
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = creationDate;
          v29 = (void *)v27;
          if (-[NSDate isEqualToDate:](v28, "isEqualToDate:", v27))
          {
            metadata = self->_metadata;
            -[HDAttachment metadata](v6, "metadata");
            v45 = v29;
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = metadata;
            if (metadata != v46)
            {
              -[HDAttachment metadata](v6, "metadata");
              v31 = objc_claimAutoreleasedReturnValue();
              if (!v31)
              {
                v14 = 0;
LABEL_44:
                v24 = v51;

LABEL_45:
                v22 = v47;
                if (v49 != v24)
                  goto LABEL_46;
LABEL_48:

                if (v52 != v16)
                {

                }
LABEL_51:
                v13 = v53;
                if (name != v10)
                  goto LABEL_52;
LABEL_53:

                goto LABEL_54;
              }
              v43 = (void *)v31;
              v32 = self->_metadata;
              -[HDAttachment metadata](v6, "metadata");
              metadata = (void *)objc_claimAutoreleasedReturnValue();
              if ((-[NSDictionary isEqual:](v32, "isEqual:", metadata) & 1) == 0)
              {

                v14 = 0;
LABEL_59:
                v24 = v51;
                if (v49 == v51)
                  goto LABEL_48;

                goto LABEL_47;
              }
            }
            encryptionKey = self->_encryptionKey;
            -[HDAttachment encryptionKey](v6, "encryptionKey");
            v34 = objc_claimAutoreleasedReturnValue();
            v35 = encryptionKey;
            v14 = encryptionKey == (HDEncryptedArchiveSymmetricKey *)v34;
            if (!v14)
            {
              v42 = (HDEncryptedArchiveSymmetricKey *)v34;
              -[HDAttachment encryptionKey](v6, "encryptionKey");
              v36 = objc_claimAutoreleasedReturnValue();
              if (v36)
              {
                v41 = metadata;
                v37 = self->_encryptionKey;
                v38 = (void *)v36;
                -[HDAttachment encryptionKey](v6, "encryptionKey");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = -[HDEncryptedArchiveSymmetricKey isEqual:](v37, "isEqual:", v39);

                if (v44 == v46)
                {

                }
                else
                {

                }
                goto LABEL_59;
              }
              v35 = v42;
            }

            if (v44 != v46)
            {

              goto LABEL_44;
            }

          }
          else
          {

            v14 = 0;
          }
          v24 = v51;
          goto LABEL_45;
        }
      }
      v14 = 0;
      v24 = v51;
      goto LABEL_48;
    }
    v14 = 0;
  }
LABEL_55:

  return v14;
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
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("Identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("Name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_type, CFSTR("Type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fileHash, CFSTR("Hash"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_size, CFSTR("Size"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("CreationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadata, CFSTR("Metadata"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_encryptionKey, CFSTR("EncryptionKey"));

}

- (HDAttachment)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  HDAttachment *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Hash"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Size"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CreationDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "hk_secureAttachmentCodingClasses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("Metadata"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  if (v5 && v6 && v7 && v8 && v9 >= 1 && v10)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EncryptionKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HDAttachment initWithIdentifier:name:type:hash:size:creationDate:metadata:encryptionKey:](self, "initWithIdentifier:name:type:hash:size:creationDate:metadata:encryptionKey:", v5, v6, v7, v8, v9, v10, v12, v14);

    v13 = self;
  }

  return v13;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)fileHash
{
  return self->_fileHash;
}

- (unint64_t)size
{
  return self->_size;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (HDEncryptedArchiveSymmetricKey)encryptionKey
{
  return self->_encryptionKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionKey, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_fileHash, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
