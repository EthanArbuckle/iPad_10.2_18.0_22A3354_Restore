@implementation MKPerformanceData

- (MKPerformanceData)initWithDictionary:(id)a3
{
  id v4;
  MKPerformanceData *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  MKDataClassMetrics *v15;
  MKDataClassMetrics *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MKPerformanceData;
  v5 = -[MKPerformanceData init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("data_classes"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v9 = v7;
      v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v20;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v20 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13);
            v15 = [MKDataClassMetrics alloc];
            v16 = -[MKDataClassMetrics initWithDictionary:](v15, "initWithDictionary:", v14, (_QWORD)v19);
            objc_msgSend(v8, "addObject:", v16);

            ++v13;
          }
          while (v11 != v13);
          v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v11);
      }

      objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKPerformanceData setDataClasses:](v5, "setDataClasses:", v17);

    }
    else
    {
      +[MKLog log](MKLog, "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[MKPerformanceData initWithDictionary:].cold.1((uint64_t)v5, v9);
    }

  }
  return v5;
}

uint64_t __40__MKPerformanceData_initWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (NSArray)dataClasses
{
  return self->_dataClasses;
}

- (void)setDataClasses:(id)a3
{
  objc_storeStrong((id *)&self->_dataClasses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataClasses, 0);
}

- (void)initWithDictionary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21EC08000, a2, OS_LOG_TYPE_ERROR, "%@: Invalid dictionary; missing 'data_classes' key.",
    (uint8_t *)&v2,
    0xCu);
}

@end
