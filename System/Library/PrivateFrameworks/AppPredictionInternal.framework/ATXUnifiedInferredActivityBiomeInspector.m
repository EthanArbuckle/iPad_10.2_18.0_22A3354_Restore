@implementation ATXUnifiedInferredActivityBiomeInspector

+ (id)inferredActivityStreamFromName:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("timeBasedInferredActivity")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("appLaunchInferredActivity")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("heuristicInferredActivity")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("computedModeActivity")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("unifiedInferredActivity")))
  {
    v4 = (void *)objc_opt_new();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (void)retrieveInferredActivitySessionsFromPublisherName:(id)a3 startTime:(double)a4 reply:(id)a5
{
  void (**v8)(id, id, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, id, _QWORD))a5;
  objc_msgSend(a1, "inferredActivityStreamFromName:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v9, "sessionPublisherFromStartTime:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __110__ATXUnifiedInferredActivityBiomeInspector_retrieveInferredActivitySessionsFromPublisherName_startTime_reply___block_invoke_2;
    v16[3] = &unk_1E82E3790;
    v17 = v10;
    v12 = v10;
    v13 = (id)objc_msgSend(v11, "sinkWithCompletion:receiveInput:", &__block_literal_global_104, v16);
    v8[2](v8, v12, 0);

    v8 = (void (**)(id, id, _QWORD))v12;
  }
  else
  {
    v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v18 = *MEMORY[0x1E0CB2D50];
    v19[0] = CFSTR("Received invalid stream identifier");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v14, "initWithDomain:code:userInfo:", CFSTR("ATXUnifiedInferredActivityBiomeInspectorErrorDomain"), -1, v15);

    ((void (**)(id, id, void *))v8)[2](v8, (id)MEMORY[0x1E0C9AA60], v11);
  }

}

uint64_t __110__ATXUnifiedInferredActivityBiomeInspector_retrieveInferredActivitySessionsFromPublisherName_startTime_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

+ (void)retrieveInferredActivityTransitionsFromPublisherName:(id)a3 startTime:(double)a4 reply:(id)a5
{
  void (**v8)(id, id, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, id, _QWORD))a5;
  objc_msgSend(a1, "inferredActivityStreamFromName:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v9, "transitionPublisherFromStartTime:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __113__ATXUnifiedInferredActivityBiomeInspector_retrieveInferredActivityTransitionsFromPublisherName_startTime_reply___block_invoke_2;
    v16[3] = &unk_1E82E37D8;
    v17 = v10;
    v12 = v10;
    v13 = (id)objc_msgSend(v11, "sinkWithCompletion:receiveInput:", &__block_literal_global_22, v16);
    v8[2](v8, v12, 0);

    v8 = (void (**)(id, id, _QWORD))v12;
  }
  else
  {
    v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v18 = *MEMORY[0x1E0CB2D50];
    v19[0] = CFSTR("Received invalid stream identifier");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v14, "initWithDomain:code:userInfo:", CFSTR("ATXUnifiedInferredActivityBiomeInspectorErrorDomain"), -1, v15);

    ((void (**)(id, id, void *))v8)[2](v8, (id)MEMORY[0x1E0C9AA60], v11);
  }

}

uint64_t __113__ATXUnifiedInferredActivityBiomeInspector_retrieveInferredActivityTransitionsFromPublisherName_startTime_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
