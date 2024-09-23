@implementation BPSReduce

- (id)nextEvent
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;

  -[BPSReduce upstream](self, "upstream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    do
    {
      -[BPSReduce nextPartialResult](self, "nextPartialResult");
      v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[BPSReduce result](self, "result");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *))v5)[2](v5, v6, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[BPSReduce setResult:](self, "setResult:", v7);

      -[BPSReduce upstream](self, "upstream");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "nextEvent");
      v9 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v9;
    }
    while (v9);
  }
  -[BPSReduce upstream](self, "upstream");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "completed"))
  {

    goto LABEL_7;
  }
  v11 = -[BPSReduce returned](self, "returned");

  if (v11)
  {
LABEL_7:
    v12 = 0;
    return v12;
  }
  -[BPSReduce setReturned:](self, "setReturned:", 1);
  -[BPSReduce result](self, "result");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  return v12;
}

- (id)upstreamPublishers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BPSReduce upstream](self, "upstream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (BOOL)returned
{
  return self->_returned;
}

- (id)result
{
  return self->_result;
}

- (void)reset
{
  void *v3;
  objc_super v4;

  -[BPSReduce initialResult](self, "initialResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSReduce setResult:](self, "setResult:", v3);

  -[BPSReduce setReturned:](self, "setReturned:", 0);
  v4.receiver = self;
  v4.super_class = (Class)BPSReduce;
  -[BPSPublisher reset](&v4, sel_reset);
}

- (void)setReturned:(BOOL)a3
{
  self->_returned = a3;
}

- (void)setResult:(id)a3
{
  objc_storeStrong(&self->_result, a3);
}

- (id)initialResult
{
  return self->_initialResult;
}

- (BOOL)completed
{
  void *v3;
  BOOL v4;

  -[BPSReduce upstream](self, "upstream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "completed"))
    v4 = -[BPSReduce returned](self, "returned");
  else
    v4 = 0;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_result, 0);
  objc_storeStrong(&self->_nextPartialResult, 0);
  objc_storeStrong(&self->_initialResult, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

- (BPSReduce)initWithUpstream:(id)a3 initialResult:(id)a4 nextPartialResult:(id)a5
{
  id v9;
  id v10;
  id v11;
  BPSReduce *v12;
  BPSReduce *v13;
  uint64_t v14;
  id nextPartialResult;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BPSReduce;
  v12 = -[BPSReduce init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_upstream, a3);
    objc_storeStrong(&v13->_initialResult, a4);
    objc_storeStrong(&v13->_result, a4);
    v14 = objc_msgSend(v11, "copy");
    nextPartialResult = v13->_nextPartialResult;
    v13->_nextPartialResult = (id)v14;

  }
  return v13;
}

- (void)subscribe:(id)a3
{
  id v4;
  void *v5;
  _BPSReduceInner *v6;

  v4 = a3;
  v6 = -[_BPSReduceInner initWithDownstream:initial:reduce:]([_BPSReduceInner alloc], "initWithDownstream:initial:reduce:", v4, self->_initialResult, self->_nextPartialResult);

  -[BPSReduce upstream](self, "upstream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscribe:", v6);

}

- (id)nextPartialResult
{
  return self->_nextPartialResult;
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v7;
  id v8;
  id v9;
  BPSReduce *v10;
  void *v11;
  void *v12;
  void *v13;
  BPSReduce *v14;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = [BPSReduce alloc];
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v8;
  if (!v8)
  {
    objc_msgSend(v7, "initialResult");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "nextPartialResult");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[BPSReduce initWithUpstream:initialResult:nextPartialResult:](v10, "initWithUpstream:initialResult:nextPartialResult:", v11, v12, v13);

  if (!v8)
  return v14;
}

- (id)bookmarkableUpstreams
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BPSReduce upstream](self, "upstream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 1;
}

@end
