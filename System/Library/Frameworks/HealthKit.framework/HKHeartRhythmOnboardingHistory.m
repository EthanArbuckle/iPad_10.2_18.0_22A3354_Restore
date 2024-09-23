@implementation HKHeartRhythmOnboardingHistory

- (HKHeartRhythmOnboardingHistory)initWithDictionary:(id)a3
{
  id v5;
  HKHeartRhythmOnboardingHistory *v6;
  HKHeartRhythmOnboardingHistory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHeartRhythmOnboardingHistory;
  v6 = -[HKHeartRhythmOnboardingHistory init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    v7->_count = objc_msgSend(v5, "count");
  }

  return v7;
}

- (id)filteredHistoryByVersion:(int64_t)a3 filterType:(int64_t)a4
{
  const char *v4;

  if (a4 == 2)
  {
    -[HKHeartRhythmOnboardingHistory _filterOnlyLessThanVersion:](self, "_filterOnlyLessThanVersion:", a3);
    v4 = (const char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    -[HKHeartRhythmOnboardingHistory _filterLessThanOrEqualToVersion:](self, "_filterLessThanOrEqualToVersion:", a3);
    v4 = (const char *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    a2 = v4;
  }
  return (id)(id)a2;
}

- (id)_filterLessThanOrEqualToVersion:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  HKHeartRhythmOnboardingHistory *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99E08];
  -[HKHeartRhythmOnboardingHistory dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKHeartRhythmOnboardingHistory dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v15, "integerValue", (_QWORD)v20) <= a3)
        {
          -[HKHeartRhythmOnboardingHistory dataSource](self, "dataSource");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v15);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  v18 = -[HKHeartRhythmOnboardingHistory initWithDictionary:]([HKHeartRhythmOnboardingHistory alloc], "initWithDictionary:", v7);
  return v18;
}

- (id)_filterOnlyLessThanVersion:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  HKHeartRhythmOnboardingHistory *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[HKHeartRhythmOnboardingHistory dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)MEMORY[0x1E0C99E08];
    -[HKHeartRhythmOnboardingHistory dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v20 = v6;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v15, "integerValue") >= a3)
          {
            -[HKHeartRhythmOnboardingHistory _emptyHistory](self, "_emptyHistory");
            v18 = (HKHeartRhythmOnboardingHistory *)objc_claimAutoreleasedReturnValue();

            goto LABEL_12;
          }
          -[HKHeartRhythmOnboardingHistory dataSource](self, "dataSource");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v12)
          continue;
        break;
      }
    }

    v18 = -[HKHeartRhythmOnboardingHistory initWithDictionary:]([HKHeartRhythmOnboardingHistory alloc], "initWithDictionary:", v9);
LABEL_12:

    v6 = v20;
  }
  else
  {
    -[HKHeartRhythmOnboardingHistory _emptyHistory](self, "_emptyHistory");
    v18 = (HKHeartRhythmOnboardingHistory *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (id)_emptyHistory
{
  HKHeartRhythmOnboardingHistory *v2;

  v2 = [HKHeartRhythmOnboardingHistory alloc];
  return -[HKHeartRhythmOnboardingHistory initWithDictionary:](v2, "initWithDictionary:", MEMORY[0x1E0C9AA70]);
}

- (int64_t)maxOnboardedVersion
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HKHeartRhythmOnboardingHistory dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "integerValue", (_QWORD)v12) > v7)
          v7 = objc_msgSend(v10, "integerValue");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)containsOnboardedVersion:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HKHeartRhythmOnboardingHistory dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);

  return (char)v4;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HKHeartRhythmOnboardingHistory dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSDictionary)dataSource
{
  return self->_dataSource;
}

- (int64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
