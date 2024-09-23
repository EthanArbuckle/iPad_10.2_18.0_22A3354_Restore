@implementation NSSQLiteIndexStatisticsResult

- (NSSQLiteIndexStatisticsResult)initWithResult:(id)a3
{
  NSSQLiteIndexStatisticsResult *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSSQLiteIndexStatisticsResult;
  v4 = -[NSSQLiteIndexStatisticsResult init](&v6, sel_init);
  if (v4)
    v4->_result = a3;
  return v4;
}

- (NSSQLiteIndexStatisticsResult)initWithSubresults:(id)a3
{
  NSSQLiteIndexStatisticsResult *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)NSSQLiteIndexStatisticsResult;
  v4 = -[NSSQLiteIndexStatisticsResult init](&v15, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(a3);
          objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "result"));
        }
        while (v7 != v9);
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v7);
    }
    v4->_result = (id)objc_msgSend(v5, "copy");

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSSQLiteIndexStatisticsResult;
  -[NSSQLiteIndexStatisticsResult dealloc](&v3, sel_dealloc);
}

- (id)result
{
  return objc_getProperty(self, a2, 8, 1);
}

@end
