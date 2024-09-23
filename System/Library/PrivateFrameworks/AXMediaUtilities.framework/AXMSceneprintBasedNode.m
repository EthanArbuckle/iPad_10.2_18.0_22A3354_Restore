@implementation AXMSceneprintBasedNode

- (BOOL)requiresVisionFramework
{
  return 1;
}

+ (id)title
{
  return CFSTR("Sceneprint Creator");
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AXMSceneprintBasedNode;
  v8 = -[AXMEvaluationNode evaluate:metrics:](&v17, sel_evaluate_metrics_, v6, v7);
  v9 = (void *)MEMORY[0x1B5E128FC](v8);
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__AXMSceneprintBasedNode_evaluate_metrics___block_invoke;
  v12[3] = &unk_1E625E738;
  objc_copyWeak(&v15, &location);
  v10 = v6;
  v13 = v10;
  v11 = v7;
  v14 = v11;
  objc_msgSend(v10, "createSceneObservationIfNilWithBlock:", v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  objc_autoreleasePoolPop(v9);

}

id __43__AXMSceneprintBasedNode_evaluate_metrics___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (getVNCreateSceneprintRequestClass())
  {
    v2 = objc_alloc_init((Class)getVNCreateSceneprintRequestClass());
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v8[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "evaluateRequests:withContext:requestHandlerOptions:metrics:error:", v4, *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40), 0);

    -[NSObject results](v2, "results");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    AXMediaLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __43__AXMSceneprintBasedNode_evaluate_metrics___block_invoke_cold_1(v2);
    v6 = 0;
  }

  return v6;
}

void __43__AXMSceneprintBasedNode_evaluate_metrics___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_ERROR, "Could not evaluate. VNCreateSceneprintRequestSoft was nil", v1, 2u);
}

@end
