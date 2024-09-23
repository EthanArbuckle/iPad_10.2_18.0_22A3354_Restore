@implementation HDDatabaseValidationTaskServer

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E0CB4B70];
}

- (void)remote_validateDatabase:(int64_t)a3 clientCompletionHandler:(id)a4 errorHandlerIdentifier:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  int64_t v22;
  id v23;
  _QWORD v24[5];

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __105__HDDatabaseValidationTaskServer_remote_validateDatabase_clientCompletionHandler_errorHandlerIdentifier___block_invoke;
  v24[3] = &unk_1E6CE8030;
  v24[4] = self;
  v10 = a4;
  -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDStandardTaskServer profile](self, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDatabaseTransactionContext contextForReadingProtectedData](HDDatabaseTransactionContext, "contextForReadingProtectedData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = a3;
  v23 = 0;
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __105__HDDatabaseValidationTaskServer_remote_validateDatabase_clientCompletionHandler_errorHandlerIdentifier___block_invoke_184;
  v19[3] = &unk_1E6CE9280;
  v20 = v11;
  v21 = v8;
  v15 = v8;
  v16 = v11;
  v17 = objc_msgSend(v13, "performTransactionWithContext:error:block:inaccessibilityHandler:", v14, &v23, v19, 0);
  v18 = v23;

  objc_msgSend(v16, "clientRemote_synchronizeWithCompletion:success:error:", v10, v17, v18);
}

void __105__HDDatabaseValidationTaskServer_remote_validateDatabase_clientCompletionHandler_errorHandlerIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = v4;
    HKSensitiveLogItem();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v7;
    _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to call HKDatabaseValidationClient clientRemote_processIntegrityErrorString, with error: %{public}@", (uint8_t *)&v8, 0x16u);

  }
}

uint64_t __105__HDDatabaseValidationTaskServer_remote_validateDatabase_clientCompletionHandler_errorHandlerIdentifier___block_invoke_184(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v5 = a2;
  objc_msgSend(v5, "unprotectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = *MEMORY[0x1E0CB6078];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __105__HDDatabaseValidationTaskServer_remote_validateDatabase_clientCompletionHandler_errorHandlerIdentifier___block_invoke_2;
  v16[3] = &unk_1E6CEF7A0;
  v17 = *(id *)(a1 + 32);
  v18 = *(id *)(a1 + 40);
  v9 = objc_msgSend(v6, "performIntegrityCheckOnDatabase:error:integrityErrorHandler:", v8, a3, v16);

  if (*(_QWORD *)(a1 + 48) && (_DWORD)v9)
  {
    objc_msgSend(v5, "protectedDatabase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0CB5A18];
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __105__HDDatabaseValidationTaskServer_remote_validateDatabase_clientCompletionHandler_errorHandlerIdentifier___block_invoke_186;
    v13[3] = &unk_1E6CEF7A0;
    v14 = *(id *)(a1 + 32);
    v15 = *(id *)(a1 + 40);
    v9 = objc_msgSend(v10, "performIntegrityCheckOnDatabase:error:integrityErrorHandler:", v11, a3, v13);

  }
  return v9;
}

void __105__HDDatabaseValidationTaskServer_remote_validateDatabase_clientCompletionHandler_errorHandlerIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "Integrity issues in unprotected database: %{public}@.", (uint8_t *)&v5, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "clientRemote_processIntegrityErrorString:errorHandlerIdentifier:", v3, *(_QWORD *)(a1 + 40));

}

void __105__HDDatabaseValidationTaskServer_remote_validateDatabase_clientCompletionHandler_errorHandlerIdentifier___block_invoke_186(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "Integrity issues in protected database: %{public}@.", (uint8_t *)&v5, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "clientRemote_processIntegrityErrorString:errorHandlerIdentifier:", v3, *(_QWORD *)(a1 + 40));

}

- (void)remote_validateEntitiesWithClientCompletionHandler:(id)a3 errorHandlerIdentifier:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __108__HDDatabaseValidationTaskServer_remote_validateEntitiesWithClientCompletionHandler_errorHandlerIdentifier___block_invoke;
  v21[3] = &unk_1E6CE8030;
  v21[4] = self;
  v8 = a3;
  -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDStandardTaskServer profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDatabaseTransactionContext contextForReadingProtectedData](HDDatabaseTransactionContext, "contextForReadingProtectedData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v6;
  v20 = 0;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __108__HDDatabaseValidationTaskServer_remote_validateEntitiesWithClientCompletionHandler_errorHandlerIdentifier___block_invoke_188;
  v17[3] = &unk_1E6CEB3F8;
  v17[4] = self;
  v18 = v9;
  v13 = v6;
  v14 = v9;
  v15 = objc_msgSend(v11, "performTransactionWithContext:error:block:inaccessibilityHandler:", v12, &v20, v17, 0);
  v16 = v20;

  objc_msgSend(v14, "clientRemote_synchronizeWithCompletion:success:error:", v8, v15, v16);
}

void __108__HDDatabaseValidationTaskServer_remote_validateEntitiesWithClientCompletionHandler_errorHandlerIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = v4;
    HKSensitiveLogItem();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v7;
    _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to call HKDatabaseValidationClient clientRemote_processValidationError, with error: %{public}@", (uint8_t *)&v8, 0x16u);

  }
}

uint64_t __108__HDDatabaseValidationTaskServer_remote_validateEntitiesWithClientCompletionHandler_errorHandlerIdentifier___block_invoke_188(id *a1, uint64_t a2, uint64_t *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  +[HDDatabase allCurrentAndFutureEntityClasses](HDDatabase, "allCurrentAndFutureEntityClasses");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_opt_class();
        if (objc_msgSend(v10, "isSubclassOfClass:", objc_opt_class()))
        {
          v11 = (void *)objc_opt_class();
          objc_msgSend(a1[4], "profile");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __108__HDDatabaseValidationTaskServer_remote_validateEntitiesWithClientCompletionHandler_errorHandlerIdentifier___block_invoke_2;
          v16[3] = &unk_1E6CEF7C8;
          v17 = a1[5];
          v18 = a1[6];
          objc_msgSend(v11, "validateEntityWithProfile:error:validationErrorHandler:", v12, a3, v16);

          v13 = *a3;
          if (v13)
          {
            v14 = 0;
            goto LABEL_12;
          }
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v7)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_12:

  return v14;
}

void __108__HDDatabaseValidationTaskServer_remote_validateEntitiesWithClientCompletionHandler_errorHandlerIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CB3388]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CB4DE8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CB4DF0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CB4DE0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CB4DF8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ %@ %@ %@ (%@)"), v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  v13 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v12;
    _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "%{public}@.", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "clientRemote_processValidationError:errorHandlerIdentifier:", v3, *(_QWORD *)(a1 + 40));

}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB65A0], "serverInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB65A0], "clientInterface");
}

@end
