@implementation HKDatabaseValidation

- (HKDatabaseValidation)initWithHealthStore:(id)a3
{
  id v5;
  HKDatabaseValidation *v6;
  uint64_t v7;
  NSUUID *identifier;
  HKTaskServerProxyProvider *v9;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v11;
  OS_dispatch_queue *queue;
  uint64_t v13;
  NSMutableDictionary *integrityErrorHandlerDict;
  uint64_t v15;
  NSMutableDictionary *validationErrorHandlerDict;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HKDatabaseValidation;
  v6 = -[HKDatabaseValidation init](&v18, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSUUID *)v7;

    objc_storeStrong((id *)&v6->_healthStore, a3);
    v9 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:]([HKTaskServerProxyProvider alloc], "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v6->_healthStore, CFSTR("HKDatabaseValidationTaskServerIdentifier"), v6, v6->_identifier);
    proxyProvider = v6->_proxyProvider;
    v6->_proxyProvider = v9;

    -[HKProxyProvider setShouldRetryOnInterruption:](v6->_proxyProvider, "setShouldRetryOnInterruption:", 0);
    HKCreateSerialDispatchQueue(v6, CFSTR("resource"));
    v11 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v11;

    v13 = objc_opt_new();
    integrityErrorHandlerDict = v6->_integrityErrorHandlerDict;
    v6->_integrityErrorHandlerDict = (NSMutableDictionary *)v13;

    v15 = objc_opt_new();
    validationErrorHandlerDict = v6->_validationErrorHandlerDict;
    v6->_validationErrorHandlerDict = (NSMutableDictionary *)v15;

  }
  return v6;
}

- (void)performIntegrityCheckOnDatabase:(int64_t)a3 identifier:(id)a4 errorHandler:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSMutableDictionary *integrityErrorHandlerDict;
  void *v13;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  int64_t v23;

  v10 = a4;
  v11 = a6;
  integrityErrorHandlerDict = self->_integrityErrorHandlerDict;
  v13 = _Block_copy(a5);
  -[NSMutableDictionary setObject:forKey:](integrityErrorHandlerDict, "setObject:forKey:", v13, v10);

  proxyProvider = self->_proxyProvider;
  v15 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __91__HKDatabaseValidation_performIntegrityCheckOnDatabase_identifier_errorHandler_completion___block_invoke;
  v20[3] = &unk_1E37EAED0;
  v23 = a3;
  v20[4] = self;
  v21 = v10;
  v22 = v11;
  v18[0] = v15;
  v18[1] = 3221225472;
  v18[2] = __91__HKDatabaseValidation_performIntegrityCheckOnDatabase_identifier_errorHandler_completion___block_invoke_3;
  v18[3] = &unk_1E37E69F8;
  v18[4] = self;
  v19 = v22;
  v16 = v22;
  v17 = v10;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v20, v18);

}

void __91__HKDatabaseValidation_performIntegrityCheckOnDatabase_identifier_errorHandler_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __91__HKDatabaseValidation_performIntegrityCheckOnDatabase_identifier_errorHandler_completion___block_invoke_2;
  v5[3] = &unk_1E37E67C0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "remote_validateDatabase:clientCompletionHandler:errorHandlerIdentifier:", v4, v5, *(_QWORD *)(a1 + 40));

}

void __91__HKDatabaseValidation_performIntegrityCheckOnDatabase_identifier_errorHandler_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;
  v6 = a3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __91__HKDatabaseValidation_performIntegrityCheckOnDatabase_identifier_errorHandler_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_ERROR))
    __91__HKDatabaseValidation_performIntegrityCheckOnDatabase_identifier_errorHandler_completion___block_invoke_3_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)validateEntitiesWithIdentifier:(id)a3 errorHandler:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSMutableDictionary *validationErrorHandlerDict;
  void *v11;
  uint64_t v12;
  HKTaskServerProxyProvider *proxyProvider;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v8 = a3;
  v9 = a5;
  validationErrorHandlerDict = self->_validationErrorHandlerDict;
  v11 = _Block_copy(a4);
  -[NSMutableDictionary setObject:forKey:](validationErrorHandlerDict, "setObject:forKey:", v11, v8);

  v12 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __79__HKDatabaseValidation_validateEntitiesWithIdentifier_errorHandler_completion___block_invoke;
  v18[3] = &unk_1E37EAEF8;
  v18[4] = self;
  v19 = v8;
  v20 = v9;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __79__HKDatabaseValidation_validateEntitiesWithIdentifier_errorHandler_completion___block_invoke_3;
  v16[3] = &unk_1E37E69F8;
  v16[4] = self;
  v17 = v20;
  v14 = v20;
  v15 = v8;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v18, v16);

}

void __79__HKDatabaseValidation_validateEntitiesWithIdentifier_errorHandler_completion___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__HKDatabaseValidation_validateEntitiesWithIdentifier_errorHandler_completion___block_invoke_2;
  v4[3] = &unk_1E37E67C0;
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(a2, "remote_validateEntitiesWithClientCompletionHandler:errorHandlerIdentifier:", v4, *(_QWORD *)(a1 + 40));

}

void __79__HKDatabaseValidation_validateEntitiesWithIdentifier_errorHandler_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = 0;
  v6 = a3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __79__HKDatabaseValidation_validateEntitiesWithIdentifier_errorHandler_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_ERROR))
    __91__HKDatabaseValidation_performIntegrityCheckOnDatabase_identifier_errorHandler_completion___block_invoke_3_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (id)clientInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3B77D8);
}

+ (id)serverInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40E9E8);
}

- (id)exportedInterface
{
  return +[HKDatabaseValidation clientInterface](HKDatabaseValidation, "clientInterface");
}

- (id)remoteInterface
{
  return +[HKDatabaseValidation serverInterface](HKDatabaseValidation, "serverInterface");
}

- (void)connectionInvalidated
{
  NSObject *v3;
  int v4;
  HKDatabaseValidation *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = HKLogDatabase;
  if (os_log_type_enabled((os_log_t)HKLogDatabase, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_19A0E6000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Connection invalidated", (uint8_t *)&v4, 0xCu);
  }
}

- (void)clientRemote_processIntegrityErrorString:(id)a3 errorHandlerIdentifier:(id)a4
{
  id v6;
  void *v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;

  v6 = a3;
  -[NSMutableDictionary valueForKey:](self->_integrityErrorHandlerDict, "valueForKey:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__HKDatabaseValidation_clientRemote_processIntegrityErrorString_errorHandlerIdentifier___block_invoke;
  block[3] = &unk_1E37E6D40;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  dispatch_sync(queue, block);

}

uint64_t __88__HKDatabaseValidation_clientRemote_processIntegrityErrorString_errorHandlerIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)clientRemote_processValidationError:(id)a3 errorHandlerIdentifier:(id)a4
{
  id v6;
  void *v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;

  v6 = a3;
  -[NSMutableDictionary valueForKey:](self->_validationErrorHandlerDict, "valueForKey:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__HKDatabaseValidation_clientRemote_processValidationError_errorHandlerIdentifier___block_invoke;
  block[3] = &unk_1E37E6D40;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  dispatch_sync(queue, block);

}

uint64_t __83__HKDatabaseValidation_clientRemote_processValidationError_errorHandlerIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)clientRemote_synchronizeWithCompletion:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__HKDatabaseValidation_clientRemote_synchronizeWithCompletion_success_error___block_invoke;
  block[3] = &unk_1E37E6798;
  v16 = a4;
  v14 = v9;
  v15 = v8;
  v11 = v9;
  v12 = v8;
  dispatch_sync(queue, block);

}

uint64_t __77__HKDatabaseValidation_clientRemote_synchronizeWithCompletion_success_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationErrorHandlerDict, 0);
  objc_storeStrong((id *)&self->_integrityErrorHandlerDict, 0);
  objc_storeStrong(&self->_validationErrorHandler, 0);
  objc_storeStrong(&self->_integrityErrorHandler, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __91__HKDatabaseValidation_performIntegrityCheckOnDatabase_identifier_errorHandler_completion___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v0, v1, "%{public}@: Failed to restart task server after connection interruption: %{public}@");
}

@end
