@implementation MOPublisher

- (id)initPublisher
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MOPublisher;
  return -[MOPublisher init](&v3, sel_init);
}

- (id)sinkWithReceiveInput:(id)a3
{
  return -[MOPublisher sinkWithCompletion:receiveInput:](self, "sinkWithCompletion:receiveInput:", &__block_literal_global_1, a3);
}

- (id)sinkWithCompletion:(id)a3 receiveInput:(id)a4
{
  id v6;
  id v7;
  MOSink *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[MOSink initWithCompletion:receiveInput:]([MOSink alloc], "initWithCompletion:receiveInput:", v7, v6);

  -[MOPublisher subscribe:](self, "subscribe:", v8);
  return v8;
}

- (void)subscribe:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

@end
