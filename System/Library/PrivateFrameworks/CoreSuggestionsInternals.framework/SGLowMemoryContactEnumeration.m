@implementation SGLowMemoryContactEnumeration

+ (void)enumerateContactIdentifierBatchesUsingBlock:(id)a3
{
  void (**v3)(id, _QWORD, uint64_t);
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  dispatch_semaphore_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  intptr_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t *v25;
  _QWORD v26[4];
  NSObject *v27;
  NSObject *v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _QWORD v41[3];

  v41[2] = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, _QWORD, uint64_t))a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setLowPriority:", 1);
  objc_msgSend(v4, "setFetchAttributes:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(v4, "setReason:", CFSTR("reason:SGLowMemoryContactEnumeration-1; code:9"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B28]), "initWithQueryString:context:", CFSTR("true"), v4);
  objc_msgSend(v5, "setBundleIDs:", &unk_1E7E107B8);
  objc_msgSend(v5, "setPrivateIndex:", 0);
  if (objc_msgSend(MEMORY[0x1E0D81590], "isDeviceFormattedForProtection"))
  {
    v6 = *MEMORY[0x1E0CB2AE0];
    v41[0] = *MEMORY[0x1E0CB2AC0];
    v41[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProtectionClasses:", v7);

  }
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_queue_create("SGLowMemoryContactEnumeration", v8);

  v10 = dispatch_semaphore_create(0);
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__9534;
  v39 = __Block_byref_object_dispose__9535;
  v40 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __77__SGLowMemoryContactEnumeration_enumerateContactIdentifierBatchesUsingBlock___block_invoke;
  v26[3] = &unk_1E7DAB680;
  v12 = v9;
  v27 = v12;
  v29 = &v31;
  v30 = &v35;
  v13 = v10;
  v28 = v13;
  objc_msgSend(v5, "setFoundItemsHandler:", v26);
  v19 = v11;
  v20 = 3221225472;
  v21 = __77__SGLowMemoryContactEnumeration_enumerateContactIdentifierBatchesUsingBlock___block_invoke_4;
  v22 = &unk_1E7DB1358;
  v14 = v12;
  v23 = v14;
  v25 = &v31;
  v15 = v13;
  v24 = v15;
  objc_msgSend(v5, "setCompletionHandler:", &v19);
  objc_msgSend(v5, "start", v19, v20, v21, v22);
  while (1)
  {
    v16 = dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    if (*((_BYTE *)v32 + 24))
      break;
    v17 = (void *)MEMORY[0x1C3BD4F6C](v16);
    v3[2](v3, v36[5], (uint64_t)(v32 + 3));
    if (*((_BYTE *)v32 + 24))
      objc_msgSend(v5, "cancel");
    objc_autoreleasePoolPop(v17);
    v18 = *((unsigned __int8 *)v32 + 24);
    dispatch_resume(v14);
    if (v18)
      goto LABEL_10;
  }
  dispatch_resume(v14);
LABEL_10:

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

}

+ (void)enumerateContactIdentifiersUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD *v8;
  _QWORD v9[4];

  v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__SGLowMemoryContactEnumeration_enumerateContactIdentifiersUsingBlock___block_invoke;
  v6[3] = &unk_1E7DAB6A8;
  v5 = v4;
  v7 = v5;
  v8 = v9;
  objc_msgSend(a1, "enumerateContactIdentifierBatchesUsingBlock:", v6);

  _Block_object_dispose(v9, 8);
}

void __71__SGLowMemoryContactEnumeration_enumerateContactIdentifiersUsingBlock___block_invoke(uint64_t a1, void *a2, unsigned __int8 *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v12;

  v12 = a2;
  v5 = objc_msgSend(v12, "count");
  if (v5)
  {
    v6 = 0;
    v7 = v5 - 1;
    do
    {
      v8 = (void *)MEMORY[0x1C3BD4F6C]();
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v12, "objectAtIndexedSubscript:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

      LODWORD(v9) = *a3;
      objc_autoreleasePoolPop(v8);
      if ((_DWORD)v9)
        break;
    }
    while (v7 != v6++);
  }

}

void __77__SGLowMemoryContactEnumeration_enumerateContactIdentifierBatchesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[4];
  id v7;
  NSObject *v8;
  id v9;
  __int128 v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__SGLowMemoryContactEnumeration_enumerateContactIdentifierBatchesUsingBlock___block_invoke_2;
  block[3] = &unk_1E7DAB658;
  v10 = *(_OWORD *)(a1 + 48);
  v7 = v3;
  v8 = v4;
  v9 = *(id *)(a1 + 40);
  v5 = v3;
  dispatch_sync(v8, block);

}

void __77__SGLowMemoryContactEnumeration_enumerateContactIdentifierBatchesUsingBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[4];
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__SGLowMemoryContactEnumeration_enumerateContactIdentifierBatchesUsingBlock___block_invoke_5;
  block[3] = &unk_1E7DB4620;
  v10 = *(_QWORD *)(a1 + 48);
  v7 = v3;
  v8 = v4;
  v9 = *(id *)(a1 + 40);
  v5 = v3;
  dispatch_sync(v8, block);

}

intptr_t __77__SGLowMemoryContactEnumeration_enumerateContactIdentifierBatchesUsingBlock___block_invoke_5(intptr_t result)
{
  uint64_t v1;
  intptr_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(*(_QWORD *)(result + 56) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    if (*(_QWORD *)(result + 32))
    {
      sgLogHandle();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      {
        v4 = *(_QWORD *)(v2 + 32);
        v5 = 138412290;
        v6 = v4;
        _os_log_fault_impl(&dword_1C3607000, v3, OS_LOG_TYPE_FAULT, "SGLowMemoryContactEnumeration got an error from Spotlight: %@", (uint8_t *)&v5, 0xCu);
      }

      if (_PASEvaluateLogFaultAndProbCrashCriteria())
        abort();
    }
    dispatch_suspend(*(dispatch_object_t *)(v2 + 40));
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v2 + 48));
  }
  return result;
}

intptr_t __77__SGLowMemoryContactEnumeration_enumerateContactIdentifierBatchesUsingBlock___block_invoke_2(intptr_t result)
{
  intptr_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24))
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 32), "_pas_proxyArrayWithMapping:", &__block_literal_global_9540);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(v1 + 64) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    dispatch_suspend(*(dispatch_object_t *)(v1 + 40));
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 48));
  }
  return result;
}

uint64_t __77__SGLowMemoryContactEnumeration_enumerateContactIdentifierBatchesUsingBlock___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

@end
