@implementation BPSMergeMany

- (id)nextEvent
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  -[BPSMergeMany publishers](self, "publishers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
    while (1)
    {
      -[BPSMergeMany publishers](self, "publishers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", -[BPSMergeMany currentPublisher](self, "currentPublisher"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = -[BPSMergeMany currentPublisher](self, "currentPublisher") + 1;
      -[BPSMergeMany publishers](self, "publishers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[BPSMergeMany setCurrentPublisher:](self, "setCurrentPublisher:", v8 % objc_msgSend(v9, "count"));

      if ((objc_msgSend(v7, "completed") & 1) == 0)
      {
        objc_msgSend(v7, "nextEvent");
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
          break;
      }

      ++v5;
      -[BPSMergeMany publishers](self, "publishers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v5 >= v12)
      {
        v4 = 0;
        return v4;
      }
    }
    v4 = (void *)v10;

  }
  return v4;
}

- (NSArray)publishers
{
  return self->_publishers;
}

- (unint64_t)currentPublisher
{
  return self->_currentPublisher;
}

- (void)setCurrentPublisher:(unint64_t)a3
{
  self->_currentPublisher = a3;
}

- (void)reset
{
  objc_super v3;

  -[BPSMergeMany setCurrentPublisher:](self, "setCurrentPublisher:", 0);
  v3.receiver = self;
  v3.super_class = (Class)BPSMergeMany;
  -[BPSPublisher reset](&v3, sel_reset);
}

- (id)bookmark
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[BPSMergeMany currentPublisher](self, "currentPublisher"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishers, 0);
}

- (BPSMergeMany)initWithPublishers:(id)a3
{
  id v5;
  BPSMergeMany *v6;
  BPSMergeMany *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BPSMergeMany;
  v6 = -[BPSMergeMany init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_publishers, a3);

  return v7;
}

- (void)subscribe:(id)a3
{
  _BPSMerged *v4;
  void *v5;
  _BPSMerged *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  _BPSMergedSide *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  id v15;

  v15 = a3;
  v4 = [_BPSMerged alloc];
  -[BPSMergeMany publishers](self, "publishers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_BPSMerged initWithDownstream:count:](v4, "initWithDownstream:count:", v15, objc_msgSend(v5, "count"));

  objc_msgSend(v15, "receiveSubscription:", v6);
  -[BPSMergeMany publishers](self, "publishers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = 0;
    do
    {
      v10 = -[_BPSMergedSide initWithIndex:merger:]([_BPSMergedSide alloc], "initWithIndex:merger:", v9, v6);
      -[BPSMergeMany publishers](self, "publishers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "subscribe:", v10);
      ++v9;
      -[BPSMergeMany publishers](self, "publishers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

    }
    while (v9 < v14);
  }

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

- (void)applyBookmark:(id)a3
{
  -[BPSMergeMany setCurrentPublisher:](self, "setCurrentPublisher:", objc_msgSend(a3, "unsignedIntegerValue"));
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v5;
  BPSMergeMany *v6;

  v5 = a4;
  v6 = -[BPSMergeMany initWithPublishers:]([BPSMergeMany alloc], "initWithPublishers:", v5);

  return v6;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 1;
}

@end
