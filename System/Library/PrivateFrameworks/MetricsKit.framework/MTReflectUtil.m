@implementation MTReflectUtil

+ (id)mergeAndCleanDictionaries:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[MTReflectUtil removeNullValuesFromDictionary:](MTReflectUtil, "removeNullValuesFromDictionary:", v10, (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addEntriesFromDictionary:", v11);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)removeNullValuesFromDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "keysOfEntriesPassingTest:", &__block_literal_global_1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithValuesForKeys:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)objectAsDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = (void *)MEMORY[0x24BDBD1B8];
  v5 = v4;

  return v5;
}

uint64_t __48__MTReflectUtil_removeNullValuesFromDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  void *v5;
  int v6;

  v3 = (void *)MEMORY[0x24BDBCEF8];
  v4 = a3;
  objc_msgSend(v3, "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6 ^ 1u;
}

+ (BOOL)objectAsBool:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = v3 != 0;

  return v4;
}

+ (id)objectAsArray:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = (void *)MEMORY[0x24BDBD1A8];
  v5 = v4;

  return v5;
}

+ (id)objectAsString:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  v3 = (__CFString *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = &stru_24C7A22D0;
  v5 = v4;

  return v5;
}

@end
