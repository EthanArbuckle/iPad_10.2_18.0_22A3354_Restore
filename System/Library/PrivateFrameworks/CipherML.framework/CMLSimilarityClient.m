@implementation CMLSimilarityClient

- (NSString)useCase
{
  void *v2;
  void *v3;

  -[CMLSimilarityClient clientConfig](self, "clientConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "useCase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CMLSimilarityClient)initWithClientConfig:(id)a3
{
  id v4;
  dispatch_queue_t v5;
  CMLSimilarityClient *v6;

  v4 = a3;
  v5 = dispatch_queue_create("com.apple.CipherML.CMLSimilarityClient", 0);
  v6 = -[CMLSimilarityClient initWithClientConfig:dispatchQueue:](self, "initWithClientConfig:dispatchQueue:", v4, v5);

  return v6;
}

- (CMLSimilarityClient)initWithClientConfig:(id)a3 dispatchQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CMLSimilarityClient *v9;
  NSObject *v10;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.ciphermld"), 0);
  if (v8)
  {
    self = -[CMLSimilarityClient initWithClientConfig:dispatchQueue:connection:](self, "initWithClientConfig:dispatchQueue:connection:", v6, v7, v8);
    v9 = self;
  }
  else
  {
    +[CMLLog client](CMLLog, "client");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CMLSimilarityClient initWithClientConfig:dispatchQueue:].cold.1((uint64_t)CFSTR("com.apple.ciphermld"), v10);

    v9 = 0;
  }

  return v9;
}

- (CMLSimilarityClient)initWithClientConfig:(id)a3 dispatchQueue:(id)a4 connection:(id)a5
{
  id v9;
  id v10;
  id v11;
  CMLSimilarityClient *v12;
  void *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CMLSimilarityClient;
  v12 = -[CMLSimilarityClient init](&v15, sel_init);
  if (v12)
  {
    +[CMLXPC interfaceDescription](CMLXPC, "interfaceDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRemoteObjectInterface:", v13);

    objc_msgSend(v11, "activate");
    objc_storeStrong((id *)&v12->_clientConfig, a3);
    objc_storeStrong((id *)&v12->_dispatchQueue, a4);
    objc_storeStrong((id *)&v12->_connection, a5);
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CMLSimilarityClient;
  -[CMLSimilarityClient dealloc](&v3, sel_dealloc);
}

- (void)requestSimilarityScoresForElement:(id)a3 shardIndex:(unint64_t)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "numberWithUnsignedInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMLSimilarityClient requestSimilarityScoresForElement:shardIndices:completionHandler:](self, "requestSimilarityScoresForElement:shardIndices:completionHandler:", v10, v12, v9);

}

- (void)requestSimilarityScoresForElement:(id)a3 shardIndices:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v16[0] = a3;
  v9 = (void *)MEMORY[0x24BDBCE30];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "arrayWithObjects:count:", v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __88__CMLSimilarityClient_requestSimilarityScoresForElement_shardIndices_completionHandler___block_invoke;
  v14[3] = &unk_2509A7F88;
  v15 = v8;
  v13 = v8;
  -[CMLSimilarityClient requestSimilarityScoresForElements:shardIndices:completionHandler:](self, "requestSimilarityScoresForElements:shardIndices:completionHandler:", v12, v10, v14);

}

void __88__CMLSimilarityClient_requestSimilarityScoresForElement_shardIndices_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)requestSimilarityScoresForElements:(id)a3 shardIndex:(unint64_t)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "numberWithUnsignedInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMLSimilarityClient requestSimilarityScoresForElements:shardIndices:completionHandler:](self, "requestSimilarityScoresForElements:shardIndices:completionHandler:", v10, v12, v9);

}

- (void)requestSimilarityScoresForElements:(id)a3 shardIndices:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  uint64_t *v24;
  SEL v25;
  _QWORD aBlock[4];
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v12 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__CMLSimilarityClient_requestSimilarityScoresForElements_shardIndices_completionHandler___block_invoke;
  aBlock[3] = &unk_2509A7FB0;
  v13 = v11;
  v27 = v13;
  v14 = _Block_copy(aBlock);
  -[CMLSimilarityClient connection](self, "connection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMLSimilarityClient dispatchQueue](self, "dispatchQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMLXPC asyncProxyToConnection:dispatchQueue:callbackWasCalled:errorHandler:](CMLXPC, "asyncProxyToConnection:dispatchQueue:callbackWasCalled:errorHandler:", v15, v16, v29 + 3, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[CMLLog client](CMLLog, "client");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v33 = v19;
    _os_log_impl(&dword_237BC8000, v18, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);

  }
  -[CMLSimilarityClient clientConfig](self, "clientConfig");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __89__CMLSimilarityClient_requestSimilarityScoresForElements_shardIndices_completionHandler___block_invoke_62;
  v22[3] = &unk_2509A8000;
  v24 = &v28;
  v25 = a2;
  v22[4] = self;
  v21 = v13;
  v23 = v21;
  objc_msgSend(v17, "similarityScoresForElements:shardIndices:clientConfig:reply:", v9, v10, v20, v22);

  _Block_object_dispose(&v28, 8);
}

uint64_t __89__CMLSimilarityClient_requestSimilarityScoresForElements_shardIndices_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __89__CMLSimilarityClient_requestSimilarityScoresForElements_shardIndices_completionHandler___block_invoke_62(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
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
    _os_log_impl(&dword_237BC8000, v7, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, scores(%d) error:%{public}@", buf, 0x1Cu);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  if (v6)
  {
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 600, v6, CFSTR("Unable to calculate similarity scores for elements due to errors"));
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  if (!(v5 | v9))
  {
    +[CMLError errorWithCode:description:](CMLError, "errorWithCode:description:", 601, CFSTR("Server returns nil instead of similarity scores with empty error"));
    v9 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "dispatchQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__CMLSimilarityClient_requestSimilarityScoresForElements_shardIndices_completionHandler___block_invoke_68;
  block[3] = &unk_2509A7FD8;
  v11 = *(id *)(a1 + 40);
  v16 = (id)v9;
  v17 = v11;
  v15 = (id)v5;
  v12 = (id)v9;
  v13 = (id)v5;
  dispatch_async(v10, block);

}

uint64_t __89__CMLSimilarityClient_requestSimilarityScoresForElements_shardIndices_completionHandler___block_invoke_68(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)similarityScoresForElement:(id)a3 shardIndex:(unint64_t)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = a3;
  objc_msgSend(v8, "numberWithUnsignedInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMLSimilarityClient similarityScoresForElement:shardIndices:error:](self, "similarityScoresForElement:shardIndices:error:", v9, v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)similarityScoresForElement:(id)a3 shardIndices:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v8 = (void *)MEMORY[0x24BDBCE30];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CMLSimilarityClient similarityScoresForElements:shardIndices:error:](self, "similarityScoresForElements:shardIndices:error:", v11, v9, a5, v15, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)similarityScoresForElements:(id)a3 shardIndex:(unint64_t)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = a3;
  objc_msgSend(v8, "numberWithUnsignedInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMLSimilarityClient similarityScoresForElements:shardIndices:error:](self, "similarityScoresForElements:shardIndices:error:", v9, v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)similarityScoresForElements:(id)a3 shardIndices:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  _BOOL4 v21;
  uint64_t v22;
  id v23;
  _QWORD v25[7];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  _BOOL4 v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v38 = 0;
  -[CMLSimilarityClient connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMLXPC syncProxyToConnection:error:](CMLXPC, "syncProxyToConnection:error:", v11, &v38);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__0;
  v36 = __Block_byref_object_dispose__0;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__0;
  v30 = __Block_byref_object_dispose__0;
  v31 = 0;
  +[CMLLog client](CMLLog, "client");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v40 = v14;
    _os_log_impl(&dword_237BC8000, v13, OS_LOG_TYPE_DEFAULT, "%@ Sending request", buf, 0xCu);

  }
  -[CMLSimilarityClient clientConfig](self, "clientConfig");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __70__CMLSimilarityClient_similarityScoresForElements_shardIndices_error___block_invoke;
  v25[3] = &unk_2509A8028;
  v25[4] = &v26;
  v25[5] = &v32;
  v25[6] = a2;
  objc_msgSend(v12, "similarityScoresForElements:shardIndices:clientConfig:reply:", v9, v10, v15, v25);

  if (!v27[5] && !v33[5])
  {
    +[CMLError errorWithCode:description:](CMLError, "errorWithCode:description:", 601, CFSTR("Server returns nil instead of similarity scores with empty error"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v33[5];
    v33[5] = v16;

  }
  if (a5)
  {
    v18 = v38;
    if (!v38)
      v18 = (id)v33[5];
    *a5 = objc_retainAutorelease(v18);
  }
  +[CMLLog client](CMLLog, "client");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v27[5] != 0;
    v22 = v33[5];
    *(_DWORD *)buf = 138412802;
    v40 = v20;
    v41 = 1024;
    v42 = v21;
    v43 = 2114;
    v44 = v22;
    _os_log_impl(&dword_237BC8000, v19, OS_LOG_TYPE_DEFAULT, "%@ Request complete, scores(%d) error:%{public}@", buf, 0x1Cu);

  }
  v23 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v23;
}

void __70__CMLSimilarityClient_similarityScoresForElements_shardIndices_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
    _os_log_impl(&dword_237BC8000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, scores(%d), error:%{public}@", (uint8_t *)&v13, 0x1Cu);

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 600, v7, CFSTR("Unable to calculate similarity scores for element due to errors"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

- (id)setPECConfig:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v29 = 0;
  -[CMLSimilarityClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMLXPC syncProxyToConnection:error:](CMLXPC, "syncProxyToConnection:error:", v8, &v29);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  +[CMLLog client](CMLLog, "client");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v31 = v11;
    _os_log_impl(&dword_237BC8000, v10, OS_LOG_TYPE_DEFAULT, "%@ Sending request", buf, 0xCu);

  }
  -[CMLSimilarityClient setClientPecConfig:](self, "setClientPecConfig:", v7);
  -[CMLSimilarityClient clientConfig](self, "clientConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __42__CMLSimilarityClient_setPECConfig_error___block_invoke;
  v16[3] = &unk_2509A8050;
  v16[4] = &v17;
  v16[5] = &v23;
  v16[6] = a2;
  objc_msgSend(v9, "setPECConfig:clientConfig:reply:", v7, v12, v16);

  if (a4)
  {
    v13 = v29;
    if (!v29)
      v13 = (id)v24[5];
    *a4 = objc_retainAutorelease(v13);
  }
  v14 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v14;
}

void __42__CMLSimilarityClient_setPECConfig_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
    _os_log_impl(&dword_237BC8000, v8, OS_LOG_TYPE_DEFAULT, "%@ Received response, success(%d) error:%{public}@", (uint8_t *)&v13, 0x1Cu);

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 200, v7, CFSTR("Unable to set PEC config due to errors"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

- (id)encryptElement:(id)a3 shardIndex:(unint64_t)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v16[0] = a3;
  v8 = (void *)MEMORY[0x24BDBCE30];
  v9 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CMLSimilarityClient encryptBatchOfElements:shardIndices:error:](self, "encryptBatchOfElements:shardIndices:error:", v10, v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)encryptElement:(id)a3 shardIndices:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v8 = (void *)MEMORY[0x24BDBCE30];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CMLSimilarityClient encryptBatchOfElements:shardIndices:error:](self, "encryptBatchOfElements:shardIndices:error:", v11, v9, a5, v14, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)decryptSimilarityScores:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  -[CMLSimilarityClient decryptBatchOfSimilarityScores:error:](self, "decryptBatchOfSimilarityScores:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)calculateSimilarityScoresOf:(id)a3 toElements:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)encryptBatchOfElements:(id)a3 shardIndex:(unint64_t)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = a3;
  objc_msgSend(v8, "numberWithUnsignedInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMLSimilarityClient encryptBatchOfElements:shardIndices:error:](self, "encryptBatchOfElements:shardIndices:error:", v9, v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)encryptDifferentiallyPrivateFakes:(id)a3 shardIndex:(unint64_t)a4 shardCount:(unint64_t)a5 error:(id *)a6
{
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  _BOOL4 v23;
  uint64_t v24;
  id v25;
  id v27;
  _QWORD aBlock[7];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  _BOOL4 v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v27 = a3;
  v41 = 0;
  -[CMLSimilarityClient connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMLXPC syncProxyToConnection:error:](CMLXPC, "syncProxyToConnection:error:", v11, &v41);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__0;
  v33 = __Block_byref_object_dispose__0;
  v34 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__CMLSimilarityClient_encryptDifferentiallyPrivateFakes_shardIndex_shardCount_error___block_invoke;
  aBlock[3] = &unk_2509A8028;
  aBlock[5] = &v35;
  aBlock[6] = a2;
  aBlock[4] = &v29;
  v13 = _Block_copy(aBlock);
  +[CMLLog client](CMLLog, "client");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v43 = v15;
    _os_log_impl(&dword_237BC8000, v14, OS_LOG_TYPE_DEFAULT, "%@ Sending request", buf, 0xCu);

  }
  -[CMLSimilarityClient clientPecConfig](self, "clientPecConfig");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMLSimilarityClient clientConfig](self, "clientConfig");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encryptDifferentiallyPrivateFakes:shardIndex:shardCount:pecConfig:clientConfig:reply:", v27, a4, a5, v16, v17, v13);

  if (!v30[5] && !v36[5])
  {
    +[CMLError errorWithCode:description:](CMLError, "errorWithCode:description:", 911, CFSTR("Server returns nil instead of encrypted elements data with empty error"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v36[5];
    v36[5] = v18;

  }
  if (a6)
  {
    v20 = v41;
    if (!v41)
      v20 = (id)v36[5];
    *a6 = objc_retainAutorelease(v20);
  }
  +[CMLLog client](CMLLog, "client");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v30[5] != 0;
    v24 = v36[5];
    *(_DWORD *)buf = 138412802;
    v43 = v22;
    v44 = 1024;
    v45 = v23;
    v46 = 2114;
    v47 = v24;
    _os_log_impl(&dword_237BC8000, v21, OS_LOG_TYPE_DEFAULT, "%@ Request complete, encryptedData(%d) error:%{public}@", buf, 0x1Cu);

  }
  v25 = (id)v30[5];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v25;
}

void __85__CMLSimilarityClient_encryptDifferentiallyPrivateFakes_shardIndex_shardCount_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
    _os_log_impl(&dword_237BC8000, v8, OS_LOG_TYPE_DEFAULT, "%@ Received response, encrypted(%d) error:%{public}@", (uint8_t *)&v13, 0x1Cu);

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 910, v7, CFSTR("Unable to encrypt batch of elements"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

- (id)encryptBatchOfElements:(id)a3 shardIndices:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  _BOOL4 v21;
  uint64_t v22;
  id v23;
  _QWORD v25[7];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  _BOOL4 v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v38 = 0;
  -[CMLSimilarityClient connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMLXPC syncProxyToConnection:error:](CMLXPC, "syncProxyToConnection:error:", v11, &v38);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__0;
  v36 = __Block_byref_object_dispose__0;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__0;
  v30 = __Block_byref_object_dispose__0;
  v31 = 0;
  +[CMLLog client](CMLLog, "client");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v40 = v14;
    _os_log_impl(&dword_237BC8000, v13, OS_LOG_TYPE_DEFAULT, "%@ Sending request", buf, 0xCu);

  }
  -[CMLSimilarityClient clientConfig](self, "clientConfig");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __65__CMLSimilarityClient_encryptBatchOfElements_shardIndices_error___block_invoke;
  v25[3] = &unk_2509A8050;
  v25[4] = &v26;
  v25[5] = &v32;
  v25[6] = a2;
  objc_msgSend(v12, "encryptBatchOfElements:shardIndices:clientConfig:reply:", v9, v10, v15, v25);

  if (!v27[5] && !v33[5])
  {
    +[CMLError errorWithCode:description:](CMLError, "errorWithCode:description:", 901, CFSTR("Server returns nil instead of encrypted elements data with empty error"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v33[5];
    v33[5] = v16;

  }
  if (a5)
  {
    v18 = v38;
    if (!v38)
      v18 = (id)v33[5];
    *a5 = objc_retainAutorelease(v18);
  }
  +[CMLLog client](CMLLog, "client");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v27[5] != 0;
    v22 = v33[5];
    *(_DWORD *)buf = 138412802;
    v40 = v20;
    v41 = 1024;
    v42 = v21;
    v43 = 2114;
    v44 = v22;
    _os_log_impl(&dword_237BC8000, v19, OS_LOG_TYPE_DEFAULT, "%@ Request complete, encryptedData(%d) error:%{public}@", buf, 0x1Cu);

  }
  v23 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v23;
}

void __65__CMLSimilarityClient_encryptBatchOfElements_shardIndices_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
    _os_log_impl(&dword_237BC8000, v8, OS_LOG_TYPE_DEFAULT, "%@ Received response, encrypted(%d) error:%{public}@", (uint8_t *)&v13, 0x1Cu);

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 900, v7, CFSTR("Unable to encrypt batch of elements"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

- (id)decryptBatchOfSimilarityScores:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  _BOOL4 v18;
  uint64_t v19;
  id v20;
  _QWORD v22[7];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v35 = 0;
  -[CMLSimilarityClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMLXPC syncProxyToConnection:error:](CMLXPC, "syncProxyToConnection:error:", v8, &v35);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__0;
  v33 = __Block_byref_object_dispose__0;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  v28 = 0;
  +[CMLLog client](CMLLog, "client");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v37 = v11;
    _os_log_impl(&dword_237BC8000, v10, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);

  }
  -[CMLSimilarityClient clientConfig](self, "clientConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __60__CMLSimilarityClient_decryptBatchOfSimilarityScores_error___block_invoke;
  v22[3] = &unk_2509A8028;
  v22[4] = &v23;
  v22[5] = &v29;
  v22[6] = a2;
  objc_msgSend(v9, "decryptBatchOfSimilarityScores:clientConfig:reply:", v7, v12, v22);

  if (!v24[5] && !v30[5])
  {
    +[CMLError errorWithCode:description:](CMLError, "errorWithCode:description:", 1001, CFSTR("Server returns nil instead of batch of decrypted scores with empty error"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v30[5];
    v30[5] = v13;

  }
  if (a4)
  {
    v15 = v35;
    if (!v35)
      v15 = (id)v30[5];
    *a4 = objc_retainAutorelease(v15);
  }
  +[CMLLog client](CMLLog, "client");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v24[5] != 0;
    v19 = v30[5];
    *(_DWORD *)buf = 138412802;
    v37 = v17;
    v38 = 1024;
    v39 = v18;
    v40 = 2114;
    v41 = v19;
    _os_log_impl(&dword_237BC8000, v16, OS_LOG_TYPE_DEFAULT, "%@ Request complete, scores(%d) error:%{public}@", buf, 0x1Cu);

  }
  v20 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v20;
}

void __60__CMLSimilarityClient_decryptBatchOfSimilarityScores_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
    _os_log_impl(&dword_237BC8000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, scores(%d), error:%{public}@", (uint8_t *)&v13, 0x1Cu);

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 1000, v7, CFSTR("Unable to decrypt batch of similarity scores"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

- (id)asyncResponseSimilarityScoresForElements:(id)a3 shardIndex:(unint64_t)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = a3;
  objc_msgSend(v8, "numberWithUnsignedInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMLSimilarityClient asyncResponseSimilarityScoresForElements:shardIndices:error:](self, "asyncResponseSimilarityScoresForElements:shardIndices:error:", v9, v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)asyncResponseSimilarityScoresForElements:(id)a3 shardIndices:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
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
  v10 = a4;
  v32 = 0;
  -[CMLSimilarityClient connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMLXPC syncProxyToConnection:error:](CMLXPC, "syncProxyToConnection:error:", v11, &v32);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__0;
  v30 = __Block_byref_object_dispose__0;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
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
  -[CMLSimilarityClient clientConfig](self, "clientConfig");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __83__CMLSimilarityClient_asyncResponseSimilarityScoresForElements_shardIndices_error___block_invoke;
  v19[3] = &unk_2509A8078;
  v19[4] = &v20;
  v19[5] = &v26;
  v19[6] = a2;
  objc_msgSend(v12, "asyncResponseSimilarityScoresForElements:shardIndices:clientConfig:reply:", v9, v10, v15, v19);

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

void __83__CMLSimilarityClient_asyncResponseSimilarityScoresForElements_shardIndices_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
  id v16;
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
    v15 = 2112;
    v16 = v6;
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_237BC8000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, asyncResponseId(%@) error:%{public}@", (uint8_t *)&v13, 0x20u);

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 602, v7, CFSTR("Unable to calculate similarity scores for element with async response due to errors"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

- (CMLSimilarityClient)init
{

  return 0;
}

+ (id)new
{
  return 0;
}

- (CMLClientConfig)clientConfig
{
  return self->_clientConfig;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (CMLPECConfig)clientPecConfig
{
  return self->_clientPecConfig;
}

- (void)setClientPecConfig:(id)a3
{
  self->_clientPecConfig = (CMLPECConfig *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_clientConfig, 0);
}

- (void)initWithClientConfig:(uint64_t)a1 dispatchQueue:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_237BC8000, a2, OS_LOG_TYPE_ERROR, "could not create connection to %@", (uint8_t *)&v2, 0xCu);
}

@end
