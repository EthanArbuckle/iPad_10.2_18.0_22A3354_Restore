@implementation NWStatsEntityMapperStaticAssignment

- (id)identifierForUUID:(id)a3 derivation:(int *)a4
{
  id result;

  result = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_staticUUIDToBundleIDMap, "objectForKeyedSubscript:", a3);
  if (a4)
    *a4 = 3;
  return result;
}

- (NWStatsEntityMapperStaticAssignment)init
{
  NWStatsEntityMapperStaticAssignment *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *staticUUIDToBundleIDMap;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id v11;
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
  v19.receiver = self;
  v19.super_class = (Class)NWStatsEntityMapperStaticAssignment;
  v2 = -[NWStatsEntityMapperStaticAssignment init](&v19, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    staticUUIDToBundleIDMap = v2->_staticUUIDToBundleIDMap;
    v2->_staticUUIDToBundleIDMap = v3;

    if (v2->_staticUUIDToBundleIDMap)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      objc_msgSend(&unk_24CBE2818, "allKeys", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v16 != v8)
              objc_enumerationMutation(v5);
            v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
            v11 = objc_alloc(MEMORY[0x24BDD1880]);
            objc_msgSend(&unk_24CBE2818, "objectForKeyedSubscript:", v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = (void *)objc_msgSend(v11, "initWithUUIDString:", v12);

            -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_staticUUIDToBundleIDMap, "setObject:forKeyedSubscript:", v10, v13);
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        }
        while (v7);
      }
    }
    else
    {
      v5 = v2;
      v2 = 0;
    }

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticUUIDToBundleIDMap, 0);
}

@end
