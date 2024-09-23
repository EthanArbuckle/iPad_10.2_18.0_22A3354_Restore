@implementation BPSZip

- (BPSZip)initWithA:(id)a3 b:(id)a4
{
  id v7;
  id v8;
  BPSZip *v9;
  BPSZip *v10;
  uint64_t v11;
  NSMutableArray *eventsA;
  uint64_t v13;
  NSMutableArray *eventsB;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BPSZip;
  v9 = -[BPSZip init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_a, a3);
    objc_storeStrong((id *)&v10->_b, a4);
    v10->_nextIsB = 0;
    v11 = objc_opt_new();
    eventsA = v10->_eventsA;
    v10->_eventsA = (NSMutableArray *)v11;

    v13 = objc_opt_new();
    eventsB = v10->_eventsB;
    v10->_eventsB = (NSMutableArray *)v13;

  }
  return v10;
}

- (void)subscribe:(id)a3
{
  id v4;
  void *v5;
  _BPSAbstractZipSide *v6;
  void *v7;
  _BPSAbstractZipSide *v8;
  _BPSZip2Inner *v9;

  v4 = a3;
  v9 = -[_BPSAbstractZip initWithDownstream:upstreamCount:]([_BPSZip2Inner alloc], "initWithDownstream:upstreamCount:", v4, 2);

  -[BPSZip a](self, "a");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_BPSAbstractZipSide initWithIndex:zip:]([_BPSAbstractZipSide alloc], "initWithIndex:zip:", 0, v9);
  objc_msgSend(v5, "subscribe:", v6);

  -[BPSZip b](self, "b");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_BPSAbstractZipSide initWithIndex:zip:]([_BPSAbstractZipSide alloc], "initWithIndex:zip:", 1, v9);
  objc_msgSend(v7, "subscribe:", v8);

}

- (id)_tryConstructResultTuple
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  BPSTuple *v9;
  void *v10;
  void *v11;

  -[BPSZip eventsA](self, "eventsA");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[BPSZip eventsB](self, "eventsB");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (!v5)
    {
      v9 = 0;
      return v9;
    }
    -[BPSZip eventsA](self, "eventsA");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    -[BPSZip eventsB](self, "eventsB");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[BPSTuple initWithFirst:second:]([BPSTuple alloc], "initWithFirst:second:", v3, v8);
    -[BPSZip eventsA](self, "eventsA");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectAtIndex:", 0);

    -[BPSZip eventsB](self, "eventsB");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectAtIndex:", 0);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)upstreamPublishers
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  -[BPSZip a](self, "a");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  -[BPSZip b](self, "b");
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
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;

  v3 = -[BPSZip nextIsB](self, "nextIsB");
  -[BPSZip setNextIsB:](self, "setNextIsB:", -[BPSZip nextIsB](self, "nextIsB") ^ 1);
  if (v3)
    -[BPSZip b](self, "b");
  else
    -[BPSZip a](self, "a");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (v3)
      -[BPSZip eventsB](self, "eventsB");
    else
      -[BPSZip eventsA](self, "eventsA");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v5);

    -[BPSZip _tryConstructResultTuple](self, "_tryConstructResultTuple");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = v5;
      v10 = v4;
LABEL_19:

      goto LABEL_20;
    }
  }
  v11 = -[BPSZip nextIsB](self, "nextIsB");
  -[BPSZip setNextIsB:](self, "setNextIsB:", -[BPSZip nextIsB](self, "nextIsB") ^ 1);
  if (v11)
    -[BPSZip b](self, "b");
  else
    -[BPSZip a](self, "a");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "nextEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (v11)
      -[BPSZip eventsB](self, "eventsB");
    else
      -[BPSZip eventsA](self, "eventsA");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v9);

    -[BPSZip _tryConstructResultTuple](self, "_tryConstructResultTuple");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  v8 = 0;
LABEL_20:

  return v8;
}

- (void)reset
{
  void *v3;
  void *v4;
  objc_super v5;

  -[BPSZip setNextIsB:](self, "setNextIsB:", 0);
  v3 = (void *)objc_opt_new();
  -[BPSZip setEventsA:](self, "setEventsA:", v3);

  v4 = (void *)objc_opt_new();
  -[BPSZip setEventsB:](self, "setEventsB:", v4);

  v5.receiver = self;
  v5.super_class = (Class)BPSZip;
  -[BPSPublisher reset](&v5, sel_reset);
}

- (BOOL)completed
{
  void *v3;
  char v4;
  void *v6;
  char v7;

  -[BPSZip a](self, "a");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "completed");

  if ((v4 & 1) != 0)
    return 1;
  -[BPSZip b](self, "b");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "completed");

  return v7;
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

- (NSMutableArray)eventsA
{
  return self->_eventsA;
}

- (void)setEventsA:(id)a3
{
  objc_storeStrong((id *)&self->_eventsA, a3);
}

- (NSMutableArray)eventsB
{
  return self->_eventsB;
}

- (void)setEventsB:(id)a3
{
  objc_storeStrong((id *)&self->_eventsB, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventsB, 0);
  objc_storeStrong((id *)&self->_eventsA, 0);
  objc_storeStrong((id *)&self->_b, 0);
  objc_storeStrong((id *)&self->_a, 0);
}

@end
