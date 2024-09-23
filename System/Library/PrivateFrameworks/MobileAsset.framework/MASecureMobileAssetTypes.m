@implementation MASecureMobileAssetTypes

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_4);
  return (id)sharedInstance_instance;
}

void __42__MASecureMobileAssetTypes_sharedInstance__block_invoke()
{
  MASecureMobileAssetTypes *v0;
  void *v1;

  v0 = objc_alloc_init(MASecureMobileAssetTypes);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

- (MASecureMobileAssetTypes)init
{
  MASecureMobileAssetTypes *v2;
  MASecureMobileAssetTypes *v3;
  uint64_t v4;
  NSDictionary *types;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MASecureMobileAssetTypes;
  v2 = -[MASecureMobileAssetTypes init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MASecureMobileAssetTypes _loadTypes](v2, "_loadTypes");
    v4 = objc_claimAutoreleasedReturnValue();
    types = v3->_types;
    v3->_types = (NSDictionary *)v4;

  }
  return v3;
}

- (BOOL)supportsDarwin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[MASecureMobileAssetTypes types](self, "types");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SupportsDarwin"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)fsTag:(unsigned int *)a3 forAssetType:(id)a4 specifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  char v15;

  v8 = a5;
  v9 = a4;
  -[MASecureMobileAssetTypes types](self, "types");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("FSTags"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v15 = isKindOfClass;
      if (a3 && (isKindOfClass & 1) != 0)
        *a3 = objc_msgSend(v13, "unsignedIntValue");

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15 & 1;
}

- (id)_loadTypes
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v21;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/MobileAsset.framework"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v2;
  if (v2)
  {
    objc_msgSend(v2, "pathForResource:ofType:", CFSTR("SecureMobileAssetTypes"), CFSTR("plist"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v13;
      if (v13)
        v19 = v13;
      else
        _MobileAssetLog(0, 3, (uint64_t)"-[MASecureMobileAssetTypes _loadTypes]", CFSTR("Failed to load SecureMobileAssetTypes.plist"), v14, v15, v16, v17, v21);

    }
    else
    {
      _MobileAssetLog(0, 3, (uint64_t)"-[MASecureMobileAssetTypes _loadTypes]", CFSTR("Failed to find SecureMobileAssetTypes.plist"), v8, v9, v10, v11, v21);
      v18 = 0;
    }

  }
  else
  {
    _MobileAssetLog(0, 3, (uint64_t)"-[MASecureMobileAssetTypes _loadTypes]", CFSTR("Failed to load MobileAsset.framework bundle"), v3, v4, v5, v6, v21);
    v18 = 0;
  }

  return v18;
}

- (NSDictionary)types
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTypes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_types, 0);
}

@end
