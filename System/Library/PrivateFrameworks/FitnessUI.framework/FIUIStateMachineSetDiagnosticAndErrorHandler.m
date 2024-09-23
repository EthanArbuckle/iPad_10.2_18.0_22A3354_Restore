@implementation FIUIStateMachineSetDiagnosticAndErrorHandler

void __FIUIStateMachineSetDiagnosticAndErrorHandler_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  _HKInitializeLogging();
  v10 = (void *)*MEMORY[0x24BDD3078];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    objc_msgSend(v7, "label");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "label");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "label");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 32);
    v17 = 138413314;
    v18 = v12;
    v19 = 2112;
    v20 = v13;
    v21 = 2112;
    v22 = v14;
    v23 = 2112;
    v24 = v15;
    v25 = 2112;
    v26 = v16;
    _os_log_impl(&dword_21307C000, v11, OS_LOG_TYPE_DEFAULT, "%@: %@ ! %@ -> %@ %@", (uint8_t *)&v17, 0x34u);

  }
}

void __FIUIStateMachineSetDiagnosticAndErrorHandler_block_invoke_184(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x24BDD3078];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    objc_msgSend(v5, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = 138413058;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_21307C000, v8, OS_LOG_TYPE_DEFAULT, "%@: Invalid event %@ for state %@ %@", (uint8_t *)&v13, 0x2Au);

  }
}

@end
