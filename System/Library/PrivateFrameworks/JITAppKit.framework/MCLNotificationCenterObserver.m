@implementation MCLNotificationCenterObserver

- (MCLNotificationCenterObserver)init
{
  MCLNotificationCenterObserver *v3;
  objc_super v4;
  SEL v5;
  MCLNotificationCenterObserver *v6;

  v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)MCLNotificationCenterObserver;
  v6 = -[MCLNotificationCenterObserver init](&v4, sel_init);
  objc_storeStrong((id *)&v6, v6);
  if (v6)
    v6->_enabled = 1;
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (void)dealloc
{
  id v2;
  objc_super v3;
  SEL v4;
  MCLNotificationCenterObserver *v5;

  v5 = self;
  v4 = a2;
  v2 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v2, "removeObserver:", v5);

  v3.receiver = v5;
  v3.super_class = (Class)MCLNotificationCenterObserver;
  -[MCLNotificationCenterObserver dealloc](&v3, sel_dealloc);
}

- (void)setNotification:(id)a3
{
  uint64_t v3;
  NSString *notification;
  id location[2];
  MCLNotificationCenterObserver *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_msgSend(location[0], "copy");
  notification = v6->_notification;
  v6->_notification = (NSString *)v3;

  -[MCLNotificationCenterObserver setup](v6, "setup");
  objc_storeStrong(location, 0);
}

- (void)setObject:(id)a3
{
  id location[2];
  MCLNotificationCenterObserver *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(&v4->_object, location[0]);
  -[MCLNotificationCenterObserver setup](v4, "setup");
  objc_storeStrong(location, 0);
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  -[MCLNotificationCenterObserver setup](self, "setup");
}

- (void)setup
{
  id v2;
  id v3;

  v3 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:", self);

  if (self->_enabled)
  {
    if (-[NSString length](self->_notification, "length"))
    {
      v2 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      objc_msgSend(v2, "addObserver:selector:name:object:", self, sel_observeNotification_, self->_notification, self->_object);

    }
  }
}

- (void)observeNotification:(id)a3
{
  id v3;
  MCLNotificationCenterObserver *v4;
  id v5;
  char v6;
  id v7;
  char v8;
  id v9;
  id location[2];
  MCLNotificationCenterObserver *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v11->_enabled)
  {
    v4 = v11;
    v5 = (id)objc_msgSend(location[0], "userInfo");
    v8 = 0;
    v6 = 0;
    if (v5)
    {
      v9 = (id)objc_msgSend(location[0], "userInfo");
      v8 = 1;
      v12[0] = v9;
      v7 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
      v6 = 1;
      v3 = v7;
    }
    else
    {
      v3 = 0;
    }
    -[MCLNotificationCenterObserver emitTMLSignal:withArguments:](v4, "emitTMLSignal:withArguments:", CFSTR("notification"), v3);
    if ((v6 & 1) != 0)

    if ((v8 & 1) != 0)
  }
  objc_storeStrong(location, 0);
}

- (NSString)notification
{
  return self->_notification;
}

- (id)object
{
  return self->_object;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong((id *)&self->_notification, 0);
}

@end
