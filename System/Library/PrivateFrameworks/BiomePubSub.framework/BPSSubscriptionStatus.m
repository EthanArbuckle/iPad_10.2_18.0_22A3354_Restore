@implementation BPSSubscriptionStatus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscription, 0);
}

- (BPSSubscriptionStatus)initWithState:(int64_t)a3 subscription:(id)a4
{
  id v7;
  BPSSubscriptionStatus *v8;
  BPSSubscriptionStatus *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BPSSubscriptionStatus;
  v8 = -[BPSSubscriptionStatus init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_state = a3;
    objc_storeStrong((id *)&v8->_subscription, a4);
  }

  return v9;
}

+ (id)awaitingSubscription
{
  return -[BPSSubscriptionStatus initWithState:subscription:]([BPSSubscriptionStatus alloc], "initWithState:subscription:", 0, 0);
}

+ (id)subscribedWithSubscription:(id)a3
{
  id v3;
  BPSSubscriptionStatus *v4;

  v3 = a3;
  v4 = -[BPSSubscriptionStatus initWithState:subscription:]([BPSSubscriptionStatus alloc], "initWithState:subscription:", 1, v3);

  return v4;
}

+ (id)terminal
{
  return -[BPSSubscriptionStatus initWithState:subscription:]([BPSSubscriptionStatus alloc], "initWithState:subscription:", 2, 0);
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

@end
