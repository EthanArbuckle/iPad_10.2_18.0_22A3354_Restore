@implementation CRKProtocolUnioner

+ (id)protocolByUnioningProtocols:(id)a3
{
  id v4;
  id v5;
  Protocol *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  Protocol *v12;
  Protocol *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(a1, "nameOfUnionOfProtocols:", v4);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_allocateProtocol((const char *)objc_msgSend(v5, "UTF8String"));
    v6 = (Protocol *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v7 = v4;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v16 != v10)
              objc_enumerationMutation(v7);
            protocol_addProtocol(v6, *(Protocol **)(*((_QWORD *)&v15 + 1) + 8 * i));
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v9);
      }

      objc_registerProtocol(v6);
      v12 = v6;
    }
    else
    {
      NSProtocolFromString((NSString *)v5);
      v12 = (Protocol *)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

  }
  else
  {
    v13 = &unk_2550424A8;
  }

  return v13;
}

+ (id)nameOfUnionOfProtocols:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (objc_class *)MEMORY[0x24BDBCEB8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithCapacity:", objc_msgSend(v5, "count") + 1);
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v8);

  objc_msgSend(a1, "sortedNamesOfProtocols:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObjectsFromArray:", v9);
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("_"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)sortedNamesOfProtocols:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "nameOfProtocol:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "sortUsingSelector:", sel_compare_);
  v12 = (void *)objc_msgSend(v5, "copy");

  return v12;
}

+ (id)nameOfProtocol:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", protocol_getName((Protocol *)a3));
}

@end
