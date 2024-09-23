@implementation LNSubstitutionValue

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[LNSubstitutionValue parameterIdentifier](self, "parameterIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("parameterIdentifier"));

  -[LNSubstitutionValue title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("title"));

  -[LNSubstitutionValue titleKey](self, "titleKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("titleKey"));

  -[LNSubstitutionValue value](self, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("value"));

  -[LNSubstitutionValue optionsCollectionTitle](self, "optionsCollectionTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("optionsCollectionTitle"));

  -[LNSubstitutionValue systemImageName](self, "systemImageName");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("systemImageName"));

}

- (LNValue)value
{
  return self->_value;
}

- (LNStaticDeferredLocalizedString)title
{
  return self->_title;
}

- (NSString)titleKey
{
  return self->_titleKey;
}

- (NSUUID)parameterIdentifier
{
  return self->_parameterIdentifier;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (LNStaticDeferredLocalizedString)optionsCollectionTitle
{
  return self->_optionsCollectionTitle;
}

- (LNSubstitutionValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  LNSubstitutionValue *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("titleKey"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("optionsCollectionTitle"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemImageName"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[LNSubstitutionValue initWithParameterIdentifier:title:titleKey:value:optionsCollectionTitle:systemImageName:](self, "initWithParameterIdentifier:title:titleKey:value:optionsCollectionTitle:systemImageName:", v5, v6, v7, v8, v9, v10);

        v11 = self;
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (LNSubstitutionValue)initWithParameterIdentifier:(id)a3 title:(id)a4 titleKey:(id)a5 value:(id)a6 optionsCollectionTitle:(id)a7 systemImageName:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  LNSubstitutionValue *v20;
  uint64_t v21;
  NSUUID *parameterIdentifier;
  uint64_t v23;
  LNStaticDeferredLocalizedString *title;
  uint64_t v25;
  NSString *titleKey;
  LNSubstitutionValue *v27;
  void *v29;
  void *v30;
  objc_super v32;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNSubstitutionValue.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameterIdentifier"));

    if (v15)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNSubstitutionValue.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title"));

LABEL_3:
  v32.receiver = self;
  v32.super_class = (Class)LNSubstitutionValue;
  v20 = -[LNSubstitutionValue init](&v32, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v14, "copy");
    parameterIdentifier = v20->_parameterIdentifier;
    v20->_parameterIdentifier = (NSUUID *)v21;

    v23 = objc_msgSend(v15, "copy");
    title = v20->_title;
    v20->_title = (LNStaticDeferredLocalizedString *)v23;

    v25 = objc_msgSend(v16, "copy");
    titleKey = v20->_titleKey;
    v20->_titleKey = (NSString *)v25;

    objc_storeStrong((id *)&v20->_value, a6);
    objc_storeStrong((id *)&v20->_optionsCollectionTitle, a7);
    objc_storeStrong((id *)&v20->_systemImageName, a8);
    v27 = v20;
  }

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_optionsCollectionTitle, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_titleKey, 0);
  objc_storeStrong((id *)&self->_parameterIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
