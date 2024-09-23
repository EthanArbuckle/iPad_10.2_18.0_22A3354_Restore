@implementation HKMedicationsNumberToNumberPairListMap

- (HKMedicationsNumberToNumberPairListMap)init
{
  HKMedicationsNumberToNumberPairListMap *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *storage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKMedicationsNumberToNumberPairListMap;
  v2 = -[HKMedicationsNumberToNumberPairListMap init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    storage = v2->_storage;
    v2->_storage = v3;

  }
  return v2;
}

- (void)addInteger:(int64_t)a3 andInteger:(int64_t)a4 forKey:(int64_t)a5
{
  NSMutableDictionary *storage;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  HKMedicationsIntegerPair *v13;
  id v14;

  storage = self->_storage;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](storage, "objectForKeyedSubscript:", v10);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v11 = self->_storage;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v14, v12);

  }
  v13 = objc_alloc_init(HKMedicationsIntegerPair);
  -[HKMedicationsIntegerPair setFirst:](v13, "setFirst:", a3);
  -[HKMedicationsIntegerPair setSecond:](v13, "setSecond:", a4);
  objc_msgSend(v14, "addObject:", v13);

}

- (void)enumerateIntegersForKey:(int64_t)a3 block:(id)a4
{
  void (**v6)(id, uint64_t, uint64_t);
  NSMutableDictionary *storage;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, uint64_t, uint64_t))a4;
  if (v6)
  {
    storage = self->_storage;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](storage, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          v6[2](v6, objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14), "first", (_QWORD)v15), objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14), "second"));
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
