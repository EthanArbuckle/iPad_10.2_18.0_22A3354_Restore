@implementation NSDictionary(CRKGenericAdditions)

- (id)crk_mapToDictionary:()CRKGenericAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v6 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __57__NSDictionary_CRKGenericAdditions__crk_mapToDictionary___block_invoke;
  v15[3] = &unk_24D9C9138;
  v16 = v5;
  v7 = v5;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __57__NSDictionary_CRKGenericAdditions__crk_mapToDictionary___block_invoke_2;
  v12[3] = &unk_24D9C9160;
  v13 = v4;
  v14 = (id)MEMORY[0x219A226E8](v15);
  v8 = v14;
  v9 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v12);
  v10 = (void *)objc_msgSend(v7, "copy");

  return v10;
}

- (id)crk_mapUsingBlock:()CRKGenericAdditions
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDictionary+CRKAdditions.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v6 = (void *)objc_opt_new();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __55__NSDictionary_CRKGenericAdditions__crk_mapUsingBlock___block_invoke;
  v12[3] = &unk_24D9C9188;
  v13 = v6;
  v14 = v5;
  v7 = v5;
  v8 = v6;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v12);
  v9 = (void *)objc_msgSend(v8, "copy");

  return v9;
}

- (id)crk_dictionaryByFilteringToKeys:()CRKGenericAdditions
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(a1, "objectForKeyedSubscript:", v11, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  return v13;
}

@end
