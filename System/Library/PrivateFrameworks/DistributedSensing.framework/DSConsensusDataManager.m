@implementation DSConsensusDataManager

- (DSConsensusDataManager)initWithWindowOfInterest:(double)a3
{
  DSConsensusDataManager *v4;
  DSConsensusDataManager *v5;
  DSConsensusDataManager *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DSConsensusDataManager;
  v4 = -[DSConsensusDataManager init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_windowOfInterest = a3;
    v6 = v4;
  }

  return v5;
}

- (void)_evictOldestDatum
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  if (-[NSMutableArray count](self->_consensusDataArray, "count"))
  {
    while (1)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_consensusDataArray, "objectAtIndexedSubscript:", 0);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "timeIntervalSince1970");
      v5 = v4;
      objc_msgSend(v9, "time");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timeIntervalSince1970");
      v8 = v5 - v7;

      if (v8 <= self->_windowOfInterest)
        break;
      -[NSMutableArray removeObjectAtIndex:](self->_consensusDataArray, "removeObjectAtIndex:", 0);
      -[DSConsensusDataManager _removeDatumFromFrequencyTable:](self, "_removeDatumFromFrequencyTable:", v9);
      -[DSConsensusDataManager _removeDatumFromDataArrayMap:](self, "_removeDatumFromDataArrayMap:", v9);

      if (!-[NSMutableArray count](self->_consensusDataArray, "count"))
        return;
    }

  }
}

- (void)addDatum:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  NSObject *v7;
  void *v8;
  NSMutableArray *consensusDataArray;
  NSMutableArray *v10;
  NSMutableArray *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DSConsensusDataManager _evictOldestDatum](self, "_evictOldestDatum");
  if ((unint64_t)-[NSMutableArray count](self->_consensusDataArray, "count") < 0x64)
  {
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      consensusDataArray = self->_consensusDataArray;
      if (!consensusDataArray)
      {
        v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v11 = self->_consensusDataArray;
        self->_consensusDataArray = v10;

        consensusDataArray = self->_consensusDataArray;
      }
      -[NSMutableArray addObject:](consensusDataArray, "addObject:", v4);
      -[DSConsensusDataManager _addDatumToFrequencyTable:](self, "_addDatumToFrequencyTable:", v4);
      -[DSConsensusDataManager _addDatumtoDataArrayMap:](self, "_addDatumtoDataArrayMap:", v4);
    }
  }
  else
  {
    if (onceTokenDSConsensus_0 != -1)
      dispatch_once(&onceTokenDSConsensus_0, &__block_literal_global_6);
    v5 = (void *)logObjDSConsensus_0;
    if (os_log_type_enabled((os_log_t)logObjDSConsensus_0, OS_LOG_TYPE_DEFAULT))
    {
      v6 = self->_consensusDataArray;
      v7 = v5;
      v12 = 134217984;
      v13 = -[NSMutableArray count](v6, "count");
      _os_log_impl(&dword_217E3C000, v7, OS_LOG_TYPE_DEFAULT, "consensus data array at its maximum capacity: %lu", (uint8_t *)&v12, 0xCu);

    }
  }

}

- (void)_addDatumtoDataArrayMap:(id)a3
{
  id v4;
  NSMutableDictionary *consensusDataArrayMap;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  id v10;
  NSMutableDictionary *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  consensusDataArrayMap = self->_consensusDataArrayMap;
  v16 = v4;
  if (!consensusDataArrayMap)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v7 = self->_consensusDataArrayMap;
    self->_consensusDataArrayMap = v6;

    v4 = v16;
    consensusDataArrayMap = self->_consensusDataArrayMap;
  }
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](consensusDataArrayMap, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v11 = self->_consensusDataArrayMap;
    objc_msgSend(v16, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v10, v12);

  }
  v13 = self->_consensusDataArrayMap;
  objc_msgSend(v16, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v16);

}

- (void)_removeDatumFromDataArrayMap:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_consensusDataArrayMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_consensusDataArrayMap, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v9);

    -[NSMutableDictionary objectForKeyedSubscript:](self->_consensusDataArrayMap, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (!v8)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_consensusDataArrayMap, "setObject:forKeyedSubscript:", 0, v4);
  }

}

- (void)_addDatumToFrequencyTable:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *consensusFrequencyTable;
  id v6;
  int v7;
  const char *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  if (!self->_consensusFrequencyTable)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    consensusFrequencyTable = self->_consensusFrequencyTable;
    self->_consensusFrequencyTable = v4;

  }
  v6 = objc_alloc(MEMORY[0x24BDD17C8]);
  v7 = objc_msgSend(v13, "confidence");
  if (v7 <= 6)
  {
    if (!v7)
    {
      v8 = "lowest";
      goto LABEL_15;
    }
    if (v7 == 4)
    {
      v8 = "low-medium";
      goto LABEL_15;
    }
  }
  else
  {
    switch(v7)
    {
      case 7:
        v8 = "medium";
        goto LABEL_15;
      case 11:
        v8 = "medium-high";
        goto LABEL_15;
      case 15:
        v8 = "highest";
        goto LABEL_15;
    }
  }
  v8 = "?";
LABEL_15:
  v9 = (void *)objc_msgSend(v6, "initWithUTF8String:", v8);
  if (v9)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_consensusFrequencyTable, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_consensusFrequencyTable, "setObject:forKeyedSubscript:", v11, v9);

    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_consensusFrequencyTable, "objectForKeyedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

  }
}

- (void)_removeDatumFromFrequencyTable:(id)a3
{
  id v4;
  int v5;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v5 = objc_msgSend(v12, "confidence");
  if (v5 <= 6)
  {
    if (!v5)
    {
      v6 = "lowest";
      goto LABEL_13;
    }
    if (v5 == 4)
    {
      v6 = "low-medium";
      goto LABEL_13;
    }
LABEL_12:
    v6 = "?";
    goto LABEL_13;
  }
  if (v5 == 7)
  {
    v6 = "medium";
    goto LABEL_13;
  }
  if (v5 == 11)
  {
    v6 = "medium-high";
    goto LABEL_13;
  }
  if (v5 != 15)
    goto LABEL_12;
  v6 = "highest";
LABEL_13:
  v7 = (void *)objc_msgSend(v4, "initWithUTF8String:", v6);
  if (v7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_consensusFrequencyTable, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_consensusFrequencyTable, "objectForKeyedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObject:", v12);

      -[NSMutableDictionary objectForKeyedSubscript:](self->_consensusFrequencyTable, "objectForKeyedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (!v11)
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_consensusFrequencyTable, "setObject:forKeyedSubscript:", 0, v7);
    }
  }

}

- (void)printConsensusData
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_consensusDataArray;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "printInfo", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)printConsensusDataFromWindowStart:(double)a3 ToWindowEnd:(double)a4
{
  double v7;
  NSObject *v8;
  double v9;
  NSObject *v10;
  double windowOfInterest;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  double v30;
  __int16 v31;
  double v32;
  __int16 v33;
  double v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a4 - a3;
  if (v7 > 0.0 && v7 <= self->_windowOfInterest)
  {
    if (onceTokenDSConsensus_0 != -1)
      dispatch_once(&onceTokenDSConsensus_0, &__block_literal_global_6);
    v10 = logObjDSConsensus_0;
    if (os_log_type_enabled((os_log_t)logObjDSConsensus_0, OS_LOG_TYPE_ERROR))
    {
      windowOfInterest = self->_windowOfInterest;
      *(_DWORD *)buf = 134218496;
      v30 = a3;
      v31 = 2048;
      v32 = a4;
      v33 = 2048;
      v34 = windowOfInterest;
      _os_log_impl(&dword_217E3C000, v10, OS_LOG_TYPE_ERROR, "window start: %f and end: %f. Configured window of interest: %f", buf, 0x20u);
    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v12 = self->_consensusDataArray;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDBCE60], "date", (_QWORD)v24);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "timeIntervalSince1970");
          v20 = v19;
          objc_msgSend(v17, "time");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "timeIntervalSince1970");
          v23 = v20 - v22;

          if (v23 >= a3)
          {
            if (v23 > a4)
              goto LABEL_21;
            objc_msgSend(v17, "printInfo");
          }
        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v14);
    }
LABEL_21:

  }
  else
  {
    if (onceTokenDSConsensus_0 != -1)
      dispatch_once(&onceTokenDSConsensus_0, &__block_literal_global_6);
    v8 = logObjDSConsensus_0;
    if (os_log_type_enabled((os_log_t)logObjDSConsensus_0, OS_LOG_TYPE_ERROR))
    {
      v9 = self->_windowOfInterest;
      *(_DWORD *)buf = 134218496;
      v30 = a3;
      v31 = 2048;
      v32 = a4;
      v33 = 2048;
      v34 = v9;
      _os_log_impl(&dword_217E3C000, v8, OS_LOG_TYPE_ERROR, "Invalid window start: %f and end: %f. Configured window of interest: %f", buf, 0x20u);
    }
  }
}

- (NSMutableDictionary)consensusDataArrayMap
{
  return self->_consensusDataArrayMap;
}

- (void)setConsensusDataArrayMap:(id)a3
{
  objc_storeStrong((id *)&self->_consensusDataArrayMap, a3);
}

- (NSMutableArray)consensusDataArray
{
  return self->_consensusDataArray;
}

- (void)setConsensusDataArray:(id)a3
{
  objc_storeStrong((id *)&self->_consensusDataArray, a3);
}

- (NSMutableDictionary)consensusFrequencyTable
{
  return self->_consensusFrequencyTable;
}

- (void)setConsensusFrequencyTable:(id)a3
{
  objc_storeStrong((id *)&self->_consensusFrequencyTable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consensusFrequencyTable, 0);
  objc_storeStrong((id *)&self->_consensusDataArray, 0);
  objc_storeStrong((id *)&self->_consensusDataArrayMap, 0);
}

@end
