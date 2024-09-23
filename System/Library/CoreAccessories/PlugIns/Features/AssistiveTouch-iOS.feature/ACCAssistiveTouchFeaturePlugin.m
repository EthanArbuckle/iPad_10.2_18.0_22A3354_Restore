@implementation ACCAssistiveTouchFeaturePlugin

- (NSString)pluginName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  const char *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ACCAssistiveTouchFeaturePlugin pluginName](self, "pluginName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = obfuscatedPointer((uint64_t)self);
  v6 = -[ACCAssistiveTouchFeaturePlugin isRunning](self, "isRunning");
  v7 = "NO";
  if (v6)
    v7 = "YES";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> isRunning: %s"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)initPlugin
{
  ACCAssistiveTouchProvider *assistiveTouchProvider;

  init_logging();
  assistiveTouchProvider = self->_assistiveTouchProvider;
  self->_assistiveTouchProvider = 0;

  -[ACCAssistiveTouchFeaturePlugin setIsRunning:](self, "setIsRunning:", 0);
}

- (void)startPlugin
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21A857000, MEMORY[0x24BDACB70], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)stopPlugin
{
  BOOL v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  void *v8;
  ACCAssistiveTouchProvider *assistiveTouchProvider;
  OS_dispatch_queue *assistiveTouchQueue;
  uint8_t v11[16];
  uint8_t buf[16];

  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCAssistiveTouchFeaturePlugin startPlugin].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A857000, v5, OS_LOG_TYPE_DEFAULT, "Stopping AssistiveTouch feature plugin...", buf, 2u);
  }

  -[ACCAssistiveTouchFeaturePlugin setIsRunning:](self, "setIsRunning:", 0);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCAssistiveTouchFeaturePlugin startPlugin].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_21A857000, v6, OS_LOG_TYPE_INFO, "assistiveTouch Removing all observers...", v11, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:", self);

  assistiveTouchProvider = self->_assistiveTouchProvider;
  self->_assistiveTouchProvider = 0;

  assistiveTouchQueue = self->_assistiveTouchQueue;
  self->_assistiveTouchQueue = 0;

}

- (void)assistiveTouch:(id)a3 setEnabled:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  _DWORD v10[2];
  uint64_t v11;

  v4 = a4;
  v11 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (gLogObjects)
    v7 = gNumLogObjects < 1;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCAssistiveTouchFeaturePlugin startPlugin].cold.1();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10[0] = 67109120;
    v10[1] = v4;
    _os_log_impl(&dword_21A857000, v9, OS_LOG_TYPE_INFO, "assistiveTouchSetEnabled: enable=%d", (uint8_t *)v10, 8u);
  }

  if (v4)
    -[ACCAssistiveTouchFeaturePlugin _startAssistiveTouch:](self, "_startAssistiveTouch:", v6);
  else
    -[ACCAssistiveTouchFeaturePlugin _stopAssistiveTouch:](self, "_stopAssistiveTouch:", v6);

}

- (void)_assistiveTouchToggled:(id)a3
{
  NSObject *assistiveTouchQueue;
  _QWORD block[5];

  assistiveTouchQueue = self->_assistiveTouchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__ACCAssistiveTouchFeaturePlugin__assistiveTouchToggled___block_invoke;
  block[3] = &unk_24DD2EC38;
  block[4] = self;
  dispatch_async(assistiveTouchQueue, block);
}

uint64_t __57__ACCAssistiveTouchFeaturePlugin__assistiveTouchToggled___block_invoke(uint64_t a1)
{
  int v2;
  BOOL v3;
  id v4;
  NSObject *v5;

  v2 = _AXSAssistiveTouchEnabled();
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCAssistiveTouchFeaturePlugin startPlugin].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __57__ACCAssistiveTouchFeaturePlugin__assistiveTouchToggled___block_invoke_cold_1(v2 != 0, v5);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "notifyAssistiveTouchEnabledState:", v2 != 0);
}

- (void)_startAssistiveTouch:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_assistiveTouchQueue, &__block_literal_global);
}

void __55__ACCAssistiveTouchFeaturePlugin__startAssistiveTouch___block_invoke()
{
  int v0;
  BOOL v1;
  int v2;
  NSObject *v3;
  NSObject *v4;
  id v5;
  id v6;

  v0 = _AXSAssistiveTouchHardwareEnabled();
  if (gLogObjects)
    v1 = gNumLogObjects <= 0;
  else
    v1 = 1;
  v2 = !v1;
  if (v0)
  {
    if (v2)
    {
      v3 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCAssistiveTouchFeaturePlugin startPlugin].cold.1();
      v3 = MEMORY[0x24BDACB70];
      v5 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __55__ACCAssistiveTouchFeaturePlugin__startAssistiveTouch___block_invoke_cold_3();

  }
  else
  {
    if (v2)
    {
      v4 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCAssistiveTouchFeaturePlugin startPlugin].cold.1();
      v4 = MEMORY[0x24BDACB70];
      v6 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __55__ACCAssistiveTouchFeaturePlugin__startAssistiveTouch___block_invoke_cold_1();

    _AXSAssistiveTouchSetHardwareEnabled();
  }
}

- (void)_stopAssistiveTouch:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_assistiveTouchQueue, &__block_literal_global_7);
}

void __54__ACCAssistiveTouchFeaturePlugin__stopAssistiveTouch___block_invoke()
{
  int v0;
  BOOL v1;
  int v2;
  NSObject *v3;
  NSObject *v4;
  id v5;
  id v6;

  v0 = _AXSAssistiveTouchHardwareEnabled();
  if (gLogObjects)
    v1 = gNumLogObjects <= 0;
  else
    v1 = 1;
  v2 = !v1;
  if (v0)
  {
    if (v2)
    {
      v3 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCAssistiveTouchFeaturePlugin startPlugin].cold.1();
      v3 = MEMORY[0x24BDACB70];
      v5 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __54__ACCAssistiveTouchFeaturePlugin__stopAssistiveTouch___block_invoke_cold_3();

    _AXSAssistiveTouchSetHardwareEnabled();
  }
  else
  {
    if (v2)
    {
      v4 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCAssistiveTouchFeaturePlugin startPlugin].cold.1();
      v4 = MEMORY[0x24BDACB70];
      v6 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __54__ACCAssistiveTouchFeaturePlugin__stopAssistiveTouch___block_invoke_cold_1();

  }
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (ACCAssistiveTouchProvider)assistiveTouchProvider
{
  return (ACCAssistiveTouchProvider *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAssistiveTouchProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)assistiveTouchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAssistiveTouchQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistiveTouchQueue, 0);
  objc_storeStrong((id *)&self->_assistiveTouchProvider, 0);
}

void __57__ACCAssistiveTouchFeaturePlugin__assistiveTouchToggled___block_invoke_cold_1(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_21A857000, a2, OS_LOG_TYPE_DEBUG, "assistiveTouch notifyEnabledState: enabled=%d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_4();
}

void __55__ACCAssistiveTouchFeaturePlugin__startAssistiveTouch___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_21A857000, v0, v1, "assistiveTouch _AXSAssistiveTouchSetHardwareEnabled(true)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __55__ACCAssistiveTouchFeaturePlugin__startAssistiveTouch___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_21A857000, v0, v1, "assistiveTouchHardware already enabled!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __54__ACCAssistiveTouchFeaturePlugin__stopAssistiveTouch___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_21A857000, v0, v1, "assistiveTouchHardware already disabled!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __54__ACCAssistiveTouchFeaturePlugin__stopAssistiveTouch___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_21A857000, v0, v1, "assistiveTouch _AXSAssistiveTouchSetHardwareEnabled(false)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
