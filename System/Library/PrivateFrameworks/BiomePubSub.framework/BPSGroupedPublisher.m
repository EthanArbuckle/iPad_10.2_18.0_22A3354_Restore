@implementation BPSGroupedPublisher

- (id)aggregateWithInitial:(id)a3 nextPartialResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  -[BPSGroupedPublisher multicast](self, "multicast");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = BPSPipelineSupportsPullBasedPublishers(v8);

  -[BPSGroupedPublisher multicast](self, "multicast");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v10, "toPublisher");
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  v13 = (void *)objc_opt_new();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __71__BPSGroupedPublisher_GroupBy__aggregateWithInitial_nextPartialResult___block_invoke;
  v18[3] = &unk_1E554D288;
  v19 = v6;
  v20 = v7;
  v14 = v7;
  v15 = v6;
  objc_msgSend(v11, "reduceWithInitial:nextPartialResult:", v13, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BPSMulticast)multicast
{
  return self->_multicast;
}

- (BPSGroupedPublisher)initWithUpstream:(id)a3 createSubject:(id)a4
{
  id v6;
  id v7;
  BPSGroupedPublisher *v8;
  BPSMulticast *v9;
  BPSMulticast *multicast;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BPSGroupedPublisher;
  v8 = -[BPSGroupedPublisher init](&v12, sel_init);
  if (v8)
  {
    v9 = -[BPSMulticast initWithUpstream:createSubject:]([BPSMulticast alloc], "initWithUpstream:createSubject:", v6, v7);
    multicast = v8->_multicast;
    v8->_multicast = v9;

  }
  return v8;
}

- (void)connect
{
  -[BPSMulticast connect](self->_multicast, "connect");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multicast, 0);
}

- (void)subscribe:(id)a3
{
  -[BPSMulticast subscribe:](self->_multicast, "subscribe:", a3);
}

- (void)setMulticast:(id)a3
{
  objc_storeStrong((id *)&self->_multicast, a3);
}

- (id)subscribeOnKey:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  -[BPSGroupedPublisher multicast](self, "multicast");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = BPSPipelineSupportsPullBasedPublishers(v5);

  -[BPSGroupedPublisher multicast](self, "multicast");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "toPublisher");
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __47__BPSGroupedPublisher_GroupBy__subscribeOnKey___block_invoke;
  v14[3] = &unk_1E554D260;
  v15 = v4;
  v10 = v4;
  objc_msgSend(v8, "filterWithIsIncluded:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mapWithTransform:", &__block_literal_global_7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __47__BPSGroupedPublisher_GroupBy__subscribeOnKey___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

uint64_t __47__BPSGroupedPublisher_GroupBy__subscribeOnKey___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "second");
}

id __71__BPSGroupedPublisher_GroupBy__aggregateWithInitial_nextPartialResult___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "first");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "first");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, v10);

  }
  v11 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "first");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "second");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v11 + 16))(v11, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "first");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v16);

  return v5;
}

@end
