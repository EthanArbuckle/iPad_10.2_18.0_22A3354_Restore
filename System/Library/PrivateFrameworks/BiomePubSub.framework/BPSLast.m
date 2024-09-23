@implementation BPSLast

- (BPSLast)initWithUpstream:(id)a3
{
  id v5;
  BPSLast *v6;
  BPSLast *v7;
  id lastEvent;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BPSLast;
  v6 = -[BPSLast init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_upstream, a3);
    lastEvent = v7->_lastEvent;
    v7->_lastEvent = 0;

    v7->_returned = 0;
  }

  return v7;
}

- (void)subscribe:(id)a3
{
  id v4;
  void *v5;
  _BPSLastInnser *v6;

  v4 = a3;
  v6 = -[_BPSLastInnser initWithDownstream:]([_BPSLastInnser alloc], "initWithDownstream:", v4);

  -[BPSLast upstream](self, "upstream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscribe:", v6);

}

- (id)upstreamPublishers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BPSLast upstream](self, "upstream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)nextEvent
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;

  -[BPSLast upstream](self, "upstream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    do
    {
      -[BPSLast setLastEvent:](self, "setLastEvent:", v4);
      -[BPSLast upstream](self, "upstream");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "nextEvent");
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
    }
    while (v6);
  }
  -[BPSLast upstream](self, "upstream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "completed"))
  {

    goto LABEL_7;
  }
  v8 = -[BPSLast returned](self, "returned");

  if (v8)
  {
LABEL_7:
    v9 = 0;
    return v9;
  }
  -[BPSLast setReturned:](self, "setReturned:", 1);
  -[BPSLast lastEvent](self, "lastEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  return v9;
}

- (void)reset
{
  objc_super v3;

  -[BPSLast setLastEvent:](self, "setLastEvent:", 0);
  -[BPSLast setReturned:](self, "setReturned:", 0);
  v3.receiver = self;
  v3.super_class = (Class)BPSLast;
  -[BPSPublisher reset](&v3, sel_reset);
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (id)lastEvent
{
  return self->_lastEvent;
}

- (void)setLastEvent:(id)a3
{
  objc_storeStrong(&self->_lastEvent, a3);
}

- (BOOL)returned
{
  return self->_returned;
}

- (void)setReturned:(BOOL)a3
{
  self->_returned = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lastEvent, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v5;
  BPSLast *v6;
  void *v7;
  BPSLast *v8;

  v5 = a4;
  v6 = [BPSLast alloc];
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[BPSLast initWithUpstream:](v6, "initWithUpstream:", v7);
  return v8;
}

- (id)bookmarkableUpstreams
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BPSLast upstream](self, "upstream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
