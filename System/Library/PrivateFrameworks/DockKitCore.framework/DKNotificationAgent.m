@implementation DKNotificationAgent

- (DKNotificationAgent)init
{
  DKNotificationAgent *v2;
  NotificationAgent *v3;
  NotificationAgent *agent;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DKNotificationAgent;
  v2 = -[DKNotificationAgent init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(NotificationAgent);
    agent = v2->_agent;
    v2->_agent = v3;

  }
  return v2;
}

- (BOOL)isTracking
{
  return -[NotificationAgent isTracking](self->_agent, "isTracking");
}

- (BOOL)registerNotifications:(id)a3
{
  return -[NotificationAgent registerWithCallback:](self->_agent, "registerWithCallback:", a3);
}

- (void)deregisterNotifications
{
  -[NotificationAgent deregister](self->_agent, "deregister");
}

- (void)dealloc
{
  NotificationAgent *agent;
  objc_super v4;

  NSLog(CFSTR("DKNotificationAgent: dealloc"), a2);
  agent = self->_agent;
  self->_agent = 0;

  v4.receiver = self;
  v4.super_class = (Class)DKNotificationAgent;
  -[DKNotificationAgent dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_agent, 0);
}

@end
