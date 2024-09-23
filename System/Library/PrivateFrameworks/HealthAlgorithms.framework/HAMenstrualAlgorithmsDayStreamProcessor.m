@implementation HAMenstrualAlgorithmsDayStreamProcessor

- (HAMenstrualAlgorithmsDayStreamProcessor)initWithConfig:(id)a3
{
  id v4;
  NSObject *v5;
  HAMenstrualAlgorithmsDayStreamProcessor *v6;
  uint64_t v7;
  NSMutableArray *dayInputBuffer;
  uint64_t v9;
  NSXPCConnection *connectionToService;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  HADayStreamProcessorServiceProtocol *remoteObjectProxy;
  void *v19;
  HAMenstrualAlgorithmsDayStreamProcessor *v20;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  objc_super v26;
  _QWORD v27[3];
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ha_get_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v29 = "-[HAMenstrualAlgorithmsDayStreamProcessor initWithConfig:]";
    _os_log_impl(&dword_216C97000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  v26.receiver = self;
  v26.super_class = (Class)HAMenstrualAlgorithmsDayStreamProcessor;
  v6 = -[HAMenstrualAlgorithmsDayStreamProcessor init](&v26, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 100);
    dayInputBuffer = v6->_dayInputBuffer;
    v6->_dayInputBuffer = (NSMutableArray *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.HealthAlgorithms.DayStreamProcessorService"));
    connectionToService = v6->_connectionToService;
    v6->_connectionToService = (NSXPCConnection *)v9;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E520F0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6->_connectionToService, "setRemoteObjectInterface:", v11);

    v12 = (void *)MEMORY[0x24BDBCF20];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v27[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSXPCConnection remoteObjectInterface](v6->_connectionToService, "remoteObjectInterface");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_finishSessionWithMostRecentMenstrualFlowJulianDayUpdated_withReply_, 0, 1);

    objc_initWeak((id *)buf, v6);
    v16 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __58__HAMenstrualAlgorithmsDayStreamProcessor_initWithConfig___block_invoke;
    v24[3] = &unk_24D60BAA8;
    objc_copyWeak(&v25, (id *)buf);
    -[NSXPCConnection setInvalidationHandler:](v6->_connectionToService, "setInvalidationHandler:", v24);
    v22[0] = v16;
    v22[1] = 3221225472;
    v22[2] = __58__HAMenstrualAlgorithmsDayStreamProcessor_initWithConfig___block_invoke_426;
    v22[3] = &unk_24D60BAA8;
    objc_copyWeak(&v23, (id *)buf);
    -[NSXPCConnection setInterruptionHandler:](v6->_connectionToService, "setInterruptionHandler:", v22);
    -[NSXPCConnection resume](v6->_connectionToService, "resume");
    -[NSXPCConnection remoteObjectProxy](v6->_connectionToService, "remoteObjectProxy");
    v17 = objc_claimAutoreleasedReturnValue();
    remoteObjectProxy = v6->_remoteObjectProxy;
    v6->_remoteObjectProxy = (HADayStreamProcessorServiceProtocol *)v17;

    -[HAMenstrualAlgorithmsDayStreamProcessor remoteObjectProxy](v6, "remoteObjectProxy");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "beginSessionWithConfig:", v4);

    v20 = v6;
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);

  }
  return v6;
}

+ (unsigned)algorithmVersion
{
  return 2;
}

void __58__HAMenstrualAlgorithmsDayStreamProcessor_initWithConfig___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  ha_get_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_216C97000, v2, OS_LOG_TYPE_DEFAULT, "DayStreamProcessorService connection invalidated", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setConnectionToService:", 0);

}

void __58__HAMenstrualAlgorithmsDayStreamProcessor_initWithConfig___block_invoke_426(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;

  ha_get_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __58__HAMenstrualAlgorithmsDayStreamProcessor_initWithConfig___block_invoke_426_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connectionToService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  ha_get_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v7 = "-[HAMenstrualAlgorithmsDayStreamProcessor dealloc]";
    _os_log_impl(&dword_216C97000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  -[HAMenstrualAlgorithmsDayStreamProcessor connectionToService](self, "connectionToService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  v5.receiver = self;
  v5.super_class = (Class)HAMenstrualAlgorithmsDayStreamProcessor;
  -[HAMenstrualAlgorithmsDayStreamProcessor dealloc](&v5, sel_dealloc);
}

- (void)appendDay:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[HAMenstrualAlgorithmsDayStreamProcessor dayInputBuffer](self, "dayInputBuffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v10);

  -[HAMenstrualAlgorithmsDayStreamProcessor dayInputBuffer](self, "dayInputBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == 100)
  {
    -[HAMenstrualAlgorithmsDayStreamProcessor remoteObjectProxy](self, "remoteObjectProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAMenstrualAlgorithmsDayStreamProcessor dayInputBuffer](self, "dayInputBuffer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendDays:", v8);

    -[HAMenstrualAlgorithmsDayStreamProcessor dayInputBuffer](self, "dayInputBuffer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeAllObjects");

  }
}

- (void)beginPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  -[HAMenstrualAlgorithmsDayStreamProcessor remoteObjectProxy](self, "remoteObjectProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginPhase:onJulianDay:", v5, v4);

}

- (void)endPhase:(unsigned __int8)a3 onJulianDay:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  -[HAMenstrualAlgorithmsDayStreamProcessor remoteObjectProxy](self, "remoteObjectProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endPhase:onJulianDay:", v5, v4);

}

- (id)analyzeWithMostRecentMenstrualFlowJulianDayUpdated:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  NSObject *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[5];
  __int128 buf;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;

  v5 = *(_QWORD *)&a3;
  v27 = *MEMORY[0x24BDAC8D0];
  ha_get_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = "-[HAMenstrualAlgorithmsDayStreamProcessor analyzeWithMostRecentMenstrualFlowJulianDa"
                                    "yUpdated:error:]";
    _os_log_impl(&dword_216C97000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  -[HAMenstrualAlgorithmsDayStreamProcessor dayInputBuffer](self, "dayInputBuffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count") == 0;

  if (!v9)
  {
    -[HAMenstrualAlgorithmsDayStreamProcessor remoteObjectProxy](self, "remoteObjectProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAMenstrualAlgorithmsDayStreamProcessor dayInputBuffer](self, "dayInputBuffer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendDays:", v11);

    -[HAMenstrualAlgorithmsDayStreamProcessor dayInputBuffer](self, "dayInputBuffer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAllObjects");

  }
  -[HAMenstrualAlgorithmsDayStreamProcessor connectionToService](self, "connectionToService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __100__HAMenstrualAlgorithmsDayStreamProcessor_analyzeWithMostRecentMenstrualFlowJulianDayUpdated_error___block_invoke_430;
  v21[3] = &unk_24D60BB10;
  v21[4] = &buf;
  objc_msgSend(v14, "finishSessionWithMostRecentMenstrualFlowJulianDayUpdated:withReply:", v5, v21);
  if (!*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    ha_get_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[HAMenstrualAlgorithmsDayStreamProcessor analyzeWithMostRecentMenstrualFlowJulianDayUpdated:error:].cold.1();

    if (a4)
    {
      v16 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v18, -1, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v19 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v19;
}

void __100__HAMenstrualAlgorithmsDayStreamProcessor_analyzeWithMostRecentMenstrualFlowJulianDayUpdated_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  ha_get_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __100__HAMenstrualAlgorithmsDayStreamProcessor_analyzeWithMostRecentMenstrualFlowJulianDayUpdated_error___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void __100__HAMenstrualAlgorithmsDayStreamProcessor_analyzeWithMostRecentMenstrualFlowJulianDayUpdated_error___block_invoke_430(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (NSMutableArray)dayInputBuffer
{
  return self->_dayInputBuffer;
}

- (void)setDayInputBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_dayInputBuffer, a3);
}

- (NSXPCConnection)connectionToService
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnectionToService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (HADayStreamProcessorServiceProtocol)remoteObjectProxy
{
  return (HADayStreamProcessorServiceProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRemoteObjectProxy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteObjectProxy, 0);
  objc_storeStrong((id *)&self->_connectionToService, 0);
  objc_storeStrong((id *)&self->_dayInputBuffer, 0);
}

void __58__HAMenstrualAlgorithmsDayStreamProcessor_initWithConfig___block_invoke_426_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_216C97000, v0, v1, "DayStreamProcessorService connection interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_2();
}

- (void)analyzeWithMostRecentMenstrualFlowJulianDayUpdated:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_216C97000, v0, v1, "failed to retrieve day stream processor analysis", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_2();
}

void __100__HAMenstrualAlgorithmsDayStreamProcessor_analyzeWithMostRecentMenstrualFlowJulianDayUpdated_error___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_216C97000, a2, a3, "%{public}@", a5, a6, a7, a8, 2u);
}

@end
