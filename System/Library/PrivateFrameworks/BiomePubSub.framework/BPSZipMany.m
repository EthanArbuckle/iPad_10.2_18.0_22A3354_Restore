@implementation BPSZipMany

- (BPSZipMany)initWithPublishers:(id)a3
{
  id v5;
  BPSZipMany *v6;
  BPSZipMany *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BPSZipMany;
  v6 = -[BPSZipMany init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_publishers, a3);
    v7->_currentPublisher = 0;
    -[BPSZipMany _resetBuffer](v7, "_resetBuffer");
  }

  return v7;
}

- (void)subscribe:(id)a3
{
  void *v4;
  uint64_t v5;
  _BPSZipManyInner *v6;
  uint64_t i;
  void *v8;
  void *v9;
  _BPSAbstractZipSide *v10;
  id v11;

  v11 = a3;
  -[BPSZipMany publishers](self, "publishers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = -[_BPSAbstractZip initWithDownstream:upstreamCount:]([_BPSZipManyInner alloc], "initWithDownstream:upstreamCount:", v11, v5);
  if (v5 >= 1)
  {
    for (i = 0; i != v5; ++i)
    {
      -[BPSZipMany publishers](self, "publishers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[_BPSAbstractZipSide initWithIndex:zip:]([_BPSAbstractZipSide alloc], "initWithIndex:zip:", i, v6);
      objc_msgSend(v9, "subscribe:", v10);

    }
  }

}

- (void)_resetBuffer
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;

  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[BPSZipMany publishers](self, "publishers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));
  -[BPSZipMany setBuffer:](self, "setBuffer:", v5);

  -[BPSZipMany setBufferResultCount:](self, "setBufferResultCount:", 0);
  -[BPSZipMany publishers](self, "publishers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = 0;
    do
    {
      -[BPSZipMany buffer](self, "buffer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v10);

      ++v8;
      -[BPSZipMany publishers](self, "publishers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

    }
    while (v8 < v12);
  }
}

- (id)_tryConstructResultArray
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = -[BPSZipMany bufferResultCount](self, "bufferResultCount");
  -[BPSZipMany publishers](self, "publishers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v3 != v5)
    return 0;
  v6 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[BPSZipMany buffer](self, "buffer", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqual:", v13);

        if ((v14 & 1) != 0)
        {

          v15 = 0;
          goto LABEL_13;
        }
        objc_msgSend(v6, "addObject:", v12);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }

  -[BPSZipMany _resetBuffer](self, "_resetBuffer");
  v15 = v6;
LABEL_13:

  return v15;
}

- (id)nextEvent
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;

  -[BPSZipMany publishers](self, "publishers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "count");

  v4 = 0;
  do
  {
    v5 = -[BPSZipMany currentPublisher](self, "currentPublisher");
    v6 = -[BPSZipMany currentPublisher](self, "currentPublisher") + 1;
    -[BPSZipMany publishers](self, "publishers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSZipMany setCurrentPublisher:](self, "setCurrentPublisher:", v6 % objc_msgSend(v7, "count"));

    -[BPSZipMany publishers](self, "publishers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[BPSZipMany buffer](self, "buffer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (v13)
    {
      objc_msgSend(v9, "nextEvent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        -[BPSZipMany buffer](self, "buffer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:atIndexedSubscript:", v14, v5);

        -[BPSZipMany setBufferResultCount:](self, "setBufferResultCount:", -[BPSZipMany bufferResultCount](self, "bufferResultCount") + 1);
      }

    }
    -[BPSZipMany _tryConstructResultArray](self, "_tryConstructResultArray");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      break;
    ++v4;
    -[BPSZipMany publishers](self, "publishers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

  }
  while (v4 <= v18);
  return v16;
}

- (void)reset
{
  objc_super v3;

  -[BPSZipMany setCurrentPublisher:](self, "setCurrentPublisher:", 0);
  -[BPSZipMany _resetBuffer](self, "_resetBuffer");
  v3.receiver = self;
  v3.super_class = (Class)BPSZipMany;
  -[BPSPublisher reset](&v3, sel_reset);
}

- (BOOL)completed
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[BPSZipMany publishers](self, "publishers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "completed") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
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

- (unint64_t)bufferResultCount
{
  return self->_bufferResultCount;
}

- (void)setBufferResultCount:(unint64_t)a3
{
  self->_bufferResultCount = a3;
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
  objc_storeStrong((id *)&self->_publishers, 0);
}

@end
