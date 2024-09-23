@implementation BMBookmarkablePublisher

+ (BOOL)isPipelineBookmarkable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bookmarkablePublishersFromPublishers:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v4, "upstreamPublishers", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      v12 = 1;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v12 &= objc_msgSend(a1, "isPipelineBookmarkable:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }
    else
    {
      LOBYTE(v12) = 1;
    }

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (void)applyBookmarkNode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v9 = a3;
  -[BMBookmarkablePublisher validateBookmarkNode:](self, "validateBookmarkNode:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(v9, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMBookmarkablePublisher applyBookmark:](self, "applyBookmark:", v5);

    v6 = (void *)objc_opt_class();
    -[BPSPublisher upstreamPublishers](self, "upstreamPublishers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bookmarkablePublishersFromPublishers:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __45__BMBookmarkablePublisher_applyBookmarkNode___block_invoke;
    v10[3] = &unk_1E554CCC0;
    v11 = v9;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

  }
}

- (id)validateBookmarkNode:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "isEqualToString:", v7);

    if ((v8 & 1) != 0)
    {
      v9 = (void *)objc_opt_class();
      -[BPSPublisher upstreamPublishers](self, "upstreamPublishers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bookmarkablePublishersFromPublishers:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "upstreams");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");
      v14 = objc_msgSend(v11, "count");

      if (v13 != v14)
      {
        v29 = objc_alloc(MEMORY[0x1E0CB3940]);
        v30 = objc_opt_class();
        objc_msgSend(v4, "upstreams");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v29, "initWithFormat:", CFSTR("%@ expected publisher upstream count %lu, but received %lu"), v30, objc_msgSend(v31, "count"), objc_msgSend(v11, "count"));

        v32 = (void *)MEMORY[0x1E0CB35C8];
        v43 = *MEMORY[0x1E0CB2D50];
        v44 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("BiomePubSubError"), 2, v33);
        v27 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
      objc_msgSend(v4, "value");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[BMBookmarkablePublisher validateBookmark:](self, "validateBookmark:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        v37 = 0;
        v38 = &v37;
        v39 = 0x3032000000;
        v40 = __Block_byref_object_copy__0;
        v41 = __Block_byref_object_dispose__0;
        v42 = 0;
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __48__BMBookmarkablePublisher_validateBookmarkNode___block_invoke;
        v34[3] = &unk_1E554D010;
        v35 = v4;
        v36 = &v37;
        objc_msgSend(v11, "enumerateObjectsUsingBlock:", v34);
        v27 = (id)v38[5];

        _Block_object_dispose(&v37, 8);
        goto LABEL_9;
      }
      v17 = v16;
      v16 = v17;
    }
    else
    {
      v22 = objc_alloc(MEMORY[0x1E0CB3940]);
      v23 = objc_opt_class();
      v24 = objc_opt_class();
      objc_msgSend(v4, "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("%@ expected publisher with name %@, but received %@"), v23, v24, v25);

      v26 = (void *)MEMORY[0x1E0CB35C8];
      v45 = *MEMORY[0x1E0CB2D50];
      v46 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("BiomePubSubError"), 2, v16);
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v18 = objc_alloc(MEMORY[0x1E0CB3940]);
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v11 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("%@ expected publisher with class %@, but received %@"), v19, v20, objc_opt_class());
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v47 = *MEMORY[0x1E0CB2D50];
    v48[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("BiomePubSubError"), 2, v16);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v27 = v17;
LABEL_9:

  return v27;
}

- (id)bookmarkNode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BMBookmarkNode *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  BMBookmarkNode *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = (void *)objc_opt_class();
  -[BPSPublisher upstreamPublishers](self, "upstreamPublishers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bookmarkablePublishersFromPublishers:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v10), "bookmarkNode");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  v12 = [BMBookmarkNode alloc];
  -[BMBookmarkablePublisher bookmark](self, "bookmark");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[BMBookmarkNode initWithValue:upstreams:name:](v12, "initWithValue:upstreams:name:", v13, v3, v15);

  return v16;
}

+ (id)bookmarkablePublishersFromPublishers:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EEAF4F80, (_QWORD)v13))
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

- (id)bookmark
{
  return 0;
}

- (id)validateBookmark:(id)a3
{
  return 0;
}

void __48__BMBookmarkablePublisher_validateBookmarkNode___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id obj;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "upstreams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "validateBookmarkNode:", v10);
  obj = (id)objc_claimAutoreleasedReturnValue();

  v11 = obj;
  if (obj)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
    v11 = obj;
    *a4 = 1;
  }

}

void __45__BMBookmarkablePublisher_applyBookmarkNode___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "upstreams");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applyBookmarkNode:", v6);

}

- (id)correlateWithCurrent:(id)a3 comparator:(id)a4 correlateHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  BPSCorrelate *v11;
  BPSCorrelate *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (BPSPipelineSupportsPullBasedPublishers(self))
  {
    +[BPSCorrelate correlatePublisherChainWithPrior:current:comparator:correlateHandler:](BPSCorrelate, "correlatePublisherChainWithPrior:current:comparator:correlateHandler:", self, v8, v9, v10);
    v11 = (BPSCorrelate *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = -[BPSCorrelate initWithPrior:current:comparator:correlateHandler:]([BPSCorrelate alloc], "initWithPrior:current:comparator:correlateHandler:", self, v8, v9, v10);
  }
  v12 = v11;

  return v12;
}

- (id)filterWithIsIncluded:(id)a3
{
  id v4;
  BPSFilter *v5;

  v4 = a3;
  v5 = -[BPSFilter initWithUpstream:isIncluded:]([BPSFilter alloc], "initWithUpstream:isIncluded:", self, v4);

  return v5;
}

- (id)mapWithTransform:(id)a3
{
  id v4;
  BPSMap *v5;

  v4 = a3;
  v5 = -[BPSMap initWithUpstream:transform:]([BPSMap alloc], "initWithUpstream:transform:", self, v4);

  return v5;
}

- (id)scanWithInitial:(id)a3 nextPartialResult:(id)a4
{
  id v6;
  id v7;
  BPSScan *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[BPSScan initWithUpstream:initialResult:nextPartialResult:]([BPSScan alloc], "initWithUpstream:initialResult:nextPartialResult:", self, v7, v6);

  return v8;
}

- (id)orderedMergeWithOther:(id)a3 comparator:(id)a4
{
  id v6;
  id v7;
  BPSOrderedMerge *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[BPSOrderedMerge initWithA:b:comparator:]([BPSOrderedMerge alloc], "initWithA:b:comparator:", self, v7, v6);

  return v8;
}

- (id)orderedMergeWithOthers:(id)a3 comparator:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  BPSOrderedMerge *v10;
  BMBookmarkablePublisher *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = self;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "arrayWithObjects:count:", &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v7, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[BPSOrderedMerge initWithPublishers:comparator:]([BPSOrderedMerge alloc], "initWithPublishers:comparator:", v9, v6);
  return v10;
}

- (id)reduce:(id)a3
{
  id v4;
  BPSReduce *v5;
  void *v6;
  void *v7;
  BPSReduce *v8;

  v4 = a3;
  v5 = [BPSReduce alloc];
  objc_msgSend(v4, "accumulator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "closure");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[BPSReduce initWithUpstream:initialResult:nextPartialResult:](v5, "initWithUpstream:initialResult:nextPartialResult:", self, v6, v7);
  return v8;
}

- (id)reduceWithInitial:(id)a3 nextPartialResult:(id)a4
{
  id v6;
  id v7;
  BPSReduce *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[BPSReduce initWithUpstream:initialResult:nextPartialResult:]([BPSReduce alloc], "initWithUpstream:initialResult:nextPartialResult:", self, v7, v6);

  return v8;
}

- (id)flatMapWithTransform:(id)a3
{
  id v4;
  BPSFlatMap *v5;

  v4 = a3;
  v5 = -[BPSFlatMap initWithUpstream:maxPublishers:transform:]([BPSFlatMap alloc], "initWithUpstream:maxPublishers:transform:", self, 1, v4);

  return v5;
}

- (id)groupByKey:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  BPSGroupedPublisher *v10;
  void *v11;
  BPSGroupedPublisher *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __47__BMBookmarkablePublisher_GroupBy__groupByKey___block_invoke;
  v17[3] = &unk_1E554D238;
  v6 = v4;
  v18 = v6;
  -[BMBookmarkablePublisher mapWithTransform:](self, "mapWithTransform:", v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMBookmarkablePublisher multicast](self, "multicast");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = BPSPipelineSupportsPullBasedPublishers(v8);

  if (v9)
  {
    v10 = -[BPSGroupedPublisher initWithUpstream:createSubject:]([BPSGroupedPublisher alloc], "initWithUpstream:createSubject:", v7, 0);
  }
  else
  {
    v11 = (void *)objc_opt_new();
    v12 = [BPSGroupedPublisher alloc];
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __47__BMBookmarkablePublisher_GroupBy__groupByKey___block_invoke_2;
    v15[3] = &unk_1E554CC98;
    v16 = v11;
    v13 = v11;
    v10 = -[BPSGroupedPublisher initWithUpstream:createSubject:](v12, "initWithUpstream:createSubject:", v7, v15);

  }
  return v10;
}

- (id)multicast
{
  return -[BPSMulticast initWithUpstream:createSubject:]([BPSMulticast alloc], "initWithUpstream:createSubject:", self, 0);
}

- (id)mergeWithOthers:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  BPSMergeMany *v7;
  BMBookmarkablePublisher *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = self;
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v4, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[BPSMergeMany initWithPublishers:]([BPSMergeMany alloc], "initWithPublishers:", v6);
  return v7;
}

- (id)mergeWithOther:(id)a3
{
  id v4;
  BPSMerge *v5;

  v4 = a3;
  v5 = -[BPSMerge initWithA:b:]([BPSMerge alloc], "initWithA:b:", self, v4);

  return v5;
}

- (id)last
{
  return -[BPSLast initWithUpstream:]([BPSLast alloc], "initWithUpstream:", self);
}

- (id)collect
{
  return -[BPSCollect initWithUpstream:]([BPSCollect alloc], "initWithUpstream:", self);
}

- (id)multicastSubject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__BMBookmarkablePublisher_BPSOperators__multicastSubject___block_invoke;
  v8[3] = &unk_1E554CC98;
  v9 = v4;
  v5 = v4;
  -[BMBookmarkablePublisher multicastCreateSubject:](self, "multicastCreateSubject:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __58__BMBookmarkablePublisher_BPSOperators__multicastSubject___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)multicastCreateSubject:(id)a3
{
  id v4;
  BPSMulticast *v5;

  v4 = a3;
  v5 = -[BPSMulticast initWithUpstream:createSubject:]([BPSMulticast alloc], "initWithUpstream:createSubject:", self, v4);

  return v5;
}

- (id)bufferWithSize:(unint64_t)a3 prefetch:(unint64_t)a4 whenFull:(unint64_t)a5
{
  return -[BPSBuffer initWithUpstream:size:prefetch:whenFull:]([BPSBuffer alloc], "initWithUpstream:size:prefetch:whenFull:", self, a3, a4, a5);
}

- (void)subscribe:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Override method %@ in subclass %@"), v5, objc_opt_class());

}

- (BOOL)canStoreInternalStateInBookmark
{
  return 0;
}

- (BOOL)canStorePassThroughValueInBookmark
{
  return 0;
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v7 = a3;
  if (objc_msgSend(a4, "count"))
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", v9, CFSTR("Override method %@ in subclass %@"), v10, objc_opt_class());

  }
  return v7;
}

- (id)withBookmark:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  int v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  BMBookmarkWrapper *v31;
  void *v32;
  BMBookmarkWrapper *v33;
  _BYTE *v35;
  void *v36;
  char v37;
  char v38[15];
  char v39;
  _BYTE v40[7];
  char v41;
  char v42[15];
  uint8_t buf[4];
  id v44;
  __int16 v45;
  BMBookmarkablePublisher *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BMBookmarkablePublisher withBookmark:].cold.4((uint64_t)v4, v6);

    v5 = 0;
  }
  else
  {
    v5 = v4;
  }
  v36 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  -[BMBookmarkablePublisher bookmarkableUpstreams](self, "bookmarkableUpstreams");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = 0;
    v35 = v40;
    while (1)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null", v35);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = -[BMBookmarkablePublisher canStoreInternalStateInBookmark](self, "canStoreInternalStateInBookmark");
      if (!v5 || !v10)
        break;
      objc_msgSend(v5, "upstreams");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        __biome_log_for_category();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[BMBookmarkablePublisher withBookmark:].cold.2(&v41, v42);
        goto LABEL_21;
      }
      objc_msgSend(v5, "upstreams");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v13 <= v8)
      {
        __biome_log_for_category();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          -[BMBookmarkablePublisher withBookmark:].cold.3(&v39, v35);

        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
      objc_msgSend(v5, "upstreams");
      v14 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", v8);
      v15 = objc_claimAutoreleasedReturnValue();

      v9 = v15;
LABEL_21:

      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[NSObject isEqual:](v9, "isEqual:", v18);

      if (v19)
      {
        __biome_log_for_category();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v44 = v4;
          v45 = 2112;
          v46 = self;
          _os_log_debug_impl(&dword_1A956A000, v20, OS_LOG_TYPE_DEBUG, "Null bookmark:\n%@ for publisher:%@", buf, 0x16u);
        }

      }
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSObject isEqual:](v9, "isEqual:", v21))
        v22 = 0;
      else
        v22 = v9;
      v23 = v22;

      objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "conformsToProtocol:", &unk_1EEAF4F80);

      if (v25)
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
        v26 = objc_claimAutoreleasedReturnValue();
        -[NSObject withBookmark:](v26, "withBookmark:", v23);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addObject:", v27);

      }
      else
      {
        __biome_log_for_category();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[BMBookmarkablePublisher withBookmark:].cold.1(&v37, v38);
      }

      if (++v8 >= objc_msgSend(v7, "count"))
        goto LABEL_33;
    }
    v16 = v5;
LABEL_20:
    v14 = v9;
    v9 = v16;
    goto LABEL_21;
  }
LABEL_33:
  v28 = (void *)objc_opt_class();
  objc_msgSend(v5, "value");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "publisherWithPublisher:upstreams:bookmarkState:", self, v36, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[BMBookmarkablePublisher canStorePassThroughValueInBookmark](self, "canStorePassThroughValueInBookmark"))
  {
    v31 = [BMBookmarkWrapper alloc];
    objc_msgSend(v5, "value");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[BMBookmarkWrapper initWithUpstream:initialState:](v31, "initWithUpstream:initialState:", v30, v32);

  }
  else
  {
    v33 = v30;
  }

  return v33;
}

- (NSArray)bookmarkableUpstreams
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("Override method %@ in subclass %@"), v4, objc_opt_class());

  return 0;
}

BPSTuple *__47__BMBookmarkablePublisher_GroupBy__groupByKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void (*v3)(uint64_t, id);
  id v4;
  void *v5;
  BPSTuple *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void (**)(uint64_t, id))(v2 + 16);
  v4 = a2;
  v3(v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BPSTuple initWithFirst:second:]([BPSTuple alloc], "initWithFirst:second:", v5, v4);

  return v6;
}

id __47__BMBookmarkablePublisher_GroupBy__groupByKey___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)withBookmark:(_BYTE *)a1 .cold.1(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_0_5(&dword_1A956A000, v2, (uint64_t)v2, "Current upstream publisher doesn't support bookmark", v3);
}

- (void)withBookmark:(_BYTE *)a1 .cold.2(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_0_5(&dword_1A956A000, v2, (uint64_t)v2, "Upstream bookmarks shouldn't be nil", v3);
}

- (void)withBookmark:(_BYTE *)a1 .cold.3(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_1_2(&dword_1A956A000, v2, (uint64_t)v2, "The amount of upstream bookmark nodes is less than upstream subscriptions", v3);
}

- (void)withBookmark:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A956A000, a2, OS_LOG_TYPE_ERROR, "Bookmark should be BMBookmarkNode, instead got %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

@end
