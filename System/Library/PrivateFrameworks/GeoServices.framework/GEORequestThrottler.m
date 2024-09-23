@implementation GEORequestThrottler

+ (id)sharedThrottler
{
  if (qword_1ECDBBB28 != -1)
    dispatch_once(&qword_1ECDBBB28, &__block_literal_global_36);
  return (id)_MergedGlobals_199;
}

void __38__GEORequestThrottler_sharedThrottler__block_invoke()
{
  GEORequestThrottler *v0;
  void *v1;

  v0 = objc_alloc_init(GEORequestThrottler);
  v1 = (void *)_MergedGlobals_199;
  _MergedGlobals_199 = (uint64_t)v0;

}

- (GEORequestThrottler)init
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *global_workloop;
  dispatch_source_t v8;
  void *v9;
  NSObject *v10;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)GEORequestThrottler;
  v2 = -[GEORequestThrottler init](&v15, sel_init);
  if (v2)
  {
    v3 = geo_isolater_create();
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v5;

    *((_QWORD *)v2 + 4) = 0x7FEFFFFFFFFFFFFFLL;
    global_workloop = geo_get_global_workloop();
    v8 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, global_workloop);
    v9 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v8;

    dispatch_source_set_timer(*((dispatch_source_t *)v2 + 5), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    objc_initWeak(&location, v2);
    v10 = *((_QWORD *)v2 + 5);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __27__GEORequestThrottler_init__block_invoke;
    v12[3] = &unk_1E1BFF8B0;
    objc_copyWeak(&v13, &location);
    dispatch_source_set_event_handler(v10, v12);
    dispatch_activate(*((dispatch_object_t *)v2 + 5));
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return (GEORequestThrottler *)v2;
}

void __27__GEORequestThrottler_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "submitTickets");

}

- (void)enqueueTicket:(id)a3 submissionHandler:(id)a4
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v7, "dataRequestKind");
  objc_msgSend(v5, "numberWithInt:", HIDWORD(v8) | v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_GEOThrottledTicket ticket:withHandler:](_GEOThrottledTicket, "ticket:withHandler:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v10;
  v12 = v9;
  geo_isolate_sync_data();

}

void __55__GEORequestThrottler_enqueueTicket_submissionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v6 = v2;
    objc_msgSend(v2, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeTime");
    v5 = v4;

    objc_msgSend(*(id *)(a1 + 48), "setSafeTime:", v5);
    objc_msgSend(v6, "addObject:", *(_QWORD *)(a1 + 48));
    if (v5 != 0.0)
      goto LABEL_6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 40));
    objc_msgSend(v6, "addObject:", *(_QWORD *)(a1 + 48));
  }
  objc_msgSend(*(id *)(a1 + 32), "_scheduleTimer:", 0.0);
LABEL_6:

}

- (void)cancelTicket:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = objc_msgSend(v3, "dataRequestKind");
  objc_msgSend(v4, "numberWithInt:", HIDWORD(v5) | v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  v8 = v6;
  geo_isolate_sync_data();

}

void __36__GEORequestThrottler_cancelTicket___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 48), "conformsToProtocol:", &unk_1EDF8CF60))
    objc_msgSend(*(id *)(a1 + 48), "cancel");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__GEORequestThrottler_cancelTicket___block_invoke_2;
  v4[3] = &unk_1E1C05390;
  v5 = *(id *)(a1 + 48);
  v2 = objc_msgSend(v3, "indexOfObjectPassingTest:", v4);
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v3, "removeObjectAtIndex:", v2);

}

BOOL __36__GEORequestThrottler_cancelTicket___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  _BOOL8 result;

  objc_msgSend(a2, "ticket");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);

  if (v6 != v7)
    return *a4 != 0;
  result = 1;
  *a4 = 1;
  return result;
}

- (void)_scheduleTimer:(double)a3
{
  CFAbsoluteTime v5;
  dispatch_time_t v6;

  geo_assert_isolated();
  v5 = CFAbsoluteTimeGetCurrent() + a3;
  if (self->_nextSubmissionTime >= v5)
  {
    v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)self->_submissionTimer, v6, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
    self->_nextSubmissionTime = v5;
  }
}

- (void)submitTickets
{
  double Current;
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *global_workloop;
  dispatch_qos_class_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  dispatch_block_t v27;
  double v28;
  void *v30;
  void *v31;
  id v32;
  _QWORD block[5];
  id v34;
  int v35;
  double v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(_QWORD *);
  void *v44;
  GEORequestThrottler *v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__13;
  v56 = __Block_byref_object_dispose__13;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v57 = (id)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 0;
  v41 = MEMORY[0x1E0C809B0];
  v42 = 3221225472;
  v43 = __36__GEORequestThrottler_submitTickets__block_invoke;
  v44 = &unk_1E1C00788;
  v45 = self;
  v46 = &v48;
  v47 = &v52;
  geo_isolate_sync_data();
  if (!*((_BYTE *)v49 + 24) && objc_msgSend((id)v53[5], "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    Current = CFAbsoluteTimeGetCurrent();
    v39 = 0u;
    v40 = 0u;
    v38 = 0u;
    v37 = 0u;
    v3 = (id)v53[5];
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v58, 16);
    if (!v4)
      goto LABEL_25;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v38;
    v9 = 0.0;
    while (1)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v3);
        v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v11, "safeTime");
        if (v12 > Current)
          goto LABEL_18;
        objc_msgSend(v11, "ticket");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "dataRequestKind");

        if (v14 == v5 && v6 == 0)
        {
          objc_msgSend(v11, "safeTime");
          if (v28 < v9)
            objc_msgSend(v11, "setSafeTime:", v9);
          v6 = 0;
LABEL_18:
          v7 = 1;
          continue;
        }
        v36 = 0.0;
        v35 = 0;
        +[GEOThrottlerRequester sharedRequester](GEOThrottlerRequester, "sharedRequester");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0;
        objc_msgSend(v16, "getTokenOrInfoFor:nextSafeRequestTime:availableRequestCount:error:", v14, &v36, &v35, &v34);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v34;

        if (v17)
        {
          objc_msgSend(v11, "ticket");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setThrottlerToken:", v17);

          global_workloop = geo_get_global_workloop();
          v21 = objc_msgSend(v11, "qos");
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __36__GEORequestThrottler_submitTickets__block_invoke_2;
          block[3] = &unk_1E1BFF6F8;
          block[4] = v11;
          v31 = v17;
          v22 = v18;
          v23 = v4;
          v24 = v8;
          v25 = v7;
          v26 = v3;
          v27 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v21, 0, block);
          dispatch_async(global_workloop, v27);

          v3 = v26;
          v7 = v25;
          v8 = v24;
          v4 = v23;
          v18 = v22;
          v17 = v31;

          objc_msgSend(v30, "addObject:", v11);
        }
        else
        {
          if (!v18)
            objc_msgSend(v11, "setSafeTime:", v36);
          v7 = 1;
        }
        v6 = v35;
        v9 = v36;

        v5 = v14;
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v58, 16);
      if (!v4)
      {
LABEL_25:

        v32 = v30;
        geo_isolate_sync_data();

        break;
      }
    }
  }
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);

}

void __36__GEORequestThrottler_submitTickets__block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_BYTE *)(a1[4] + 24);
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    objc_msgSend(*(id *)(a1[4] + 16), "allValues", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++));
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      }
      while (v4);
    }

    if (objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "count"))
      *(_BYTE *)(a1[4] + 24) = 1;
    *(_QWORD *)(a1[4] + 32) = 0x7FEFFFFFFFFFFFFFLL;
    dispatch_source_set_timer(*(dispatch_source_t *)(a1[4] + 40), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

void __36__GEORequestThrottler_submitTickets__block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(id, void *);

  objc_msgSend(*(id *)(a1 + 32), "submissionHandler");
  v3 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "ticket");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v2);

}

void __36__GEORequestThrottler_submitTickets__block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t j;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  double v26;
  double v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v38 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v7, "ticket");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "dataRequestKind");
        objc_msgSend(v8, "numberWithInt:", HIDWORD(v10) | v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeObject:", v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v4);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 24) = 0;
  if (*(_BYTE *)(a1 + 48))
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "allValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v34;
      v17 = 1.79769313e308;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v34 != v16)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v20 = v19;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v30;
            do
            {
              for (k = 0; k != v22; ++k)
              {
                if (*(_QWORD *)v30 != v23)
                  objc_enumerationMutation(v20);
                v25 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * k);
                objc_msgSend(v25, "safeTime");
                if (v26 > 0.0)
                {
                  objc_msgSend(v25, "safeTime");
                  if (v17 >= v27)
                  {
                    objc_msgSend(v25, "safeTime");
                    v17 = v28;
                  }
                }
              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
            }
            while (v22);
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      }
      while (v15);

      if (v17 < 1.79769313e308)
        objc_msgSend(*(id *)(a1 + 40), "_scheduleTimer:", v17 - CFAbsoluteTimeGetCurrent());
    }
    else
    {

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submissionTimer, 0);
  objc_storeStrong((id *)&self->_enqueuedTickets, 0);
  objc_storeStrong((id *)&self->_isolater, 0);
}

@end
