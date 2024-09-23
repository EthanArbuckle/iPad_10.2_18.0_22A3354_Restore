@implementation BPSCollect

- (BPSCollect)initWithUpstream:(id)a3
{
  id v5;
  BPSCollect *v6;
  BPSCollect *v7;
  uint64_t v8;
  NSMutableArray *results;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BPSCollect;
  v6 = -[BPSCollect init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_upstream, a3);
    v8 = objc_opt_new();
    results = v7->_results;
    v7->_results = (NSMutableArray *)v8;

  }
  return v7;
}

- (void)subscribe:(id)a3
{
  id v4;
  _BPSCollectInner *v5;
  void *v6;
  _BPSCollectInner *v7;

  v4 = a3;
  v5 = [_BPSCollectInner alloc];
  v7 = -[BPSReduceProducer initWithDownstream:initial:reduce:](v5, "initWithDownstream:initial:reduce:", v4, MEMORY[0x1E0C9AA60], &__block_literal_global_8);

  -[BPSCollect upstream](self, "upstream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subscribe:", v7);

}

uint64_t __24__BPSCollect_subscribe___block_invoke()
{
  return 0;
}

- (id)upstreamPublishers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BPSCollect upstream](self, "upstream");
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
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;

  -[BPSCollect upstream](self, "upstream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    do
    {
      -[BPSCollect results](self, "results");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v4);

      -[BPSCollect upstream](self, "upstream");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "nextEvent");
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
    }
    while (v7);
  }
  -[BPSCollect upstream](self, "upstream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "completed"))
  {

    goto LABEL_7;
  }
  v9 = -[BPSCollect returned](self, "returned");

  if (v9)
  {
LABEL_7:
    v10 = 0;
    return v10;
  }
  -[BPSCollect setReturned:](self, "setReturned:", 1);
  -[BPSCollect results](self, "results");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  return v10;
}

- (BOOL)completed
{
  void *v3;
  BOOL v4;

  -[BPSCollect upstream](self, "upstream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "completed"))
    v4 = -[BPSCollect returned](self, "returned");
  else
    v4 = 0;

  return v4;
}

- (void)reset
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_opt_new();
  -[BPSCollect setResults:](self, "setResults:", v3);

  -[BPSCollect setReturned:](self, "setReturned:", 0);
  v4.receiver = self;
  v4.super_class = (Class)BPSCollect;
  -[BPSPublisher reset](&v4, sel_reset);
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

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (NSMutableArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
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
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v6;
  id v7;
  BPSCollect *v8;
  void *v9;
  BPSCollect *v10;
  NSObject *v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v8 = [BPSCollect alloc];
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[BPSCollect initWithUpstream:](v8, "initWithUpstream:", v9);

  }
  else
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[BPSCollect(BMBookmarkOperators) publisherWithPublisher:upstreams:bookmarkState:].cold.1(v11);

    v10 = (BPSCollect *)v6;
  }

  return v10;
}

- (id)bookmarkableUpstreams
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BPSCollect upstream](self, "upstream");
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
