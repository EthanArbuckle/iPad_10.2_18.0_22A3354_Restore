@implementation _BPSSequenceInner

- (_BPSSequenceInner)initWithDownstream:(id)a3 enumerator:(id)a4
{
  id v7;
  id v8;
  _BPSSequenceInner *v9;
  _BPSSequenceInner *v10;
  uint64_t v11;
  id next;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_BPSSequenceInner;
  v9 = -[_BPSSequenceInner init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_downstream, a3);
    objc_storeStrong((id *)&v10->_enumerator, a4);
    v10->_recursion = 0;
    -[NSEnumerator nextObject](v10->_enumerator, "nextObject");
    v11 = objc_claimAutoreleasedReturnValue();
    next = v10->_next;
    v10->_next = (id)v11;

    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (void)requestDemand:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BPSSequenceInner *v12;

  v12 = self;
  p_lock = &v12->_lock;
  os_unfair_lock_lock(&v12->_lock);
  -[_BPSSequenceInner downstream](v12, "downstream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || (-[_BPSSequenceInner setPendingDemand:](v12, "setPendingDemand:", -[_BPSSequenceInner pendingDemand](v12, "pendingDemand") + a3), -[_BPSSequenceInner recursion](v12, "recursion"))|| -[_BPSSequenceInner pendingDemand](v12, "pendingDemand") < 1)
  {
LABEL_7:
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    while (1)
    {
      -[_BPSSequenceInner next](v12, "next");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
        break;
      -[_BPSSequenceInner setPendingDemand:](v12, "setPendingDemand:", -[_BPSSequenceInner pendingDemand](v12, "pendingDemand") - 1);
      -[_BPSSequenceInner enumerator](v12, "enumerator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "nextObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_BPSSequenceInner setNext:](v12, "setNext:", v8);

      -[_BPSSequenceInner setRecursion:](v12, "setRecursion:", 1);
      os_unfair_lock_unlock(p_lock);
      v9 = objc_msgSend(v5, "receiveInput:", v6);
      os_unfair_lock_lock(p_lock);
      -[_BPSSequenceInner setPendingDemand:](v12, "setPendingDemand:", -[_BPSSequenceInner pendingDemand](v12, "pendingDemand") + v9);
      -[_BPSSequenceInner setRecursion:](v12, "setRecursion:", 0);
      -[_BPSSequenceInner next](v12, "next");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        break;

      if (-[_BPSSequenceInner pendingDemand](v12, "pendingDemand") <= 0)
        goto LABEL_7;
    }
    -[_BPSSequenceInner setDownstream:](v12, "setDownstream:", 0);
    os_unfair_lock_unlock(p_lock);
    +[BPSCompletion success](BPSCompletion, "success");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "receiveCompletion:", v11);

  }
}

- (void)cancel
{
  os_unfair_lock_s *p_lock;
  _BPSSequenceInner *v3;

  p_lock = &self->_lock;
  v3 = self;
  os_unfair_lock_lock(p_lock);
  -[_BPSSequenceInner setDownstream:](v3, "setDownstream:", 0);
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

- (NSEnumerator)enumerator
{
  return self->_enumerator;
}

- (void)setEnumerator:(id)a3
{
  objc_storeStrong((id *)&self->_enumerator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumerator, 0);
  objc_storeStrong(&self->_next, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
}

@end
