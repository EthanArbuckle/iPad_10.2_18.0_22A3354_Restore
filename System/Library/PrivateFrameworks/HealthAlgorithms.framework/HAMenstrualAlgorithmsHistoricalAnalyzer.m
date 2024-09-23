@implementation HAMenstrualAlgorithmsHistoricalAnalyzer

- (HAMenstrualAlgorithmsHistoricalAnalyzer)init
{
  NSObject *v3;
  HAMenstrualAlgorithmsHistoricalAnalyzer *v4;
  uint64_t v5;
  NSMutableArray *dayInputBuffer;
  uint64_t v7;
  NSXPCConnection *connectionToService;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  HAHistoricalAnalyzerServiceProtocol *remoteObjectProxy;
  void *v17;
  HAMenstrualAlgorithmsHistoricalAnalyzer *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  objc_super v27;
  _QWORD v28[2];
  uint8_t buf[4];
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  ha_get_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v30 = "-[HAMenstrualAlgorithmsHistoricalAnalyzer init]";
    _os_log_impl(&dword_216C97000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  v27.receiver = self;
  v27.super_class = (Class)HAMenstrualAlgorithmsHistoricalAnalyzer;
  v4 = -[HAMenstrualAlgorithmsHistoricalAnalyzer init](&v27, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 100);
    dayInputBuffer = v4->_dayInputBuffer;
    v4->_dayInputBuffer = (NSMutableArray *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.HealthAlgorithms.HistoricalAnalyzerService"));
    connectionToService = v4->_connectionToService;
    v4->_connectionToService = (NSXPCConnection *)v7;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E52150);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v4->_connectionToService, "setRemoteObjectInterface:", v9);

    v10 = (void *)MEMORY[0x24BDBCF20];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSXPCConnection remoteObjectInterface](v4->_connectionToService, "remoteObjectInterface");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_finishSessionWithReply_, 0, 1);

    objc_initWeak((id *)buf, v4);
    v14 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __47__HAMenstrualAlgorithmsHistoricalAnalyzer_init__block_invoke;
    v25[3] = &unk_24D60BAA8;
    objc_copyWeak(&v26, (id *)buf);
    -[NSXPCConnection setInvalidationHandler:](v4->_connectionToService, "setInvalidationHandler:", v25);
    v20 = v14;
    v21 = 3221225472;
    v22 = __47__HAMenstrualAlgorithmsHistoricalAnalyzer_init__block_invoke_522;
    v23 = &unk_24D60BAA8;
    objc_copyWeak(&v24, (id *)buf);
    -[NSXPCConnection setInterruptionHandler:](v4->_connectionToService, "setInterruptionHandler:", &v20);
    -[NSXPCConnection resume](v4->_connectionToService, "resume", v20, v21, v22, v23);
    -[NSXPCConnection remoteObjectProxy](v4->_connectionToService, "remoteObjectProxy");
    v15 = objc_claimAutoreleasedReturnValue();
    remoteObjectProxy = v4->_remoteObjectProxy;
    v4->_remoteObjectProxy = (HAHistoricalAnalyzerServiceProtocol *)v15;

    -[HAMenstrualAlgorithmsHistoricalAnalyzer remoteObjectProxy](v4, "remoteObjectProxy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "beginSession");

    v18 = v4;
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);

  }
  return v4;
}

- (HAHistoricalAnalyzerServiceProtocol)remoteObjectProxy
{
  return (HAHistoricalAnalyzerServiceProtocol *)objc_getProperty(self, a2, 24, 1);
}

+ (unsigned)algorithmVersion
{
  return 2;
}

void __47__HAMenstrualAlgorithmsHistoricalAnalyzer_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  ha_get_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_216C97000, v2, OS_LOG_TYPE_DEFAULT, "HistoricalAnalyzerService connection invalidated", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setConnectionToService:", 0);

}

void __47__HAMenstrualAlgorithmsHistoricalAnalyzer_init__block_invoke_522(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;

  ha_get_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __47__HAMenstrualAlgorithmsHistoricalAnalyzer_init__block_invoke_522_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connectionToService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HAMenstrualAlgorithmsHistoricalAnalyzer connectionToService](self, "connectionToService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)HAMenstrualAlgorithmsHistoricalAnalyzer;
  -[HAMenstrualAlgorithmsHistoricalAnalyzer dealloc](&v4, sel_dealloc);
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
  -[HAMenstrualAlgorithmsHistoricalAnalyzer dayInputBuffer](self, "dayInputBuffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v10);

  -[HAMenstrualAlgorithmsHistoricalAnalyzer dayInputBuffer](self, "dayInputBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == 100)
  {
    -[HAMenstrualAlgorithmsHistoricalAnalyzer remoteObjectProxy](self, "remoteObjectProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAMenstrualAlgorithmsHistoricalAnalyzer dayInputBuffer](self, "dayInputBuffer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendDays:", v8);

    -[HAMenstrualAlgorithmsHistoricalAnalyzer dayInputBuffer](self, "dayInputBuffer");
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
  -[HAMenstrualAlgorithmsHistoricalAnalyzer remoteObjectProxy](self, "remoteObjectProxy");
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
  -[HAMenstrualAlgorithmsHistoricalAnalyzer remoteObjectProxy](self, "remoteObjectProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endPhase:onJulianDay:", v5, v4);

}

- (id)analyzeWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  __int128 buf;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  ha_get_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = "-[HAMenstrualAlgorithmsHistoricalAnalyzer analyzeWithError:]";
    _os_log_impl(&dword_216C97000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  -[HAMenstrualAlgorithmsHistoricalAnalyzer dayInputBuffer](self, "dayInputBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") == 0;

  if (!v7)
  {
    -[HAMenstrualAlgorithmsHistoricalAnalyzer remoteObjectProxy](self, "remoteObjectProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAMenstrualAlgorithmsHistoricalAnalyzer dayInputBuffer](self, "dayInputBuffer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendDays:", v9);

    -[HAMenstrualAlgorithmsHistoricalAnalyzer dayInputBuffer](self, "dayInputBuffer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeAllObjects");

  }
  -[HAMenstrualAlgorithmsHistoricalAnalyzer connectionToService](self, "connectionToService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_523);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __60__HAMenstrualAlgorithmsHistoricalAnalyzer_analyzeWithError___block_invoke_524;
  v19[3] = &unk_24D60BB58;
  v19[4] = &buf;
  objc_msgSend(v12, "finishSessionWithReply:", v19);
  if (!*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    ha_get_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[HAMenstrualAlgorithmsHistoricalAnalyzer analyzeWithError:].cold.1();

    if (a3)
    {
      v14 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v16, -1, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v17 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v17;
}

void __60__HAMenstrualAlgorithmsHistoricalAnalyzer_analyzeWithError___block_invoke(uint64_t a1, void *a2)
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

void __60__HAMenstrualAlgorithmsHistoricalAnalyzer_analyzeWithError___block_invoke_524(uint64_t a1, void *a2)
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

void __47__HAMenstrualAlgorithmsHistoricalAnalyzer_init__block_invoke_522_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_216C97000, v0, v1, "HistoricalAnalyzerService connection interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_2();
}

- (void)analyzeWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_216C97000, v0, v1, "failed to retrieve cycles from historical analyzer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_2();
}

@end
