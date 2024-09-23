@implementation LNCorpus

- (LNCorpus)initWithContents:(id)a3 capacity:(int64_t)a4
{
  id v7;
  LNCorpus *v8;
  LNCorpus *v9;
  unint64_t v10;
  void *terms;
  uint64_t v12;
  NSArray *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  LNCorpus *v19;
  void *v21;
  objc_super v22;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNCorpus.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contents"));

  }
  v22.receiver = self;
  v22.super_class = (Class)LNCorpus;
  v8 = -[LNCorpus init](&v22, sel_init);
  v9 = v8;
  if (v8)
  {
    v10 = a4 & ~(a4 >> 63);
    if (v10 >= 0x3E8)
      v10 = 1000;
    v8->_capacity = v10;
    if (objc_msgSend(v7, "count") <= (unint64_t)a4)
    {
      v14 = objc_msgSend(v7, "copy");
      terms = v9->_terms;
      v9->_terms = (NSArray *)v14;
    }
    else
    {
      objc_msgSend(v7, "subarrayWithRange:", 0, a4);
      terms = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(terms, "copy");
      v13 = v9->_terms;
      v9->_terms = (NSArray *)v12;

    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_USER_INITIATED, 0);
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = dispatch_queue_create("com.apple.link.LNCorpus.internal-queue", v16);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v17;

    v19 = v9;
  }

  return v9;
}

void __46__LNCorpus_changeWithBlock_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id WeakRetained;
  id v8;
  uint64_t v9;
  id v10;

  v10 = (id)objc_msgSend(*(id *)(a1[4] + 16), "copy");
  (*(void (**)(void))(a1[5] + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  if (objc_msgSend(v3, "isEqualToArray:", v10))
    goto LABEL_6;
  v4 = objc_msgSend(v3, "count");
  v5 = a1[4];
  if (v4 > *(_QWORD *)(v5 + 8))
  {
    objc_msgSend(v3, "subarrayWithRange:", 0);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = a1[4];
    v3 = (void *)v6;
  }
  objc_storeStrong((id *)(v5 + 16), v3);
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));

  if (!WeakRetained)
  {
LABEL_6:
    v9 = a1[6];
    if (v9)
      (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, 0);
  }
  else
  {
    v8 = objc_loadWeakRetained((id *)(a1[4] + 24));
    objc_msgSend(v8, "corpusContentsChanged:completionHandler:", a1[4], a1[6]);

  }
}

- (void)changeWithBlock:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__LNCorpus_changeWithBlock_completionHandler___block_invoke;
  block[3] = &unk_1E45DC048;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (LNCorpus)init
{
  return -[LNCorpus initWithContents:](self, "initWithContents:", MEMORY[0x1E0C9AA60]);
}

- (LNCorpus)initWithContents:(id)a3
{
  return -[LNCorpus initWithContents:capacity:](self, "initWithContents:capacity:", a3, 1000);
}

- (void)removeAllWithCompletionHandler:(id)a3
{
  -[LNCorpus changeWithBlock:completionHandler:](self, "changeWithBlock:completionHandler:", &__block_literal_global_1383, a3);
}

- (unint64_t)count
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __17__LNCorpus_count__block_invoke;
  v5[3] = &unk_1E45DCEC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)getTerms
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = (id)MEMORY[0x1E0C9AA60];
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __20__LNCorpus_getTerms__block_invoke;
  v5[3] = &unk_1E45DCEC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (void)removeObserver:(id)a3
{
  LNCorpusObserver **p_observer;
  id v4;
  id WeakRetained;

  p_observer = &self->_observer;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_observer);

  if (WeakRetained == v4)
    objc_storeWeak((id *)p_observer, 0);
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (NSArray)terms
{
  return self->_terms;
}

- (void)setTerms:(id)a3
{
  objc_storeStrong((id *)&self->_terms, a3);
}

- (LNCorpusObserver)observer
{
  return (LNCorpusObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_terms, 0);
}

void __20__LNCorpus_getTerms__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __17__LNCorpus_count__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __43__LNCorpus_removeAllWithCompletionHandler___block_invoke()
{
  return MEMORY[0x1E0C9AA60];
}

@end
