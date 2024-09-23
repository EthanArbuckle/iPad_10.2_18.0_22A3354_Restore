@implementation _BPSSubscribeOnInner

- (_BPSSubscribeOnInner)initWithDownstream:(id)a3
{
  id v5;
  _BPSSubscribeOnInner *v6;
  _BPSSubscribeOnInner *v7;
  uint64_t v8;
  BPSSubscriptionStatus *status;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_BPSSubscribeOnInner;
  v6 = -[_BPSSubscribeOnInner init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_downstream, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D02480]), "initWithState:subscription:", 0, 0);
    status = v7->_status;
    v7->_status = (BPSSubscriptionStatus *)v8;

  }
  return v7;
}

- (void)requestDemand:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _BPSSubscribeOnInner *v8;

  v8 = self;
  -[_BPSSubscribeOnInner status](v8, "status");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "state");

  if (v5 == 1)
  {
    -[_BPSSubscribeOnInner status](v8, "status");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subscription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "requestDemand:", a3);

  }
}

- (void)cancel
{
  void *v2;
  _BPSSubscribeOnInner *v3;

  v3 = self;
  -[_BPSSubscribeOnInner subscription](v3, "subscription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (void)receiveCompletion:(id)a3
{
  id v4;
  void *v5;
  _BPSSubscribeOnInner *v6;

  v6 = self;
  v4 = a3;
  -[_BPSSubscribeOnInner downstream](v6, "downstream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "receiveCompletion:", v4);

}

- (int64_t)receiveInput:(id)a3
{
  _BPSSubscribeOnInner *v4;
  id v5;
  void *v6;
  int64_t v7;

  v4 = self;
  v5 = a3;
  -[_BPSSubscribeOnInner downstream](v4, "downstream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "receiveInput:", v5);

  return v7;
}

- (void)receiveSubscription:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_BPSSubscribeOnInner status](self, "status");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setState:", 1);

  -[_BPSSubscribeOnInner status](self, "status");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSubscription:", v4);

}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
  objc_storeStrong((id *)&self->_downstream, a3);
}

- (BPSSubscription)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_subscription, a3);
}

- (BPSSubscriptionStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
}

@end
