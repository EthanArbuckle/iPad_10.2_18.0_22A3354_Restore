@implementation FCCCoalescingRule

- (FCCCoalescingRule)initWithEventIdentifier:(id)a3 interval:(double)a4
{
  id v7;
  FCCCoalescingRule *v8;
  FCCCoalescingRule *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FCCCoalescingRule;
  v8 = -[FCCCoalescingRule init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_eventIdentifier, a3);
    v9->_interval = a4;
  }

  return v9;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FCCCoalescingRule: eventIdentifier: %@, interval: %.1f"), self->_eventIdentifier, *(_QWORD *)&self->_interval);
}

- (FCCCoalescingRule)initWithProtobuf:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  FCCCoalescingRule *v8;

  v4 = a3;
  objc_msgSend(v4, "eventIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interval");
  v7 = v6;

  v8 = -[FCCCoalescingRule initWithEventIdentifier:interval:](self, "initWithEventIdentifier:interval:", v5, v7);
  return v8;
}

- (id)protobuf
{
  FCCCoalescingRuleProtobuf *v3;

  v3 = objc_alloc_init(FCCCoalescingRuleProtobuf);
  -[FCCCoalescingRuleProtobuf setEventIdentifier:](v3, "setEventIdentifier:", self->_eventIdentifier);
  -[FCCCoalescingRuleProtobuf setInterval:](v3, "setInterval:", self->_interval);
  return v3;
}

- (FCCCoalescingRule)initWithTransportData:(id)a3
{
  id v4;
  FCCCoalescingRuleProtobuf *v5;
  FCCCoalescingRule *v6;

  v4 = a3;
  v5 = -[FCCCoalescingRuleProtobuf initWithData:]([FCCCoalescingRuleProtobuf alloc], "initWithData:", v4);

  v6 = -[FCCCoalescingRule initWithProtobuf:](self, "initWithProtobuf:", v5);
  return v6;
}

- (id)transportData
{
  void *v2;
  void *v3;

  -[FCCCoalescingRule protobuf](self, "protobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (void)setEventIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
}

@end
