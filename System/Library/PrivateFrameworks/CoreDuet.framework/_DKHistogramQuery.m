@implementation _DKHistogramQuery

- (_DKHistogramQuery)init
{
  _DKHistogramQuery *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKHistogramQuery;
  result = -[_DKHistogramQuery init](&v3, sel_init);
  if (result)
  {
    result->_minimumOccurrencesForInclusion = 1;
    result->_includeLocalResults = 1;
    result->_includeRemoteResults = 1;
    result->_remoteHistogramLimit = 0;
  }
  return result;
}

+ (id)histogramQueryForStream:(id)a3 interval:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "histogramQueryForStream:interval:withPredicate:", v6, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_defaultValueKeyPaths
{
  void *v1;
  void *v2;
  char isKindOfClass;

  if (result)
  {
    objc_msgSend(result, "stream");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "eventValueType");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      return &unk_1E272BE60;
    else
      return &unk_1E272BE78;
  }
  return result;
}

+ (id)histogramQueryForStream:(id)a3 interval:(id)a4 withPredicate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char isKindOfClass;
  id v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "eventValueType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    v13 = objc_alloc_init((Class)a1);
    -[_DKHistogramQuery setStream:]((uint64_t)v13, v8);
    -[_DKHistogramQuery setInterval:]((uint64_t)v13, v9);
    objc_msgSend(v13, "setPredicate:", v10);
    -[_DKHistogramQuery _defaultValueKeyPaths](v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValueKeyPaths:", v14);

  }
  return v13;
}

- (void)setStream:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)setInterval:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), a2);
}

+ (id)histogramQueryForStream:(id)a3 interval:(id)a4 predicate:(id)a5 valueKeyPaths:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_opt_class();
  v14 = v13;
  if (v11)
  {
    objc_msgSend(v13, "histogramQueryForStream:interval:withPredicate:", v9, v10, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "histogramQueryForStream:interval:withPredicate:", v9, v10, v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v15, "setValueKeyPaths:", v12);

  return v15;
}

+ (id)histogramQueryForPersistedHistogramsForStream:(id)a3 withCustomIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  -[_DKHistogramQuery setStream:]((uint64_t)v8, v7);

  -[_DKHistogramQuery setCustomIdentifier:]((uint64_t)v8, v6);
  objc_msgSend(v8, "setIncludeLocalResults:", 0);
  return v8;
}

- (void)setCustomIdentifier:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), a2);
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  NSString *customIdentifier;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v16 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKHistogramQuery stream](self, "stream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    customIdentifier = self->_customIdentifier;
  else
    customIdentifier = 0;
  v7 = customIdentifier;
  -[_DKHistogramQuery interval](self, "interval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKHistogramQuery predicate](self, "predicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKHistogramQuery valueKeyPaths](self, "valueKeyPaths");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_DKHistogramQuery includeLocalResults](self, "includeLocalResults"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_DKHistogramQuery includeRemoteResults](self, "includeRemoteResults"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[_DKHistogramQuery remoteHistogramLimit](self, "remoteHistogramLimit"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@:{stream=%@; customIdentifier=%@; interval=%@; predicate=%@; valueKeyPaths=%@; includeLocalResults=%@; includeRemoteResults=%@; remoteHistogramLimit=%@}"),
    v4,
    v5,
    v7,
    v8,
    v9,
    v10,
    v11,
    v12,
    v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DKHistogramQuery)initWithCoder:(id)a3
{
  id v4;
  _DKHistogramQuery *v5;
  uint64_t v6;
  _DKEventStream *stream;
  uint64_t v8;
  NSString *customIdentifier;
  uint64_t v10;
  NSDateInterval *interval;
  uint64_t v12;
  NSPredicate *predicate;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *valueKeyPaths;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_DKHistogramQuery;
  v5 = -[_DKQuery initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stream"));
    v6 = objc_claimAutoreleasedReturnValue();
    stream = v5->_stream;
    v5->_stream = (_DKEventStream *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    customIdentifier = v5->_customIdentifier;
    v5->_customIdentifier = (NSString *)v8;

    v5->_includeLocalResults = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeLocalResults"));
    v5->_includeRemoteResults = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeRemoteResults"));
    v5->_remoteHistogramLimit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("remoteHistogramLimit"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interval"));
    v10 = objc_claimAutoreleasedReturnValue();
    interval = v5->_interval;
    v5->_interval = (NSDateInterval *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predicate"));
    v12 = objc_claimAutoreleasedReturnValue();
    predicate = v5->_predicate;
    v5->_predicate = (NSPredicate *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("valueKeyPaths"));
    v17 = objc_claimAutoreleasedReturnValue();
    valueKeyPaths = v5->_valueKeyPaths;
    v5->_valueKeyPaths = (NSArray *)v17;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_DKHistogramQuery;
  v4 = a3;
  -[_DKQuery encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_stream, CFSTR("stream"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_customIdentifier, CFSTR("customIdentifier"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_includeLocalResults, CFSTR("includeLocalResults"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_includeRemoteResults, CFSTR("includeRemoteResults"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_remoteHistogramLimit, CFSTR("remoteHistogramLimit"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_interval, CFSTR("interval"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_predicate, CFSTR("predicate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_valueKeyPaths, CFSTR("valueKeyPaths"));

}

- (_DKHistogram)_histogramFromValueCounts:(_DKHistogram *)a1
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  id obj;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint8_t v39[128];
  uint8_t buf[4];
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v41 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_18DDBE000, v4, OS_LOG_TYPE_INFO, "Generating histogram from %lu entries.", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v23 = v3;
    obj = v3;
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v27)
    {
      v25 = v5;
      v26 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v35 != v26)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("count"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = (void *)objc_msgSend(v7, "mutableCopy");
          objc_msgSend(v9, "removeObjectForKey:", CFSTR("count"));
          if (objc_msgSend(v9, "count"))
          {
            v29 = v8;
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = 0u;
            v31 = 0u;
            v32 = 0u;
            v33 = 0u;
            v28 = v9;
            v11 = v9;
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
            if (v12)
            {
              v13 = v12;
              v14 = *(_QWORD *)v31;
              do
              {
                for (j = 0; j != v13; ++j)
                {
                  if (*(_QWORD *)v31 != v14)
                    objc_enumerationMutation(v11);
                  v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
                  +[_DKEvent keyPathForMOKeyPath:]((uint64_t)_DKEvent, v16);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v11, "objectForKeyedSubscript:", v16);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v17)
                    v19 = v17;
                  else
                    v19 = v16;
                  objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, v19);

                }
                v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
              }
              while (v13);
            }

            if (objc_msgSend(v10, "count") == 1)
            {
              objc_msgSend(v10, "allValues");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "firstObject");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v5 = v25;
              v8 = v29;
              objc_msgSend(v25, "setObject:forKeyedSubscript:", v29, v21);

            }
            else
            {
              v5 = v25;
              v8 = v29;
              objc_msgSend(v25, "setObject:forKeyedSubscript:", v29, v10);
            }
            v9 = v28;

          }
        }
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v27);
    }

    if (objc_msgSend(v5, "count"))
      a1 = -[_DKHistogram initWithHistogram:]([_DKHistogram alloc], "initWithHistogram:", v5);
    else
      a1 = 0;

    v3 = v23;
  }

  return a1;
}

- (id)_valueForEvent:(void *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "valueKeyPaths");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5 == 1)
    {
      objc_msgSend(a1, "valueKeyPaths");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "valueForKeyPath:", v7);
      a1 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(a1, "valueKeyPaths");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      objc_msgSend(a1, "valueKeyPaths", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v19 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
            objc_msgSend(v3, "valueForKeyPath:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, v15);

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v12);
      }

      a1 = (void *)objc_msgSend(v6, "copy");
    }

  }
  return a1;
}

- (_DKHistogram)_histogramFromEvents:(_DKHistogram *)a1
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v19 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_18DDBE000, v4, OS_LOG_TYPE_INFO, "Generating histogram from %lu events.", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
          -[_DKHistogramQuery _valueForEvent:](a1, *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11, (_QWORD)v13);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    if (objc_msgSend(v5, "count"))
      a1 = -[_DKHistogram initWithValues:]([_DKHistogram alloc], "initWithValues:", v5);
    else
      a1 = 0;

  }
  return a1;
}

- (_QWORD)_constructFetchRequestPredicate
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v1 = a1;
  if (a1)
  {
    if (a1[8])
    {
      v2 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(a1, "stream");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v1, "stream");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "eventValueType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v7, "typeCode"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "predicateWithFormat:", CFSTR("streamName == %@ && streamTypeCode == %@ && customIdentifier == %@"), v4, v8, v1[8]);
      v1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a1, "interval");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v1 = 0;
        return v1;
      }
      v16 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v1, "stream");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v1, "stream");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "eventValueType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v7, "typeCode"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "interval");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "startDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "interval");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "endDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "predicateWithFormat:", CFSTR("streamName == %@ && streamTypeCode == %@ && startDate >= %@ && startDate <= %@"), v4, v8, v12, v14);
      v1 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v1;
}

- (_DKHistogram)_histogramFromManagedObjects:(_DKHistogram *)a1
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _DKHistogram *v10;
  _DKHistogram *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    a1 = objc_alloc_init(_DKHistogram);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
          v10 = [_DKHistogram alloc];
          v11 = -[_DKHistogram initWithManagedObject:](v10, "initWithManagedObject:", v9, (_QWORD)v13);
          if (v11)
            -[_DKHistogram addHistogram:](a1, "addHistogram:", v11);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

  }
  return a1;
}

- (id)_fetchRemoteResultsWithStorage:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD *v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v5 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKHistogramQuery _constructFetchRequestPredicate](a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__17;
    v32 = __Block_byref_object_dispose__17;
    v33 = 0;
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__17;
    v26 = __Block_byref_object_dispose__17;
    v27 = 0;
    objc_msgSend(v5, "managedObjectContextFor:", *MEMORY[0x1E0CB2AC0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __58___DKHistogramQuery__fetchRemoteResultsWithStorage_error___block_invoke;
    v15[3] = &unk_1E26E47F8;
    v9 = v8;
    v16 = v9;
    v10 = v7;
    v17 = v10;
    v18 = a1;
    v11 = v6;
    v19 = v11;
    v20 = &v22;
    v21 = &v28;
    objc_msgSend(v9, "performWithOptions:andBlock:", 4, v15);
    if (a3)
    {
      v12 = (void *)v23[5];
      if (v12)
        *a3 = objc_retainAutorelease(v12);
    }
    v13 = (id)v29[5];

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v28, 8);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)executeUsingCoreDataStorage:(id)a3 error:(id *)a4
{
  void *v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  void *v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  id v63;
  NSObject *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  _BOOL4 v75;
  id *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint8_t buf[4];
  void *v90;
  __int16 v91;
  void *v92;
  _BYTE v93[128];
  void *v94;
  _QWORD v95[2];
  uint64_t v96;
  const __CFString *v97;
  uint64_t v98;
  const __CFString *v99;
  _QWORD v100[3];

  v100[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[_DKHistogramQuery stream](self, "stream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[_DKHistogramQuery stream](self, "stream");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v100[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v100, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  _streamNameFromStreams(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _cdknowledge_signpost_query_begin(v10);

  if (v8)
  {

  }
  -[_DKHistogramQuery stream](self, "stream");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      -[_DKHistogramQuery executeUsingCoreDataStorage:error:].cold.1(v40, v41, v42, v43, v44, v45, v46, v47);

    if (a4)
    {
      v48 = (void *)MEMORY[0x1E0CB35C8];
      v98 = *MEMORY[0x1E0CB2D50];
      v99 = CFSTR("No event stream specified.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduet.knowledge"), 4, v49);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v50 = 4;
    goto LABEL_32;
  }
  if (!-[_DKHistogramQuery includeLocalResults](self, "includeLocalResults")
    && !-[_DKHistogramQuery includeRemoteResults](self, "includeRemoteResults"))
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      -[_DKHistogramQuery executeUsingCoreDataStorage:error:].cold.2(v53, v54, v55, v56, v57, v58, v59, v60);

    if (a4)
    {
      v61 = (void *)MEMORY[0x1E0CB35C8];
      v96 = *MEMORY[0x1E0CB2D50];
      v97 = CFSTR("Invalid parameters: includeLocalResults and includeRemoteResults are both NO.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduet.knowledge"), 3, v62);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v50 = 3;
LABEL_32:
    _cdknowledge_signpost_query_end(0, v50);
    v63 = 0;
    goto LABEL_58;
  }
  -[_DKHistogramQuery valueKeyPaths](self, "valueKeyPaths");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (!v13)
  {
    -[_DKHistogramQuery _defaultValueKeyPaths](self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKHistogramQuery setValueKeyPaths:](self, "setValueKeyPaths:", v14);

  }
  if (-[_DKHistogramQuery includeLocalResults](self, "includeLocalResults"))
  {
    v79 = v7;
    v78 = (void *)MEMORY[0x193FEE914]();
    -[_DKHistogramQuery interval](self, "interval");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "startDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKHistogramQuery interval](self, "interval");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKQuery predicateForEventsBetweenStartDate:endDate:](_DKQuery, "predicateForEventsBetweenStartDate:endDate:", v16, v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0CB3528];
    v81 = (void *)v19;
    v95[0] = v19;
    -[_DKHistogramQuery predicate](self, "predicate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v95[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "andPredicateWithSubpredicates:", v22);
    v23 = objc_claimAutoreleasedReturnValue();

    -[_DKHistogramQuery stream](self, "stream");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v94, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = (void *)v23;
    +[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:](_DKEventQuery, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v23, v25, 0, 0, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_DKHistogramQuery.m");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringByAppendingFormat:", CFSTR(":%d"), 371);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setClientName:", v28);

    objc_msgSend(v26, "setTracker:", &__block_literal_global_56);
    v29 = (void *)MEMORY[0x1E0C99DE8];
    -[_DKHistogramQuery valueKeyPaths](self, "valueKeyPaths");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "arrayWithCapacity:", objc_msgSend(v30, "count"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    -[_DKHistogramQuery valueKeyPaths](self, "valueKeyPaths");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
    if (v33)
    {
      v34 = v33;
      v77 = a4;
      v35 = *(_QWORD *)v86;
      while (2)
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v86 != v35)
            objc_enumerationMutation(v32);
          v37 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
          +[_DKEvent moKeyPathForKeyPath:]((uint64_t)_DKEvent, v37);
          v38 = objc_claimAutoreleasedReturnValue();
          if (!v38)
          {
            +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
            v64 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v90 = v37;
              _os_log_impl(&dword_18DDBE000, v64, OS_LOG_TYPE_DEFAULT, "Unsupported key for histogram query fast-path: '%@'. Falling back to full query.", buf, 0xCu);
            }

            v31 = 0;
            goto LABEL_36;
          }
          v39 = (void *)v38;
          objc_msgSend(v31, "addObject:", v38);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
        if (v34)
          continue;
        break;
      }
LABEL_36:
      v7 = v79;
      a4 = v77;
    }
    else
    {
      v7 = v79;
    }

    if (objc_msgSend(v31, "count"))
    {
      objc_msgSend(v26, "setGroupByProperties:", v31);
      objc_msgSend(v26, "setResultType:", 4);
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        -[_DKHistogramQuery stream](self, "stream");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v90 = v31;
        v91 = 2112;
        v92 = v66;
        _os_log_impl(&dword_18DDBE000, v65, OS_LOG_TYPE_DEFAULT, "Fetching value counts for histogram for keyPaths: %@ stream: %@", buf, 0x16u);

      }
      v84 = 0;
      objc_msgSend(v26, "executeUsingCoreDataStorage:error:", v7, &v84);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v84;
      -[_DKHistogramQuery _histogramFromValueCounts:]((_DKHistogram *)self, v67);
      v68 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        -[_DKHistogramQuery stream](self, "stream");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v90 = v70;
        _os_log_impl(&dword_18DDBE000, v69, OS_LOG_TYPE_DEFAULT, "Fetching events for histogram query for stream: %@", buf, 0xCu);

      }
      v83 = 0;
      objc_msgSend(v26, "executeUsingCoreDataStorage:error:", v7, &v83);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v83;
      -[_DKHistogramQuery _histogramFromEvents:]((_DKHistogram *)self, v67);
      v68 = objc_claimAutoreleasedReturnValue();
    }
    v52 = (void *)v68;

    objc_autoreleasePoolPop(v78);
  }
  else
  {
    v51 = 0;
    v52 = 0;
  }
  if (!-[_DKHistogramQuery includeRemoteResults](self, "includeRemoteResults"))
  {
    v72 = 0;
    if (!a4)
      goto LABEL_51;
    goto LABEL_50;
  }
  v71 = (void *)MEMORY[0x193FEE914]();
  v82 = v51;
  -[_DKHistogramQuery _fetchRemoteResultsWithStorage:error:](self, v7, &v82);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v82;

  objc_autoreleasePoolPop(v71);
  v51 = v73;
  if (a4)
LABEL_50:
    *a4 = objc_retainAutorelease(v51);
LABEL_51:
  if (-[_DKHistogramQuery includeLocalResults](self, "includeLocalResults")
    && -[_DKHistogramQuery includeRemoteResults](self, "includeRemoteResults"))
  {
    objc_msgSend(v52, "addHistogram:", v72);
    _cdknowledge_signpost_query_end(0, 0);
    v74 = v52;
  }
  else
  {
    v75 = -[_DKHistogramQuery includeRemoteResults](self, "includeRemoteResults");
    _cdknowledge_signpost_query_end(0, 0);
    if (v75)
      v74 = v72;
    else
      v74 = v52;
  }
  v63 = v74;

LABEL_58:
  return v63;
}

- (id)handleResults:(id)a3 error:(id)a4
{
  id v6;
  void (**histogramHandler)(id, _DKHistogramQuery *, id, id);

  v6 = a3;
  histogramHandler = (void (**)(id, _DKHistogramQuery *, id, id))self->_histogramHandler;
  if (histogramHandler)
    histogramHandler[2](histogramHandler, self, v6, a4);
  return v6;
}

- (_DKEventStream)stream
{
  return self->_stream;
}

- (NSDateInterval)interval
{
  return self->_interval;
}

- (id)histogramHandler
{
  return self->_histogramHandler;
}

- (void)setHistogramHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)includeLocalResults
{
  return self->_includeLocalResults;
}

- (void)setIncludeLocalResults:(BOOL)a3
{
  self->_includeLocalResults = a3;
}

- (BOOL)includeRemoteResults
{
  return self->_includeRemoteResults;
}

- (void)setIncludeRemoteResults:(BOOL)a3
{
  self->_includeRemoteResults = a3;
}

- (unint64_t)minimumOccurrencesForInclusion
{
  return self->_minimumOccurrencesForInclusion;
}

- (void)setMinimumOccurrencesForInclusion:(unint64_t)a3
{
  self->_minimumOccurrencesForInclusion = a3;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (NSArray)valueKeyPaths
{
  return self->_valueKeyPaths;
}

- (void)setValueKeyPaths:(id)a3
{
  objc_storeStrong((id *)&self->_valueKeyPaths, a3);
}

- (int64_t)remoteHistogramLimit
{
  return self->_remoteHistogramLimit;
}

- (void)setRemoteHistogramLimit:(int64_t)a3
{
  self->_remoteHistogramLimit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueKeyPaths, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_customIdentifier, 0);
  objc_storeStrong(&self->_histogramHandler, 0);
  objc_storeStrong((id *)&self->_interval, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

- (void)executeUsingCoreDataStorage:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, a1, a3, "HistogramQuery does not specify an event stream. Skipping execution.", a5, a6, a7, a8, 0);
}

- (void)executeUsingCoreDataStorage:(uint64_t)a3 error:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, a1, a3, "HistogramQuery excludes all results. Skipping execution.", a5, a6, a7, a8, 0);
}

@end
