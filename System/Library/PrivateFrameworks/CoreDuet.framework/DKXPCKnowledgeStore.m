@implementation DKXPCKnowledgeStore

uint64_t __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_2_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_3(_QWORD *a1, int a2, void *a3)
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  char v20;
  uint8_t buf[8];
  __int128 v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (((v6 == 0) & a2) != 0)
    v9 = OS_LOG_TYPE_INFO;
  else
    v9 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(v7, v9))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = a2;
    LOWORD(v22) = 2112;
    *(_QWORD *)((char *)&v22 + 2) = v6;
    _os_log_impl(&dword_18DDBE000, v8, v9, "Completed saveObjects with success=%d. Error: %@.", buf, 0x12u);
  }

  v10 = (void *)a1[6];
  if (v10)
  {
    v11 = (void *)a1[5];
    if (!v11)
      __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_3_cold_1();
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_2_7;
    v17[3] = &unk_1E26E5098;
    v19 = v10;
    v20 = a2;
    v18 = v6;
    v13 = v17;
    v14 = v11;
    v15 = (void *)os_transaction_create();
    *(_QWORD *)buf = v12;
    *(_QWORD *)&v22 = 3221225472;
    *((_QWORD *)&v22 + 1) = __cd_dispatch_async_capture_tx_block_invoke_11;
    v23 = &unk_1E26E3380;
    v24 = v15;
    v25 = v13;
    v16 = v15;
    dispatch_async(v14, buf);

  }
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a3);

}

void __84___DKXPCKnowledgeStore_executeQuery_synchronous_error_responseQueue_withCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char isKindOfClass;
  NSObject *v9;
  NSObject *v10;
  BOOL v11;
  os_log_type_t v12;
  _BOOL4 v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD *v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  uint8_t buf[8];
  _BYTE v32[24];
  id v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 40), "handleResults:error:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
    v11 = v6 == 0;
  else
    v11 = 0;
  if (v11)
    v12 = OS_LOG_TYPE_INFO;
  else
    v12 = OS_LOG_TYPE_ERROR;
  v13 = os_log_type_enabled(v9, v12);
  if ((isKindOfClass & 1) != 0)
  {
    if (!v13)
      goto LABEL_13;
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&buf[4] = v7 != 0;
    *(_WORD *)v32 = 2048;
    *(_QWORD *)&v32[2] = objc_msgSend(v7, "count");
    *(_WORD *)&v32[10] = 2112;
    *(_QWORD *)&v32[12] = v6;
    v14 = "Completed executeQuery with success=%d, count=%lu. Error: %@.";
    v15 = v10;
    v16 = v12;
    v17 = 28;
  }
  else
  {
    if (!v13)
      goto LABEL_13;
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v7 != 0;
    *(_WORD *)v32 = 2112;
    *(_QWORD *)&v32[2] = v6;
    v14 = "Completed executeQuery with success=%d. Error: %@.";
    v15 = v10;
    v16 = v12;
    v17 = 18;
  }
  _os_log_impl(&dword_18DDBE000, v15, v16, v14, buf, v17);
LABEL_13:

  v18 = *(void **)(a1 + 56);
  if (v18)
  {
    v19 = *(void **)(a1 + 48);
    if (!v19)
      __84___DKXPCKnowledgeStore_executeQuery_synchronous_error_responseQueue_withCompletion___block_invoke_3_cold_1();
    v20 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __84___DKXPCKnowledgeStore_executeQuery_synchronous_error_responseQueue_withCompletion___block_invoke_2_19;
    v27[3] = &unk_1E26E51F0;
    v30 = v18;
    v28 = v7;
    v29 = v6;
    v21 = v27;
    v22 = v19;
    v23 = (void *)os_transaction_create();
    *(_QWORD *)buf = v20;
    *(_QWORD *)v32 = 3221225472;
    *(_QWORD *)&v32[8] = __cd_dispatch_async_capture_tx_block_invoke_11;
    *(_QWORD *)&v32[16] = &unk_1E26E3380;
    v33 = v23;
    v34 = v21;
    v24 = v23;
    dispatch_async(v22, buf);

  }
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
  v25 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v26 = *(void **)(v25 + 40);
  *(_QWORD *)(v25 + 40) = v7;

}

void __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;

  v3 = a2;
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_2();

  v5 = (void *)a1[5];
  if (v5)
  {
    v6 = (void *)a1[4];
    if (!v6)
      __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_1();
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_2;
    v14[3] = &unk_1E26E3380;
    v16 = v5;
    v15 = v3;
    v8 = v14;
    v9 = v6;
    v10 = (void *)os_transaction_create();
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_11;
    block[3] = &unk_1E26E3380;
    v18 = v10;
    v19 = v8;
    v11 = v10;
    dispatch_async(v9, block);

  }
  v12 = *(_QWORD *)(a1[6] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

uint64_t __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __79___DKXPCKnowledgeStore_deleteObjects_synchronous_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79___DKXPCKnowledgeStore_deleteObjects_synchronous_responseQueue_withCompletion___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;

  v3 = a2;
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_2();

  v5 = (void *)a1[5];
  if (v5)
  {
    v6 = (void *)a1[4];
    if (!v6)
      __79___DKXPCKnowledgeStore_deleteObjects_synchronous_responseQueue_withCompletion___block_invoke_2_cold_1();
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __79___DKXPCKnowledgeStore_deleteObjects_synchronous_responseQueue_withCompletion___block_invoke_2_9;
    v14[3] = &unk_1E26E3380;
    v16 = v5;
    v15 = v3;
    v8 = v14;
    v9 = v6;
    v10 = (void *)os_transaction_create();
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_11;
    block[3] = &unk_1E26E3380;
    v18 = v10;
    v19 = v8;
    v11 = v10;
    dispatch_async(v9, block);

  }
  v12 = *(_QWORD *)(a1[6] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

uint64_t __79___DKXPCKnowledgeStore_deleteObjects_synchronous_responseQueue_withCompletion___block_invoke_2_9(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __79___DKXPCKnowledgeStore_deleteObjects_synchronous_responseQueue_withCompletion___block_invoke_3(_QWORD *a1, int a2, void *a3)
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  char v20;
  uint8_t buf[8];
  __int128 v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (((v6 == 0) & a2) != 0)
    v9 = OS_LOG_TYPE_INFO;
  else
    v9 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(v7, v9))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = a2;
    LOWORD(v22) = 2112;
    *(_QWORD *)((char *)&v22 + 2) = v6;
    _os_log_impl(&dword_18DDBE000, v8, v9, "Completed deleteObjects with success=%d. Error: %@.", buf, 0x12u);
  }

  v10 = (void *)a1[6];
  if (v10)
  {
    v11 = (void *)a1[5];
    if (!v11)
      __79___DKXPCKnowledgeStore_deleteObjects_synchronous_responseQueue_withCompletion___block_invoke_3_cold_1();
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __79___DKXPCKnowledgeStore_deleteObjects_synchronous_responseQueue_withCompletion___block_invoke_2_10;
    v17[3] = &unk_1E26E5098;
    v19 = v10;
    v20 = a2;
    v18 = v6;
    v13 = v17;
    v14 = v11;
    v15 = (void *)os_transaction_create();
    *(_QWORD *)buf = v12;
    *(_QWORD *)&v22 = 3221225472;
    *((_QWORD *)&v22 + 1) = __cd_dispatch_async_capture_tx_block_invoke_11;
    v23 = &unk_1E26E3380;
    v24 = v15;
    v25 = v13;
    v16 = v15;
    dispatch_async(v14, buf);

  }
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a3);

}

uint64_t __79___DKXPCKnowledgeStore_deleteObjects_synchronous_responseQueue_withCompletion___block_invoke_2_10(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __100___DKXPCKnowledgeStore_deleteAllEventsInEventStream_synchronous_error_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __100___DKXPCKnowledgeStore_deleteAllEventsInEventStream_synchronous_error_responseQueue_withCompletion___block_invoke_11(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;

  v3 = a2;
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_2();

  v5 = (void *)a1[5];
  if (v5)
  {
    v6 = (void *)a1[4];
    if (!v6)
      __100___DKXPCKnowledgeStore_deleteAllEventsInEventStream_synchronous_error_responseQueue_withCompletion___block_invoke_11_cold_1();
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __100___DKXPCKnowledgeStore_deleteAllEventsInEventStream_synchronous_error_responseQueue_withCompletion___block_invoke_2;
    v14[3] = &unk_1E26E3380;
    v16 = v5;
    v15 = v3;
    v8 = v14;
    v9 = v6;
    v10 = (void *)os_transaction_create();
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_11;
    block[3] = &unk_1E26E3380;
    v18 = v10;
    v19 = v8;
    v11 = v10;
    dispatch_async(v9, block);

  }
  v12 = *(_QWORD *)(a1[6] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

uint64_t __100___DKXPCKnowledgeStore_deleteAllEventsInEventStream_synchronous_error_responseQueue_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __100___DKXPCKnowledgeStore_deleteAllEventsInEventStream_synchronous_error_responseQueue_withCompletion___block_invoke_3(_QWORD *a1, uint64_t a2, void *a3)
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  _BYTE buf[24];
  void *v21;
  id v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    v9 = OS_LOG_TYPE_ERROR;
  else
    v9 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(v7, v9))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = a2;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_18DDBE000, v8, v9, "Completed deleteAllEventsInEventStreamNamed with count=%lu. Error: %@.", buf, 0x16u);
  }

  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = a2;
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), a3);
  v10 = (void *)a1[6];
  if (v10)
  {
    v11 = (void *)a1[5];
    if (!v11)
      __100___DKXPCKnowledgeStore_deleteAllEventsInEventStream_synchronous_error_responseQueue_withCompletion___block_invoke_3_cold_1();
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __100___DKXPCKnowledgeStore_deleteAllEventsInEventStream_synchronous_error_responseQueue_withCompletion___block_invoke_2_12;
    v17[3] = &unk_1E26E6BA8;
    v18 = v10;
    v19 = *(_OWORD *)(a1 + 7);
    v13 = v17;
    v14 = v11;
    v15 = (void *)os_transaction_create();
    *(_QWORD *)buf = v12;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __cd_dispatch_async_capture_tx_block_invoke_11;
    v21 = &unk_1E26E3380;
    v22 = v15;
    v23 = v13;
    v16 = v15;
    dispatch_async(v14, buf);

  }
}

uint64_t __100___DKXPCKnowledgeStore_deleteAllEventsInEventStream_synchronous_error_responseQueue_withCompletion___block_invoke_2_12(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

uint64_t __104___DKXPCKnowledgeStore_deleteAllEventsMatchingPredicate_synchronous_error_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __104___DKXPCKnowledgeStore_deleteAllEventsMatchingPredicate_synchronous_error_responseQueue_withCompletion___block_invoke_14(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;

  v3 = a2;
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_2();

  v5 = (void *)a1[5];
  if (v5)
  {
    v6 = (void *)a1[4];
    if (!v6)
      __104___DKXPCKnowledgeStore_deleteAllEventsMatchingPredicate_synchronous_error_responseQueue_withCompletion___block_invoke_14_cold_1();
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __104___DKXPCKnowledgeStore_deleteAllEventsMatchingPredicate_synchronous_error_responseQueue_withCompletion___block_invoke_2;
    v14[3] = &unk_1E26E3380;
    v16 = v5;
    v15 = v3;
    v8 = v14;
    v9 = v6;
    v10 = (void *)os_transaction_create();
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_11;
    block[3] = &unk_1E26E3380;
    v18 = v10;
    v19 = v8;
    v11 = v10;
    dispatch_async(v9, block);

  }
  v12 = *(_QWORD *)(a1[6] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

uint64_t __104___DKXPCKnowledgeStore_deleteAllEventsMatchingPredicate_synchronous_error_responseQueue_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __104___DKXPCKnowledgeStore_deleteAllEventsMatchingPredicate_synchronous_error_responseQueue_withCompletion___block_invoke_3(_QWORD *a1, uint64_t a2, void *a3)
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  _BYTE buf[24];
  void *v21;
  id v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    v9 = OS_LOG_TYPE_ERROR;
  else
    v9 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(v7, v9))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = a2;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_18DDBE000, v8, v9, "Completed deleteAllEventsMatchingPredicate with count=%lu. Error: %@.", buf, 0x16u);
  }

  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = a2;
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), a3);
  v10 = (void *)a1[6];
  if (v10)
  {
    v11 = (void *)a1[5];
    if (!v11)
      __104___DKXPCKnowledgeStore_deleteAllEventsMatchingPredicate_synchronous_error_responseQueue_withCompletion___block_invoke_3_cold_1();
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __104___DKXPCKnowledgeStore_deleteAllEventsMatchingPredicate_synchronous_error_responseQueue_withCompletion___block_invoke_2_15;
    v17[3] = &unk_1E26E6BA8;
    v18 = v10;
    v19 = *(_OWORD *)(a1 + 7);
    v13 = v17;
    v14 = v11;
    v15 = (void *)os_transaction_create();
    *(_QWORD *)buf = v12;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __cd_dispatch_async_capture_tx_block_invoke_11;
    v21 = &unk_1E26E3380;
    v22 = v15;
    v23 = v13;
    v16 = v15;
    dispatch_async(v14, buf);

  }
}

uint64_t __104___DKXPCKnowledgeStore_deleteAllEventsMatchingPredicate_synchronous_error_responseQueue_withCompletion___block_invoke_2_15(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

void __84___DKXPCKnowledgeStore_executeQuery_synchronous_error_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[_DKQuery queryNotExecutableError](_DKQuery, "queryNotExecutableError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __84___DKXPCKnowledgeStore_executeQuery_synchronous_error_responseQueue_withCompletion___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;

  v3 = a2;
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_2();

  v5 = (void *)a1[5];
  if (v5)
  {
    v6 = (void *)a1[4];
    if (!v6)
      __84___DKXPCKnowledgeStore_executeQuery_synchronous_error_responseQueue_withCompletion___block_invoke_2_cold_1();
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __84___DKXPCKnowledgeStore_executeQuery_synchronous_error_responseQueue_withCompletion___block_invoke_2_17;
    v14[3] = &unk_1E26E3380;
    v16 = v5;
    v15 = v3;
    v8 = v14;
    v9 = v6;
    v10 = (void *)os_transaction_create();
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_11;
    block[3] = &unk_1E26E3380;
    v18 = v10;
    v19 = v8;
    v11 = v10;
    dispatch_async(v9, block);

  }
  v12 = *(_QWORD *)(a1[6] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v3;

}

uint64_t __84___DKXPCKnowledgeStore_executeQuery_synchronous_error_responseQueue_withCompletion___block_invoke_2_17(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __84___DKXPCKnowledgeStore_executeQuery_synchronous_error_responseQueue_withCompletion___block_invoke_2_19(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __45___DKXPCKnowledgeStore_synchronizeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_2();

  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);

}

void __45___DKXPCKnowledgeStore_synchronizeWithError___block_invoke_21(uint64_t a1, int a2, void *a3)
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  _DWORD v10[2];
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (((v6 == 0) & a2) != 0)
    v9 = OS_LOG_TYPE_INFO;
  else
    v9 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(v7, v9))
  {
    v10[0] = 67109378;
    v10[1] = a2;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_18DDBE000, v8, v9, "Completed synchronizeWithError with success=%d. Error: %@.", (uint8_t *)v10, 0x12u);
  }

  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

void __60___DKXPCKnowledgeStore_synchronizeWithUrgency_client_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_2();

  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);

}

void __60___DKXPCKnowledgeStore_synchronizeWithUrgency_client_error___block_invoke_22(uint64_t a1, int a2, void *a3)
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  _DWORD v10[2];
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (((v6 == 0) & a2) != 0)
    v9 = OS_LOG_TYPE_INFO;
  else
    v9 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(v7, v9))
  {
    v10[0] = 67109378;
    v10[1] = a2;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_18DDBE000, v8, v9, "Completed synchronizeWithUrgency with success=%d. Error: %@.", (uint8_t *)v10, 0x12u);
  }

  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

void __79___DKXPCKnowledgeStore_synchronizeWithUrgency_client_responseQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;

  v3 = a2;
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_2();

  v5 = *(void **)(a1 + 40);
  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    if (!v6)
      __79___DKXPCKnowledgeStore_synchronizeWithUrgency_client_responseQueue_completion___block_invoke_cold_1();
    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __79___DKXPCKnowledgeStore_synchronizeWithUrgency_client_responseQueue_completion___block_invoke_2;
    v12[3] = &unk_1E26E3380;
    v14 = v5;
    v13 = v3;
    v8 = v12;
    v9 = v6;
    v10 = (void *)os_transaction_create();
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_11;
    block[3] = &unk_1E26E3380;
    v16 = v10;
    v17 = v8;
    v11 = v10;
    dispatch_async(v9, block);

  }
}

uint64_t __79___DKXPCKnowledgeStore_synchronizeWithUrgency_client_responseQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __79___DKXPCKnowledgeStore_synchronizeWithUrgency_client_responseQueue_completion___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[8];
  __int128 v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (((v5 == 0) & a2) != 0)
    v8 = OS_LOG_TYPE_INFO;
  else
    v8 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(v6, v8))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = a2;
    LOWORD(v20) = 2112;
    *(_QWORD *)((char *)&v20 + 2) = v5;
    _os_log_impl(&dword_18DDBE000, v7, v8, "Completed synchronizeWithUrgency with success=%d. Error: %@.", buf, 0x12u);
  }

  v9 = *(void **)(a1 + 48);
  if (v9)
  {
    v10 = *(void **)(a1 + 40);
    if (!v10)
      __79___DKXPCKnowledgeStore_synchronizeWithUrgency_client_responseQueue_completion___block_invoke_3_cold_1();
    v11 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __79___DKXPCKnowledgeStore_synchronizeWithUrgency_client_responseQueue_completion___block_invoke_2_23;
    v16[3] = &unk_1E26E3380;
    v18 = v9;
    v17 = v5;
    v12 = v16;
    v13 = v10;
    v14 = (void *)os_transaction_create();
    *(_QWORD *)buf = v11;
    *(_QWORD *)&v20 = 3221225472;
    *((_QWORD *)&v20 + 1) = __cd_dispatch_async_capture_tx_block_invoke_11;
    v21 = &unk_1E26E3380;
    v22 = v14;
    v23 = v12;
    v15 = v14;
    dispatch_async(v13, buf);

  }
}

uint64_t __79___DKXPCKnowledgeStore_synchronizeWithUrgency_client_responseQueue_completion___block_invoke_2_23(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __42___DKXPCKnowledgeStore_deleteRemoteState___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_2();

  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);

}

void __42___DKXPCKnowledgeStore_deleteRemoteState___block_invoke_24(uint64_t a1, int a2, void *a3)
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  _DWORD v10[2];
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (((v6 == 0) & a2) != 0)
    v9 = OS_LOG_TYPE_INFO;
  else
    v9 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(v7, v9))
  {
    v10[0] = 67109378;
    v10[1] = a2;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_18DDBE000, v8, v9, "Completed deleteRemoteState with success=%d. Error: %@.", (uint8_t *)v10, 0x12u);
  }

  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

void __54___DKXPCKnowledgeStore_sourceDeviceIdentityWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_2();

  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);

}

void __54___DKXPCKnowledgeStore_sourceDeviceIdentityWithError___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    v9 = OS_LOG_TYPE_ERROR;
  else
    v9 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(v7, v9))
  {
    v12[0] = 67109378;
    v12[1] = v6 == 0;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_18DDBE000, v8, v9, "Completed sourceDeviceIdentityWithError with success=%d. Error: %@.", (uint8_t *)v12, 0x12u);
  }

  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;

}

void __34___DKXPCKnowledgeStore_deviceUUID__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_2();

}

void __34___DKXPCKnowledgeStore_deviceUUID__block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    v9 = OS_LOG_TYPE_ERROR;
  else
    v9 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(v7, v9))
  {
    v12[0] = 67109378;
    v12[1] = v6 == 0;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_18DDBE000, v8, v9, "Completed deviceUUIDWithReply with success=%d. Error: %@.", (uint8_t *)v12, 0x12u);
  }

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;

}

void __51___DKXPCKnowledgeStore_confirmConnectionWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_2();

  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);

}

void __51___DKXPCKnowledgeStore_confirmConnectionWithError___block_invoke_27(uint64_t a1, int a2, void *a3)
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  char v10;
  os_log_type_t v11;
  _DWORD v12[2];
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = v6 == 0;
  v10 = v9 & a2;
  if ((v9 & a2) != 0)
    v11 = OS_LOG_TYPE_INFO;
  else
    v11 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(v7, v11))
  {
    v12[0] = 67109378;
    v12[1] = a2;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_18DDBE000, v8, v11, "Completed confirmConnectionWithError with success=%d. Error: %@.", (uint8_t *)v12, 0x12u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v10 & 1;
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);

}

void __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_1()
{
  __assert_rtn("-[_DKXPCKnowledgeStore saveObjects:synchronous:responseQueue:withCompletion:]_block_invoke", "_DKXPCKnowledgeStore.m", 85, "queue");
}

void __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "XPC error: %@\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __77___DKXPCKnowledgeStore_saveObjects_synchronous_responseQueue_withCompletion___block_invoke_3_cold_1()
{
  __assert_rtn("-[_DKXPCKnowledgeStore saveObjects:synchronous:responseQueue:withCompletion:]_block_invoke", "_DKXPCKnowledgeStore.m", 107, "queue");
}

void __79___DKXPCKnowledgeStore_deleteObjects_synchronous_responseQueue_withCompletion___block_invoke_2_cold_1()
{
  __assert_rtn("-[_DKXPCKnowledgeStore deleteObjects:synchronous:responseQueue:withCompletion:]_block_invoke", "_DKXPCKnowledgeStore.m", 173, "queue");
}

void __79___DKXPCKnowledgeStore_deleteObjects_synchronous_responseQueue_withCompletion___block_invoke_3_cold_1()
{
  __assert_rtn("-[_DKXPCKnowledgeStore deleteObjects:synchronous:responseQueue:withCompletion:]_block_invoke", "_DKXPCKnowledgeStore.m", 196, "queue");
}

void __100___DKXPCKnowledgeStore_deleteAllEventsInEventStream_synchronous_error_responseQueue_withCompletion___block_invoke_11_cold_1()
{
  __assert_rtn("-[_DKXPCKnowledgeStore deleteAllEventsInEventStream:synchronous:error:responseQueue:withCompletion:]_block_invoke", "_DKXPCKnowledgeStore.m", 257, "queue");
}

void __100___DKXPCKnowledgeStore_deleteAllEventsInEventStream_synchronous_error_responseQueue_withCompletion___block_invoke_3_cold_1()
{
  __assert_rtn("-[_DKXPCKnowledgeStore deleteAllEventsInEventStream:synchronous:error:responseQueue:withCompletion:]_block_invoke", "_DKXPCKnowledgeStore.m", 283, "queue");
}

void __104___DKXPCKnowledgeStore_deleteAllEventsMatchingPredicate_synchronous_error_responseQueue_withCompletion___block_invoke_14_cold_1()
{
  __assert_rtn("-[_DKXPCKnowledgeStore deleteAllEventsMatchingPredicate:synchronous:error:responseQueue:withCompletion:]_block_invoke", "_DKXPCKnowledgeStore.m", 343, "queue");
}

void __104___DKXPCKnowledgeStore_deleteAllEventsMatchingPredicate_synchronous_error_responseQueue_withCompletion___block_invoke_3_cold_1()
{
  __assert_rtn("-[_DKXPCKnowledgeStore deleteAllEventsMatchingPredicate:synchronous:error:responseQueue:withCompletion:]_block_invoke", "_DKXPCKnowledgeStore.m", 368, "queue");
}

void __84___DKXPCKnowledgeStore_executeQuery_synchronous_error_responseQueue_withCompletion___block_invoke_2_cold_1()
{
  __assert_rtn("-[_DKXPCKnowledgeStore executeQuery:synchronous:error:responseQueue:withCompletion:]_block_invoke", "_DKXPCKnowledgeStore.m", 429, "queue");
}

void __84___DKXPCKnowledgeStore_executeQuery_synchronous_error_responseQueue_withCompletion___block_invoke_3_cold_1()
{
  __assert_rtn("-[_DKXPCKnowledgeStore executeQuery:synchronous:error:responseQueue:withCompletion:]_block_invoke", "_DKXPCKnowledgeStore.m", 457, "queue");
}

void __79___DKXPCKnowledgeStore_synchronizeWithUrgency_client_responseQueue_completion___block_invoke_cold_1()
{
  __assert_rtn("-[_DKXPCKnowledgeStore synchronizeWithUrgency:client:responseQueue:completion:]_block_invoke", "_DKXPCKnowledgeStore.m", 571, "queue");
}

void __79___DKXPCKnowledgeStore_synchronizeWithUrgency_client_responseQueue_completion___block_invoke_3_cold_1()
{
  __assert_rtn("-[_DKXPCKnowledgeStore synchronizeWithUrgency:client:responseQueue:completion:]_block_invoke", "_DKXPCKnowledgeStore.m", 585, "queue");
}

@end
