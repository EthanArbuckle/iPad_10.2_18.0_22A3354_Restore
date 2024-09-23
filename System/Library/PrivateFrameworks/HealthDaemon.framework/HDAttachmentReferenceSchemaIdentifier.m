@implementation HDAttachmentReferenceSchemaIdentifier

- (HDAttachmentReferenceSchemaIdentifier)initWithSchemaIdentifier:(id)a3 schemaVersion:(int64_t)a4 objectIdentifier:(id)a5 attachmentIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  HDAttachmentReferenceSchemaIdentifier *v14;
  HDAttachmentReferenceSchemaIdentifier *v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HDAttachmentReferenceSchemaIdentifier;
  v14 = -[HDAttachmentReferenceSchemaIdentifier init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_schemaIdentifier, a3);
    v15->_schemaVersion = a4;
    objc_storeStrong((id *)&v15->_objectIdentifier, a5);
    objc_storeStrong((id *)&v15->_attachmentIdentifier, a6);
  }

  return v15;
}

+ (id)tombstoneSchemaIdentifier
{
  HDAttachmentReferenceSchemaIdentifier *v2;
  void *v3;
  HDAttachmentReferenceSchemaIdentifier *v4;

  v2 = [HDAttachmentReferenceSchemaIdentifier alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
  v4 = -[HDAttachmentReferenceSchemaIdentifier initWithSchemaIdentifier:schemaVersion:objectIdentifier:attachmentIdentifier:](v2, "initWithSchemaIdentifier:schemaVersion:objectIdentifier:attachmentIdentifier:", &stru_1E6D11BB8, 0, &stru_1E6D11BB8, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  NSString *schemaIdentifier;
  NSString *v8;
  uint64_t v9;
  NSString *v10;
  void *v11;
  int64_t v12;
  char v13;
  int64_t schemaVersion;
  NSString *objectIdentifier;
  NSString *v16;
  uint64_t v17;
  void *v18;
  NSString *v19;
  uint64_t v20;
  NSString *v21;
  void *v22;
  NSUUID *attachmentIdentifier;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSUUID *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  NSString *v34;
  void *v35;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    schemaIdentifier = self->_schemaIdentifier;
    objc_msgSend(v6, "schemaIdentifier");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (schemaIdentifier == v8)
    {
      schemaVersion = self->_schemaVersion;
      if (schemaVersion == objc_msgSend(v6, "schemaVersion"))
        goto LABEL_9;
    }
    else
    {
      objc_msgSend(v6, "schemaIdentifier");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v3 = (void *)v9;
        v10 = self->_schemaIdentifier;
        objc_msgSend(v6, "schemaIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((-[NSString isEqual:](v10, "isEqual:", v11) & 1) == 0
          || (v12 = self->_schemaVersion, v12 != objc_msgSend(v6, "schemaVersion")))
        {
          v13 = 0;
LABEL_28:

          goto LABEL_29;
        }
        v35 = v11;
LABEL_9:
        objectIdentifier = self->_objectIdentifier;
        objc_msgSend(v6, "objectIdentifier");
        v16 = (NSString *)objc_claimAutoreleasedReturnValue();
        if (objectIdentifier == v16)
        {
          v34 = objectIdentifier;
        }
        else
        {
          objc_msgSend(v6, "objectIdentifier");
          v17 = objc_claimAutoreleasedReturnValue();
          if (!v17)
          {
            v13 = 0;
            goto LABEL_26;
          }
          v18 = (void *)v17;
          v19 = self->_objectIdentifier;
          objc_msgSend(v6, "objectIdentifier");
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = v19;
          v22 = (void *)v20;
          if ((-[NSString isEqual:](v21, "isEqual:", v20) & 1) == 0)
          {

            v13 = 0;
            goto LABEL_27;
          }
          v31 = v22;
          v33 = v18;
          v34 = objectIdentifier;
        }
        attachmentIdentifier = self->_attachmentIdentifier;
        objc_msgSend(v6, "attachmentIdentifier", v31);
        v24 = objc_claimAutoreleasedReturnValue();
        v13 = attachmentIdentifier == (NSUUID *)v24;
        if (attachmentIdentifier == (NSUUID *)v24)
        {

        }
        else
        {
          v25 = (void *)v24;
          objc_msgSend(v6, "attachmentIdentifier");
          v26 = objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            v27 = (void *)v26;
            v28 = self->_attachmentIdentifier;
            objc_msgSend(v6, "attachmentIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = -[NSUUID isEqual:](v28, "isEqual:", v29);

            if (v34 == v16)
            {

              goto LABEL_27;
            }
            goto LABEL_25;
          }

        }
        if (v34 != v16)
        {
LABEL_25:

        }
LABEL_26:

LABEL_27:
        v11 = v35;
        if (schemaIdentifier != v8)
          goto LABEL_28;
LABEL_29:

        goto LABEL_30;
      }
    }
    v13 = 0;
    goto LABEL_29;
  }
  v13 = 0;
LABEL_30:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_schemaIdentifier, "hash");
  v4 = -[NSString hash](self->_objectIdentifier, "hash") ^ v3;
  return v4 ^ -[NSUUID hash](self->_attachmentIdentifier, "hash");
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentIdentifier, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
  objc_storeStrong((id *)&self->_schemaIdentifier, 0);
}

@end
