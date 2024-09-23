@implementation CMLLocationPIRClient

- (void)requestDataByLatitude:(double)a3 longitude:(double)a4 completionHandler:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  uint64_t *v23;
  SEL v24;
  _QWORD aBlock[4];
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v10 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__CMLLocationPIRClient_requestDataByLatitude_longitude_completionHandler___block_invoke;
  aBlock[3] = &unk_2509A7FB0;
  v11 = v9;
  v26 = v11;
  v12 = _Block_copy(aBlock);
  -[CMLPIRClient connection](self, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMLPIRClient dispatchQueue](self, "dispatchQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMLXPC asyncProxyToConnection:dispatchQueue:callbackWasCalled:errorHandler:](CMLXPC, "asyncProxyToConnection:dispatchQueue:callbackWasCalled:errorHandler:", v13, v14, v28 + 3, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __74__CMLLocationPIRClient_requestDataByLatitude_longitude_completionHandler___block_invoke_2;
  v21[3] = &unk_2509A81E0;
  v23 = &v27;
  v24 = a2;
  v21[4] = self;
  v16 = v11;
  v22 = v16;
  v17 = _Block_copy(v21);
  +[CMLLog client](CMLLog, "client");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = v19;
    _os_log_impl(&dword_237BC8000, v18, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);

  }
  -[CMLPIRClient clientConfig](self, "clientConfig");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "requestDataByLatitude:longitude:clientConfig:reply:", v20, v17, a3, a4);

  _Block_object_dispose(&v27, 8);
}

uint64_t __74__CMLLocationPIRClient_requestDataByLatitude_longitude_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__CMLLocationPIRClient_requestDataByLatitude_longitude_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
    _os_log_impl(&dword_237BC8000, v7, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, data(%d) error:%{public}@", buf, 0x1Cu);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  if (v6)
  {
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 500, v6, CFSTR("Unable to request data by location"));
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
  block[2] = __74__CMLLocationPIRClient_requestDataByLatitude_longitude_completionHandler___block_invoke_159;
  block[3] = &unk_2509A7FD8;
  v11 = *(id *)(a1 + 40);
  v16 = v9;
  v17 = v11;
  v15 = v5;
  v12 = v9;
  v13 = v5;
  dispatch_async(v10, block);

}

uint64_t __74__CMLLocationPIRClient_requestDataByLatitude_longitude_completionHandler___block_invoke_159(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)dataByLatitude:(double)a3 longitude:(double)a4 error:(id *)a5
{
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
  v19[2] = __55__CMLLocationPIRClient_dataByLatitude_longitude_error___block_invoke;
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
  objc_msgSend(v11, "requestDataByLatitude:longitude:clientConfig:reply:", v15, v12, a3, a4);

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

void __55__CMLLocationPIRClient_dataByLatitude_longitude_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 500, v7, CFSTR("Unable to request data by location"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

- (CMLLocationPIRClient)init
{

  return 0;
}

+ (id)new
{
  return 0;
}

- (id)constructPIRRequestWithLatitude:(double)a3 longitude:(double)a4 error:(id *)a5
{
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
  v19[2] = __72__CMLLocationPIRClient_constructPIRRequestWithLatitude_longitude_error___block_invoke;
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
  objc_msgSend(v11, "constructPIRRequestWithLatitude:longitude:clientConfig:reply:", v15, v12, a3, a4);

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

void __72__CMLLocationPIRClient_constructPIRRequestWithLatitude_longitude_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 501, v7, CFSTR("Unable to create PIR request with location due to errors"));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6)
      goto LABEL_7;
    +[CMLError errorWithCode:description:](CMLError, "errorWithCode:description:", 502, CFSTR("Unable to create PIR request with location due to empty response"));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

LABEL_7:
}

- (id)decryptPIRResponse:(id)a3 latitude:(double)a4 longitude:(double)a5 error:(id *)a6
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[7];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v34 = 0;
  -[CMLPIRClient connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMLXPC syncProxyToConnection:error:](CMLXPC, "syncProxyToConnection:error:", v12, &v34);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__2;
  v32 = __Block_byref_object_dispose__2;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__2;
  v26 = __Block_byref_object_dispose__2;
  v27 = 0;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __68__CMLLocationPIRClient_decryptPIRResponse_latitude_longitude_error___block_invoke;
  v21[3] = &unk_2509A8050;
  v21[5] = &v28;
  v21[6] = a2;
  v21[4] = &v22;
  v14 = _Block_copy(v21);
  +[CMLLog client](CMLLog, "client");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v36 = v16;
    _os_log_impl(&dword_237BC8000, v15, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);

  }
  -[CMLPIRClient clientConfig](self, "clientConfig");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "decryptPIRResponse:latitude:longitude:clientConfig:reply:", v11, v17, v14, a4, a5);

  if (a6)
  {
    v18 = v34;
    if (!v34)
      v18 = (id)v29[5];
    *a6 = objc_retainAutorelease(v18);
  }
  v19 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v19;
}

void __68__CMLLocationPIRClient_decryptPIRResponse_latitude_longitude_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 503, v7, CFSTR("Unable to decrypt PIR response with location due to errors"));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6)
      goto LABEL_7;
    +[CMLError errorWithCode:description:](CMLError, "errorWithCode:description:", 504, CFSTR("Unable to decrypt PIR response with location due to empty response"));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

LABEL_7:
}

@end
