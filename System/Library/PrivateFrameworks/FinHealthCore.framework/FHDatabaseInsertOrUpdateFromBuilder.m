@implementation FHDatabaseInsertOrUpdateFromBuilder

+ (id)initWithBuilder:(id)a3
{
  void (**v3)(id, void *);
  void *v4;
  id v5;

  v3 = (void (**)(id, void *))a3;
  v4 = (void *)objc_opt_new();
  v3[2](v3, v4);

  v5 = -[FHDatabaseInsertOrUpdateFromBuilder _init:]([FHDatabaseInsertOrUpdateFromBuilder alloc], "_init:", v4);
  return v5;
}

- (id)_init:(id)a3
{
  id v4;
  FHDatabaseInsertOrUpdateFromBuilder *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *fieldValuePairList;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FHDatabaseInsertOrUpdateFromBuilder;
  v5 = -[FHDatabaseInsertOrUpdateFromBuilder init](&v19, sel_init);
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v4, "dynamicFieldValuePairList", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v9);
    }

    v12 = objc_msgSend(v6, "copy");
    fieldValuePairList = v5->_fieldValuePairList;
    v5->_fieldValuePairList = (NSArray *)v12;

  }
  return v5;
}

- (NSArray)fieldValuePairList
{
  return self->_fieldValuePairList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldValuePairList, 0);
}

@end
