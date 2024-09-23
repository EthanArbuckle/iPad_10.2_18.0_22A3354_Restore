@implementation LNBasicDialog

- (LNBasicDialog)initWithFullString:(id)a3 supportingString:(id)a4 localeIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  LNBasicDialog *v12;
  uint64_t v13;
  LNDeferredLocalizedString *fullString;
  uint64_t v15;
  LNDeferredLocalizedString *supportingString;
  uint64_t v17;
  LNDeferredLocalizedString *printedString;
  LNBasicDialog *v19;
  void *v21;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNBasicDialog.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fullString"));

  }
  v22.receiver = self;
  v22.super_class = (Class)LNBasicDialog;
  v12 = -[LNDialog initWithLocaleIdentifier:](&v22, sel_initWithLocaleIdentifier_, v11);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    fullString = v12->_fullString;
    v12->_fullString = (LNDeferredLocalizedString *)v13;

    v15 = objc_msgSend(v10, "copy");
    supportingString = v12->_supportingString;
    v12->_supportingString = (LNDeferredLocalizedString *)v15;

    v17 = objc_msgSend(v9, "copy");
    printedString = v12->_printedString;
    v12->_printedString = (LNDeferredLocalizedString *)v17;

    v19 = v12;
  }

  return v12;
}

- (LNBasicDialog)initWithPrintedString:(id)a3 spokenString:(id)a4 localeIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  LNBasicDialog *v12;
  uint64_t v13;
  LNDeferredLocalizedString *printedString;
  uint64_t v15;
  LNDeferredLocalizedString *spokenString;
  LNBasicDialog *v17;
  void *v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNBasicDialog.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("printedString"));

  }
  v12 = -[LNBasicDialog initWithFullString:supportingString:localeIdentifier:](self, "initWithFullString:supportingString:localeIdentifier:", v9, 0, v11);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    printedString = v12->_printedString;
    v12->_printedString = (LNDeferredLocalizedString *)v13;

    v15 = objc_msgSend(v10, "copy");
    spokenString = v12->_spokenString;
    v12->_spokenString = (LNDeferredLocalizedString *)v15;

    v17 = v12;
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LNBasicDialog;
  v3 = -[LNDialog hash](&v9, sel_hash);
  -[LNBasicDialog fullString](self, "fullString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[LNBasicDialog supportingString](self, "supportingString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v3;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  LNBasicDialog *v4;
  LNBasicDialog *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  objc_super v18;

  v4 = (LNBasicDialog *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)LNBasicDialog;
    if (-[LNDialog isEqual:](&v18, sel_isEqual_, v4))
    {
      v5 = v4;
      if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        LOBYTE(v11) = 0;
LABEL_22:

        goto LABEL_23;
      }
      -[LNBasicDialog fullString](self, "fullString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNBasicDialog fullString](v5, "fullString");
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
        {
LABEL_20:

LABEL_21:
          goto LABEL_22;
        }
        v11 = objc_msgSend(v8, "isEqual:", v9);

        if (!v11)
          goto LABEL_21;
      }
      -[LNBasicDialog supportingString](self, "supportingString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNBasicDialog supportingString](v5, "supportingString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v14;
      v16 = v15;
      v12 = v16;
      if (v13 == v16)
      {
        LOBYTE(v11) = 1;
      }
      else
      {
        LOBYTE(v11) = 0;
        if (v13 && v16)
          LOBYTE(v11) = objc_msgSend(v13, "isEqual:", v16);
      }

      goto LABEL_20;
    }
    LOBYTE(v11) = 0;
  }
LABEL_23:

  return v11;
}

- (LNBasicDialog)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  LNBasicDialog *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fullString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supportingString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localeIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      self = -[LNBasicDialog initWithFullString:supportingString:localeIdentifier:](self, "initWithFullString:supportingString:localeIdentifier:", v5, v6, v7);
      v8 = self;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LNBasicDialog;
  v4 = a3;
  -[LNDialog encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[LNBasicDialog fullString](self, "fullString", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("fullString"));

  -[LNBasicDialog supportingString](self, "supportingString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("supportingString"));

}

- (LNDeferredLocalizedString)fullString
{
  return self->_fullString;
}

- (LNDeferredLocalizedString)supportingString
{
  return self->_supportingString;
}

- (LNDeferredLocalizedString)printedString
{
  return self->_printedString;
}

- (LNDeferredLocalizedString)spokenString
{
  return self->_spokenString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spokenString, 0);
  objc_storeStrong((id *)&self->_printedString, 0);
  objc_storeStrong((id *)&self->_supportingString, 0);
  objc_storeStrong((id *)&self->_fullString, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
