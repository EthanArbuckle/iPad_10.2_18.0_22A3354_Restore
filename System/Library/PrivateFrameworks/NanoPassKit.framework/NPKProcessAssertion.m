@implementation NPKProcessAssertion

+ (id)acquireBackgroundTaskAssertionWithExplanation:(id)a3 acquiredHandler:(id)a4 invalidationHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  int v25;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = NPKMyPid();
  v11 = objc_alloc(MEMORY[0x24BE08A10]);
  v12 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __105__NPKProcessAssertion_acquireBackgroundTaskAssertionWithExplanation_acquiredHandler_invalidationHandler___block_invoke;
  v22[3] = &unk_24CFE7E68;
  v13 = v7;
  v25 = v10;
  v23 = v13;
  v24 = v8;
  v14 = v8;
  v15 = (void *)objc_msgSend(v11, "initWithPID:flags:reason:name:withHandler:", v10, 1, 4, v13, v22);
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __105__NPKProcessAssertion_acquireBackgroundTaskAssertionWithExplanation_acquiredHandler_invalidationHandler___block_invoke_8;
  v19[3] = &unk_24CFE7E90;
  v20 = v13;
  v21 = v9;
  v16 = v9;
  v17 = v13;
  objc_msgSend(v15, "setInvalidationHandler:", v19);

  return v15;
}

uint64_t __105__NPKProcessAssertion_acquireBackgroundTaskAssertionWithExplanation_acquiredHandler_invalidationHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  uint64_t v14;
  int v15;
  uint64_t result;
  int v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((_DWORD)a2)
  {
    v6 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (!v6)
      goto LABEL_10;
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_DWORD *)(a1 + 48);
    v17 = 138412546;
    v18 = v8;
    v19 = 1024;
    v20 = v9;
    v10 = "Notice: Acquired process assertion for %@ event with %d.";
    v11 = v7;
    v12 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_8;
  }
  v13 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (!v13)
    goto LABEL_10;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(_DWORD *)(a1 + 48);
    v17 = 138412546;
    v18 = v14;
    v19 = 1024;
    v20 = v15;
    v10 = "Error: Failed to acquire process assertion for %@ event: %d.";
    v11 = v7;
    v12 = OS_LOG_TYPE_ERROR;
LABEL_8:
    _os_log_impl(&dword_213518000, v11, v12, v10, (uint8_t *)&v17, 0x12u);
  }
LABEL_9:

LABEL_10:
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __105__NPKProcessAssertion_acquireBackgroundTaskAssertionWithExplanation_acquiredHandler_invalidationHandler___block_invoke_8(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t result;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Invalidated process assertion for %@ event.", (uint8_t *)&v7, 0xCu);
    }

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)invalidateAssertion:(id)a3
{
  objc_msgSend(a3, "invalidate");
}

@end
