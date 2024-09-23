@implementation LNAppShortcutDynamicOptionsProviderReference

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appShortcutsProviderMangledTypeName, 0);
}

- (LNAppShortcutDynamicOptionsProviderReference)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  LNAppShortcutDynamicOptionsProviderReference *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appShortcutsProviderMangledTypeName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("appShortcutIndex"));
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("optionsProviderIndex"));

  if (v5)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9)
  {
    v10 = 0;
  }
  else
  {
    self = -[LNAppShortcutDynamicOptionsProviderReference initWithAppShortcutsProviderMangledTypeName:parameterIdentifier:appShortcutIndex:optionsProviderIndex:](self, "initWithAppShortcutsProviderMangledTypeName:parameterIdentifier:appShortcutIndex:optionsProviderIndex:", v5, v6, v7, v8);
    v10 = self;
  }

  return v10;
}

- (LNAppShortcutDynamicOptionsProviderReference)initWithAppShortcutsProviderMangledTypeName:(id)a3 parameterIdentifier:(id)a4 appShortcutIndex:(int64_t)a5 optionsProviderIndex:(int64_t)a6
{
  id v11;
  id v12;
  LNAppShortcutDynamicOptionsProviderReference *v13;
  uint64_t v14;
  NSString *appShortcutsProviderMangledTypeName;
  LNAppShortcutDynamicOptionsProviderReference *v16;
  void *v18;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAppShortcutDynamicOptionsProviderReference.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appShortcutsProviderMangledTypeName"));

  }
  v19.receiver = self;
  v19.super_class = (Class)LNAppShortcutDynamicOptionsProviderReference;
  v13 = -[LNDynamicOptionsProviderReference initWithParameterIdentifier:](&v19, sel_initWithParameterIdentifier_, v12);
  if (v13)
  {
    v14 = objc_msgSend(v11, "copy");
    appShortcutsProviderMangledTypeName = v13->_appShortcutsProviderMangledTypeName;
    v13->_appShortcutsProviderMangledTypeName = (NSString *)v14;

    v13->_appShortcutIndex = a5;
    v13->_optionsProviderIndex = a6;
    v16 = v13;
  }

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
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAppShortcutDynamicOptionsProviderReference appShortcutsProviderMangledTypeName](self, "appShortcutsProviderMangledTypeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNDynamicOptionsProviderReference parameterIdentifier](self, "parameterIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[LNAppShortcutDynamicOptionsProviderReference appShortcutIndex](self, "appShortcutIndex"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[LNAppShortcutDynamicOptionsProviderReference optionsProviderIndex](self, "optionsProviderIndex"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, appShortcutsProviderMangledTypeName: %@, parameterIdentifier: %@, appShortcutIndex: %@, optionsProviderIndex: %@>"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  LNAppShortcutDynamicOptionsProviderReference *v4;
  LNAppShortcutDynamicOptionsProviderReference *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  BOOL v12;
  int64_t v13;
  int64_t v14;
  objc_super v16;

  v4 = (LNAppShortcutDynamicOptionsProviderReference *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)LNAppShortcutDynamicOptionsProviderReference;
    if (-[LNDynamicOptionsProviderReference isEqual:](&v16, sel_isEqual_, v4))
    {
      v5 = v4;
      if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v12 = 0;
LABEL_19:

        goto LABEL_20;
      }
      -[LNAppShortcutDynamicOptionsProviderReference appShortcutsProviderMangledTypeName](self, "appShortcutsProviderMangledTypeName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNAppShortcutDynamicOptionsProviderReference appShortcutsProviderMangledTypeName](v5, "appShortcutsProviderMangledTypeName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {

      }
      else
      {
        if (!v8 || !v9)
        {

          goto LABEL_17;
        }
        v11 = objc_msgSend(v8, "isEqualToString:", v9);

        if (!v11)
          goto LABEL_17;
      }
      v13 = -[LNAppShortcutDynamicOptionsProviderReference appShortcutIndex](self, "appShortcutIndex");
      if (v13 == -[LNAppShortcutDynamicOptionsProviderReference appShortcutIndex](v5, "appShortcutIndex"))
      {
        v14 = -[LNAppShortcutDynamicOptionsProviderReference optionsProviderIndex](self, "optionsProviderIndex");
        v12 = v14 == -[LNAppShortcutDynamicOptionsProviderReference optionsProviderIndex](v5, "optionsProviderIndex");
LABEL_18:

        goto LABEL_19;
      }
LABEL_17:
      v12 = 0;
      goto LABEL_18;
    }
    v12 = 0;
  }
LABEL_20:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  int64_t v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LNAppShortcutDynamicOptionsProviderReference;
  v3 = -[LNDynamicOptionsProviderReference hash](&v9, sel_hash);
  -[LNAppShortcutDynamicOptionsProviderReference appShortcutsProviderMangledTypeName](self, "appShortcutsProviderMangledTypeName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ -[LNAppShortcutDynamicOptionsProviderReference appShortcutIndex](self, "appShortcutIndex");
  v7 = v6 ^ -[LNAppShortcutDynamicOptionsProviderReference optionsProviderIndex](self, "optionsProviderIndex") ^ v3;

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LNAppShortcutDynamicOptionsProviderReference;
  v4 = a3;
  -[LNDynamicOptionsProviderReference encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[LNAppShortcutDynamicOptionsProviderReference appShortcutsProviderMangledTypeName](self, "appShortcutsProviderMangledTypeName", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("appShortcutsProviderMangledTypeName"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[LNAppShortcutDynamicOptionsProviderReference appShortcutIndex](self, "appShortcutIndex"), CFSTR("appShortcutIndex"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNAppShortcutDynamicOptionsProviderReference optionsProviderIndex](self, "optionsProviderIndex"), CFSTR("optionsProviderIndex"));

}

- (NSString)appShortcutsProviderMangledTypeName
{
  return self->_appShortcutsProviderMangledTypeName;
}

- (int64_t)appShortcutIndex
{
  return self->_appShortcutIndex;
}

- (int64_t)optionsProviderIndex
{
  return self->_optionsProviderIndex;
}

@end
