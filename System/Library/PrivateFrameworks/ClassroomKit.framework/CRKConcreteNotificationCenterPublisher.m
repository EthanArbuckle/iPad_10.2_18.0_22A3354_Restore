@implementation CRKConcreteNotificationCenterPublisher

- (id)subscribeToNotificationWithName:(id)a3 object:(id)a4 handler:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v7 = (void *)MEMORY[0x24BDD16D0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRKConcreteNotificationCenterSubscription subscriptionWithNotificationCenter:notificationName:object:notificationHandler:](CRKConcreteNotificationCenterSubscription, "subscriptionWithNotificationCenter:notificationName:object:notificationHandler:", v11, v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
