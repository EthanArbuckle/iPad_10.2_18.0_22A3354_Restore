@implementation LNDynamicTerm

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_term, 0);
}

- (LNDynamicTerm)initWithTerm:(id)a3 entityIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  LNDynamicTerm *v10;
  uint64_t v11;
  NSString *term;
  LNDynamicTerm *v13;
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
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNDynamicTerm.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("term"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNDynamicTerm.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)LNDynamicTerm;
  v10 = -[LNDynamicTerm init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    term = v10->_term;
    v10->_term = (NSString *)v11;

    objc_storeStrong((id *)&v10->_entityIdentifier, a4);
    v13 = v10;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  LNDynamicTerm *v4;
  LNDynamicTerm *v5;
  LNDynamicTerm *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;

  v4 = (LNDynamicTerm *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_15:

      goto LABEL_16;
    }
    -[LNDynamicTerm term](self, "term");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNDynamicTerm term](v6, "term");
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
        goto LABEL_13;
      v12 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v12)
        goto LABEL_14;
    }
    -[LNDynamicTerm entityIdentifier](self, "entityIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNDynamicTerm entityIdentifier](v6, "entityIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v12) = objc_msgSend(v14, "isEqual:", v13);
LABEL_13:

LABEL_14:
    goto LABEL_15;
  }
  LOBYTE(v12) = 1;
LABEL_16:

  return v12;
}

- (NSString)term
{
  return self->_term;
}

- (LNEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (LNDynamicTerm)initWithTerm:(id)a3 entityIdentifierValue:(id)a4 entityTypeName:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  LNDynamicTerm *v13;

  v8 = (objc_class *)MEMORY[0x1E0D43C88];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend([v8 alloc], "initWithTypeIdentifier:instanceIdentifier:", v9, v10);

  v13 = -[LNDynamicTerm initWithTerm:entityIdentifier:](self, "initWithTerm:entityIdentifier:", v11, v12);
  return v13;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNDynamicTerm term](self, "term");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNDynamicTerm entityIdentifier](self, "entityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, term: %@, entityIdentifier: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[LNDynamicTerm term](self, "term");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNDynamicTerm entityIdentifier](self, "entityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

@end
