@implementation ACCPlatformProcessAssertion

- (ACCPlatformProcessAssertion)initWithBundleIdentifier:(id)a3 processAssertionName:(id)a4 rbsAttributes:(id)a5 pid:(int)a6
{
  uint64_t v6;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  int v16;
  id v17;
  BOOL v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  dispatch_source_t v23;
  void *v24;
  id v25;
  id v27;
  objc_super v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v6 = *(_QWORD *)&a6;
  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (void *)MEMORY[0x24BE80D38];
  v12 = a5;
  v13 = a4;
  objc_msgSend(v11, "targetWithPid:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28.receiver = self;
  v28.super_class = (Class)ACCPlatformProcessAssertion;
  v15 = -[ACCPlatformProcessAssertion initWithExplanation:target:attributes:](&v28, sel_initWithExplanation_target_attributes_, v13, v14, v12);

  v27 = 0;
  v16 = objc_msgSend(v15, "acquireWithError:", &v27);
  v17 = v27;
  if (gLogObjects)
    v18 = gNumLogObjects <= 0;
  else
    v18 = 1;
  v19 = !v18;
  if (v16)
  {
    if (v19)
    {
      v20 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.1();
      v20 = MEMORY[0x24BDACB70];
      v22 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v15;
      v31 = 2112;
      v32 = v10;
      _os_log_impl(&dword_218A89000, v20, OS_LOG_TYPE_DEFAULT, "Acquired EA application assertion: %@ for: %@", buf, 0x16u);
    }

    *((_QWORD *)v15 + 8) = time(0);
    v23 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
    v24 = (void *)*((_QWORD *)v15 + 9);
    *((_QWORD *)v15 + 9) = v23;

    dispatch_source_set_event_handler(*((dispatch_source_t *)v15 + 9), &__block_literal_global);
    dispatch_source_set_timer(*((dispatch_source_t *)v15 + 9), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume(*((dispatch_object_t *)v15 + 9));
  }
  else
  {
    if (v19)
    {
      v21 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.1();
      v21 = MEMORY[0x24BDACB70];
      v25 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[ACCPlatformProcessAssertion initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:].cold.2();

    v15 = 0;
  }

  return (ACCPlatformProcessAssertion *)v15;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;

  -[ACCPlatformProcessAssertion setStartTime:](self, "setStartTime:", 0);
  -[ACCPlatformProcessAssertion invalidate](self, "invalidate");
  -[ACCPlatformProcessAssertion processAssertionTimer](self, "processAssertionTimer");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_source_cancel(v3);

  -[ACCPlatformProcessAssertion setProcessAssertionTimer:](self, "setProcessAssertionTimer:", 0);
  v4.receiver = self;
  v4.super_class = (Class)ACCPlatformProcessAssertion;
  -[ACCPlatformProcessAssertion dealloc](&v4, sel_dealloc);
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(unint64_t)a3
{
  self->_startTime = a3;
}

- (OS_dispatch_source)processAssertionTimer
{
  return self->_processAssertionTimer;
}

- (void)setProcessAssertionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_processAssertionTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processAssertionTimer, 0);
}

- (void)initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_218A89000, MEMORY[0x24BDACB70], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)initWithBundleIdentifier:processAssertionName:rbsAttributes:pid:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_218A89000, v0, v1, "Error acquiring app on wake jetsam assertion: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
