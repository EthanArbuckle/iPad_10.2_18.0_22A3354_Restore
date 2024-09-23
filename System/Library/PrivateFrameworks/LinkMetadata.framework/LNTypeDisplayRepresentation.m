@implementation LNTypeDisplayRepresentation

- (LNTypeDisplayRepresentation)initWithName:(id)a3 numericFormat:(id)a4 synonyms:(id)a5
{
  id v9;
  id v10;
  id v11;
  LNTypeDisplayRepresentation *v12;
  uint64_t v13;
  LNStaticDeferredLocalizedString *name;
  uint64_t v15;
  LNStaticDeferredLocalizedString *numericFormat;
  uint64_t v17;
  NSArray *synonyms;
  LNTypeDisplayRepresentation *v19;
  void *v21;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNTypeDisplayRepresentation.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  v22.receiver = self;
  v22.super_class = (Class)LNTypeDisplayRepresentation;
  v12 = -[LNTypeDisplayRepresentation init](&v22, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    name = v12->_name;
    v12->_name = (LNStaticDeferredLocalizedString *)v13;

    v15 = objc_msgSend(v10, "copy");
    numericFormat = v12->_numericFormat;
    v12->_numericFormat = (LNStaticDeferredLocalizedString *)v15;

    v17 = objc_msgSend(v11, "copy");
    synonyms = v12->_synonyms;
    v12->_synonyms = (NSArray *)v17;

    v19 = v12;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonyms, 0);
  objc_storeStrong((id *)&self->_numericFormat, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[LNTypeDisplayRepresentation name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[LNTypeDisplayRepresentation numericFormat](self, "numericFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("numericFormat"));

  -[LNTypeDisplayRepresentation synonyms](self, "synonyms");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("synonyms"));

}

- (NSArray)synonyms
{
  return self->_synonyms;
}

- (LNStaticDeferredLocalizedString)numericFormat
{
  return self->_numericFormat;
}

- (LNStaticDeferredLocalizedString)name
{
  return self->_name;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNTypeDisplayRepresentation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  LNTypeDisplayRepresentation *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("numericFormat"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("synonyms"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[LNTypeDisplayRepresentation initWithName:numericFormat:synonyms:](self, "initWithName:numericFormat:synonyms:", v5, v6, v10);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (LNTypeDisplayRepresentation)initWithName:(id)a3 numericFormat:(id)a4
{
  return -[LNTypeDisplayRepresentation initWithName:numericFormat:synonyms:](self, "initWithName:numericFormat:synonyms:", a3, a4, 0);
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[LNTypeDisplayRepresentation name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNTypeDisplayRepresentation numericFormat](self, "numericFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[LNTypeDisplayRepresentation synonyms](self, "synonyms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  LNTypeDisplayRepresentation *v4;
  LNTypeDisplayRepresentation *v5;
  LNTypeDisplayRepresentation *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;

  v4 = (LNTypeDisplayRepresentation *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_27:

      goto LABEL_28;
    }
    -[LNTypeDisplayRepresentation name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNTypeDisplayRepresentation name](v6, "name");
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
        goto LABEL_25;
      v15 = objc_msgSend(v9, "isEqual:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    -[LNTypeDisplayRepresentation numericFormat](self, "numericFormat");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNTypeDisplayRepresentation numericFormat](v6, "numericFormat");
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
      {
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      v12 = objc_msgSend(v14, "isEqual:", v18);

      if (!v12)
        goto LABEL_25;
    }
    -[LNTypeDisplayRepresentation synonyms](self, "synonyms");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNTypeDisplayRepresentation synonyms](v6, "synonyms");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v21;
    v23 = v22;
    v19 = v23;
    if (v20 == v23)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v20 && v23)
        LOBYTE(v12) = objc_msgSend(v20, "isEqual:", v23);
    }

    goto LABEL_24;
  }
  LOBYTE(v12) = 1;
LABEL_28:

  return v12;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNTypeDisplayRepresentation name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNTypeDisplayRepresentation numericFormat](self, "numericFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNTypeDisplayRepresentation synonyms](self, "synonyms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, name: %@, numericFormat: %@>, synonyms: %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
