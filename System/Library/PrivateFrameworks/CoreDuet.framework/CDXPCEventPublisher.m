@implementation CDXPCEventPublisher

void __56___CDXPCEventPublisher_activatePublisherWithStreamName___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v6;
  id v7;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "handleEventWithAction:token:descriptor:", a2, a3, v7);

}

void __56___CDXPCEventPublisher_activatePublisherWithStreamName___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __56___CDXPCEventPublisher_activatePublisherWithStreamName___block_invoke_2_cold_1(a1, v2);
}

void __55___CDXPCEventPublisher_sendEvent_toSubscriber_handler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "sendEvent:toSubscriber:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduetd"), 4, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __60___CDXPCEventPublisher_sendEvent_toSubscriber_replyHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "sendEvent:toSubscriber:replyHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduetd"), 4, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __60___CDXPCEventPublisher_sendEvent_toSubscriber_replyHandler___block_invoke_8(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[_CDXPCCodecs errorFromReply:](_CDXPCCodecs, "errorFromReply:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a1[4];
  v6 = *(NSObject **)(v5 + 40);
  if (v4)
  {
    if (os_log_type_enabled(*(os_log_t *)(v5 + 40), OS_LOG_TYPE_ERROR))
    {
      v7 = a1[5];
      v8 = *(_QWORD *)(a1[4] + 16);
      v18 = 138543874;
      v19 = v8;
      v20 = 2114;
      v21 = v7;
      v22 = 2112;
      v23[0] = v4;
      _os_log_error_impl(&dword_18DDBE000, v6, OS_LOG_TYPE_ERROR, "Received error in reply on stream %{public}@ from subscriber %{public}@: %@", (uint8_t *)&v18, 0x20u);
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(v5 + 40), OS_LOG_TYPE_DEBUG))
  {
    if (os_variant_has_internal_diagnostics())
    {
      v9 = (void *)MEMORY[0x193FEEEB4](v3);
      v10 = *(NSObject **)(a1[4] + 40);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v12 = a1[5];
        v13 = *(_QWORD *)(a1[4] + 16);
        v14 = v10;
        v18 = 138544130;
        v19 = v13;
        v20 = 2114;
        v21 = v12;
        v22 = 1024;
        LODWORD(v23[0]) = xpc_dictionary_get_count(v3);
        WORD2(v23[0]) = 2080;
        *(_QWORD *)((char *)v23 + 6) = v9;
        _os_log_debug_impl(&dword_18DDBE000, v14, OS_LOG_TYPE_DEBUG, "Fetched reply on stream %{public}@ from subscriber %{public}@ with %d keys: %s", (uint8_t *)&v18, 0x26u);

        if (!v9)
          goto LABEL_11;
      }
      else if (!v9)
      {
        goto LABEL_11;
      }
      free(v9);
      goto LABEL_11;
    }
    v11 = *(NSObject **)(a1[4] + 40);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v15 = a1[5];
      v16 = *(_QWORD *)(a1[4] + 16);
      v17 = v11;
      v18 = 138543874;
      v19 = v16;
      v20 = 2114;
      v21 = v15;
      v22 = 1024;
      LODWORD(v23[0]) = xpc_dictionary_get_count(v3);
      _os_log_debug_impl(&dword_18DDBE000, v17, OS_LOG_TYPE_DEBUG, "Fetched reply on stream %{public}@ from subscriber %{public}@ with %d keys", (uint8_t *)&v18, 0x1Cu);

    }
  }
LABEL_11:
  (*(void (**)(void))(a1[6] + 16))();

}

uint64_t __51___CDXPCEventPublisher_addToken_descriptor_userID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addSubscriber:", *(_QWORD *)(a1 + 40));
}

uint64_t __36___CDXPCEventPublisher_removeToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeSubscriberWithToken:streamName:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

void __56___CDXPCEventPublisher_activatePublisherWithStreamName___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  xpc_strerror();
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_10(&dword_18DDBE000, v2, v3, "Unexpected error from publisher for stream %{public}s: %s", v4);

  OUTLINED_FUNCTION_7();
}

@end
