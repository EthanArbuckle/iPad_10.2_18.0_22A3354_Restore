@implementation DASScheduler

void __33___DASScheduler_connectToDaemon___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  objc_msgSend((id)objc_opt_class(), "log");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B0DF4000, v0, OS_LOG_TYPE_DEFAULT, "Daemon connection established with BGTaskScheduler client", v1, 2u);
  }

}

void __34___DASScheduler_currentConnection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "unprotectedEstablishDaemonConnectionIfInterrupted");
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __32___DASScheduler_sharedScheduler__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_DASScheduler scheduler](_DASScheduler, "scheduler");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedScheduler_sharedScheduler;
  sharedScheduler_sharedScheduler = v0;

}

void __20___DASScheduler_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.backgroundtasks", "framework");
  v1 = (void *)log_log;
  log_log = (uint64_t)v0;

}

uint64_t __61___DASScheduler_getPendingTaskRequestsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __48___DASScheduler_setupXPCConnectionWithEndpoint___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dasFrameworkLog");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __48___DASScheduler_setupXPCConnectionWithEndpoint___block_invoke_cold_1();

    objc_msgSend(v2, "setInterrupted:", 1);
  }

}

void __42___DASScheduler_initWithListenerEndpoint___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  dispatch_time_t v4;
  NSObject *v5;
  id *v6;
  _QWORD *v7;
  uint32_t v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0DF4000, v2, OS_LOG_TYPE_DEFAULT, "Daemon came back up, requesting resubmission", buf, 2u);
    }

    objc_msgSend(WeakRetained, "backgroundTaskSchedulerDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = dispatch_time(0, 100000000);
      objc_msgSend(WeakRetained, "connectionCreationQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __42___DASScheduler_initWithListenerEndpoint___block_invoke_282;
      v11[3] = &unk_1E624B598;
      v6 = &v12;
      v12 = WeakRetained;
      v7 = v11;
    }
    else
    {
      v8 = arc4random_uniform(0xAu);
      v4 = dispatch_time(0, 1000000000 * v8);
      objc_msgSend(WeakRetained, "connectionCreationQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __42___DASScheduler_initWithListenerEndpoint___block_invoke_2;
      v9[3] = &unk_1E624B598;
      v6 = &v10;
      v10 = WeakRetained;
      v7 = v9;
    }
    dispatch_after(v4, v5, v7);

  }
}

uint64_t __42___DASScheduler_initWithListenerEndpoint___block_invoke_282(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unprotectedEstablishDaemonConnectionIfInterrupted");
}

uint64_t __42___DASScheduler_initWithListenerEndpoint___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unprotectedEstablishDaemonConnectionIfInterrupted");
}

void __40___DASScheduler_submitActivityInternal___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (((objc_msgSend(v7, "requestsApplicationLaunch") & 1) != 0
     || objc_msgSend(v7, "requestsExtensionLaunch"))
    && objc_msgSend(v7, "isIdenticalLaunchTo:", *(_QWORD *)(a1 + 32)))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "keepsPrevious"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      v8 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 104);
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
LABEL_11:
        *a4 = 1;
        goto LABEL_12;
      }
      v9 = *(void **)(a1 + 32);
      v12 = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v7;
      v10 = "Not submitting %@, identical to %@";
    }
    else
    {
      if (!objc_msgSend(*(id *)(a1 + 32), "overwritesPrevious"))
        goto LABEL_11;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
      v8 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 104);
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      v11 = *(void **)(a1 + 32);
      v12 = 138412546;
      v13 = v7;
      v14 = 2112;
      v15 = v11;
      v10 = "Overwriting %@ with %@";
    }
    _os_log_impl(&dword_1B0DF4000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 0x16u);
    goto LABEL_11;
  }
LABEL_12:

}

void __36___DASScheduler__resetWidgetBudgets__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __46___DASScheduler_submitActivity_inGroup_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __46___DASScheduler_submitActivity_inGroup_error___block_invoke_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  }

}

void __46___DASScheduler_submitActivity_inGroup_error___block_invoke_302(uint64_t a1, char a2, void *a3)
{
  id v6;
  NSObject *v7;

  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  if (v6 && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __46___DASScheduler_submitActivity_inGroup_error___block_invoke_302_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  }

}

void __33___DASScheduler_deferActivities___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __33___DASScheduler_deferActivities___block_invoke_cold_1();

}

uint64_t __33___DASScheduler_deferActivities___block_invoke_304(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __36___DASScheduler_submittedActivities__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __36___DASScheduler_submittedActivities__block_invoke_cold_1();

  }
}

void __36___DASScheduler_submittedActivities__block_invoke_306(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __41___DASScheduler_delayedRunningActivities__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __34___DASScheduler_runningActivities__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __39___DASScheduler_runningGroupActivities__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __36___DASScheduler_forceRunActivities___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __33___DASScheduler_deferActivities___block_invoke_cold_1();

}

void __53___DASScheduler_runActivitiesWithUrgency_activities___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __33___DASScheduler_deferActivities___block_invoke_cold_1();

}

void __35___DASScheduler_currentPredictions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __35___DASScheduler_currentPredictions__block_invoke_cold_1();

}

void __35___DASScheduler_currentPredictions__block_invoke_308(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __27___DASScheduler_statistics__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __27___DASScheduler_statistics__block_invoke_cold_1();

  }
}

void __27___DASScheduler_statistics__block_invoke_310(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __50___DASScheduler_resetFastPassActivities_resetAll___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __50___DASScheduler_resetFastPassActivities_resetAll___block_invoke_cold_1();

}

void __50___DASScheduler_resetFastPassActivities_resetAll___block_invoke_311(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __25___DASScheduler_inspect___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __25___DASScheduler_inspect___block_invoke_cold_1();

}

void __25___DASScheduler_inspect___block_invoke_313(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __38___DASScheduler_resubmitRunningTasks___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __38___DASScheduler_resubmitRunningTasks___block_invoke_cold_1();

}

void __46___DASScheduler_forceResetOfResultIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46___DASScheduler_forceResetOfResultIdentifier___block_invoke_cold_1();

}

void __47___DASScheduler_queryStatusOfResultIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __47___DASScheduler_queryStatusOfResultIdentifier___block_invoke_cold_1();

}

void __47___DASScheduler_queryStatusOfResultIdentifier___block_invoke_314(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __51___DASScheduler_queryDependenciesOfTaskIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __51___DASScheduler_queryDependenciesOfTaskIdentifier___block_invoke_cold_1();

}

void __51___DASScheduler_queryDependenciesOfTaskIdentifier___block_invoke_315(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __27___DASScheduler_allBudgets__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __27___DASScheduler_allBudgets__block_invoke_cold_1();

  }
}

void __27___DASScheduler_allBudgets__block_invoke_316(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __42___DASScheduler_balanceForBudgetWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __42___DASScheduler_balanceForBudgetWithName___block_invoke_cold_1();

}

uint64_t __42___DASScheduler_balanceForBudgetWithName___block_invoke_317(uint64_t result, double a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __46___DASScheduler_setBalance_forBudgetWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46___DASScheduler_setBalance_forBudgetWithName___block_invoke_cold_1();

}

void __47___DASScheduler_decrementBy_forBudgetWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __47___DASScheduler_decrementBy_forBudgetWithName___block_invoke_cold_1();

}

void __47___DASScheduler_setCapacity_forBudgetWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __47___DASScheduler_setCapacity_forBudgetWithName___block_invoke_cold_1();

}

void __25___DASScheduler_policies__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __25___DASScheduler_policies__block_invoke_cold_1();

}

void __25___DASScheduler_policies__block_invoke_319(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __27___DASScheduler_clasStatus__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __27___DASScheduler_clasStatus__block_invoke_cold_1();

}

void __27___DASScheduler_clasStatus__block_invoke_320(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __34___DASScheduler_evaluatePolicies___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __34___DASScheduler_evaluatePolicies___block_invoke_cold_1();

}

void __34___DASScheduler_evaluatePolicies___block_invoke_321(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __49___DASScheduler_evaluateAllActivitiesWithHandle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __49___DASScheduler_evaluateAllActivitiesWithHandle___block_invoke_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

void __49___DASScheduler_evaluateAllActivitiesWithHandle___block_invoke_322(uint64_t a1, char a2)
{
  NSObject *v2;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __49___DASScheduler_evaluateAllActivitiesWithHandle___block_invoke_322_cold_1();

  }
}

void __42___DASScheduler_runProceedableActivities___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __42___DASScheduler_runProceedableActivities___block_invoke_cold_1();

}

void __42___DASScheduler_runProceedableActivities___block_invoke_323(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __48___DASScheduler_blockingPoliciesWithParameters___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __48___DASScheduler_blockingPoliciesWithParameters___block_invoke_cold_1();

}

void __48___DASScheduler_blockingPoliciesWithParameters___block_invoke_324(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __43___DASScheduler_activityContainsOverrides___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __43___DASScheduler_activityContainsOverrides___block_invoke_cold_1();

}

void __43___DASScheduler_activityContainsOverrides___block_invoke_325(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __51___DASScheduler_enterTestModeWithParameters_reset___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __51___DASScheduler_enterTestModeWithParameters_reset___block_invoke_cold_1();

}

void __51___DASScheduler_enterTestModeWithParameters_reset___block_invoke_326(uint64_t a1, int a2)
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (a2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B0DF4000, v4, OS_LOG_TYPE_DEFAULT, "Successfully entered test mode", v5, 2u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __51___DASScheduler_enterTestModeWithParameters_reset___block_invoke_326_cold_1();
  }

}

void __50___DASScheduler_enableTaskRegistryMode_processes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __50___DASScheduler_enableTaskRegistryMode_processes___block_invoke_cold_1(a1, (uint64_t)v3, v4);

}

uint64_t __50___DASScheduler_enableTaskRegistryMode_processes___block_invoke_327(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __46___DASScheduler_submitRateLimitConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B0DF4000, v4, OS_LOG_TYPE_DEFAULT, "Error trying to submit rate limit config: %@", (uint8_t *)&v5, 0xCu);
  }

}

void __46___DASScheduler_submitRateLimitConfiguration___block_invoke_328(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1B0DF4000, v5, OS_LOG_TYPE_DEFAULT, "Successfully submitting with rate limit configuration: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __46___DASScheduler_submitRateLimitConfiguration___block_invoke_328_cold_1();
  }

}

void __37___DASScheduler_pauseWithParameters___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B0DF4000, v4, OS_LOG_TYPE_DEFAULT, "Error trying to pause activities: %@", (uint8_t *)&v5, 0xCu);
  }

}

void __37___DASScheduler_pauseWithParameters___block_invoke_329(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 40);
      v10 = 138412290;
      v11 = v6;
      v7 = "Successfully paused with parameters: %@";
      v8 = v4;
      v9 = 12;
LABEL_6:
      _os_log_impl(&dword_1B0DF4000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v9);
    }
  }
  else if (v5)
  {
    LOWORD(v10) = 0;
    v7 = "Error trying to pause scheduling";
    v8 = v4;
    v9 = 2;
    goto LABEL_6;
  }

}

void __41___DASScheduler_addPauseExceptParameter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B0DF4000, v4, OS_LOG_TYPE_DEFAULT, "Error trying to add new except parameter: %@", (uint8_t *)&v5, 0xCu);
  }

}

void __41___DASScheduler_addPauseExceptParameter___block_invoke_330(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 40);
      v10 = 138412290;
      v11 = v6;
      v7 = "Successfully adding new except parameters: %@";
      v8 = v4;
      v9 = 12;
LABEL_6:
      _os_log_impl(&dword_1B0DF4000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v9);
    }
  }
  else if (v5)
  {
    LOWORD(v10) = 0;
    v7 = "Error trying to add new except parameter";
    v8 = v4;
    v9 = 2;
    goto LABEL_6;
  }

}

void __47___DASScheduler_runActivitiesWithDelayedStart___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  __int128 v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1B0DF4000, v2, OS_LOG_TYPE_DEFAULT, "REQUESTING START: %{public}@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "startHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "startHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(a1 + 40), "startHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else if ((objc_msgSend(*(id *)(a1 + 40), "requestsExtensionLaunch") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "runQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47___DASScheduler_runActivitiesWithDelayedStart___block_invoke_331;
    v8[3] = &unk_1E624B688;
    v9 = *(_OWORD *)(a1 + 32);
    dispatch_async(v7, v8);

  }
}

uint64_t __47___DASScheduler_runActivitiesWithDelayedStart___block_invoke_331(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityStarted:", *(_QWORD *)(a1 + 40));
}

void __31___DASScheduler_runActivities___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[6];
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setStartDate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "dasFrameworkLog");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1B0DF4000, v2, OS_LOG_TYPE_DEFAULT, "STARTING: %{public}@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "startHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "startHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 32), "startHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else if ((objc_msgSend(*(id *)(a1 + 32), "requestsExtensionLaunch") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "runQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __31___DASScheduler_runActivities___block_invoke_332;
    v9[3] = &unk_1E624B688;
    v8 = *(_QWORD *)(a1 + 32);
    v9[4] = *(_QWORD *)(a1 + 48);
    v9[5] = v8;
    dispatch_async(v7, v9);

  }
}

uint64_t __31___DASScheduler_runActivities___block_invoke_332(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityCompleted:", *(_QWORD *)(a1 + 40));
}

void __35___DASScheduler_suspendActivities___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSuspendRequestDate:", v2);

  objc_msgSend(*(id *)(a1 + 40), "dasFrameworkLog");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_1B0DF4000, v3, OS_LOG_TYPE_DEFAULT, "SUSPENDING: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "suspendHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "suspendHandler");
    v6 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "dasFrameworkLog");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1B0DF4000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "No handler for %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }

}

void __58___DASScheduler_setMinimumBackgroundFetchInterval_forApp___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B0DF4000, v4, OS_LOG_TYPE_DEFAULT, "Error setting minimum fetch interval: %@", (uint8_t *)&v5, 0xCu);
  }

}

void __42___DASScheduler_disableAppRefreshForApps___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __42___DASScheduler_disableAppRefreshForApps___block_invoke_cold_1();

  }
}

void __35___DASScheduler_submitTaskRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1B0DF4000, v4, OS_LOG_TYPE_DEFAULT, "Submit Task Request Failed: %@", (uint8_t *)&v7, 0xCu);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __35___DASScheduler_submitTaskRequest___block_invoke_336(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __61___DASScheduler_getPendingTaskRequestsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __49___DASScheduler_cancelTaskRequestWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1B0DF4000, v3, OS_LOG_TYPE_DEFAULT, "Cancel Task Request Failed: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __49___DASScheduler_cancelTaskRequestWithIdentifier___block_invoke_337()
{
  NSObject *v0;

  objc_msgSend((id)objc_opt_class(), "log");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __49___DASScheduler_cancelTaskRequestWithIdentifier___block_invoke_337_cold_1();

}

void __38___DASScheduler_cancelAllTaskRequests__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1B0DF4000, v3, OS_LOG_TYPE_DEFAULT, "Cancel All Task Requests Failed: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __38___DASScheduler_cancelAllTaskRequests__block_invoke_338()
{
  NSObject *v0;

  objc_msgSend((id)objc_opt_class(), "log");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __38___DASScheduler_cancelAllTaskRequests__block_invoke_338_cold_1();

}

void __37___DASScheduler_completeTaskRequest___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1B0DF4000, v3, OS_LOG_TYPE_DEFAULT, "Complete Task Request Failed: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __37___DASScheduler_completeTaskRequest___block_invoke_339()
{
  NSObject *v0;

  objc_msgSend((id)objc_opt_class(), "log");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __37___DASScheduler_completeTaskRequest___block_invoke_339_cold_1();

}

void __35___DASScheduler_updateOngoingTask___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __35___DASScheduler_updateOngoingTask___block_invoke_cold_1();

}

void __35___DASScheduler_updateOngoingTask___block_invoke_340()
{
  NSObject *v0;

  objc_msgSend((id)objc_opt_class(), "log");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __35___DASScheduler_updateOngoingTask___block_invoke_340_cold_1();

}

void __47___DASScheduler_updateProgress_forOngoingTask___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __47___DASScheduler_updateProgress_forOngoingTask___block_invoke_cold_1();

}

uint64_t __47___DASScheduler_updateProgress_forOngoingTask___block_invoke_341(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend((id)objc_opt_class(), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __47___DASScheduler_updateProgress_forOngoingTask___block_invoke_341_cold_1();

  return objc_msgSend(*(id *)(a1 + 48), "setProgress:", *(_QWORD *)(a1 + 40));
}

void __65___DASScheduler_acknowledgeSystemTaskLaunchWithIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __65___DASScheduler_acknowledgeSystemTaskLaunchWithIdentifier_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
}

void __65___DASScheduler_acknowledgeSystemTaskLaunchWithIdentifier_error___block_invoke_342(_QWORD *a1, char a2, void *a3)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = a2;
  objc_msgSend((id)objc_opt_class(), "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = a1[5];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    v11 = 138412802;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_debug_impl(&dword_1B0DF4000, v7, OS_LOG_TYPE_DEBUG, "acknowledgeSystemTaskLaunch: %@ completed with allowedToRun: %@ (error: %@)", (uint8_t *)&v11, 0x20u);

  }
}

void __74___DASScheduler_acknowledgeSystemTaskSuspensionWithIdentifier_retryAfter___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __74___DASScheduler_acknowledgeSystemTaskSuspensionWithIdentifier_retryAfter___block_invoke_cold_1();

}

void __74___DASScheduler_acknowledgeSystemTaskSuspensionWithIdentifier_retryAfter___block_invoke_343()
{
  NSObject *v0;

  objc_msgSend((id)objc_opt_class(), "log");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __74___DASScheduler_acknowledgeSystemTaskSuspensionWithIdentifier_retryAfter___block_invoke_343_cold_1();

}

void __96___DASScheduler_handleClientLedSystemTaskExpirationWithIdentifier_retryAfter_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __96___DASScheduler_handleClientLedSystemTaskExpirationWithIdentifier_retryAfter_completionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __78___DASScheduler_submitTaskRequestWithIdentifier_descriptor_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __78___DASScheduler_submitTaskRequestWithIdentifier_descriptor_completionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __78___DASScheduler_updateTaskRequestWithIdentifier_descriptor_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __78___DASScheduler_updateTaskRequestWithIdentifier_descriptor_completionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __50___DASScheduler_completeSystemTaskWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __50___DASScheduler_completeSystemTaskWithIdentifier___block_invoke_cold_1();

}

void __50___DASScheduler_completeSystemTaskWithIdentifier___block_invoke_344()
{
  NSObject *v0;

  objc_msgSend((id)objc_opt_class(), "log");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __50___DASScheduler_completeSystemTaskWithIdentifier___block_invoke_344_cold_1();

}

void __70___DASScheduler_unregisterSystemTaskWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __70___DASScheduler_unregisterSystemTaskWithIdentifier_completionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __70___DASScheduler_resumeTaskSchedulingWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __70___DASScheduler_resumeTaskSchedulingWithIdentifier_completionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __82___DASScheduler_reportSystemTaskWithIdentifier_consumedResults_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __82___DASScheduler_reportSystemTaskWithIdentifier_consumedResults_completionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __82___DASScheduler_reportSystemTaskWithIdentifier_producedResults_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __82___DASScheduler_reportSystemTaskWithIdentifier_producedResults_completionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __82___DASScheduler_resetResultsForIdentifier_byTaskWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __82___DASScheduler_resetResultsForIdentifier_byTaskWithIdentifier_completionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __82___DASScheduler_resetResultsForIdentifier_byTaskWithIdentifier_completionHandler___block_invoke_345(uint64_t a1, char a2, void *a3)
{
  id v5;
  __CFString *v6;
  NSObject *v7;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v6 = CFSTR("succeeded");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed with error: %@"), v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend((id)objc_opt_class(), "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __82___DASScheduler_resetResultsForIdentifier_byTaskWithIdentifier_completionHandler___block_invoke_345_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __100___DASScheduler_reportTaskWorkloadProgress_target_completed_category_subCategory_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __100___DASScheduler_reportTaskWorkloadProgress_target_completed_category_subCategory_completionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __58___DASScheduler_reportFeatureCheckpoint_forFeature_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __58___DASScheduler_reportFeatureCheckpoint_forFeature_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
}

void __58___DASScheduler_reportFeatureCheckpoint_forFeature_error___block_invoke_350(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __58___DASScheduler_reportFeatureCheckpoint_forFeature_error___block_invoke_350_cold_1();

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
}

void __55___DASScheduler_reportSystemWorkload_ofCategory_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __55___DASScheduler_reportSystemWorkload_ofCategory_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
}

void __55___DASScheduler_reportSystemWorkload_ofCategory_error___block_invoke_351(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __55___DASScheduler_reportSystemWorkload_ofCategory_error___block_invoke_351_cold_1();

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
}

void __54___DASScheduler_reportCustomCheckpoint_forTask_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __54___DASScheduler_reportCustomCheckpoint_forTask_error___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
}

void __54___DASScheduler_reportCustomCheckpoint_forTask_error___block_invoke_352(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __54___DASScheduler_reportCustomCheckpoint_forTask_error___block_invoke_352_cold_1();

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
}

void __36___DASScheduler_prewarmApplication___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __36___DASScheduler_prewarmApplication___block_invoke_cold_1();

}

void __43___DASScheduler_prewarmSuspendWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __43___DASScheduler_prewarmSuspendWithHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __59___DASScheduler_deleteLimitForActivity_forLimiterWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __59___DASScheduler_deleteLimitForActivity_forLimiterWithName___block_invoke_cold_1();

}

void __59___DASScheduler_deleteLimitForActivity_forLimiterWithName___block_invoke_353(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_1B0DF4000, v5, OS_LOG_TYPE_DEFAULT, "Successfully delete limit for %@: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __59___DASScheduler_deleteLimitForActivity_forLimiterWithName___block_invoke_353_cold_1();
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2;
}

void __60___DASScheduler_updateLimit_forActivity_forLimiterWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60___DASScheduler_updateLimit_forActivity_forLimiterWithName___block_invoke_cold_1();

}

void __60___DASScheduler_updateLimit_forActivity_forLimiterWithName___block_invoke_354(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_1B0DF4000, v5, OS_LOG_TYPE_DEFAULT, "Successfully set limit for %@: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __60___DASScheduler_updateLimit_forActivity_forLimiterWithName___block_invoke_354_cold_1();
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2;
}

void __47___DASScheduler_getLimiterResponseForActivity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __47___DASScheduler_getLimiterResponseForActivity___block_invoke_cold_1();

}

void __47___DASScheduler_getLimiterResponseForActivity___block_invoke_355(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1B0DF4000, v5, OS_LOG_TYPE_DEFAULT, "Successfully retrieved limit for %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __47___DASScheduler_getLimiterResponseForActivity___block_invoke_355_cold_1();
  }

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

void __33___DASScheduler_getRuntimeLimit___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __33___DASScheduler_getRuntimeLimit___block_invoke_cold_1();

}

void __33___DASScheduler_getRuntimeLimit___block_invoke_356(uint64_t a1, double a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2 == -1.0)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __33___DASScheduler_getRuntimeLimit___block_invoke_356_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1B0DF4000, v5, OS_LOG_TYPE_DEFAULT, "Successfully retrieved runtime limit for %@", (uint8_t *)&v7, 0xCu);
  }

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
}

void __57___DASScheduler_getElapsedRuntimes_timeFilter_bgsqlData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __57___DASScheduler_getElapsedRuntimes_timeFilter_bgsqlData___block_invoke_cold_1();

}

void __57___DASScheduler_getElapsedRuntimes_timeFilter_bgsqlData___block_invoke_357(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1B0DF4000, v5, OS_LOG_TYPE_DEFAULT, "Successfully retrieved elapsed runtime for %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __57___DASScheduler_getElapsedRuntimes_timeFilter_bgsqlData___block_invoke_357_cold_1();
  }

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

void __59___DASScheduler_getEstimatedRuntimes_timeFilter_bgsqlData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __59___DASScheduler_getEstimatedRuntimes_timeFilter_bgsqlData___block_invoke_cold_1();

}

void __59___DASScheduler_getEstimatedRuntimes_timeFilter_bgsqlData___block_invoke_358(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1B0DF4000, v5, OS_LOG_TYPE_DEFAULT, "Successfully retrieved estimated runtime for %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __59___DASScheduler_getEstimatedRuntimes_timeFilter_bgsqlData___block_invoke_358_cold_1();
  }

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

void __40___DASScheduler_getConditionsPenalties___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __40___DASScheduler_getConditionsPenalties___block_invoke_cold_1();

}

void __40___DASScheduler_getConditionsPenalties___block_invoke_359(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1B0DF4000, v5, OS_LOG_TYPE_DEFAULT, "Successfully retrieved conditions penalty for %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __40___DASScheduler_getConditionsPenalties___block_invoke_359_cold_1();
  }

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

void __58___DASScheduler_getFeatureTimelines_timeFilter_bgsqlData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __58___DASScheduler_getFeatureTimelines_timeFilter_bgsqlData___block_invoke_cold_1();

}

void __58___DASScheduler_getFeatureTimelines_timeFilter_bgsqlData___block_invoke_360(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1B0DF4000, v5, OS_LOG_TYPE_DEFAULT, "Successfully retrieved feature availability timeline for %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __58___DASScheduler_getFeatureTimelines_timeFilter_bgsqlData___block_invoke_360_cold_1();
  }

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

void __59___DASScheduler_getActivityTimelines_timeFilter_bgsqlData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __59___DASScheduler_getActivityTimelines_timeFilter_bgsqlData___block_invoke_cold_1();

}

void __59___DASScheduler_getActivityTimelines_timeFilter_bgsqlData___block_invoke_361(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1B0DF4000, v5, OS_LOG_TYPE_DEFAULT, "Successfully retrieved activity availability timeline for %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __59___DASScheduler_getActivityTimelines_timeFilter_bgsqlData___block_invoke_361_cold_1();
  }

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

void __55___DASScheduler_getDeviceConditionTimelines_bgsqlData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __55___DASScheduler_getDeviceConditionTimelines_bgsqlData___block_invoke_cold_1();

}

void __55___DASScheduler_getDeviceConditionTimelines_bgsqlData___block_invoke_362(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint8_t v8[16];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1B0DF4000, v5, OS_LOG_TYPE_DEFAULT, "Successfully retrieved device condition timeline", v8, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __55___DASScheduler_getDeviceConditionTimelines_bgsqlData___block_invoke_362_cold_1();
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __66___DASScheduler_getEstimatedMADCompletionTimes_endDate_bgsqlData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __66___DASScheduler_getEstimatedMADCompletionTimes_endDate_bgsqlData___block_invoke_cold_1();

}

void __66___DASScheduler_getEstimatedMADCompletionTimes_endDate_bgsqlData___block_invoke_363(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dasFrameworkLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __66___DASScheduler_getEstimatedMADCompletionTimes_endDate_bgsqlData___block_invoke_363_cold_2();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __66___DASScheduler_getEstimatedMADCompletionTimes_endDate_bgsqlData___block_invoke_363_cold_1();
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __48___DASScheduler_setupXPCConnectionWithEndpoint___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1B0DF4000, v0, v1, "XPC Connection to daemon interrupted!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __46___DASScheduler_submitActivity_inGroup_error___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "Connection Error %@ while submitting %{public}@");
  OUTLINED_FUNCTION_2();
}

void __46___DASScheduler_submitActivity_inGroup_error___block_invoke_302_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "DAS Error %@ while submitting %{public}@");
  OUTLINED_FUNCTION_2();
}

void __33___DASScheduler_deferActivities___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __36___DASScheduler_submittedActivities__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "Error obtaining submitted activities from scheduler:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __35___DASScheduler_currentPredictions__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "Error obtaining predictions from scheduler: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __27___DASScheduler_statistics__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "Error obtaining statistics: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __50___DASScheduler_resetFastPassActivities_resetAll___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "resetFastPassActivities failed due to a connection error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __25___DASScheduler_inspect___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "inspect failed due to a connection Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __38___DASScheduler_resubmitRunningTasks___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "resubmitRunningTasks failed due to a connection error %{public}@ for tasks %{public}@");
  OUTLINED_FUNCTION_2();
}

void __46___DASScheduler_forceResetOfResultIdentifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "Error reseting results on scheduler: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47___DASScheduler_queryStatusOfResultIdentifier___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "Error querying results on %@: %@");
  OUTLINED_FUNCTION_2();
}

void __51___DASScheduler_queryDependenciesOfTaskIdentifier___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "Error querying dependencies on %@: %@");
  OUTLINED_FUNCTION_2();
}

void __27___DASScheduler_allBudgets__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "Error obtaining all budgets: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __42___DASScheduler_balanceForBudgetWithName___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "Error obtaining remaining budget for %@: %@");
  OUTLINED_FUNCTION_2();
}

void __46___DASScheduler_setBalance_forBudgetWithName___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "Error setting budget for %@: %@");
  OUTLINED_FUNCTION_2();
}

void __47___DASScheduler_decrementBy_forBudgetWithName___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "Error decrementing budget for %@: %@");
  OUTLINED_FUNCTION_2();
}

void __47___DASScheduler_setCapacity_forBudgetWithName___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "Error updating capacity for %@: %@");
  OUTLINED_FUNCTION_2();
}

void __25___DASScheduler_policies__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "Error obtaining all scheduler policies: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __27___DASScheduler_clasStatus__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "Error obtaining clas status: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __34___DASScheduler_evaluatePolicies___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "Error evaluating policies for %@: %@");
  OUTLINED_FUNCTION_2();
}

void __49___DASScheduler_evaluateAllActivitiesWithHandle___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "Error evaluating all activities: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __49___DASScheduler_evaluateAllActivitiesWithHandle___block_invoke_322_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_1B0DF4000, v0, v1, "Error evaluating all activities", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __42___DASScheduler_runProceedableActivities___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "Error running proceedable activity for %@: %@");
  OUTLINED_FUNCTION_2();
}

void __48___DASScheduler_blockingPoliciesWithParameters___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "Error obtaining blocked policies: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __43___DASScheduler_activityContainsOverrides___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "Error obtaining overrides: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __51___DASScheduler_enterTestModeWithParameters_reset___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "Error entering test mode: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __51___DASScheduler_enterTestModeWithParameters_reset___block_invoke_326_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "Error entering test mode with parameters: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __50___DASScheduler_enableTaskRegistryMode_processes___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *(unsigned __int8 *)(a1 + 40);
  v4[0] = 67109378;
  v4[1] = v3;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1B0DF4000, log, OS_LOG_TYPE_ERROR, "Error setting task registry mode to %i: %@", (uint8_t *)v4, 0x12u);
  OUTLINED_FUNCTION_2();
}

void __46___DASScheduler_submitRateLimitConfiguration___block_invoke_328_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "Error trying to submit rate limit: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __42___DASScheduler_disableAppRefreshForApps___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "Error disabling refresh: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __49___DASScheduler_cancelTaskRequestWithIdentifier___block_invoke_337_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1B0DF4000, v0, v1, "Cancel Task Request %@ Succeeded", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __38___DASScheduler_cancelAllTaskRequests__block_invoke_338_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1B0DF4000, v0, v1, "Cancel All Task Requests Succeeded", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __37___DASScheduler_completeTaskRequest___block_invoke_339_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1B0DF4000, v0, v1, "Task Request %@ Completed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __35___DASScheduler_updateOngoingTask___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "Update Ongoing Task Failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __35___DASScheduler_updateOngoingTask___block_invoke_340_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1B0DF4000, v0, v1, "Update ongoing task for %@ completed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47___DASScheduler_updateProgress_forOngoingTask___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "Update Progress Failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47___DASScheduler_updateProgress_forOngoingTask___block_invoke_341_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_12(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_10();
  _os_log_debug_impl(&dword_1B0DF4000, v0, OS_LOG_TYPE_DEBUG, "Update progress to %@ for %@ completed", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __65___DASScheduler_acknowledgeSystemTaskLaunchWithIdentifier_error___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "acknowledgeSystemTaskLaunch: [taskIdentifier: %@] Failed: %@");
  OUTLINED_FUNCTION_2();
}

void __74___DASScheduler_acknowledgeSystemTaskSuspensionWithIdentifier_retryAfter___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "acknowledgeSystemTaskSuspensionWithIdentifier [taskIdentifier: %@] Failed: %@");
  OUTLINED_FUNCTION_2();
}

void __74___DASScheduler_acknowledgeSystemTaskSuspensionWithIdentifier_retryAfter___block_invoke_343_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1B0DF4000, v0, v1, "acknowledgeSystemTaskSuspensionWithIdentifier %@ Succeeded", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __96___DASScheduler_handleClientLedSystemTaskExpirationWithIdentifier_retryAfter_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "handleClientLedSystemTaskExpirationWithIdentifier [taskIdentifier: %@] Failed: %@");
  OUTLINED_FUNCTION_2();
}

void __78___DASScheduler_submitTaskRequestWithIdentifier_descriptor_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "submitTaskRequestWithIdentifier [taskIdentifier: %@] Failed: %@");
  OUTLINED_FUNCTION_2();
}

void __78___DASScheduler_updateTaskRequestWithIdentifier_descriptor_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "updateTaskRequestWithIdentifier [taskIdentifier: %@] Failed: %@");
  OUTLINED_FUNCTION_2();
}

void __50___DASScheduler_completeSystemTaskWithIdentifier___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "completeSystemTask [taskIdentifier: %@] Failed: %@");
  OUTLINED_FUNCTION_2();
}

void __50___DASScheduler_completeSystemTaskWithIdentifier___block_invoke_344_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1B0DF4000, v0, v1, "completeSystemTask %@ Succeeded", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __70___DASScheduler_unregisterSystemTaskWithIdentifier_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "unregisterSystemTask [taskIdentifier: %@] Failed: %@");
  OUTLINED_FUNCTION_2();
}

void __70___DASScheduler_resumeTaskSchedulingWithIdentifier_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "resumeTaskSchedulingWithIdentifier [taskIdentifier: %@] Failed: %@");
  OUTLINED_FUNCTION_2();
}

void __82___DASScheduler_reportSystemTaskWithIdentifier_consumedResults_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "reportSystemTaskWithIdentifier:consumedResults [taskIdentifier: %@] Failed: %@");
  OUTLINED_FUNCTION_2();
}

void __82___DASScheduler_reportSystemTaskWithIdentifier_producedResults_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "reportSystemTaskWithIdentifier:producedResults [taskIdentifier: %@] Failed: %@");
  OUTLINED_FUNCTION_2();
}

void __82___DASScheduler_resetResultsForIdentifier_byTaskWithIdentifier_completionHandler___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[40];

  OUTLINED_FUNCTION_12(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_11();
  _os_log_error_impl(&dword_1B0DF4000, v0, OS_LOG_TYPE_ERROR, "resetResultsForIdentifier:byTaskWithIdentifier [resultIdentifier: %@, taskIdentifier: %@] Failed: %@", v1, 0x20u);
}

void __82___DASScheduler_resetResultsForIdentifier_byTaskWithIdentifier_completionHandler___block_invoke_345_cold_1()
{
  os_log_t v0;
  uint8_t v1[40];

  OUTLINED_FUNCTION_12(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_11();
  _os_log_debug_impl(&dword_1B0DF4000, v0, OS_LOG_TYPE_DEBUG, "resetResultsForIdentifier:byTaskWithIdentifier [resultIdentifier: %@, taskIdentifier: %@] %@", v1, 0x20u);
}

void __100___DASScheduler_reportTaskWorkloadProgress_target_completed_category_subCategory_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "reportTaskWorkloadProgress Failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __58___DASScheduler_reportFeatureCheckpoint_forFeature_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "reportFeatureCheckpoint Failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __58___DASScheduler_reportFeatureCheckpoint_forFeature_error___block_invoke_350_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "reportFeatureCheckpoint Failed: Server error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __55___DASScheduler_reportSystemWorkload_ofCategory_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "reportSystemWorkload Failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __55___DASScheduler_reportSystemWorkload_ofCategory_error___block_invoke_351_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "reportSystemWorkload Failed: Server error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __54___DASScheduler_reportCustomCheckpoint_forTask_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "reportCustomCheckpoint Failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __54___DASScheduler_reportCustomCheckpoint_forTask_error___block_invoke_352_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "reportCustomCheckpoint Failed: Server error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __36___DASScheduler_prewarmApplication___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "Error prewarming %@: %@");
  OUTLINED_FUNCTION_2();
}

void __43___DASScheduler_prewarmSuspendWithHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "Error terminating prewarm: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __59___DASScheduler_deleteLimitForActivity_forLimiterWithName___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "Error deleting limit for %@: %@");
  OUTLINED_FUNCTION_2();
}

void __59___DASScheduler_deleteLimitForActivity_forLimiterWithName___block_invoke_353_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_12(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4_0(&dword_1B0DF4000, v0, v1, "Error trying to delete limit for %@: %@", v2);
  OUTLINED_FUNCTION_2();
}

void __60___DASScheduler_updateLimit_forActivity_forLimiterWithName___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "Error setting limit for %@: %@");
  OUTLINED_FUNCTION_2();
}

void __60___DASScheduler_updateLimit_forActivity_forLimiterWithName___block_invoke_354_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_12(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4_0(&dword_1B0DF4000, v0, v1, "Error trying to set limit for %@: %@", v2);
  OUTLINED_FUNCTION_2();
}

void __47___DASScheduler_getLimiterResponseForActivity___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "Error getting limits for %@: %@");
  OUTLINED_FUNCTION_2();
}

void __47___DASScheduler_getLimiterResponseForActivity___block_invoke_355_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "Error trying to get limit for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __33___DASScheduler_getRuntimeLimit___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "Error getting runtime limit for %@: %@");
  OUTLINED_FUNCTION_2();
}

void __33___DASScheduler_getRuntimeLimit___block_invoke_356_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "Error trying to get runtime limit for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __57___DASScheduler_getElapsedRuntimes_timeFilter_bgsqlData___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "Error getting elapsed runtime for %@: %@");
  OUTLINED_FUNCTION_2();
}

void __57___DASScheduler_getElapsedRuntimes_timeFilter_bgsqlData___block_invoke_357_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "Error trying to get elapsed runtime for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __59___DASScheduler_getEstimatedRuntimes_timeFilter_bgsqlData___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "Error getting estimated runtime for %@: %@");
  OUTLINED_FUNCTION_2();
}

void __59___DASScheduler_getEstimatedRuntimes_timeFilter_bgsqlData___block_invoke_358_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "Error trying to get estimated runtime for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __40___DASScheduler_getConditionsPenalties___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "Error getting conditions penalty for %@: %@");
  OUTLINED_FUNCTION_2();
}

void __40___DASScheduler_getConditionsPenalties___block_invoke_359_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "Error trying to get conditions penalty for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __58___DASScheduler_getFeatureTimelines_timeFilter_bgsqlData___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "Error getting feature availability timeline for %@: %@");
  OUTLINED_FUNCTION_2();
}

void __58___DASScheduler_getFeatureTimelines_timeFilter_bgsqlData___block_invoke_360_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "Error trying to get feature availability timeline for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __59___DASScheduler_getActivityTimelines_timeFilter_bgsqlData___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "Error getting activity availability timeline for %@: %@");
  OUTLINED_FUNCTION_2();
}

void __59___DASScheduler_getActivityTimelines_timeFilter_bgsqlData___block_invoke_361_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "Error trying to get activity availability timeline for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __55___DASScheduler_getDeviceConditionTimelines_bgsqlData___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "Error getting device condition timeline: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __55___DASScheduler_getDeviceConditionTimelines_bgsqlData___block_invoke_362_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_1B0DF4000, v0, v1, "Error trying to get device condition timeline.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __66___DASScheduler_getEstimatedMADCompletionTimes_endDate_bgsqlData___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B0DF4000, v0, v1, "Error getting estimated MAD completion times for %@: %@");
  OUTLINED_FUNCTION_2();
}

void __66___DASScheduler_getEstimatedMADCompletionTimes_endDate_bgsqlData___block_invoke_363_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_1B0DF4000, v0, v1, "Error trying to get estimated MAD completion times for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __66___DASScheduler_getEstimatedMADCompletionTimes_endDate_bgsqlData___block_invoke_363_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1B0DF4000, v0, v1, "Successfully retrieved estimated MAD completion times for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
