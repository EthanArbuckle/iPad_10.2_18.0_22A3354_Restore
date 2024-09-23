@implementation CRKConcreteDistributedNotificationPublisher

- (id)subscribeToNotificationWithName:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  CRKConcreteDistributedNotificationSubscription *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CRKConcreteDistributedNotificationSubscription initWithNotificationName:handler:]([CRKConcreteDistributedNotificationSubscription alloc], "initWithNotificationName:handler:", v6, v5);

  -[CRKConcreteDistributedNotificationSubscription resume](v7, "resume");
  return v7;
}

@end
