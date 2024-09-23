@implementation ASDTPMActionWaiter

- (ASDTPMActionWaiter)initWithConfig:(id)a3 forSequencer:(id)a4
{
  id v6;
  ASDTPMActionWaiter *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  ASDTPMActionWaiter *v21;
  objc_super v23;

  v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ASDTPMActionWaiter;
  v7 = -[ASDTPMAction initWithConfig:forSequencer:](&v23, sel_initWithConfig_forSequencer_, v6, a4);
  if (!v7)
    goto LABEL_6;
  objc_msgSend(v6, "asdtDeviceUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asdtPMActionWaiterActionName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTPMActionWaiter setWaitActionName:](v7, "setWaitActionName:", v9);

  -[ASDTPMActionWaiter setWaitTimeoutUs:](v7, "setWaitTimeoutUs:", objc_msgSend(v6, "asdtPMActionWaiterTimeoutUs"));
  v10 = objc_alloc_init(MEMORY[0x24BDD14C8]);
  -[ASDTPMActionWaiter setWaitForActionCondition:](v7, "setWaitForActionCondition:", v10);

  v11 = (void *)MEMORY[0x24BDD17C8];
  -[ASDTPMDevice name](v7, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%s.%@.cond"), "com.apple.AudioServerDriverTransports", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTPMActionWaiter waitForActionCondition](v7, "waitForActionCondition");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setName:", v13);

  if (v8)
  {
    -[ASDTPMActionWaiter waitActionName](v7, "waitActionName");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      -[ASDTPMActionWaiter waitForActionCondition](v7, "waitForActionCondition");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        -[ASDTPMDevice parentSequencer](v7, "parentSequencer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "parentDevice");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "deviceManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "registerObject:withInterests:forUID:", v7, 1, v8);

LABEL_6:
        v21 = v7;
        goto LABEL_10;
      }
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[ASDTPMActionWaiter initWithConfig:forSequencer:].cold.1(v7);

  v21 = 0;
LABEL_10:

  return v21;
}

- (void)interestNotification:(int)a3 forDevice:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    -[ASDTPMActionWaiter interestNotification:forDevice:].cold.3(self);
  v6 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "pmSequencer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTPMActionWaiter waitActionName](self, "waitActionName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pmDeviceWithName:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ASDTPMActionWaiter waitForActionCondition](self, "waitForActionCondition");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lock");

      -[ASDTPMActionWaiter setWaitAction:](self, "setWaitAction:", v9);
      -[ASDTPMActionWaiter waitForActionCondition](self, "waitForActionCondition");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "signal");

      -[ASDTPMActionWaiter waitForActionCondition](self, "waitForActionCondition");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "unlock");

    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[ASDTPMActionWaiter interestNotification:forDevice:].cold.1(self);
    }

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[ASDTPMActionWaiter interestNotification:forDevice:].cold.2(self);
  }

}

- (int)action
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint8_t v15[4];
  _DWORD v16[7];

  *(_QWORD *)&v16[5] = *MEMORY[0x24BDAC8D0];
  if (-[ASDTPMActionWaiter waitTimeoutUs](self, "waitTimeoutUs"))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", (double)-[ASDTPMActionWaiter waitTimeoutUs](self, "waitTimeoutUs") / 1000000.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[ASDTPMActionWaiter waitForActionCondition](self, "waitForActionCondition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lock");

  -[ASDTPMActionWaiter waitAction](self, "waitAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v10 = MEMORY[0x24BDACB70];
    do
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[ASDTPMActionWaiter action].cold.2(v15, self, v16);
      -[ASDTPMActionWaiter waitForActionCondition](self, "waitForActionCondition");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v3)
      {
        v13 = objc_msgSend(v11, "waitUntilDate:", v3);

        if ((v13 & 1) == 0)
        {
          -[ASDTPMActionWaiter waitForActionCondition](self, "waitForActionCondition");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "unlock");
          v8 = 1852990585;
          goto LABEL_8;
        }
      }
      else
      {
        objc_msgSend(v11, "wait");

      }
      -[ASDTPMActionWaiter waitAction](self, "waitAction");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    while (!v14);
  }
  -[ASDTPMActionWaiter waitForActionCondition](self, "waitForActionCondition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    -[ASDTPMActionWaiter action].cold.1(self);
  -[ASDTPMActionWaiter waitAction](self, "waitAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "waitForCompletion:", -[ASDTPMActionWaiter waitTimeoutUs](self, "waitTimeoutUs"));
LABEL_8:

  return v8;
}

- (NSString)waitActionName
{
  return self->_waitActionName;
}

- (void)setWaitActionName:(id)a3
{
  objc_storeStrong((id *)&self->_waitActionName, a3);
}

- (ASDTPMAction)waitAction
{
  return (ASDTPMAction *)objc_loadWeakRetained((id *)&self->_waitAction);
}

- (void)setWaitAction:(id)a3
{
  objc_storeWeak((id *)&self->_waitAction, a3);
}

- (unsigned)waitTimeoutUs
{
  return self->_waitTimeoutUs;
}

- (void)setWaitTimeoutUs:(unsigned int)a3
{
  self->_waitTimeoutUs = a3;
}

- (NSCondition)waitForActionCondition
{
  return self->_waitForActionCondition;
}

- (void)setWaitForActionCondition:(id)a3
{
  objc_storeStrong((id *)&self->_waitForActionCondition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitForActionCondition, 0);
  objc_destroyWeak((id *)&self->_waitAction);
  objc_storeStrong((id *)&self->_waitActionName, 0);
}

- (void)initWithConfig:(void *)a1 forSequencer:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], v2, "%@: Missing device UID or action name keys, or memory allocation error", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_0_1();
}

- (void)interestNotification:(void *)a1 forDevice:.cold.1(void *a1)
{
  void *v2;
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "waitActionName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Action with name '%@' is not an ASDTPMAction!", v4, 0x16u);

  OUTLINED_FUNCTION_0_1();
}

- (void)interestNotification:(void *)a1 forDevice:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], v2, "%@: Device is not an ASDTAudioDevice!", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_0_1();
}

- (void)interestNotification:(void *)a1 forDevice:.cold.3(void *a1)
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138412290;
  v3 = v1;
  _os_log_debug_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%@: Notified.", (uint8_t *)&v2, 0xCu);

  OUTLINED_FUNCTION_0_1();
}

- (void)action
{
  void *v5;

  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v5;
  _os_log_debug_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%@: Waiting for action.", a1, 0xCu);

}

@end
