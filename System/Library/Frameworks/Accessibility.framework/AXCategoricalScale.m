@implementation AXCategoricalScale

- (AXCategoricalScale)init
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  AXAudioGraphLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[AXCategoricalScale init].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  return -[AXCategoricalScale initWithDomain:](self, "initWithDomain:", MEMORY[0x24BDBD1A8]);
}

- (AXCategoricalScale)initWithDomain:(id)a3
{
  id v4;
  AXCategoricalScale *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
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
  v19.super_class = (Class)AXCategoricalScale;
  v5 = -[AXCategoricalScale init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v4;
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
          +[AXDataPointValue valueWithCategory:](AXDataPointValue, "valueWithCategory:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v9);
    }

    v13 = (void *)objc_msgSend(v6, "copy");
    -[AXScale setDomain:](v5, "setDomain:", v13);

  }
  return v5;
}

- (void)init
{
  OUTLINED_FUNCTION_0(&dword_209557000, a1, a3, "Don't call -[AXCategoricalScale init], use -initWithDomain: instead", a5, a6, a7, a8, 0);
}

@end
