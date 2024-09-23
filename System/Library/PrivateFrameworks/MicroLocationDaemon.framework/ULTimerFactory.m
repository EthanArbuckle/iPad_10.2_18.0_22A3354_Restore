@implementation ULTimerFactory

+ (id)_instance
{
  if (_instance_onceToken != -1)
    dispatch_once(&_instance_onceToken, &__block_literal_global_0);
  return (id)_instance_instance;
}

void __27__ULTimerFactory__instance__block_invoke()
{
  ULTimerFactory *v0;
  void *v1;

  v0 = objc_alloc_init(ULTimerFactory);
  v1 = (void *)_instance_instance;
  _instance_instance = (uint64_t)v0;

}

+ (id)timerOnPrimaryQueueWithInterval:(double)a3 repeats:(BOOL)a4 block:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  id v12;
  void *v13;

  v5 = a4;
  v8 = a5;
  +[ULTimerFactory _instance](ULTimerFactory, "_instance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "primaryQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x24BE669E0], "isRunningInXCTestEnvironment"))
    v11 = v10 == 0;
  else
    v11 = 0;
  if (v11)
    goto LABEL_7;
  if (!v10)
  {
    +[ULTimerFactory timerOnPrimaryQueueWithInterval:repeats:block:].cold.1();
LABEL_7:
    v10 = (void *)MEMORY[0x24BDAC9B8];
    v12 = MEMORY[0x24BDAC9B8];
  }
  objc_msgSend(a1, "timerWithQueue:Interval:repeats:block:", v10, v5, v8, a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)timerWithQueue:(id)a3 Interval:(double)a4 repeats:(BOOL)a5 block:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  ULTimer *v11;

  v6 = a5;
  v9 = a6;
  v10 = a3;
  v11 = -[ULTimer initWithInterval:repeats:queue:block:]([ULTimer alloc], "initWithInterval:repeats:queue:block:", v6, v10, v9, a4);

  return v11;
}

- (OS_dispatch_queue)primaryQueue
{
  return self->_primaryQueue;
}

- (void)setPrimaryQueue:(id)a3
{
  objc_storeStrong((id *)&self->_primaryQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryQueue, 0);
}

+ (void)setPrimaryQueue:(id)a3
{
  void *v3;
  id v4;
  BOOL v5;
  void *v6;
  id v7;

  v7 = a3;
  +[ULTimerFactory _instance](ULTimerFactory, "_instance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryQueue");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x24BE669E0], "isRunningInXCTestEnvironment") & 1) == 0)
  {
    if (v4)
      v5 = v4 == v7;
    else
      v5 = 1;
    if (!v5)
      +[ULTimerFactory(queueSetter) setPrimaryQueue:].cold.1();
  }
  +[ULTimerFactory _instance](ULTimerFactory, "_instance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPrimaryQueue:", v7);

}

+ (uint64_t)timerOnPrimaryQueueWithInterval:repeats:block:.cold.1()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  NSObject *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t v27;

  _CLLogObjectForCategory_MicroLocation_Default();
  v1 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_5(v1))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_3(&dword_2419D9000, v2, v3, "{\"msg%{public}.0s\":\"#ULTimerFactory, Trying to create a timer on global queue without queue being set\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v4, v5, v6, v7, v23, v24, v25, v26, v27);
  }

  _CLLogObjectForCategory_MicroLocation_Default();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_1(&dword_2419D9000, v9, v10, v11, "#ULTimerFactory, Trying to create a timer on global queue without queue being set", "{\"msg%{public}.0s\":\"#ULTimerFactory, Trying to create a timer on global queue without queue being set\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v12, v13, v23, v24, v25, v26, v27);
  }

  _CLLogObjectForCategory_MicroLocation_Default();
  v14 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_4(v14))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_2(&dword_2419D9000, v15, v16, "{\"msg%{public}.0s\":\"#ULTimerFactory, Trying to create a timer on global queue without queue being set\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v17, v18, v19, v20, v23, v24, v25, v26, v27);
  }

  v21 = abort_report_np();
  return +[ULTimerFactory(queueSetter) setPrimaryQueue:].cold.1(v21);
}

@end
