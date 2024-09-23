@implementation BPSPublisher

- (id)sinkWithCompletion:(id)a3 receiveInput:(id)a4
{
  id v6;
  id v7;
  int v8;
  BPSSink *v9;
  BPSSink *v10;
  BPSSink *v11;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = BPSPipelineSupportsPullBasedPublishers(self);
  v9 = [BPSSink alloc];
  v10 = v9;
  if (v8)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __64__BPSPublisher_BPSSubscribers__sinkWithCompletion_receiveInput___block_invoke;
    v13[3] = &unk_1E554CE60;
    v14 = v6;
    v11 = -[BPSSink initWithReceiveBookmarkCompletion:receiveInput:](v10, "initWithReceiveBookmarkCompletion:receiveInput:", v13, v7);

    -[BPSSink subscribeTo:](v11, "subscribeTo:", self);
  }
  else
  {
    v11 = -[BPSSink initWithReceiveCompletion:receiveInput:](v9, "initWithReceiveCompletion:receiveInput:", v6, v7);

    -[BPSPublisher subscribe:](self, "subscribe:", v11);
  }

  return v11;
}

- (id)sinkWithBookmark:(id)a3 completion:(id)a4 receiveInput:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  BPSSink *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  if (BPSPipelineSupportsPullBasedPublishers(self))
  {
    if (!+[BMBookmarkablePublisher isPipelineBookmarkable:](BMBookmarkablePublisher, "isPipelineBookmarkable:", self))
    {
      __biome_log_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[BPSPublisher(BMBookmarkableSink) sinkWithBookmark:completion:receiveInput:].cold.1();

    }
    v12 = -[BPSSink initWithReceiveBookmarkCompletion:receiveInput:]([BPSSink alloc], "initWithReceiveBookmarkCompletion:receiveInput:", v10, v9);

    if (v8 && -[BPSPublisher conformsToProtocol:](self, "conformsToProtocol:", &unk_1EEAF4F80))
      -[BPSPublisher applyBookmarkNode:](self, "applyBookmarkNode:", v8);
    -[BPSSink subscribeTo:](v12, "subscribeTo:", self);
  }
  else
  {
    v12 = -[BPSSink initWithReceiveBookmarkedCompletion:receiveInput:]([BPSSink alloc], "initWithReceiveBookmarkedCompletion:receiveInput:", v10, v9);

    __biome_log_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[BPSPublisher(BMBookmarkableSink) sinkWithBookmark:completion:receiveInput:].cold.3((uint64_t)v8, v13, v14, v15, v16, v17, v18, v19);

    if (-[BPSPublisher conformsToProtocol:](self, "conformsToProtocol:", &unk_1EEAF4F80))
    {
      -[BPSPublisher withBookmark:](self, "withBookmark:", v8);
      v20 = objc_claimAutoreleasedReturnValue();
      -[NSObject subscribe:](v20, "subscribe:", v12);
    }
    else
    {
      __biome_log_for_category();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[BPSPublisher(BMBookmarkableSink) sinkWithBookmark:completion:receiveInput:].cold.2();
    }

  }
  return v12;
}

- (id)drivableSinkWithBookmark:(id)a3 completion:(id)a4 shouldContinue:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  BPSDrivableSink *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  if (BPSPipelineSupportsPullBasedPublishers(self))
  {
    if (!+[BMBookmarkablePublisher isPipelineBookmarkable:](BMBookmarkablePublisher, "isPipelineBookmarkable:", self))
    {
      __biome_log_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[BPSPublisher(BMBookmarkableSink) sinkWithBookmark:completion:receiveInput:].cold.1();

    }
    v12 = -[BPSDrivableSink initWithReceiveBookmarkCompletion:shouldContinue:]([BPSDrivableSink alloc], "initWithReceiveBookmarkCompletion:shouldContinue:", v10, v9);

    if (v8 && -[BPSPublisher conformsToProtocol:](self, "conformsToProtocol:", &unk_1EEAF4F80))
      -[BPSPublisher applyBookmarkNode:](self, "applyBookmarkNode:", v8);
    -[BPSDrivableSink subscribeTo:](v12, "subscribeTo:", self);
  }
  else
  {
    v12 = -[BPSDrivableSink initWithReceiveBookmarkedCompletion:shouldContinue:]([BPSDrivableSink alloc], "initWithReceiveBookmarkedCompletion:shouldContinue:", v10, v9);

    __biome_log_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[BPSPublisher(BMBookmarkableSink) sinkWithBookmark:completion:receiveInput:].cold.3((uint64_t)v8, v13, v14, v15, v16, v17, v18, v19);

    if (-[BPSPublisher conformsToProtocol:](self, "conformsToProtocol:", &unk_1EEAF4F80))
    {
      -[BPSPublisher withBookmark:](self, "withBookmark:", v8);
      v20 = objc_claimAutoreleasedReturnValue();
      -[NSObject subscribe:](v20, "subscribe:", v12);
    }
    else
    {
      __biome_log_for_category();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[BPSPublisher(BMBookmarkableSink) sinkWithBookmark:completion:receiveInput:].cold.2();
    }

  }
  return v12;
}

uint64_t __64__BPSPublisher_BPSSubscribers__sinkWithCompletion_receiveInput___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)startWithSubscriber:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[BPSPublisher upstreamPublishers](self, "upstreamPublishers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "startWithSubscriber:", v4);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)completed
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[BPSPublisher upstreamPublishers](self, "upstreamPublishers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "completed"))
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (void)reset
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[BPSPublisher upstreamPublishers](self, "upstreamPublishers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "reset");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

uint64_t __66__BPSPublisher_BPSSubscribers__sinkWithCompletion_shouldContinue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)sinkWithCompletion:(id)a3 shouldContinue:(id)a4
{
  id v6;
  id v7;
  int v8;
  BPSDrivableSink *v9;
  BPSDrivableSink *v10;
  BPSDrivableSink *v11;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = BPSPipelineSupportsPullBasedPublishers(self);
  v9 = [BPSDrivableSink alloc];
  v10 = v9;
  if (v8)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __66__BPSPublisher_BPSSubscribers__sinkWithCompletion_shouldContinue___block_invoke;
    v13[3] = &unk_1E554CE60;
    v14 = v6;
    v11 = -[BPSDrivableSink initWithReceiveBookmarkCompletion:shouldContinue:](v10, "initWithReceiveBookmarkCompletion:shouldContinue:", v13, v7);

    -[BPSDrivableSink subscribeTo:](v11, "subscribeTo:", self);
  }
  else
  {
    v11 = -[BPSDrivableSink initWithReceiveCompletion:shouldContinue:](v9, "initWithReceiveCompletion:shouldContinue:", v6, v7);

    -[BPSPublisher subscribe:](self, "subscribe:", v11);
  }

  return v11;
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

- (id)bufferWithSize:(unint64_t)a3 prefetch:(unint64_t)a4 whenFull:(unint64_t)a5
{
  return -[BPSBuffer initWithUpstream:size:prefetch:whenFull:]([BPSBuffer alloc], "initWithUpstream:size:prefetch:whenFull:", self, a3, a4, a5);
}

- (id)upstreamPublishers
{
  return (id)MEMORY[0x1E0C9AA60];
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

- (id)connectableSinkWithCompletion:(id)a3 shouldContinue:(id)a4
{
  id v5;
  id v6;
  BPSDrivableSink *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[BPSDrivableSink initWithReceiveCompletion:shouldContinue:]([BPSDrivableSink alloc], "initWithReceiveCompletion:shouldContinue:", v6, v5);

  return v7;
}

- (id)mergeWithOthers:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  BPSMergeMany *v7;
  BPSPublisher *v9;
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

- (id)combineLatestwithOther:(id)a3
{
  id v4;
  BPSCombineLatest *v5;

  v4 = a3;
  v5 = -[BPSCombineLatest initWithA:b:]([BPSCombineLatest alloc], "initWithA:b:", self, v4);

  return v5;
}

- (id)debounceFor:(double)a3 getTimestamp:(id)a4
{
  id v6;
  BPSDebounce *v7;

  v6 = a4;
  v7 = -[BPSDebounce initWithUpstream:for:getTimestamp:]([BPSDebounce alloc], "initWithUpstream:for:getTimestamp:", self, v6, a3);

  return v7;
}

- (id)throttleFor:(double)a3 latest:(BOOL)a4 getTimestamp:(id)a5
{
  _BOOL8 v5;
  id v8;
  BPSThrottle *v9;

  v5 = a4;
  v8 = a5;
  v9 = -[BPSThrottle initWithUpstream:interval:latest:getTimestamp:]([BPSThrottle alloc], "initWithUpstream:interval:latest:getTimestamp:", self, v5, v8, a3);

  return v9;
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

- (id)timerFor:(double)a3 getTimestamp:(id)a4
{
  id v6;
  BPSTimer *v7;

  v6 = a4;
  v7 = -[BPSTimer initWithUpstream:interval:getTimestamp:]([BPSTimer alloc], "initWithUpstream:interval:getTimestamp:", self, v6, a3);

  return v7;
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

- (id)sequenceWithSequence:(id)a3
{
  id v3;
  BPSSequence *v4;

  v3 = a3;
  v4 = -[BPSSequence initWithSequence:]([BPSSequence alloc], "initWithSequence:", v3);

  return v4;
}

- (id)mapWithTransform:(id)a3
{
  id v4;
  BPSMap *v5;

  v4 = a3;
  v5 = -[BPSMap initWithUpstream:transform:]([BPSMap alloc], "initWithUpstream:transform:", self, v4);

  return v5;
}

- (id)last
{
  return -[BPSLast initWithUpstream:]([BPSLast alloc], "initWithUpstream:", self);
}

- (id)filterWithIsIncluded:(id)a3
{
  id v4;
  BPSFilter *v5;

  v4 = a3;
  v5 = -[BPSFilter initWithUpstream:isIncluded:]([BPSFilter alloc], "initWithUpstream:isIncluded:", self, v4);

  return v5;
}

- (id)collect
{
  return -[BPSCollect initWithUpstream:]([BPSCollect alloc], "initWithUpstream:", self);
}

- (id)flatMapWithTransform:(id)a3
{
  id v4;
  BPSFlatMap *v5;

  v4 = a3;
  v5 = -[BPSFlatMap initWithUpstream:maxPublishers:transform:]([BPSFlatMap alloc], "initWithUpstream:maxPublishers:transform:", self, 1, v4);

  return v5;
}

- (id)zipWithOther:(id)a3
{
  id v4;
  BPSZip *v5;

  v4 = a3;
  v5 = -[BPSZip initWithA:b:]([BPSZip alloc], "initWithA:b:", self, v4);

  return v5;
}

- (id)zipWithOthers:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  BPSZipMany *v7;
  BPSPublisher *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = self;
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v4, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[BPSZipMany initWithPublishers:]([BPSZipMany alloc], "initWithPublishers:", v6);
  return v7;
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
  BPSPublisher *v12;
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

- (id)removeDuplicatesWithIsDuplicate:(id)a3
{
  id v4;
  BPSRemoveDuplicates *v5;

  v4 = a3;
  v5 = -[BPSRemoveDuplicates initWithUpstream:isDuplicate:]([BPSRemoveDuplicates alloc], "initWithUpstream:isDuplicate:", self, v4);

  return v5;
}

- (id)windowByKey:(id)a3 assigner:(id)a4
{
  id v6;
  id v7;
  BPSWindower *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[BPSWindower initWithUpstream:key:assigner:]([BPSWindower alloc], "initWithUpstream:key:assigner:", self, v7, v6);

  return v8;
}

- (id)windowWithAssigner:(id)a3
{
  id v4;
  BPSWindower *v5;

  v4 = a3;
  v5 = -[BPSWindower initWithUpstream:key:assigner:]([BPSWindower alloc], "initWithUpstream:key:assigner:", self, &__block_literal_global_5, v4);

  return v5;
}

const __CFString *__49__BPSPublisher_BPSOperators__windowWithAssigner___block_invoke()
{
  return CFSTR("_");
}

- (id)multicast
{
  return -[BPSMulticast initWithUpstream:createSubject:]([BPSMulticast alloc], "initWithUpstream:createSubject:", self, 0);
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
  v8[2] = __47__BPSPublisher_BPSOperators__multicastSubject___block_invoke;
  v8[3] = &unk_1E554CC98;
  v9 = v4;
  v5 = v4;
  -[BPSPublisher multicastCreateSubject:](self, "multicastCreateSubject:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __47__BPSPublisher_BPSOperators__multicastSubject___block_invoke(uint64_t a1)
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

- (id)handleEventsReceiveOutput:(id)a3 receiveCancel:(id)a4
{
  id v6;
  id v7;
  BPSHandleEvents *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[BPSHandleEvents initWithUpstream:receiveOutput:receiveCancel:]([BPSHandleEvents alloc], "initWithUpstream:receiveOutput:receiveCancel:", self, v7, v6);

  return v8;
}

- (id)handleEventsReceiveSubscription:(id)a3 receiveOutput:(id)a4 receiveCompletion:(id)a5 receiveCancel:(id)a6 receiveRequest:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BPSHandleEvents *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[BPSHandleEvents initWithUpstream:receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:]([BPSHandleEvents alloc], "initWithUpstream:receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:", self, v16, v15, v14, v13, v12);

  return v17;
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
  v17[2] = __36__BPSPublisher_GroupBy__groupByKey___block_invoke;
  v17[3] = &unk_1E554D238;
  v6 = v4;
  v18 = v6;
  -[BPSPublisher mapWithTransform:](self, "mapWithTransform:", v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSPublisher multicast](self, "multicast");
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
    v15[2] = __36__BPSPublisher_GroupBy__groupByKey___block_invoke_2;
    v15[3] = &unk_1E554CC98;
    v16 = v11;
    v13 = v11;
    v10 = -[BPSGroupedPublisher initWithUpstream:createSubject:](v12, "initWithUpstream:createSubject:", v7, v15);

  }
  return v10;
}

BPSTuple *__36__BPSPublisher_GroupBy__groupByKey___block_invoke(uint64_t a1, void *a2)
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

id __36__BPSPublisher_GroupBy__groupByKey___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end
