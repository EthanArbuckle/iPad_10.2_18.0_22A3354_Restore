@implementation WFDaemonApplicationContextProvider

- (WFDaemonApplicationContextProvider)initWithUserInterfaceType:(id)a3
{
  id v4;
  WFDaemonApplicationContextProvider *v5;
  uint64_t v6;
  NSString *userInterfaceType;
  WFDaemonApplicationContextProvider *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFDaemonApplicationContextProvider;
  v5 = -[WFDaemonApplicationContextProvider init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    userInterfaceType = v5->_userInterfaceType;
    v5->_userInterfaceType = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (WFDaemonApplicationContextProvider)init
{
  return -[WFDaemonApplicationContextProvider initWithUserInterfaceType:](self, "initWithUserInterfaceType:", 0);
}

- (id)bundleForWFApplicationContext:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle", a3);
}

- (id)notificationNameForApplicationStateEvent:(int64_t)a3 applicationContext:(id)a4
{
  return 0;
}

- (id)keyWindowForWFApplicationContext:(id)a3
{
  return 0;
}

- (id)applicationForWFApplicationContext:(id)a3
{
  return 0;
}

- (int64_t)currentApplicationStateForWFApplicationContext:(id)a3
{
  return 0;
}

- (BOOL)shouldReverseLayoutDirection
{
  return 0;
}

- (NSString)userInterfaceType
{
  return self->_userInterfaceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInterfaceType, 0);
}

@end
