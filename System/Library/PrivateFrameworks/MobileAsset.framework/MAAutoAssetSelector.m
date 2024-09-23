@implementation MAAutoAssetSelector

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4
{
  return -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:](self, "initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:", a3, a4, 0, 0);
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 usingDecryptionKey:(id)a5
{
  return -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:](self, "initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:", a3, a4, 0, a5);
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 matchingAssetVersion:(id)a5
{
  return -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:](self, "initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:", a3, a4, a5, 0);
}

- (id)initForAssetType:(id)a3
{
  return -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:](self, "initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:", a3, 0, 0, 0);
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 matchingAssetVersion:(id)a5 usingDecryptionKey:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  MAAutoAssetSelector *v15;
  id *p_isa;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MAAutoAssetSelector;
  v15 = -[MAAutoAssetSelector init](&v18, sel_init);
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_assetType, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
  }

  return p_isa;
}

- (MAAutoAssetSelector)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetSelector *v5;
  uint64_t v6;
  NSString *assetType;
  uint64_t v8;
  NSString *assetSpecifier;
  uint64_t v10;
  NSString *assetVersion;
  uint64_t v12;
  NSData *downloadDecryptionKey;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MAAutoAssetSelector;
  v5 = -[MAAutoAssetSelector init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetType"));
    v6 = objc_claimAutoreleasedReturnValue();
    assetType = v5->_assetType;
    v5->_assetType = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetSpecifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    assetSpecifier = v5->_assetSpecifier;
    v5->_assetSpecifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetVersion"));
    v10 = objc_claimAutoreleasedReturnValue();
    assetVersion = v5->_assetVersion;
    v5->_assetVersion = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("downloadDecryptionKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    downloadDecryptionKey = v5->_downloadDecryptionKey;
    v5->_downloadDecryptionKey = (NSData *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[MAAutoAssetSelector assetType](self, "assetType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("assetType"));

  -[MAAutoAssetSelector assetSpecifier](self, "assetSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("assetSpecifier"));

  -[MAAutoAssetSelector assetVersion](self, "assetVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("assetVersion"));

  -[MAAutoAssetSelector downloadDecryptionKey](self, "downloadDecryptionKey");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("downloadDecryptionKey"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  MAAutoAssetSelector *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = [MAAutoAssetSelector alloc];
  -[MAAutoAssetSelector assetType](self, "assetType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSelector assetSpecifier](self, "assetSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSelector assetVersion](self, "assetVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSelector downloadDecryptionKey](self, "downloadDecryptionKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:](v3, "initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:", v4, v5, v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  MAAutoAssetSelector *v5;
  MAAutoAssetSelector *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;

  v5 = (MAAutoAssetSelector *)a3;
  if (v5 == self)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[MAAutoAssetSelector assetType](v6, "assetType");
      v7 = objc_claimAutoreleasedReturnValue();
      if (!v7)
        goto LABEL_28;
      v8 = (void *)v7;
      -[MAAutoAssetSelector assetSpecifier](v6, "assetSpecifier");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        v14 = 0;
LABEL_40:

        goto LABEL_41;
      }
      v10 = (void *)v9;
      -[MAAutoAssetSelector assetVersion](v6, "assetVersion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        -[MAAutoAssetSelector assetVersion](self, "assetVersion");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
          v14 = 0;
          goto LABEL_38;
        }
      }
      -[MAAutoAssetSelector assetVersion](v6, "assetVersion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[MAAutoAssetSelector assetVersion](self, "assetVersion");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v3)
        {
          LOBYTE(v13) = 1;
          goto LABEL_26;
        }
      }
      -[MAAutoAssetSelector downloadDecryptionKey](v6, "downloadDecryptionKey");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        -[MAAutoAssetSelector downloadDecryptionKey](self, "downloadDecryptionKey");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          LOBYTE(v13) = 1;
          goto LABEL_25;
        }
      }
      -[MAAutoAssetSelector downloadDecryptionKey](v6, "downloadDecryptionKey");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v26 = v3;
        -[MAAutoAssetSelector downloadDecryptionKey](self, "downloadDecryptionKey");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18 == 0;

        if (v17)
        {
          LOBYTE(v13) = v19;
          v3 = v26;
          goto LABEL_21;
        }
        v20 = 0;
        LOBYTE(v13) = v19;
        v3 = v26;
      }
      else
      {
        if (v17)
        {
LABEL_21:

          if (!v12)
          {
LABEL_27:

            if ((v13 & 1) == 0)
            {
              -[MAAutoAssetSelector assetType](v6, "assetType");
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              -[MAAutoAssetSelector assetType](self, "assetType");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v8, "isEqualToString:", v10))
              {
                v14 = 0;
LABEL_39:

                goto LABEL_40;
              }
              -[MAAutoAssetSelector assetSpecifier](v6, "assetSpecifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[MAAutoAssetSelector assetSpecifier](self, "assetSpecifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v16, "isEqualToString:", v21))
              {
                -[MAAutoAssetSelector assetVersion](v6, "assetVersion");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                if (v22)
                {
                  -[MAAutoAssetSelector assetVersion](v6, "assetVersion");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MAAutoAssetSelector assetVersion](self, "assetVersion");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v14 = objc_msgSend(v23, "isEqualToString:", v24);

                }
                else
                {
                  v14 = 1;
                }

              }
              else
              {
                v14 = 0;
              }

LABEL_38:
              goto LABEL_39;
            }
LABEL_28:
            v14 = 0;
LABEL_41:

            goto LABEL_42;
          }
LABEL_26:

          goto LABEL_27;
        }
        v20 = 0;
      }
LABEL_25:

      if (!v12)
        goto LABEL_27;
      goto LABEL_26;
    }
    v14 = 0;
  }
LABEL_42:

  return v14;
}

- (id)copyClearingWriteOnlyFields
{
  MAAutoAssetSelector *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = [MAAutoAssetSelector alloc];
  -[MAAutoAssetSelector assetType](self, "assetType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSelector assetSpecifier](self, "assetSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSelector assetVersion](self, "assetVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:](v3, "initForAssetType:withAssetSpecifier:matchingAssetVersion:", v4, v5, v6);

  return v7;
}

- (id)persistedEntryID
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;

  -[MAAutoAssetSelector assetVersion](self, "assetVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB37A0]);
    -[MAAutoAssetSelector assetVersion](self, "assetVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithString:", v5);

    objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", CFSTR(","), CFSTR("_"), 2, 0, objc_msgSend(v6, "length"));
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[MAAutoAssetSelector assetType](self, "assetType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAAutoAssetSelector assetSpecifier](self, "assetSpecifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@_%@_%@"), v8, v9, v6);

  }
  else
  {
    -[MAAutoAssetSelector assetSpecifier](self, "assetSpecifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[MAAutoAssetSelector assetType](self, "assetType");
    v13 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v13;
    if (!v11)
    {
      v10 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("%@_ENTIRE_ASSET_TYPE"), v13);
      goto LABEL_6;
    }
    -[MAAutoAssetSelector assetSpecifier](self, "assetSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("%@_%@"), v6, v8);
  }

LABEL_6:
  return v10;
}

- (id)shortName
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[MAAutoAssetSelector assetVersion](self, "assetVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[MAAutoAssetSelector assetSpecifier](self, "assetSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAAutoAssetSelector assetVersion](self, "assetVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@(%@)"), v5, v6);

  }
  else
  {
    -[MAAutoAssetSelector assetSpecifier](self, "assetSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[MAAutoAssetSelector assetSpecifier](self, "assetSpecifier");
    else
      -[MAAutoAssetSelector assetType](self, "assetType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)summary
{
  void *v3;
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;

  -[MAAutoAssetSelector assetVersion](self, "assetVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[MAAutoAssetSelector assetVersion](self, "assetVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (__CFString *)objc_msgSend(v4, "initWithFormat:", CFSTR("|version:%@"), v5);

  }
  else
  {
    v6 = CFSTR("(any version)");
  }

  v7 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAssetSelector assetType](self, "assetType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSelector assetSpecifier](self, "assetSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSelector downloadDecryptionKey](self, "downloadDecryptionKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("|decryption:Y");
  if (!v10)
    v11 = &stru_1E5D5F930;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("type:%@|specifier:%@%@%@"), v8, v9, v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)newSummaryDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MAAutoAssetSelector assetType](self, "assetType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v4, CFSTR("assetType"));

  -[MAAutoAssetSelector assetSpecifier](self, "assetSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v5, CFSTR("assetSpecifier"));

  -[MAAutoAssetSelector assetVersion](self, "assetVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[MAAutoAssetSelector assetVersion](self, "assetVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSafeObject:forKey:", v7, CFSTR("assetVersion"));

  }
  else
  {
    objc_msgSend(v3, "setSafeObject:forKey:", CFSTR("ANY-VERSION"), CFSTR("assetVersion"));
  }

  -[MAAutoAssetSelector downloadDecryptionKey](self, "downloadDecryptionKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v3, "setSafeObject:forKey:", v9, CFSTR("downloadDecryptionKey"));

  return v3;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (NSString)assetSpecifier
{
  return self->_assetSpecifier;
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(id)a3
{
  objc_storeStrong((id *)&self->_assetVersion, a3);
}

- (NSData)downloadDecryptionKey
{
  return self->_downloadDecryptionKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadDecryptionKey, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_assetSpecifier, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
}

@end
