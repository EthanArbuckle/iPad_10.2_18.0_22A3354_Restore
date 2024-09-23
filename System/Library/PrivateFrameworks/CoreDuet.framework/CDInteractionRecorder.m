@implementation CDInteractionRecorder

void __45___CDInteractionRecorder_interactionRecorder__block_invoke()
{
  _CDInteractionRecorder *v0;
  void *v1;

  v0 = -[_CDInteractionRecorder initWithServiceName:]([_CDInteractionRecorder alloc], "initWithServiceName:", CFSTR("com.apple.coreduetd.people"));
  v1 = (void *)interactionRecorder_recorder;
  interactionRecorder_recorder = (uint64_t)v0;

}

void __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke()
{
  dispatch_group_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = dispatch_group_create();
  v1 = (void *)recordInteractions_synchronous_completionHandler__group;
  recordInteractions_synchronous_completionHandler__group = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:", "recordInteractions:synchronous:completionHandler:");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)recordInteractions_synchronous_completionHandler__queue;
  recordInteractions_synchronous_completionHandler__queue = v2;

}

void __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_13(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];

  v2 = *(void **)(a1[4] + 8);
  v3 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_2;
  v12[3] = &unk_1E26E6748;
  v12[4] = a1[6];
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_3;
  v8[3] = &unk_1E26E6798;
  v5 = a1[4];
  v6 = (void *)a1[5];
  v9 = v4;
  v10 = v5;
  v11 = a1[7];
  v7 = v4;
  objc_msgSend(v6, "_pas_enumerateChunksOfSize:usingBlock:", 128, v8);
  dispatch_group_leave((dispatch_group_t)recordInteractions_synchronous_completionHandler__group);
  atomic_store(0, recordInteractions_synchronous_completionHandler__flag);

}

void __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_3(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];

  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = a2;
  v8 = objc_msgSend(v6, "enforceDataLimits");
  v9 = objc_msgSend(*(id *)(a1 + 40), "enforcePrivacy");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_4;
  v10[3] = &unk_1E26E6770;
  v10[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v5, "recordInteractions:enforceDataLimits:enforcePrivacy:reply:", v7, v8, v9, v10);

  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) ^ 1;
}

void __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_4(uint64_t a1, int a2)
{
  char v2;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  if (a2)
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18DDBE000, v4, OS_LOG_TYPE_DEFAULT, "[sync path] batch sent successfully", v5, 2u);
    }

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
}

void __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_16(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  dispatch_group_leave((dispatch_group_t)recordInteractions_synchronous_completionHandler__group);
  atomic_store(0, recordInteractions_synchronous_completionHandler__flag);
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);

}

void __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_2_18(uint64_t a1)
{
  unsigned __int8 v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  do
    v2 = __ldaxr(recordInteractions_synchronous_completionHandler__flag);
  while (__stlxr(1u, recordInteractions_synchronous_completionHandler__flag));
  if ((v2 & 1) != 0)
  {
    dispatch_group_enter((dispatch_group_t)recordInteractions_synchronous_completionHandler__group);
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "count");
      *(_DWORD *)buf = 134217984;
      v11 = v5;
      _os_log_impl(&dword_18DDBE000, v4, OS_LOG_TYPE_DEFAULT, "[async path] beginning recordInteractions (%tu interactions)", buf, 0xCu);
    }

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_19;
    v8[3] = &unk_1E26E2FE8;
    v9 = *(id *)(a1 + 48);
    v6 = (void *)MEMORY[0x193FEEAF4](v8);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "remoteObjectProxyWithErrorHandler:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    recordInteractionsAsync(v7, *(void **)(a1 + 32), 0, objc_msgSend(*(id *)(a1 + 40), "enforceDataLimits"), objc_msgSend(*(id *)(a1 + 40), "enforcePrivacy"), *(void **)(a1 + 48));

  }
  else
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DDBE000, v3, OS_LOG_TYPE_DEFAULT, "[async path] It's not our turn yet...", buf, 2u);
    }

    dispatch_group_notify((dispatch_group_t)recordInteractions_synchronous_completionHandler__group, (dispatch_queue_t)recordInteractions_synchronous_completionHandler__queue, *(dispatch_block_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  }
}

void __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_19_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __110___CDInteractionRecorder_queryInteractionsUsingPredicate_synchronous_sortDescriptors_limit_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __86___CDInteractionRecorder_queryInteractionsUsingPredicate_sortDescriptors_limit_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __88___CDInteractionRecorder_countInteractionsUsingPredicate_synchronous_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __64___CDInteractionRecorder_countInteractionsUsingPredicate_error___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __106___CDInteractionRecorder_queryContactsUsingPredicate_synchronous_sortDescriptors_limit_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __82___CDInteractionRecorder_queryContactsUsingPredicate_sortDescriptors_limit_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __84___CDInteractionRecorder_countContactsUsingPredicate_synchronous_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __60___CDInteractionRecorder_countContactsUsingPredicate_error___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __130___CDInteractionRecorder_deleteInteractionsMatchingPredicate_synchronous_sortDescriptors_limit_debuggingReason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __106___CDInteractionRecorder_deleteInteractionsMatchingPredicate_sortDescriptors_limit_debuggingReason_error___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __87___CDInteractionRecorder_deleteInteractionsWithBundleId_synchronous_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __63___CDInteractionRecorder_deleteInteractionsWithBundleId_error___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __95___CDInteractionRecorder_deleteInteractionsWithBundleId_synchronous_account_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __71___CDInteractionRecorder_deleteInteractionsWithBundleId_account_error___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __104___CDInteractionRecorder_deleteInteractionsWithBundleId_synchronous_domainIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __80___CDInteractionRecorder_deleteInteractionsWithBundleId_domainIdentifier_error___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __105___CDInteractionRecorder_deleteInteractionsWithBundleId_synchronous_domainIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61___CDInteractionAdvisor_rankCandidateContacts_usingSettings___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __81___CDInteractionRecorder_deleteInteractionsWithBundleId_domainIdentifiers_error___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __75___CDInteractionRecorder_recordInteractions_synchronous_completionHandler___block_invoke_19_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "[async path] xpc error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
