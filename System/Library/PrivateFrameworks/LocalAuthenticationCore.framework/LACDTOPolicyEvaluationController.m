@implementation LACDTOPolicyEvaluationController

- (LACDTOPolicyEvaluationController)initWithEnvironment:(id)a3 evaluationIdentifierFactory:(id)a4 device:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  LACDTOPolicyEvaluationController *v13;
  LACDTOPolicyEvaluationController *v14;
  uint64_t v15;
  NSHashTable *observers;
  uint64_t v17;
  NSMutableDictionary *pendingRequests;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
    -[LACDTOPolicyEvaluationController initWithEnvironment:evaluationIdentifierFactory:device:].cold.1();
  v12 = v11;
  v20.receiver = self;
  v20.super_class = (Class)LACDTOPolicyEvaluationController;
  v13 = -[LACDTOPolicyEvaluationController init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_environment, a3);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v15 = objc_claimAutoreleasedReturnValue();
    observers = v14->_observers;
    v14->_observers = (NSHashTable *)v15;

    objc_storeStrong((id *)&v14->_device, a5);
    objc_storeStrong((id *)&v14->_evaluationIdentifierFactory, a4);
    v17 = objc_opt_new();
    pendingRequests = v14->_pendingRequests;
    v14->_pendingRequests = (NSMutableDictionary *)v17;

  }
  return v14;
}

- (BOOL)canProcessRequest:(id)a3
{
  return 1;
}

- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __76__LACDTOPolicyEvaluationController_processRequest_configuration_completion___block_invoke;
  v13[3] = &unk_2510C1BD8;
  objc_copyWeak(&v16, &location);
  v11 = v8;
  v14 = v11;
  v12 = v10;
  v15 = v12;
  -[LACDTOPolicyEvaluationController _evaluateRequest:completion:](self, "_evaluateRequest:completion:", v11, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __76__LACDTOPolicyEvaluationController_processRequest_configuration_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = (void *)*((_QWORD *)WeakRetained + 5);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 32), "identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v9);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)postProcessRequest:(id)a3 result:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSMutableDictionary *pendingRequests;
  void *v11;
  void (**v12)(id, id);
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  LACDTOMutablePolicyEvaluationResult *(*v28)(uint64_t);
  void *v29;
  id v30;
  id v31;

  v8 = a3;
  v9 = a4;
  pendingRequests = self->_pendingRequests;
  v11 = (void *)MEMORY[0x24BDD16E0];
  v12 = (void (**)(id, id))a5;
  objc_msgSend(v11, "numberWithUnsignedInt:", objc_msgSend(v8, "identifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](pendingRequests, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = v9;
    objc_msgSend(v8, "options");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1062);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "BOOLValue"))
    {
      objc_msgSend(v8, "options");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[LACDTOPolicyEvaluationController _errorCodesToFilterForOptions:](self, "_errorCodesToFilterForOptions:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[LACDTOPolicyEvaluationController _mapResult:filterCodes:](self, "_mapResult:filterCodes:", v15, v20);
      v21 = objc_claimAutoreleasedReturnValue();

      v15 = (id)v21;
    }
    v26 = MEMORY[0x24BDAC760];
    v27 = 3221225472;
    v28 = __73__LACDTOPolicyEvaluationController_postProcessRequest_result_completion___block_invoke;
    v29 = &unk_2510C1C00;
    v22 = v14;
    v30 = v22;
    v31 = v15;
    v23 = v15;
    __73__LACDTOPolicyEvaluationController_postProcessRequest_result_completion___block_invoke((uint64_t)&v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[LACDTOPolicyEvaluationController _notifyObserversAboutEvaluation:result:](self, "_notifyObserversAboutEvaluation:result:", v22, v24, v26, v27, v28, v29);

    v12[2](v12, v23);
    v12 = (void (**)(id, id))v18;
  }
  else
  {
    LACLogDTOEvaluation();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[LACDTOPolicyEvaluationController postProcessRequest:result:completion:].cold.1(v8, v25);

    v12[2](v12, v9);
  }

}

LACDTOMutablePolicyEvaluationResult *__73__LACDTOPolicyEvaluationController_postProcessRequest_result_completion___block_invoke(uint64_t a1)
{
  LACDTOMutablePolicyEvaluationResult *v2;
  void *v3;
  LACDTOMutablePolicyEvaluationResult *v4;
  void *v5;
  void *v6;

  v2 = [LACDTOMutablePolicyEvaluationResult alloc];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[LACDTOMutablePolicyEvaluationResult initWithIdentifier:](v2, "initWithIdentifier:", v3);

  objc_msgSend(*(id *)(a1 + 40), "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACDTOMutablePolicyEvaluationResult setError:](v4, "setError:", v5);

  objc_msgSend(*(id *)(a1 + 40), "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACDTOMutablePolicyEvaluationResult setResult:](v4, "setResult:", v6);

  return v4;
}

- (void)_evaluateRequest:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  uint64_t v8;
  void *v9;
  BOOL v10;
  id v11;
  LACDTOEnvironmentProviding *environment;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  void (**v18)(id, _QWORD, id);
  id v19;
  id location;
  id v21;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  v8 = objc_msgSend(v6, "policy");
  objc_msgSend(v6, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[LACDTOPolicyEvaluationController canProcessRequest:](self, "canProcessRequest:", v6))
  {
    +[LACEvaluationResult resultWithNext:](LACEvaluationResult, "resultWithNext:", v6);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v11);
    goto LABEL_9;
  }
  v21 = 0;
  v10 = -[LACDTOPolicyEvaluationController _verifyHasRequiredOptions:forPolicy:error:](self, "_verifyHasRequiredOptions:forPolicy:error:", v9, v8, &v21);
  v11 = v21;
  if (!v10)
  {
    +[LACEvaluationResult resultWithFailure:](LACEvaluationResult, "resultWithFailure:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v13);
LABEL_8:

    goto LABEL_9;
  }
  if (!-[LACDTOPolicyEvaluationController _checkDeviceHasBeenUnlockedSinceBoot](self, "_checkDeviceHasBeenUnlockedSinceBoot"))
  {
    +[LACError errorWithCode:subcode:debugDescription:](LACError, "errorWithCode:subcode:debugDescription:", -1008, 1, CFSTR("DTO policies are not available before first unlock"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[LACEvaluationResult resultWithFailure:](LACEvaluationResult, "resultWithFailure:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v14);

    goto LABEL_8;
  }
  objc_initWeak(&location, self);
  environment = self->_environment;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __64__LACDTOPolicyEvaluationController__evaluateRequest_completion___block_invoke;
  v15[3] = &unk_2510C1C28;
  objc_copyWeak(&v19, &location);
  v18 = v7;
  v16 = v6;
  v17 = v9;
  -[LACDTOEnvironmentProviding fetchEnvironmentForPolicy:options:completion:](environment, "fetchEnvironmentForPolicy:options:completion:", v8, v17, v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
LABEL_9:

}

void __64__LACDTOPolicyEvaluationController__evaluateRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      +[LACEvaluationResult resultWithFailure:](LACEvaluationResult, "resultWithFailure:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
    else
    {
      v9 = *(void **)(a1 + 32);
      objc_msgSend(WeakRetained, "_updateEvaluationOptions:environment:", *(_QWORD *)(a1 + 40), v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "updateOptions:", v10);

      objc_msgSend(v7, "_evaluateRequest:environment:completion:", *(_QWORD *)(a1 + 32), v11, *(_QWORD *)(a1 + 48));
    }
  }

}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (BOOL)_verifyHasRequiredOptions:(id)a3 forPolicy:(int64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char isKindOfClass;
  objc_class *v32;
  void *v33;
  void *v34;
  id *v36;
  void *v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _QWORD v44[3];
  _QWORD v45[3];
  void *v46;
  _QWORD v47[3];

  v47[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (a4 == 1026
    && (objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1000),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "objectForKeyedSubscript:", v8),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "BOOLValue"),
        v9,
        v8,
        (v10 & 1) == 0))
  {
    v12 = (void *)MEMORY[0x24BDBCED8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1066);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v13;
    v47[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryWithDictionary:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1000);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17 || (objc_msgSend(v17, "BOOLValue") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v18;
      v45[0] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1064);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v44[1] = v19;
      v45[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1063);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v44[2] = v20;
      v45[2] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addEntriesFromDictionary:", v21);

    }
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(v15, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v22)
    {
      v23 = v22;
      v36 = a5;
      v37 = v17;
      v24 = *(_QWORD *)v40;
      while (2)
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v40 != v24)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v7, "objectForKeyedSubscript:", v26);
          v27 = objc_claimAutoreleasedReturnValue();
          if (!v27)
            goto LABEL_17;
          v28 = (void *)v27;
          objc_msgSend(v7, "objectForKeyedSubscript:", v26);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v26);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0)
          {
LABEL_17:
            objc_msgSend(v15, "objectForKeyedSubscript:", v26);
            v32 = (objc_class *)objc_claimAutoreleasedReturnValue();
            NSStringFromClass(v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing required option (%d) with type '%@'"), objc_msgSend(v26, "integerValue"), v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (v36)
            {
              +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1001, v34);
              *v36 = (id)objc_claimAutoreleasedReturnValue();
            }

            v11 = 0;
            v17 = v37;
            goto LABEL_21;
          }
        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        v11 = 1;
        v17 = v37;
        if (v23)
          continue;
        break;
      }
    }
    else
    {
      v11 = 1;
    }
LABEL_21:

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (id)_updateEvaluationOptions:(id)a3 environment:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = a4;
  v6 = (void *)MEMORY[0x24BDBCED8];
  v7 = a3;
  objc_msgSend(v6, "dictionaryWithDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v5, "isDTOEnabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1078);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v10);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1037);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = objc_msgSend(v5, "isDTOEnabled");

    if (!v13)
      goto LABEL_5;
    +[LACLocalizationUtils encodeLocalizationKey:shouldUseDeviceVariant:](LACLocalizationUtils, "encodeLocalizationKey:shouldUseDeviceVariant:", CFSTR("ENTER_PASSCODE"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1037);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, v12);
  }

LABEL_5:
  if ((objc_msgSend(v5, "allowsAuthenticationFallbacks") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1024);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v14);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1067);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_2510F6B38, v15);

  }
  if ((objc_msgSend(v5, "allowsGracePeriodUI") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1073);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v16);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v5, "isGracePeriodActive"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1082);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, v18);

  return v8;
}

- (void)_evaluateRequest:(id)a3 environment:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *, void *);
  uint64_t v10;
  void *v11;
  void *v12;
  LACDTOPolicyEvaluationIdentifierFactory *evaluationIdentifierFactory;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  uint64_t v32;

  v27 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *, void *))a5;
  v10 = objc_msgSend(v27, "policy");
  objc_msgSend(v27, "options");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "client");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  evaluationIdentifierFactory = self->_evaluationIdentifierFactory;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1066);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACDTOPolicyEvaluationIdentifierFactory evaluationIdentifierForClient:ratchetIdentifier:](evaluationIdentifierFactory, "evaluationIdentifierForClient:ratchetIdentifier:", v12, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __76__LACDTOPolicyEvaluationController__evaluateRequest_environment_completion___block_invoke;
  v28[3] = &unk_2510C1C50;
  v17 = v16;
  v29 = v17;
  v32 = v10;
  v18 = v11;
  v30 = v18;
  v19 = v8;
  v31 = v19;
  __76__LACDTOPolicyEvaluationController__evaluateRequest_environment_completion___block_invoke(v28);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACDTOPolicyEvaluationController _notifyObserversAboutEvaluation:](self, "_notifyObserversAboutEvaluation:", v20);
  objc_msgSend(v27, "payload");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "mutableCopy");
  v23 = v22;
  if (v22)
    v24 = v22;
  else
    v24 = (id)objc_opt_new();
  v25 = v24;

  objc_msgSend(v25, "setObject:forKeyedSubscript:", v17, CFSTR("kLAEvaluationRequestPayloadKeyDTORequestIdentifier"));
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v19, CFSTR("kLAEvaluationRequestPayloadKeyDTOEnvironment"));
  objc_msgSend(v27, "updatePayload:", v25);
  +[LACEvaluationResult resultWithNext:](LACEvaluationResult, "resultWithNext:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v20, v26);

}

LACDTOMutablePolicyEvaluationRequest *__76__LACDTOPolicyEvaluationController__evaluateRequest_environment_completion___block_invoke(_QWORD *a1)
{
  LACDTOMutablePolicyEvaluationRequest *v2;

  v2 = -[LACDTOMutablePolicyEvaluationRequest initWithIdentifier:]([LACDTOMutablePolicyEvaluationRequest alloc], "initWithIdentifier:", a1[4]);
  -[LACDTOMutablePolicyEvaluationRequest setPolicy:](v2, "setPolicy:", a1[7]);
  -[LACDTOMutablePolicyEvaluationRequest setOptions:](v2, "setOptions:", a1[5]);
  -[LACDTOMutablePolicyEvaluationRequest setEnvironment:](v2, "setEnvironment:", a1[6]);
  return v2;
}

- (void)_notifyObserversAboutEvaluation:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  LACLogDTOEvaluation();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[LACDTOPolicyEvaluationController _notifyObserversAboutEvaluation:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __68__LACDTOPolicyEvaluationController__notifyObserversAboutEvaluation___block_invoke;
  v13[3] = &unk_2510C1C78;
  v13[4] = self;
  v14 = v4;
  v12 = v4;
  -[LACDTOPolicyEvaluationController _forEachObserver:](self, "_forEachObserver:", v13);

}

uint64_t __68__LACDTOPolicyEvaluationController__notifyObserversAboutEvaluation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "policyController:willStartPolicyEvaluation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_notifyObserversAboutEvaluation:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  LACLogDTOEvaluation();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[LACDTOPolicyEvaluationController _notifyObserversAboutEvaluation:result:].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __75__LACDTOPolicyEvaluationController__notifyObserversAboutEvaluation_result___block_invoke;
  v17[3] = &unk_2510C1CA0;
  v17[4] = self;
  v18 = v6;
  v19 = v7;
  v15 = v7;
  v16 = v6;
  -[LACDTOPolicyEvaluationController _forEachObserver:](self, "_forEachObserver:", v17);

}

uint64_t __75__LACDTOPolicyEvaluationController__notifyObserversAboutEvaluation_result___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "policyController:didFinishPolicyEvaluation:result:", a1[4], a1[5], a1[6]);
}

- (void)_forEachObserver:(id)a3
{
  void (**v4)(id, _QWORD);
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_observers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)_mapResult:(id)a3 filterCodes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  LACDTOPolicyEvaluationController *v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v9 = v7;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v18;
        while (2)
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v18 != v12)
              objc_enumerationMutation(v9);
            if (+[LACError error:hasCode:](LACError, "error:hasCode:", v8, objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "integerValue", (_QWORD)v17)))
            {
              LACLogDTO();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v22 = self;
                v23 = 2112;
                v24 = v8;
                _os_log_impl(&dword_2409DC000, v15, OS_LOG_TYPE_DEFAULT, "%@ mapping error %@ to success", buf, 0x16u);
              }

              +[LACEvaluationResult resultWithSuccess:](LACEvaluationResult, "resultWithSuccess:", MEMORY[0x24BDBD1B8]);
              v14 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_17;
            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v11)
            continue;
          break;
        }
      }

    }
    v14 = v6;
LABEL_17:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_errorCodesToFilterForOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1062);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "BOOLValue"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -1011);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v9);

  }
  objc_msgSend(v4, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)_checkDeviceHasBeenUnlockedSinceBoot
{
  return -[LACDTODeviceInfoProvider hasBeenUnlockedSinceBoot](self->_device, "hasBeenUnlockedSinceBoot");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_evaluationIdentifierFactory, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

- (void)initWithEnvironment:evaluationIdentifierFactory:device:.cold.1()
{
  __assert_rtn("-[LACDTOPolicyEvaluationController initWithEnvironment:evaluationIdentifierFactory:device:]", "LACDTOPolicyEvaluationController.m", 31, "environment != nil");
}

- (void)postProcessRequest:(void *)a1 result:(NSObject *)a2 completion:.cold.1(void *a1, NSObject *a2)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = objc_msgSend(a1, "identifier");
  _os_log_error_impl(&dword_2409DC000, a2, OS_LOG_TYPE_ERROR, "No pending request for rid: %i", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_2();
}

- (void)_notifyObserversAboutEvaluation:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_2409DC000, a2, a3, "Policy evaluation will start: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_notifyObserversAboutEvaluation:(uint64_t)a3 result:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_2409DC000, a2, a3, "Policy evaluation did finish: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
