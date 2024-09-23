@implementation BPSCombineLatest

- (BPSCombineLatest)initWithA:(id)a3 b:(id)a4
{
  id v7;
  id v8;
  BPSCombineLatest *v9;
  BPSCombineLatest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BPSCombineLatest;
  v9 = -[BPSCombineLatest init](&v12, sel_init);
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
  _BPSAbstractCombineLatestSide *v5;
  _BPSAbstractCombineLatestSide *v6;
  void *v7;
  void *v8;
  _BPSCombineLatest2Inner *v9;

  v4 = a3;
  v9 = -[_BPSAbstractCombineLatest initWithDownstream:upstreamCount:]([_BPSCombineLatest2Inner alloc], "initWithDownstream:upstreamCount:", v4, 2);
  v5 = -[_BPSAbstractCombineLatestSide initWithIndex:combiner:]([_BPSAbstractCombineLatestSide alloc], "initWithIndex:combiner:", 0, v9);
  v6 = -[_BPSAbstractCombineLatestSide initWithIndex:combiner:]([_BPSAbstractCombineLatestSide alloc], "initWithIndex:combiner:", 1, v9);
  -[BPSCombineLatest a](self, "a");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subscribe:", v5);

  -[BPSCombineLatest b](self, "b");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subscribe:", v6);

  objc_msgSend(v4, "receiveSubscription:", v9);
}

- (id)upstreamPublishers
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  -[BPSCombineLatest a](self, "a");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  -[BPSCombineLatest b](self, "b");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)nextEvent
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BPSTuple *v9;
  void *v10;
  void *v11;
  BPSTuple *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  uint64_t v16;
  void *v17;
  void *v18;
  BPSTuple *v19;

  v3 = -[BPSCombineLatest nextIsB](self, "nextIsB");
  -[BPSCombineLatest setNextIsB:](self, "setNextIsB:", -[BPSCombineLatest nextIsB](self, "nextIsB") ^ 1);
  if (v3)
    -[BPSCombineLatest b](self, "b");
  else
    -[BPSCombineLatest a](self, "a");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_11;
  if (v3)
    -[BPSCombineLatest setLatestB:](self, "setLatestB:", v5);
  else
    -[BPSCombineLatest setLatestA:](self, "setLatestA:", v5);
  -[BPSCombineLatest latestA](self, "latestA");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v7 = (void *)v6,
        -[BPSCombineLatest latestB](self, "latestB"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    v9 = [BPSTuple alloc];
    -[BPSCombineLatest latestA](self, "latestA");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSCombineLatest latestB](self, "latestB");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[BPSTuple initWithFirst:second:](v9, "initWithFirst:second:", v10, v11);
    v13 = v4;
    v14 = v5;
  }
  else
  {
LABEL_11:
    v15 = -[BPSCombineLatest nextIsB](self, "nextIsB");
    -[BPSCombineLatest setNextIsB:](self, "setNextIsB:", -[BPSCombineLatest nextIsB](self, "nextIsB") ^ 1);
    if (v15)
      -[BPSCombineLatest b](self, "b");
    else
      -[BPSCombineLatest a](self, "a");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "nextEvent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_22;
    if (v15)
      -[BPSCombineLatest setLatestB:](self, "setLatestB:", v14);
    else
      -[BPSCombineLatest setLatestA:](self, "setLatestA:", v14);
    -[BPSCombineLatest latestA](self, "latestA");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16
      || (v17 = (void *)v16,
          -[BPSCombineLatest latestB](self, "latestB"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v18,
          v17,
          !v18))
    {
LABEL_22:
      v12 = 0;
      goto LABEL_23;
    }
    v19 = [BPSTuple alloc];
    -[BPSCombineLatest latestA](self, "latestA");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSCombineLatest latestB](self, "latestB");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[BPSTuple initWithFirst:second:](v19, "initWithFirst:second:", v10, v11);
  }

LABEL_23:
  return v12;
}

- (BOOL)completed
{
  void *v2;
  void *v4;
  char v5;
  BOOL v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;

  -[BPSCombineLatest a](self, "a");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "completed") & 1) == 0)
  {

LABEL_5:
    -[BPSCombineLatest a](self, "a");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "completed"))
    {

    }
    else
    {
      -[BPSCombineLatest b](self, "b");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v2, "completed");

      if (!v8)
        return 0;
    }
    -[BPSCombineLatest a](self, "a");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "completed");
    if (v10
      && (-[BPSCombineLatest latestA](self, "latestA"), (v2 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v6 = 1;
    }
    else
    {
      -[BPSCombineLatest b](self, "b");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "completed"))
      {
        -[BPSCombineLatest latestB](self, "latestB");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v12 == 0;

      }
      else
      {
        v6 = 0;
      }

      if (!v10)
        goto LABEL_18;
    }

LABEL_18:
    return v6;
  }
  -[BPSCombineLatest b](self, "b");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "completed");

  if ((v5 & 1) == 0)
    goto LABEL_5;
  return 1;
}

- (void)reset
{
  objc_super v3;

  -[BPSCombineLatest setLatestA:](self, "setLatestA:", 0);
  -[BPSCombineLatest setLatestB:](self, "setLatestB:", 0);
  -[BPSCombineLatest setNextIsB:](self, "setNextIsB:", 0);
  v3.receiver = self;
  v3.super_class = (Class)BPSCombineLatest;
  -[BPSPublisher reset](&v3, sel_reset);
}

- (BPSPublisher)a
{
  return self->_a;
}

- (BPSPublisher)b
{
  return self->_b;
}

- (id)latestA
{
  return self->_latestA;
}

- (void)setLatestA:(id)a3
{
  objc_storeStrong(&self->_latestA, a3);
}

- (id)latestB
{
  return self->_latestB;
}

- (void)setLatestB:(id)a3
{
  objc_storeStrong(&self->_latestB, a3);
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
  objc_storeStrong(&self->_latestB, 0);
  objc_storeStrong(&self->_latestA, 0);
  objc_storeStrong((id *)&self->_b, 0);
  objc_storeStrong((id *)&self->_a, 0);
}

@end
