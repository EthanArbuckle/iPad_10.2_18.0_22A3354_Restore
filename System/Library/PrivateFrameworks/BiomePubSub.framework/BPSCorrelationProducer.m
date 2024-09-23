@implementation BPSCorrelationProducer

- (BPSCorrelationProducer)initWithDownstream:(id)a3
{
  id v5;
  BPSCorrelationProducer *v6;
  BPSCorrelationProducer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BPSCorrelationProducer;
  v6 = -[BPSCorrelationProducer init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_downstream, a3);
    v7->_state = 0;
    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (id)receiveNewValue:(id)a3 source:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Override %@ in a subclass"), v7);
  v8 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v8, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (void)receiveCompletion:(id)a3
{
  BPSCorrelationProducer *v4;
  os_unfair_lock_s *p_lock;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = self;
  p_lock = &v4->_lock;
  os_unfair_lock_lock(&v4->_lock);
  v6 = -[BPSCorrelationProducer state](v4, "state");
  switch(v6)
  {
    case 2:
      goto LABEL_6;
    case 1:
      -[BPSCorrelationProducer setState:](v4, "setState:", 2);
LABEL_6:
      -[BPSCorrelationProducer downstream](v4, "downstream");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[BPSCorrelationProducer setDownstream:](v4, "setDownstream:", 0);
      os_unfair_lock_unlock(p_lock);
      objc_msgSend(v8, "receiveCompletion:", v9);

      break;
    case 0:
      os_unfair_lock_unlock(p_lock);
      v7 = (id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Invalid State: Received completion before receiving subscription"), 0);
      break;
  }

}

- (int64_t)receiveInput:(id)a3 source:(int64_t)a4
{
  id v7;
  BPSCorrelationProducer *v8;
  os_unfair_lock_s *p_lock;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int64_t v14;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v7 = a3;
  v8 = self;
  p_lock = &v8->_lock;
  os_unfair_lock_lock(&v8->_lock);
  v10 = -[BPSCorrelationProducer state](v8, "state");
  switch(v10)
  {
    case 2:
      os_unfair_lock_unlock(p_lock);
      break;
    case 1:
      os_unfair_lock_unlock(p_lock);
      -[BPSCorrelationProducer receiveNewValue:source:](v8, "receiveNewValue:source:", v7, a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v13, "state");
      if (v16)
      {
        if (v16 == 2)
        {
          os_unfair_lock_lock(p_lock);
          -[BPSCorrelationProducer setState:](v8, "setState:", 2);
          os_unfair_lock_unlock(p_lock);
          -[BPSCorrelationProducer subscription](v8, "subscription");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "cancel");

          objc_msgSend(v13, "error");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[BPSCorrelationProducer downstream](v8, "downstream");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          +[BPSCompletion failureWithError:](BPSCompletion, "failureWithError:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "receiveCompletion:", v26);

          goto LABEL_5;
        }
        if (v16 != 1)
        {
LABEL_5:

          break;
        }
        objc_msgSend(v13, "value");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          -[BPSCorrelationProducer downstream](v8, "downstream");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "value");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v18, "receiveInput:", v19);

        }
        else
        {
          v14 = 1;
        }
      }
      else
      {
        os_unfair_lock_lock(p_lock);
        -[BPSCorrelationProducer setState:](v8, "setState:", 2);
        os_unfair_lock_unlock(p_lock);
        -[BPSCorrelationProducer subscription](v8, "subscription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "cancel");

        -[BPSCorrelationProducer downstream](v8, "downstream");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[BPSCompletion success](BPSCompletion, "success");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "receiveCompletion:", v22);

        v14 = 0;
      }

      goto LABEL_8;
    case 0:
      os_unfair_lock_unlock(p_lock);
      v11 = (void *)MEMORY[0x1E0C99DA0];
      v12 = *MEMORY[0x1E0C99768];
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "raise:format:", v12, CFSTR("Invalid State: Received value before receiving subscription %@"), v13);
      goto LABEL_5;
  }
  v14 = 0;
LABEL_8:

  return v14;
}

- (int64_t)receiveInput:(id)a3
{
  BPSCorrelationProducer *v4;
  int64_t v5;

  v4 = self;
  v5 = -[BPSCorrelationProducer receiveInput:source:](v4, "receiveInput:source:", a3, 0);

  return v5;
}

- (void)receiveSubscription:(id)a3
{
  int64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[BPSCorrelationProducer state](self, "state");
  if ((unint64_t)(v4 - 1) < 2)
  {
    os_unfair_lock_unlock(&self->_lock);
    -[BPSCorrelationProducer subscription](self, "subscription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancel");
LABEL_5:

    goto LABEL_6;
  }
  if (!v4)
  {
    -[BPSCorrelationProducer setState:](self, "setState:", 1);
    -[BPSCorrelationProducer setSubscription:](self, "setSubscription:", v6);
    os_unfair_lock_unlock(&self->_lock);
    -[BPSCorrelationProducer downstream](self, "downstream");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "receiveSubscription:", self);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)cancel
{
  uint64_t v2;
  void *v3;
  BPSCorrelationProducer *v4;

  v4 = self;
  os_unfair_lock_lock(&v4->_lock);
  v2 = -[BPSCorrelationProducer state](v4, "state");
  -[BPSCorrelationProducer setState:](v4, "setState:", 2);
  os_unfair_lock_unlock(&v4->_lock);
  if (v2 == 1)
  {
    -[BPSCorrelationProducer subscription](v4, "subscription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancel");

  }
}

- (void)requestDemand:(int64_t)a3
{
  BPSCorrelationProducer *v5;
  os_unfair_lock_s *p_lock;
  uint64_t v7;
  void *v8;
  void *v9;
  BPSCorrelationProducer *v10;

  v5 = self;
  v10 = v5;
  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("BPSCorrelationProducer.m"), 173, CFSTR("Negative or zero demand requested"));

    v5 = v10;
  }
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  v7 = -[BPSCorrelationProducer state](v10, "state");
  switch(v7)
  {
    case 2:
      os_unfair_lock_unlock(p_lock);
      break;
    case 1:
      os_unfair_lock_unlock(p_lock);
      -[BPSCorrelationProducer subscription](v10, "subscription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "requestDemand:", a3);

      break;
    case 0:
      os_unfair_lock_unlock(p_lock);
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Invalid state: Received request before sending subscription"));
      break;
  }

}

- (id)upstreamSubscriptions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[BPSCorrelationProducer subscription](self, "subscription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[BPSCorrelationProducer subscription](self, "subscription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
  objc_storeStrong((id *)&self->_downstream, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BPSSubscription)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_subscription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
}

@end
