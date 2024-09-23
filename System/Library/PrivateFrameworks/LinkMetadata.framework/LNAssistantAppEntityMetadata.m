@implementation LNAssistantAppEntityMetadata

- (LNAssistantAppEntityMetadata)initWithEntityIdentifier:(id)a3 kind:(int64_t)a4 phraseTemplates:(id)a5
{
  id v9;
  id v10;
  void *v11;
  LNAssistantAppEntityMetadata *v12;
  uint64_t v13;
  NSString *entityIdentifier;
  uint64_t v15;
  NSArray *phraseTemplates;
  LNAssistantAppEntityMetadata *v17;
  void *v19;
  void *v20;
  objc_super v21;

  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAssistantAppEntityMetadata.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entityIdentifier"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAssistantAppEntityMetadata.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("phraseTemplates"));

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)LNAssistantAppEntityMetadata;
  v12 = -[LNAssistantAppEntityMetadata init](&v21, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    entityIdentifier = v12->_entityIdentifier;
    v12->_entityIdentifier = (NSString *)v13;

    v12->_kind = a4;
    v15 = objc_msgSend(v11, "copy");
    phraseTemplates = v12->_phraseTemplates;
    v12->_phraseTemplates = (NSArray *)v15;

    v17 = v12;
  }

  return v12;
}

- (LNAssistantAppEntityMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  LNAssistantAppEntityMetadata *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (LNAssistantAppEntityMetadata *)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kind"));
    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0C99E60];
      v8 = objc_opt_class();
      objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("phraseTemplates"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        v6 = -[LNAssistantAppEntityMetadata initWithEntityIdentifier:kind:phraseTemplates:]([LNAssistantAppEntityMetadata alloc], "initWithEntityIdentifier:kind:phraseTemplates:", v5, v6, v10);
      else
        v6 = 0;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNAssistantAppEntityMetadata entityIdentifier](self, "entityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("entityIdentifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[LNAssistantAppEntityMetadata kind](self, "kind"), CFSTR("kind"));
  -[LNAssistantAppEntityMetadata phraseTemplates](self, "phraseTemplates");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("phraseTemplates"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAssistantAppEntityMetadata entityIdentifier](self, "entityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[LNAssistantAppEntityMetadata kind](self, "kind");
  -[LNAssistantAppEntityMetadata phraseTemplates](self, "phraseTemplates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, entityIdentifier: %@, kind: %ld, phraseTemplates: %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  unint64_t v7;

  -[LNAssistantAppEntityMetadata entityIdentifier](self, "entityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[LNAssistantAppEntityMetadata kind](self, "kind") ^ v4;
  -[LNAssistantAppEntityMetadata phraseTemplates](self, "phraseTemplates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  LNAssistantAppEntityMetadata *v4;
  LNAssistantAppEntityMetadata *v5;
  LNAssistantAppEntityMetadata *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  int64_t v15;
  void *v16;
  void *v17;
  id v18;

  v4 = (LNAssistantAppEntityMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_22:

      goto LABEL_23;
    }
    -[LNAssistantAppEntityMetadata entityIdentifier](self, "entityIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAssistantAppEntityMetadata entityIdentifier](v6, "entityIdentifier");
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
        goto LABEL_20;
      v12 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v12)
        goto LABEL_21;
    }
    v15 = -[LNAssistantAppEntityMetadata kind](self, "kind");
    if (v15 != -[LNAssistantAppEntityMetadata kind](v6, "kind"))
    {
      LOBYTE(v12) = 0;
LABEL_21:

      goto LABEL_22;
    }
    -[LNAssistantAppEntityMetadata phraseTemplates](self, "phraseTemplates");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAssistantAppEntityMetadata phraseTemplates](v6, "phraseTemplates");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v14 && v18)
        LOBYTE(v12) = objc_msgSend(v14, "isEqualToArray:", v18);
    }

LABEL_20:
    goto LABEL_21;
  }
  LOBYTE(v12) = 1;
LABEL_23:

  return v12;
}

- (NSString)entityIdentifier
{
  return self->_entityIdentifier;
}

- (int64_t)kind
{
  return self->_kind;
}

- (NSArray)phraseTemplates
{
  return self->_phraseTemplates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phraseTemplates, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
