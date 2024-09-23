@implementation BPSCorrelate

BOOL __85__BPSCorrelate_correlatePublisherChainWithPrior_current_comparator_correlateHandler___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "second");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (id)correlatePublisherChainWithPrior:(id)a3 current:(id)a4 comparator:(id)a5 correlateHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  BPSTuple *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  BPSTuple *(*v26)(uint64_t, void *, void *);
  void *v27;
  id v28;
  _QWORD aBlock[4];
  id v30;

  v9 = a5;
  v10 = a6;
  v11 = a4;
  objc_msgSend(a3, "mapWithTransform:", &__block_literal_global);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mapWithTransform:", &__block_literal_global_66);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__BPSCorrelate_correlatePublisherChainWithPrior_current_comparator_correlateHandler___block_invoke_3;
  aBlock[3] = &unk_1E554CBE8;
  v30 = v9;
  v15 = v9;
  v16 = _Block_copy(aBlock);
  objc_msgSend(v12, "orderedMergeWithOther:comparator:", v13, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[BPSTuple initWithFirst:second:]([BPSTuple alloc], "initWithFirst:second:", 0, 0);
  v24 = v14;
  v25 = 3221225472;
  v26 = __85__BPSCorrelate_correlatePublisherChainWithPrior_current_comparator_correlateHandler___block_invoke_4;
  v27 = &unk_1E554CC10;
  v28 = v10;
  v19 = v10;
  objc_msgSend(v17, "scanWithInitial:nextPartialResult:", v18, &v24);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "filterWithIsIncluded:", &__block_literal_global_72, v24, v25, v26, v27);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "mapWithTransform:", &__block_literal_global_74);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

BPSTuple *__85__BPSCorrelate_correlatePublisherChainWithPrior_current_comparator_correlateHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BPSTuple *v10;
  void *v11;
  BPSTuple *v12;

  v5 = a3;
  objc_msgSend(a2, "first");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "updateContext:", v6);
  objc_msgSend(v5, "first");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "second");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqualToString:", CFSTR("prior")))
  {
    objc_msgSend(*(id *)(a1 + 32), "receivePriorEvent:", v7);
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("current")))
    goto LABEL_7;
  objc_msgSend(*(id *)(a1 + 32), "receiveCurrentEvent:", v7);
  objc_msgSend(*(id *)(a1 + 32), "correlateWithCurrentEvent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v10 = [BPSTuple alloc];
  objc_msgSend(*(id *)(a1 + 32), "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[BPSTuple initWithFirst:second:](v10, "initWithFirst:second:", v11, v9);

  return v12;
}

BPSTuple *__85__BPSCorrelate_correlatePublisherChainWithPrior_current_comparator_correlateHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BPSTuple *v3;

  v2 = a2;
  v3 = -[BPSTuple initWithFirst:second:]([BPSTuple alloc], "initWithFirst:second:", v2, CFSTR("prior"));

  return v3;
}

+ (int64_t)correlateSourceForIndex:(int64_t)a3
{
  if (a3)
    return 2 * (a3 == 1);
  else
    return 1;
}

- (BPSCorrelate)initWithPrior:(id)a3 current:(id)a4 comparator:(id)a5 updatedInitialContext:(id)a6 correlateHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  BPSCorrelate *v18;
  BPSCorrelate *v19;
  BPSCorrelateOrderedMerge *v20;
  BPSCorrelateOrderedMerge *merger;
  objc_super v23;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)BPSCorrelate;
  v18 = -[BPSCorrelate init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_prior, a3);
    objc_storeStrong((id *)&v19->_current, a4);
    objc_storeStrong((id *)&v19->_correlateHandler, a7);
    if (v16)
      -[BPSCorrelateHandler updateContext:](v19->_correlateHandler, "updateContext:", v16);
    v20 = -[BPSCorrelateOrderedMerge initWithA:b:comparator:]([BPSCorrelateOrderedMerge alloc], "initWithA:b:comparator:", v19->_prior, v19->_current, v15);
    merger = v19->_merger;
    v19->_merger = v20;

  }
  return v19;
}

- (BPSCorrelate)initWithPrior:(id)a3 current:(id)a4 comparator:(id)a5 correlateHandler:(id)a6
{
  return -[BPSCorrelate initWithPrior:current:comparator:updatedInitialContext:correlateHandler:](self, "initWithPrior:current:comparator:updatedInitialContext:correlateHandler:", a3, a4, a5, 0, a6);
}

- (void)subscribe:(id)a3
{
  id v4;
  _BPSCorrelateInner *v5;

  v4 = a3;
  v5 = -[_BPSCorrelateInner initWithDownstream:correlateHandler:]([_BPSCorrelateInner alloc], "initWithDownstream:correlateHandler:", v4, self->_correlateHandler);

  -[BPSCorrelateOrderedMerge subscribe:](self->_merger, "subscribe:", v5);
}

- (id)bookmarkableUpstreams
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_merger;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v9;
  id v10;
  id *v11;
  void *v12;
  BPSCorrelate *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BPSCorrelate *v19;
  void *v21;
  void *v22;
  id v23;

  v9 = a3;
  v10 = a4;
  v23 = a5;
  if (objc_msgSend(v10, "count") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("BPSCorrelate.m"), 237, CFSTR("BPSCorrelate should have an upstream while we have %lu"), objc_msgSend(v10, "count"));

  }
  v11 = (id *)v9;
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [BPSCorrelate alloc];
  objc_msgSend(v12, "publishers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "publishers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11[1], "comparator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "correlateHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[BPSCorrelate initWithPrior:current:comparator:updatedInitialContext:correlateHandler:](v13, "initWithPrior:current:comparator:updatedInitialContext:correlateHandler:", v14, v16, v17, v23, v18);
  return v19;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 1;
}

BPSTuple *__85__BPSCorrelate_correlatePublisherChainWithPrior_current_comparator_correlateHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  BPSTuple *v3;

  v2 = a2;
  v3 = -[BPSTuple initWithFirst:second:]([BPSTuple alloc], "initWithFirst:second:", v2, CFSTR("current"));

  return v3;
}

uint64_t __85__BPSCorrelate_correlatePublisherChainWithPrior_current_comparator_correlateHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "first");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "first");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (*(uint64_t (**)(uint64_t, void *, void *))(v4 + 16))(v4, v6, v7);
  return v8;
}

uint64_t __85__BPSCorrelate_correlatePublisherChainWithPrior_current_comparator_correlateHandler___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "second");
}

- (BPSPublisher)prior
{
  return self->_prior;
}

- (BPSPublisher)current
{
  return self->_current;
}

- (BPSCorrelateHandler)correlateHandler
{
  return self->_correlateHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correlateHandler, 0);
  objc_storeStrong((id *)&self->_current, 0);
  objc_storeStrong((id *)&self->_prior, 0);
  objc_storeStrong((id *)&self->_merger, 0);
}

@end
