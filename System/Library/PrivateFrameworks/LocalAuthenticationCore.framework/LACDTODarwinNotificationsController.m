@implementation LACDTODarwinNotificationsController

- (LACDTODarwinNotificationsController)initWithNotificationCenter:(id)a3
{
  id v5;
  LACDTODarwinNotificationsController *v6;
  LACDTODarwinNotificationsController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACDTODarwinNotificationsController;
  v6 = -[LACDTODarwinNotificationsController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_notificationCenter, a3);

  return v7;
}

- (void)handleEvent:(id)a3 sender:(id)a4
{
  id v5;

  v5 = a3;
  if (!objc_msgSend(v5, "rawValue") || objc_msgSend(v5, "rawValue") == 2 || objc_msgSend(v5, "rawValue") == 3)
    -[LACDarwinNotificationCenter postNotification:](self->_notificationCenter, "postNotification:", CFSTR("com.apple.LocalAuthentication.ratchet.StateDidChange"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end
