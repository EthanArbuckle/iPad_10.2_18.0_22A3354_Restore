@implementation LNVocabulary

- (LNVocabulary)initWithTerm:(id)a3 traits:(id)a4
{
  id v7;
  id v8;
  void *v9;
  LNVocabulary *v10;
  uint64_t v11;
  NSString *term;
  uint64_t v13;
  NSDictionary *traits;
  LNVocabulary *v15;
  void *v17;
  void *v18;
  objc_super v19;

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
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNVocabulary.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("term"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNVocabulary.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("traits"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNVocabulary;
  v10 = -[LNVocabulary init](&v19, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    term = v10->_term;
    v10->_term = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    traits = v10->_traits;
    v10->_traits = (NSDictionary *)v13;

    v15 = v10;
  }

  return v10;
}

- (LNVocabulary)initWithTerm:(id)a3 appSettingName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  LNVocabulary *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("model");
  v11[1] = CFSTR("name");
  v12[0] = CFSTR("appSetting");
  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "copy");
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[LNVocabulary initWithTerm:traits:](self, "initWithTerm:traits:", v6, v8);

  return v9;
}

- (LNVocabulary)initWithTerm:(id)a3 entityTypeName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  LNVocabulary *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("model");
  v11[1] = CFSTR("name");
  v12[0] = CFSTR("appEntityType");
  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "copy");
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[LNVocabulary initWithTerm:traits:](self, "initWithTerm:traits:", v6, v8);

  return v9;
}

- (LNVocabulary)initWithTerm:(id)a3 entityIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  LNVocabulary *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("appEntity");
  v15[0] = CFSTR("model");
  v15[1] = CFSTR("id");
  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "instanceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  v16[1] = v9;
  v15[2] = CFSTR("name");
  objc_msgSend(v6, "typeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v10, "copy");
  v16[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[LNVocabulary initWithTerm:traits:](self, "initWithTerm:traits:", v7, v12);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNVocabulary term](self, "term");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("term"));

  -[LNVocabulary traits](self, "traits");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("traits"));

}

- (LNVocabulary)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  LNVocabulary *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("term"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("traits"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10)
  {
    v11 = 0;
  }
  else
  {
    self = -[LNVocabulary initWithTerm:traits:](self, "initWithTerm:traits:", v5, v9);
    v11 = self;
  }

  return v11;
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
  -[LNVocabulary term](self, "term");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNVocabulary traits](self, "traits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, term: %@, traits: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[LNVocabulary term](self, "term");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNVocabulary traits](self, "traits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  LNVocabulary *v4;
  LNVocabulary *v5;
  LNVocabulary *v6;
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

  v4 = (LNVocabulary *)a3;
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
    -[LNVocabulary term](self, "term");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNVocabulary term](v6, "term");
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
    -[LNVocabulary traits](self, "traits");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNVocabulary traits](v6, "traits");
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
        LOBYTE(v12) = objc_msgSend(v14, "isEqualToDictionary:", v17);
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

- (NSString)term
{
  return self->_term;
}

- (NSDictionary)traits
{
  return self->_traits;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_term, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
