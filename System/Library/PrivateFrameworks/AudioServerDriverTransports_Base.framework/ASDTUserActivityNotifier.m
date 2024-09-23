@implementation ASDTUserActivityNotifier

+ (id)notifierForDelegate:(id)a3 withName:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  v7 = -[ASDTUserActivityNotifier initForDelegate:withName:]([ASDTUserActivityNotifier alloc], "initForDelegate:withName:", v5, v6);

  return v7;
}

+ (id)notifierForDelegate:(id)a3 withQueue:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  v7 = -[ASDTUserActivityNotifier initForDelegate:withQueue:]([ASDTUserActivityNotifier alloc], "initForDelegate:withQueue:", v5, v6);

  return v7;
}

- (id)initForDelegate:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  dispatch_queue_t v11;
  id v12;

  v6 = a3;
  v7 = a4;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INTERACTIVE, 0);
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.PowerNotification"), v7);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = dispatch_queue_create((const char *)objc_msgSend(v10, "UTF8String"), v9);
  v12 = -[ASDTUserActivityNotifier initForDelegate:withQueue:](self, "initForDelegate:withQueue:", v6, v11);

  return v12;
}

- (id)initForDelegate:(id)a3 withQueue:(id)a4
{
  id v6;
  id v7;
  ASDTUserActivityNotifier *v8;
  ASDTUserActivityNotifier *v9;
  ASDTUserActivityNotifier *v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ASDTUserActivityNotifier;
  v8 = -[ASDTUserActivityNotifier init](&v20, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_5;
  -[ASDTUserActivityNotifier setDelegate:](v8, "setDelegate:", v6);
  -[ASDTUserActivityNotifier setQueue:](v9, "setQueue:", v7);
  if (!v6 || !v7)
  {
    v11 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v11)
      -[ASDTUserActivityNotifier initForDelegate:withQueue:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    goto LABEL_8;
  }
  if (!-[ASDTUserActivityNotifier registerUserActivityLevelNotification](v9, "registerUserActivityLevelNotification"))
  {
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
LABEL_5:
  v10 = v9;
LABEL_9:

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[ASDTUserActivityNotifier deregisterUserActivityLevelNotification](self, "deregisterUserActivityLevelNotification");
  v3.receiver = self;
  v3.super_class = (Class)ASDTUserActivityNotifier;
  -[ASDTUserActivityNotifier dealloc](&v3, sel_dealloc);
}

- (BOOL)userIsActive
{
  void *v2;

  -[ASDTUserActivityNotifier delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userIsActiveBits");

  IOPMGetUserActivityLevel();
  return 0;
}

+ (void)logUserActiveBits:(unint64_t)a3 withPrefix:(id)a4
{
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  int v13;
  id v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = " presentActive";
    if ((a3 & 1) == 0)
      v6 = "";
    v13 = 138414338;
    v14 = a4;
    v7 = " presentPassive";
    if ((a3 & 2) == 0)
      v7 = "";
    v15 = 2048;
    v16 = a3;
    v8 = " presentPassiveWithDisplay";
    if ((a3 & 4) == 0)
      v8 = "";
    v17 = 2080;
    v18 = v6;
    v9 = " presentPassiveWithoutDisplay";
    if ((a3 & 8) == 0)
      v9 = "";
    v19 = 2080;
    v20 = v7;
    v10 = " remoteClientActive";
    if ((a3 & 0x10) == 0)
      v10 = "";
    v21 = 2080;
    v22 = v8;
    v11 = " notificationActive";
    if ((a3 & 0x20) == 0)
      v11 = "";
    v23 = 2080;
    v24 = v9;
    v12 = " absentWithDisplay";
    v25 = 2080;
    v26 = v10;
    v27 = 2080;
    if ((a3 & 0x40) == 0)
      v12 = "";
    v28 = v11;
    v29 = 2080;
    v30 = v12;
    _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@:%llx%s%s%s%s%s%s%s", (uint8_t *)&v13, 0x5Cu);
  }
}

- (BOOL)registerUserActivityLevelNotification
{
  void *v3;
  unint64_t userActivityLevelChangeNotification;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v14;
  id location;

  objc_initWeak(&location, self);
  -[ASDTUserActivityNotifier queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_copyWeak(&v14, &location);
  self->_userActivityLevelChangeNotification = IOPMScheduleUserActivityLevelNotification();

  userActivityLevelChangeNotification = self->_userActivityLevelChangeNotification;
  if (!userActivityLevelChangeNotification)
  {
    v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v5)
      -[ASDTUserActivityNotifier registerUserActivityLevelNotification].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return userActivityLevelChangeNotification != 0;
}

void __65__ASDTUserActivityNotifier_registerUserActivityLevelNotification__block_invoke(id *a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;
  id v8;

  +[ASDTUserActivityNotifier logUserActiveBits:withPrefix:](ASDTUserActivityNotifier, "logUserActiveBits:withPrefix:", a2, CFSTR("User activity changed"));
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userIsActiveBits");

  v8 = objc_loadWeakRetained(a1);
  objc_msgSend(v8, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userActiveChanged:", (v5 & a2) != 0);

}

- (void)deregisterUserActivityLevelNotification
{
  if (self->_userActivityLevelChangeNotification)
  {
    IOPMUnregisterNotification();
    self->_userActivityLevelChangeNotification = 0;
  }
}

- (ASDTUserActivityNotifierDelegate)delegate
{
  return (ASDTUserActivityNotifierDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initForDelegate:(uint64_t)a3 withQueue:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "ASDTSystemPowerNotifier: Invalid arguments.", a5, a6, a7, a8, 0);
}

- (void)registerUserActivityLevelNotification
{
  OUTLINED_FUNCTION_2_0(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "Failed to allocate userActiveChangeNotification.", a5, a6, a7, a8, 0);
}

@end
