@implementation NSDictionary(AvatarUI)

- (id)_avtui_deepCopy
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__NSDictionary_AvatarUI___avtui_deepCopy__block_invoke;
  v6[3] = &unk_24DD31CD0;
  v7 = v2;
  v3 = v2;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

+ (id)_avtui_dictionaryByIndexingObjectsInArray:()AvatarUI by:
{
  id v5;
  void (**v6)(id, _QWORD);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    v11 = *MEMORY[0x24BDBCAB0];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        v6[2](v6, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
          objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", v11, CFSTR("Nil key provided for %@"), v13);
        objc_msgSend(v7, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", v11, CFSTR("Already have an object for %@"), v14);
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v14);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  v16 = (void *)objc_msgSend(v7, "copy");
  return v16;
}

@end
