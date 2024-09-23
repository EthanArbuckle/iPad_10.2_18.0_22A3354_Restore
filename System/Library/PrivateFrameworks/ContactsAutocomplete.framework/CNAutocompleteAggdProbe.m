@implementation CNAutocompleteAggdProbe

+ (id)preparedBundleIdentifier:(id)a3
{
  id v3;
  __CFString *v4;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.")))
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("com.apple."), "length"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("unknown");
  }

  return v4;
}

- (CNAutocompleteAggdProbe)init
{
  return -[CNAutocompleteAggdProbe initWithKeyPrefix:bundleIdentifier:](self, "initWithKeyPrefix:bundleIdentifier:", &stru_1E70E0E70, 0);
}

- (CNAutocompleteAggdProbe)initWithKeyPrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  CNAutocompleteAggdProbe *v8;

  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNAutocompleteAggdProbe initWithKeyPrefix:bundleIdentifier:](self, "initWithKeyPrefix:bundleIdentifier:", v5, v7);

  return v8;
}

- (CNAutocompleteAggdProbe)initWithKeyPrefix:(id)a3 bundleIdentifier:(id)a4
{
  id v7;
  id v8;
  CNAutocompleteAggdProbe *v9;
  CNAutocompleteAggdProbe *v10;
  uint64_t v11;
  NSString *bundleID;
  uint64_t v13;
  NSMutableDictionary *setData;
  uint64_t v15;
  NSMutableDictionary *addData;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CNAutocompleteAggdProbe;
  v9 = -[CNAutocompleteAggdProbe init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyPrefix, a3);
    objc_msgSend((id)objc_opt_class(), "preparedBundleIdentifier:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    bundleID = v10->_bundleID;
    v10->_bundleID = (NSString *)v11;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    setData = v10->_setData;
    v10->_setData = (NSMutableDictionary *)v13;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    addData = v10->_addData;
    v10->_addData = (NSMutableDictionary *)v15;

  }
  return v10;
}

- (id)fullKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNAutocompleteAggdProbe keyPrefix](self, "keyPrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteAggdProbe bundleID](self, "bundleID", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  CNAutocompleteProbeBuildKey(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)recordSetValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[CNAutocompleteAggdProbe setData](self, "setData");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteAggdProbe fullKey:](self, "fullKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v8);
}

- (void)recordAddValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[CNAutocompleteAggdProbe addData](self, "addData");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteAggdProbe fullKey:](self, "fullKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v8);
}

- (void)sendData
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[CNAutocompleteAggdProbe addData](self, "addData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteAggdProbe setData](self, "setData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAutocompleteAggdProbeAggdWrapper ADClientBatchKeysAddKeys:setKeys:](CNAutocompleteAggdProbeAggdWrapper, "ADClientBatchKeysAddKeys:setKeys:", v3, v4);

  CNALoggingContextProbes();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[CNAutocompleteAggdProbe addData](self, "addData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteAggdProbe setData](self, "setData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1B9950000, v5, OS_LOG_TYPE_DEFAULT, "PROBES: add: %@ set: %@", (uint8_t *)&v10, 0x16u);

  }
  -[CNAutocompleteAggdProbe addData](self, "addData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  -[CNAutocompleteAggdProbe setData](self, "setData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

}

- (NSString)keyPrefix
{
  return self->_keyPrefix;
}

- (NSMutableDictionary)setData
{
  return self->_setData;
}

- (void)setSetData:(id)a3
{
  objc_storeStrong((id *)&self->_setData, a3);
}

- (NSMutableDictionary)addData
{
  return self->_addData;
}

- (void)setAddData:(id)a3
{
  objc_storeStrong((id *)&self->_addData, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_addData, 0);
  objc_storeStrong((id *)&self->_setData, 0);
  objc_storeStrong((id *)&self->_keyPrefix, 0);
}

@end
