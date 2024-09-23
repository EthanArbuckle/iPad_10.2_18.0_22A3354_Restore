@implementation LNAppShortcutSpanData

- (LNAppShortcutSpanData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  LNAppShortcutSpanData *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("propertyTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("propertyTitleKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("providerClassName"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterTypeIdentifier"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v10 = (void *)MEMORY[0x1E0C99E60];
            v11 = objc_opt_class();
            objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("synonyms"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
            {
              self = -[LNAppShortcutSpanData initWithValue:propertyTitle:propertyTitleKey:providerClassName:parameterTypeIdentifier:synonyms:](self, "initWithValue:propertyTitle:propertyTitleKey:providerClassName:parameterTypeIdentifier:synonyms:", v8, v5, v6, v7, v9, v13);
              v14 = self;
            }
            else
            {
              v14 = 0;
            }

          }
          else
          {
            v14 = 0;
          }

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (LNAppShortcutSpanData)initWithValue:(id)a3 propertyTitle:(id)a4 propertyTitleKey:(id)a5 providerClassName:(id)a6 parameterTypeIdentifier:(id)a7 synonyms:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  LNAppShortcutSpanData *v20;
  LNAppShortcutSpanData *v21;
  LNAppShortcutSpanData *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  id v32;
  id v33;
  objc_super v35;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  obj = a6;
  v17 = a6;
  v32 = a7;
  v18 = a7;
  v33 = a8;
  v19 = a8;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAppShortcutSpanData.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value"));

    if (v15)
    {
LABEL_3:
      if (v16)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAppShortcutSpanData.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("propertyTitle"));

  if (v16)
  {
LABEL_4:
    if (v17)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAppShortcutSpanData.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("propertyTitleKey"));

  if (v17)
  {
LABEL_5:
    if (v18)
      goto LABEL_6;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAppShortcutSpanData.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameterTypeIdentifier"));

    if (v19)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAppShortcutSpanData.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("providerClassName"));

  if (!v18)
    goto LABEL_14;
LABEL_6:
  if (v19)
    goto LABEL_7;
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAppShortcutSpanData.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("synonyms"));

LABEL_7:
  v35.receiver = self;
  v35.super_class = (Class)LNAppShortcutSpanData;
  v20 = -[LNAppShortcutSpanData init](&v35, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_value, a3);
    objc_storeStrong((id *)&v21->_propertyTitle, a4);
    objc_storeStrong((id *)&v21->_propertyTitleKey, a5);
    objc_storeStrong((id *)&v21->_providerClassName, obj);
    objc_storeStrong((id *)&v21->_parameterTypeIdentifier, v32);
    objc_storeStrong((id *)&v21->_synonyms, v33);
    v22 = v21;
  }

  return v21;
}

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
  -[LNAppShortcutSpanData propertyTitle](self, "propertyTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("propertyTitle"));

  -[LNAppShortcutSpanData propertyTitleKey](self, "propertyTitleKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("propertyTitleKey"));

  -[LNAppShortcutSpanData providerClassName](self, "providerClassName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("providerClassName"));

  -[LNAppShortcutSpanData value](self, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("value"));

  -[LNAppShortcutSpanData parameterTypeIdentifier](self, "parameterTypeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("parameterTypeIdentifier"));

  -[LNAppShortcutSpanData synonyms](self, "synonyms");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("synonyms"));

}

- (BOOL)isEqual:(id)a3
{
  LNAppShortcutSpanData *v4;
  LNAppShortcutSpanData *v5;
  LNAppShortcutSpanData *v6;
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
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;

  v4 = (LNAppShortcutSpanData *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_52:

      goto LABEL_53;
    }
    -[LNAppShortcutSpanData propertyTitle](self, "propertyTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAppShortcutSpanData propertyTitle](v6, "propertyTitle");
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
        goto LABEL_50;
      v15 = objc_msgSend(v9, "isEqual:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_51:

        goto LABEL_52;
      }
    }
    -[LNAppShortcutSpanData propertyTitleKey](self, "propertyTitleKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAppShortcutSpanData propertyTitleKey](v6, "propertyTitleKey");
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
        goto LABEL_49;
      v21 = objc_msgSend(v14, "isEqual:", v18);

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_50:

        goto LABEL_51;
      }
    }
    -[LNAppShortcutSpanData providerClassName](self, "providerClassName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAppShortcutSpanData providerClassName](v6, "providerClassName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v22;
    v24 = v23;
    v19 = v24;
    v48 = v20;
    if (v20 == v24)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v25 = v24;
      if (!v20 || !v24)
        goto LABEL_48;
      v12 = objc_msgSend(v20, "isEqual:", v24);

      if (!v12)
        goto LABEL_49;
    }
    v47 = v19;
    -[LNAppShortcutSpanData parameterTypeIdentifier](self, "parameterTypeIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAppShortcutSpanData parameterTypeIdentifier](v6, "parameterTypeIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v26;
    v29 = v27;
    v45 = v29;
    v46 = v28;
    if (v28 == v29)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      if (!v28)
      {
        v30 = v29;
        v19 = v47;
        goto LABEL_46;
      }
      v30 = v29;
      v19 = v47;
      if (!v29)
      {
LABEL_46:

        goto LABEL_47;
      }
      v31 = objc_msgSend(v28, "isEqual:", v29);

      if (!v31)
      {
        LOBYTE(v12) = 0;
        v19 = v47;
LABEL_47:
        v25 = v45;
        v20 = v46;
LABEL_48:

        v20 = v48;
LABEL_49:

        goto LABEL_50;
      }
    }
    -[LNAppShortcutSpanData synonyms](self, "synonyms");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAppShortcutSpanData synonyms](v6, "synonyms");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v32;
    v34 = v33;
    v43 = v28;
    v44 = v34;
    if (v28 == v34)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      if (!v28)
      {
        v35 = v34;
        v19 = v47;
        goto LABEL_45;
      }
      v35 = v34;
      v19 = v47;
      if (!v34)
      {
LABEL_45:

        v28 = v43;
        v30 = v44;
        goto LABEL_46;
      }
      v36 = objc_msgSend(v28, "isEqual:", v34);

      if (!v36)
      {
        LOBYTE(v12) = 0;
        v19 = v47;
        v30 = v44;
        goto LABEL_46;
      }
    }
    -[LNAppShortcutSpanData value](self, "value");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAppShortcutSpanData value](v6, "value");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v37;
    v40 = v38;
    v42 = v40;
    if (v39 == v40)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v39)
      {
        v19 = v47;
        if (v40)
          LOBYTE(v12) = objc_msgSend(v39, "isEqual:", v40);
        goto LABEL_43;
      }
    }
    v19 = v47;
LABEL_43:

    v35 = v42;
    v28 = v39;
    goto LABEL_45;
  }
  LOBYTE(v12) = 1;
LABEL_53:

  return v12;
}

- (LNStaticDeferredLocalizedString)propertyTitle
{
  return self->_propertyTitle;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;

  -[LNAppShortcutSpanData propertyTitle](self, "propertyTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNAppShortcutSpanData propertyTitleKey](self, "propertyTitleKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[LNAppShortcutSpanData providerClassName](self, "providerClassName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[LNAppShortcutSpanData parameterTypeIdentifier](self, "parameterTypeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[LNAppShortcutSpanData synonyms](self, "synonyms");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[LNAppShortcutSpanData value](self, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10 ^ v12 ^ objc_msgSend(v13, "hash");

  return v14;
}

- (LNValue)value
{
  return self->_value;
}

- (NSArray)synonyms
{
  return self->_synonyms;
}

- (NSString)providerClassName
{
  return self->_providerClassName;
}

- (NSString)propertyTitleKey
{
  return self->_propertyTitleKey;
}

- (NSString)parameterTypeIdentifier
{
  return self->_parameterTypeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonyms, 0);
  objc_storeStrong((id *)&self->_parameterTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_providerClassName, 0);
  objc_storeStrong((id *)&self->_propertyTitleKey, 0);
  objc_storeStrong((id *)&self->_propertyTitle, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[title: %@ provider: %@ type: %@]"), self->_propertyTitle, self->_providerClassName, self->_parameterTypeIdentifier);
}

@end
