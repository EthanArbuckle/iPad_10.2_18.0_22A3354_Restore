@implementation ASDTPMAction

- (ASDTPMAction)initWithConfig:(id)a3 forSequencer:(id)a4
{
  id v6;
  ASDTPMAction *v7;
  ASDTPMAction *v8;
  id v9;
  void *v10;
  ASDTPMAction *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASDTPMAction;
  v7 = -[ASDTPMDevice initWithConfig:forSequencer:](&v13, sel_initWithConfig_forSequencer_, v6, a4);
  v8 = v7;
  if (!v7)
    goto LABEL_5;
  -[ASDTPMAction setActionState:](v7, "setActionState:", 1768189029);
  v9 = objc_alloc_init(MEMORY[0x24BDD14C8]);
  -[ASDTPMAction setCondition:](v8, "setCondition:", v9);

  -[ASDTPMAction condition](v8, "condition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTPMAction initWithConfig:forSequencer:].cold.1(v8);
    goto LABEL_10;
  }
  -[ASDTPMDevice setPmNoStateChangeOnFailure:](v8, "setPmNoStateChangeOnFailure:", 1);
  -[ASDTPMAction setExecuteTransition:](v8, "setExecuteTransition:", objc_msgSend(v6, "asdtPMActionExecuteTransition"));
  if (!-[ASDTPMAction executeTransition](v8, "executeTransition"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTPMAction initWithConfig:forSequencer:].cold.2(v8);
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  -[ASDTPMAction setBackgroundTransition:](v8, "setBackgroundTransition:", objc_msgSend(v6, "asdtPMActionBackgroundTransition"));
  -[ASDTPMAction setOnce:](v8, "setOnce:", objc_msgSend(v6, "asdtPMActionOnce"));
LABEL_5:
  v11 = v8;
LABEL_11:

  return v11;
}

- (void)setName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASDTPMAction;
  v4 = a3;
  -[ASDTPMDevice setName:](&v7, sel_setName_, v4);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s.%@.cond"), "com.apple.AudioServerDriverTransports", v4, v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ASDTPMAction condition](self, "condition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setName:", v5);

}

- (int)executeAction:(unsigned int)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  LODWORD(v5) = 2003329396;
  if (-[ASDTPMAction actionState](self, "actionState") == 1920298606
    && -[ASDTPMAction actionIteration](self, "actionIteration") == a3)
  {
    -[ASDTPMAction condition](self, "condition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unlock");

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[ASDTPMAction executeAction:].cold.2(self, a3);
    v5 = -[ASDTPMAction action](self, "action");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[ASDTPMAction executeAction:].cold.1(self, a3, v5);
    -[ASDTPMAction condition](self, "condition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lock");

    if (-[ASDTPMAction actionState](self, "actionState") == 1920298606
      && -[ASDTPMAction actionIteration](self, "actionIteration") == a3)
    {
      -[ASDTPMAction setActionResult:](self, "setActionResult:", v5);
      -[ASDTPMAction setActionState:](self, "setActionState:", 1685024357);
      -[ASDTPMAction condition](self, "condition");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "broadcast");

    }
  }
  return v5;
}

- (void)executeInBackground
{
  unsigned int v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  unsigned int v8;
  id location;

  objc_initWeak(&location, self);
  -[ASDTPMAction setActionState:](self, "setActionState:", 1920298606);
  -[ASDTPMAction setActionIteration:](self, "setActionIteration:", -[ASDTPMAction actionIteration](self, "actionIteration") + 1);
  v3 = -[ASDTPMAction actionIteration](self, "actionIteration");
  -[ASDTPMDevice parentSequencer](self, "parentSequencer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pmConcurrentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__ASDTPMAction_executeInBackground__block_invoke;
  block[3] = &unk_250841F90;
  objc_copyWeak(&v7, &location);
  v8 = v3;
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __35__ASDTPMAction_executeInBackground__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "condition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lock");

  objc_msgSend(WeakRetained, "executeAction:", *(unsigned int *)(a1 + 40));
  objc_msgSend(WeakRetained, "condition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unlock");

}

- (BOOL)asdtHandlesPowerTransition:(int)a3
{
  int v5;

  if (-[ASDTPMAction executeTransition](self, "executeTransition") == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = -[ASDTPMAction backgroundTransition](self, "backgroundTransition");
    if (v5)
      LOBYTE(v5) = -[ASDTPMAction backgroundTransition](self, "backgroundTransition") == a3;
  }
  return v5;
}

- (int)asdtPowerStateChange:(int)a3
{
  void *v5;
  int v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  void *v11;

  if (-[ASDTPMAction backgroundTransition](self, "backgroundTransition"))
  {
    -[ASDTPMAction condition](self, "condition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lock");

    v6 = -[ASDTPMAction actionState](self, "actionState");
    if (v6 != 1685024357)
    {
      if (v6 != 1920298606)
      {
        if (v6 != 1768189029 || -[ASDTPMAction backgroundTransition](self, "backgroundTransition") != a3)
          goto LABEL_28;
        goto LABEL_27;
      }
      if (-[ASDTPMAction executeTransition](self, "executeTransition") != a3)
      {
        if ((asdtPowerTransitionsInOrder(a3, -[ASDTPMAction executeTransition](self, "executeTransition")) & 1) == 0)
          -[ASDTPMAction setActionState:](self, "setActionState:", 1768189029);
        goto LABEL_28;
      }
      while (-[ASDTPMAction actionState](self, "actionState") == 1920298606)
      {
        -[ASDTPMAction condition](self, "condition");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "wait");

      }
      if (-[ASDTPMAction actionState](self, "actionState") != 1685024357)
      {
        v9 = 1852990585;
        goto LABEL_29;
      }
    }
    if (-[ASDTPMAction executeTransition](self, "executeTransition") != a3)
    {
      if (-[ASDTPMAction backgroundTransition](self, "backgroundTransition") != a3
        || -[ASDTPMAction once](self, "once") && !-[ASDTPMAction actionResult](self, "actionResult"))
      {
        goto LABEL_28;
      }
LABEL_27:
      -[ASDTPMAction executeInBackground](self, "executeInBackground");
LABEL_28:
      v9 = 0;
      goto LABEL_29;
    }
    goto LABEL_22;
  }
  if (-[ASDTPMAction executeTransition](self, "executeTransition") == a3)
  {
    -[ASDTPMAction condition](self, "condition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lock");

    if (-[ASDTPMAction actionState](self, "actionState") == 1768189029
      || -[ASDTPMAction actionState](self, "actionState") == 1685024357
      && (!-[ASDTPMAction once](self, "once") || -[ASDTPMAction actionResult](self, "actionResult")))
    {
      -[ASDTPMAction setActionState:](self, "setActionState:", 1920298606);
      -[ASDTPMAction setActionIteration:](self, "setActionIteration:", -[ASDTPMAction actionIteration](self, "actionIteration") + 1);
      v8 = -[ASDTPMAction executeAction:](self, "executeAction:", -[ASDTPMAction actionIteration](self, "actionIteration"));
LABEL_23:
      v9 = v8;
LABEL_29:
      -[ASDTPMAction condition](self, "condition");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "unlock");

      return v9;
    }
LABEL_22:
    v8 = -[ASDTPMAction actionResult](self, "actionResult");
    goto LABEL_23;
  }
  return 0;
}

- (int)waitForCompletion:(unsigned int)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  uint8_t v13[4];
  _DWORD v14[7];

  *(_QWORD *)&v14[5] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", (double)a3 / 1000000.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[ASDTPMAction condition](self, "condition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  if (-[ASDTPMAction actionState](self, "actionState") == 1685024357)
  {
LABEL_5:
    v6 = -[ASDTPMAction actionResult](self, "actionResult");
    goto LABEL_6;
  }
  v9 = MEMORY[0x24BDACB70];
  while (1)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[ASDTPMAction waitForCompletion:].cold.2(v13, self, v14);
    -[ASDTPMAction condition](self, "condition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v4)
    {
      objc_msgSend(v10, "wait");

      goto LABEL_16;
    }
    v12 = objc_msgSend(v10, "waitUntilDate:", v4);

    if ((v12 & 1) == 0)
      break;
LABEL_16:
    if (-[ASDTPMAction actionState](self, "actionState") == 1685024357)
      goto LABEL_5;
  }
  v6 = 1852990585;
LABEL_6:
  -[ASDTPMAction condition](self, "condition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    -[ASDTPMAction waitForCompletion:].cold.1(self, v6);

  return v6;
}

- (int)action
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[ASDTPMAction action].cold.1(self);
  return 2003329396;
}

- (int)executeTransition
{
  return self->_executeTransition;
}

- (void)setExecuteTransition:(int)a3
{
  self->_executeTransition = a3;
}

- (int)backgroundTransition
{
  return self->_backgroundTransition;
}

- (void)setBackgroundTransition:(int)a3
{
  self->_backgroundTransition = a3;
}

- (BOOL)once
{
  return self->_once;
}

- (void)setOnce:(BOOL)a3
{
  self->_once = a3;
}

- (NSCondition)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
  objc_storeStrong((id *)&self->_condition, a3);
}

- (int)actionState
{
  return self->_actionState;
}

- (void)setActionState:(int)a3
{
  self->_actionState = a3;
}

- (int)actionResult
{
  return self->_actionResult;
}

- (void)setActionResult:(int)a3
{
  self->_actionResult = a3;
}

- (unsigned)actionIteration
{
  return self->_actionIteration;
}

- (void)setActionIteration:(unsigned int)a3
{
  self->_actionIteration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_condition, 0);
}

- (void)initWithConfig:(void *)a1 forSequencer:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], v2, "%@: Memory allocation error.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_1();
}

- (void)initWithConfig:(void *)a1 forSequencer:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint8_t v3[12];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  v4 = 2112;
  v5 = v2;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Bad or missing %@ key.", v3, 0x16u);

  OUTLINED_FUNCTION_0_1();
}

- (void)executeAction:(int)a3 .cold.1(void *a1, int a2, int a3)
{
  void *v5;
  __int16 v6;
  uint8_t v7[14];
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  v8 = a2;
  v9 = v6;
  v10 = a3;
  _os_log_debug_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%@: Action iteration %u completed with result: %x", v7, 0x18u);

}

- (void)executeAction:(void *)a1 .cold.2(void *a1, int a2)
{
  void *v3;
  uint8_t v4[14];
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  v5 = a2;
  _os_log_debug_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%@: Running action, iteration: %u", v4, 0x12u);

  OUTLINED_FUNCTION_0_1();
}

- (void)waitForCompletion:(void *)a1 .cold.1(void *a1, int a2)
{
  void *v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint8_t v8[12];
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  v7 = BYTE1(a2);
  if (BYTE1(a2) - 32 >= 0x5F)
    v7 = v4;
  v9 = 1024;
  v10 = a2;
  v11 = 1024;
  v12 = v5;
  v13 = 1024;
  v14 = v6;
  v15 = 1024;
  v16 = v7;
  if (a2 - 32 < 0x5F)
    v4 = a2;
  v17 = 1024;
  v18 = v4;
  _os_log_debug_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%@: Wait done; result %x '%c%c%c%c'.",
    v8,
    0x2Au);

}

- (void)waitForCompletion:(_QWORD *)a3 .cold.2(uint8_t *a1, void *a2, _QWORD *a3)
{
  void *v5;

  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v5;
  _os_log_debug_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%@: Waiting for completion.", a1, 0xCu);

}

- (void)action
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], v2, "%@: Subclass must override the action method.", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_1();
}

@end
