@implementation NSItemProvider

void __51__NSItemProvider_SafariExtras__safari_timeoutQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.mobilesafari.NSItemProviderTimeoutQueue", v2);
  v1 = (void *)safari_timeoutQueue_queue;
  safari_timeoutQueue_queue = (uint64_t)v0;

}

uint64_t __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_time_t v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  _QWORD *v27;
  uint64_t *v28;
  uint64_t v29;
  _QWORD aBlock[5];
  id v31;
  id v32;
  id v33;
  _QWORD *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  dispatch_source_t v41;
  _QWORD v42[3];
  char v43;
  uint8_t buf[24];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v43 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__9;
  v40 = __Block_byref_object_dispose__9;
  objc_msgSend(MEMORY[0x1E0CB36C8], "safari_timeoutQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v41 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v5);

  v6 = v37[5];
  v7 = dispatch_time(0, 300000000);
  dispatch_source_set_timer(v6, v7, 0x11E1A300uLL, 0x5F5E100uLL);
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_5;
  aBlock[3] = &unk_1E9CF6E50;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v9 = v4;
  v31 = v9;
  v34 = v42;
  v10 = v3;
  v33 = v10;
  v32 = *(id *)(a1 + 40);
  v35 = &v36;
  v11 = _Block_copy(aBlock);
  dispatch_source_set_event_handler((dispatch_source_t)v37[5], v11);
  dispatch_activate((dispatch_object_t)v37[5]);
  v12 = (id)WBS_LOG_CHANNEL_PREFIXOther();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_cold_1(v14, (uint64_t *)(a1 + 32), buf, v12);
  }

  v15 = *(void **)(a1 + 40);
  v21[0] = v8;
  v21[1] = 3221225472;
  v21[2] = __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_6;
  v21[3] = &unk_1E9CF6EA0;
  v16 = v9;
  v17 = *(_QWORD *)(a1 + 32);
  v22 = v16;
  v23 = v17;
  v27 = v42;
  v28 = &v36;
  v18 = v10;
  v25 = v18;
  v24 = *(id *)(a1 + 40);
  v29 = 0x3FD3333333333333;
  v19 = v11;
  v26 = v19;
  objc_msgSend(v15, "_loadAsynchronousFieldsWithUpdateHandler:", v21);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(v42, 8);

  return 0;
}

void __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = WBS_LOG_CHANNEL_PREFIXOther();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_5_cold_1(a1, v2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  v3 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 48), "dataRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v4, 0);

  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

}

void __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_6(uint64_t a1, char a2)
{
  NSObject *v4;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  uint64_t v14;
  char v15;

  objc_msgSend(MEMORY[0x1E0CB36C8], "safari_timeoutQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_2;
  block[3] = &unk_1E9CF6E78;
  v5 = *(id *)(a1 + 32);
  v15 = a2;
  v6 = *(_QWORD *)(a1 + 40);
  v8 = v5;
  v9 = v6;
  v13 = *(_OWORD *)(a1 + 72);
  v11 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 88);
  v12 = *(id *)(a1 + 64);
  dispatch_async(v4, block);

}

void __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v4 = v3;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    if (*(_BYTE *)(a1 + 96))
    {
      v5 = WBS_LOG_CHANNEL_PREFIXOther();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_2_cold_3(a1, v5);
    }
  }
  else if (*(_BYTE *)(a1 + 96))
  {
    v6 = WBS_LOG_CHANNEL_PREFIXOther();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_2_cold_2(a1, v6);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = 0;

    v9 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 48), "dataRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v10, 0);

  }
  else if (v4 >= *(double *)(a1 + 88))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v11 = WBS_LOG_CHANNEL_PREFIXOther();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_2_cold_1(a1, v11);
  }
}

void __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_cold_1(void *a1, uint64_t *a2, uint8_t *buf, os_log_t log)
{
  uint64_t v5;

  v5 = *a2;
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(_QWORD *)(buf + 14) = v5;
  _os_log_debug_impl(&dword_1D7CA3000, log, OS_LOG_TYPE_DEBUG, "Starting fetch of metadata for copy for <%{public}@: %p>", buf, 0x16u);

}

void __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_5_cold_1(uint64_t a1, void *a2)
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
  v9 = 138543874;
  v10 = v5;
  v11 = 2048;
  v12 = v6;
  v13 = 2048;
  v14 = v8;
  _os_log_debug_impl(&dword_1D7CA3000, v3, OS_LOG_TYPE_DEBUG, "Timed out fetching metadata for copy for <%{public}@: %p> in %fs", (uint8_t *)&v9, 0x20u);

}

void __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_3_1(a1, a2);
  v3 = (objc_class *)OUTLINED_FUNCTION_4_3();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_2_3(&dword_1D7CA3000, v5, v6, "Completed partial fetch of metadata for copy for <%{public}@: %p> in %fs", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_4();
}

void __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_2_cold_2(uint64_t a1, void *a2)
{
  void *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_3_1(a1, a2);
  v3 = (objc_class *)OUTLINED_FUNCTION_4_3();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_2_3(&dword_1D7CA3000, v5, v6, "Completed fetch of metadata for copy for <%{public}@: %p> in %fs", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_4();
}

void __60__NSItemProvider_SafariExtras__safari_registerLinkMetadata___block_invoke_2_cold_3(uint64_t a1, void *a2)
{
  void *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_3_1(a1, a2);
  v3 = (objc_class *)OUTLINED_FUNCTION_4_3();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_2_3(&dword_1D7CA3000, v5, v6, "Timeout exceeded: Completed fetch of metadata for copy for <%{public}@: %p> in %fs", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_4();
}

@end
