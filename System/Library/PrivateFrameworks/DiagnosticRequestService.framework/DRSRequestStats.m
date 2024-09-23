@implementation DRSRequestStats

+ (Class)childStatsClass
{
  return 0;
}

+ (id)keyName
{
  return &stru_1EA3D37D0;
}

+ (id)descriptionStringForRequest:(id)a3
{
  return &stru_1EA3D37D0;
}

+ (id)descriptionStringForChildStats:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(a1, "childStatsClass"))
  {
    objc_msgSend((id)objc_msgSend(a1, "childStatsClass"), "descriptionStringForRequest:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (DRSRequestStats)initWithDescriptionString:(id)a3
{
  id v5;
  DRSRequestStats *v6;
  NSMutableArray *v7;
  NSMutableArray *requests;
  NSMutableDictionary *v9;
  NSMutableDictionary *childStats;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DRSRequestStats;
  v6 = -[DRSRequestStats init](&v12, sel_init);
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    requests = v6->__requests;
    v6->__requests = v7;

    objc_storeStrong((id *)&v6->_descriptionString, a3);
    if (objc_msgSend((id)objc_opt_class(), "childStatsClass"))
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      childStats = v6->__childStats;
      v6->__childStats = v9;

    }
  }

  return v6;
}

- (unint64_t)requestCount
{
  void *v2;
  unint64_t v3;

  -[DRSRequestStats requests](self, "requests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)logSizeBytes
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[DRSRequestStats requests](self, "requests", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "totalLogSizeBytes");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_addChildRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend((id)objc_opt_class(), "childStatsClass"))
  {
    objc_msgSend((id)objc_opt_class(), "descriptionStringForChildStats:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSRequestStats childStats](self, "childStats");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v6 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "childStatsClass")), "initWithDescriptionString:", v4);
      -[DRSRequestStats _childStats](self, "_childStats");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v4);

    }
    objc_msgSend(v6, "addRequest:", v8);

  }
}

- (BOOL)addRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "descriptionStringForRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSRequestStats descriptionString](self, "descriptionString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    -[DRSRequestStats requests](self, "requests");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v4);

    -[DRSRequestStats _addChildRequest:](self, "_addChildRequest:", v4);
  }

  return v7;
}

- (id)_debugDescription:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(&stru_1EA3D37D0, "mutableCopy");
  if (a3)
  {
    v6 = a3;
    do
    {
      objc_msgSend(v5, "appendString:", CFSTR("\t"));
      --v6;
    }
    while (v6);
  }
  v7 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend((id)objc_opt_class(), "keyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSRequestStats descriptionString](self, "descriptionString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: %@:\tCount: %llu, Total log size: %lluB\n"), v8, v9, -[DRSRequestStats requestCount](self, "requestCount"), -[DRSRequestStats logSizeBytes](self, "logSizeBytes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend((id)objc_opt_class(), "childStatsClass"))
  {
    v11 = (void *)objc_msgSend(&stru_1EA3D37D0, "mutableCopy");
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[DRSRequestStats childStats](self, "childStats");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      v17 = a3 + 1;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v18), "_debugDescription:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "appendString:", v19);

          ++v18;
        }
        while (v15 != v18);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v15);
    }

    objc_msgSend(v10, "appendFormat:", CFSTR("%@"), v11);
  }
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%@"), v5, v10);

  return v20;
}

- (id)debugDescription
{
  return -[DRSRequestStats _debugDescription:](self, "_debugDescription:", 0);
}

- (NSString)descriptionString
{
  return self->_descriptionString;
}

- (NSMutableArray)_requests
{
  return self->__requests;
}

- (NSMutableDictionary)_childStats
{
  return self->__childStats;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__childStats, 0);
  objc_storeStrong((id *)&self->__requests, 0);
  objc_storeStrong((id *)&self->_descriptionString, 0);
}

@end
