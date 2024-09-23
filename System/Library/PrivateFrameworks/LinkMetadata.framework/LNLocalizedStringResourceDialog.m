@implementation LNLocalizedStringResourceDialog

- (LNLocalizedStringResourceDialog)initWithFullString:(id)a3 supportingString:(id)a4 systemImageName:(id)a5 localeIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  LNLocalizedStringResourceDialog *v15;
  uint64_t v16;
  LNStaticDeferredLocalizedString *fullString;
  uint64_t v18;
  LNStaticDeferredLocalizedString *supportingString;
  uint64_t v20;
  NSString *systemImageName;
  LNLocalizedStringResourceDialog *v22;
  void *v24;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNLocalizedStringResourceDialog.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fullString"));

  }
  v25.receiver = self;
  v25.super_class = (Class)LNLocalizedStringResourceDialog;
  v15 = -[LNDialog initWithLocaleIdentifier:](&v25, sel_initWithLocaleIdentifier_, v14);
  if (v15)
  {
    v16 = objc_msgSend(v11, "copy");
    fullString = v15->_fullString;
    v15->_fullString = (LNStaticDeferredLocalizedString *)v16;

    v18 = objc_msgSend(v12, "copy");
    supportingString = v15->_supportingString;
    v15->_supportingString = (LNStaticDeferredLocalizedString *)v18;

    v20 = objc_msgSend(v13, "copy");
    systemImageName = v15->_systemImageName;
    v15->_systemImageName = (NSString *)v20;

    v22 = v15;
  }

  return v15;
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
  v11.super_class = (Class)LNLocalizedStringResourceDialog;
  v3 = -[LNDialog hash](&v11, sel_hash);
  -[LNLocalizedStringResourceDialog fullString](self, "fullString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[LNLocalizedStringResourceDialog supportingString](self, "supportingString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[LNLocalizedStringResourceDialog systemImageName](self, "systemImageName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash") ^ v3;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  LNLocalizedStringResourceDialog *v4;
  LNLocalizedStringResourceDialog *v5;
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

  v4 = (LNLocalizedStringResourceDialog *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)LNLocalizedStringResourceDialog;
    if (-[LNDialog isEqual:](&v24, sel_isEqual_, v4))
    {
      v5 = v4;
      if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        LOBYTE(v11) = 0;
LABEL_29:

        goto LABEL_30;
      }
      -[LNLocalizedStringResourceDialog fullString](self, "fullString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNLocalizedStringResourceDialog fullString](v5, "fullString");
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
        v14 = objc_msgSend(v8, "isEqual:", v9);

        if (!v14)
        {
          LOBYTE(v11) = 0;
LABEL_28:

          goto LABEL_29;
        }
      }
      -[LNLocalizedStringResourceDialog supportingString](self, "supportingString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNLocalizedStringResourceDialog supportingString](v5, "supportingString");
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
        v11 = objc_msgSend(v13, "isEqual:", v17);

        if (!v11)
          goto LABEL_27;
      }
      -[LNLocalizedStringResourceDialog systemImageName](self, "systemImageName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNLocalizedStringResourceDialog systemImageName](v5, "systemImageName");
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

- (LNLocalizedStringResourceDialog)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  LNLocalizedStringResourceDialog *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fullString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supportingString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemImageName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localeIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      self = -[LNLocalizedStringResourceDialog initWithFullString:supportingString:systemImageName:localeIdentifier:](self, "initWithFullString:supportingString:systemImageName:localeIdentifier:", v5, v6, v7, v8);
      v9 = self;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LNLocalizedStringResourceDialog;
  v4 = a3;
  -[LNDialog encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[LNLocalizedStringResourceDialog fullString](self, "fullString", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("fullString"));

  -[LNLocalizedStringResourceDialog supportingString](self, "supportingString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("supportingString"));

  -[LNLocalizedStringResourceDialog systemImageName](self, "systemImageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("systemImageName"));

}

- (LNStaticDeferredLocalizedString)fullString
{
  return self->_fullString;
}

- (LNStaticDeferredLocalizedString)supportingString
{
  return self->_supportingString;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_supportingString, 0);
  objc_storeStrong((id *)&self->_fullString, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
