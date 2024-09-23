@implementation CDMAssetsFactorConfig

- (CDMAssetsFactorConfig)initWithFactorToFoldersMapping:(id)a3
{
  id v4;
  CDMAssetsFactorConfig *v5;
  uint64_t v6;
  NSMutableDictionary *factorToFoldersMapping;
  uint64_t v8;
  NSMutableDictionary *factorToIsRequiredMapping;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CDMAssetsFactorConfig;
  v5 = -[CDMAssetsFactorConfig init](&v11, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = objc_msgSend(v4, "mutableCopy");
      factorToFoldersMapping = v5->_factorToFoldersMapping;
      v5->_factorToFoldersMapping = (NSMutableDictionary *)v6;

    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    factorToIsRequiredMapping = v5->_factorToIsRequiredMapping;
    v5->_factorToIsRequiredMapping = (NSMutableDictionary *)v8;

  }
  return v5;
}

- (void)setIsRequiredForFactor:(id)a3 isRequired:(BOOL)a4
{
  _BOOL8 v4;
  NSMutableDictionary *factorToIsRequiredMapping;
  void *v6;
  id v7;
  id v8;

  if (a3)
  {
    v4 = a4;
    factorToIsRequiredMapping = self->_factorToIsRequiredMapping;
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = a3;
    objc_msgSend(v6, "numberWithBool:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](factorToIsRequiredMapping, "setObject:forKey:", v8, v7);

  }
}

- (id)getFactorToFoldersMapping
{
  return self->_factorToFoldersMapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factorToIsRequiredMapping, 0);
  objc_storeStrong((id *)&self->_factorToFoldersMapping, 0);
}

- (BOOL)isFactorRequired:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_factorToIsRequiredMapping, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_factorToIsRequiredMapping, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)getFoldersForFactor:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_factorToFoldersMapping, "objectForKey:", a3);
}

- (void)addEntriesFromCDMAssetsFactorConfig:(id)a3
{
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    objc_msgSend(a3, "getFactorToFoldersMapping");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v5)
    {
      v7 = v5;
      v8 = *(_QWORD *)v16;
      *(_QWORD *)&v6 = 136315394;
      v14 = v6;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v4);
          v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKeyedSubscript:", v10, v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](self->_factorToFoldersMapping, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            CDMOSLoggerForCategory(0);
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v14;
              v20 = "-[CDMAssetsFactorConfig addEntriesFromCDMAssetsFactorConfig:]";
              v21 = 2112;
              v22 = v10;
              _os_log_debug_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_DEBUG, "%s Skipping folders for %@", buf, 0x16u);
            }

          }
          else
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_factorToFoldersMapping, "setObject:forKeyedSubscript:", v11, v10);
          }

        }
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      }
      while (v7);
    }

  }
}

- (void)setFactorToIsRequiredMapping:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *factorToIsRequiredMapping;

  if (a3)
  {
    v4 = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
    factorToIsRequiredMapping = self->_factorToIsRequiredMapping;
    self->_factorToIsRequiredMapping = v4;
  }
  else
  {
    factorToIsRequiredMapping = self->_factorToFoldersMapping;
    self->_factorToFoldersMapping = 0;
  }

}

- (id)getFactorToIsRequiredMapping
{
  return self->_factorToIsRequiredMapping;
}

- (id)getAllFactors
{
  return (id)-[NSMutableDictionary allKeys](self->_factorToFoldersMapping, "allKeys");
}

- (NSMutableDictionary)factorToFoldersMapping
{
  return self->_factorToFoldersMapping;
}

- (NSMutableDictionary)factorToIsRequiredMapping
{
  return self->_factorToIsRequiredMapping;
}

@end
