@implementation FBKManagedLocalIDObject

+ (id)uniquingKey
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("+uniquingKey not implemented in %@"), objc_opt_class());
  return &stru_24E15EAF8;
}

+ (id)transformJSONArrayIntoLocalIDJSON:(id)a3 uniquingPrefix:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(a1, "transformJSONDictionaryIntoLocalIDJSON:uniquingPrefix:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14), v7, (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return v9;
}

+ (id)transformJSONDictionaryIntoLocalIDJSON:(id)a3 uniquingPrefix:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  if (v7)
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a1, "uniquingKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    FBKNilIfNSNull(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@-%@"), v7, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "uniquingKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    FBKNilIfNSNull(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v13)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("id"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("serverID"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v13, "hash"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("id"));

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = (void *)MEMORY[0x24BDBCE88];
    v18 = *MEMORY[0x24BDBCAB0];
    objc_msgSend(a1, "uniquingKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = 0;
  }

  return v16;
}

- (void)setID:(id)a3
{
  id v4;

  v4 = a3;
  -[FBKManagedLocalIDObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("ID"));
  -[FBKManagedLocalIDObject setServerID:](self, "setServerID:", v4);

  -[FBKManagedLocalIDObject didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("ID"));
}

- (void)setPropertiesForLocalIDKeys:(id)a3
{
  id v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("serverID"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FBKManagedLocalIDObject setServerID:](self, "setServerID:", v4);

}

@end
