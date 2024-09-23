@implementation BPSCorrelateOrderedMerge

- (BPSCorrelateOrderedMerge)initWithA:(id)a3 b:(id)a4 comparator:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  BPSCorrelateOrderedMerge *v13;
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

  v13 = -[BPSCorrelateOrderedMerge initWithPublishers:comparator:](self, "initWithPublishers:comparator:", v12, v9);
  return v13;
}

- (BPSCorrelateOrderedMerge)initWithPublishers:(id)a3 comparator:(id)a4
{
  id v7;
  id v8;
  BPSCorrelateOrderedMerge *v9;
  BPSCorrelateOrderedMerge *v10;
  void *v11;
  id comparator;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BPSCorrelateOrderedMerge;
  v9 = -[BPSCorrelateOrderedMerge init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_publishers, a3);
    v11 = _Block_copy(v8);
    comparator = v10->_comparator;
    v10->_comparator = v11;

  }
  return v10;
}

- (void)subscribe:(id)a3
{
  id v4;
  NSObject *v5;
  _BPSCorrelateOrderedMergeManyInner *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _BPSCorrelateOrderedMergeManyInner *v10;
  void *v11;
  _BPSCorrelateOrderedMergeManyInner *v12;
  _QWORD v13[4];
  _BPSCorrelateOrderedMergeManyInner *v14;

  v4 = a3;
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BPSOrderedMerge subscribe:].cold.1((uint64_t)self, v5);

  v6 = [_BPSCorrelateOrderedMergeManyInner alloc];
  -[BPSCorrelateOrderedMerge publishers](self, "publishers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  -[BPSCorrelateOrderedMerge comparator](self, "comparator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_BPSCorrelateOrderedMergeManyInner initWithDownstream:upstreamCount:comparator:](v6, "initWithDownstream:upstreamCount:comparator:", v4, v8, v9);

  objc_msgSend(v4, "receiveSubscription:", v10);
  -[BPSCorrelateOrderedMerge publishers](self, "publishers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __38__BPSCorrelateOrderedMerge_subscribe___block_invoke;
  v13[3] = &unk_1E554CF50;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v13);

}

void __38__BPSCorrelateOrderedMerge_subscribe___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  _BPSAbstractCorrelateOrderedMergeSide *v6;

  v5 = a2;
  v6 = -[_BPSAbstractCorrelateOrderedMergeSide initWithIndex:combiner:]([_BPSAbstractCorrelateOrderedMergeSide alloc], "initWithIndex:combiner:", a3, *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "subscribe:", v6);

}

- (NSArray)publishers
{
  return self->_publishers;
}

- (id)comparator
{
  return self->_comparator;
}

- (void)setComparator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_comparator, 0);
  objc_storeStrong((id *)&self->_publishers, 0);
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v6;
  id v7;
  BPSCorrelateOrderedMerge *v8;
  void *v9;
  BPSCorrelateOrderedMerge *v10;

  v6 = a3;
  v7 = a4;
  v8 = [BPSCorrelateOrderedMerge alloc];
  objc_msgSend(v6, "comparator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[BPSCorrelateOrderedMerge initWithPublishers:comparator:](v8, "initWithPublishers:comparator:", v7, v9);

  return v10;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 1;
}

@end
