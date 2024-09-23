@implementation AFSiriNotificationRequest

- (AFSiriNotificationRequest)initWithNotifications:(id)a3 sourceAppId:(id)a4
{
  id v6;
  void *v7;
  AFSiriNotificationRequest *v8;
  objc_super v10;

  v6 = a4;
  objc_msgSend(a3, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)AFSiriNotificationRequest;
  v8 = -[AFSiriUserNotificationRequest initWithUserNotification:sourceAppId:](&v10, sel_initWithUserNotification_sourceAppId_, v7, v6);

  return v8;
}

@end
