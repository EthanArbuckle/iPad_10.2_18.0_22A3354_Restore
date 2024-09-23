@implementation HDAttachmentReference

- (HDAttachmentReference)initWithIdentifier:(id)a3 schemaIdentifier:(id)a4 creationDate:(id)a5 options:(int64_t)a6 metadata:(id)a7
{
  return -[HDAttachmentReference initWithIdentifier:schemaIdentifier:creationDate:options:metadata:type:cloudStatus:](self, "initWithIdentifier:schemaIdentifier:creationDate:options:metadata:type:cloudStatus:", a3, a4, a5, a6, a7, 0, 0);
}

- (HDAttachmentReference)initWithIdentifier:(id)a3 schemaIdentifier:(id)a4 creationDate:(id)a5 options:(int64_t)a6 metadata:(id)a7 type:(int64_t)a8 cloudStatus:(int64_t)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  HDAttachmentReference *v20;
  HDAttachmentReference *v21;
  uint64_t v22;
  NSString *schemaIdentifier;
  uint64_t v24;
  NSString *objectIdentifier;
  uint64_t v26;
  NSUUID *attachmentIdentifier;
  objc_super v29;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HDAttachmentReference;
  v20 = -[HDAttachmentReference init](&v29, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_identifier, a3);
    objc_msgSend(v17, "schemaIdentifier");
    v22 = objc_claimAutoreleasedReturnValue();
    schemaIdentifier = v21->_schemaIdentifier;
    v21->_schemaIdentifier = (NSString *)v22;

    v21->_schemaVersion = objc_msgSend(v17, "schemaVersion");
    objc_msgSend(v17, "objectIdentifier");
    v24 = objc_claimAutoreleasedReturnValue();
    objectIdentifier = v21->_objectIdentifier;
    v21->_objectIdentifier = (NSString *)v24;

    objc_msgSend(v17, "attachmentIdentifier");
    v26 = objc_claimAutoreleasedReturnValue();
    attachmentIdentifier = v21->_attachmentIdentifier;
    v21->_attachmentIdentifier = (NSUUID *)v26;

    objc_storeStrong((id *)&v21->_creationDate, a5);
    v21->_options = a6;
    objc_storeStrong((id *)&v21->_metadata, a7);
    v21->_type = a8;
    v21->_cloudStatus = a9;
  }

  return v21;
}

- (HDAttachmentReference)referenceWithObjectIdentifier:(id)a3
{
  id v4;
  HDAttachmentReferenceSchemaIdentifier *v5;
  HDAttachmentReference *v6;
  void *v7;
  void *v8;
  HDAttachmentReference *v9;

  v4 = a3;
  v5 = -[HDAttachmentReferenceSchemaIdentifier initWithSchemaIdentifier:schemaVersion:objectIdentifier:attachmentIdentifier:]([HDAttachmentReferenceSchemaIdentifier alloc], "initWithSchemaIdentifier:schemaVersion:objectIdentifier:attachmentIdentifier:", self->_schemaIdentifier, self->_schemaVersion, v4, self->_attachmentIdentifier);

  v6 = [HDAttachmentReference alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HDAttachmentReference initWithIdentifier:schemaIdentifier:creationDate:options:metadata:type:cloudStatus:](v6, "initWithIdentifier:schemaIdentifier:creationDate:options:metadata:type:cloudStatus:", v7, v5, v8, self->_options, self->_metadata, self->_type, 0);

  return v9;
}

- (id)hkAttachmentReferenceWithAttachment:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  NSUUID *identifier;
  NSString *objectIdentifier;
  void *v9;
  void *v10;

  v4 = (objc_class *)MEMORY[0x1E0CB62E0];
  v5 = a3;
  v6 = [v4 alloc];
  identifier = self->_identifier;
  objectIdentifier = self->_objectIdentifier;
  objc_msgSend(v5, "hkAttachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v6, "_initWithIdentifier:objectIdentifier:attachment:creationDate:metadata:", identifier, objectIdentifier, v9, self->_creationDate, self->_metadata);
  return v10;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HDAttachmentReference *v5;
  HDAttachmentReference *v6;
  NSUUID *identifier;
  void *v8;
  NSString *schemaIdentifier;
  NSString *v10;
  uint64_t v11;
  void *v12;
  NSString *v13;
  BOOL v14;
  NSString *objectIdentifier;
  NSString *v16;
  uint64_t v17;
  NSString *v18;
  uint64_t v19;
  NSString *v20;
  void *v21;
  NSUUID *attachmentIdentifier;
  void *v23;
  NSDate *creationDate;
  int64_t options;
  NSDictionary *metadata;
  NSDictionary *v27;
  uint64_t v28;
  NSDictionary *v29;
  int64_t type;
  int64_t cloudStatus;
  int64_t v33;
  int64_t v34;
  uint64_t v35;
  void *v36;
  NSDictionary *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;

  v5 = (HDAttachmentReference *)a3;
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
      -[HDAttachmentReference identifier](v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSUUID isEqual:](identifier, "isEqual:", v8))
      {
        v14 = 0;
LABEL_36:

        goto LABEL_37;
      }
      schemaIdentifier = self->_schemaIdentifier;
      -[HDAttachmentReference schemaIdentifier](v6, "schemaIdentifier");
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (schemaIdentifier != v10)
      {
        -[HDAttachmentReference schemaIdentifier](v6, "schemaIdentifier");
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v14 = 0;
          goto LABEL_35;
        }
        v12 = (void *)v11;
        v13 = self->_schemaIdentifier;
        -[HDAttachmentReference schemaIdentifier](v6, "schemaIdentifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v13, "isEqualToString:", v3))
        {
          v14 = 0;
LABEL_34:

          goto LABEL_35;
        }
        v43 = v12;
      }
      objectIdentifier = self->_objectIdentifier;
      -[HDAttachmentReference objectIdentifier](v6, "objectIdentifier");
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (objectIdentifier == v16)
      {
        v42 = v3;
      }
      else
      {
        -[HDAttachmentReference objectIdentifier](v6, "objectIdentifier");
        v17 = objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          v14 = 0;
          v12 = v43;
          goto LABEL_33;
        }
        v41 = (void *)v17;
        v18 = self->_objectIdentifier;
        -[HDAttachmentReference objectIdentifier](v6, "objectIdentifier");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = v18;
        v21 = (void *)v19;
        if (!-[NSString isEqualToString:](v20, "isEqualToString:", v19))
        {

          v14 = 0;
          v12 = v43;
          if (schemaIdentifier == v10)
            goto LABEL_35;
          goto LABEL_34;
        }
        v39 = v21;
        v42 = v3;
      }
      attachmentIdentifier = self->_attachmentIdentifier;
      -[HDAttachmentReference attachmentIdentifier](v6, "attachmentIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSUUID isEqual:](attachmentIdentifier, "isEqual:", v23))
      {

        v14 = 0;
LABEL_31:
        if (objectIdentifier == v16)
        {

          v3 = v42;
          v12 = v43;
          if (schemaIdentifier == v10)
            goto LABEL_35;
          goto LABEL_34;
        }

        v3 = v42;
        v12 = v43;
LABEL_33:

        if (schemaIdentifier != v10)
          goto LABEL_34;
LABEL_35:

        goto LABEL_36;
      }
      creationDate = self->_creationDate;
      -[HDAttachmentReference creationDate](v6, "creationDate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSDate isEqualToDate:](creationDate, "isEqualToDate:")
        && (options = self->_options, options == -[HDAttachmentReference options](v6, "options")))
      {
        metadata = self->_metadata;
        v27 = metadata;
        if (metadata)
          goto LABEL_23;
        -[HDAttachmentReference metadata](v6, "metadata");
        v28 = objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          v35 = v28;
          v27 = self->_metadata;
LABEL_23:
          v37 = metadata;
          v29 = v27;
          -[HDAttachmentReference metadata](v6, "metadata", v35);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSDictionary isEqualToDictionary:](v29, "isEqualToDictionary:")
            && (type = self->_type, type == -[HDAttachmentReference type](v6, "type")))
          {
            cloudStatus = self->_cloudStatus;
            v14 = cloudStatus == -[HDAttachmentReference cloudStatus](v6, "cloudStatus");
          }
          else
          {
            v14 = 0;
          }

          if (!v37)
          goto LABEL_30;
        }
        v33 = self->_type;
        if (v33 == -[HDAttachmentReference type](v6, "type"))
        {
          v34 = self->_cloudStatus;
          v14 = v34 == -[HDAttachmentReference cloudStatus](v6, "cloudStatus");
        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }
LABEL_30:

      goto LABEL_31;
    }
    v14 = 0;
  }
LABEL_37:

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
  objc_msgSend(v5, "encodeObject:forKey:", self->_schemaIdentifier, CFSTR("SchemaIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_schemaVersion, CFSTR("SchemaVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_objectIdentifier, CFSTR("ObjectIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attachmentIdentifier, CFSTR("AttachmentIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("CreationDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_options, CFSTR("Options"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadata, CFSTR("Metadata"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("Type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cloudStatus, CFSTR("CloudStatus"));

}

- (HDAttachmentReference)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  HDAttachmentReference *v14;
  HDAttachmentReferenceSchemaIdentifier *v15;
  HDAttachmentReference *v16;
  uint64_t v18;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SchemaIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("SchemaVersion"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ObjectIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AttachmentIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CreationDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("Options"));
  objc_msgSend(MEMORY[0x1E0C99D80], "hk_secureAttachmentCodingClasses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v10, CFSTR("Metadata"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("Type"));
  v13 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("CloudStatus"));

  v14 = 0;
  if (v4 && v5 && v6 && v7 && v8)
  {
    v15 = -[HDAttachmentReferenceSchemaIdentifier initWithSchemaIdentifier:schemaVersion:objectIdentifier:attachmentIdentifier:]([HDAttachmentReferenceSchemaIdentifier alloc], "initWithSchemaIdentifier:schemaVersion:objectIdentifier:attachmentIdentifier:", v5, v18, v6, v7);
    v16 = -[HDAttachmentReference initWithIdentifier:schemaIdentifier:creationDate:options:metadata:type:cloudStatus:](self, "initWithIdentifier:schemaIdentifier:creationDate:options:metadata:type:cloudStatus:", v4, v15, v8, v9, v11, v12, v13);

    v14 = v16;
  }
  else
  {
    v16 = self;
  }

  return v14;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)schemaIdentifier
{
  return self->_schemaIdentifier;
}

- (int64_t)schemaVersion
{
  return self->_schemaVersion;
}

- (NSString)objectIdentifier
{
  return self->_objectIdentifier;
}

- (NSUUID)attachmentIdentifier
{
  return self->_attachmentIdentifier;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (int64_t)options
{
  return self->_options;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)cloudStatus
{
  return self->_cloudStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_attachmentIdentifier, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
  objc_storeStrong((id *)&self->_schemaIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
