@implementation FMLocationShifter

- (FMLocationShifter)init
{
  FMLocationShifter *v2;
  dispatch_semaphore_t v3;
  dispatch_queue_t v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FMLocationShifter;
  v2 = -[FMLocationShifter init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_semaphore_create(1);
    -[FMLocationShifter setSemaphore:](v2, "setSemaphore:", v3);

    v4 = dispatch_queue_create("com.apple.icloud.fmcore.shifterQueue", 0);
    -[FMLocationShifter setQueue:](v2, "setQueue:", v4);

    v5 = objc_alloc_init(MEMORY[0x1E0D27178]);
    -[FMLocationShifter setLocationShifter:](v2, "setLocationShifter:", v5);

  }
  return v2;
}

- (BOOL)isLocationShiftRequiredForItem:(id)a3
{
  objc_msgSend(a3, "coordinate");
  return objc_msgSend(MEMORY[0x1E0D27178], "isLocationShiftRequiredForCoordinate:");
}

- (BOOL)isLocationShiftRequiredForItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (-[FMLocationShifter isLocationShiftRequiredForItem:](self, "isLocationShiftRequiredForItem:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11))
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (void)shiftLocation:(id)a3 withCompletionHandler:(id)a4 callbackQueue:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD block[5];
  id v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[FMLocationShifter isLocationShiftRequiredForItem:](self, "isLocationShiftRequiredForItem:", v8))
  {
    objc_msgSend(v8, "coordinate");
    v12 = v11;
    v14 = v13;
    objc_msgSend(v8, "accuracy");
    v16 = v15;
    -[FMLocationShifter queue](self, "queue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__FMLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke;
    block[3] = &unk_1E82AA670;
    v30 = v12;
    v31 = v14;
    v32 = v16;
    block[4] = self;
    v27 = v8;
    v28 = v10;
    v29 = v9;
    v18 = v8;
    v19 = v9;
    dispatch_async(v17, block);

    v20 = v27;
  }
  else
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __71__FMLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke_57;
    v23[3] = &unk_1E82AA5F8;
    v24 = v8;
    v25 = v9;
    v21 = v8;
    v22 = v9;
    dispatch_async(v10, v23);

    v20 = v25;
  }

}

void __71__FMLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  double v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "semaphore");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);

  objc_msgSend(*(id *)(a1 + 32), "locationShifter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v5 = *(double *)(a1 + 80);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__FMLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke_2;
  v14[3] = &unk_1E82AA620;
  v15 = *(id *)(a1 + 40);
  v16 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(void **)(a1 + 40);
  v17 = *(_QWORD *)(a1 + 32);
  v18 = v6;
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __71__FMLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke_4;
  v11[3] = &unk_1E82AA648;
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 32);
  v12 = v8;
  v13 = v9;
  dispatch_get_global_queue(21, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v14, 0, v11, v10, *(double *)(a1 + 64), *(double *)(a1 + 72), v5);

}

void __71__FMLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke_2(uint64_t a1, double a2, double a3, double a4)
{
  FMLocationShifterItem *v8;
  void *v9;
  void *v10;
  FMLocationShifterItem *v11;
  NSObject *v12;
  id v13;
  FMLocationShifterItem *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  FMLocationShifterItem *v20;
  id v21;

  v8 = [FMLocationShifterItem alloc];
  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[FMLocationShifterItem initWithCoordinate:accuracy:timestamp:context:](v8, "initWithCoordinate:accuracy:timestamp:context:", v9, v10, a2, a3, a4);

  -[FMLocationShifterItem setShifted:](v11, "setShifted:", 1);
  v12 = *(NSObject **)(a1 + 40);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __71__FMLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke_3;
  v19 = &unk_1E82AA5F8;
  v13 = *(id *)(a1 + 56);
  v20 = v11;
  v21 = v13;
  v14 = v11;
  dispatch_async(v12, &v16);
  objc_msgSend(*(id *)(a1 + 48), "semaphore", v16, v17, v18, v19);
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v15);

}

uint64_t __71__FMLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __71__FMLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  FMLocationShifterItem *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  FMLocationShifterItem *v13;
  NSObject *v14;
  NSObject *v15;

  v3 = a2;
  v4 = [FMLocationShifterItem alloc];
  objc_msgSend(*(id *)(a1 + 32), "coordinate");
  v6 = v5;
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "accuracy");
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[FMLocationShifterItem initWithCoordinate:accuracy:timestamp:context:](v4, "initWithCoordinate:accuracy:timestamp:context:", v11, v12, v6, v8, v10);

  -[FMLocationShifterItem setError:](v13, "setError:", v3);
  LogCategory_Unspecified();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    __71__FMLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke_4_cold_1((uint64_t)v3, v14);

  objc_msgSend(*(id *)(a1 + 40), "semaphore");
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v15);

}

uint64_t __71__FMLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke_57(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)shiftLocations:(id)a3 withCompletionHandler:(id)a4 callbackQueue:(id)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v24;
  id obj;
  _QWORD v26[4];
  id v27;
  NSObject *v28;
  _QWORD block[4];
  id v30;
  NSObject *v31;
  _QWORD v32[4];
  NSObject *v33;
  id v34;
  NSObject *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[FMLocationShifter isLocationShiftRequiredForItems:](self, "isLocationShiftRequiredForItems:", v8))
  {
    v23 = v9;
    v11 = dispatch_queue_create("com.apple.icloud.fmcore.multishift.shiftSerialQueue", 0);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v13 = dispatch_group_create();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v24 = v8;
    obj = v8;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v37;
      do
      {
        v17 = 0;
        do
        {
          v18 = v10;
          if (*(_QWORD *)v37 != v16)
            objc_enumerationMutation(obj);
          v19 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v17);
          dispatch_group_enter(v13);
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = __72__FMLocationShifter_shiftLocations_withCompletionHandler_callbackQueue___block_invoke;
          v32[3] = &unk_1E82AA698;
          v33 = v11;
          v34 = v12;
          v35 = v13;
          v20 = v19;
          v10 = v18;
          -[FMLocationShifter shiftLocation:withCompletionHandler:callbackQueue:](self, "shiftLocation:withCompletionHandler:callbackQueue:", v20, v32, v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v15);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__FMLocationShifter_shiftLocations_withCompletionHandler_callbackQueue___block_invoke_3;
    block[3] = &unk_1E82AA5F8;
    v30 = v12;
    v31 = v23;
    v21 = v23;
    v22 = v12;
    dispatch_group_notify(v13, v10, block);

    v8 = v24;
  }
  else
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __72__FMLocationShifter_shiftLocations_withCompletionHandler_callbackQueue___block_invoke_4;
    v26[3] = &unk_1E82AA5F8;
    v28 = v9;
    v27 = v8;
    v11 = v9;
    dispatch_async(v10, v26);

    v13 = v28;
  }

}

void __72__FMLocationShifter_shiftLocations_withCompletionHandler_callbackQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__FMLocationShifter_shiftLocations_withCompletionHandler_callbackQueue___block_invoke_2;
  block[3] = &unk_1E82AA4B8;
  v4 = *(NSObject **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  dispatch_sync(v4, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __72__FMLocationShifter_shiftLocations_withCompletionHandler_callbackQueue___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __72__FMLocationShifter_shiftLocations_withCompletionHandler_callbackQueue___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __72__FMLocationShifter_shiftLocations_withCompletionHandler_callbackQueue___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (void)setSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_semaphore, a3);
}

- (GEOLocationShifter)locationShifter
{
  return self->_locationShifter;
}

- (void)setLocationShifter:(id)a3
{
  objc_storeStrong((id *)&self->_locationShifter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)shiftLocation:(id)a3 timeout:(double)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  v6 = a3;
  v23 = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D20218]), "initWithDescription:andTimeout:", CFSTR("shiftLocation"), a4);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __56__FMLocationShifter_Synchronous__shiftLocation_timeout___block_invoke;
  v15 = &unk_1E82AA788;
  v17 = &v18;
  v8 = v7;
  v16 = v8;
  dispatch_get_global_queue(21, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMLocationShifter shiftLocation:withCompletionHandler:callbackQueue:](self, "shiftLocation:withCompletionHandler:callbackQueue:", v6, &v12, v9);

  objc_msgSend(v8, "wait", v12, v13, v14, v15);
  v10 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v10;
}

void __56__FMLocationShifter_Synchronous__shiftLocation_timeout___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "signal");

}

- (id)shiftLocations:(id)a3 timeout:(double)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  v6 = a3;
  v23 = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D20218]), "initWithDescription:andTimeout:", CFSTR("shiftLocations"), a4);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __57__FMLocationShifter_Synchronous__shiftLocations_timeout___block_invoke;
  v15 = &unk_1E82AA7B0;
  v17 = &v18;
  v8 = v7;
  v16 = v8;
  dispatch_get_global_queue(21, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMLocationShifter shiftLocations:withCompletionHandler:callbackQueue:](self, "shiftLocations:withCompletionHandler:callbackQueue:", v6, &v12, v9);

  objc_msgSend(v8, "wait", v12, v13, v14, v15);
  v10 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v10;
}

void __57__FMLocationShifter_Synchronous__shiftLocations_timeout___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "signal");

}

void __71__FMLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C9967000, a2, OS_LOG_TYPE_ERROR, "GEOLocationShifter error: %@", (uint8_t *)&v2, 0xCu);
}

@end
