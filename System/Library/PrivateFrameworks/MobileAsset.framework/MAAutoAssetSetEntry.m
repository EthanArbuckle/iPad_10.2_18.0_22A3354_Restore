@implementation MAAutoAssetSetEntry

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4
{
  return -[MAAutoAssetSetEntry initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:](self, "initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:", a3, a4, 0, 0, 0);
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 matchingAssetVersion:(id)a5
{
  return -[MAAutoAssetSetEntry initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:](self, "initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:", a3, a4, a5, 0, 0);
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 assetLockedInhibitsRemoval:(BOOL)a5
{
  return -[MAAutoAssetSetEntry initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:](self, "initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:", a3, a4, 0, 0, a5);
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 usingDecryptionKey:(id)a5
{
  return -[MAAutoAssetSetEntry initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:](self, "initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:", a3, a4, 0, a5, 0);
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 usingDecryptionKey:(id)a5 assetLockedInhibitsRemoval:(BOOL)a6
{
  return -[MAAutoAssetSetEntry initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:](self, "initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:assetLockedInhibitsRemoval:", a3, a4, 0, a5, a6);
}

- (id)initForAssetType:(id)a3 withAssetSpecifier:(id)a4 matchingAssetVersion:(id)a5 usingDecryptionKey:(id)a6 assetLockedInhibitsRemoval:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  MAAutoAssetSetEntry *v16;
  MAAutoAssetSelector *v17;
  MAAutoAssetSelector *assetSelector;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MAAutoAssetSetEntry;
  v16 = -[MAAutoAssetSetEntry init](&v20, sel_init);
  if (v16)
  {
    v17 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:]([MAAutoAssetSelector alloc], "initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:", v12, v13, v14, v15);
    assetSelector = v16->_assetSelector;
    v16->_assetSelector = v17;

    v16->_assetLockedInhibitsRemoval = a7;
  }

  return v16;
}

- (MAAutoAssetSetEntry)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetSetEntry *v5;
  uint64_t v6;
  MAAutoAssetSelector *assetSelector;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAAutoAssetSetEntry;
  v5 = -[MAAutoAssetSetEntry init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetSelector"));
    v6 = objc_claimAutoreleasedReturnValue();
    assetSelector = v5->_assetSelector;
    v5->_assetSelector = (MAAutoAssetSelector *)v6;

    v5->_assetLockedInhibitsRemoval = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("assetLockedInhibitsRemoval"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MAAutoAssetSetEntry assetSelector](self, "assetSelector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("assetSelector"));

  objc_msgSend(v5, "encodeBool:forKey:", -[MAAutoAssetSetEntry assetLockedInhibitsRemoval](self, "assetLockedInhibitsRemoval"), CFSTR("assetLockedInhibitsRemoval"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  MAAutoAssetSetEntry *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = [MAAutoAssetSetEntry alloc];
  -[MAAutoAssetSetEntry assetSelector](self, "assetSelector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetEntry assetSelector](self, "assetSelector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetEntry assetSelector](self, "assetSelector");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "downloadDecryptionKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MAAutoAssetSetEntry initForAssetType:withAssetSpecifier:usingDecryptionKey:assetLockedInhibitsRemoval:](v3, "initForAssetType:withAssetSpecifier:usingDecryptionKey:assetLockedInhibitsRemoval:", v5, v7, v9, -[MAAutoAssetSetEntry assetLockedInhibitsRemoval](self, "assetLockedInhibitsRemoval"));

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  MAAutoAssetSetEntry *v4;
  MAAutoAssetSetEntry *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  int v10;

  v4 = (MAAutoAssetSetEntry *)a3;
  if (v4 == self)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MAAutoAssetSetEntry assetSelector](v5, "assetSelector");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[MAAutoAssetSetEntry assetSelector](v5, "assetSelector");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[MAAutoAssetSetEntry assetSelector](self, "assetSelector");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isEqual:", v8))
        {
          v9 = -[MAAutoAssetSetEntry assetLockedInhibitsRemoval](v5, "assetLockedInhibitsRemoval");
          v10 = v9 ^ -[MAAutoAssetSetEntry assetLockedInhibitsRemoval](self, "assetLockedInhibitsRemoval") ^ 1;
        }
        else
        {
          LOBYTE(v10) = 0;
        }

      }
      else
      {
        LOBYTE(v10) = 0;
      }

    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }

  return v10;
}

- (id)summary
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAssetSetEntry assetSelector](self, "assetSelector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "summary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MAAutoAssetSetEntry assetLockedInhibitsRemoval](self, "assetLockedInhibitsRemoval");
  v7 = CFSTR("N");
  if (v6)
    v7 = CFSTR("Y");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("assetSelector:%@|assetLockedInhibitsRemoval:%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (MAAutoAssetSelector)assetSelector
{
  return self->_assetSelector;
}

- (void)setAssetSelector:(id)a3
{
  objc_storeStrong((id *)&self->_assetSelector, a3);
}

- (BOOL)assetLockedInhibitsRemoval
{
  return self->_assetLockedInhibitsRemoval;
}

- (void)setAssetLockedInhibitsRemoval:(BOOL)a3
{
  self->_assetLockedInhibitsRemoval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSelector, 0);
}

@end
