@implementation ANEProgramForEvaluation

void __100___ANEProgramForEvaluation_processRequest_model_qos_qIndex_modelStringID_options_returnValue_error___block_invoke(uint64_t a1, unsigned int *a2)
{
  NSObject *v4;
  unsigned int v5;
  unsigned int *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  unsigned int v34;
  unsigned int v35;
  int v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  unsigned int v40;
  __int16 v41;
  unsigned int v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  +[_ANELog common](_ANELog, "common");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 96));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = *a2;
    v34 = a2[1];
    v36 = *(_DWORD *)(a1 + 112);
    *(_DWORD *)buf = 138413058;
    v38 = v33;
    v39 = 1024;
    v40 = v34;
    v41 = 1024;
    v42 = v35;
    v43 = 1024;
    v44 = v36;
    _os_log_debug_impl(&dword_1D3352000, v4, OS_LOG_TYPE_DEBUG, "-----> %@: ANEProgramProcessRequestDirect() status=0x%x : statusType=0x%x : qos=0x%x", buf, 0x1Eu);

  }
  v5 = *a2;
  if (*a2 == 19)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    v6 = (unsigned int *)*((_QWORD *)a2 + 1);
    v7 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(*(SEL *)(a1 + 96));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v6)
    {
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: 0x%x"), v8, *v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      +[_ANEErrors programInferenceOverflowErrorForMethod:](_ANEErrors, "programInferenceOverflowErrorForMethod:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

      +[_ANEDataReporter addValue:forScalarKey:](_ANEDataReporter, "addValue:forScalarKey:", 1, CFSTR("InferenceOverflowed"));
      return;
    }
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: Expecting EventPayLoad 0x%x"), v8, *a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    +[_ANEErrors programInferenceOtherErrorForMethod:](_ANEErrors, "programInferenceOtherErrorForMethod:", v23);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v31 = *(void **)(v30 + 40);
    *(_QWORD *)(v30 + 40) = v29;

    +[_ANEDataReporter addValue:forScalarKey:](_ANEDataReporter, "addValue:forScalarKey:", 1, CFSTR("ModelFailsToRun"));
    +[_ANELog common](_ANELog, "common");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 96));
      objc_claimAutoreleasedReturnValue();
      __100___ANEProgramForEvaluation_processRequest_model_qos_qIndex_modelStringID_options_returnValue_error___block_invoke_cold_1();
    }
    goto LABEL_18;
  }
  if (v5 != 8)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    v24 = *(_QWORD *)(a1 + 32);
    v25 = *(void **)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 96));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "programInferenceOtherErrorForMessage:model:methodName:", a2, v24, v23);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v28 = *(NSObject **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;
LABEL_18:

    goto LABEL_19;
  }
  if (a2[1])
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)
    && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 96));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "programInferenceOtherErrorForMessage:model:methodName:", a2, v14, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

  }
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
    goto LABEL_20;
  +[_ANEPerformanceStats statsWithRequestPerformanceBuffer:statsBufferSize:](_ANEPerformanceStats, "statsWithRequestPerformanceBuffer:statsBufferSize:", a2 + 4, a2 + 12);
  v20 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setPerfStats:", v20);

  objc_msgSend(*(id *)(a1 + 48), "perfStats");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v20) = v21 == 0;

  if ((v20 & 1) != 0)
    goto LABEL_20;
  objc_msgSend(*(id *)(a1 + 48), "perfStats");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "hwExecutionTime");

  objc_msgSend(*(id *)(a1 + 48), "perfStats");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "emitPerfcounterSignpostsWithModelStringID:", *(_QWORD *)(a1 + 104));
LABEL_19:

LABEL_20:
  kdebug_trace();
  if (*(_BYTE *)(a1 + 116))
  {
    kdebug_trace();
  }
  else
  {
    if (v5 != 19)
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    kdebug_trace();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "requestsInFlight");
    v32 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v32);

    objc_msgSend(*(id *)(a1 + 40), "setCurrentAsyncRequestsInFlight:", objc_msgSend(*(id *)(a1 + 40), "currentAsyncRequestsInFlight") - 1);
  }
}

void __100___ANEProgramForEvaluation_processRequest_model_qos_qIndex_modelStringID_options_returnValue_error___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  os_log_t v6;

  OUTLINED_FUNCTION_2_1();
  v2 = *(_QWORD *)(v1 + 32);
  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)(v3 + 4) = v4;
  *(_WORD *)(v3 + 12) = 2112;
  *(_QWORD *)(v3 + 14) = v2;
  _os_log_error_impl(&dword_1D3352000, v6, OS_LOG_TYPE_ERROR, "%@: Expecting EventPayLoad lModel=%@", v5, 0x16u);

  OUTLINED_FUNCTION_2_0();
}

@end
