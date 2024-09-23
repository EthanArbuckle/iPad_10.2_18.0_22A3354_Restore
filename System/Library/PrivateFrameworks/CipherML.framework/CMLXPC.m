@implementation CMLXPC

+ (id)createConnection
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.ciphermld"), 0);
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "interfaceDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setRemoteObjectInterface:", v3);

    objc_msgSend(v2, "resume");
    v4 = v2;
  }
  else
  {
    +[CMLLog client](CMLLog, "client");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[CMLXPC createConnection].cold.1((uint64_t)CFSTR("com.apple.ciphermld"), v5);

  }
  return v2;
}

+ (id)interfaceDescription
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25688E810);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_similarityScoresForElements_shardIndices_clientConfig_reply_, 0, 1);

  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_decryptBatchOfSimilarityScores_clientConfig_reply_, 0, 1);

  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_listUseCaseGroupsWithReply_, 0, 1);

  return v2;
}

+ (id)syncProxyToConnection:(id)a3 error:(id *)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__CMLXPC_syncProxyToConnection_error___block_invoke;
  v5[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v5[4] = a4;
  objc_msgSend(a3, "synchronousRemoteObjectProxyWithErrorHandler:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __38__CMLXPC_syncProxyToConnection_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void **v6;
  void *v7;

  v3 = a2;
  +[CMLLog client](CMLLog, "client");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __38__CMLXPC_syncProxyToConnection_error___block_invoke_cold_1();

  +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 100, v3, CFSTR("XPC Connection was interrupted"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(void ***)(a1 + 32);
  v7 = *v6;
  *v6 = (void *)v5;

}

+ (id)asyncProxyToConnection:(id)a3 dispatchQueue:(id)a4 callbackWasCalled:(BOOL *)a5 errorHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  BOOL *v18;

  v9 = a4;
  v10 = a6;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __78__CMLXPC_asyncProxyToConnection_dispatchQueue_callbackWasCalled_errorHandler___block_invoke;
  v15[3] = &unk_2509A81B8;
  v17 = v10;
  v18 = a5;
  v16 = v9;
  v11 = v10;
  v12 = v9;
  objc_msgSend(a3, "remoteObjectProxyWithErrorHandler:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __78__CMLXPC_asyncProxyToConnection_dispatchQueue_callbackWasCalled_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BYTE *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  +[CMLLog client](CMLLog, "client");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __38__CMLXPC_syncProxyToConnection_error___block_invoke_cold_1();

  v5 = *(_BYTE **)(a1 + 48);
  if (!*v5)
  {
    *v5 = 1;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __78__CMLXPC_asyncProxyToConnection_dispatchQueue_callbackWasCalled_errorHandler___block_invoke_71;
    v7[3] = &unk_2509A8190;
    v6 = *(NSObject **)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void __78__CMLXPC_asyncProxyToConnection_dispatchQueue_callbackWasCalled_errorHandler___block_invoke_71(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  +[CMLError errorWithCode:underlyingError:description:](CMLError, "errorWithCode:underlyingError:description:", 100, *(_QWORD *)(a1 + 32), CFSTR("XPC Connection was interrupted"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

+ (void)createConnection
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_237BC8000, a2, OS_LOG_TYPE_ERROR, "could not create connection to %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __38__CMLXPC_syncProxyToConnection_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_237BC8000, v0, v1, "Connection was interrupted with %@ : error=%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
