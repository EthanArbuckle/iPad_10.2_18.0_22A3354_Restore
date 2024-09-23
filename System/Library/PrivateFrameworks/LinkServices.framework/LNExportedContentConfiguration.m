@implementation LNExportedContentConfiguration

- (LNExportedContentConfiguration)initWithContentType:(id)a3 preferredExtractionType:(int64_t)a4
{
  id v7;
  char *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  char *v12;
  void *v14;
  objc_super v15;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNExportedContentConfiguration.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentType"));

  }
  v15.receiver = self;
  v15.super_class = (Class)LNExportedContentConfiguration;
  v8 = -[LNExportedContentConfiguration init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    v10 = (void *)*((_QWORD *)v8 + 1);
    *((_QWORD *)v8 + 1) = v9;

    *((_QWORD *)v8 + 2) = a4;
    *(_QWORD *)&v11 = -1;
    *((_QWORD *)&v11 + 1) = -1;
    *(_OWORD *)(v8 + 24) = v11;
    *(_OWORD *)(v8 + 40) = v11;
    v12 = v8;
  }

  return (LNExportedContentConfiguration *)v8;
}

- (LNExportedContentConfiguration)initWithContentType:(id)a3 preferredExtractionType:(int64_t)a4 auditToken:(id *)a5
{
  id v9;
  char *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  char *v14;
  void *v16;
  objc_super v17;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNExportedContentConfiguration.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentType"));

  }
  v17.receiver = self;
  v17.super_class = (Class)LNExportedContentConfiguration;
  v10 = -[LNExportedContentConfiguration init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v9, "copy");
    v12 = (void *)*((_QWORD *)v10 + 1);
    *((_QWORD *)v10 + 1) = v11;

    *((_QWORD *)v10 + 2) = a4;
    v13 = *(_OWORD *)a5->var0;
    *(_OWORD *)(v10 + 40) = *(_OWORD *)&a5->var0[4];
    *(_OWORD *)(v10 + 24) = v13;
    v14 = v10;
  }

  return (LNExportedContentConfiguration *)v10;
}

- (LNExportedContentConfiguration)configurationWithAuditToken:(id *)a3
{
  id v5;
  void *v6;
  int64_t v7;
  __int128 v8;
  void *v9;
  _OWORD v11[2];

  v5 = objc_alloc((Class)objc_opt_class());
  -[LNExportedContentConfiguration contentType](self, "contentType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[LNExportedContentConfiguration preferredExtractionType](self, "preferredExtractionType");
  v8 = *(_OWORD *)&a3->var0[4];
  v11[0] = *(_OWORD *)a3->var0;
  v11[1] = v8;
  v9 = (void *)objc_msgSend(v5, "initWithContentType:preferredExtractionType:auditToken:", v6, v7, v11);

  return (LNExportedContentConfiguration *)v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNExportedContentConfiguration contentType](self, "contentType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[LNExportedContentConfiguration preferredExtractionType](self, "preferredExtractionType");
  v9 = CFSTR("File");
  if (v8 == 1)
    v9 = CFSTR("Data");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, contentType: %@, preferredExtractionType: %@>"), v5, self, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  -[LNExportedContentConfiguration contentType](self, "contentType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("contentType"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[LNExportedContentConfiguration preferredExtractionType](self, "preferredExtractionType"), CFSTR("preferredExtractionType"));
  v6 = (void *)MEMORY[0x1E0C99D50];
  -[LNExportedContentConfiguration auditToken](self, "auditToken");
  objc_msgSend(v6, "if_dataWithAuditToken:", &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("auditToken"));

}

- (LNExportedContentConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  LNExportedContentConfiguration *v8;
  _OWORD v10[2];
  __int128 v11;
  __int128 v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("preferredExtractionType"));
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("auditToken"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "if_auditToken");
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
  }

  v10[0] = v11;
  v10[1] = v12;
  v8 = -[LNExportedContentConfiguration initWithContentType:preferredExtractionType:auditToken:](self, "initWithContentType:preferredExtractionType:auditToken:", v5, v6, v10);

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[LNExportedContentConfiguration contentType](self, "contentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[LNExportedContentConfiguration preferredExtractionType](self, "preferredExtractionType") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  LNExportedContentConfiguration *v4;
  LNExportedContentConfiguration *v5;
  LNExportedContentConfiguration *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  BOOL v13;
  int64_t v14;

  v4 = (LNExportedContentConfiguration *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v13 = 0;
LABEL_16:

      goto LABEL_17;
    }
    -[LNExportedContentConfiguration contentType](self, "contentType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNExportedContentConfiguration contentType](v6, "contentType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      if (!v9 || !v10)
      {

LABEL_14:
        v13 = 0;
        goto LABEL_15;
      }
      v12 = objc_msgSend(v9, "isEqual:", v10);

      if (!v12)
        goto LABEL_14;
    }
    v14 = -[LNExportedContentConfiguration preferredExtractionType](self, "preferredExtractionType");
    v13 = v14 == -[LNExportedContentConfiguration preferredExtractionType](v6, "preferredExtractionType");
LABEL_15:

    goto LABEL_16;
  }
  v13 = 1;
LABEL_17:

  return v13;
}

- (LNContentType)contentType
{
  return self->_contentType;
}

- (int64_t)preferredExtractionType
{
  return self->_preferredExtractionType;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setAuditToken:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_auditToken.val[4] = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_auditToken.val = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
