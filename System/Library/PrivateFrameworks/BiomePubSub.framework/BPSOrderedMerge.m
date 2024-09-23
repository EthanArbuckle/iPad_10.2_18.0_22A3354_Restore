@implementation BPSOrderedMerge

- (NSArray)publishers
{
  return self->_publishers;
}

- (id)nextEvent
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *mostRecentEvent;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[BPSOrderedMerge upstreamStates](self, "upstreamStates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[BPSOrderedMerge publishers](self, "publishers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));
    -[BPSOrderedMerge setUpstreamStates:](self, "setUpstreamStates:", v7);

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[BPSOrderedMerge publishers](self, "publishers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          v13 = (void *)objc_opt_new();
          objc_msgSend(v13, "attachUpstream:", v12);
          -[BPSOrderedMerge upstreamStates](self, "upstreamStates");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v13);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v9);
    }

  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  -[BPSOrderedMerge publishers](self, "publishers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __28__BPSOrderedMerge_nextEvent__block_invoke;
  v23[3] = &unk_1E554CF78;
  v23[4] = self;
  v23[5] = &v24;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v23);

  if (!-[BMIndirectHeap count](self->_heap, "count"))
    goto LABEL_17;
  if (*((_BYTE *)v25 + 24))
  {
    mostRecentEvent = self->_mostRecentEvent;
    if (!mostRecentEvent)
      goto LABEL_18;
    -[NSMutableArray objectAtIndexedSubscript:](self->_upstreamStates, "objectAtIndexedSubscript:", -[BMIndirectHeap top](self->_heap, "top"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "nextEvent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[BPSOrderedMerge isOrderedSameForEvents:second:](self, "isOrderedSameForEvents:second:", mostRecentEvent, v18);

    if (!v19)
    {
LABEL_17:
      mostRecentEvent = 0;
      goto LABEL_18;
    }
  }
  -[BPSOrderedMerge upstreamStates](self, "upstreamStates");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", -[BMIndirectHeap pop](self->_heap, "pop"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "nextEvent");
  mostRecentEvent = (void *)objc_claimAutoreleasedReturnValue();
  if (mostRecentEvent)
  {
    objc_storeStrong(&self->_mostRecentEvent, mostRecentEvent);
    objc_msgSend(v21, "setLastReturnedEvent:", mostRecentEvent);
    objc_msgSend(v21, "setNextEvent:", 0);
  }

LABEL_18:
  _Block_object_dispose(&v24, 8);
  return mostRecentEvent;
}

void __28__BPSOrderedMerge_nextEvent__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "upstreamStates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "nextEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v8, "upstream");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "completed");

    if ((v11 & 1) != 0)
      goto LABEL_3;
    objc_msgSend(v14, "nextEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v8, "setNextEvent:", v9);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "add:", a3);
    }
    else
    {
      objc_msgSend(v8, "upstream");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "completed");

      if ((v13 & 1) == 0)
      {
        *a4 = 1;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      }
    }
  }

LABEL_3:
}

- (NSMutableArray)upstreamStates
{
  return self->_upstreamStates;
}

- (id)validateBookmark:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    v11 = objc_opt_class();
    v5 = (id)objc_msgSend(v10, "initWithFormat:", CFSTR("%@ expected bookmark of class %@, but received %@"), v11, objc_opt_class(), v4);
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2D50];
    v23[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("BiomePubSubError"), 2, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

    goto LABEL_7;
  }
  v5 = v4;
  v6 = objc_msgSend(v5, "count");
  -[BPSOrderedMerge upstreamPublishers](self, "upstreamPublishers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6 != v8)
  {
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    v15 = objc_opt_class();
    -[BPSOrderedMerge upstreamPublishers](self, "upstreamPublishers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("%@ expected upstreamStates of count %lu, but received %lu"), v15, objc_msgSend(v16, "count"), objc_msgSend(v5, "count"));

    v17 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2D50];
    v21 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("BiomePubSubError"), 2, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (void)reset
{
  id v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[BPSOrderedMerge publishers](self, "publishers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));
  -[BPSOrderedMerge setUpstreamStates:](self, "setUpstreamStates:", v5);

  -[BMIndirectHeap reset](self->_heap, "reset");
  v6.receiver = self;
  v6.super_class = (Class)BPSOrderedMerge;
  -[BPSPublisher reset](&v6, sel_reset);
}

- (void)setUpstreamStates:(id)a3
{
  objc_storeStrong((id *)&self->_upstreamStates, a3);
}

- (void)applyBookmark:(id)a3
{
  id mostRecentEvent;
  void *v5;
  _QWORD v6[5];

  -[BPSOrderedMerge setUpstreamStates:](self, "setUpstreamStates:", a3);
  -[BMIndirectHeap reset](self->_heap, "reset");
  mostRecentEvent = self->_mostRecentEvent;
  self->_mostRecentEvent = 0;

  -[BPSOrderedMerge upstreamStates](self, "upstreamStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__BPSOrderedMerge_applyBookmark___block_invoke;
  v6[3] = &unk_1E554CFA0;
  v6[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

}

- (BPSOrderedMerge)initWithA:(id)a3 b:(id)a4 comparator:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  BPSOrderedMerge *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v15[0] = a3;
  v15[1] = a4;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[BPSOrderedMerge initWithPublishers:comparator:](self, "initWithPublishers:comparator:", v12, v9);
  return v13;
}

- (BPSOrderedMerge)initWithPublishers:(id)a3 comparator:(id)a4
{
  id v7;
  id v8;
  BPSOrderedMerge *v9;
  BPSOrderedMerge *v10;
  void *v11;
  id comparator;
  id mostRecentEvent;
  void *v14;
  uint64_t v15;
  BMIndirectHeap *heap;
  _QWORD aBlock[4];
  id v19;
  id v20;
  id location;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)BPSOrderedMerge;
  v9 = -[BPSOrderedMerge init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_publishers, a3);
    v11 = _Block_copy(v8);
    comparator = v10->_comparator;
    v10->_comparator = v11;

    mostRecentEvent = v10->_mostRecentEvent;
    v10->_mostRecentEvent = 0;

    objc_initWeak(&location, v10);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__BPSOrderedMerge_initWithPublishers_comparator___block_invoke;
    aBlock[3] = &unk_1E554CF28;
    objc_copyWeak(&v20, &location);
    v19 = v8;
    v14 = _Block_copy(aBlock);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01D08]), "initWithHeapSize:isAscending:", objc_msgSend(v7, "count"), v14);
    heap = v10->_heap;
    v10->_heap = (BMIndirectHeap *)v15;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __33__BPSOrderedMerge_applyBookmark___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  uint64_t (**v10)(_QWORD, _QWORD, _QWORD);
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a2;
  objc_msgSend(*(id *)(a1 + 32), "upstreamPublishers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "attachUpstream:", v6);
  objc_msgSend(v17, "nextEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "add:", a3);
  objc_msgSend(v17, "lastReturnedEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = *(_QWORD **)(a1 + 32);
    if (!v9[5])
      goto LABEL_6;
    objc_msgSend(v9, "comparator");
    v10 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
    objc_msgSend(v17, "lastReturnedEvent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = ((uint64_t (**)(_QWORD, uint64_t, void *))v10)[2](v10, v11, v12);

    if (v13 == -1)
    {
LABEL_6:
      objc_msgSend(v17, "lastReturnedEvent");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

    }
  }

}

- (id)comparator
{
  return self->_comparator;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_mostRecentEvent, 0);
  objc_storeStrong((id *)&self->_heap, 0);
  objc_storeStrong((id *)&self->_upstreamStates, 0);
  objc_storeStrong(&self->_comparator, 0);
  objc_storeStrong((id *)&self->_publishers, 0);
}

BOOL __49__BPSOrderedMerge_initWithPublishers_comparator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;

  v6 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "upstreamStates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nextEvent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_loadWeakRetained(v6);
  objc_msgSend(v11, "upstreamStates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "nextEvent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() == -1;
  return v15;
}

- (void)subscribe:(id)a3
{
  id v4;
  NSObject *v5;
  _BPSOrderedMergeManyInner *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _BPSOrderedMergeManyInner *v10;
  void *v11;
  _BPSOrderedMergeManyInner *v12;
  _QWORD v13[4];
  _BPSOrderedMergeManyInner *v14;

  v4 = a3;
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BPSOrderedMerge subscribe:].cold.1((uint64_t)self, v5);

  v6 = [_BPSOrderedMergeManyInner alloc];
  -[BPSOrderedMerge publishers](self, "publishers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  -[BPSOrderedMerge comparator](self, "comparator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_BPSOrderedMergeManyInner initWithDownstream:upstreamCount:comparator:](v6, "initWithDownstream:upstreamCount:comparator:", v4, v8, v9);

  objc_msgSend(v4, "receiveSubscription:", v10);
  -[BPSOrderedMerge publishers](self, "publishers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __29__BPSOrderedMerge_subscribe___block_invoke;
  v13[3] = &unk_1E554CF50;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v13);

}

void __29__BPSOrderedMerge_subscribe___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  _BPSAbstractOrderedMergeSide *v6;

  v5 = a2;
  v6 = -[_BPSAbstractOrderedMergeSide initWithIndex:combiner:]([_BPSAbstractOrderedMergeSide alloc], "initWithIndex:combiner:", a3, *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "subscribe:", v6);

}

- (BOOL)isOrderedSameForEvents:(id)a3 second:(id)a4
{
  id v6;
  id v7;
  uint64_t (**v8)(_QWORD, _QWORD, _QWORD);
  uint64_t v9;

  v6 = a4;
  v7 = a3;
  -[BPSOrderedMerge comparator](self, "comparator");
  v8 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v9 = ((uint64_t (**)(_QWORD, id, id))v8)[2](v8, v7, v6);

  return v9 == 0;
}

- (void)setComparator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BMIndirectHeap)heap
{
  return self->_heap;
}

- (void)setHeap:(id)a3
{
  objc_storeStrong((id *)&self->_heap, a3);
}

- (id)mostRecentEvent
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setMostRecentEvent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v6;
  id v7;
  BPSOrderedMerge *v8;
  void *v9;
  BPSOrderedMerge *v10;

  v6 = a3;
  v7 = a4;
  v8 = [BPSOrderedMerge alloc];
  objc_msgSend(v6, "comparator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[BPSOrderedMerge initWithPublishers:comparator:](v8, "initWithPublishers:comparator:", v7, v9);

  return v10;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 1;
}

- (void)subscribe:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 138412290;
  v5 = (id)objc_opt_class();
  v3 = v5;
  _os_log_debug_impl(&dword_1A956A000, a2, OS_LOG_TYPE_DEBUG, "%@ - subscribe", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_1();
}

@end
