@implementation INIntentTest

+ (id)executeIntent:(id)a3 withHandler:(id)a4
{
  id v5;
  DummyHandlerProvider *v6;
  _INExtensionContext *v7;
  dispatch_semaphore_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  dispatch_semaphore_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  dispatch_semaphore_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  dispatch_semaphore_t v32;
  uint64_t v33;
  dispatch_semaphore_t v34;
  void *v35;
  NSObject *v36;
  INIntentTestResult *v37;
  INIntentTestResult *v38;
  void *v40;
  void *v41;
  id v42;
  _INExtensionContext *v43;
  void *v44;
  _QWORD v45[4];
  NSObject *v46;
  _QWORD v47[4];
  NSObject *v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  _QWORD v63[4];
  NSObject *v64;
  uint64_t *v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  _QWORD v79[4];
  id v80;
  uint64_t *v81;
  _QWORD v82[4];
  NSObject *v83;
  uint64_t *v84;
  uint64_t *v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t (*v96)(uint64_t, uint64_t);
  void (*v97)(uint64_t);
  id v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  char v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _QWORD v107[4];
  NSObject *v108;
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v42 = a4;
  v44 = v5;
  NSLog((NSString *)CFSTR("Testing intent:%@ on handler: %@"), v5, v42);
  v6 = -[DummyHandlerProvider initWithHandler:]([DummyHandlerProvider alloc], "initWithHandler:", v42);
  v7 = [_INExtensionContext alloc];
  v40 = v6;
  v43 = -[_INExtensionContext initWithInputItems:privateIntentHandlerProvider:](v7, "initWithInputItems:privateIntentHandlerProvider:", MEMORY[0x1E0C9AA60], v6);
  v8 = dispatch_semaphore_create(0);
  objc_msgSend(v44, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v107[0] = MEMORY[0x1E0C809B0];
  v107[1] = 3221225472;
  v107[2] = __42__INIntentTest_executeIntent_withHandler___block_invoke;
  v107[3] = &unk_1E2294DE0;
  v10 = v8;
  v108 = v10;
  -[_INExtensionContext beginTransactionWithIntentIdentifier:completion:](v43, "beginTransactionWithIntentIdentifier:completion:", v9, v107);

  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(v44, "_intentInstanceDescription");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v44, "_type") == 2;
  objc_msgSend(v41, "slotDescriptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v6 & 1) == 0)
  {
    objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_19222);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v15 = v12;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v103, v109, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v104;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v104 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v18);
        if (!objc_msgSend(v19, "isPrivate"))
          goto LABEL_12;
        if (INIsInternalInstall_onceToken != -1)
          dispatch_once(&INIsInternalInstall_onceToken, &__block_literal_global_162);
        if (INIsInternalInstall_isInternal)
        {
LABEL_12:
          objc_msgSend(v19, "name");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

        }
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v103, v109, 16);
    }
    while (v16);
  }

  NSLog((NSString *)CFSTR("    Resolving parameters: %@"), v14);
  NSLog((NSString *)CFSTR("    Executing slot resolution..."));
  v99 = 0;
  v100 = &v99;
  v101 = 0x2020000000;
  v102 = 0;
  v93 = 0;
  v94 = &v93;
  v95 = 0x3032000000;
  v96 = __Block_byref_object_copy__19226;
  v97 = __Block_byref_object_dispose__19227;
  v98 = 0;
  v87 = 0;
  v88 = &v87;
  v89 = 0x3032000000;
  v90 = __Block_byref_object_copy__19226;
  v91 = __Block_byref_object_dispose__19227;
  v92 = 0;
  v21 = dispatch_semaphore_create(0);

  v22 = (void *)objc_msgSend(v44, "copy");
  v82[0] = MEMORY[0x1E0C809B0];
  v82[1] = 3221225472;
  v82[2] = __42__INIntentTest_executeIntent_withHandler___block_invoke_74;
  v82[3] = &unk_1E228B530;
  v84 = &v99;
  v85 = &v93;
  v86 = &v87;
  v23 = v21;
  v83 = v23;
  -[_INExtensionContext resolveIntentSlots:forIntent:completionBlock:](v43, "resolveIntentSlots:forIntent:completionBlock:", v14, v22, v82);

  dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
  NSLog((NSString *)CFSTR("    Updated intent:%@"), v94[5]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend((id)v88[5], "count"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)v88[5];
  v79[0] = MEMORY[0x1E0C809B0];
  v79[1] = 3221225472;
  v79[2] = __42__INIntentTest_executeIntent_withHandler___block_invoke_2_85;
  v79[3] = &unk_1E228B558;
  v81 = &v93;
  v26 = v24;
  v80 = v26;
  objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v79);
  if (!*((_BYTE *)v100 + 24))
    objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_89);
  v27 = (void *)objc_msgSend((id)v94[5], "copy");
  v73 = 0;
  v74 = &v73;
  v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__19226;
  v77 = __Block_byref_object_dispose__19227;
  v78 = 0;
  v67 = 0;
  v68 = &v67;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__19226;
  v71 = __Block_byref_object_dispose__19227;
  v72 = 0;
  if (*((_BYTE *)v100 + 24))
  {
    v28 = dispatch_semaphore_create(0);

    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __42__INIntentTest_executeIntent_withHandler___block_invoke_4;
    v63[3] = &unk_1E228B5C0;
    v65 = &v73;
    v66 = &v67;
    v23 = v28;
    v64 = v23;
    -[_INExtensionContext confirmIntent:withCompletion:](v43, "confirmIntent:withCompletion:", v27, v63);
    dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
    NSLog((NSString *)CFSTR("    Confirmation response:%@ with error: %@"), v74[5], v68[5]);

  }
  else
  {
    NSLog((NSString *)CFSTR("    Skipping confirmation as parameter resolution was not successful"));
  }
  v29 = v68[5];
  if (v29)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Unexpected exception confirming Intent"), CFSTR("Encountered error confirming intent: \"%@\", error: %@"), v27, v29);
  v30 = (void *)objc_msgSend((id)v94[5], "copy");
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__19226;
  v61 = __Block_byref_object_dispose__19227;
  v62 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__19226;
  v55 = __Block_byref_object_dispose__19227;
  v56 = 0;
  v31 = (void *)v74[5];
  if (v31 && objc_msgSend(v31, "_intentResponseCode") == 1)
  {
    v32 = dispatch_semaphore_create(0);

    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __42__INIntentTest_executeIntent_withHandler___block_invoke_5;
    v47[3] = &unk_1E228B5C0;
    v49 = &v57;
    v50 = &v51;
    v23 = v32;
    v48 = v23;
    -[_INExtensionContext handleIntent:withCompletion:](v43, "handleIntent:withCompletion:", v30, v47);
    dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
    NSLog((NSString *)CFSTR("    Handle response:%@ with error: %@"), v58[5], v52[5]);

  }
  else
  {
    NSLog((NSString *)CFSTR("    Skipping handle as confirmation was not run or was not successful"));
  }
  v33 = v52[5];
  if (v33)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Unexpected exception handling Intent"), CFSTR("Encountered error handling intent: \"%@\", error: %@"), v30, v33);
  v34 = dispatch_semaphore_create(0);

  objc_msgSend(v44, "identifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __42__INIntentTest_executeIntent_withHandler___block_invoke_6;
  v45[3] = &unk_1E2294DE0;
  v36 = v34;
  v46 = v36;
  -[_INExtensionContext completeTransactionWithIntentIdentifier:completion:](v43, "completeTransactionWithIntentIdentifier:completion:", v35, v45);

  dispatch_semaphore_wait(v36, 0xFFFFFFFFFFFFFFFFLL);
  v37 = [INIntentTestResult alloc];
  v38 = -[INIntentTestResult initWithResolvedIntent:resolvedParameters:resolvedAllParametersSuccesfully:confirmResponse:handleResponse:](v37, "initWithResolvedIntent:resolvedParameters:resolvedAllParametersSuccesfully:confirmResponse:handleResponse:", v94[5], v26, *((unsigned __int8 *)v100 + 24), v74[5], v58[5]);

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v73, 8);

  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(&v93, 8);

  _Block_object_dispose(&v99, 8);
  return v38;
}

intptr_t __42__INIntentTest_executeIntent_withHandler___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __42__INIntentTest_executeIntent_withHandler___block_invoke_74(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  v9 = CFSTR("NO");
  if (a2)
    v9 = CFSTR("YES");
  NSLog((NSString *)CFSTR("    Slot resolution success:%@"), v9);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;
  v15 = v7;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v8;
  v14 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __42__INIntentTest_executeIntent_withHandler___block_invoke_2_85(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  INIntentTestResolvedParameter *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[INIntentTestResolvedParameter initWithParameter:forIntent:extensionContextResolutionResult:]([INIntentTestResolvedParameter alloc], "initWithParameter:forIntent:extensionContextResolutionResult:", v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v5);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v6);
}

void __42__INIntentTest_executeIntent_withHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;

  v7 = a2;
  v8 = a5;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v14 = v7;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v8;
  v13 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __42__INIntentTest_executeIntent_withHandler___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;

  v7 = a2;
  v8 = a5;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v14 = v7;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v8;
  v13 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __42__INIntentTest_executeIntent_withHandler___block_invoke_6(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __42__INIntentTest_executeIntent_withHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v4 = a3;
  objc_msgSend(v4, "extensionContextResolutionResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "result") == 1)
  {
    objc_msgSend(v4, "results");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Unexpected exception resolving parameter"), CFSTR("Encountered error resolving parameter: \"%@\"), v7);
  }
  else
  {

  }
}

uint64_t __42__INIntentTest_executeIntent_withHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "rank");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rank");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

@end
