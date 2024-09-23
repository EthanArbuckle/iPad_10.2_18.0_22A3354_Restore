@implementation MXMProxyServiceManager

+ (MXMProxyServiceManager)shared
{
  id v2;
  id v3;
  void *v4;

  v2 = (id)_shared;
  objc_sync_enter(v2);
  if (!_shared)
  {
    v3 = -[MXMProxyServiceManager initInternal]([MXMProxyServiceManager alloc], "initInternal");
    v4 = (void *)_shared;
    _shared = (uint64_t)v3;

  }
  objc_sync_exit(v2);

  return (MXMProxyServiceManager *)(id)_shared;
}

- (id)initInternal
{
  MXMProxyServiceManager *v2;
  uint64_t v3;
  NSXPCConnection *serviceConnection;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MXMProxyServiceManager;
  v2 = -[MXMProxyServiceManager init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.metricmeasurement.MetricMeasurementHelper"));
    serviceConnection = v2->__serviceConnection;
    v2->__serviceConnection = (NSXPCConnection *)v3;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D7E390);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->__serviceConnection, "setRemoteObjectInterface:", v5);

    -[NSXPCConnection resume](v2->__serviceConnection, "resume");
  }
  return v2;
}

- (MetricMeasurementHelperProtocol_Internal)_proxyObject
{
  void *v2;
  void *v3;

  -[MXMProxyServiceManager _serviceConnection](self, "_serviceConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MetricMeasurementHelperProtocol_Internal *)v3;
}

void __38__MXMProxyServiceManager__proxyObject__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  _MXMGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_214474000, v3, OS_LOG_TYPE_ERROR, "Error occured with connection: %@. Nilling the manager.", (uint8_t *)&v4, 0xCu);
  }

}

- (BOOL)wake
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[MXMProxyServiceManager _proxyObject](self, "_proxyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __30__MXMProxyServiceManager_wake__block_invoke;
  v6[3] = &unk_24D1930A0;
  v6[4] = &v7;
  objc_msgSend(v2, "_wakeWithPhrase:response:", CFSTR("Copyright © 2019 Apple"), v6);

  v3 = (void *)v8[5];
  objc_msgSend(CFSTR("Copyright © 2019 Apple"), "stringByAppendingString:", CFSTR("ACK"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "isEqualToString:", v4);

  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

void __30__MXMProxyServiceManager_wake__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)_sampleWithProxyMetric:(id)a3 timeout:(double)a4 stopReason:(unint64_t *)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v8 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[MXMProxyServiceManager _proxyObject](self, "_proxyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __68__MXMProxyServiceManager__sampleWithProxyMetric_timeout_stopReason___block_invoke;
  v12[3] = &unk_24D1930C8;
  v12[4] = &v17;
  v12[5] = &v13;
  objc_msgSend(v9, "_sampleWithProxyMetric:timeout:response:", v8, v12, a4);

  if (a5)
    *a5 = v14[3];
  v10 = (id)v18[5];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v10;
}

void __68__MXMProxyServiceManager__sampleWithProxyMetric_timeout_stopReason___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v6 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;

}

- (void)_startPerformanceTrace:(id)a3 response:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t, uint64_t, uint64_t);
  void *v8;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t, uint64_t, uint64_t))a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  -[MXMProxyServiceManager _proxyObject](self, "_proxyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__MXMProxyServiceManager__startPerformanceTrace_response___block_invoke;
  v9[3] = &unk_24D1930F0;
  v9[4] = &v28;
  v9[5] = &v22;
  v9[6] = &v16;
  v9[7] = &v10;
  objc_msgSend(v8, "_startPerformanceTraceHelper:response:", v6, v9);

  v7[2](v7, *((unsigned __int8 *)v29 + 24), v23[5], v17[5], v11[5]);
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
}

void __58__MXMProxyServiceManager__startPerformanceTrace_response___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = (v7 | v8 | v9) == 0;
  v10 = *(_QWORD *)(a1[5] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;
  v17 = (id)v7;

  v12 = *(_QWORD *)(a1[6] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v8;
  v14 = (id)v8;

  v15 = *(_QWORD *)(a1[7] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v9;

}

- (void)_stopPerformanceTrace:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[10];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t))a3;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy_;
  v46 = __Block_byref_object_dispose_;
  v47 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy_;
  v40 = __Block_byref_object_dispose_;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  -[MXMProxyServiceManager _proxyObject](self, "_proxyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __48__MXMProxyServiceManager__stopPerformanceTrace___block_invoke;
  v11[3] = &unk_24D193118;
  v11[4] = &v30;
  v11[5] = &v24;
  v11[6] = &v18;
  v11[7] = &v12;
  v11[8] = &v42;
  v11[9] = &v36;
  objc_msgSend(v5, "_stopPerformanceTraceHelper:", v11);

  v6 = v43[5];
  if (v6 && (v7 = v37[5]) != 0)
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    v48 = *MEMORY[0x24BDD0FC8];
    v49[0] = CFSTR("Unable to access performance trace file.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("InstrumentErrorDomain"), 0, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v43[5];
    v7 = v37[5];
  }
  v4[2](v4, v6, v7, v8, v31[5], v25[5], v19[5], v13[5]);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

}

void __48__MXMProxyServiceManager__stopPerformanceTrace___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;

  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = *(_QWORD *)(a1[4] + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v15;
  v35 = v15;

  v21 = *(_QWORD *)(a1[5] + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v16;
  v23 = v16;

  v24 = *(_QWORD *)(a1[6] + 8);
  v25 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = v17;
  v26 = v17;

  v27 = *(_QWORD *)(a1[7] + 8);
  v28 = *(void **)(v27 + 40);
  *(_QWORD *)(v27 + 40) = v18;
  v29 = v18;

  v30 = *(_QWORD *)(a1[8] + 8);
  v31 = *(void **)(v30 + 40);
  *(_QWORD *)(v30 + 40) = v13;
  v32 = v13;

  v33 = *(_QWORD *)(a1[9] + 8);
  v34 = *(void **)(v33 + 40);
  *(_QWORD *)(v33 + 40) = v14;

}

- (void)_quiesceBeforeIteration:(double)a3 timeout:(double)a4 response:(id)a5
{
  void (**v8)(id, _QWORD, uint64_t);
  void *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v8 = (void (**)(id, _QWORD, uint64_t))a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  -[MXMProxyServiceManager _proxyObject](self, "_proxyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __67__MXMProxyServiceManager__quiesceBeforeIteration_timeout_response___block_invoke;
  v10[3] = &unk_24D193140;
  v10[4] = &v17;
  v10[5] = &v11;
  objc_msgSend(v9, "_quiesceBeforeIterationHelper:timeout:response:", v10, a3, a4);

  v8[2](v8, *((unsigned __int8 *)v18 + 24), v12[5]);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
}

void __67__MXMProxyServiceManager__quiesceBeforeIteration_timeout_response___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)_uncacheBeforeIteration:(id)a3 response:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t);
  void *v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  -[MXMProxyServiceManager _proxyObject](self, "_proxyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __59__MXMProxyServiceManager__uncacheBeforeIteration_response___block_invoke;
  v9[3] = &unk_24D193140;
  v9[4] = &v16;
  v9[5] = &v10;
  objc_msgSend(v8, "_uncacheBeforeIterationHelper:response:", v6, v9);

  v7[2](v7, *((unsigned __int8 *)v17 + 24), v11[5]);
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
}

void __59__MXMProxyServiceManager__uncacheBeforeIteration_response___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)_terminateProcessesBeforeIteration:(id)a3 response:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t);
  void *v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  -[MXMProxyServiceManager _proxyObject](self, "_proxyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __70__MXMProxyServiceManager__terminateProcessesBeforeIteration_response___block_invoke;
  v9[3] = &unk_24D193140;
  v9[4] = &v16;
  v9[5] = &v10;
  objc_msgSend(v8, "_terminateProcessesBeforeIterationHelper:response:", v6, v9);

  v7[2](v7, *((unsigned __int8 *)v17 + 24), v11[5]);
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
}

void __70__MXMProxyServiceManager__terminateProcessesBeforeIteration_response___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[MXMProxyServiceManager _serviceConnection](self, "_serviceConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)MXMProxyServiceManager;
  -[MXMProxyServiceManager dealloc](&v4, sel_dealloc);
}

- (NSXPCConnection)_serviceConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__serviceConnection, 0);
}

@end
