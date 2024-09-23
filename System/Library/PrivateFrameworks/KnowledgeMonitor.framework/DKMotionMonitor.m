@implementation DKMotionMonitor

void __23___DKMotionMonitor_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.coreduet.monitors", "_DKMotionMonitor");
  v1 = (void *)log_log;
  log_log = (uint64_t)v0;

}

uint64_t __36___DKMotionMonitor_initForUnitTest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "computeDominantMotionState");
}

void __25___DKMotionMonitor_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
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
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        objc_msgSend(WeakRetained, "addMotionActivity:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_msgSend(WeakRetained, "computeDominantMotionState");
}

void __25___DKMotionMonitor_start__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  unint64_t v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  _QWORD *v19;
  NSObject *v20;
  uint64_t v21;
  _QWORD *v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  int v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  _QWORD block[4];
  id v32;
  id v33;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = objc_msgSend(v3, "confidence");
    if (v5 < 3)
      v6 = v5 + 1;
    else
      v6 = 0;
    v27 = v6;
    v26 = objc_alloc(MEMORY[0x24BE0C580]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "stationary"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "walking"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "running"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "automotive"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = WeakRetained;
    v11 = a1;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "cycling"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "unknown"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = v27;
    v15 = (void *)objc_msgSend(v26, "initWithStationary:walking:running:automotive:cycling:unknown:startDate:confidence:", v7, v8, v9, v10, v12, v13, v14, v25);

    v16 = v11;
    WeakRetained = v28;

    objc_msgSend(v28, "source");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sendEvent:", v15);

    v18 = +[_DKMotionMonitor _activityTypeToMotionState:](_DKMotionMonitor, "_activityTypeToMotionState:", v3);
    v19 = *(_QWORD **)(v16 + 32);
    if (v18 != v19[19])
    {
      objc_msgSend(v19, "queue");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = MEMORY[0x24BDAC760];
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __25___DKMotionMonitor_start__block_invoke_3;
      v29[3] = &unk_24DA66D60;
      v29[4] = v28;
      v30 = v3;
      v22 = v29;
      v23 = (void *)os_transaction_create();
      block[0] = v21;
      block[1] = 3221225472;
      block[2] = __cd_dispatch_async_capture_tx_block_invoke;
      block[3] = &unk_24DA66E28;
      v32 = v23;
      v33 = v22;
      v24 = v23;
      dispatch_async(v20, block);

      *(_QWORD *)(*(_QWORD *)(v16 + 32) + 152) = v18;
    }

  }
}

uint64_t __25___DKMotionMonitor_start__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addMotionActivity:", *(_QWORD *)(a1 + 40));
}

void __46___DKMotionMonitor_computeDominantMotionState__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;

  v21 = a2;
  objc_msgSend(v21, "timestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "laterDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v5)
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v21, "state");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithUnsignedLongLong:", objc_msgSend(v7, "unsignedLongLongValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(v21, "timestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v10);
    v12 = v11;

    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", &unk_24DA70F88, v8);
    v14 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    objc_msgSend(v14, "numberWithDouble:", v12 + v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v17, v8);

    objc_msgSend(v21, "timestamp");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

  }
}

void __46___DKMotionMonitor_computeDominantMotionState__block_invoke_42(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  double v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x219A29278]();
  objc_msgSend(v5, "doubleValue");
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v7 > *(double *)(v8 + 24))
  {
    *(double *)(v8 + 24) = v7;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v9, "unsignedIntegerValue");
  }
  objc_autoreleasePoolPop(v6);

}

void __26___DKMotionMonitor_update__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, void *);
  void *v10;
  id v11;
  id v12;
  id v13;
  id location;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "lastUpdate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -21600.0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, *(id *)(a1 + 32));
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __26___DKMotionMonitor_update__block_invoke_2;
  v10 = &unk_24DA66E00;
  objc_copyWeak(&v13, &location);
  v4 = v3;
  v11 = v4;
  v12 = *(id *)(a1 + 40);
  v5 = (void *)MEMORY[0x219A29428](&v7);
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 144))
  {
    +[_DKMotionMonitor log](_DKMotionMonitor, "log", v7, v8, v9, v10, v11);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v2;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_219056000, v6, OS_LOG_TYPE_DEFAULT, "Starting CoreMotion query for date range %@ - %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "queryActivityStartingFromDate:toDate:toQueue:withHandler:", v2, v4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168), v5);
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __26___DKMotionMonitor_update__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void (**v27)(_QWORD, _QWORD);
  NSObject *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  id obj;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  void *v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v8 = (void *)MEMORY[0x219A29278]();
    +[_DKMotionMonitor log](_DKMotionMonitor, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v42 = objc_msgSend(v5, "count");
      v43 = 2112;
      v44 = v6;
      _os_log_impl(&dword_219056000, v9, OS_LOG_TYPE_DEFAULT, "Completed CoreMotion query with %lu results, error %@", buf, 0x16u);
    }

    if (!v6)
    {
      if ((unint64_t)objc_msgSend(v5, "count") >= 2)
      {
        objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v10;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v40, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "sortedArrayUsingDescriptors:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        obj = v12;
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        if (v14)
        {
          v15 = v14;
          v34 = v13;
          v29 = v8;
          v30 = a1;
          v31 = WeakRetained;
          v32 = v5;
          v16 = 0;
          v17 = *(_QWORD *)v36;
          do
          {
            v18 = 0;
            v19 = v16;
            do
            {
              if (*(_QWORD *)v36 != v17)
                objc_enumerationMutation(obj);
              v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v18);
              if (v19)
              {
                v21 = (void *)MEMORY[0x219A29278]();
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", +[_DKMotionMonitor _activityTypeToMotionState:](_DKMotionMonitor, "_activityTypeToMotionState:", v19));
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "startDate");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "startDate");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                +[_DKMotionMonitor _eventWithState:startDate:endDate:](_DKMotionMonitor, "_eventWithState:startDate:endDate:", v22, v23, v24);
                v25 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v34, "addObject:", v25);
                objc_autoreleasePoolPop(v21);
              }
              v16 = v20;

              ++v18;
              v19 = v16;
            }
            while (v15 != v18);
            v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
          }
          while (v15);

          v6 = 0;
          v5 = v32;
          a1 = v30;
          WeakRetained = v31;
          v8 = v29;
          v13 = v34;
        }

        objc_msgSend(WeakRetained, "historicalHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          objc_msgSend(WeakRetained, "historicalHandler");
          v27 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v27)[2](v27, v13);

        }
      }
      objc_msgSend(WeakRetained, "setLastUpdate:", *(_QWORD *)(a1 + 32));
    }
    objc_autoreleasePoolPop(v8);
    +[_DKMotionMonitor log](_DKMotionMonitor, "log");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219056000, v28, OS_LOG_TYPE_DEFAULT, "Periodic update finished", buf, 2u);
    }
  }
  else
  {
    +[_DKMotionMonitor log](_DKMotionMonitor, "log");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      __26___DKMotionMonitor_update__block_invoke_2_cold_1(v28);
  }

}

void __26___DKMotionMonitor_update__block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_219056000, log, OS_LOG_TYPE_ERROR, "Unable to complete update because _DKMotionMonitor is no longer around", v1, 2u);
}

@end
