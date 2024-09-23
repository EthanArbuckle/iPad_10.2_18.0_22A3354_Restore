@implementation CATLocalizationHelper

+ (id)helperForBundle:(id)a3
{
  id v5;
  CATLocalizationHelper *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  SEL v13;

  v5 = a3;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __41__CATLocalizationHelper_helperForBundle___block_invoke;
  v11 = &__block_descriptor_48_e5_v8__0l;
  v12 = a1;
  v13 = a2;
  if (helperForBundle__onceToken != -1)
    dispatch_once(&helperForBundle__onceToken, &v8);
  objc_msgSend((id)helperForBundle__lock, "lock", v8, v9, v10, v11, v12, v13);
  objc_msgSend((id)helperForBundle__helperByBundle, "objectForKey:", v5);
  v6 = (CATLocalizationHelper *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = -[CATLocalizationHelper initWithBundle:]([CATLocalizationHelper alloc], "initWithBundle:", v5);
    objc_msgSend((id)helperForBundle__helperByBundle, "setObject:forKey:", v6, v5);
  }
  objc_msgSend((id)helperForBundle__lock, "unlock");

  return v6;
}

void __41__CATLocalizationHelper_helperForBundle___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)helperForBundle__helperByBundle;
  helperForBundle__helperByBundle = v2;

  v4 = objc_opt_new();
  v5 = (void *)helperForBundle__lock;
  helperForBundle__lock = v4;

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = *(_QWORD *)(a1 + 32);
  NSStringFromSelector(*(SEL *)(a1 + 40));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@.%@"), v7, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)helperForBundle__lock, "setName:", v8);

}

- (CATLocalizationHelper)initWithBundle:(id)a3
{
  id v4;
  CATLocalizationHelper *v5;
  CATLocalizationHelper *v6;
  uint64_t v7;
  NSLock *mLock;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *mStringByKeyByTableName;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CATLocalizationHelper;
  v5 = -[CATLocalizationHelper init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_bundle, v4);
    v7 = objc_opt_new();
    mLock = v6->mLock;
    v6->mLock = (NSLock *)v7;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%p"), objc_opt_class(), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSLock setName:](v6->mLock, "setName:", v9);

    v10 = objc_opt_new();
    mStringByKeyByTableName = v6->mStringByKeyByTableName;
    v6->mStringByKeyByTableName = (NSMutableDictionary *)v10;

  }
  return v6;
}

- (id)stringByKeyForTableName:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v17;
  id v18;
  id v19;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATLocalizationHelper.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tableName"));

  }
  -[NSLock lock](self->mLock, "lock");
  -[NSMutableDictionary objectForKeyedSubscript:](self->mStringByKeyByTableName, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLForResource:withExtension:subdirectory:localization:", v5, CFSTR("strings"), CFSTR("/"), CFSTR("en"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "URLForResource:withExtension:subdirectory:localization:", v5, CFSTR("strings"), CFSTR("/"), CFSTR("English"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v6 = 0;
LABEL_15:
        if (v6)
          v15 = v6;
        else
          v15 = (void *)MEMORY[0x24BDBD1B8];
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->mStringByKeyByTableName, "setObject:forKeyedSubscript:", v15, v5);

        goto LABEL_19;
      }
    }
    v19 = 0;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfURL:options:error:", v9, 2, &v19);
    v12 = v19;
    if (!v11
      || (v18 = 0,
          objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v11, 0, 0, &v18),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = v18,
          v12,
          v12 = v13,
          !v6))
    {
      if (_CATLogGeneral_onceToken_1 != -1)
        dispatch_once(&_CATLogGeneral_onceToken_1, &__block_literal_global_3);
      v14 = (void *)_CATLogGeneral_logObj_1;
      if (os_log_type_enabled((os_log_t)_CATLogGeneral_logObj_1, OS_LOG_TYPE_ERROR))
        -[CATLocalizationHelper stringByKeyForTableName:].cold.1((uint64_t)v9, v14, v12);
      v6 = 0;
    }

    goto LABEL_15;
  }
LABEL_19:
  -[NSLock unlock](self->mLock, "unlock");

  return v6;
}

- (id)stringsForKey:(id)a3 value:(id)a4 table:(id)a5
{
  id v9;
  id v10;
  __CFString *v11;
  const __CFString *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = (__CFString *)a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATLocalizationHelper.m"), 125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  if (v11)
    v12 = v11;
  else
    v12 = CFSTR("Localizable");
  -[CATLocalizationHelper stringByKeyForTableName:](self, "stringByKeyForTableName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_bundle);
  objc_msgSend(WeakRetained, "localizedStringForKey:value:table:", v9, v10, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForKey:", v9);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v10)
    v18 = v10;
  else
    v18 = v9;
  if (v16)
    v18 = (void *)v16;
  v19 = v18;

  v23[0] = CFSTR("NSLocalizedDescription");
  v23[1] = CFSTR("NSDescription");
  v24[0] = v15;
  v24[1] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (NSBundle)bundle
{
  return (NSBundle *)objc_loadWeakRetained((id *)&self->_bundle);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_bundle);
  objc_storeStrong((id *)&self->mLock, 0);
  objc_storeStrong((id *)&self->mStringByKeyByTableName, 0);
}

- (void)stringByKeyForTableName:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(a3, "verboseDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_209592000, v5, OS_LOG_TYPE_ERROR, "There was an error reading %@: %@", (uint8_t *)&v7, 0x16u);

}

@end
