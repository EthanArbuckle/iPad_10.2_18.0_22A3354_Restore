@implementation IOKPowerNotifier

- (IOKPowerNotifier)initWithDispatchQueue:(id)a3
{
  NSObject *v4;
  IOKPowerNotifier *v5;
  IOKPowerNotifier *v6;
  IONotificationPortRef *p_notificationPort;
  io_connect_t v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IOKPowerNotifier;
  v5 = -[IOKPowerNotifier init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    p_notificationPort = &v5->_notificationPort;
    v8 = IORegisterForSystemPower(v5, &v5->_notificationPort, (IOServiceInterestCallback)IOKPowerNotifierCallback, &v5->_notifier);
    v6->_connection = v8;
    if (v8 && v6->_notifier && *p_notificationPort)
    {
      IONotificationPortSetDispatchQueue(*p_notificationPort, v4);
    }
    else
    {

      v6 = 0;
    }
  }

  return v6;
}

- (void)_handlePowerNotificationWithMessageType:(unsigned int)a3 andArgument:(int64_t)a4
{
  unint64_t v4;

  HIDWORD(v4) = a3;
  LODWORD(v4) = a3 + 536870288;
  switch((v4 >> 4))
  {
    case 0u:
      goto LABEL_3;
    case 1u:
      -[IOKPowerNotifier systemWillSleep](self, "systemWillSleep");
LABEL_3:
      IOAllowPowerChange(self->_connection, a4);
      break;
    case 2u:
      -[IOKPowerNotifier systemWillNotSleep](self, "systemWillNotSleep");
      break;
    case 9u:
      -[IOKPowerNotifier systemHasPoweredOn](self, "systemHasPoweredOn");
      break;
    case 0xBu:
      -[IOKPowerNotifier systemWillPowerOn](self, "systemWillPowerOn");
      break;
    default:
      return;
  }
}

- (void)systemWillSleep
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  -[IOKPowerNotifier delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[IOKPowerNotifier delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[IOKPowerNotifier delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "systemWillSleepWithNotifier:", self);

    }
  }
}

- (void)systemWillPowerOn
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  -[IOKPowerNotifier delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[IOKPowerNotifier delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[IOKPowerNotifier delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "systemWillPowerOnWithNotifier:", self);

    }
  }
}

- (void)systemWillNotSleep
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  -[IOKPowerNotifier delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[IOKPowerNotifier delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[IOKPowerNotifier delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "systemWillNotSleepWithNotifier:", self);

    }
  }
}

- (void)systemHasPoweredOn
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  -[IOKPowerNotifier delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[IOKPowerNotifier delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[IOKPowerNotifier delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "systemHasPoweredOnWithNotifier:", self);

    }
  }
}

- (void)dealloc
{
  unsigned int *p_notifier;
  unsigned int notifier;
  io_connect_t connection;
  IONotificationPort *notificationPort;
  objc_super v7;

  notifier = self->_notifier;
  p_notifier = &self->_notifier;
  if (notifier)
    IODeregisterForSystemPower(p_notifier);
  connection = self->_connection;
  if (connection)
    IOServiceClose(connection);
  notificationPort = self->_notificationPort;
  if (notificationPort)
    IONotificationPortDestroy(notificationPort);
  v7.receiver = self;
  v7.super_class = (Class)IOKPowerNotifier;
  -[IOKPowerNotifier dealloc](&v7, sel_dealloc);
}

- (IOKPowerNotifierDelegate)delegate
{
  return (IOKPowerNotifierDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
