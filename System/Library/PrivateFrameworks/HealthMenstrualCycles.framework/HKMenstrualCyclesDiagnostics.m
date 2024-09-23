@implementation HKMenstrualCyclesDiagnostics

- (HKMenstrualCyclesDiagnostics)initWithHealthStore:(id)a3
{
  id v5;
  HKMenstrualCyclesDiagnostics *v6;
  HKMenstrualCyclesDiagnostics *v7;
  id v8;
  void *v9;
  uint64_t v10;
  HKTaskServerProxyProvider *proxyProvider;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKMenstrualCyclesDiagnostics;
  v6 = -[HKMenstrualCyclesDiagnostics init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v8 = objc_alloc(MEMORY[0x24BDD4038]);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v5, CFSTR("HKMCDiagnosticsServer"), v7, v9);
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v10;

    -[HKTaskServerProxyProvider setShouldRetryOnInterruption:](v7->_proxyProvider, "setShouldRetryOnInterruption:", 0);
  }

  return v7;
}

- (void)triggerAnalysisForDiagnosticsWithCompletion:(id)a3
{
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  -[HKMenstrualCyclesDiagnostics _actionCompletionOnClientQueue:](self, "_actionCompletionOnClientQueue:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __76__HKMenstrualCyclesDiagnostics_triggerAnalysisForDiagnosticsWithCompletion___block_invoke;
  v10[3] = &unk_24D99D630;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __76__HKMenstrualCyclesDiagnostics_triggerAnalysisForDiagnosticsWithCompletion___block_invoke_2;
  v8[3] = &unk_24D99D658;
  v9 = v11;
  v7 = v11;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __76__HKMenstrualCyclesDiagnostics_triggerAnalysisForDiagnosticsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_triggerAnalysisForDiagnosticsWithCompletion:", *(_QWORD *)(a1 + 32));
}

uint64_t __76__HKMenstrualCyclesDiagnostics_triggerAnalysisForDiagnosticsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_actionCompletionOnClientQueue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __63__HKMenstrualCyclesDiagnostics__actionCompletionOnClientQueue___block_invoke;
  v8[3] = &unk_24D99D6A8;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  v6 = (void *)objc_msgSend(v8, "copy");

  return v6;
}

void __63__HKMenstrualCyclesDiagnostics__actionCompletionOnClientQueue___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__HKMenstrualCyclesDiagnostics__actionCompletionOnClientQueue___block_invoke_2;
  block[3] = &unk_24D99D680;
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __63__HKMenstrualCyclesDiagnostics__actionCompletionOnClientQueue___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

@end
