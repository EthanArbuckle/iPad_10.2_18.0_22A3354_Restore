@implementation HDMCSymptomHistoryBuilder

- (HDMCSymptomHistoryBuilder)initWithCurrentDayIndex:(int64_t)a3
{
  HDMCSymptomHistoryBuilder *v3;
  uint64_t v4;
  NSMutableDictionary *mostRecentDayBySymptom;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDMCSymptomHistoryBuilder;
  v3 = -[HDMCSymptomHistoryBuilder init](&v7, sel_init, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    mostRecentDayBySymptom = v3->_mostRecentDayBySymptom;
    v3->_mostRecentDayBySymptom = (NSMutableDictionary *)v4;

  }
  return v3;
}

- (void)addSymptoms:(unint64_t)a3 forDayIndex:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  HKMCDaySummarySymptomArrayFromSymptoms();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
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
        -[NSMutableDictionary objectForKeyedSubscript:](self->_mostRecentDayBySymptom, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (!v12 || objc_msgSend(v12, "integerValue") < a4)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mostRecentDayBySymptom, "setObject:forKeyedSubscript:", v14, v11);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

- (unint64_t)recentSymptoms
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[NSMutableDictionary keysSortedByValueUsingSelector:](self->_mostRecentDayBySymptom, "keysSortedByValueUsingSelector:", sel_compare_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reverseObjectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "count");
  if (v5 >= 3)
    v6 = 3;
  else
    v6 = v5;
  objc_msgSend(v4, "subarrayWithRange:", 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v8);
        v11 |= objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "integerValue", (_QWORD)v15);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)setRecentSymptoms:(unint64_t)a3
{
  self->_recentSymptoms = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentDayBySymptom, 0);
}

@end
