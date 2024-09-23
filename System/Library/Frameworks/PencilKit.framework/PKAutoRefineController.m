@implementation PKAutoRefineController

- (PKAutoRefineController)init
{
  PKAutoRefineController *v2;
  uint64_t v3;
  NSMutableArray *refinableLocalPencilStrokeUUIDs;
  PKAutoRefineSettingsObserver *v5;
  PKAutoRefineSettingsObserver *v6;
  PKAutoRefineSettingsObserver *settingsObserver;
  NSObject *v8;
  uint8_t v10[16];
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKAutoRefineController;
  v2 = -[PKAutoRefineController init](&v14, sel_init);
  if (v2)
  {
    v2->_isAutoRefineOn = +[PKSettingsDaemon autoRefineEnabled](PKSettingsDaemon, "autoRefineEnabled");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    refinableLocalPencilStrokeUUIDs = v2->_refinableLocalPencilStrokeUUIDs;
    v2->_refinableLocalPencilStrokeUUIDs = (NSMutableArray *)v3;

    objc_initWeak(&location, v2);
    v5 = [PKAutoRefineSettingsObserver alloc];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __30__PKAutoRefineController_init__block_invoke;
    v11[3] = &unk_1E77785B0;
    objc_copyWeak(&v12, &location);
    v6 = (PKAutoRefineSettingsObserver *)-[PKAutoRefineSettingsObserver initWithHandler:](v5, v11);
    settingsObserver = v2->_settingsObserver;
    v2->_settingsObserver = v6;

    v8 = os_log_create("com.apple.pencilkit", "PKAutoRefineController");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v10 = 0;
      _os_log_debug_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEBUG, "AutoRefine create PKAutoRefineController.", v10, 2u);
    }

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __30__PKAutoRefineController_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;

  v3 = a2;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__PKAutoRefineController_init__block_invoke_2;
  v4[3] = &unk_1E7777588;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  PKPerformOnMainThread(v4);
  objc_destroyWeak(&v5);

}

void __30__PKAutoRefineController_init__block_invoke_2(uint64_t a1)
{
  unsigned __int8 *WeakRetained;
  NSObject *v2;
  int v3;
  unsigned __int8 *v4;
  uint8_t buf[16];

  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v2 = os_log_create("com.apple.pencilkit", "PKAutoRefineController");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "Handle AutoRefine settings did change.", buf, 2u);
    }

    v3 = +[PKSettingsDaemon autoRefineEnabled](PKSettingsDaemon, "autoRefineEnabled");
    WeakRetained = v4;
    if (v4[24] != v3)
    {
      -[PKAutoRefineController clearRefinableStrokes]((uint64_t)v4);
      WeakRetained = v4;
      v4[24] = v3;
    }
  }

}

- (void)setIsAutoRefineOn:(int)a3 force:
{
  char v4;
  void *v6;

  if (a1)
  {
    v4 = a2;
    if (*(unsigned __int8 *)(a1 + 24) != a2)
    {
      -[PKAutoRefineController clearRefinableStrokes](a1);
      *(_BYTE *)(a1 + 24) = v4;
    }
    if (a3)
    {
      v6 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = 0;

    }
  }
}

- (void)clearRefinableStrokes
{
  NSObject *v1;
  uint8_t v2[16];

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "removeAllObjects");
    v1 = os_log_create("com.apple.pencilkit", "PKAutoRefineController");
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v2 = 0;
      _os_log_debug_impl(&dword_1BE213000, v1, OS_LOG_TYPE_DEBUG, "AutoRefine _refinableLocalPencilStrokeUUIDs cleared.", v2, 2u);
    }

  }
}

- (void)indexRefinableStroke:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  CGRect v15;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1 && v3 && *(_BYTE *)(a1 + 24))
  {
    v5 = *(void **)(a1 + 8);
    objc_msgSend(v3, "_strokeUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

    v7 = os_log_create("com.apple.pencilkit", "PKAutoRefineController");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "_bounds");
      NSStringFromCGRect(v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(*(id *)(a1 + 8), "count");
      v10 = 138412546;
      v11 = v8;
      v12 = 2048;
      v13 = v9;
      _os_log_debug_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEBUG, "AutoRefine _refinableLocalPencilStrokeUUIDs adding one stroke (bounds = %@) -> new count = %ld", (uint8_t *)&v10, 0x16u);

    }
  }

}

- (uint64_t)isRefinableStroke:(uint64_t)result
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (result)
  {
    v2 = *(void **)(result + 8);
    objc_msgSend(a2, "_strokeUUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v2, "containsObject:", v3);

    return v4;
  }
  return result;
}

- (void)removeAsRefinableStrokes:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(a1 + 8);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "_strokeUUID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "removeObject:", v10);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      }
      while (v6);
    }
    v11 = os_log_create("com.apple.pencilkit", "PKAutoRefineController");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = objc_msgSend(v4, "count");
      v13 = objc_msgSend(*(id *)(a1 + 8), "count");
      *(_DWORD *)buf = 134218240;
      v19 = v12;
      v20 = 2048;
      v21 = v13;
      _os_log_debug_impl(&dword_1BE213000, v11, OS_LOG_TYPE_DEBUG, "AutoRefine _refinableLocalPencilStrokeUUIDs removed %ld strokes -> new count = %ld", buf, 0x16u);
    }

  }
}

- (void)computeSynthesisParametersFromSourceStrokes:(_QWORD *)a3 outInk:(_QWORD *)a4 outReferenceStroke:
{
  id v7;
  void *v8;
  id *v9;
  void *v10;
  uint64_t *v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD v14[9];
  _QWORD v15[4];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  BOOL v31;
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = v7;
  if (a1)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = *(_QWORD *)(a1 + 32) != 0;
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__27;
    v26 = __Block_byref_object_dispose__27;
    v27 = 0;
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__27;
    v20 = __Block_byref_object_dispose__27;
    v21 = 0;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = -1;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __96__PKAutoRefineController_computeSynthesisParametersFromSourceStrokes_outInk_outReferenceStroke___block_invoke;
    v14[3] = &unk_1E777CCC8;
    v14[4] = a1;
    v14[5] = v15;
    v14[6] = &v22;
    v14[7] = &v16;
    v14[8] = &v28;
    objc_msgSend(v7, "enumerateObjectsWithOptions:usingBlock:", 2, v14);
    if (*((_BYTE *)v29 + 24))
    {
      *a3 = objc_retainAutorelease(*(id *)(a1 + 32));
      v9 = (id *)(a1 + 40);
    }
    else
    {
      v10 = (void *)v23[5];
      if (v10)
      {
        objc_msgSend(v10, "_ink");
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        v11 = v23;
      }
      else
      {
        v12 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = objc_msgSend(v8, "count");
          *(_DWORD *)buf = 134217984;
          v33 = v13;
          _os_log_error_impl(&dword_1BE213000, v12, OS_LOG_TYPE_ERROR, "AutoRefine: No reflowable stroke identified among %ld stroke to determine the synthesis parameters, fallback to using a non-refinable stroke instead.", buf, 0xCu);
        }

        objc_msgSend((id)v17[5], "_ink");
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        v11 = v17;
      }
      v9 = (id *)(v11 + 5);
    }
    *a4 = objc_retainAutorelease(*v9);
    _Block_object_dispose(v15, 8);
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v28, 8);
  }

}

void __96__PKAutoRefineController_computeSynthesisParametersFromSourceStrokes_outInk_outReferenceStroke___block_invoke(_QWORD *a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  void *v10;
  char v11;
  id v12;

  v12 = a2;
  v4 = *(void **)(a1[4] + 8);
  objc_msgSend(v12, "_strokeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  if ((objc_msgSend(v12, "_isSynthesizedInk") & 1) == 0
    && v6 != 0x7FFFFFFFFFFFFFFFLL
    && v6 > *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v6;
  }
  v7 = *(_QWORD *)(a1[7] + 8);
  v9 = *(_QWORD *)(v7 + 40);
  v8 = (id *)(v7 + 40);
  if (!v9)
    objc_storeStrong(v8, a2);
  if (*(_QWORD *)(a1[4] + 32))
  {
    objc_msgSend(v12, "ink");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", *(_QWORD *)(a1[4] + 32));

    if ((v11 & 1) == 0)
      *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 0;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stableReferenceStroke, 0);
  objc_storeStrong((id *)&self->_stableInk, 0);
  objc_storeStrong((id *)&self->_settingsObserver, 0);
  objc_storeStrong((id *)&self->_refinableLocalPencilStrokeUUIDs, 0);
}

@end
