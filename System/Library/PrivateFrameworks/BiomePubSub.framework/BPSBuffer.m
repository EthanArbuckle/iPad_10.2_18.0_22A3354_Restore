@implementation BPSBuffer

- (BPSBuffer)initWithUpstream:(id)a3 size:(unint64_t)a4 prefetch:(unint64_t)a5 whenFull:(unint64_t)a6
{
  return -[BPSBuffer initWithUpstream:size:prefetch:whenFull:values:](self, "initWithUpstream:size:prefetch:whenFull:values:", a3, a4, a5, a6, 0);
}

- (BPSBuffer)initWithUpstream:(id)a3 size:(unint64_t)a4 prefetch:(unint64_t)a5 whenFull:(unint64_t)a6 values:(id)a7
{
  id v13;
  id v14;
  BPSBuffer *v15;
  BPSBuffer *v16;
  uint64_t v17;
  NSMutableArray *buffer;
  objc_super v20;

  v13 = a3;
  v14 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BPSBuffer;
  v15 = -[BPSBuffer init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_upstream, a3);
    v16->_size = a4;
    v16->_prefetch = a5;
    v16->_whenFull = a6;
    objc_storeStrong((id *)&v16->_values, a7);
    v17 = objc_opt_new();
    buffer = v16->_buffer;
    v16->_buffer = (NSMutableArray *)v17;

  }
  return v16;
}

- (void)subscribe:(id)a3
{
  id v4;
  BPSBufferInner *v5;

  v4 = a3;
  v5 = -[BPSBufferInner initWithDownstream:size:prefetch:whenFull:]([BPSBufferInner alloc], "initWithDownstream:size:prefetch:whenFull:", v4, self->_size, self->_prefetch, self->_whenFull);

  -[BPSPublisher subscribe:](self->_upstream, "subscribe:", v5);
}

- (id)upstreamPublishers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BPSBuffer upstream](self, "upstream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)nextEvent
{
  unint64_t prefetch;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  prefetch = self->_prefetch;
  if (prefetch == 1)
  {
    -[BPSBuffer upstream](self, "upstream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "nextEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      do
      {
        -[BPSBuffer addToBuffer:](self, "addToBuffer:", v10);
        -[BPSBuffer upstream](self, "upstream");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "nextEvent");
        v12 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v12;
      }
      while (v12);
    }
  }
  else
  {
    if (prefetch)
    {
LABEL_10:
      v16 = 0;
      return v16;
    }
    while (1)
    {
      -[BPSBuffer buffer](self, "buffer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "count");
      v6 = -[BPSBuffer size](self, "size");

      if (v5 >= v6)
        break;
      -[BPSBuffer upstream](self, "upstream");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "nextEvent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        break;
      -[BPSBuffer addToBuffer:](self, "addToBuffer:", v8);

    }
  }
  -[BPSBuffer buffer](self, "buffer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (!v14)
    goto LABEL_10;
  -[BPSBuffer buffer](self, "buffer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndex:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[BPSBuffer buffer](self, "buffer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeObjectAtIndex:", 0);

  return v16;
}

- (void)addToBuffer:(id)a3
{
  unint64_t whenFull;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  whenFull = self->_whenFull;
  if (whenFull != 1)
  {
    if (whenFull)
      goto LABEL_10;
    goto LABEL_8;
  }
  -[BPSBuffer buffer](self, "buffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6 >= -[BPSBuffer size](self, "size"))
  {
    -[BPSBuffer buffer](self, "buffer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (!v8)
      goto LABEL_8;
    -[BPSBuffer buffer](self, "buffer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectAtIndex:", 0);
  }

LABEL_8:
  -[BPSBuffer buffer](self, "buffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  v11 = -[BPSBuffer size](self, "size");

  if (v10 < v11)
  {
    -[BPSBuffer buffer](self, "buffer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

  }
LABEL_10:

}

- (void)reset
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_opt_new();
  -[BPSBuffer setBuffer:](self, "setBuffer:", v3);

  v4.receiver = self;
  v4.super_class = (Class)BPSBuffer;
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

- (id)bookmarkableUpstreams
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_upstream;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  BPSBuffer *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BPSBuffer *v18;
  void *v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("BPSBuffer.m"), 472, CFSTR("bookmark for Buffer should be a buffer object"));

    }
  }
  v12 = v9;
  v13 = [BPSBuffer alloc];
  objc_msgSend(v12, "upstream");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "size");
  v16 = objc_msgSend(v12, "prefetch");
  v17 = objc_msgSend(v12, "whenFull");

  v18 = -[BPSBuffer initWithUpstream:size:prefetch:whenFull:values:](v13, "initWithUpstream:size:prefetch:whenFull:values:", v14, v15, v16, v17, v11);
  return v18;
}

- (BOOL)canStoreInternalStateInBookmark
{
  return 1;
}

- (BPSPublisher)upstream
{
  return self->_upstream;
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)prefetch
{
  return self->_prefetch;
}

- (unint64_t)whenFull
{
  return self->_whenFull;
}

- (NSMutableArray)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
  objc_storeStrong((id *)&self->_values, a3);
}

- (NSMutableArray)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_buffer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

@end
