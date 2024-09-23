@implementation MTEventDataProvider

- (id)flattenAdditionalData
{
  void *v2;
  void *v3;

  -[MTEventDataProvider additionalData](self, "additionalData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mt_map:", &__block_literal_global_19);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)additionalData
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalData, 0);
  objc_storeStrong((id *)&self->_knownFieldMethods, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)processMetricsData:(id)a3 performanceData:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void (*v18)(MTEventDataProvider *, uint64_t, id);
  double Current;
  void *v20;
  void *v21;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  v6 = a4;
  -[MTEventDataProvider knownFields](self, "knownFields");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = (void *)MEMORY[0x24BDBD1A8];
  if (v7)
    v9 = (void *)v7;
  v10 = v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v26;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v11);
        v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v14);
        -[MTEventDataProvider knownFieldMethods](self, "knownFieldMethods");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          v18 = (void (*)(MTEventDataProvider *, uint64_t, id))objc_msgSend(v17, "imp");
          if (v6)
            Current = CFAbsoluteTimeGetCurrent();
          else
            Current = 0.0;
          v18(self, objc_msgSend(v17, "accessor"), v24);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v6)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", (uint64_t)((CFAbsoluteTimeGetCurrent() - Current) * 1000000.0));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, v15);

          }
          if (v20)
            objc_msgSend(v23, "setValue:forKey:", v20, v15);

        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v12);
  }

  return v23;
}

- (NSDictionary)knownFieldMethods
{
  MTEventDataProvider *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSDictionary *knownFieldMethods;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_knownFieldMethods)
  {
    -[MTEventDataProvider knownFields](v2, "knownFields");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      v5 = v3;
    else
      v5 = MEMORY[0x24BDBD1A8];
    -[MTEventDataProvider knownFieldMethodsForKnownFields:](v2, "knownFieldMethodsForKnownFields:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    knownFieldMethods = v2->_knownFieldMethods;
    v2->_knownFieldMethods = (NSDictionary *)v6;

  }
  objc_sync_exit(v2);

  return v2->_knownFieldMethods;
}

- (id)knownFieldMethodsForKnownFields:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  __CFString *v26;
  const char *v27;
  uint64_t v28;
  MTKnownFieldMethod *v29;
  uint64_t v30;
  MTKnownFieldMethod *v31;
  void *v32;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v37;
    v9 = CFSTR("Accessor for field named \"%@\" doesn't return an object.");
    v10 = "@";
    do
    {
      v11 = 0;
      v35 = v7;
      do
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(v5);
        v12 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v11);
        v13 = -[MTEventDataProvider knownFieldAccessorForFieldName:](self, "knownFieldAccessorForFieldName:", v12);
        if (v13)
        {
          v14 = v13;
          -[MTEventDataProvider methodSignatureForSelector:](self, "methodSignatureForSelector:", v13);
          v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v16 = (const char *)objc_msgSend(v15, "methodReturnType");
          if (v16 && !strcmp(v16, v10))
          {
            v24 = v8;
            v25 = v5;
            v26 = v9;
            v27 = v10;
            v28 = -[MTEventDataProvider methodForSelector:](self, "methodForSelector:", v14);
            v29 = [MTKnownFieldMethod alloc];
            v30 = v28;
            v10 = v27;
            v9 = v26;
            v5 = v25;
            v8 = v24;
            v7 = v35;
            v31 = -[MTKnownFieldMethod initWithIMP:accessor:](v29, "initWithIMP:accessor:", v30, v14);
            objc_msgSend(v34, "setObject:forKey:", v31, v12);

          }
          else
          {
            v23 = MTConfigurationError(108, v9, v17, v18, v19, v20, v21, v22, v12);
          }

        }
        ++v11;
      }
      while (v7 != v11);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v34);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (SEL)knownFieldAccessorForFieldName:(id)a3
{
  id v3;
  NSString *v4;
  const char *v5;

  v3 = a3;
  objc_msgSend(v3, "stringByAppendingString:", CFSTR(":"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  v5 = NSSelectorFromString(v4);

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v5 = NSSelectorFromString((NSString *)v3);
    if ((objc_opt_respondsToSelector() & 1) == 0)
      v5 = 0;
  }

  return v5;
}

- (MTEventDataProviderDelegate)delegate
{
  return (MTEventDataProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)addFields:(id)a3
{
  id v4;
  MTEventDataProvider *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id *v11;
  id v12;
  void *v13;
  id *v14;
  uint64_t v15;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[MTEventDataProvider additionalData](v5, "additionalData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = (id *)&v15;
  v8 = v4;
  v9 = v8;
  if (v8)
  {
    v10 = v8;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v7, "addObjectsFromArray:", v10);
      else
        objc_msgSend(v7, "addObject:", v10);
      v11 = v14++;
      v12 = *v11;

      v10 = v12;
    }
    while (v12);
  }
  objc_msgSend(v7, "mt_condensedArray");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTEventDataProvider setAdditionalData:](v5, "setAdditionalData:", v13);

  objc_sync_exit(v5);
}

- (void)addFieldsWithDictionary:(id)a3
{
  -[MTEventDataProvider addFields:](self, "addFields:", a3, 0);
}

- (void)addFieldsWithPromise:(id)a3
{
  -[MTEventDataProvider addFields:](self, "addFields:", a3, 0);
}

- (void)addFieldsWithBlock:(id)a3
{
  id v4;

  v4 = (id)MEMORY[0x212BA8428](a3, a2);
  -[MTEventDataProvider addFields:](self, "addFields:", v4, 0);

}

id __44__MTEventDataProvider_flattenAdditionalData__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void (**v3)(void);
  void *v4;
  id v5;
  NSObject *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  NSClassFromString(CFSTR("NSBlock"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (void (**)(void))MEMORY[0x212BA8428](v2);
    v3[2]();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
    }
    else
    {
      MTMetricsKitOSLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v8 = 138412290;
        v9 = v4;
        _os_log_impl(&dword_20D758000, v6, OS_LOG_TYPE_DEBUG, "MetricsKit: A fields block has returned an unrecognized value: %@.", (uint8_t *)&v8, 0xCu);
      }

      v5 = (id)MEMORY[0x24BDBD1B8];
    }

  }
  else
  {
    v5 = v2;
  }

  return v5;
}

- (id)knownFields
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[MTEventDataProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "knownFields");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setKnownFieldMethods:(id)a3
{
  objc_storeStrong((id *)&self->_knownFieldMethods, a3);
}

- (void)setAdditionalData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

@end
