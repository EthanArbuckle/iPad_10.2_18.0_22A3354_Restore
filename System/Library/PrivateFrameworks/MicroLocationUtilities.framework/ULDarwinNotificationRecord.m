@implementation ULDarwinNotificationRecord

- (ULDarwinNotificationRecord)initWithNotificationName:(id)a3 registrationToken:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  ULDarwinNotificationRecord *v11;
  ULDarwinNotificationRecord *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ULDarwinNotificationRecord;
  v11 = -[ULDarwinNotificationRecord init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[ULDarwinNotificationRecord setNotificationName:](v11, "setNotificationName:", v8);
    -[ULDarwinNotificationRecord setRegistrationToken:](v12, "setRegistrationToken:", v9);
    -[ULDarwinNotificationRecord setHandler:](v12, "setHandler:", v10);
  }

  return v12;
}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (void)setNotificationName:(id)a3
{
  objc_storeStrong((id *)&self->_notificationName, a3);
}

- (NSNumber)registrationToken
{
  return self->_registrationToken;
}

- (void)setRegistrationToken:(id)a3
{
  objc_storeStrong((id *)&self->_registrationToken, a3);
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_registrationToken, 0);
  objc_storeStrong((id *)&self->_notificationName, 0);
}

@end
