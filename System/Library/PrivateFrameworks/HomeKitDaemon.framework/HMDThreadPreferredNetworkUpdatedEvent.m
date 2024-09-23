@implementation HMDThreadPreferredNetworkUpdatedEvent

- (HMDThreadPreferredNetworkUpdatedEvent)initWithEventValue:(id)a3
{
  id v5;
  HMDThreadPreferredNetworkUpdatedEvent *v6;
  HMDThreadPreferredNetworkUpdatedEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDThreadPreferredNetworkUpdatedEvent;
  v6 = -[HMDThreadPreferredNetworkUpdatedEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_eventValue, a3);

  return v7;
}

- (NSData)eventValue
{
  return self->_eventValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventValue, 0);
}

@end
