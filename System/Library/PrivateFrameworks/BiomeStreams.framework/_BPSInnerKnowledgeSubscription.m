@implementation _BPSInnerKnowledgeSubscription

- (_BPSInnerKnowledgeSubscription)initWithQuery:(id)a3 downstream:(id)a4 store:(id)a5
{
  id v9;
  id v10;
  id v11;
  _BPSInnerKnowledgeSubscription *v12;
  _BPSInnerKnowledgeSubscription *v13;
  id *p_query;
  uint64_t v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_BPSInnerKnowledgeSubscription;
  v12 = -[_BPSInnerKnowledgeSubscription init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_downstream, a4);
    objc_storeStrong((id *)&v13->_knowledgeStore, a5);
    p_query = (id *)&v13->_query;
    objc_storeStrong((id *)&v13->_query, a3);
    if (!-[_DKEventQuery limit](v13->_query, "limit") || objc_msgSend(*p_query, "limit") < 0)
      v15 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v15 = objc_msgSend(*p_query, "limit");
    v13->_remaining = v15;
    v13->_pendingDemand = 0;
    v13->_lock._os_unfair_lock_opaque = 0;
  }

  return v13;
}

- (void)requestDemand:(int64_t)a3
{
  _BPSInnerKnowledgeSubscription *v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v4 = self;
  p_lock = &v4->_lock;
  os_unfair_lock_lock(&v4->_lock);
  -[_BPSInnerKnowledgeSubscription downstream](v4, "downstream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6
    || (-[_BPSInnerKnowledgeSubscription setPendingDemand:](v4, "setPendingDemand:", -[_BPSInnerKnowledgeSubscription pendingDemand](v4, "pendingDemand") + a3), -[_BPSInnerKnowledgeSubscription recursion](v4, "recursion")))
  {
    os_unfair_lock_unlock(p_lock);
    goto LABEL_25;
  }
  if (-[_BPSInnerKnowledgeSubscription remaining](v4, "remaining") < 1)
  {
    v12 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v7 = -[_BPSInnerKnowledgeSubscription pendingDemand](v4, "pendingDemand");
    v8 = -[_BPSInnerKnowledgeSubscription remaining](v4, "remaining");
    if (v7 >= v8)
      v7 = v8;
    -[_BPSInnerKnowledgeSubscription query](v4, "query");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLimit:", v7);

    -[_BPSInnerKnowledgeSubscription knowledgeStore](v4, "knowledgeStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BPSInnerKnowledgeSubscription query](v4, "query");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(v10, "executeQuery:error:", v11, &v24);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v24;

    if (-[_BPSInnerKnowledgeSubscription remaining](v4, "remaining") != 0x7FFFFFFFFFFFFFFFLL)
      -[_BPSInnerKnowledgeSubscription setRemaining:](v4, "setRemaining:", -[_BPSInnerKnowledgeSubscription remaining](v4, "remaining") - objc_msgSend(v12, "count"));
    -[_BPSInnerKnowledgeSubscription query](v4, "query");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setOffset:", objc_msgSend(v14, "offset") + objc_msgSend(v12, "count"));

    if (v13)
    {
      os_unfair_lock_unlock(p_lock);
      -[_BPSInnerKnowledgeSubscription downstream](v4, "downstream");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D02440], "failureWithError:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "receiveCompletion:", v16);

      goto LABEL_24;
    }
  }
  v12 = v12;
  objc_msgSend(v12, "objectEnumerator");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "nextObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BPSInnerKnowledgeSubscription setNext:](v4, "setNext:", v17);

  if (-[_BPSInnerKnowledgeSubscription pendingDemand](v4, "pendingDemand") < 1)
  {
LABEL_19:
    os_unfair_lock_unlock(p_lock);

    goto LABEL_24;
  }
  if (!v12)
  {
    os_unfair_lock_unlock(p_lock);
    goto LABEL_24;
  }
  while (1)
  {
    -[_BPSInnerKnowledgeSubscription next](v4, "next");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {

      -[_BPSInnerKnowledgeSubscription setDownstream:](v4, "setDownstream:", 0);
      os_unfair_lock_unlock(p_lock);
      objc_msgSend(MEMORY[0x1E0D02440], "success");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "receiveCompletion:", v22);
      goto LABEL_23;
    }
    -[_BPSInnerKnowledgeSubscription setPendingDemand:](v4, "setPendingDemand:", -[_BPSInnerKnowledgeSubscription pendingDemand](v4, "pendingDemand") - 1);
    objc_msgSend(v13, "nextObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BPSInnerKnowledgeSubscription setNext:](v4, "setNext:", v19);

    -[_BPSInnerKnowledgeSubscription setRecursion:](v4, "setRecursion:", 1);
    os_unfair_lock_unlock(p_lock);
    v20 = objc_msgSend(v6, "receiveInput:", v18);
    os_unfair_lock_lock(p_lock);
    -[_BPSInnerKnowledgeSubscription setPendingDemand:](v4, "setPendingDemand:", -[_BPSInnerKnowledgeSubscription pendingDemand](v4, "pendingDemand") + v20);
    -[_BPSInnerKnowledgeSubscription setRecursion:](v4, "setRecursion:", 0);
    -[_BPSInnerKnowledgeSubscription next](v4, "next");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
      break;

LABEL_18:
    if (-[_BPSInnerKnowledgeSubscription pendingDemand](v4, "pendingDemand") <= 0)
      goto LABEL_19;
  }
  if (-[_BPSInnerKnowledgeSubscription pendingDemand](v4, "pendingDemand"))
    goto LABEL_18;
  -[_BPSInnerKnowledgeSubscription setDownstream:](v4, "setDownstream:", 0);
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(MEMORY[0x1E0D02440], "success");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "receiveCompletion:", v23);

  v22 = v12;
LABEL_23:

LABEL_24:
LABEL_25:

}

- (void)cancel
{
  os_unfair_lock_s *p_lock;
  _BPSInnerKnowledgeSubscription *v3;

  p_lock = &self->_lock;
  v3 = self;
  os_unfair_lock_lock(p_lock);
  -[_BPSInnerKnowledgeSubscription setDownstream:](v3, "setDownstream:", 0);
  os_unfair_lock_unlock(p_lock);

}

- (id)upstreamSubscriptions
{
  return 0;
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
  objc_storeStrong((id *)&self->_downstream, a3);
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
  objc_storeStrong((id *)&self->_knowledgeStore, a3);
}

- (_DKEventQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (int64_t)pendingDemand
{
  return self->_pendingDemand;
}

- (void)setPendingDemand:(int64_t)a3
{
  self->_pendingDemand = a3;
}

- (BOOL)recursion
{
  return self->_recursion;
}

- (void)setRecursion:(BOOL)a3
{
  self->_recursion = a3;
}

- (id)next
{
  return self->_next;
}

- (void)setNext:(id)a3
{
  objc_storeStrong(&self->_next, a3);
}

- (int64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(int64_t)a3
{
  self->_offset = a3;
}

- (int64_t)remaining
{
  return self->_remaining;
}

- (void)setRemaining:(int64_t)a3
{
  self->_remaining = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_next, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
}

@end
