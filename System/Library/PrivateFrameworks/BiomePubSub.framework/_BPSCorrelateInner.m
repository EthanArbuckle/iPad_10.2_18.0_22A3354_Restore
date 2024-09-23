@implementation _BPSCorrelateInner

- (_BPSCorrelateInner)initWithDownstream:(id)a3 correlateHandler:(id)a4
{
  id v7;
  _BPSCorrelateInner *v8;
  _BPSCorrelateInner *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_BPSCorrelateInner;
  v8 = -[BPSCorrelationProducer initWithDownstream:](&v11, sel_initWithDownstream_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_correlateHandler, a4);

  return v9;
}

- (id)receiveNewValue:(id)a3 source:(int64_t)a4
{
  id v6;
  void *v7;
  BPSPartialCompletion *v8;

  v6 = a3;
  if (a4 == 2)
  {
    -[BPSCorrelateHandler receiveCurrentEvent:](self->_correlateHandler, "receiveCurrentEvent:", v6);
    -[BPSCorrelateHandler correlateWithCurrentEvent:](self->_correlateHandler, "correlateWithCurrentEvent:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4 == 1)
      -[BPSCorrelateHandler receivePriorEvent:](self->_correlateHandler, "receivePriorEvent:", v6);
    v7 = 0;
  }
  v8 = -[BPSPartialCompletion initWithState:value:error:]([BPSPartialCompletion alloc], "initWithState:value:error:", 1, v7, 0);

  return v8;
}

- (id)newBookmark
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  BMBookmarkNode *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  BMBookmarkNode *v17;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[BPSCorrelationProducer upstreamSubscriptions](self, "upstreamSubscriptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(v9, "conformsToProtocol:", &unk_1EEAF3EE8) & 1) != 0)
        {
          v10 = objc_msgSend(v9, "newBookmark");
          if (v10)
            goto LABEL_13;
        }
        else
        {
          __biome_log_for_category();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v9;
            _os_log_error_impl(&dword_1A956A000, v11, OS_LOG_TYPE_ERROR, "Subscription %@ could not create bookmark", buf, 0xCu);
          }

        }
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v10 = objc_claimAutoreleasedReturnValue();
LABEL_13:
        v12 = (void *)v10;
        objc_msgSend(v3, "addObject:", v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v6);
  }

  v13 = [BMBookmarkNode alloc];
  -[BPSCorrelateHandler context](self->_correlateHandler, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[BMBookmarkNode initWithValue:upstreams:name:](v13, "initWithValue:upstreams:name:", v14, v3, v16);

  return v17;
}

- (BPSCorrelateHandler)correlateHandler
{
  return self->_correlateHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correlateHandler, 0);
}

@end
