@implementation DASSystemContext

void __35___DASSystemContext_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;

}

void __41___DASSystemContext_defaultPathEvaluator__block_invoke()
{
  uint64_t v0;
  void *v1;

  if (!defaultPathEvaluator_defaultPathEvaluator)
  {
    objc_msgSend(MEMORY[0x1E0CCECB0], "sharedDefaultEvaluator");
    v0 = objc_claimAutoreleasedReturnValue();
    v1 = (void *)defaultPathEvaluator_defaultPathEvaluator;
    defaultPathEvaluator_defaultPathEvaluator = v0;

  }
}

void __52___DASSystemContext_defaultInexpensivePathEvaluator__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  if (!defaultInexpensivePathEvaluator_defaultInexpensivePathEvaluator)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CCECA0]);
    objc_msgSend(v2, "setProhibitExpensivePaths:", 1);
    v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CCECB0]), "initWithEndpoint:parameters:", 0, v2);
    v1 = (void *)defaultInexpensivePathEvaluator_defaultInexpensivePathEvaluator;
    defaultInexpensivePathEvaluator_defaultInexpensivePathEvaluator = v0;

  }
}

BOOL __95___DASSystemContext_addNotificationHandlerForTaskName_withPriority_withParameters_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id to;

  v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 56));
  v4 = objc_loadWeakRetained(&to);

  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 48);
    v6 = objc_loadWeakRetained(&to);
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, objc_msgSend(v6, "allowsDiscretionaryWorkForTask:withPriority:withParameters:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40)));

  }
  objc_destroyWeak(&to);

  return v4 != 0;
}

@end
