@implementation LNPropertyMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateActionIdentifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_valueType, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (LNPropertyMetadata)initWithIdentifier:(id)a3 valueType:(id)a4 title:(id)a5 capabilities:(unint64_t)a6 updateActionIdentifier:(id)a7 optional:(BOOL)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  LNPropertyMetadata *v19;
  uint64_t v20;
  NSString *identifier;
  uint64_t v22;
  LNValueType *valueType;
  LNPropertyMetadata *v24;
  void *v26;
  objc_super v27;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNPropertyMetadata.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("valueType"));

  }
  v27.receiver = self;
  v27.super_class = (Class)LNPropertyMetadata;
  v19 = -[LNPropertyMetadata init](&v27, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v15, "copy");
    identifier = v19->_identifier;
    v19->_identifier = (NSString *)v20;

    v22 = objc_msgSend(v16, "copy");
    valueType = v19->_valueType;
    v19->_valueType = (LNValueType *)v22;

    objc_storeStrong((id *)&v19->_title, a5);
    v19->_capabilities = a6;
    objc_storeStrong((id *)&v19->_updateActionIdentifier, a7);
    v19->_optional = a8;
    v24 = v19;
  }

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  LNPropertyMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  LNPropertyMetadata *v10;

  v4 = [LNPropertyMetadata alloc];
  -[LNPropertyMetadata identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNPropertyMetadata valueType](self, "valueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNPropertyMetadata title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[LNPropertyMetadata capabilities](self, "capabilities");
  -[LNPropertyMetadata updateActionIdentifier](self, "updateActionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[LNPropertyMetadata initWithIdentifier:valueType:title:capabilities:updateActionIdentifier:optional:](v4, "initWithIdentifier:valueType:title:capabilities:updateActionIdentifier:optional:", v5, v6, v7, v8, v9, -[LNPropertyMetadata isOptional](self, "isOptional"));

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[LNPropertyMetadata identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[LNPropertyMetadata valueType](self, "valueType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("valueType"));

  -[LNPropertyMetadata title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("title"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[LNPropertyMetadata capabilities](self, "capabilities"), CFSTR("capabilities"));
  -[LNPropertyMetadata updateActionIdentifier](self, "updateActionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("updateActionIdentifier"));

  objc_msgSend(v8, "encodeBool:forKey:", -[LNPropertyMetadata isOptional](self, "isOptional"), CFSTR("isOptional"));
}

- (LNPropertyMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  LNPropertyMetadata *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("valueType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("capabilities"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("updateActionIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[LNPropertyMetadata initWithIdentifier:valueType:title:capabilities:updateActionIdentifier:optional:](self, "initWithIdentifier:valueType:title:capabilities:updateActionIdentifier:optional:", v5, v6, v7, v8, v9, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isOptional")));

    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  LNPropertyMetadata *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  const __CFString *v16;
  void *v17;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNPropertyMetadata identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNPropertyMetadata valueType](self, "valueType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNPropertyMetadata title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self;
  v10 = (void *)objc_opt_new();
  if ((-[LNPropertyMetadata capabilities](v9, "capabilities") & 1) != 0)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[LNPropertyMetadata updateActionIdentifier](v9, "updateActionIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("U<%@>"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v13);

  }
  if ((-[LNPropertyMetadata capabilities](v9, "capabilities") & 2) != 0)
    objc_msgSend(v10, "addObject:", CFSTR("Def"));
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR("|"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[LNPropertyMetadata isOptional](v9, "isOptional");
  v16 = CFSTR("NO");
  if (v15)
    v16 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, identifier: %@, valueType: %@, title: %@, capabilities: %@, isOptional: %@>"), v5, v9, v6, v7, v8, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[LNPropertyMetadata valueType](self, "valueType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNPropertyMetadata identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[LNPropertyMetadata title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  LNPropertyMetadata *v4;
  LNPropertyMetadata *v5;
  LNPropertyMetadata *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  unint64_t v30;
  _BOOL4 v31;
  int v33;
  id v34;
  void *v35;
  id v36;

  v4 = (LNPropertyMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_39:

      goto LABEL_40;
    }
    -[LNPropertyMetadata valueType](self, "valueType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNPropertyMetadata valueType](v6, "valueType");
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
        goto LABEL_37;
      v15 = objc_msgSend(v9, "isEqual:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_38:

        goto LABEL_39;
      }
    }
    -[LNPropertyMetadata identifier](self, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNPropertyMetadata identifier](v6, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      v20 = v14;
      if (!v14 || !v18)
        goto LABEL_36;
      v21 = objc_msgSend(v14, "isEqualToString:", v18);

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_37:

        goto LABEL_38;
      }
    }
    -[LNPropertyMetadata title](self, "title");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNPropertyMetadata title](v6, "title");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v22;
    v24 = v23;
    v19 = v24;
    v36 = v20;
    if (v20 == v24)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v25 = v24;
      if (!v20 || !v24)
        goto LABEL_35;
      LODWORD(v12) = objc_msgSend(v20, "isEqual:", v24);

      if (!(_DWORD)v12)
        goto LABEL_36;
    }
    v35 = v19;
    -[LNPropertyMetadata updateActionIdentifier](self, "updateActionIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNPropertyMetadata updateActionIdentifier](v6, "updateActionIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v26;
    v28 = v27;
    v29 = v28;
    if (v12 == v28)
    {
      v34 = v28;

    }
    else
    {
      if (!v12 || !v28)
      {

        v25 = v29;
        v20 = v12;
        LOBYTE(v12) = 0;
        v19 = v35;
        goto LABEL_35;
      }
      v33 = objc_msgSend(v12, "isEqual:", v28);
      v34 = v29;

      if (!v33)
        goto LABEL_32;
    }
    v30 = -[LNPropertyMetadata capabilities](self, "capabilities");
    if (v30 == -[LNPropertyMetadata capabilities](v6, "capabilities"))
    {
      v31 = -[LNPropertyMetadata isOptional](self, "isOptional");
      v20 = v12;
      LODWORD(v12) = v31 ^ -[LNPropertyMetadata isOptional](v6, "isOptional") ^ 1;
LABEL_33:
      v25 = v34;
      v19 = v35;
LABEL_35:

      v20 = v36;
LABEL_36:

      goto LABEL_37;
    }
LABEL_32:
    v20 = v12;
    LOBYTE(v12) = 0;
    goto LABEL_33;
  }
  LOBYTE(v12) = 1;
LABEL_40:

  return (char)v12;
}

- (id)copyWithDescriptiveMetadataFromProperty:(id)a3 usingLibraryKey:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = (_QWORD *)-[LNPropertyMetadata copy](self, "copy");
  objc_msgSend(v7, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[LNPropertyMetadata schemaStringForStaticDeferredLocalizedString:usingLibraryKey:](self, "schemaStringForStaticDeferredLocalizedString:usingLibraryKey:", v9, v6);
  v10 = objc_claimAutoreleasedReturnValue();

  v11 = (void *)v8[4];
  v8[4] = v10;

  return v8;
}

- (id)schemaStringForStaticDeferredLocalizedString:(id)a3 usingLibraryKey:(id)a4
{
  id v5;
  id v6;
  LNStaticDeferredLocalizedString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  LNStaticDeferredLocalizedString *v12;

  v5 = a4;
  v6 = a3;
  v7 = [LNStaticDeferredLocalizedString alloc];
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "key");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringWithFormat:", CFSTR("[%@] %@"), v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("file:///System/Library/Frameworks/AppIntents.framework/"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[LNStaticDeferredLocalizedString initWithKey:table:bundleURL:](v7, "initWithKey:table:bundleURL:", v10, CFSTR("AssistantSchemas"), v11);

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (LNValueType)valueType
{
  return self->_valueType;
}

- (LNStaticDeferredLocalizedString)title
{
  return self->_title;
}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

- (NSString)updateActionIdentifier
{
  return self->_updateActionIdentifier;
}

- (BOOL)isOptional
{
  return self->_optional;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNPropertyMetadata)initWithIdentifier:(id)a3 valueType:(id)a4 title:(id)a5 capabilities:(unint64_t)a6 updateActionIdentifier:(id)a7
{
  return -[LNPropertyMetadata initWithIdentifier:valueType:title:capabilities:updateActionIdentifier:optional:](self, "initWithIdentifier:valueType:title:capabilities:updateActionIdentifier:optional:", a3, a4, a5, a6, a7, 0);
}

- (LNPropertyMetadata)initWithIdentifier:(id)a3 valueType:(id)a4 title:(id)a5
{
  return -[LNPropertyMetadata initWithIdentifier:valueType:title:capabilities:updateActionIdentifier:](self, "initWithIdentifier:valueType:title:capabilities:updateActionIdentifier:", a3, a4, a5, 0, 0);
}

- (LNPropertyMetadata)initWithIdentifier:(id)a3 valueType:(id)a4 title:(id)a5 capabilities:(unint64_t)a6
{
  return -[LNPropertyMetadata initWithIdentifier:valueType:title:capabilities:updateActionIdentifier:](self, "initWithIdentifier:valueType:title:capabilities:updateActionIdentifier:", a3, a4, a5, a6, 0);
}

@end
