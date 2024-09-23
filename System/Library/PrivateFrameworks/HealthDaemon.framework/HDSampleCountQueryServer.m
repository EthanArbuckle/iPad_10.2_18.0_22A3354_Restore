@implementation HDSampleCountQueryServer

- (HDSampleCountQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDSampleCountQueryServer *v11;
  void *v12;
  uint64_t v13;
  NSArray *queryDescriptors;
  objc_super v16;

  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDSampleCountQueryServer;
  v11 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v16, sel_initWithUUID_configuration_client_delegate_, a3, v10, a5, a6);
  if (v11)
  {
    objc_msgSend(v10, "queryDescriptors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    queryDescriptors = v11->_queryDescriptors;
    v11->_queryDescriptors = (NSArray *)v13;

  }
  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (void)_queue_start
{
  void *v3;
  void *v4;
  NSUInteger v5;
  uint64_t v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)HDSampleCountQueryServer;
  -[HDQueryServer _queue_start](&v31, sel__queue_start);
  if (-[NSArray count](self->_queryDescriptors, "count"))
  {
    -[HDQueryServer clientProxy](self, "clientProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteObjectProxy");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (void *)MEMORY[0x1E0C99E08];
    v5 = -[NSArray count](self->_queryDescriptors, "count");
    if (v5 <= 1)
      v6 = 1;
    else
      v6 = v5;
    objc_msgSend(v4, "dictionaryWithCapacity:", v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v7 = self->_queryDescriptors;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v28;
LABEL_7:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v10);
        v23 = 0;
        v24 = &v23;
        v25 = 0x2020000000;
        v26 = 0;
        v12 = HKWithAutoreleasePool();
        v13 = 0;
        if ((v12 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v24[3]);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v14, v11);
        }
        else
        {
          -[HDQueryServer queryUUID](self, "queryUUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "client_deliverError:forQuery:", v13, v14);
        }

        _Block_object_dispose(&v23, 8);
        if (!v12)
          break;
        if (v8 == ++v10)
        {
          v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
          if (v8)
            goto LABEL_7;
          goto LABEL_16;
        }
      }
    }
    else
    {
LABEL_16:

      -[HDQueryServer queryUUID](self, "queryUUID");
      v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "client_deliverSampleCountDictionary:forQuery:", v21, v7);
    }

  }
  else
  {
    -[HDQueryServer clientProxy](self, "clientProxy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "remoteObjectProxy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDQueryServer profile](self, "profile");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    +[HDSampleEntity sampleCountsByTypeForProfile:error:](HDSampleEntity, "sampleCountsByTypeForProfile:error:", v17, &v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v23;

    -[HDQueryServer queryUUID](self, "queryUUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      objc_msgSend(v16, "client_deliverSampleTypeCountDictionary:forQuery:", v18, v20);
    else
      objc_msgSend(v16, "client_deliverError:forQuery:", v19, v20);

  }
}

BOOL __40__HDSampleCountQueryServer__queue_start__block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;

  objc_msgSend(*(id *)(a1 + 32), "sampleType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithProfile:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend((id)objc_msgSend(v4, "dataObjectClass"), "hd_dataEntityClass");
  objc_msgSend(*(id *)(a1 + 40), "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v8, "countOfSamplesWithType:profile:matchingPredicate:withError:", v4, v9, v7, a2);

  v10 = *a2 == 0;
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryDescriptors, 0);
}

@end
