@implementation CRKConcreteDarwinNotificationPublisher

- (id)subscribeToNotificationWithName:(id)a3 handler:(id)a4
{
  return +[CRKConcreteDarwinNotificationSubscription subscriptionWithNotificationName:handler:](CRKConcreteDarwinNotificationSubscription, "subscriptionWithNotificationName:handler:", a3, a4);
}

@end
