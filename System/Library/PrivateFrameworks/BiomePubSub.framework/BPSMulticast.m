@implementation BPSMulticast

- (id)upstreamPublishers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BPSMulticast upstream](self, "upstream");
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

- (id)nextEventForMulticastDownstream:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  id v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[BPSMulticast connected](self, "connected"))
  {
    -[BPSMulticast pendingEvents](self, "pendingEvents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[BPSMulticast electedMainDownstream](self, "electedMainDownstream");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = objc_msgSend(v8, "isEqual:", v4);

    v9 = objc_msgSend(v7, "count");
    if ((v6 & 1) != 0)
    {
      if (!v9)
      {
        -[BPSMulticast upstream](self, "upstream");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "nextEvent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v25 = v7;
          v26 = v4;
          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          -[BPSMulticast downstreams](self, "downstreams");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          if (v12)
          {
            v13 = v12;
            v14 = 0;
            v15 = *(_QWORD *)v29;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v29 != v15)
                  objc_enumerationMutation(obj);
                v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
                -[BPSMulticast electedMainDownstream](self, "electedMainDownstream");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v18, "isEqual:", v17);

                if (v19)
                {
                  v20 = v14;
                  v14 = v11;
                }
                else
                {
                  -[BPSMulticast pendingEvents](self, "pendingEvents");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "identifier");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "objectForKeyedSubscript:", v22);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v20, "addObject:", v11);
                  objc_msgSend(v17, "subscriber");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "requestNextEvents");

                }
              }
              v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
            }
            while (v13);
          }
          else
          {
            v14 = 0;
          }

          v7 = v25;
          v4 = v26;
        }
        else
        {
          v14 = 0;
        }

        goto LABEL_24;
      }
    }
    else if (!v9)
    {
      v14 = 0;
      goto LABEL_24;
    }
    objc_msgSend(v7, "objectAtIndex:", 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectAtIndex:", 0);
LABEL_24:

    goto LABEL_25;
  }
  v14 = 0;
LABEL_25:

  return v14;
}

- (BPSMulticastDownstream)electedMainDownstream
{
  return (BPSMulticastDownstream *)objc_loadWeakRetained((id *)&self->_electedMainDownstream);
}

- (BOOL)connected
{
  return self->_connected;
}

- (BOOL)completedForMulticastDownstream:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v10;
  char v11;

  v4 = a3;
  -[BPSMulticast pendingEvents](self, "pendingEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
    return 0;
  -[BPSMulticast upstream](self, "upstream");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "completed");

  return v11;
}

- (NSMutableDictionary)pendingEvents
{
  return self->_pendingEvents;
}

- (void)reset
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v8;

  -[BPSMulticast setResetCount:](self, "setResetCount:", -[BPSMulticast resetCount](self, "resetCount") + 1);
  v3 = -[BPSMulticast resetCount](self, "resetCount");
  -[BPSMulticast downstreams](self, "downstreams");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v3 == v5)
  {
    -[BPSMulticast setResetCount:](self, "setResetCount:", 0);
    -[BPSMulticast setConnected:](self, "setConnected:", 0);
    v6 = (void *)objc_opt_new();
    -[BPSMulticast setPendingEvents:](self, "setPendingEvents:", v6);

    v7 = (void *)objc_opt_new();
    -[BPSMulticast setDownstreams:](self, "setDownstreams:", v7);

    -[BPSMulticast setElectedMainDownstream:](self, "setElectedMainDownstream:", 0);
    -[BPSMulticast setBookmarkCount:](self, "setBookmarkCount:", 0);
    v8.receiver = self;
    v8.super_class = (Class)BPSMulticast;
    -[BPSPublisher reset](&v8, sel_reset);
  }
}

- (void)setResetCount:(unint64_t)a3
{
  self->_resetCount = a3;
}

- (unint64_t)resetCount
{
  return self->_resetCount;
}

- (void)registerMulticastDownstream:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[BPSMulticast downstreams](self, "downstreams");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[BPSMulticast downstreams](self, "downstreams");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v8);

  v11 = (id)objc_opt_new();
  -[BPSMulticast pendingEvents](self, "pendingEvents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v10);
}

- (NSMutableArray)downstreams
{
  return self->_downstreams;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_electedMainDownstream);
  objc_storeStrong((id *)&self->_pendingEvents, 0);
  objc_storeStrong((id *)&self->_downstreams, 0);
  objc_storeStrong(&self->_createSubject, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
  objc_storeStrong((id *)&self->_subject, 0);
}

- (id)toPublisher
{
  BPSMulticastDownstream *v3;

  v3 = -[BPSMulticastDownstream initWithMulticast:]([BPSMulticastDownstream alloc], "initWithMulticast:", self);
  -[BPSMulticast registerMulticastDownstream:](self, "registerMulticastDownstream:", v3);
  return v3;
}

- (id)startWithSubscriber:(id)a3
{
  return 0;
}

- (void)setPendingEvents:(id)a3
{
  objc_storeStrong((id *)&self->_pendingEvents, a3);
}

- (void)setElectedMainDownstream:(id)a3
{
  objc_storeWeak((id *)&self->_electedMainDownstream, a3);
}

- (void)setDownstreams:(id)a3
{
  objc_storeStrong((id *)&self->_downstreams, a3);
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (void)setBookmarkCount:(unint64_t)a3
{
  self->_bookmarkCount = a3;
}

- (void)requestNextEvents
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[BPSMulticast downstreams](self, "downstreams", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        -[BPSMulticast setElectedMainDownstream:](self, "setElectedMainDownstream:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7));
        -[BPSMulticast electedMainDownstream](self, "electedMainDownstream");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "subscriber");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "requestNextEvents");

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (BPSMulticast)initWithUpstream:(id)a3 createSubject:(id)a4
{
  id v7;
  id v8;
  BPSMulticast *v9;
  BPSMulticast *v10;
  uint64_t v11;
  id createSubject;
  uint64_t v13;
  NSMutableArray *downstreams;
  uint64_t v15;
  NSMutableDictionary *pendingEvents;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BPSMulticast;
  v9 = -[BPSMulticast init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_upstream, a3);
    v11 = objc_msgSend(v8, "copy");
    createSubject = v10->_createSubject;
    v10->_createSubject = (id)v11;

    v10->_lock._os_unfair_lock_opaque = 0;
    v10->_connected = 0;
    v10->_bookmarkCount = 0;
    v10->_resetCount = 0;
    v13 = objc_opt_new();
    downstreams = v10->_downstreams;
    v10->_downstreams = (NSMutableArray *)v13;

    v15 = objc_opt_new();
    pendingEvents = v10->_pendingEvents;
    v10->_pendingEvents = (NSMutableDictionary *)v15;

    objc_storeWeak((id *)&v10->_electedMainDownstream, 0);
  }

  return v10;
}

- (void)connect
{
  id v3;

  if (self->_createSubject)
  {
    -[BPSMulticast lazySubject](self, "lazySubject");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[BPSPublisher subscribe:](self->_upstream, "subscribe:", v3);

  }
  else
  {
    -[BPSMulticast _connect](self, "_connect");
  }
}

- (id)bookmark
{
  NSMutableDictionary *pendingEvents;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  -[BPSMulticast setBookmarkCount:](self, "setBookmarkCount:", -[BPSMulticast bookmarkCount](self, "bookmarkCount") + 1);
  pendingEvents = self->_pendingEvents;
  v7[0] = CFSTR("pendingEvents");
  v7[1] = CFSTR("bookmarkCount");
  v8[0] = pendingEvents;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_bookmarkCount);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)bookmarkCount
{
  return self->_bookmarkCount;
}

- (void)_connect
{
  void *v3;
  id v4;

  -[BPSMulticast upstream](self, "upstream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "startWithSubscriber:", self);

  -[BPSMulticast setConnected:](self, "setConnected:", 1);
  -[BPSMulticast requestNextEvents](self, "requestNextEvents");
}

- (id)nextEvent
{
  return 0;
}

- (id)validateBookmark:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pendingEvents"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bookmarkCount"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v7 = 0;
LABEL_11:

          goto LABEL_12;
        }
      }
      v15 = objc_alloc(MEMORY[0x1E0CB3940]);
      v16 = objc_opt_class();
      v14 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("%@ expected bookmarkCount of class %@, but received %@"), v16, objc_opt_class(), v6);
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0CB2D50];
      v21 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("BiomePubSubError"), 2, v18);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = objc_alloc(MEMORY[0x1E0CB3940]);
      v12 = objc_opt_class();
      v6 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("%@ expected pendingEvents of class %@, but received %@"), v12, objc_opt_class(), v5);
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0CB2D50];
      v23 = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("BiomePubSubError"), 2, v14);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_11;
  }
  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  v9 = objc_opt_class();
  v4 = (id)objc_msgSend(v8, "initWithFormat:", CFSTR("%@ expected bookmark of class %@, but received %@"), v9, objc_opt_class(), v3);
  v10 = (void *)MEMORY[0x1E0CB35C8];
  v24 = *MEMORY[0x1E0CB2D50];
  v25[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("BiomePubSubError"), 2, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v7;
}

- (void)applyBookmark:(id)a3
{
  id v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("pendingEvents"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BPSMulticast setPendingEvents:](self, "setPendingEvents:", v4);

}

- (void)applyBookmarkNode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v15 = a3;
  -[BMBookmarkablePublisher validateBookmarkNode:](self, "validateBookmarkNode:", v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v15;
  if (!v4)
  {
    objc_msgSend(v15, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bookmarkCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");

    -[BPSMulticast downstreams](self, "downstreams");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v8 == v10)
    {
      objc_msgSend(v15, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[BPSMulticast applyBookmark:](self, "applyBookmark:", v11);

      v12 = (void *)objc_opt_class();
      -[BPSMulticast upstreamPublishers](self, "upstreamPublishers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bookmarkablePublishersFromPublishers:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __34__BPSMulticast_applyBookmarkNode___block_invoke;
      v16[3] = &unk_1E554CCC0;
      v17 = v15;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v16);

    }
    v5 = v15;
  }

}

void __34__BPSMulticast_applyBookmarkNode___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "upstreams");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applyBookmarkNode:", v6);

}

- (id)lazySubject
{
  os_unfair_lock_s *p_lock;
  BPSSubject *v5;
  BPSSubject *v6;
  void *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = self->_subject;
  if (!v5)
  {
    (*((void (**)(void))self->_createSubject + 2))();
    v5 = (BPSSubject *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BPSMulticast.m"), 481, CFSTR("createSubject block must return nonnil object"));

    }
    objc_storeStrong((id *)&self->_subject, v5);
  }
  os_unfair_lock_unlock(p_lock);
  v6 = v5;

  return v6;
}

- (void)subscribe:(id)a3
{
  id v4;
  void *v5;
  _BPSMulticastInner *v6;

  v4 = a3;
  v6 = -[_BPSMulticastInner initWithDownstream:]([_BPSMulticastInner alloc], "initWithDownstream:", v4);

  -[BPSMulticast lazySubject](self, "lazySubject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscribe:", v6);

}

+ (id)publisherWithPublisher:(id)a3 upstreams:(id)a4 bookmarkState:(id)a5
{
  id v6;
  id v7;
  id v8;
  BPSMulticast *v9;
  void *v10;
  void *v11;
  BPSMulticast *v12;
  NSObject *v13;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  if (objc_msgSend(v7, "count"))
  {
    v9 = [BPSMulticast alloc];
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createSubject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[BPSMulticast initWithUpstream:createSubject:](v9, "initWithUpstream:createSubject:", v10, v11);

  }
  else
  {
    __biome_log_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[BPSMulticast publisherWithPublisher:upstreams:bookmarkState:].cold.1(v13);

    v12 = (BPSMulticast *)v8;
  }

  return v12;
}

- (id)bookmarkableUpstreams
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BPSMulticast upstream](self, "upstream");
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

- (id)createSubject
{
  return self->_createSubject;
}

+ (void)publisherWithPublisher:(os_log_t)log upstreams:bookmarkState:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A956A000, log, OS_LOG_TYPE_ERROR, "Can't create publisher with bookmark", v1, 2u);
}

@end
