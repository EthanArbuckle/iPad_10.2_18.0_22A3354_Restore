@implementation ASDTSystemPowerNotifier

+ (id)notifierForBundleName:(id)a3 delegate:(id)a4 earlyWake:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  id v9;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = -[ASDTSystemPowerNotifier initForBundleName:delegate:earlyWake:]([ASDTSystemPowerNotifier alloc], "initForBundleName:delegate:earlyWake:", v7, v8, v5);

  return v9;
}

- (id)initForBundleName:(id)a3 delegate:(id)a4 earlyWake:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  ASDTSystemPowerNotifier *v10;
  ASDTSystemPowerNotifier *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  dispatch_queue_t v16;
  ASDTSystemPowerNotifier *v17;
  objc_super v19;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ASDTSystemPowerNotifier;
  v10 = -[ASDTSystemPowerNotifier init](&v19, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_5;
  -[ASDTSystemPowerNotifier setBundleName:](v10, "setBundleName:", v8);
  -[ASDTSystemPowerNotifier setDelegate:](v11, "setDelegate:", v9);
  if (!v8 || !v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTSystemPowerNotifier initForBundleName:delegate:earlyWake:].cold.1();
    goto LABEL_8;
  }
  -[ASDTSystemPowerNotifier setWakeForEarlyWake:](v11, "setWakeForEarlyWake:", v5);
  v12 = (void *)MEMORY[0x24BDD17C8];
  -[ASDTSystemPowerNotifier bundleName](v11, "bundleName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@.PowerNotification"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_retainAutorelease(v14);
  v16 = dispatch_queue_create((const char *)objc_msgSend(v15, "UTF8String"), 0);
  -[ASDTSystemPowerNotifier setPowerNotificationQueue:](v11, "setPowerNotificationQueue:", v16);

  LOBYTE(v16) = -[ASDTSystemPowerNotifier registerForSystemSleepNotificationsSystemPower](v11, "registerForSystemSleepNotificationsSystemPower");
  if ((v16 & 1) == 0)
  {
LABEL_8:
    v17 = 0;
    goto LABEL_9;
  }
LABEL_5:
  v17 = v11;
LABEL_9:

  return v17;
}

- (void)dealloc
{
  objc_super v3;

  -[ASDTSystemPowerNotifier deregisterForSystemSleepNotificationsSystemPower](self, "deregisterForSystemSleepNotificationsSystemPower");
  v3.receiver = self;
  v3.super_class = (Class)ASDTSystemPowerNotifier;
  -[ASDTSystemPowerNotifier dealloc](&v3, sel_dealloc);
}

- (BOOL)allowSleepStateNotification:(int)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  switch(a3)
  {
    case 0:
      -[ASDTSystemPowerNotifier delegate](self, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_opt_respondsToSelector();

      if ((v5 & 1) == 0)
        return 1;
      -[ASDTSystemPowerNotifier delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "allowSystemSleep");

      return v7;
    case 1:
      if (-[ASDTSystemPowerNotifier systemIsSleeping](self, "systemIsSleeping"))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
          -[ASDTSystemPowerNotifier allowSleepStateNotification:].cold.1(self);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          -[ASDTSystemPowerNotifier bundleName](self, "bundleName");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 138412290;
          v14 = v10;
          _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Sleeping.", (uint8_t *)&v13, 0xCu);

        }
        -[ASDTSystemPowerNotifier setSystemIsSleeping:](self, "setSystemIsSleeping:", 1);
        -[ASDTSystemPowerNotifier delegate](self, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "systemWillSleep");

      }
      return 1;
    case 2:
      if (-[ASDTSystemPowerNotifier wakeForEarlyWake](self, "wakeForEarlyWake"))
        goto LABEL_8;
      return 1;
    case 3:
LABEL_8:
      if (-[ASDTSystemPowerNotifier systemIsSleeping](self, "systemIsSleeping"))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          -[ASDTSystemPowerNotifier bundleName](self, "bundleName");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 138412290;
          v14 = v8;
          _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Waking.", (uint8_t *)&v13, 0xCu);

        }
        -[ASDTSystemPowerNotifier setSystemIsSleeping:](self, "setSystemIsSleeping:", 0);
        -[ASDTSystemPowerNotifier delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "systemHasPoweredOn");

      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        -[ASDTSystemPowerNotifier allowSleepStateNotification:].cold.2(self);
      }
      break;
    default:
      return 1;
  }
  return 1;
}

- (void)handlePowerNotificationWithMessageType:(unsigned int)a3 andArgument:(void *)a4
{
  unint64_t v6;
  _BOOL4 v8;
  io_connect_t powerConnection;
  uint64_t v10;

  HIDWORD(v6) = a3;
  LODWORD(v6) = a3 + 536870288;
  switch((v6 >> 4))
  {
    case 0u:
      v8 = -[ASDTSystemPowerNotifier allowSleepStateNotification:](self, "allowSleepStateNotification:", 0);
      powerConnection = self->_powerConnection;
      if (v8)
        goto LABEL_5;
      IOCancelPowerChange(powerConnection, (intptr_t)a4);
      break;
    case 1u:
      -[ASDTSystemPowerNotifier allowSleepStateNotification:](self, "allowSleepStateNotification:", 1);
      powerConnection = self->_powerConnection;
LABEL_5:
      IOAllowPowerChange(powerConnection, (intptr_t)a4);
      break;
    case 2u:
      return;
    case 9u:
      v10 = 3;
      goto LABEL_11;
    case 0xBu:
      v10 = 2;
LABEL_11:
      -[ASDTSystemPowerNotifier allowSleepStateNotification:](self, "allowSleepStateNotification:", v10);
      break;
    default:
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        -[ASDTSystemPowerNotifier handlePowerNotificationWithMessageType:andArgument:].cold.1(self, a3);
      break;
  }
}

- (BOOL)registerForSystemSleepNotificationsSystemPower
{
  IONotificationPort **p_powerNotificationPort;
  unsigned int *p_powerNotifier;
  io_connect_t v5;
  _BOOL4 v6;

  p_powerNotificationPort = &self->_powerNotificationPort;
  p_powerNotifier = &self->_powerNotifier;
  v5 = IORegisterForSystemPower(self, &self->_powerNotificationPort, (IOServiceInterestCallback)ASDTSystemPowerInterestCallback, &self->_powerNotifier);
  self->_powerConnection = v5;
  if (v5 && *p_powerNotificationPort && *p_powerNotifier)
  {
    IONotificationPortSetDispatchQueue(*p_powerNotificationPort, (dispatch_queue_t)self->_powerNotificationQueue);
    LOBYTE(v6) = 1;
  }
  else
  {
    v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v6)
    {
      -[ASDTSystemPowerNotifier registerForSystemSleepNotificationsSystemPower].cold.1(self);
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (void)deregisterForSystemSleepNotificationsSystemPower
{
  void *v3;
  IONotificationPort *powerNotificationPort;
  io_connect_t powerConnection;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    -[ASDTSystemPowerNotifier bundleName](self, "bundleName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Deregistered for system sleep notifications", (uint8_t *)&v6, 0xCu);

  }
  if (self->_powerNotifier)
  {
    IODeregisterForSystemPower(&self->_powerNotifier);
    self->_powerNotifier = 0;
  }
  powerNotificationPort = self->_powerNotificationPort;
  if (powerNotificationPort)
  {
    IONotificationPortDestroy(powerNotificationPort);
    self->_powerNotificationPort = 0;
  }
  powerConnection = self->_powerConnection;
  if (powerConnection)
  {
    IOServiceClose(powerConnection);
    self->_powerConnection = 0;
  }
}

- (NSString)bundleName
{
  return self->_bundleName;
}

- (void)setBundleName:(id)a3
{
  objc_storeStrong((id *)&self->_bundleName, a3);
}

- (ASDTSystemPowerNotifierDelegate)delegate
{
  return (ASDTSystemPowerNotifierDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)wakeForEarlyWake
{
  return self->_wakeForEarlyWake;
}

- (void)setWakeForEarlyWake:(BOOL)a3
{
  self->_wakeForEarlyWake = a3;
}

- (OS_dispatch_queue)powerNotificationQueue
{
  return self->_powerNotificationQueue;
}

- (void)setPowerNotificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_powerNotificationQueue, a3);
}

- (BOOL)systemIsSleeping
{
  return self->_systemIsSleeping;
}

- (void)setSystemIsSleeping:(BOOL)a3
{
  self->_systemIsSleeping = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerNotificationQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bundleName, 0);
}

- (void)initForBundleName:delegate:earlyWake:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "ASDTSystemPowerNotifier: Invalid arguments.", v0, 2u);
}

- (void)allowSleepStateNotification:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "bundleName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_4(&dword_236CEE000, MEMORY[0x24BDACB70], v2, "%@: Already asleep.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_1();
}

- (void)allowSleepStateNotification:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "bundleName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_4(&dword_236CEE000, MEMORY[0x24BDACB70], v2, "%@: Already awake.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_1();
}

- (void)handlePowerNotificationWithMessageType:(void *)a1 andArgument:(int)a2 .cold.1(void *a1, int a2)
{
  void *v3;
  uint8_t v4[12];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "bundleName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  v5 = 1024;
  v6 = a2;
  _os_log_debug_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%@: Unexpected power notification: %u", v4, 0x12u);

  OUTLINED_FUNCTION_0_1();
}

- (void)registerForSystemSleepNotificationsSystemPower
{
  void *v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "bundleName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Failed failed to register for system power notifications.", v2, 0xCu);

  OUTLINED_FUNCTION_0_1();
}

@end
