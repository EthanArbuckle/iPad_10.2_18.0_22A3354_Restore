@implementation ASSampleCollector

+ (id)sampleDictionaryByIndex:(id)a3 sampleIndexBlock:(id)a4
{
  id v5;
  uint64_t (**v6)(id, _QWORD);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  id obj;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (uint64_t (**)(id, _QWORD))a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v5;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v24 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v24)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        v12 = v6[2](v6, v11);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          v16 = v14;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCF20], "set");
          v16 = (id)objc_claimAutoreleasedReturnValue();
        }
        v17 = v16;

        objc_msgSend(v17, "setByAddingObject:", v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v12);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, v19);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

@end
