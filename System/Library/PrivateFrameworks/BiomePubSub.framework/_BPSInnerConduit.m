@implementation _BPSInnerConduit

- (_BPSInnerConduit)initWithParent:(id)a3 downstream:(id)a4
{
  id v7;
  id v8;
  _BPSInnerConduit *v9;
  _BPSInnerConduit *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_BPSInnerConduit;
  v9 = -[_BPSInnerConduit init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parent, a3);
    objc_storeStrong((id *)&v10->_downstream, a4);
    v10->_released = 0;
    v10->_demand = 0;
    v10->_identity = -1;
    v10->_lock._os_unfair_lock_opaque = 0;
    v10->_downstreamLock = 0;
  }

  return v10;
}

- (void)offerInput:(id)a3
{
  _BPSInnerConduit *v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v4 = self;
  p_lock = &v4->_lock;
  os_unfair_lock_lock(&v4->_lock);
  if (-[_BPSInnerConduit demand](v4, "demand") < 1 || -[_BPSInnerConduit released](v4, "released"))
    goto LABEL_5;
  -[_BPSInnerConduit setDemand:](v4, "setDemand:", -[_BPSInnerConduit demand](v4, "demand") - 1);
  os_unfair_lock_unlock(p_lock);
  os_unfair_recursive_lock_lock_with_options();
  -[_BPSInnerConduit downstream](v4, "downstream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "receiveInput:", v8);

  os_unfair_recursive_lock_unlock();
  if (v7 >= 1)
  {
    os_unfair_lock_lock(p_lock);
    -[_BPSInnerConduit setDemand:](v4, "setDemand:", -[_BPSInnerConduit demand](v4, "demand") + v7);
LABEL_5:
    os_unfair_lock_unlock(p_lock);
  }

}

- (void)finishWithCompletion:(id)a3
{
  _BPSInnerConduit *v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  p_lock = &v4->_lock;
  os_unfair_lock_lock(&v4->_lock);
  if (-[_BPSInnerConduit released](v4, "released"))
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    -[_BPSInnerConduit setReleased:](v4, "setReleased:", 1);
    -[_BPSInnerConduit downstream](v4, "downstream");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BPSInnerConduit setDownstream:](v4, "setDownstream:", 0);
    os_unfair_lock_unlock(p_lock);
    objc_msgSend(v6, "receiveCompletion:", v7);

  }
}

- (void)requestDemand:(int64_t)a3
{
  _BPSInnerConduit *v5;
  os_unfair_lock_s *p_lock;
  void *v7;
  void *v8;
  _BPSInnerConduit *v9;

  v5 = self;
  v9 = v5;
  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("BPSPassThroughSubject.m"), 113, CFSTR("Demand should be greater than 0"));

    v5 = v9;
  }
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  if (-[_BPSInnerConduit released](v9, "released"))
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    -[_BPSInnerConduit setDemand:](v9, "setDemand:", -[_BPSInnerConduit demand](v9, "demand") + a3);
    os_unfair_lock_unlock(p_lock);
    -[_BPSInnerConduit parent](v9, "parent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "acknowledgeDownstreamDemand");

  }
}

- (void)cancel
{
  os_unfair_lock_s *p_lock;
  void *v3;
  _BPSInnerConduit *v4;

  v4 = self;
  p_lock = &v4->_lock;
  os_unfair_lock_lock(&v4->_lock);
  if (-[_BPSInnerConduit released](v4, "released"))
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    -[_BPSInnerConduit setReleased:](v4, "setReleased:", 1);
    os_unfair_lock_unlock(p_lock);
    -[_BPSInnerConduit parent](v4, "parent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "disassociate:", -[_BPSInnerConduit identity](v4, "identity"));

    -[_BPSInnerConduit setParent:](v4, "setParent:", 0);
    -[_BPSInnerConduit setDownstream:](v4, "setDownstream:", 0);
  }

}

- (id)upstreamSubscriptions
{
  void *v2;
  void *v3;

  -[_BPSInnerConduit parent](self, "parent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "upstreamSubscriptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BPSPassThroughSubject)parent
{
  return self->_parent;
}

- (void)setParent:(id)a3
{
  objc_storeStrong((id *)&self->_parent, a3);
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
  objc_storeStrong((id *)&self->_downstream, a3);
}

- (BOOL)released
{
  return self->_released;
}

- (void)setReleased:(BOOL)a3
{
  self->_released = a3;
}

- (int64_t)demand
{
  return self->_demand;
}

- (void)setDemand:(int64_t)a3
{
  self->_demand = a3;
}

- (int64_t)identity
{
  return self->_identity;
}

- (void)setIdentity:(int64_t)a3
{
  self->_identity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downstream, 0);
  objc_storeStrong((id *)&self->_parent, 0);
}

@end
