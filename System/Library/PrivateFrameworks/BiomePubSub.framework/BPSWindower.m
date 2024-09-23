@implementation BPSWindower

- (BPSWindower)initWithUpstream:(id)a3 key:(id)a4 assigner:(id)a5
{
  id v9;
  id v10;
  id v11;
  BPSWindower *v12;
  BPSWindower *v13;
  uint64_t v14;
  id key;
  uint64_t v16;
  NSMutableDictionary *windows;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BPSWindower;
  v12 = -[BPSWindower init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_upstream, a3);
    v14 = objc_msgSend(v10, "copy");
    key = v13->_key;
    v13->_key = (id)v14;

    objc_storeStrong((id *)&v13->_assigner, a5);
    v16 = objc_opt_new();
    windows = v13->_windows;
    v13->_windows = (NSMutableDictionary *)v16;

  }
  return v13;
}

- (void)subscribe:(id)a3
{
  id v4;
  void *v5;
  _BPSWindowerInner *v6;

  v4 = a3;
  v6 = -[_BPSWindowerInner initWithDownstream:key:assigner:]([_BPSWindowerInner alloc], "initWithDownstream:key:assigner:", v4, self->_key, self->_assigner);

  -[BPSWindower upstream](self, "upstream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscribe:", v6);

}

- (id)upstreamPublishers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BPSWindower upstream](self, "upstream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateWindowsWithEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  (*((void (**)(void))self->_key + 2))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copyWithZone:", 0);

  -[BPSWindower windows](self, "windows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[BPSWindower windows](self, "windows");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)objc_opt_new();
    -[BPSWindower windows](self, "windows");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, v6);

    v10 = (void *)MEMORY[0x1E0C9AA60];
  }

  -[BPSWindower assigner](self, "assigner");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v4;
  objc_msgSend(v12, "updateAndReturnNewWindowStates:input:", v10, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((objc_msgSend(v10, "containsObject:", v19) & 1) == 0)
        {
          -[BPSWindower windows](self, "windows");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", v6);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v19);

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v16);
  }

}

- (id)firstCompletedWindow
{
  return -[BPSWindower firstCompletedWindowShouldRemove:](self, "firstCompletedWindowShouldRemove:", 1);
}

- (id)firstCompletedWindowShouldRemove:(BOOL)a3
{
  void *v5;
  BPSWindowerInput *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BPSWindowerInput *v10;
  _QWORD v12[7];
  BOOL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  v19 = 0;
  -[BPSWindower windows](self, "windows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__BPSWindower_firstCompletedWindowShouldRemove___block_invoke;
  v12[3] = &unk_1E554D340;
  v12[4] = self;
  v12[5] = &v14;
  v12[6] = &v20;
  v13 = a3;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v12);

  if (v15[5] && v21[5])
  {
    v6 = [BPSWindowerInput alloc];
    objc_msgSend((id)v15[5], "aggregate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v21[5];
    objc_msgSend((id)v15[5], "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[BPSWindowerInput initWithAggregate:key:metadata:](v6, "initWithAggregate:key:metadata:", v7, v8, v9);

  }
  else
  {
    v10 = 0;
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __48__BPSWindower_firstCompletedWindowShouldRemove___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  __int128 v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v7 = a2;
  v8 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__BPSWindower_firstCompletedWindowShouldRemove___block_invoke_2;
  v11[3] = &unk_1E554D318;
  v11[4] = *(_QWORD *)(a1 + 32);
  v13 = *(_OWORD *)(a1 + 40);
  v9 = v7;
  v12 = v9;
  v14 = &v15;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);
  v10 = (void *)v16[5];
  if (v10)
  {
    if (*(_BYTE *)(a1 + 56))
      objc_msgSend(v8, "removeObjectAtIndex:", objc_msgSend(v10, "unsignedIntegerValue"));
    *a4 = 1;
  }

  _Block_object_dispose(&v15, 8);
}

void __48__BPSWindower_firstCompletedWindowShouldRemove___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  if ((objc_msgSend(v13, "completed") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "upstream"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "completed"),
        v8,
        v9))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    *a4 = 1;
  }

}

- (id)nextEvent
{
  void *v3;
  id v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;

  -[BPSWindower firstCompletedWindow](self, "firstCompletedWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
LABEL_2:
    v4 = v3;
    goto LABEL_3;
  }
  -[BPSWindower upstream](self, "upstream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nextEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_7:
    -[BPSWindower upstream](self, "upstream");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "completed");

    if (!v12
      || (-[BPSWindower firstCompletedWindow](self, "firstCompletedWindow"),
          (v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v4 = 0;
      goto LABEL_3;
    }
    goto LABEL_2;
  }
  while (1)
  {
    -[BPSWindower updateWindowsWithEvent:](self, "updateWindowsWithEvent:", v7);
    -[BPSWindower firstCompletedWindow](self, "firstCompletedWindow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      break;
    -[BPSWindower upstream](self, "upstream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "nextEvent");
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
    if (!v10)
      goto LABEL_7;
  }
  v4 = v8;

LABEL_3:
  return v4;
}

- (BOOL)completed
{
  void *v3;
  BOOL result;
  objc_super v5;

  -[BPSWindower firstCompletedWindowShouldRemove:](self, "firstCompletedWindowShouldRemove:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  result = 0;
  if (!v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)BPSWindower;
    return -[BPSPublisher completed](&v5, sel_completed);
  }
  return result;
}

- (void)reset
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_opt_new();
  -[BPSWindower setWindows:](self, "setWindows:", v3);

  v4.receiver = self;
  v4.super_class = (Class)BPSWindower;
  -[BPSPublisher reset](&v4, sel_reset);
}

- (id)validateBookmark:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    v6 = objc_opt_class();
    v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@ expected bookmark of class %@, but received %@"), v6, objc_opt_class(), v3);
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB2D50];
    v12[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("BiomePubSubError"), 2, v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (id)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BPSWindowAssigner)assigner
{
  return self->_assigner;
}

- (NSMutableDictionary)windows
{
  return self->_windows;
}

- (void)setWindows:(id)a3
{
  objc_storeStrong((id *)&self->_windows, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windows, 0);
  objc_storeStrong((id *)&self->_assigner, 0);
  objc_storeStrong(&self->_key, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v6;
  id v7;
  BPSWindower *v8;
  void *v9;
  void *v10;
  void *v11;
  BPSWindower *v12;

  v6 = a3;
  v7 = a4;
  v8 = [BPSWindower alloc];
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "key");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assigner");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[BPSWindower initWithUpstream:key:assigner:](v8, "initWithUpstream:key:assigner:", v9, v10, v11);

  return v12;
}

- (NSArray)bookmarkableUpstreams
{
  void *v3;
  NSObject *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[BPSWindower upstream](self, "upstream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[BPSWindower upstream](self, "upstream");
    v4 = objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __biome_log_for_category();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[BPSWindower(BMBookmarkOperators) bookmarkableUpstreams].cold.1(v4);
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v5;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 1;
}

- (BOOL)canStorePassThroughValueInBookmark
{
  return 0;
}

@end
