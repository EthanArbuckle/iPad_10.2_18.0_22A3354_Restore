@implementation CADInMemoryChangeTimestamp

+ (id)timestampForNow
{
  CADInMemoryChangeTimestamp *v2;
  CalSingleDatabaseInMemoryChangeTimestamp *v3;
  CalSingleDatabaseInMemoryChangeTimestamp *universalTimestamp;

  v2 = objc_alloc_init(CADInMemoryChangeTimestamp);
  v3 = (CalSingleDatabaseInMemoryChangeTimestamp *)objc_alloc_init(MEMORY[0x1E0D0BB50]);
  universalTimestamp = v2->_universalTimestamp;
  v2->_universalTimestamp = v3;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamps, 0);
  objc_storeStrong((id *)&self->_universalTimestamp, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CADInMemoryChangeTimestamp)initWithTimestamps:(id)a3
{
  id v4;
  CADInMemoryChangeTimestamp *v5;
  uint64_t v6;
  NSDictionary *timestamps;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADInMemoryChangeTimestamp;
  v5 = -[CADInMemoryChangeTimestamp init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    timestamps = v5->_timestamps;
    v5->_timestamps = (NSDictionary *)v6;

  }
  return v5;
}

- (CADInMemoryChangeTimestamp)initWithCoder:(id)a3
{
  id v4;
  CADInMemoryChangeTimestamp *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *timestamps;
  uint64_t v12;
  CalSingleDatabaseInMemoryChangeTimestamp *universalTimestamp;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CADInMemoryChangeTimestamp;
  v5 = -[CADInMemoryChangeTimestamp init](&v15, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("timestamps"));
    v10 = objc_claimAutoreleasedReturnValue();
    timestamps = v5->_timestamps;
    v5->_timestamps = (NSDictionary *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("universalTimestamp"));
    v12 = objc_claimAutoreleasedReturnValue();
    universalTimestamp = v5->_universalTimestamp;
    v5->_universalTimestamp = (CalSingleDatabaseInMemoryChangeTimestamp *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  CalSingleDatabaseInMemoryChangeTimestamp *universalTimestamp;
  id v5;

  universalTimestamp = self->_universalTimestamp;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", universalTimestamp, CFSTR("universalTimestamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timestamps, CFSTR("timestamps"));

}

- (id)timestampForDatabase:(int)a3
{
  CalSingleDatabaseInMemoryChangeTimestamp *universalTimestamp;
  CalSingleDatabaseInMemoryChangeTimestamp *v4;
  NSDictionary *timestamps;
  void *v6;

  universalTimestamp = self->_universalTimestamp;
  if (universalTimestamp)
  {
    v4 = universalTimestamp;
  }
  else
  {
    timestamps = self->_timestamps;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](timestamps, "objectForKeyedSubscript:", v6);
    v4 = (CalSingleDatabaseInMemoryChangeTimestamp *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)allDatabases
{
  return -[NSDictionary allKeys](self->_timestamps, "allKeys");
}

- (id)redactedDescription
{
  CalSingleDatabaseInMemoryChangeTimestamp *universalTimestamp;
  void *v5;
  NSDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  universalTimestamp = self->_universalTimestamp;
  if (universalTimestamp)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[all={.self=%llu,.others=%llu}]"), -[CalSingleDatabaseInMemoryChangeTimestamp myself](universalTimestamp, "myself"), -[CalSingleDatabaseInMemoryChangeTimestamp others](self->_universalTimestamp, "others"));
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("["));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = self->_timestamps;
    v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
          if ((unint64_t)objc_msgSend(v5, "length") >= 2)
            objc_msgSend(v5, "appendString:", CFSTR(", "));
          -[NSDictionary objectForKeyedSubscript:](self->_timestamps, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendFormat:", CFSTR("%@={.self=%llu,.others=%llu}"), v11, objc_msgSend(v12, "myself"), objc_msgSend(v12, "others"));

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    return v5;
  }
}

- (id)timestamps
{
  return self->_timestamps;
}

+ (BOOL)doesTimestamp:(id)a3 includeAllChangesVisibleToTimestamp:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v5, "timestamps", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v5, "timestamps");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "timestamps");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = objc_msgSend(v14, "others");
        v18 = objc_msgSend(v16, "myself");

        if (v17 < v18)
        {
          v19 = 0;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v9)
        continue;
      break;
    }
  }
  v19 = 1;
LABEL_11:

  return v19;
}

@end
