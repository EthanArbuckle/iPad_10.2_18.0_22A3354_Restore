@implementation _BPSInnerFutureConduit

- (_BPSInnerFutureConduit)initWithParent:(id)a3 downstream:(id)a4
{
  id v7;
  id v8;
  _BPSInnerFutureConduit *v9;
  _BPSInnerFutureConduit *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_BPSInnerFutureConduit;
  v9 = -[_BPSInnerFutureConduit init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parent, a3);
    objc_storeStrong((id *)&v10->_downstream, a4);
    v10->_hasAnyDemand = 0;
    v10->_released = 0;
    v10->_lock._os_unfair_lock_opaque = 0;
    v10->_downstreamLock = 0;
  }

  return v10;
}

- (void)requestDemand:(int64_t)a3
{
  _BPSInnerFutureConduit *v5;
  os_unfair_lock_s *p_lock;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BPSInnerFutureConduit *v15;

  v5 = self;
  v15 = v5;
  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("BPSFuture.m"), 181, CFSTR("Demand should be greater than 0"));

    v5 = v15;
  }
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  if (!-[_BPSInnerFutureConduit released](v15, "released"))
  {
    -[_BPSInnerFutureConduit setHasAnyDemand:](v15, "setHasAnyDemand:", 1);
    -[_BPSInnerFutureConduit parent](v15, "parent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "result");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      os_unfair_lock_unlock(p_lock);
LABEL_13:

      goto LABEL_14;
    }
    -[_BPSInnerFutureConduit downstream](v15, "downstream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BPSInnerFutureConduit setReleased:](v15, "setReleased:", 1);
    os_unfair_lock_unlock(p_lock);
    os_unfair_recursive_lock_lock_with_options();
    v10 = objc_msgSend(v8, "state");
    if (v10 == 1)
    {
      objc_msgSend(v8, "error");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[BPSCompletion failureWithError:](BPSCompletion, "failureWithError:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "receiveCompletion:", v13);

    }
    else
    {
      if (v10)
      {
LABEL_12:
        os_unfair_recursive_lock_unlock();

        goto LABEL_13;
      }
      objc_msgSend(v8, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "receiveInput:", v11);

      +[BPSCompletion success](BPSCompletion, "success");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "receiveCompletion:", v12);
    }

    goto LABEL_12;
  }
  os_unfair_lock_unlock(p_lock);
LABEL_14:

}

- (void)fulfill:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (!-[_BPSInnerFutureConduit released](self, "released")
    && -[_BPSInnerFutureConduit hasAnyDemand](self, "hasAnyDemand"))
  {
    -[_BPSInnerFutureConduit downstream](self, "downstream");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BPSInnerFutureConduit setReleased:](self, "setReleased:", 1);
    os_unfair_lock_unlock(&self->_lock);
    os_unfair_recursive_lock_lock_with_options();
    v5 = objc_msgSend(v9, "state");
    if (v5 == 1)
    {
      objc_msgSend(v9, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[BPSCompletion failureWithError:](BPSCompletion, "failureWithError:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "receiveCompletion:", v8);

    }
    else
    {
      if (v5)
      {
LABEL_9:
        os_unfair_recursive_lock_unlock();

        goto LABEL_10;
      }
      objc_msgSend(v9, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "receiveInput:", v6);

      +[BPSCompletion success](BPSCompletion, "success");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "receiveCompletion:", v7);
    }

    goto LABEL_9;
  }
  os_unfair_lock_unlock(&self->_lock);
LABEL_10:

}

- (void)cancel
{
  void *v2;
  _BPSInnerFutureConduit *v3;

  v3 = self;
  os_unfair_lock_lock(&v3->_lock);
  if (!-[_BPSInnerFutureConduit released](v3, "released"))
  {
    -[_BPSInnerFutureConduit setReleased:](v3, "setReleased:", 1);
    -[_BPSInnerFutureConduit parent](v3, "parent");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "disassociate:", -[_BPSInnerFutureConduit identifity](v3, "identifity"));

  }
  os_unfair_lock_unlock(&v3->_lock);

}

- (id)upstreamSubscriptions
{
  return 0;
}

- (BPSFuture)parent
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

- (BOOL)hasAnyDemand
{
  return self->_hasAnyDemand;
}

- (void)setHasAnyDemand:(BOOL)a3
{
  self->_hasAnyDemand = a3;
}

- (int64_t)identifity
{
  return self->_identifity;
}

- (void)setIdentifity:(int64_t)a3
{
  self->_identifity = a3;
}

- (BOOL)released
{
  return self->_released;
}

- (void)setReleased:(BOOL)a3
{
  self->_released = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downstream, 0);
  objc_storeStrong((id *)&self->_parent, 0);
}

@end
