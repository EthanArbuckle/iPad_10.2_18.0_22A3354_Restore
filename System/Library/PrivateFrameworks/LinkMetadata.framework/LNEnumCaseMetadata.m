@implementation LNEnumCaseMetadata

- (LNEnumCaseMetadata)initWithIdentifier:(id)a3 displayRepresentation:(id)a4
{
  id v7;
  id v8;
  void *v9;
  LNEnumCaseMetadata *v10;
  uint64_t v11;
  NSString *identifier;
  LNEnumCaseMetadata *v13;
  void *v15;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNEnumMetadata.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNEnumMetadata.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayRepresentation"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)LNEnumCaseMetadata;
  v10 = -[LNEnumCaseMetadata init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    objc_storeStrong((id *)&v10->_displayRepresentation, a4);
    v13 = v10;
  }

  return v10;
}

- (LNDisplayRepresentation)displayRepresentation
{
  return self->_displayRepresentation;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayRepresentation, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LNEnumCaseMetadata;
  v3 = -[LNEnumCaseMetadata hash](&v9, sel_hash);
  -[LNEnumCaseMetadata identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[LNEnumCaseMetadata displayRepresentation](self, "displayRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v3;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  LNEnumCaseMetadata *v4;
  LNEnumCaseMetadata *v5;
  LNEnumCaseMetadata *v6;
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

  v4 = (LNEnumCaseMetadata *)a3;
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
    -[LNEnumCaseMetadata identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNEnumCaseMetadata identifier](v6, "identifier");
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
      v12 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v12)
        goto LABEL_19;
    }
    -[LNEnumCaseMetadata displayRepresentation](self, "displayRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNEnumCaseMetadata displayRepresentation](v6, "displayRepresentation");
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
        LOBYTE(v12) = objc_msgSend(v14, "isEqual:", v17);
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

- (LNEnumCaseMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  LNEnumCaseMetadata *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[LNEnumCaseMetadata initWithIdentifier:displayRepresentation:](self, "initWithIdentifier:displayRepresentation:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNEnumCaseMetadata identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[LNEnumCaseMetadata displayRepresentation](self, "displayRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("displayRepresentation"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
