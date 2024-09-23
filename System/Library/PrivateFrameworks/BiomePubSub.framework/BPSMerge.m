@implementation BPSMerge

- (BPSMerge)initWithA:(id)a3 b:(id)a4
{
  id v7;
  id v8;
  BPSMerge *v9;
  BPSMerge *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BPSMerge;
  v9 = -[BPSMerge init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_a, a3);
    objc_storeStrong((id *)&v10->_b, a4);
    v10->_nextIsB = 0;
  }

  return v10;
}

- (void)subscribe:(id)a3
{
  id v4;
  void *v5;
  _BPSMergedSide *v6;
  void *v7;
  _BPSMergedSide *v8;
  _BPSMerged *v9;

  v4 = a3;
  v9 = -[_BPSMerged initWithDownstream:count:]([_BPSMerged alloc], "initWithDownstream:count:", v4, 2);
  objc_msgSend(v4, "receiveSubscription:", v9);

  -[BPSMerge a](self, "a");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_BPSMergedSide initWithIndex:merger:]([_BPSMergedSide alloc], "initWithIndex:merger:", 0, v9);
  objc_msgSend(v5, "subscribe:", v6);

  -[BPSMerge b](self, "b");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_BPSMergedSide initWithIndex:merger:]([_BPSMergedSide alloc], "initWithIndex:merger:", 1, v9);
  objc_msgSend(v7, "subscribe:", v8);

}

- (id)upstreamPublishers
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  -[BPSMerge a](self, "a");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  -[BPSMerge b](self, "b");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)nextEvent
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  if (-[BPSMerge nextIsB](self, "nextIsB"))
    -[BPSMerge b](self, "b");
  else
    -[BPSMerge a](self, "a");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSMerge setNextIsB:](self, "setNextIsB:", -[BPSMerge nextIsB](self, "nextIsB") ^ 1);
  objc_msgSend(v3, "nextEvent");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
  }
  else
  {
    if (-[BPSMerge nextIsB](self, "nextIsB"))
      -[BPSMerge b](self, "b");
    else
      -[BPSMerge a](self, "a");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[BPSMerge setNextIsB:](self, "setNextIsB:", -[BPSMerge nextIsB](self, "nextIsB") ^ 1);
    objc_msgSend(v6, "nextEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v6;
  }

  return v5;
}

- (void)reset
{
  objc_super v3;

  -[BPSMerge setNextIsB:](self, "setNextIsB:", 0);
  v3.receiver = self;
  v3.super_class = (Class)BPSMerge;
  -[BPSPublisher reset](&v3, sel_reset);
}

- (id)bookmark
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BPSMerge nextIsB](self, "nextIsB"));
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
  -[BPSMerge setNextIsB:](self, "setNextIsB:", objc_msgSend(a3, "BOOLValue"));
}

- (BPSPublisher)a
{
  return self->_a;
}

- (BPSPublisher)b
{
  return self->_b;
}

- (BOOL)nextIsB
{
  return self->_nextIsB;
}

- (void)setNextIsB:(BOOL)a3
{
  self->_nextIsB = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_b, 0);
  objc_storeStrong((id *)&self->_a, 0);
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v5;
  BPSMerge *v6;
  void *v7;
  void *v8;
  BPSMerge *v9;

  v5 = a4;
  v6 = [BPSMerge alloc];
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[BPSMerge initWithA:b:](v6, "initWithA:b:", v7, v8);
  return v9;
}

- (id)bookmarkableUpstreams
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  -[BPSMerge a](self, "a");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  -[BPSMerge b](self, "b");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 1;
}

@end
