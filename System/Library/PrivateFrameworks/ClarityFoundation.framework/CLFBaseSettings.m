@implementation CLFBaseSettings

- (CLFBaseSettings)init
{
  CLFBaseSettings *v2;
  uint64_t v3;
  NSMutableDictionary *preferenceKeysBySelectorName;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLFBaseSettings;
  v2 = -[AXBaseSettings init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    preferenceKeysBySelectorName = v2->_preferenceKeysBySelectorName;
    v2->_preferenceKeysBySelectorName = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)observeUpdatesForSelector:(SEL)a3 handler:(id)a4
{
  id v6;
  _CLFSettingsObserver *v7;

  v6 = a4;
  v7 = -[_CLFSettingsObserver initWithSettings:settingsSelector:]([_CLFSettingsObserver alloc], "initWithSettings:settingsSelector:", self, a3);
  -[AXBaseSettings registerUpdateBlock:forRetrieveSelector:withListener:](self, "registerUpdateBlock:forRetrieveSelector:withListener:", v6, a3, v7);

  return v7;
}

- (void)registerUpdateBlock:(id)a3 withListener:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend((id)objc_opt_class(), "allPreferenceSelectorsAsStrings", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[AXBaseSettings registerUpdateBlock:forRetrieveSelector:withListener:](self, "registerUpdateBlock:forRetrieveSelector:withListener:", v6, NSSelectorFromString(*(NSString **)(*((_QWORD *)&v13 + 1) + 8 * v12++)), v7);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (NSString)domainName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "domainName");
}

- (void)deleteAllKeys
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __32__CLFBaseSettings_deleteAllKeys__block_invoke;
  v3[3] = &unk_24C71FB98;
  v3[4] = self;
  if (!-[AXBaseSettings _switchFromRootUserIfNecessary:](self, "_switchFromRootUserIfNecessary:", v3))
    -[CLFBaseSettings _deleteAllKeys](self, "_deleteAllKeys");
}

uint64_t __32__CLFBaseSettings_deleteAllKeys__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteAllKeys");
}

+ (void)deleteAllKeys
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "domainName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", v4);
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "removePersistentDomainForName:", v4);

}

+ (NSArray)allPreferenceSelectorsAsStrings
{
  return (NSArray *)MEMORY[0x24BDBD1A8];
}

- (id)preferenceKeyForSelector:(SEL)a3
{
  NSMutableDictionary *preferenceKeysBySelectorName;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;

  if (self)
    preferenceKeysBySelectorName = self->_preferenceKeysBySelectorName;
  else
    preferenceKeysBySelectorName = 0;
  v5 = preferenceKeysBySelectorName;
  NSStringFromSelector(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (uint64_t)preferenceKeysBySelectorName
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

- (void)_deleteAllKeys
{
  void *v2;
  void *v3;
  id v4;

  -[CLFBaseSettings domainName](self, "domainName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", v4);
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "removePersistentDomainForName:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferenceKeysBySelectorName, 0);
}

+ (NSString)domainName
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return (NSString *)&stru_24C720540;
}

@end
