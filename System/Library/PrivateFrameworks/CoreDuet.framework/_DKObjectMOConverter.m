@implementation _DKObjectMOConverter

- (_DKObjectMOConverter)init
{
  _DKObjectMOConverter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKObjectMOConverter;
  result = -[_DKObjectMOConverter init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_readMetadata = 257;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_excludedMetadataKeys, 0);
}

- (id)insertObject:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C97B20];
  v8 = a4;
  objc_msgSend((id)objc_opt_class(), "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertNewObjectForEntityForName:inManagedObjectContext:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
    objc_msgSend(v6, "copyToManagedObject:", v10);

  return v10;
}

- (void)setReadMetadata:(BOOL)a3
{
  self->_readMetadata = a3;
}

- (void)setExcludedMetadataKeys:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setDeduplicateValues:(BOOL)a3
{
  self->_deduplicateValues = a3;
}

- (id)objectsFromManagedObjects:(id)a3
{
  id v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  const char *v16;
  void *context;
  id obj;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v5);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x193FEE914]();
  v6 = 0;
  if (v5 >= 2 && self->_deduplicateValues)
    v6 = -[_DKObjectFromMOCache initWithReporting]([_DKObjectFromMOCache alloc]);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x193FEE914]();
        v13 = -[_DKObjectMOConverter readMetadata](self, "readMetadata");
        -[_DKObjectMOConverter excludedMetadataKeys](self, "excludedMetadataKeys");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[_DKObject objectFromManagedObject:readMetadata:excludedMetadataKeys:cache:](_DKObject, "objectFromManagedObject:readMetadata:excludedMetadataKeys:cache:", v11, v13, v14, v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          objc_msgSend(v20, "addObject:", v15);

        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  if (v6)
    -[_DKObjectFromMOCache reportMetrics](v6, v16);

  objc_autoreleasePoolPop(context);
  return v20;
}

- (id)dataIntervalsFromManagedObjects:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v9, "entity");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[_DKEvent entityName](_DKEvent, "entityName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

        if (v13)
        {
          v14 = (void *)MEMORY[0x1E0C99D68];
          v15 = v9;
          objc_msgSend(v15, "startDate");
          objc_msgSend(v14, "dateWithTimeIntervalSinceReferenceDate:");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)MEMORY[0x1E0C99D68];
          objc_msgSend(v15, "endDate");
          v19 = v18;

          objc_msgSend(v17, "dateWithTimeIntervalSinceReferenceDate:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v16, v20);
          objc_msgSend(v23, "addObject:", v21);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v6);
  }

  return v23;
}

- (BOOL)readMetadata
{
  return self->_readMetadata;
}

- (BOOL)deduplicateValues
{
  return self->_deduplicateValues;
}

- (NSArray)excludedMetadataKeys
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

@end
