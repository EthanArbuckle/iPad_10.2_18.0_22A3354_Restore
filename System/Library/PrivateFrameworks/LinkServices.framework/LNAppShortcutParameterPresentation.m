@implementation LNAppShortcutParameterPresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNAppShortcutParameterPresentation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  LNAppShortcutParameterPresentation *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedSpecificTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("optionsCollections"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  if (v5 && v6)
  {
    self = -[LNAppShortcutParameterPresentation initWithParameterIdentifier:localizedSpecificTitle:optionsCollections:](self, "initWithParameterIdentifier:localizedSpecificTitle:optionsCollections:", v5, v6, v10);
    v11 = self;
  }

  return v11;
}

- (LNAppShortcutParameterPresentation)initWithParameterIdentifier:(id)a3 localizedSpecificTitle:(id)a4 optionsCollections:(id)a5
{
  id v9;
  id v10;
  id v11;
  LNAppShortcutParameterPresentation *v12;
  uint64_t v13;
  NSString *parameterIdentifier;
  uint64_t v15;
  NSString *localizedSpecificTitle;
  uint64_t v17;
  NSArray *optionsCollections;
  LNAppShortcutParameterPresentation *v19;
  void *v21;
  void *v22;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAppShortcutParameterPresentation.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameterIdentifier"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAppShortcutParameterPresentation.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localizedSpecificTitle"));

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)LNAppShortcutParameterPresentation;
  v12 = -[LNAppShortcutParameterPresentation init](&v23, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    parameterIdentifier = v12->_parameterIdentifier;
    v12->_parameterIdentifier = (NSString *)v13;

    v15 = objc_msgSend(v10, "copy");
    localizedSpecificTitle = v12->_localizedSpecificTitle;
    v12->_localizedSpecificTitle = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    optionsCollections = v12->_optionsCollections;
    v12->_optionsCollections = (NSArray *)v17;

    v19 = v12;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsCollections, 0);
  objc_storeStrong((id *)&self->_localizedSpecificTitle, 0);
  objc_storeStrong((id *)&self->_parameterIdentifier, 0);
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
  -[LNAppShortcutParameterPresentation parameterIdentifier](self, "parameterIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAppShortcutParameterPresentation localizedSpecificTitle](self, "localizedSpecificTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAppShortcutParameterPresentation optionsCollections](self, "optionsCollections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, parameterIdentifier: %@, localizedSpecificTitle: %@,optionsCollections: %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  LNAppShortcutParameterPresentation *v4;
  LNAppShortcutParameterPresentation *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  objc_super v24;

  v4 = (LNAppShortcutParameterPresentation *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)LNAppShortcutParameterPresentation;
    if (-[LNAppShortcutParameterPresentation isEqual:](&v24, sel_isEqual_, v4))
    {
      v5 = v4;
      if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        LOBYTE(v11) = 0;
LABEL_29:

        goto LABEL_30;
      }
      -[LNAppShortcutParameterPresentation parameterIdentifier](self, "parameterIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNAppShortcutParameterPresentation parameterIdentifier](v5, "parameterIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {

      }
      else
      {
        LOBYTE(v11) = 0;
        v12 = v9;
        v13 = v8;
        if (!v8 || !v9)
          goto LABEL_27;
        v14 = objc_msgSend(v8, "isEqualToString:", v9);

        if (!v14)
        {
          LOBYTE(v11) = 0;
LABEL_28:

          goto LABEL_29;
        }
      }
      -[LNAppShortcutParameterPresentation localizedSpecificTitle](self, "localizedSpecificTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNAppShortcutParameterPresentation localizedSpecificTitle](v5, "localizedSpecificTitle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v15;
      v17 = v16;
      v12 = v17;
      if (v13 == v17)
      {

      }
      else
      {
        LOBYTE(v11) = 0;
        v18 = v17;
        v19 = v13;
        if (!v13 || !v17)
        {
LABEL_26:

LABEL_27:
          goto LABEL_28;
        }
        v11 = objc_msgSend(v13, "isEqualToString:", v17);

        if (!v11)
          goto LABEL_27;
      }
      -[LNAppShortcutParameterPresentation optionsCollections](self, "optionsCollections");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNAppShortcutParameterPresentation optionsCollections](v5, "optionsCollections");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v20;
      v22 = v21;
      v18 = v22;
      if (v19 == v22)
      {
        LOBYTE(v11) = 1;
      }
      else
      {
        LOBYTE(v11) = 0;
        if (v19 && v22)
          LOBYTE(v11) = objc_msgSend(v19, "isEqual:", v22);
      }

      goto LABEL_26;
    }
    LOBYTE(v11) = 0;
  }
LABEL_30:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)LNAppShortcutParameterPresentation;
  v3 = -[LNAppShortcutParameterPresentation hash](&v11, sel_hash);
  -[LNAppShortcutParameterPresentation parameterIdentifier](self, "parameterIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[LNAppShortcutParameterPresentation localizedSpecificTitle](self, "localizedSpecificTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[LNAppShortcutParameterPresentation optionsCollections](self, "optionsCollections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash") ^ v3;

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[LNAppShortcutParameterPresentation parameterIdentifier](self, "parameterIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("parameterIdentifier"));

  -[LNAppShortcutParameterPresentation localizedSpecificTitle](self, "localizedSpecificTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("localizedSpecificTitle"));

  -[LNAppShortcutParameterPresentation optionsCollections](self, "optionsCollections");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("optionsCollections"));

}

- (NSString)parameterIdentifier
{
  return self->_parameterIdentifier;
}

- (NSString)localizedSpecificTitle
{
  return self->_localizedSpecificTitle;
}

- (NSArray)optionsCollections
{
  return self->_optionsCollections;
}

- (NSString)localizedGenericTitle
{
  return (NSString *)&stru_1E45DFA60;
}

- (LNAppShortcutParameterPresentation)initWithParameterIdentifier:(id)a3 localizedSpecificTitle:(id)a4 localizedGenericTitle:(id)a5 optionsCollections:(id)a6
{
  return -[LNAppShortcutParameterPresentation initWithParameterIdentifier:localizedSpecificTitle:optionsCollections:](self, "initWithParameterIdentifier:localizedSpecificTitle:optionsCollections:", a3, a4, a6);
}

@end
