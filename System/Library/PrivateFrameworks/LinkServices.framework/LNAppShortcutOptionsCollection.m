@implementation LNAppShortcutOptionsCollection

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNAppShortcutOptionsCollection)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  LNAppShortcutOptionsCollection *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemImageName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("optionsProviderReference"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[LNAppShortcutOptionsCollection initWithLocalizedTitle:systemImageName:optionsProviderReference:](self, "initWithLocalizedTitle:systemImageName:optionsProviderReference:", v5, v6, v7);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (LNAppShortcutOptionsCollection)initWithLocalizedTitle:(id)a3 systemImageName:(id)a4 optionsProviderReference:(id)a5
{
  id v9;
  id v10;
  id v11;
  LNAppShortcutOptionsCollection *v12;
  uint64_t v13;
  NSString *localizedTitle;
  uint64_t v15;
  NSString *systemImageName;
  LNAppShortcutOptionsCollection *v17;
  void *v19;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAppShortcutOptionsCollection.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localizedTitle"));

  }
  v20.receiver = self;
  v20.super_class = (Class)LNAppShortcutOptionsCollection;
  v12 = -[LNAppShortcutOptionsCollection init](&v20, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    localizedTitle = v12->_localizedTitle;
    v12->_localizedTitle = (NSString *)v13;

    v15 = objc_msgSend(v10, "copy");
    systemImageName = v12->_systemImageName;
    v12->_systemImageName = (NSString *)v15;

    objc_storeStrong((id *)&v12->_optionsProviderReference, a5);
    v17 = v12;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsProviderReference, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
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
  -[LNAppShortcutOptionsCollection localizedTitle](self, "localizedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAppShortcutOptionsCollection systemImageName](self, "systemImageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAppShortcutOptionsCollection optionsProviderReference](self, "optionsProviderReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, localizedTitle: %@, systemImageName: %@, optionsProviderReference: %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  LNAppShortcutOptionsCollection *v4;
  LNAppShortcutOptionsCollection *v5;
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

  v4 = (LNAppShortcutOptionsCollection *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)LNAppShortcutOptionsCollection;
    if (-[LNAppShortcutOptionsCollection isEqual:](&v24, sel_isEqual_, v4))
    {
      v5 = v4;
      if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        LOBYTE(v11) = 0;
LABEL_29:

        goto LABEL_30;
      }
      -[LNAppShortcutOptionsCollection localizedTitle](self, "localizedTitle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNAppShortcutOptionsCollection localizedTitle](v5, "localizedTitle");
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
      -[LNAppShortcutOptionsCollection systemImageName](self, "systemImageName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNAppShortcutOptionsCollection systemImageName](v5, "systemImageName");
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
      -[LNAppShortcutOptionsCollection optionsProviderReference](self, "optionsProviderReference");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNAppShortcutOptionsCollection optionsProviderReference](v5, "optionsProviderReference");
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
  v11.super_class = (Class)LNAppShortcutOptionsCollection;
  v3 = -[LNAppShortcutOptionsCollection hash](&v11, sel_hash);
  -[LNAppShortcutOptionsCollection localizedTitle](self, "localizedTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[LNAppShortcutOptionsCollection systemImageName](self, "systemImageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[LNAppShortcutOptionsCollection optionsProviderReference](self, "optionsProviderReference");
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
  -[LNAppShortcutOptionsCollection localizedTitle](self, "localizedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("localizedTitle"));

  -[LNAppShortcutOptionsCollection systemImageName](self, "systemImageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("systemImageName"));

  -[LNAppShortcutOptionsCollection optionsProviderReference](self, "optionsProviderReference");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("optionsProviderReference"));

}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (LNAppShortcutDynamicOptionsProviderReference)optionsProviderReference
{
  return self->_optionsProviderReference;
}

@end
