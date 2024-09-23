@implementation HDDataCollectorMultiplexer

- (id)initForCollector:(id)a3 identifier:(id)a4 profile:(id)a5 types:(id)a6
{
  id v10;
  id v11;
  id v12;
  HDDataCollectorMultiplexer *v13;
  HDDataCollectorMultiplexer *v14;
  uint64_t v15;
  NSMapTable *recordsByAggregator;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id WeakRetained;
  void *v27;
  void *v28;
  HDDataCollectorAggregatorRecord *v29;
  id v30;
  id v31;
  HDDataCollectorMultiplexer *v32;
  uint64_t v33;
  NSString *identifier;
  uint64_t v35;
  HDDataCollectorConfiguration *configuration;
  HDCollectedSensorDatum *lastSensorDatum;
  uint64_t v38;
  NSDictionary *aggregatorsByType;
  id v41;
  id v42;
  id v43;
  id obj;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  objc_super v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v45 = a4;
  v11 = a5;
  v12 = a6;
  v50.receiver = self;
  v50.super_class = (Class)HDDataCollectorMultiplexer;
  v13 = -[HDDataCollectorMultiplexer init](&v50, sel_init);
  v14 = v13;
  if (v13)
  {
    v42 = v11;
    objc_storeWeak((id *)&v13->_profile, v11);
    v43 = v10;
    objc_storeWeak((id *)&v14->_collector, v10);
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v15 = objc_claimAutoreleasedReturnValue();
    recordsByAggregator = v14->_recordsByAggregator;
    v14->_recordsByAggregator = (NSMapTable *)v15;

    v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v41 = v12;
    obj = v12;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v47 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          v23 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v22, "identifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringWithFormat:", CFSTR("%@.%@"), v45, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          WeakRetained = objc_loadWeakRetained((id *)&v14->_profile);
          objc_msgSend(WeakRetained, "dataCollectionManager");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "aggregatorForType:", v22);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "setObject:forKeyedSubscript:", v28, v22);
          v29 = [HDDataCollectorAggregatorRecord alloc];
          v30 = v28;
          v31 = v25;
          if (v29)
          {
            v51.receiver = v29;
            v51.super_class = (Class)HDDataCollectorAggregatorRecord;
            v32 = -[HDDataCollectorMultiplexer init](&v51, sel_init);
            v29 = (HDDataCollectorAggregatorRecord *)v32;
            if (v32)
            {
              objc_storeStrong((id *)&v32->_collector, v28);
              v33 = objc_msgSend(v31, "copy");
              identifier = v29->_identifier;
              v29->_identifier = (NSString *)v33;

              +[HDDataCollectorConfiguration disabledConfiguration](HDDataCollectorConfiguration, "disabledConfiguration");
              v35 = objc_claimAutoreleasedReturnValue();
              configuration = v29->_configuration;
              v29->_configuration = (HDDataCollectorConfiguration *)v35;

              lastSensorDatum = v29->_lastSensorDatum;
              v29->_lastSensorDatum = 0;

              v29->_hasSetLastSensorDatum = 0;
            }
          }

          -[NSMapTable setObject:forKey:](v14->_recordsByAggregator, "setObject:forKey:", v29, v30);
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      }
      while (v19);
    }

    v38 = objc_msgSend(v17, "copy");
    aggregatorsByType = v14->_aggregatorsByType;
    v14->_aggregatorsByType = (NSDictionary *)v38;

    v11 = v42;
    v10 = v43;
    v12 = v41;
  }

  return v14;
}

- (void)registerForCollectionWithState:(id)a3
{
  id WeakRetained;
  void *v5;
  NSDictionary *aggregatorsByType;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_collector);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    aggregatorsByType = self->_aggregatorsByType;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__HDDataCollectorMultiplexer_registerForCollectionWithState___block_invoke;
    v8[3] = &unk_1E6CFC3F0;
    v9 = WeakRetained;
    v10 = v7;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](aggregatorsByType, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
}

uint64_t __61__HDDataCollectorMultiplexer_registerForCollectionWithState___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "registerDataCollector:state:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)unregisterForCollection
{
  id WeakRetained;
  NSDictionary *aggregatorsByType;
  id v5;
  _QWORD v6[4];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_collector);
  if (WeakRetained)
  {
    aggregatorsByType = self->_aggregatorsByType;
    v6[1] = 3221225472;
    v6[2] = __53__HDDataCollectorMultiplexer_unregisterForCollection__block_invoke;
    v6[3] = &unk_1E6CFC418;
    v5 = WeakRetained;
    v6[0] = MEMORY[0x1E0C809B0];
    v7 = WeakRetained;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](aggregatorsByType, "enumerateKeysAndObjectsUsingBlock:", v6);

    WeakRetained = v5;
  }

}

uint64_t __53__HDDataCollectorMultiplexer_unregisterForCollection__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "unregisterDataCollector:", *(_QWORD *)(a1 + 32));
}

- (id)aggregatorForType:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_aggregatorsByType, "objectForKeyedSubscript:", a3);
}

- (id)identifierForAggregator:(id)a3
{
  _QWORD *v3;
  void *v4;
  _QWORD *v5;

  -[NSMapTable objectForKey:](self->_recordsByAggregator, "objectForKey:", a3);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v3 = (_QWORD *)v3[3];
  v5 = v3;

  return v5;
}

- (id)lastDatumForType:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  -[NSDictionary objectForKeyedSubscript:](self->_aggregatorsByType, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMapTable objectForKey:](self->_recordsByAggregator, "objectForKey:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = *(void **)(v5 + 40);
    else
      v7 = 0;
    v8 = v7;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setLastSensorDatum:(id)a3 forAggregator:(id)a4
{
  NSMapTable *recordsByAggregator;
  id v7;
  id v8;
  id *v9;

  recordsByAggregator = self->_recordsByAggregator;
  v7 = a3;
  -[NSMapTable objectForKey:](recordsByAggregator, "objectForKey:", a4);
  v9 = (id *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v9)
  {
    objc_storeStrong(v9 + 5, a3);
    *((_BYTE *)v9 + 8) = 1;
  }

}

- (id)mergedConfiguration
{
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  os_log_t *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  HDDataCollectorMultiplexer *v23;
  __int16 v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  +[HDDataCollectorConfiguration disabledConfiguration](HDDataCollectorConfiguration, "disabledConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[NSMapTable objectEnumerator](self->_recordsByAggregator, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v19;
    v9 = (os_log_t *)MEMORY[0x1E0CB52A8];
    *(_QWORD *)&v6 = 138543618;
    v17 = v6;
    while (2)
    {
      v10 = 0;
      v11 = v3;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v4);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10);
        if (!v12 || !*(_BYTE *)(v12 + 8))
        {
          _HKInitializeLogging();
          v15 = *v9;
          if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            v23 = self;
            v24 = 2114;
            v25 = v12;
            _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: last sensor dataum has not been set for %{public}@", buf, 0x16u);
          }
          +[HDDataCollectorConfiguration disabledConfiguration](HDDataCollectorConfiguration, "disabledConfiguration", v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_16;
        }
        _HKInitializeLogging();
        v13 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v17;
          v23 = self;
          v24 = 2114;
          v25 = v12;
          _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_INFO, "%{public}@: merging configuration for record %{public}@", buf, 0x16u);
        }
        objc_msgSend(v11, "mergedConfiguration:", *(_QWORD *)(v12 + 32), v17);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        ++v10;
        v11 = v3;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v7)
        continue;
      break;
    }
  }

  v11 = v3;
  v14 = v11;
LABEL_16:

  return v14;
}

- (void)setConfiguration:(id)a3 forAggregator:(id)a4
{
  NSMapTable *recordsByAggregator;
  id v7;
  id *v8;

  recordsByAggregator = self->_recordsByAggregator;
  v7 = a3;
  -[NSMapTable objectForKey:](recordsByAggregator, "objectForKey:", a4);
  v8 = (id *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_storeStrong(v8 + 4, a3);

}

- (id)diagnosticDescription
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendString:", CFSTR("Diagnostic Description:\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\taggregatorsByType: %@\n"), self->_aggregatorsByType);
  objc_msgSend(v3, "appendFormat:", CFSTR("\trecordsByAggregator: %@\n"), self->_recordsByAggregator);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordsByAggregator, 0);
  objc_storeStrong((id *)&self->_aggregatorsByType, 0);
  objc_destroyWeak((id *)&self->_collector);
  objc_destroyWeak((id *)&self->_profile);
}

@end
