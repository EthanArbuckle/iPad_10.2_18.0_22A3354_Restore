@implementation LNContentTypeMetadata

- (LNContentTypeMetadata)initWithExportableTypes:(id)a3 importableTypes:(id)a4
{
  id v7;
  id v8;
  LNContentTypeMetadata *v9;
  LNContentTypeMetadata *v10;
  LNContentTypeMetadata *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LNContentTypeMetadata;
  v9 = -[LNContentTypeMetadata init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_exportableTypes, a3);
    objc_storeStrong((id *)&v10->_importableTypes, a4);
    v11 = v10;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[LNContentTypeMetadata exportableTypes](self, "exportableTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNContentTypeMetadata importableTypes](self, "importableTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  LNContentTypeMetadata *v4;
  LNContentTypeMetadata *v5;
  LNContentTypeMetadata *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v4 = (LNContentTypeMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_20:

      goto LABEL_21;
    }
    -[LNContentTypeMetadata exportableTypes](self, "exportableTypes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNContentTypeMetadata exportableTypes](v6, "exportableTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
      {
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      v12 = objc_msgSend(v9, "isEqualToArray:", v10);

      if (!v12)
        goto LABEL_19;
    }
    -[LNContentTypeMetadata importableTypes](self, "importableTypes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNContentTypeMetadata importableTypes](v6, "importableTypes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v15;
    v17 = v16;
    v13 = v17;
    if (v14 == v17)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v14 && v17)
        LOBYTE(v12) = objc_msgSend(v14, "isEqualToArray:", v17);
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

- (LNContentTypeMetadata)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  LNContentTypeMetadata *v13;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("exportableTypes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("importableTypes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[LNContentTypeMetadata initWithExportableTypes:importableTypes:](self, "initWithExportableTypes:importableTypes:", v8, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNContentTypeMetadata exportableTypes](self, "exportableTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("exportableTypes"));

  -[LNContentTypeMetadata importableTypes](self, "importableTypes");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("importableTypes"));

}

- (NSArray)exportableTypes
{
  return self->_exportableTypes;
}

- (NSArray)importableTypes
{
  return self->_importableTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importableTypes, 0);
  objc_storeStrong((id *)&self->_exportableTypes, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
