@implementation CMLIndexPIRClient

- (void)requestDataByIndex:(unint64_t)a3 completionHandler:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  SEL v22;
  _QWORD aBlock[4];
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v8 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__CMLIndexPIRClient_requestDataByIndex_completionHandler___block_invoke;
  aBlock[3] = &unk_2509A7FB0;
  v9 = v7;
  v24 = v9;
  v10 = _Block_copy(aBlock);
  -[CMLPIRClient connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMLPIRClient dispatchQueue](self, "dispatchQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMLXPC asyncProxyToConnection:dispatchQueue:callbackWasCalled:errorHandler:](CMLXPC, "asyncProxyToConnection:dispatchQueue:callbackWasCalled:errorHandler:", v11, v12, v26 + 3, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __58__CMLIndexPIRClient_requestDataByIndex_completionHandler___block_invoke_2;
  v19[3] = &unk_2509A81E0;
  v21 = &v25;
  v22 = a2;
  v19[4] = self;
  v14 = v9;
  v20 = v14;
  v15 = _Block_copy(v19);
  +[CMLLog client](CMLLog, "client");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v17;
    _os_log_impl(&dword_237BC8000, v16, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);

  }
  -[CMLPIRClient clientConfig](self, "clientConfig");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "requestDataByIndex:clientConfig:reply:", a3, v18, v15);

  _Block_object_dispose(&v25, 8);
}

uint64_t __58__CMLIndexPIRClient_requestDataByIndex_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__CMLIndexPIRClient_requestDataByIndex_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[CMLLog client](CMLLog, "client");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v19 = v8;
    v20 = 1024;
    v21 = v5 != 0;
    v22 = 2114;
    v23 = v6;
    _os_log_impl(&dword_237BC8000, v7, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, success(%d) error:%{public}@", buf, 0x1Cu);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  if (v6)
  {
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 300, v6, CFSTR("Unable to request data by index"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "dispatchQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__CMLIndexPIRClient_requestDataByIndex_completionHandler___block_invoke_56;
  block[3] = &unk_2509A7FD8;
  v11 = *(id *)(a1 + 40);
  v16 = v9;
  v17 = v11;
  v15 = v5;
  v12 = v9;
  v13 = v5;
  dispatch_async(v10, block);

}

uint64_t __58__CMLIndexPIRClient_requestDataByIndex_completionHandler___block_invoke_56(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)requestDataByIndices:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  uint64_t *v22;
  SEL v23;
  _QWORD aBlock[4];
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v9 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__CMLIndexPIRClient_requestDataByIndices_completionHandler___block_invoke;
  aBlock[3] = &unk_2509A7FB0;
  v10 = v8;
  v25 = v10;
  v11 = _Block_copy(aBlock);
  -[CMLPIRClient connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMLPIRClient dispatchQueue](self, "dispatchQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMLXPC asyncProxyToConnection:dispatchQueue:callbackWasCalled:errorHandler:](CMLXPC, "asyncProxyToConnection:dispatchQueue:callbackWasCalled:errorHandler:", v12, v13, v27 + 3, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __60__CMLIndexPIRClient_requestDataByIndices_completionHandler___block_invoke_2;
  v20[3] = &unk_2509A8000;
  v22 = &v26;
  v23 = a2;
  v20[4] = self;
  v15 = v10;
  v21 = v15;
  v16 = _Block_copy(v20);
  +[CMLLog client](CMLLog, "client");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v31 = v18;
    _os_log_impl(&dword_237BC8000, v17, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);

  }
  -[CMLPIRClient clientConfig](self, "clientConfig");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "requestDataByIndices:clientConfig:reply:", v7, v19, v16);

  _Block_object_dispose(&v26, 8);
}

uint64_t __60__CMLIndexPIRClient_requestDataByIndices_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__CMLIndexPIRClient_requestDataByIndices_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "count");
  +[CMLLog client](CMLLog, "client");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v20 = v9;
    v21 = 2048;
    v22 = v7;
    v23 = 2114;
    v24 = v6;
    _os_log_impl(&dword_237BC8000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, results(%lu), error:%{public}@", buf, 0x20u);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  if (v6)
  {
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 301, v6, CFSTR("Unable to request data by indices batch"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "dispatchQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__CMLIndexPIRClient_requestDataByIndices_completionHandler___block_invoke_60;
  block[3] = &unk_2509A7FD8;
  v12 = *(id *)(a1 + 40);
  v17 = v10;
  v18 = v12;
  v16 = v5;
  v13 = v10;
  v14 = v5;
  dispatch_async(v11, block);

}

uint64_t __60__CMLIndexPIRClient_requestDataByIndices_completionHandler___block_invoke_60(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)dataByIndex:(unint64_t)a3 error:(id *)a4
{
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[7];
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
  id v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v30 = 0;
  -[CMLPIRClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMLXPC syncProxyToConnection:error:](CMLXPC, "syncProxyToConnection:error:", v8, &v30);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  v23 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __39__CMLIndexPIRClient_dataByIndex_error___block_invoke;
  v17[3] = &unk_2509A8050;
  v17[5] = &v24;
  v17[6] = a2;
  v17[4] = &v18;
  v10 = _Block_copy(v17);
  +[CMLLog client](CMLLog, "client");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = v12;
    _os_log_impl(&dword_237BC8000, v11, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);

  }
  -[CMLPIRClient clientConfig](self, "clientConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestDataByIndex:clientConfig:reply:", a3, v13, v10);

  if (a4)
  {
    v14 = v30;
    if (!v30)
      v14 = (id)v25[5];
    *a4 = objc_retainAutorelease(v14);
  }
  v15 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v15;
}

void __39__CMLIndexPIRClient_dataByIndex_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  +[CMLLog client](CMLLog, "client");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v9;
    v15 = 1024;
    v16 = v6 != 0;
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_237BC8000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, data(%d) error:%{public}@", (uint8_t *)&v13, 0x1Cu);

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 300, v7, CFSTR("Unable to request data by index"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

- (id)dataByIndices:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[7];
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
  id v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v30 = 0;
  -[CMLPIRClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMLXPC syncProxyToConnection:error:](CMLXPC, "syncProxyToConnection:error:", v8, &v30);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  v23 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __41__CMLIndexPIRClient_dataByIndices_error___block_invoke;
  v17[3] = &unk_2509A8028;
  v17[5] = &v24;
  v17[6] = a2;
  v17[4] = &v18;
  v10 = _Block_copy(v17);
  +[CMLLog client](CMLLog, "client");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = v12;
    _os_log_impl(&dword_237BC8000, v11, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);

  }
  -[CMLPIRClient clientConfig](self, "clientConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestDataByIndices:clientConfig:reply:", v7, v13, v10);

  if (a4)
  {
    v14 = v30;
    if (!v30)
      v14 = (id)v25[5];
    *a4 = objc_retainAutorelease(v14);
  }
  v15 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v15;
}

void __41__CMLIndexPIRClient_dataByIndices_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  v8 = objc_msgSend(v6, "count");
  +[CMLLog client](CMLLog, "client");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = v10;
    v16 = 2048;
    v17 = v8;
    v18 = 2114;
    v19 = v7;
    _os_log_impl(&dword_237BC8000, v9, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, results(%lu) error:%{public}@", (uint8_t *)&v14, 0x20u);

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 301, v7, CFSTR("Unable to request data by indices batch"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
}

- (id)constructPIRRequestWithIndex:(unint64_t)a3 error:(id *)a4
{
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[7];
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
  id v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v30 = 0;
  -[CMLPIRClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMLXPC syncProxyToConnection:error:](CMLXPC, "syncProxyToConnection:error:", v8, &v30);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  v23 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __56__CMLIndexPIRClient_constructPIRRequestWithIndex_error___block_invoke;
  v17[3] = &unk_2509A8050;
  v17[5] = &v24;
  v17[6] = a2;
  v17[4] = &v18;
  v10 = _Block_copy(v17);
  +[CMLLog client](CMLLog, "client");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = v12;
    _os_log_impl(&dword_237BC8000, v11, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);

  }
  -[CMLPIRClient clientConfig](self, "clientConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constructPIRRequestWithIndex:clientConfig:reply:", a3, v13, v10);

  if (a4)
  {
    v14 = v30;
    if (!v30)
      v14 = (id)v25[5];
    *a4 = objc_retainAutorelease(v14);
  }
  v15 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v15;
}

void __56__CMLIndexPIRClient_constructPIRRequestWithIndex_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  +[CMLLog client](CMLLog, "client");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v9;
    v15 = 1024;
    v16 = v6 != 0;
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_237BC8000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, data(%d) error:%{public}@", (uint8_t *)&v13, 0x1Cu);

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 302, v7, CFSTR("Unable to create PIR request with index due to errors"));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6)
      goto LABEL_7;
    +[CMLError errorWithCode:description:](CMLError, "errorWithCode:description:", 303, CFSTR("Unable to create PIR request with index due to empty response"));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

LABEL_7:
}

- (id)constructPIRBatchRequestWithIndices:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[7];
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
  id v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v30 = 0;
  -[CMLPIRClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMLXPC syncProxyToConnection:error:](CMLXPC, "syncProxyToConnection:error:", v8, &v30);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  v23 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __63__CMLIndexPIRClient_constructPIRBatchRequestWithIndices_error___block_invoke;
  v17[3] = &unk_2509A8050;
  v17[5] = &v24;
  v17[6] = a2;
  v17[4] = &v18;
  v10 = _Block_copy(v17);
  +[CMLLog client](CMLLog, "client");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = v12;
    _os_log_impl(&dword_237BC8000, v11, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);

  }
  -[CMLPIRClient clientConfig](self, "clientConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constructPIRBatchRequestWithIndices:clientConfig:reply:", v7, v13, v10);

  if (a4)
  {
    v14 = v30;
    if (!v30)
      v14 = (id)v25[5];
    *a4 = objc_retainAutorelease(v14);
  }
  v15 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v15;
}

void __63__CMLIndexPIRClient_constructPIRBatchRequestWithIndices_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  +[CMLLog client](CMLLog, "client");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v9;
    v15 = 1024;
    v16 = v6 != 0;
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_237BC8000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, data(%d) error:%{public}@", (uint8_t *)&v13, 0x1Cu);

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 304, v7, CFSTR("Unable to create PIR request with batch of indices due to errors"));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6)
      goto LABEL_7;
    +[CMLError errorWithCode:description:](CMLError, "errorWithCode:description:", 305, CFSTR("Unable to create PIR request with batch of indices due to empty response"));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

LABEL_7:
}

- (id)decryptPIRResponse:(id)a3 index:(unint64_t)a4 error:(id *)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v19[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v32 = 0;
  -[CMLPIRClient connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMLXPC syncProxyToConnection:error:](CMLXPC, "syncProxyToConnection:error:", v10, &v32);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__2;
  v30 = __Block_byref_object_dispose__2;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  v25 = 0;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __52__CMLIndexPIRClient_decryptPIRResponse_index_error___block_invoke;
  v19[3] = &unk_2509A8050;
  v19[5] = &v26;
  v19[6] = a2;
  v19[4] = &v20;
  v12 = _Block_copy(v19);
  +[CMLLog client](CMLLog, "client");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v34 = v14;
    _os_log_impl(&dword_237BC8000, v13, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);

  }
  -[CMLPIRClient clientConfig](self, "clientConfig");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "decryptPIRResponse:index:clientConfig:reply:", v9, a4, v15, v12);

  if (a5)
  {
    v16 = v32;
    if (!v32)
      v16 = (id)v27[5];
    *a5 = objc_retainAutorelease(v16);
  }
  v17 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v17;
}

void __52__CMLIndexPIRClient_decryptPIRResponse_index_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  +[CMLLog client](CMLLog, "client");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v9;
    v15 = 1024;
    v16 = v6 != 0;
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_237BC8000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, data(%d) error:%{public}@", (uint8_t *)&v13, 0x1Cu);

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 306, v7, CFSTR("Unable to decrypt PIR response with index due to errors"));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6)
      goto LABEL_7;
    +[CMLError errorWithCode:description:](CMLError, "errorWithCode:description:", 307, CFSTR("Unable to decrypt PIR response with index due to empty response"));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

LABEL_7:
}

- (id)decryptPIRBatchResponse:(id)a3 indices:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[7];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v33 = 0;
  -[CMLPIRClient connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMLXPC syncProxyToConnection:error:](CMLXPC, "syncProxyToConnection:error:", v11, &v33);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__2;
  v31 = __Block_byref_object_dispose__2;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __59__CMLIndexPIRClient_decryptPIRBatchResponse_indices_error___block_invoke;
  v20[3] = &unk_2509A8028;
  v20[5] = &v27;
  v20[6] = a2;
  v20[4] = &v21;
  v13 = _Block_copy(v20);
  +[CMLLog client](CMLLog, "client");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v35 = v15;
    _os_log_impl(&dword_237BC8000, v14, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);

  }
  -[CMLPIRClient clientConfig](self, "clientConfig");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "decryptPIRBatchResponse:indices:clientConfig:reply:", v9, v10, v16, v13);

  if (a5)
  {
    v17 = v33;
    if (!v33)
      v17 = (id)v28[5];
    *a5 = objc_retainAutorelease(v17);
  }
  v18 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v18;
}

void __59__CMLIndexPIRClient_decryptPIRBatchResponse_indices_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  v8 = objc_msgSend(v6, "count");
  +[CMLLog client](CMLLog, "client");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = v10;
    v16 = 2048;
    v17 = v8;
    v18 = 2114;
    v19 = v7;
    _os_log_impl(&dword_237BC8000, v9, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, results(%lu) error:%{public}@", (uint8_t *)&v14, 0x20u);

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 308, v7, CFSTR("Unable to decrypt PIR batch response with indices due to errors"));
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
      goto LABEL_7;
    +[CMLError errorWithCode:description:](CMLError, "errorWithCode:description:", 309, CFSTR("Unable to decrypt PIR batch response with indices due to empty response"));
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

LABEL_7:
}

- (CMLIndexPIRClient)init
{

  return 0;
}

+ (id)new
{
  return 0;
}

@end
