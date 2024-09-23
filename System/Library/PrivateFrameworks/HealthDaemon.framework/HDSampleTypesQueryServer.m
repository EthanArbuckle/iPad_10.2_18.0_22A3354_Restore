@implementation HDSampleTypesQueryServer

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (void)_queue_start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)HDSampleTypesQueryServer;
  -[HDQueryServer _queue_start](&v25, sel__queue_start);
  -[HDQueryServer clientProxy](self, "clientProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDQueryServer queryUUID](self, "queryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer filter](self, "filter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithProfile:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDQueryServer profile](self, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  +[HDSampleEntity sampleTypesForSamplesMatchingPredicate:profile:error:](HDSampleEntity, "sampleTypesForSamplesMatchingPredicate:profile:error:", v8, v9, &v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v24;

  -[HDQueryServer setDataCount:](self, "setDataCount:", objc_msgSend(v10, "count"));
  if (v11)
  {
    objc_msgSend(v4, "client_deliverError:forQuery:", v11, v5);
  }
  else
  {
    v19 = v5;
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v12, "addObject:", v18);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v15);
    }

    v5 = v19;
    objc_msgSend(v4, "client_deliverSampleTypes:query:", v12, v19);

  }
}

@end
