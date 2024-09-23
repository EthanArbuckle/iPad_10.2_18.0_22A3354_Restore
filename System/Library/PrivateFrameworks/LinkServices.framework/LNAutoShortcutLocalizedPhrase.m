@implementation LNAutoShortcutLocalizedPhrase

- (NSUUID)parameterIdentifier
{
  return self->_parameterIdentifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)signature
{
  return self->_signature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_optionsCollectionSystemImageName, 0);
  objc_storeStrong((id *)&self->_optionsCollectionTitle, 0);
  objc_storeStrong((id *)&self->_parameterIdentifier, 0);
  objc_storeStrong((id *)&self->_basePhraseTemplate, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedPhrase, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (LNAutoShortcutLocalizedPhrase)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  LNAutoShortcutLocalizedPhrase *v13;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedPhrase"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("basePhraseTemplate"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterIdentifier"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("primary"));
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signature"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("optionsCollectionTitle"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("optionsCollectionSystemImageName"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v15) = v9;
          self = -[LNAutoShortcutLocalizedPhrase initWithLocalizedPhrase:bundleIdentifier:basePhraseTemplate:parameterIdentifier:optionsCollectionTitle:optionsCollectionSystemImageName:primary:signature:](self, "initWithLocalizedPhrase:bundleIdentifier:basePhraseTemplate:parameterIdentifier:optionsCollectionTitle:optionsCollectionSystemImageName:primary:signature:", v5, v6, v7, v8, v11, v12, v15, v10);

          v13 = self;
        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (LNAutoShortcutLocalizedPhrase)initWithLocalizedPhrase:(id)a3 bundleIdentifier:(id)a4 basePhraseTemplate:(id)a5 parameterIdentifier:(id)a6 optionsCollectionTitle:(id)a7 optionsCollectionSystemImageName:(id)a8 primary:(BOOL)a9 signature:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  LNAutoShortcutLocalizedPhrase *v24;
  uint64_t v25;
  NSString *localizedPhrase;
  uint64_t v27;
  NSString *bundleIdentifier;
  uint64_t v29;
  NSString *basePhraseTemplate;
  uint64_t v31;
  NSUUID *parameterIdentifier;
  uint64_t v33;
  NSString *optionsCollectionTitle;
  uint64_t v35;
  NSString *optionsCollectionSystemImageName;
  LNAutoShortcutLocalizedPhrase *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  objc_super v43;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a10;
  if (v17)
  {
    if (v18)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAutoShortcutLocalizedPhrase.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localizedPhrase"));

    if (v18)
    {
LABEL_3:
      if (v19)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAutoShortcutLocalizedPhrase.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("basePhraseTemplate"));

      if (v23)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAutoShortcutLocalizedPhrase.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  if (!v19)
    goto LABEL_10;
LABEL_4:
  if (v23)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAutoShortcutLocalizedPhrase.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("signature"));

LABEL_5:
  v43.receiver = self;
  v43.super_class = (Class)LNAutoShortcutLocalizedPhrase;
  v24 = -[LNAutoShortcutLocalizedPhrase init](&v43, sel_init);
  if (v24)
  {
    v25 = objc_msgSend(v17, "copy");
    localizedPhrase = v24->_localizedPhrase;
    v24->_localizedPhrase = (NSString *)v25;

    v27 = objc_msgSend(v18, "copy");
    bundleIdentifier = v24->_bundleIdentifier;
    v24->_bundleIdentifier = (NSString *)v27;

    v29 = objc_msgSend(v19, "copy");
    basePhraseTemplate = v24->_basePhraseTemplate;
    v24->_basePhraseTemplate = (NSString *)v29;

    v31 = objc_msgSend(v20, "copy");
    parameterIdentifier = v24->_parameterIdentifier;
    v24->_parameterIdentifier = (NSUUID *)v31;

    v33 = objc_msgSend(v21, "copy");
    optionsCollectionTitle = v24->_optionsCollectionTitle;
    v24->_optionsCollectionTitle = (NSString *)v33;

    v35 = objc_msgSend(v22, "copy");
    optionsCollectionSystemImageName = v24->_optionsCollectionSystemImageName;
    v24->_optionsCollectionSystemImageName = (NSString *)v35;

    v24->_primary = a9;
    objc_storeStrong((id *)&v24->_signature, a10);
    v37 = v24;
  }

  return v24;
}

- (LNAutoShortcutLocalizedPhrase)initWithLocalizedPhrase:(id)a3 bundleIdentifier:(id)a4 basePhraseTemplate:(id)a5 parameterIdentifier:(id)a6
{
  return -[LNAutoShortcutLocalizedPhrase initWithLocalizedPhrase:bundleIdentifier:basePhraseTemplate:parameterIdentifier:primary:](self, "initWithLocalizedPhrase:bundleIdentifier:basePhraseTemplate:parameterIdentifier:primary:", a3, a4, a5, a6, 0);
}

- (LNAutoShortcutLocalizedPhrase)initWithLocalizedPhrase:(id)a3 bundleIdentifier:(id)a4 basePhraseTemplate:(id)a5 parameterIdentifier:(id)a6 primary:(BOOL)a7
{
  return -[LNAutoShortcutLocalizedPhrase initWithLocalizedPhrase:bundleIdentifier:basePhraseTemplate:parameterIdentifier:primary:signature:](self, "initWithLocalizedPhrase:bundleIdentifier:basePhraseTemplate:parameterIdentifier:primary:signature:", a3, a4, a5, a6, a7, CFSTR("UNSET"));
}

- (LNAutoShortcutLocalizedPhrase)initWithLocalizedPhrase:(id)a3 bundleIdentifier:(id)a4 basePhraseTemplate:(id)a5 parameterIdentifier:(id)a6 primary:(BOOL)a7 signature:(id)a8
{
  uint64_t v9;

  LOBYTE(v9) = a7;
  return -[LNAutoShortcutLocalizedPhrase initWithLocalizedPhrase:bundleIdentifier:basePhraseTemplate:parameterIdentifier:optionsCollectionTitle:optionsCollectionSystemImageName:primary:signature:](self, "initWithLocalizedPhrase:bundleIdentifier:basePhraseTemplate:parameterIdentifier:optionsCollectionTitle:optionsCollectionSystemImageName:primary:signature:", a3, a4, a5, a6, 0, 0, v9, a8);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[LNAutoShortcutLocalizedPhrase localizedPhrase](self, "localizedPhrase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("localizedPhrase"));

  -[LNAutoShortcutLocalizedPhrase bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bundleIdentifier"));

  -[LNAutoShortcutLocalizedPhrase basePhraseTemplate](self, "basePhraseTemplate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("basePhraseTemplate"));

  -[LNAutoShortcutLocalizedPhrase parameterIdentifier](self, "parameterIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("parameterIdentifier"));

  -[LNAutoShortcutLocalizedPhrase optionsCollectionTitle](self, "optionsCollectionTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("optionsCollectionTitle"));

  -[LNAutoShortcutLocalizedPhrase optionsCollectionSystemImageName](self, "optionsCollectionSystemImageName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("optionsCollectionSystemImageName"));

  objc_msgSend(v4, "encodeBool:forKey:", -[LNAutoShortcutLocalizedPhrase isPrimary](self, "isPrimary"), CFSTR("primary"));
  -[LNAutoShortcutLocalizedPhrase signature](self, "signature");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("signature"));

}

- (BOOL)isEqual:(id)a3
{
  LNAutoShortcutLocalizedPhrase *v4;
  LNAutoShortcutLocalizedPhrase *v5;
  LNAutoShortcutLocalizedPhrase *v6;
  _BOOL4 v7;
  int v8;
  LNAutoShortcutLocalizedPhrase *v9;
  void *v10;
  void *v11;
  LNAutoShortcutLocalizedPhrase *v12;
  LNAutoShortcutLocalizedPhrase *v13;
  LNAutoShortcutLocalizedPhrase *v14;
  LNAutoShortcutLocalizedPhrase *v15;
  int v16;
  void *v17;
  void *v18;
  LNAutoShortcutLocalizedPhrase *v19;
  LNAutoShortcutLocalizedPhrase *v20;
  LNAutoShortcutLocalizedPhrase *v21;
  int v22;
  void *v23;
  void *v24;
  LNAutoShortcutLocalizedPhrase *v25;
  LNAutoShortcutLocalizedPhrase *v26;
  void *v27;
  void *v28;
  LNAutoShortcutLocalizedPhrase *v29;
  LNAutoShortcutLocalizedPhrase *v30;
  LNAutoShortcutLocalizedPhrase *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  LNAutoShortcutLocalizedPhrase *v35;
  LNAutoShortcutLocalizedPhrase *v36;
  int v37;
  void *v38;
  void *v39;
  LNAutoShortcutLocalizedPhrase *v40;
  LNAutoShortcutLocalizedPhrase *v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  LNAutoShortcutLocalizedPhrase *v46;
  void *v47;
  LNAutoShortcutLocalizedPhrase *v49;
  LNAutoShortcutLocalizedPhrase *v50;
  LNAutoShortcutLocalizedPhrase *v51;
  LNAutoShortcutLocalizedPhrase *v52;
  LNAutoShortcutLocalizedPhrase *v53;
  LNAutoShortcutLocalizedPhrase *v54;
  LNAutoShortcutLocalizedPhrase *v55;
  LNAutoShortcutLocalizedPhrase *v56;

  v4 = (LNAutoShortcutLocalizedPhrase *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = -[LNAutoShortcutLocalizedPhrase isPrimary](self, "isPrimary");
        if (v7 != -[LNAutoShortcutLocalizedPhrase isPrimary](v6, "isPrimary"))
        {
          LOBYTE(v8) = 0;
LABEL_65:

          goto LABEL_66;
        }
        -[LNAutoShortcutLocalizedPhrase localizedPhrase](self, "localizedPhrase");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNAutoShortcutLocalizedPhrase localizedPhrase](v6, "localizedPhrase");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v10;
        v12 = v11;
        v13 = v12;
        if (v9 == v12)
        {

        }
        else
        {
          LOBYTE(v8) = 0;
          v14 = v12;
          v15 = v9;
          if (!v9 || !v12)
            goto LABEL_62;
          v16 = -[LNAutoShortcutLocalizedPhrase isEqualToString:](v9, "isEqualToString:", v12);

          if (!v16)
          {
            LOBYTE(v8) = 0;
LABEL_63:

            goto LABEL_64;
          }
        }
        -[LNAutoShortcutLocalizedPhrase bundleIdentifier](self, "bundleIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNAutoShortcutLocalizedPhrase bundleIdentifier](v6, "bundleIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v17;
        v19 = v18;
        v14 = v19;
        if (v15 == v19)
        {

        }
        else
        {
          LOBYTE(v8) = 0;
          v20 = v19;
          v21 = v15;
          if (!v15 || !v19)
            goto LABEL_61;
          v22 = -[LNAutoShortcutLocalizedPhrase isEqualToString:](v15, "isEqualToString:", v19);

          if (!v22)
          {
            LOBYTE(v8) = 0;
LABEL_62:

            goto LABEL_63;
          }
        }
        -[LNAutoShortcutLocalizedPhrase basePhraseTemplate](self, "basePhraseTemplate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNAutoShortcutLocalizedPhrase basePhraseTemplate](v6, "basePhraseTemplate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v23;
        v25 = v24;
        v20 = v25;
        v56 = v21;
        if (v21 == v25)
        {

        }
        else
        {
          LOBYTE(v8) = 0;
          v26 = v25;
          if (!v21 || !v25)
            goto LABEL_60;
          v8 = -[LNAutoShortcutLocalizedPhrase isEqualToString:](v21, "isEqualToString:", v25);

          if (!v8)
            goto LABEL_61;
        }
        v55 = v20;
        -[LNAutoShortcutLocalizedPhrase parameterIdentifier](self, "parameterIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNAutoShortcutLocalizedPhrase parameterIdentifier](v6, "parameterIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v27;
        v30 = v28;
        v53 = v30;
        v54 = v29;
        if (v29 == v30)
        {

        }
        else
        {
          LOBYTE(v8) = 0;
          if (!v29)
          {
            v31 = v30;
            v20 = v55;
            goto LABEL_58;
          }
          v31 = v30;
          v20 = v55;
          if (!v30)
          {
LABEL_58:

            goto LABEL_59;
          }
          v32 = -[LNAutoShortcutLocalizedPhrase isEqual:](v29, "isEqual:", v30);

          if (!v32)
          {
            LOBYTE(v8) = 0;
            v20 = v55;
LABEL_59:
            v26 = v53;
            v21 = v54;
LABEL_60:

            v21 = v56;
LABEL_61:

            goto LABEL_62;
          }
        }
        -[LNAutoShortcutLocalizedPhrase optionsCollectionTitle](self, "optionsCollectionTitle");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNAutoShortcutLocalizedPhrase optionsCollectionTitle](v6, "optionsCollectionTitle");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v33;
        v35 = v34;
        v51 = v29;
        v52 = v35;
        if (v29 != v35)
        {
          LOBYTE(v8) = 0;
          if (v29)
          {
            v36 = v35;
            v20 = v55;
            if (v35)
            {
              v37 = -[LNAutoShortcutLocalizedPhrase isEqualToString:](v29, "isEqualToString:", v35);

              if (!v37)
              {
                LOBYTE(v8) = 0;
                v20 = v55;
                v31 = v52;
                goto LABEL_58;
              }
LABEL_39:
              -[LNAutoShortcutLocalizedPhrase optionsCollectionSystemImageName](self, "optionsCollectionSystemImageName");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              -[LNAutoShortcutLocalizedPhrase optionsCollectionSystemImageName](v6, "optionsCollectionSystemImageName");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = v38;
              v41 = v39;
              v49 = v41;
              v50 = v40;
              if (v40 == v41)
              {

              }
              else
              {
                LOBYTE(v8) = 0;
                if (!v40)
                {
                  v42 = v41;
                  v20 = v55;
                  goto LABEL_55;
                }
                v42 = v41;
                v20 = v55;
                if (!v41)
                {
LABEL_55:

                  goto LABEL_56;
                }
                v43 = -[LNAutoShortcutLocalizedPhrase isEqual:](v40, "isEqual:", v41);

                if (!v43)
                {
                  LOBYTE(v8) = 0;
                  v20 = v55;
LABEL_56:
                  v36 = (LNAutoShortcutLocalizedPhrase *)v49;
                  v29 = v50;
                  goto LABEL_57;
                }
              }
              -[LNAutoShortcutLocalizedPhrase signature](self, "signature", v49, v40);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              -[LNAutoShortcutLocalizedPhrase signature](v6, "signature");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = v44;
              v46 = v45;
              v47 = v46;
              if (v40 == v46)
              {
                LOBYTE(v8) = 1;
              }
              else
              {
                LOBYTE(v8) = 0;
                if (v40)
                {
                  v20 = v55;
                  if (v46)
                    LOBYTE(v8) = -[LNAutoShortcutLocalizedPhrase isEqualToString:](v40, "isEqualToString:", v46);
                  goto LABEL_53;
                }
              }
              v20 = v55;
LABEL_53:

              v42 = v47;
              goto LABEL_55;
            }
          }
          else
          {
            v36 = v35;
            v20 = v55;
          }
LABEL_57:

          v29 = v51;
          v31 = v52;
          goto LABEL_58;
        }

        goto LABEL_39;
      }
      LOBYTE(v8) = 0;
      v9 = v6;
      v6 = 0;
    }
    else
    {
      v9 = 0;
      LOBYTE(v8) = 0;
    }
LABEL_64:

    goto LABEL_65;
  }
  LOBYTE(v8) = 1;
LABEL_66:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;

  v3 = -[LNAutoShortcutLocalizedPhrase isPrimary](self, "isPrimary");
  -[LNAutoShortcutLocalizedPhrase localizedPhrase](self, "localizedPhrase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[LNAutoShortcutLocalizedPhrase bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v3;
  -[LNAutoShortcutLocalizedPhrase basePhraseTemplate](self, "basePhraseTemplate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  -[LNAutoShortcutLocalizedPhrase parameterIdentifier](self, "parameterIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  -[LNAutoShortcutLocalizedPhrase optionsCollectionTitle](self, "optionsCollectionTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7 ^ v11 ^ objc_msgSend(v12, "hash");
  -[LNAutoShortcutLocalizedPhrase optionsCollectionSystemImageName](self, "optionsCollectionSystemImageName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  -[LNAutoShortcutLocalizedPhrase signature](self, "signature");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v13 ^ v15 ^ objc_msgSend(v16, "hash");

  return v17;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v15;

  v15 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAutoShortcutLocalizedPhrase localizedPhrase](self, "localizedPhrase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAutoShortcutLocalizedPhrase bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAutoShortcutLocalizedPhrase basePhraseTemplate](self, "basePhraseTemplate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAutoShortcutLocalizedPhrase parameterIdentifier](self, "parameterIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAutoShortcutLocalizedPhrase optionsCollectionTitle](self, "optionsCollectionTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNAutoShortcutLocalizedPhrase optionsCollectionSystemImageName](self, "optionsCollectionSystemImageName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[LNAutoShortcutLocalizedPhrase isPrimary](self, "isPrimary");
  -[LNAutoShortcutLocalizedPhrase signature](self, "signature");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@: %p, localizedPhrase: %@, bundleIdentifier: %@, basePhraseTemplate: %@, parameterIdentifier: %@ optionsCollectionTitle: %@, systemImageName: %@ isPrimary: %d, signature: %@>"), v4, self, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)localizedPhrase
{
  return self->_localizedPhrase;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)basePhraseTemplate
{
  return self->_basePhraseTemplate;
}

- (NSString)optionsCollectionTitle
{
  return self->_optionsCollectionTitle;
}

- (NSString)optionsCollectionSystemImageName
{
  return self->_optionsCollectionSystemImageName;
}

- (BOOL)isPrimary
{
  return self->_primary;
}

@end
