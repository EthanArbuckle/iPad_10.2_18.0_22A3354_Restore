@implementation BRCOperation

uint64_t __34___BRCOperation_finishIfCancelled__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishIfCancelled");
}

uint64_t __22___BRCOperation__main__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "setupIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "main");
}

void __53___BRCOperation__scheduleExecutionWithPreviousError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 496);
  v6 = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 480);
  v7 = v2;
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    v9 = v6;
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_debug_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx retrying %@%@", buf, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_executeWithPreviousError:", *(_QWORD *)(a1 + 40));
  __brc_leave_section((uint64_t *)&v6);
}

uint64_t __25___BRCOperation_schedule__block_invoke(uint64_t a1)
{
  uint64_t *v1;
  void *v2;
  NSObject *v3;
  void *v5;
  NSObject *v6;

  v1 = (uint64_t *)(a1 + 32);
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 248))
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
      __25___BRCOperation_schedule__block_invoke_cold_2(v1);

  }
  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __25___BRCOperation_schedule__block_invoke_cold_1(v1);

  return objc_msgSend(*(id *)(*v1 + 248), "addOperation:");
}

void __22___BRCOperation_start__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 496);
  v6 = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 480);
  v7 = v2;
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    v9 = v6;
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v3;
    _os_log_debug_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx starting with throttle %@%@", buf, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_scheduleExecutionWithPreviousError:", 0);
  __brc_leave_section((uint64_t *)&v6);
}

void __22___BRCOperation_start__block_invoke_77(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 496);
  v9 = *(_OWORD *)(*(_QWORD *)(a1 + 32) + 480);
  v10 = v2;
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    v12 = v9;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v3;
    _os_log_debug_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx starting %@%@", buf, 0x20u);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "finishIfCancelled"))
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "operationID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      __22___BRCOperation_start__block_invoke_77_cold_1(v7, (uint64_t)v5, (uint64_t)buf);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_main");
  }
  __brc_leave_section((uint64_t *)&v9);
}

NSObject *__23___BRCOperation_cancel__block_invoke(uint64_t a1)
{
  NSObject *result;
  uint64_t v3;
  void *v4;

  result = *(NSObject **)(*(_QWORD *)(a1 + 32) + 352);
  if (result)
  {
    dispatch_source_cancel(result);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 352);
    *(_QWORD *)(v3 + 352) = 0;

    return objc_msgSend(*(id *)(a1 + 32), "_finishIfCancelled");
  }
  return result;
}

void __43___BRCOperation_completedWithResult_error___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)completedWithResult_error____personalPersona;
  completedWithResult_error____personalPersona = v0;

}

uint64_t __43___BRCOperation_completedWithResult_error___block_invoke_91(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completedWithResult:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __43___BRCOperation_completedWithResult_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completedWithResult:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __70___BRCOperation_addSubOperation_overrideContext_allowsCellularAccess___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t result;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _BYTE location[12];
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      __70___BRCOperation_addSubOperation_overrideContext_allowsCellularAccess___block_invoke_cold_1();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = *(id *)(a1 + 40);
    objc_msgSend(v2, "group");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 == 0;

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 48), "group");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setGroup:", v5);

    }
    if (objc_msgSend(*(id *)(a1 + 48), "nonDiscretionary"))
    {
      objc_msgSend(v2, "configuration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDiscretionaryNetworkBehavior:", 0);

      objc_msgSend(v2, "configuration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAutomaticallyRetryNetworkFailures:", 0);

    }
    objc_msgSend(*(id *)(a1 + 48), "_setDeviceConfigurationHeaderOnCKOp:", v2);
    objc_msgSend(v2, "completionBlock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)location, v2);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __70___BRCOperation_addSubOperation_overrideContext_allowsCellularAccess___block_invoke_98;
    v21[3] = &unk_1E875DD08;
    v21[4] = *(_QWORD *)(a1 + 48);
    objc_copyWeak(&v23, (id *)location);
    v9 = v8;
    v22 = v9;
    objc_msgSend(v2, "setCompletionBlock:", v21);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)location);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_14;
    v2 = *(id *)(a1 + 40);
    objc_msgSend(v2, "group");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 == 0;

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 48), "group");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setGroup:", v12);

    }
    if ((objc_msgSend(v2, "nonDiscretionary") & 1) == 0)
      objc_msgSend(v2, "setNonDiscretionary:", objc_msgSend(*(id *)(a1 + 48), "nonDiscretionary"));
  }

LABEL_14:
  brc_bread_crumbs();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 48), "operationID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)location = 138412802;
    *(_QWORD *)&location[4] = v17;
    v25 = 2112;
    v26 = v18;
    v27 = 2112;
    v28 = v13;
    _os_log_debug_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] (%@) Queuing %@%@", location, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "addOperation:allowsCellularAccess:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  result = objc_msgSend(*(id *)(a1 + 48), "isCancelled");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "cancel");
  return result;
}

uint64_t __70___BRCOperation_addSubOperation_overrideContext_allowsCellularAccess___block_invoke_98(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  uint64_t result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 400);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
        objc_msgSend(v7, "associateWithCompletedOperation:", WeakRetained, (_QWORD)v10);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __46___BRCOperation_blockOnHighPriorityOperation___block_invoke(uint64_t a1)
{
  dispatch_group_t *WeakRetained;
  dispatch_group_t *v3;
  uint64_t v4;
  dispatch_group_t *v5;

  WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  v5 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_group_leave(WeakRetained[47]);
    v3 = v5;
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    (*(void (**)(uint64_t, dispatch_group_t *))(v4 + 16))(v4, v3);
    v3 = v5;
  }

}

void __34___BRCOperation_cancelAfterDelay___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __34___BRCOperation_cancelAfterDelay___block_invoke_cold_1(a1, (uint64_t)v2, v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "timeIntervalSinceNow");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(a1 + 32), "nonDiscretionary");
  objc_msgSend(*(id *)(a1 + 32), "syncContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[AppTelemetryTimeSeriesEvent newOperationTimedOutEventWithTime:type:nonDiscretionary:hasForegroundClients:](AppTelemetryTimeSeriesEvent, "newOperationTimedOutEventWithTime:type:nonDiscretionary:hasForegroundClients:", v6, v7, objc_msgSend(v8, "isForeground"), v5);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "analyticsReporter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postReportForDefaultSubCategoryWithCategory:telemetryTimeEvent:", 8, v9);

  objc_msgSend(*(id *)(a1 + 32), "setTimedOut:", 1);
  objc_msgSend(*(id *)(a1 + 32), "cancel");

}

void __25___BRCOperation_schedule__block_invoke_cold_1(uint64_t *a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *a1;
  v3 = 138412546;
  v4 = v1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v2, (uint64_t)v2, "[DEBUG] scheduling %@%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

void __25___BRCOperation_schedule__block_invoke_cold_2(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v1, v2, "[ERROR] Operation %@ is missing syncContext%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __22___BRCOperation_start__block_invoke_77_cold_1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_10((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, v6, v4, "[DEBUG] Operation %@ cancelled before calling main%@", v5);

}

void __70___BRCOperation_addSubOperation_overrideContext_allowsCellularAccess___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: context%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __34___BRCOperation_cancelAfterDelay___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a3, v6, "[DEBUG] Timeout expired, cancelling operation %@%@", (uint8_t *)&v7);

}

@end
