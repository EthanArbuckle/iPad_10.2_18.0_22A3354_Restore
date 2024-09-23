@implementation CMLKeywordPIRClient

- (void)requestDataByStringKeyword:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CMLKeywordPIRClient requestDataByKeyword:completionHandler:](self, "requestDataByKeyword:completionHandler:", v7, v6);

}

- (void)requestDataByStringKeyword:(id)a3 shardId:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CMLKeywordPIRClient requestDataByKeyword:shardId:completionHandler:](self, "requestDataByKeyword:shardId:completionHandler:", v10, v9, v8);

}

- (void)requestDataByStringKeywords:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = (void *)MEMORY[0x24BDBCEB8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __69__CMLKeywordPIRClient_requestDataByStringKeywords_completionHandler___block_invoke;
  v12[3] = &unk_2509A8208;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);

  v10 = (void *)objc_msgSend(v11, "copy");
  -[CMLKeywordPIRClient requestDataByKeywords:completionHandler:](self, "requestDataByKeywords:completionHandler:", v10, v7);

}

void __69__CMLKeywordPIRClient_requestDataByStringKeywords_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "dataUsingEncoding:", 4);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)requestDataByStringKeywords:(id)a3 shardIds:(id)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = (void *)MEMORY[0x24BDBCEB8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __78__CMLKeywordPIRClient_requestDataByStringKeywords_shardIds_completionHandler___block_invoke;
  v14[3] = &unk_2509A8208;
  v15 = v12;
  v13 = v12;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v14);

  -[CMLKeywordPIRClient requestDataByKeywords:shardIds:completionHandler:](self, "requestDataByKeywords:shardIds:completionHandler:", v13, v10, v9);
}

void __78__CMLKeywordPIRClient_requestDataByStringKeywords_shardIds_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "dataUsingEncoding:", 4);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)requestDataByKeyword:(id)a3 completionHandler:(id)a4
{
  -[CMLKeywordPIRClient requestDataByKeyword:shardId:completionHandler:](self, "requestDataByKeyword:shardId:completionHandler:", a3, 0, a4);
}

- (void)requestDataByKeyword:(id)a3 shardId:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  _QWORD *v21;
  SEL v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__2;
  v23[4] = __Block_byref_object_dispose__2;
  v24 = 0;
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __70__CMLKeywordPIRClient_requestDataByKeyword_shardId_completionHandler___block_invoke;
  v19 = &unk_2509A8230;
  v21 = v23;
  v12 = v11;
  v20 = v12;
  v22 = a2;
  v13 = _Block_copy(&v16);
  if (v10)
  {
    v26[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1, v16, v17, v18, v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = (void *)MEMORY[0x24BDBD1A8];
  }
  v25 = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1, v16, v17, v18, v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMLKeywordPIRClient requestDataByKeywords:shardIds:completionHandler:](self, "requestDataByKeywords:shardIds:completionHandler:", v15, v14, v13);

  _Block_object_dispose(v23, 8);
}

void __70__CMLKeywordPIRClient_requestDataByKeyword_shardId_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;

  v22 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "underlyingErrors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 400, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  if (v22 && objc_msgSend(v22, "count") == 1)
  {
    objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 == v14)
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      v16 = (void *)MEMORY[0x24BDD17C8];
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ returned no result and no error"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 400, v6, v18);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v21 = *(void **)(v20 + 40);
      *(_QWORD *)(v20 + 40) = v19;

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)requestDataByKeywords:(id)a3 completionHandler:(id)a4
{
  -[CMLKeywordPIRClient requestDataByKeywords:shardIds:completionHandler:](self, "requestDataByKeywords:shardIds:completionHandler:", a3, 0, a4);
}

- (void)requestDataByKeywords:(id)a3 shardIds:(id)a4 completionHandler:(id)a5
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
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  uint64_t *v25;
  SEL v26;
  _QWORD aBlock[4];
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v12 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__CMLKeywordPIRClient_requestDataByKeywords_shardIds_completionHandler___block_invoke;
  aBlock[3] = &unk_2509A7FB0;
  v13 = v11;
  v28 = v13;
  v14 = _Block_copy(aBlock);
  -[CMLPIRClient connection](self, "connection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMLPIRClient dispatchQueue](self, "dispatchQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMLXPC asyncProxyToConnection:dispatchQueue:callbackWasCalled:errorHandler:](CMLXPC, "asyncProxyToConnection:dispatchQueue:callbackWasCalled:errorHandler:", v15, v16, v30 + 3, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = __72__CMLKeywordPIRClient_requestDataByKeywords_shardIds_completionHandler___block_invoke_2;
  v23[3] = &unk_2509A8000;
  v25 = &v29;
  v26 = a2;
  v23[4] = self;
  v18 = v13;
  v24 = v18;
  v19 = _Block_copy(v23);
  +[CMLLog client](CMLLog, "client");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v34 = v21;
    _os_log_impl(&dword_237BC8000, v20, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);

  }
  -[CMLPIRClient clientConfig](self, "clientConfig");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "requestDataByKeywords:shardIds:clientConfig:reply:", v9, v10, v22, v19);

  _Block_object_dispose(&v29, 8);
}

uint64_t __72__CMLKeywordPIRClient_requestDataByKeywords_shardIds_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__CMLKeywordPIRClient_requestDataByKeywords_shardIds_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
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
    v22 = v9;
    v23 = 2048;
    v24 = v7;
    v25 = 2114;
    v26 = v6;
    _os_log_impl(&dword_237BC8000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, results(%lu) error:%{public}@", buf, 0x20u);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  if (!v5)
  {
    if (v6)
      goto LABEL_9;
LABEL_10:
    +[CMLError errorWithCode:description:](CMLError, "errorWithCode:description:", 401, CFSTR("requestDataByKeywords resulted in no results and no error"));
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v10 = objc_msgSend(v5, "count");
  if (!v6 && !v10)
    goto LABEL_10;
  if (v6)
  {
LABEL_9:
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 401, v6, CFSTR("Unable to request data by keywords batch"));
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v11 = (void *)v12;
    goto LABEL_12;
  }
  v11 = 0;
LABEL_12:
  objc_msgSend(*(id *)(a1 + 32), "dispatchQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__CMLKeywordPIRClient_requestDataByKeywords_shardIds_completionHandler___block_invoke_103;
  block[3] = &unk_2509A7FD8;
  v14 = *(id *)(a1 + 40);
  v19 = v11;
  v20 = v14;
  v18 = v5;
  v15 = v11;
  v16 = v5;
  dispatch_async(v13, block);

}

uint64_t __72__CMLKeywordPIRClient_requestDataByKeywords_shardIds_completionHandler___block_invoke_103(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)dataByStringKeyword:(id)a3 error:(id *)a4
{
  return -[CMLKeywordPIRClient dataByStringKeyword:shardId:error:](self, "dataByStringKeyword:shardId:error:", a3, 0, a4);
}

- (id)dataByStringKeyword:(id)a3 shardId:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMLKeywordPIRClient dataByKeyword:shardId:error:](self, "dataByKeyword:shardId:error:", v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)dataByKeyword:(id)a3 error:(id *)a4
{
  return -[CMLKeywordPIRClient dataByKeyword:shardId:error:](self, "dataByKeyword:shardId:error:", a3, 0, a4);
}

- (id)dataByKeyword:(id)a3 shardId:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    v24[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDBD1A8];
  }
  v23 = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  -[CMLKeywordPIRClient dataByKeywords:shardIds:error:](self, "dataByKeywords:shardIds:error:", v12, v11, &v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v22;

  if (a5 && v14)
  {
    objc_msgSend(v14, "underlyingErrors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "description");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 400, v16, v17);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v13
    && objc_msgSend(v13, "count")
    && (objc_msgSend(v13, "objectAtIndexedSubscript:", 0),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v19,
        v18,
        v18 != v19))
  {
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)dataByStringKeywords:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = (void *)MEMORY[0x24BDBCEB8];
  v7 = a3;
  objc_msgSend(v6, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __50__CMLKeywordPIRClient_dataByStringKeywords_error___block_invoke;
  v12[3] = &unk_2509A8208;
  v13 = v8;
  v9 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);

  -[CMLKeywordPIRClient dataByKeywords:error:](self, "dataByKeywords:error:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __50__CMLKeywordPIRClient_dataByStringKeywords_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "dataUsingEncoding:", 4);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)dataByStringKeywords:(id)a3 shardIds:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v8 = (void *)MEMORY[0x24BDBCEB8];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __59__CMLKeywordPIRClient_dataByStringKeywords_shardIds_error___block_invoke;
  v15[3] = &unk_2509A8208;
  v16 = v11;
  v12 = v11;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v15);

  -[CMLKeywordPIRClient dataByKeywords:shardIds:error:](self, "dataByKeywords:shardIds:error:", v12, v9, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __59__CMLKeywordPIRClient_dataByStringKeywords_shardIds_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "dataUsingEncoding:", 4);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)dataByKeywords:(id)a3 error:(id *)a4
{
  return -[CMLKeywordPIRClient dataByKeywords:shardIds:error:](self, "dataByKeywords:shardIds:error:", a3, MEMORY[0x24BDBD1A8], a4);
}

- (id)dataByKeywords:(id)a3 shardIds:(id)a4 error:(id *)a5
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
  v20[2] = __53__CMLKeywordPIRClient_dataByKeywords_shardIds_error___block_invoke;
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
  objc_msgSend(v12, "requestDataByKeywords:shardIds:clientConfig:reply:", v9, v10, v16, v13);

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

void __53__CMLKeywordPIRClient_dataByKeywords_shardIds_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
    _os_log_impl(&dword_237BC8000, v9, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, results(%lu), error:%{public}@", (uint8_t *)&v14, 0x20u);

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 401, v7, CFSTR("Unable to request data by keywords batch"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
}

- (id)removeCachedEntriesByStringKeywords:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = (void *)MEMORY[0x24BDBCEB8];
  v7 = a3;
  objc_msgSend(v6, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __65__CMLKeywordPIRClient_removeCachedEntriesByStringKeywords_error___block_invoke;
  v12[3] = &unk_2509A8208;
  v13 = v8;
  v9 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);

  -[CMLKeywordPIRClient removeCachedEntriesByKeywords:error:](self, "removeCachedEntriesByKeywords:error:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __65__CMLKeywordPIRClient_removeCachedEntriesByStringKeywords_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "dataUsingEncoding:", 4);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)removeCachedEntriesByKeywords:(id)a3 error:(id *)a4
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
  v17[2] = __59__CMLKeywordPIRClient_removeCachedEntriesByKeywords_error___block_invoke;
  v17[3] = &unk_2509A8258;
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
  objc_msgSend(v9, "removedCachedEntriesByKeywords:clientConfig:reply:", v7, v13, v10);

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

void __59__CMLKeywordPIRClient_removeCachedEntriesByKeywords_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
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
  v5 = a3;
  +[CMLLog client](CMLLog, "client");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = v7;
    v16 = 2048;
    v17 = a2;
    v18 = 2114;
    v19 = v5;
    _os_log_impl(&dword_237BC8000, v6, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, removed (%ldl) entries, error:%{public}@", (uint8_t *)&v14, 0x20u);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  if (v5)
  {
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 412, v5, CFSTR("Unable to remove cached entries by keywords"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
}

- (CMLKeywordPIRClient)init
{

  return 0;
}

+ (id)new
{
  return 0;
}

- (id)constructPIRRequestWithKeyword:(id)a3 withEvaluationKey:(BOOL)a4 shardId:(id)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v23[7];
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
  id v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v8 = a4;
  v39 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v36 = 0;
  -[CMLPIRClient connection](self, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMLXPC syncProxyToConnection:error:](CMLXPC, "syncProxyToConnection:error:", v13, &v36);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__2;
  v34 = __Block_byref_object_dispose__2;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  v29 = 0;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __86__CMLKeywordPIRClient_constructPIRRequestWithKeyword_withEvaluationKey_shardId_error___block_invoke;
  v23[3] = &unk_2509A8050;
  v23[5] = &v30;
  v23[6] = a2;
  v23[4] = &v24;
  v15 = _Block_copy(v23);
  +[CMLLog client](CMLLog, "client");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v38 = v17;
    _os_log_impl(&dword_237BC8000, v16, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);

  }
  -[CMLPIRClient pirConfig](self, "pirConfig");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMLPIRClient clientConfig](self, "clientConfig");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constructPIRRequestWithKeyword:withEvaluationKey:shardId:pirConfig:clientConfig:reply:", v11, v8, v12, v18, v19, v15);

  if (a6)
  {
    v20 = v36;
    if (!v36)
      v20 = (id)v31[5];
    *a6 = objc_retainAutorelease(v20);
  }
  v21 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v21;
}

void __86__CMLKeywordPIRClient_constructPIRRequestWithKeyword_withEvaluationKey_shardId_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
    _os_log_impl(&dword_237BC8000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, data(%d), error:%{public}@", (uint8_t *)&v13, 0x1Cu);

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 402, v7, CFSTR("Unable to create PIR request with keyword due to errors"));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6)
      goto LABEL_7;
    +[CMLError errorWithCode:description:](CMLError, "errorWithCode:description:", 403, CFSTR("Unable to create PIR request with keyword due to empty response"));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

LABEL_7:
}

- (id)constructPIRRequestWithKeyword:(id)a3 shardId:(id)a4 error:(id *)a5
{
  return -[CMLKeywordPIRClient constructPIRRequestWithKeyword:withEvaluationKey:shardId:error:](self, "constructPIRRequestWithKeyword:withEvaluationKey:shardId:error:", a3, 0, a4, a5);
}

- (id)constructPIRRequestWithKeyword:(id)a3 error:(id *)a4
{
  return -[CMLKeywordPIRClient constructPIRRequestWithKeyword:shardId:error:](self, "constructPIRRequestWithKeyword:shardId:error:", a3, 0, a4);
}

- (id)constructPIRBatchRequestWithKeywords:(id)a3 shardIds:(id)a4 error:(id *)a5
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
  v20[2] = __75__CMLKeywordPIRClient_constructPIRBatchRequestWithKeywords_shardIds_error___block_invoke;
  v20[3] = &unk_2509A8050;
  v20[5] = &v27;
  v20[6] = a2;
  v20[4] = &v21;
  v13 = _Block_copy(v20);
  if (!v10)
    v10 = (id)MEMORY[0x24BDBD1A8];
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
  objc_msgSend(v12, "constructPIRBatchRequestWithKeywords:shardIds:clientConfig:reply:", v9, v10, v16, v13);

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

void __75__CMLKeywordPIRClient_constructPIRBatchRequestWithKeywords_shardIds_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
    _os_log_impl(&dword_237BC8000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, data(%d), error:%{public}@", (uint8_t *)&v13, 0x1Cu);

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 404, v7, CFSTR("Unable to create PIR request with batch of keywords due to errors"));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6)
      goto LABEL_7;
    +[CMLError errorWithCode:description:](CMLError, "errorWithCode:description:", 405, CFSTR("Unable to create PIR request with batch of keywords due to empty response"));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

LABEL_7:
}

- (id)constructPIRBatchRequestWithKeywords:(id)a3 error:(id *)a4
{
  return -[CMLKeywordPIRClient constructPIRBatchRequestWithKeywords:shardIds:error:](self, "constructPIRBatchRequestWithKeywords:shardIds:error:", a3, 0, a4);
}

- (id)decryptPIRResponse:(id)a3 keyword:(id)a4 shardId:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v23[7];
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
  id v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v36 = 0;
  -[CMLPIRClient connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CMLXPC syncProxyToConnection:error:](CMLXPC, "syncProxyToConnection:error:", v14, &v36);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__2;
  v34 = __Block_byref_object_dispose__2;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  v29 = 0;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __64__CMLKeywordPIRClient_decryptPIRResponse_keyword_shardId_error___block_invoke;
  v23[3] = &unk_2509A8050;
  v23[5] = &v30;
  v23[6] = a2;
  v23[4] = &v24;
  v16 = _Block_copy(v23);
  +[CMLLog client](CMLLog, "client");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v38 = v18;
    _os_log_impl(&dword_237BC8000, v17, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);

  }
  -[CMLPIRClient clientConfig](self, "clientConfig");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "decryptPIRResponse:keyword:shardId:clientConfig:reply:", v11, v12, v13, v19, v16);

  if (a6)
  {
    v20 = v36;
    if (!v36)
      v20 = (id)v31[5];
    *a6 = objc_retainAutorelease(v20);
  }
  v21 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v21;
}

void __64__CMLKeywordPIRClient_decryptPIRResponse_keyword_shardId_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
    _os_log_impl(&dword_237BC8000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, data(%d), error:%{public}@", (uint8_t *)&v13, 0x1Cu);

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 406, v7, CFSTR("Unable to decrypt PIR response with keyword and shardId due to errors"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

- (id)decryptPIRResponse:(id)a3 keyword:(id)a4 error:(id *)a5
{
  return -[CMLKeywordPIRClient decryptPIRResponse:keyword:shardId:error:](self, "decryptPIRResponse:keyword:shardId:error:", a3, a4, 0, a5);
}

- (id)decryptPIRBatchResponse:(id)a3 keywords:(id)a4 error:(id *)a5
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
  v20[2] = __62__CMLKeywordPIRClient_decryptPIRBatchResponse_keywords_error___block_invoke;
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
  objc_msgSend(v12, "decryptPIRBatchResponse:keywords:clientConfig:reply:", v9, v10, v16, v13);

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

void __62__CMLKeywordPIRClient_decryptPIRBatchResponse_keywords_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 408, v7, CFSTR("Unable to decrypt PIR response with batch of keywords due to errors"));
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
      goto LABEL_7;
    +[CMLError errorWithCode:description:](CMLError, "errorWithCode:description:", 409, CFSTR("Unable to decrypt PIR response with batch of keywords due to empty response"));
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

LABEL_7:
}

- (id)asyncResponseDataByKeyword:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v15[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  -[CMLKeywordPIRClient asyncResponseDataByKeywords:error:](self, "asyncResponseDataByKeywords:error:", v7, &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v14;

  if (a4 && v9)
  {
    objc_msgSend(v9, "underlyingErrors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 410, v11, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)asyncResponseDataByKeywords:(id)a3 error:(id *)a4
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
  v17[2] = __57__CMLKeywordPIRClient_asyncResponseDataByKeywords_error___block_invoke;
  v17[3] = &unk_2509A8078;
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
  objc_msgSend(v9, "asyncResponseDataByKeywords:clientConfig:reply:", v7, v13, v10);

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

void __57__CMLKeywordPIRClient_asyncResponseDataByKeywords_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
    +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 411, v7, CFSTR("Unable to request data by keywords batch with async response"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

@end
