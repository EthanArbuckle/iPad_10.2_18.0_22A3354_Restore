@implementation NotificationSender

- (NotificationSender)initWithName:(id)a3
{
  id v5;
  NotificationSender *v6;
  NotificationSender *v7;
  NSDictionary *userInfo;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NotificationSender;
  v6 = -[NotificationSender init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    userInfo = v7->_userInfo;
    v7->_userInfo = 0;

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[NotificationSender name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NotificationSender userInfo](self, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  notifyClientsOfEvent(v3, v4);

  v5.receiver = self;
  v5.super_class = (Class)NotificationSender;
  -[NotificationSender dealloc](&v5, sel_dealloc);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
