@implementation PKRecognitionSessionManager

- (PKRecognitionSessionManager)init
{
  void *v3;
  char *v4;

  objc_opt_self();
  +[PKRecognitionSessionManagerConfiguration interactiveCanvasConfiguration]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKRecognitionSessionManager initWithConfiguration:]((char *)self, v3);

  return (PKRecognitionSessionManager *)v4;
}

- (char)initWithConfiguration:(char *)a1
{
  _BYTE *v3;
  NSObject *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  void *v11;
  PKHandwritingTranscriptionCache *v12;
  void *v13;
  PKHandwritingTranscriptionCache *v14;
  void *v15;
  id *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int16 v22[8];
  objc_super v23;

  v3 = a2;
  if (a1)
  {
    v23.receiver = a1;
    v23.super_class = (Class)PKRecognitionSessionManager;
    a1 = (char *)objc_msgSendSuper2(&v23, sel_init);
    if (a1)
    {
      v4 = os_log_create("com.apple.pencilkit", "RecognitionManager");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v22[0] = 0;
        _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Create manager.", (uint8_t *)v22, 2u);
      }

      if (v3)
        v5 = v3[8] != 0;
      else
        v5 = 0;
      a1[8] = v5;
      objc_msgSend(a1, "setState:", 0);
      a1[112] = 1;
      *(_DWORD *)(a1 + 113) = 0;
      *(_WORD *)(a1 + 117) = 0;
      v6 = (void *)*((_QWORD *)a1 + 17);
      *((_QWORD *)a1 + 17) = 0;

      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)*((_QWORD *)a1 + 19);
      *((_QWORD *)a1 + 19) = v7;

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = dispatch_queue_create("com.apple.PencilKit.RecognitionManager", v9);
      v11 = (void *)*((_QWORD *)a1 + 3);
      *((_QWORD *)a1 + 3) = v10;

      v12 = objc_alloc_init(PKHandwritingTranscriptionCache);
      v13 = (void *)*((_QWORD *)a1 + 11);
      *((_QWORD *)a1 + 11) = v12;

      v14 = objc_alloc_init(PKHandwritingTranscriptionCache);
      v15 = (void *)*((_QWORD *)a1 + 12);
      *((_QWORD *)a1 + 12) = v14;

      v16 = -[PKRecognitionQueryController initWithRecognitionSessionManager:]((id *)[PKRecognitionQueryController alloc], a1);
      v17 = (void *)*((_QWORD *)a1 + 15);
      *((_QWORD *)a1 + 15) = v16;

      if (v3)
      {
        if (v3[9])
        {
          v18 = *((_QWORD *)a1 + 15);
          v19 = objc_opt_class();
          if (v18)
            objc_msgSend(*(id *)(v18 + 32), "setObject:forKey:", v19, CFSTR("SmartSelection"));
        }
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObserver:selector:name:object:", a1, sel_textInputDidChange_, CFSTR("TIPreferencesControllerChangedNotification"), 0);

    }
  }

  return a1;
}

- (void)dealloc
{
  NSObject *v3;
  PKRecognitionSessionObserverWrapper *observerWrapper;
  void *v5;
  NSObject *recognitionSessionQueue;
  objc_super v7;
  uint8_t buf[8];
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  PKRecognitionSessionManager *v12;

  v3 = os_log_create("com.apple.pencilkit", "RecognitionManager");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE213000, v3, OS_LOG_TYPE_DEFAULT, "Teardown", buf, 2u);
  }

  self->_isTearingDown = 1;
  observerWrapper = self->_observerWrapper;
  if (observerWrapper)
    atomic_store(1u, (unsigned __int8 *)&observerWrapper->_deactivated);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  if (dispatch_queue_get_label(0) == "com.apple.PencilKit.RecognitionManager")
  {
    -[PKRecognitionSessionManager q_teardownSession]((uint64_t)self);
  }
  else
  {
    recognitionSessionQueue = self->_recognitionSessionQueue;
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __47__PKRecognitionSessionManager__teardownSession__block_invoke;
    v11 = &unk_1E7776F38;
    v12 = self;
    dispatch_sync(recognitionSessionQueue, buf);
  }
  v7.receiver = self;
  v7.super_class = (Class)PKRecognitionSessionManager;
  -[PKRecognitionSessionManager dealloc](&v7, sel_dealloc);
}

- (void)textStrokesCoveredByStroke:(void *)a3 completion:
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (a1)
  {
    -[PKRecognitionSessionManager groupQuery](a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textStrokesCoveredByStroke:completion:", v7, v5);

  }
}

- (id)groupQuery
{
  id v1;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  if (!a1)
    return 0;
  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__29;
  v8 = __Block_byref_object_dispose__29;
  v9 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__PKRecognitionSessionManager_groupQuery__block_invoke;
  v3[3] = &unk_1E7777418;
  v3[4] = a1;
  v3[5] = &v4;
  -[PKRecognitionSessionManager _dispatchSyncToRecognitionThreadIfNecessary:](a1, v3);
  v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

- (void)setDelegate:(uint64_t)a1
{
  id v3;
  char v4;
  char v5;
  char v6;
  char v7;
  id v8;

  v3 = a2;
  if (a1)
  {
    v8 = v3;
    objc_storeWeak((id *)(a1 + 184), v3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = 2;
    else
      v4 = 0;
    *(_BYTE *)(a1 + 176) = *(_BYTE *)(a1 + 176) & 0xFD | v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 4;
    else
      v5 = 0;
    *(_BYTE *)(a1 + 176) = *(_BYTE *)(a1 + 176) & 0xFB | v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 8;
    else
      v6 = 0;
    *(_BYTE *)(a1 + 176) = *(_BYTE *)(a1 + 176) & 0xF7 | v6;
    *(_BYTE *)(a1 + 176) = *(_BYTE *)(a1 + 176) & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 16;
    else
      v7 = 0;
    *(_BYTE *)(a1 + 176) = *(_BYTE *)(a1 + 176) & 0xEF | v7;
    v3 = v8;
  }

}

- (void)addListener:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 24);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43__PKRecognitionSessionManager_addListener___block_invoke;
    v6[3] = &unk_1E7777440;
    v6[4] = a1;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __43__PKRecognitionSessionManager_addListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeListener:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 24);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__PKRecognitionSessionManager_removeListener___block_invoke;
    v6[3] = &unk_1E7777440;
    v6[4] = a1;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

void __46__PKRecognitionSessionManager_removeListener___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "removeObject:", *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "count"))
    -[PKRecognitionSessionManager q_teardownSession](*(_QWORD *)(a1 + 32));
}

- (void)q_teardownSession
{
  unsigned __int8 *v2;
  unsigned __int8 *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  unsigned __int8 *v14;

  if (a1)
  {
    v2 = (unsigned __int8 *)*(id *)(a1 + 128);
    v3 = v2;
    if (v2)
      atomic_store(1u, v2 + 16);
    v4 = *(void **)(a1 + 128);
    *(_QWORD *)(a1 + 128) = 0;

    v5 = *(_QWORD *)(a1 + 120);
    if (v5)
    {
      -[PKRecognitionQueryController clearVisibleStrokesQueries](*(_QWORD *)(a1 + 120));
      -[PKRecognitionQueryController clearDrawingQueries](v5);
    }
    -[PKRecognitionSessionManager q_saveRecognitionSessionIfNecessary](a1);
    v6 = *(void **)(a1 + 144);
    if (v6)
    {
      -[PKAutoRefineTaskManager cancelAllTasks](v6);
      v7 = *(void **)(a1 + 144);
      *(_QWORD *)(a1 + 144) = 0;

    }
    objc_msgSend(*(id *)(a1 + 48), "cancelOngoingRequests");
    objc_msgSend(*(id *)(a1 + 48), "setDataSource:", 0);
    v8 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = 0;

    v9 = *(id *)(a1 + 48);
    v10 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = 0;

    if (v3)
    {
      if (v9)
      {
        dispatch_get_global_queue(17, 0);
        v11 = objc_claimAutoreleasedReturnValue();
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __48__PKRecognitionSessionManager_q_teardownSession__block_invoke;
        v12[3] = &unk_1E7777440;
        v13 = v9;
        v14 = v3;
        dispatch_async(v11, v12);

      }
    }

  }
}

- (id)listeners
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__29;
  v9 = __Block_byref_object_dispose__29;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__PKRecognitionSessionManager_listeners__block_invoke;
  v4[3] = &unk_1E7777418;
  v4[4] = self;
  v4[5] = &v5;
  -[PKRecognitionSessionManager _dispatchSyncToRecognitionThreadIfNecessary:]((uint64_t)self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __40__PKRecognitionSessionManager_listeners__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 152));
}

- (void)_dispatchSyncToRecognitionThreadIfNecessary:(uint64_t)a1
{
  NSObject *v3;
  void (**v4)(void);
  _QWORD block[4];
  void (**v6)(void);

  v4 = a2;
  if (a1)
  {
    if (dispatch_queue_get_label(0) == "com.apple.PencilKit.RecognitionManager")
    {
      v4[2]();
    }
    else
    {
      v3 = *(NSObject **)(a1 + 24);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __75__PKRecognitionSessionManager__dispatchSyncToRecognitionThreadIfNecessary___block_invoke;
      block[3] = &unk_1E7776F60;
      v6 = v4;
      dispatch_sync(v3, block);

    }
  }

}

- (void)cleanupSessionIfNecessary
{
  NSObject *v1;
  _QWORD block[5];

  if (a1)
  {
    v1 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__PKRecognitionSessionManager_cleanupSessionIfNecessary__block_invoke;
    block[3] = &unk_1E7776F38;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

void __56__PKRecognitionSessionManager_cleanupSessionIfNecessary__block_invoke(uint64_t a1)
{
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "count"))
    -[PKRecognitionSessionManager q_teardownSession](*(_QWORD *)(a1 + 32));
}

uint64_t __75__PKRecognitionSessionManager__dispatchSyncToRecognitionThreadIfNecessary___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)session
{
  id v1;
  NSObject *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v1 = a1;
  if (a1)
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x3032000000;
    v8 = __Block_byref_object_copy__29;
    v9 = __Block_byref_object_dispose__29;
    v10 = 0;
    if (dispatch_queue_get_label(0) == "com.apple.PencilKit.RecognitionManager")
    {
      v10 = *((id *)v1 + 6);
    }
    else
    {
      v2 = *((_QWORD *)v1 + 3);
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __38__PKRecognitionSessionManager_session__block_invoke;
      v4[3] = &unk_1E7777418;
      v4[4] = v1;
      v4[5] = &v5;
      dispatch_sync(v2, v4);
    }
    v1 = (id)v6[5];
    _Block_object_dispose(&v5, 8);

  }
  return v1;
}

void __38__PKRecognitionSessionManager_session__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

- (void)setState:(int64_t)a3
{
  atomic_store(a3, (unint64_t *)&self->_stateAtomic);
}

- (int64_t)state
{
  return atomic_load((unint64_t *)&self->_stateAtomic);
}

- (id)drawing
{
  id *v1;
  id v2;

  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    v2 = v1[4];
    objc_sync_exit(v1);

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)setDrawing:(void *)a1
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = a1;
    objc_sync_enter(v4);
    if ((objc_msgSend(v3, "isEqual:", v4[4]) & 1) != 0)
    {
      objc_sync_exit(v4);

    }
    else
    {
      v5 = objc_msgSend(v3, "copy");
      v6 = (void *)v4[4];
      v4[4] = v5;

      objc_sync_exit(v4);
      v7 = os_log_create("com.apple.pencilkit", "RecognitionManager");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "uuid");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v15 = v8;
        _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEFAULT, "Drawing did change: %@", buf, 0xCu);

      }
      -[PKRecognitionSessionManager scheduleSaveRecognitionSession]((uint64_t)v4);
      v9 = (void *)objc_msgSend(v3, "copy");
      v10 = v4[3];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __42__PKRecognitionSessionManager_setDrawing___block_invoke;
      v12[3] = &unk_1E7777440;
      v12[4] = v4;
      v13 = v9;
      v11 = v9;
      dispatch_async(v10, v12);

    }
  }

}

- (void)scheduleSaveRecognitionSession
{
  void (**v1)(_QWORD);
  _QWORD aBlock[5];

  if (a1 && *(_BYTE *)(a1 + 8))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__PKRecognitionSessionManager_scheduleSaveRecognitionSession__block_invoke;
    aBlock[3] = &unk_1E7776F38;
    aBlock[4] = a1;
    v1 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      v1[2](v1);
    else
      dispatch_async(MEMORY[0x1E0C80D38], v1);

  }
}

void __42__PKRecognitionSessionManager_setDrawing___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  if (v3 && *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v3, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:", v5) ^ 1;

    v2 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v6 = 0;
  }
  objc_storeStrong((id *)(v2 + 40), *(id *)(a1 + 40));
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 104);
  *(_QWORD *)(v7 + 104) = 0;

  if (*(_QWORD *)(a1 + 40))
  {
    if (v6)
    {
      v9 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1BE213000, v9, OS_LOG_TYPE_DEFAULT, "Drawing UUID changed in setDrawing.", v10, 2u);
      }

    }
    -[PKRecognitionSessionManager q_createRecognitionSessionIfNecessary](*(_QWORD *)(a1 + 32));
    -[PKRecognitionSessionManager q_needRecognitionUpdateWithCancel:](*(void **)(a1 + 32));
  }
  else
  {
    -[PKRecognitionSessionManager q_teardownSession](*(_QWORD *)(a1 + 32));
  }
}

- (uint64_t)q_createRecognitionSessionIfNecessary
{
  uint64_t v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  PKAutoRefineTaskManager *v20;
  void *v21;
  id WeakRetained;
  uint64_t v23;
  PKRecognitionSessionObserverWrapper *v24;
  PKRecognitionSessionObserverWrapper **v25;
  PKRecognitionSessionObserverWrapper *v26;
  PKRecognitionSessionObserverWrapper **v27;
  PKRecognitionSessionObserverWrapper *v28;
  uint64_t v29;
  const __CFString *v30;
  _BYTE buf[18];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v1 = result;
  if (*(_QWORD *)(result + 48))
    return result;
  objc_msgSend(*(id *)(result + 40), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(unsigned __int8 *)(v1 + 8);

    if (v3)
    {
      objc_msgSend(*(id *)(v1 + 40), "uuid");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      PKLoadRecognitionSession(v4);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(v1 + 48);
      *(_QWORD *)(v1 + 48) = v5;

      v7 = os_log_create("com.apple.pencilkit", "RecognitionManager");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(v1 + 40), "uuid");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "uniqueCacheFilePath");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(v1 + 48) != 0;
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v9;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v10;
        _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEFAULT, "Loading session cache for: %@, success: %{BOOL}d", buf, 0x12u);

      }
      if (!*(_QWORD *)(v1 + 48))
        goto LABEL_10;
      objc_msgSend((id)v1, "setState:", 3);
    }
  }
  if (!*(_QWORD *)(v1 + 48))
  {
LABEL_10:
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D16828]), "initWithMode:", 0);
    v12 = *(void **)(v1 + 48);
    *(_QWORD *)(v1 + 48) = v11;

    if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
    {
      v13 = *(void **)(v1 + 48);
      v29 = *MEMORY[0x1E0D16790];
      v30 = CFSTR("! &() + , - . / 0 1 2 3 4 5 6 7 8 9 : = [ \\\\ \\ \\$ \\% \\arccos \\arcsin \\arctan \\ast \\cdot \\circ \\cos \\cosh \\cot \\coth \\csc \\div \\frac \\hline \\lceil \\left( \\left. \\left\\lceil \\left\\lfloor \\left| \\lfloor \\lg \\ln \\log \\pi \\prime \\rceil \\rfloor \\right) \\right. \\right\\rceil \\right\\rfloor \\right| \\sec \\sin \\sinh \\sqrt \\tan \\tanh \\times ] ^ _ a A b B c C d D e E f F g G H h i I j J k K L l m M n N o O p P q Q r R s S t T u U v V w W x X y Y z Z { | } \\begin{array}{lr} \\end{array}");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "updateRecognitionOptions:", v14);

    }
  }
  objc_msgSend(*(id *)(v1 + 48), "textSynthesizer");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(void **)(v1 + 64);
  *(_QWORD *)(v1 + 64) = v15;

  objc_msgSend((id)objc_opt_class(), "enabledLocales");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v1 + 48), "setPreferredLocales:", v17);

  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(*(id *)(v1 + 48), "textSynthesizerWithLocaleFallbackIsSupported"))
  {
    objc_msgSend(*(id *)(v1 + 48), "textSynthesizerWithLocaleFallback");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(void **)(v1 + 56);
    *(_QWORD *)(v1 + 56) = v18;

  }
  objc_msgSend(*(id *)(v1 + 48), "setDataSource:", v1);
  if (*(_QWORD *)(v1 + 48) && !*(_QWORD *)(v1 + 144))
  {
    v20 = objc_alloc_init(PKAutoRefineTaskManager);
    v21 = *(void **)(v1 + 144);
    *(_QWORD *)(v1 + 144) = v20;

    WeakRetained = objc_loadWeakRetained((id *)(v1 + 192));
    v23 = *(_QWORD *)(v1 + 144);
    if (v23)
      objc_storeWeak((id *)(v23 + 32), WeakRetained);

  }
  v24 = [PKRecognitionSessionObserverWrapper alloc];
  v25 = (PKRecognitionSessionObserverWrapper **)(id)v1;
  if (v24)
  {
    *(_QWORD *)buf = v24;
    *(_QWORD *)&buf[8] = PKRecognitionSessionObserverWrapper;
    v26 = (PKRecognitionSessionObserverWrapper *)objc_msgSendSuper2((objc_super *)buf, sel_init);
    v24 = v26;
    if (v26)
    {
      objc_storeWeak((id *)&v26->_realObserver, v25);
      atomic_store(0, (unsigned __int8 *)&v24->_deactivated);
    }
  }

  v28 = v25[16];
  v27 = v25 + 16;
  *v27 = v24;

  return objc_msgSend(*(id *)(v1 + 48), "registerChangeObserver:", *v27);
}

- (void)q_needRecognitionUpdateWithCancel:(void *)result
{
  void *v1;
  NSObject *v2;
  uint8_t v3[16];

  if (result)
  {
    v1 = result;
    if (objc_msgSend(result, "state") != 3)
    {
      objc_msgSend(*((id *)v1 + 6), "cancelOngoingRequests");
      -[PKRecognitionQueryController setupVisibleStrokesQueries](*((_QWORD *)v1 + 15));
      v2 = os_log_create("com.apple.pencilkit", "RecognitionManager");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v3 = 0;
        _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "Cancel the ongoing requests", v3, 2u);
      }

    }
    return (void *)objc_msgSend(*((id *)v1 + 6), "setNeedsRecognitionUpdate");
  }
  return result;
}

- (void)setCalculateDocumentProvider:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 24);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__PKRecognitionSessionManager_setCalculateDocumentProvider___block_invoke;
    v6[3] = &unk_1E7777440;
    v6[4] = a1;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

void __60__PKRecognitionSessionManager_setCalculateDocumentProvider___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  int v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 40);
  v3 = (unint64_t)*(id *)(*(_QWORD *)(a1 + 32) + 80);
  v4 = v2;
  v5 = (void *)v4;
  if (v3 | v4)
  {
    if (v3)
      v7 = v4 == 0;
    else
      v7 = 1;
    if (v7)
      v6 = 0;
    else
      v6 = objc_msgSend((id)v3, "isEqual:", v4);
  }
  else
  {
    v6 = 1;
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 40));
  v8 = os_log_create("com.apple.pencilkit", "Math");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "recognizedExpressions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    objc_msgSend(*(id *)(a1 + 40), "declaredVariables");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 134218496;
    v13 = v10;
    v14 = 2048;
    v15 = objc_msgSend(v11, "count");
    v16 = 1024;
    v17 = v6 ^ 1;
    _os_log_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEFAULT, "Calculate document provider changed: %lu, %lu, did change: %{BOOL}d", (uint8_t *)&v12, 0x1Cu);

  }
  if ((v6 & 1) == 0)
    -[PKRecognitionSessionManager q_needRecognitionUpdateWithCancel:](*(void **)(a1 + 32));
}

- (void)setDrawing:(void *)a3 withVisibleOnscreenStrokes:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  char v21;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    v8 = (void *)objc_msgSend(v6, "copy");
    v9 = a1;
    objc_sync_enter(v9);
    v10 = objc_msgSend(v5, "isEqual:", v9[4]);
    if ((v10 & 1) == 0)
    {
      v11 = objc_msgSend(v5, "copy");
      v12 = (void *)v9[4];
      v9[4] = v11;

    }
    objc_sync_exit(v9);

    v13 = (void *)objc_msgSend(v5, "copy");
    v14 = v10 ^ 1;
    v15 = v9[3];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __69__PKRecognitionSessionManager_setDrawing_withVisibleOnscreenStrokes___block_invoke;
    v18[3] = &unk_1E7777B80;
    v18[4] = v9;
    v19 = v13;
    v20 = v8;
    v21 = v14;
    v16 = v8;
    v17 = v13;
    dispatch_async(v15, v18);

  }
}

void __69__PKRecognitionSessionManager_setDrawing_withVisibleOnscreenStrokes___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  if (v3 && *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v3, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:", v5) ^ 1;

    v2 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v6 = 0;
  }
  objc_storeStrong((id *)(v2 + 40), *(id *)(a1 + 40));
  drawingStrokesFromStrokes(*(void **)(a1 + 48), *(void **)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_msgSend(v7, "isEqualToArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104)) & 1) == 0
    && objc_msgSend(*(id *)(a1 + 32), "state") != 3;
  v9 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v9 + 40))
    v10 = v7;
  else
    v10 = 0;
  v11 = *(void **)(v9 + 104);
  *(_QWORD *)(v9 + 104) = v10;

  if (*(_QWORD *)(a1 + 40))
  {
    if (*(_BYTE *)(a1 + 56))
      v12 = 1;
    else
      v12 = v8;
    if (v12 == 1)
    {
      v13 = os_log_create("com.apple.pencilkit", "RecognitionManager");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412290;
        v17 = v14;
        _os_log_impl(&dword_1BE213000, v13, OS_LOG_TYPE_DEFAULT, "Drawing or visible strokes did change: %@", (uint8_t *)&v16, 0xCu);

      }
      -[PKRecognitionSessionManager scheduleSaveRecognitionSession](*(_QWORD *)(a1 + 32));
      if (v6)
      {
        v15 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_1BE213000, v15, OS_LOG_TYPE_DEFAULT, "Drawing UUID changed in setDrawing:withVisibleOnscreenStrokes:", (uint8_t *)&v16, 2u);
        }

      }
      -[PKRecognitionSessionManager q_createRecognitionSessionIfNecessary](*(_QWORD *)(a1 + 32));
      -[PKRecognitionSessionManager q_needRecognitionUpdateWithCancel:](*(void **)(a1 + 32));
    }
  }
  else
  {
    -[PKRecognitionSessionManager q_teardownSession](*(_QWORD *)(a1 + 32));
  }

}

- (void)setVisibleOnscreenStrokes:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = (void *)objc_msgSend(v3, "copy");
    v6 = *(NSObject **)(a1 + 24);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__PKRecognitionSessionManager_setVisibleOnscreenStrokes___block_invoke;
    v8[3] = &unk_1E7777440;
    v8[4] = a1;
    v9 = v5;
    v7 = v5;
    dispatch_async(v6, v8);

  }
}

void __57__PKRecognitionSessionManager_setVisibleOnscreenStrokes___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  char v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  drawingStrokesFromStrokes(*(void **)(a1 + 40), *(void **)(*(_QWORD *)(a1 + 32) + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToArray:", *(_QWORD *)(*(_QWORD *)v2 + 104));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), v3);
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 3)
    v5 = 1;
  else
    v5 = v4;
  if ((v5 & 1) == 0)
  {
    v6 = os_log_create("com.apple.pencilkit", "RecognitionManager");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1BE213000, v6, OS_LOG_TYPE_DEFAULT, "Visible strokes did change: %@", (uint8_t *)&v8, 0xCu);

    }
    -[PKRecognitionSessionManager scheduleSaveRecognitionSession](*(_QWORD *)(a1 + 32));
    -[PKRecognitionSessionManager q_needRecognitionUpdateWithCancel:](*(void **)(a1 + 32));
  }

}

void __53__PKRecognitionSessionManager_setWantsTranscription___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 117) != v2)
  {
    *(_BYTE *)(v1 + 117) = v2;
    v4 = *(unsigned __int8 *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      -[PKRecognitionSessionManager q_createRecognitionSessionIfNecessary](v5);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
      v7 = objc_opt_class();
      if (v6)
        objc_msgSend(*(id *)(v6 + 32), "setObject:forKey:", v7, CFSTR("Transcription"));
      -[PKRecognitionQueryController updateQueriesIfNecessaryWithState:](*(id **)(*(_QWORD *)(a1 + 32) + 120), objc_msgSend(*(id *)(a1 + 32), "state"));
    }
    else
    {
      -[PKRecognitionQueryController removeQueryWithIdentifier:](*(id **)(v5 + 120), CFSTR("Transcription"));
    }
  }
}

- (void)setWantsAutoRefine:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[5];
  char v4;

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 24);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __50__PKRecognitionSessionManager_setWantsAutoRefine___block_invoke;
    v3[3] = &unk_1E7778538;
    v3[4] = a1;
    v4 = a2;
    dispatch_async(v2, v3);
  }
}

void __50__PKRecognitionSessionManager_setWantsAutoRefine___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v4;
  uint64_t v5;
  PKAutoRefineQuery *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint8_t v10[16];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 118) != v2)
  {
    *(_BYTE *)(v1 + 118) = v2;
    v4 = *(unsigned __int8 *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      -[PKRecognitionSessionManager q_createRecognitionSessionIfNecessary](v5);
      if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 136))
      {
        v6 = -[PKAutoRefineQuery initWithRecognitionSessionManager:]([PKAutoRefineQuery alloc], "initWithRecognitionSessionManager:", *(_QWORD *)(a1 + 32));
        v7 = os_log_create("com.apple.pencilkit", "RecognitionManager");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v10 = 0;
          _os_log_debug_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEBUG, "PKAutoRefineQuery created", v10, 2u);
        }

        -[PKQuery setDelegate:](v6, "setDelegate:", *(_QWORD *)(a1 + 32));
        if (v6)
          objc_storeWeak((id *)&v6->_autoRefineDelegate, *(id *)(a1 + 32));
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 136), v6);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "start");

      }
    }
    else
    {
      if (*(_QWORD *)(v5 + 136))
      {
        objc_msgSend(*(id *)(v5 + 136), "pause");
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "teardown");
        v8 = *(_QWORD *)(a1 + 32);
        v9 = *(void **)(v8 + 136);
        *(_QWORD *)(v8 + 136) = 0;

        v5 = *(_QWORD *)(a1 + 32);
      }
      -[PKAutoRefineTaskManager cancelAllTasks](*(void **)(v5 + 144));
    }
  }
}

- (void)setWantsDataDetection:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[5];
  char v4;

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 24);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __53__PKRecognitionSessionManager_setWantsDataDetection___block_invoke;
    v3[3] = &unk_1E7778538;
    v3[4] = a1;
    v4 = a2;
    dispatch_async(v2, v3);
  }
}

void __53__PKRecognitionSessionManager_setWantsDataDetection___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 113) != v2)
  {
    *(_BYTE *)(v1 + 113) = v2;
    v4 = *(unsigned __int8 *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      -[PKRecognitionSessionManager q_createRecognitionSessionIfNecessary](v5);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
      v7 = objc_opt_class();
      if (v6)
        objc_msgSend(*(id *)(v6 + 32), "setObject:forKey:", v7, CFSTR("DataDetectors"));
      -[PKRecognitionQueryController updateQueriesIfNecessaryWithState:](*(id **)(*(_QWORD *)(a1 + 32) + 120), objc_msgSend(*(id *)(a1 + 32), "state"));
    }
    else
    {
      -[PKRecognitionQueryController removeQueryWithIdentifier:](*(id **)(v5 + 120), CFSTR("DataDetectors"));
    }
  }
}

- (void)setWantsHashtagDetection:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[5];
  char v4;

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 24);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __56__PKRecognitionSessionManager_setWantsHashtagDetection___block_invoke;
    v3[3] = &unk_1E7778538;
    v3[4] = a1;
    v4 = a2;
    dispatch_async(v2, v3);
  }
}

void __56__PKRecognitionSessionManager_setWantsHashtagDetection___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 114) != v2)
  {
    *(_BYTE *)(v1 + 114) = v2;
    v4 = *(unsigned __int8 *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      -[PKRecognitionSessionManager q_createRecognitionSessionIfNecessary](v5);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
      v7 = objc_opt_class();
      if (v6)
        objc_msgSend(*(id *)(v6 + 32), "setObject:forKey:", v7, CFSTR("Hashtags"));
      -[PKRecognitionQueryController updateQueriesIfNecessaryWithState:](*(id **)(*(_QWORD *)(a1 + 32) + 120), objc_msgSend(*(id *)(a1 + 32), "state"));
    }
    else
    {
      -[PKRecognitionQueryController removeQueryWithIdentifier:](*(id **)(v5 + 120), CFSTR("Hashtags"));
    }
  }
}

- (void)setWantsMentionDetection:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[5];
  char v4;

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 24);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __56__PKRecognitionSessionManager_setWantsMentionDetection___block_invoke;
    v3[3] = &unk_1E7778538;
    v3[4] = a1;
    v4 = a2;
    dispatch_async(v2, v3);
  }
}

void __56__PKRecognitionSessionManager_setWantsMentionDetection___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 115) != v2)
  {
    *(_BYTE *)(v1 + 115) = v2;
    v4 = *(unsigned __int8 *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      -[PKRecognitionSessionManager q_createRecognitionSessionIfNecessary](v5);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
      v7 = objc_opt_class();
      if (v6)
        objc_msgSend(*(id *)(v6 + 32), "setObject:forKey:", v7, CFSTR("Mentions"));
      -[PKRecognitionQueryController setSuffixes:forQueryWithIdentifier:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120), *(void **)(*(_QWORD *)(a1 + 32) + 200), CFSTR("Mentions"));
      -[PKRecognitionQueryController updateQueriesIfNecessaryWithState:](*(id **)(*(_QWORD *)(a1 + 32) + 120), objc_msgSend(*(id *)(a1 + 32), "state"));
    }
    else
    {
      -[PKRecognitionQueryController removeQueryWithIdentifier:](*(id **)(v5 + 120), CFSTR("Mentions"));
    }
  }
}

- (void)setWantsProofreadingDetection:(uint64_t)a1
{
  BOOL v3;
  NSObject *v4;
  _QWORD v5[5];
  BOOL v6;

  if (a1)
  {
    if (a2)
      v3 = CHGetPersonalizedSynthesisSupportState() > 1;
    else
      v3 = 0;
    v4 = *(NSObject **)(a1 + 24);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __61__PKRecognitionSessionManager_setWantsProofreadingDetection___block_invoke;
    v5[3] = &unk_1E7778538;
    v5[4] = a1;
    v6 = v3;
    dispatch_async(v4, v5);
  }
}

void __61__PKRecognitionSessionManager_setWantsProofreadingDetection___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 116) != v2)
  {
    *(_BYTE *)(v1 + 116) = v2;
    v4 = *(unsigned __int8 *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      -[PKRecognitionSessionManager q_createRecognitionSessionIfNecessary](v5);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
      v7 = objc_opt_class();
      if (v6)
        objc_msgSend(*(id *)(v6 + 32), "setObject:forKey:", v7, CFSTR("Proofreading"));
      -[PKRecognitionQueryController updateQueriesIfNecessaryWithState:](*(id **)(*(_QWORD *)(a1 + 32) + 120), objc_msgSend(*(id *)(a1 + 32), "state"));
    }
    else
    {
      -[PKRecognitionQueryController removeQueryWithIdentifier:](*(id **)(v5 + 120), CFSTR("Proofreading"));
    }
  }
}

void __47__PKRecognitionSessionManager__teardownSession__block_invoke(uint64_t a1)
{
  -[PKRecognitionSessionManager q_teardownSession](*(_QWORD *)(a1 + 32));
}

uint64_t __61__PKRecognitionSessionManager_scheduleSaveRecognitionSession__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void (**v3)(_QWORD);
  void *v4;
  _QWORD aBlock[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__PKRecognitionSessionManager_cancelSaveRecognitionSession__block_invoke;
    aBlock[3] = &unk_1E7776F38;
    aBlock[4] = v1;
    v3 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      v3[2](v3);
    else
      dispatch_async(MEMORY[0x1E0C80D38], v3);

    v4 = *(void **)(a1 + 32);
  }
  else
  {
    v4 = 0;
  }
  return objc_msgSend(v4, "performSelector:withObject:afterDelay:", sel_saveRecognitionSessionIfNecessary, 0, 5.0);
}

uint64_t __59__PKRecognitionSessionManager_cancelSaveRecognitionSession__block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel_saveRecognitionSessionIfNecessary, 0);
}

- (void)saveRecognitionSessionIfNecessary
{
  NSObject *recognitionSessionQueue;
  _QWORD block[5];

  if (self->_shouldLoadAndSaveSession)
  {
    recognitionSessionQueue = self->_recognitionSessionQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__PKRecognitionSessionManager_saveRecognitionSessionIfNecessary__block_invoke;
    block[3] = &unk_1E7776F38;
    block[4] = self;
    dispatch_async(recognitionSessionQueue, block);
  }
}

void __64__PKRecognitionSessionManager_saveRecognitionSessionIfNecessary__block_invoke(uint64_t a1)
{
  -[PKRecognitionSessionManager q_saveRecognitionSessionIfNecessary](*(_QWORD *)(a1 + 32));
}

- (void)q_saveRecognitionSessionIfNecessary
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (objc_msgSend((id)a1, "state") == 3)
    {
      if (*(_BYTE *)(a1 + 8))
      {
        v2 = *(void **)(a1 + 48);
        if (v2)
        {
          objc_msgSend(*(id *)(a1 + 40), "uuid");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = PKSaveRecognitionSession(v2, v3);

          v5 = os_log_create("com.apple.pencilkit", "RecognitionManager");
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 40), "uuid");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "uniqueCacheFilePath");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = 138412546;
            v9 = v7;
            v10 = 1024;
            v11 = v4;
            _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEFAULT, "Save session cache for: %@, success: %{BOOL}d", (uint8_t *)&v8, 0x12u);

          }
        }
      }
    }
  }
}

uint64_t __48__PKRecognitionSessionManager_q_teardownSession__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.pencilkit", "RecognitionManager");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "Delayed removing observer when tearing down.", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "unregisterChangeObserver:", *(_QWORD *)(a1 + 40));
}

- (id)calculateDocumentProviderSnapshot
{
  NSObject *recognitionSessionQueue;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  CHCalculateDocumentProvider *v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__29;
  v16 = __Block_byref_object_dispose__29;
  v17 = 0;
  if (dispatch_queue_get_label(0) == "com.apple.PencilKit.RecognitionManager")
  {
    v17 = self->q_calculateDocumentProvider;
  }
  else
  {
    recognitionSessionQueue = self->_recognitionSessionQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__PKRecognitionSessionManager_calculateDocumentProviderSnapshot__block_invoke;
    v11[3] = &unk_1E7777418;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(recognitionSessionQueue, v11);
  }
  v4 = os_log_create("com.apple.pencilkit", "RecognitionManager");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)v13[5], "recognizedExpressions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    objc_msgSend((id)v13[5], "declaredVariables");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    *(_DWORD *)buf = 134218240;
    v19 = v6;
    v20 = 2048;
    v21 = v8;
    _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Providing  a calculate document provider with %lu expressions and %lu variables.", buf, 0x16u);

  }
  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __64__PKRecognitionSessionManager_calculateDocumentProviderSnapshot__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 80));
}

- (id)directStrokeProviderSnapshot
{
  if (a1)
  {
    objc_msgSend(a1, "strokeProviderSnapshot");
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)strokeProviderSnapshot
{
  void (**v3)(_QWORD);
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__29;
  v11 = __Block_byref_object_dispose__29;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__PKRecognitionSessionManager_strokeProviderSnapshot__block_invoke;
  v6[3] = &unk_1E77795A8;
  v6[4] = self;
  v6[5] = &v7;
  v3 = (void (**)(_QWORD))_Block_copy(v6);
  if (dispatch_queue_get_label(0) == "com.apple.PencilKit.RecognitionManager")
    v3[2](v3);
  else
    dispatch_sync((dispatch_queue_t)self->_recognitionSessionQueue, v3);
  v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __53__PKRecognitionSessionManager_strokeProviderSnapshot__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  _BOOL4 v7;
  PKStrokeProvider *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  id obj;
  uint64_t i;
  void *v29;
  id v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint8_t v46[128];
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  const __CFString *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.pencilkit", "RecognitionManager");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "count");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(v4 + 40);
    if (*(_QWORD *)(v4 + 104))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    *(_DWORD *)buf = 134218498;
    v48 = v3;
    v49 = 2112;
    v50 = v5;
    v51 = 2112;
    v52 = v6;
    _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "Providing  a strokeProviderSnapshot with %lu visible strokes and with drawing: %@.  Processing only visible strokes: %@", buf, 0x20u);
  }

  -[PKRecognitionSessionManager q_updateRecognitionStateWithFinishedResult:](*(_QWORD *)(a1 + 32), 0);
  v7 = objc_msgSend(*(id *)(a1 + 32), "state") == 3 || objc_msgSend(*(id *)(a1 + 32), "state") == 2;
  v8 = -[PKStrokeProvider initWithDrawing:visibleOnscreenStrokes:shouldProcessVisibleStrokes:transcriptionCache:]([PKStrokeProvider alloc], "initWithDrawing:visibleOnscreenStrokes:shouldProcessVisibleStrokes:transcriptionCache:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104), !v7, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "allCachedGroups");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "count"))
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v29;
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v25)
    {
      v24 = 0;
      v26 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v41 != v26)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          v30 = v11;
          v13 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
          if (v13)
          {
            v31 = *(_QWORD *)v37;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v37 != v31)
                  objc_enumerationMutation(v30);
                v15 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
                v32 = 0u;
                v33 = 0u;
                v34 = 0u;
                v35 = 0u;
                objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "orderedStrokes");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
                if (v17)
                {
                  v18 = *(_QWORD *)v33;
                  do
                  {
                    for (k = 0; k != v17; ++k)
                    {
                      if (*(_QWORD *)v33 != v18)
                        objc_enumerationMutation(v16);
                      v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * k);
                      if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isStroke:versionOfStrokeWithIdentifier:", v20, v15))
                      {
                        objc_msgSend(v20, "strokeIdentifier");
                        v21 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v12, "addObject:", v21);

                      }
                    }
                    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
                  }
                  while (v17);
                }

              }
              v13 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
            }
            while (v13);
          }

          v22 = objc_msgSend(v12, "count");
          if (v22 == objc_msgSend(v30, "count"))
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "cachedTranscriptionForStrokeGroup:", v30);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "addCachedTranscription:forStrokeGroup:", v23, v12);

            v24 = 1;
          }
          if (objc_msgSend(v12, "count"))
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "clearCacheForStrokeGroup:", v30);

        }
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v25);

      if ((v24 & 1) != 0)
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "updateTranscriptionCache:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
    }
    else
    {

    }
  }

}

- (void)q_updateRecognitionStateWithFinishedResult:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  if (objc_msgSend((id)a1, "state") == 3)
    goto LABEL_3;
  if (objc_msgSend((id)a1, "state") || !*(_QWORD *)(a1 + 104))
  {
    if (objc_msgSend((id)a1, "state") == 1 || !*(_QWORD *)(a1 + 104))
    {
      if (objc_msgSend((id)a1, "state") != 1
        || (v12 = *(void **)(a1 + 104),
            objc_msgSend(*(id *)(a1 + 40), "strokes"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            LODWORD(v12) = objc_msgSend(v12, "isEqualToArray:", v13),
            v13,
            !(_DWORD)v12))
      {
        objc_msgSend((id)a1, "setState:", 2);
        v15 = os_log_create("com.apple.pencilkit", "RecognitionManager");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = *(void **)(a1 + 40);
          objc_msgSend(v16, "strokes");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v29 = (uint64_t)v16;
          v30 = 2048;
          v31 = objc_msgSend(v17, "count");
          v32 = 2112;
          v33 = a1;
          _os_log_impl(&dword_1BE213000, v15, OS_LOG_TYPE_DEFAULT, "State Update: Starting to process a stroke provider with the full drawing %@ with %lu strokes with manager %@", buf, 0x20u);

        }
        goto LABEL_27;
      }
      v14 = os_log_create("com.apple.pencilkit", "RecognitionManager");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE213000, v14, OS_LOG_TYPE_DEFAULT, "Visible onscreen strokes are equal to those in the drawing, skip reprocessing", buf, 2u);
      }

    }
    else if (objc_msgSend((id)a1, "state") != 2 || (a2 & 1) == 0)
    {
      objc_msgSend((id)a1, "setState:", 0);
      goto LABEL_25;
    }
LABEL_3:
    objc_msgSend((id)a1, "setState:", 3);
    objc_msgSend(*(id *)(a1 + 72), "timeIntervalSinceNow");
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 72);
    *(_QWORD *)(a1 + 72) = v6;

    v8 = os_log_create("com.apple.pencilkit", "RecognitionManager");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 40);
      objc_msgSend(v9, "strokes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");
      *(_DWORD *)buf = 138413058;
      v29 = (uint64_t)v9;
      v30 = 2048;
      v31 = v11;
      v32 = 2112;
      v33 = a1;
      v34 = 2048;
      v35 = v5;
      _os_log_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEFAULT, "State Update: Finished processing drawing %@ with %lu strokes with manager %@ in %.2fs", buf, 0x2Au);

    }
    -[PKRecognitionQueryController setupDrawingQueriesIfNecessary](*(id **)(a1 + 120));
    -[PKRecognitionQueryController clearVisibleStrokesQueries](*(_QWORD *)(a1 + 120));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__PKRecognitionSessionManager_q_updateRecognitionStateWithFinishedResult___block_invoke;
    block[3] = &unk_1E7776F38;
    block[4] = a1;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    return;
  }
  objc_msgSend((id)a1, "setState:", a2);
  if ((a2 & 1) == 0)
  {
LABEL_25:
    v15 = os_log_create("com.apple.pencilkit", "RecognitionManager");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_msgSend(*(id *)(a1 + 104), "count");
      *(_DWORD *)buf = 134218242;
      v29 = v24;
      v30 = 2112;
      v31 = a1;
      _os_log_impl(&dword_1BE213000, v15, OS_LOG_TYPE_DEFAULT, "State Update: Starting to process a stroke provider with just %lu visible strokes with manager: %@", buf, 0x16u);
    }
LABEL_27:

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = *(void **)(a1 + 72);
    *(_QWORD *)(a1 + 72) = v25;

    return;
  }
  objc_msgSend(*(id *)(a1 + 72), "timeIntervalSinceNow");
  v19 = v18;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = *(void **)(a1 + 72);
  *(_QWORD *)(a1 + 72) = v20;

  v22 = os_log_create("com.apple.pencilkit", "RecognitionManager");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = objc_msgSend(*(id *)(a1 + 104), "count");
    *(_DWORD *)buf = 134218498;
    v29 = v23;
    v30 = 2112;
    v31 = a1;
    v32 = 2048;
    v33 = v19;
    _os_log_impl(&dword_1BE213000, v22, OS_LOG_TYPE_DEFAULT, "State Update: Finished processing %lu visible strokes with manager: %@ in %.2fs", buf, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 48), "setNeedsRecognitionUpdate");
}

void __74__PKRecognitionSessionManager_q_updateRecognitionStateWithFinishedResult___block_invoke(uint64_t a1)
{
  -[PKRecognitionSessionManager scheduleSaveRecognitionSession](*(_QWORD *)(a1 + 32));
}

- (void)textInputDidChange:(id)a3
{
  void *v3;
  id v4;

  -[PKRecognitionSessionManager session](self);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "enabledLocales");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreferredLocales:", v3);

}

- (void)setAutoRefineViewDelegate:(uint64_t)a1
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v6 = v3;
    objc_storeWeak((id *)(a1 + 192), v3);
    v3 = v6;
    if (*(_QWORD *)(a1 + 144))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 192));
      v5 = *(_QWORD *)(a1 + 144);
      if (v5)
        objc_storeWeak((id *)(v5 + 32), WeakRetained);

      v3 = v6;
    }
  }

}

- (void)setMentionSuffixes:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  if (a1 && (objc_msgSend(*(id *)(a1 + 200), "isEqual:", v3) & 1) == 0)
  {
    v4 = (void *)objc_msgSend(v3, "copy");
    objc_storeStrong((id *)(a1 + 200), v4);
    v5 = *(NSObject **)(a1 + 24);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50__PKRecognitionSessionManager_setMentionSuffixes___block_invoke;
    v7[3] = &unk_1E7777440;
    v7[4] = a1;
    v8 = v4;
    v6 = v4;
    dispatch_async(v5, v7);

  }
}

void __50__PKRecognitionSessionManager_setMentionSuffixes___block_invoke(uint64_t a1)
{
  -[PKRecognitionQueryController setSuffixes:forQueryWithIdentifier:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120), *(void **)(a1 + 40), CFSTR("Mentions"));
}

- (void)setupForMath
{
  NSObject *v1;
  _QWORD block[5];

  if (a1)
  {
    v1 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__PKRecognitionSessionManager_setupForMath__block_invoke;
    block[3] = &unk_1E7776F38;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

void __43__PKRecognitionSessionManager_setupForMath__block_invoke(uint64_t a1, const char *a2)
{
  -[PKRecognitionQueryController setupForMath](*(_BYTE **)(*(_QWORD *)(a1 + 32) + 120), a2);
}

- (void)fetchCurrentStrokeGroupItems:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 24);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__PKRecognitionSessionManager_fetchCurrentStrokeGroupItems___block_invoke;
    v6[3] = &unk_1E7777B08;
    v6[4] = a1;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

void __60__PKRecognitionSessionManager_fetchCurrentStrokeGroupItems___block_invoke(uint64_t a1)
{
  id v2;

  -[PKRecognitionSessionManager q_groupQuery](*(void **)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchCurrentStrokeGroupItems:", *(_QWORD *)(a1 + 40));

}

- (id)q_groupQuery
{
  void *v1;
  uint64_t v2;
  id *v3;

  if (a1)
  {
    v1 = a1;
    v2 = objc_msgSend(a1, "state");
    v3 = (id *)*((_QWORD *)v1 + 15);
    if (v2 == 3)
      -[PKRecognitionQueryController drawingQueryWithIdentifier:](v3, (uint64_t)CFSTR("SmartSelection"));
    else
      -[PKRecognitionQueryController visibleStrokesQueryWithIdentifier:](v3, (uint64_t)CFSTR("SmartSelection"));
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)recognitionSessionDidUpdateRecognitionResult:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *recognitionSessionQueue;
  _QWORD v7[4];
  id v8;
  PKRecognitionSessionManager *v9;
  uint8_t buf[16];

  v4 = a3;
  if (!self->_isTearingDown)
  {
    v5 = os_log_create("com.apple.pencilkit", "RecognitionManager");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEFAULT, "State Update: PKRecognitionSessionManager recognitionSessionDidUpdateRecognitionResult", buf, 2u);
    }

    recognitionSessionQueue = self->_recognitionSessionQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __76__PKRecognitionSessionManager_recognitionSessionDidUpdateRecognitionResult___block_invoke;
    v7[3] = &unk_1E7777440;
    v8 = v4;
    v9 = self;
    dispatch_async(recognitionSessionQueue, v7);

  }
}

void __76__PKRecognitionSessionManager_recognitionSessionDidUpdateRecognitionResult___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  if (v2 == *(_QWORD *)(v1 + 48))
    -[PKRecognitionSessionManager q_updateRecognitionStateWithFinishedResult:](v1, 1u);
}

void __41__PKRecognitionSessionManager_groupQuery__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  -[PKRecognitionSessionManager q_groupQuery](*(void **)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)fetchIntersectedStrokesAtPoint:(uint64_t)a3 selectionType:(void *)a4 inputType:(void *)a5 visibleOnscreenStrokes:(double)a6 completion:(double)a7
{
  id v13;
  id v14;
  NSObject *v15;
  _QWORD block[5];
  id v17;
  id v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;

  v13 = a4;
  v14 = a5;
  if (a1)
  {
    v15 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __120__PKRecognitionSessionManager_fetchIntersectedStrokesAtPoint_selectionType_inputType_visibleOnscreenStrokes_completion___block_invoke;
    block[3] = &unk_1E777CD18;
    block[4] = a1;
    v19 = a6;
    v20 = a7;
    v21 = a2;
    v22 = a3;
    v17 = v13;
    v18 = v14;
    dispatch_async(v15, block);

  }
}

void __120__PKRecognitionSessionManager_fetchIntersectedStrokesAtPoint_selectionType_inputType_visibleOnscreenStrokes_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD block[4];
  id v5;

  -[PKRecognitionSessionManager q_groupQuery](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    -[PKRecognitionSessionManager q_groupQuery](*(void **)(a1 + 32));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "q_fetchStrokesForPoint:selectionType:inputType:visibleOnscreenStrokes:completion:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __120__PKRecognitionSessionManager_fetchIntersectedStrokesAtPoint_selectionType_inputType_visibleOnscreenStrokes_completion___block_invoke_2;
    block[3] = &unk_1E7776F60;
    v5 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __120__PKRecognitionSessionManager_fetchIntersectedStrokesAtPoint_selectionType_inputType_visibleOnscreenStrokes_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchIntersectedStrokesBetweenTopPoint:(void *)a3 bottomPoint:(double)a4 liveScrollOffset:(double)a5 isRTL:(double)a6 completion:(double)a7
{
  id v17;
  NSObject *v18;
  _QWORD block[5];
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  char v25;

  v17 = a3;
  if (a1)
  {
    if ((a8 == 0.0 && a9 == 0.0 || objc_msgSend(a1, "state") == 3) && objc_msgSend(a1, "state") > 1)
    {
      v18 = a1[3];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __116__PKRecognitionSessionManager_fetchIntersectedStrokesBetweenTopPoint_bottomPoint_liveScrollOffset_isRTL_completion___block_invoke;
      block[3] = &unk_1E777CD40;
      block[4] = a1;
      v21 = a4;
      v22 = a5;
      v23 = a6;
      v24 = a7;
      v25 = a2;
      v20 = v17;
      dispatch_async(v18, block);

    }
    else
    {
      (*((void (**)(id, _QWORD))v17 + 2))(v17, 0);
    }
  }

}

void __116__PKRecognitionSessionManager_fetchIntersectedStrokesBetweenTopPoint_bottomPoint_liveScrollOffset_isRTL_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD block[4];
  id v5;

  -[PKRecognitionSessionManager q_groupQuery](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    -[PKRecognitionSessionManager q_groupQuery](*(void **)(a1 + 32));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "q_fetchStrokesBetweenTopPoint:bottomPoint:isRTL:completion:", *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __116__PKRecognitionSessionManager_fetchIntersectedStrokesBetweenTopPoint_bottomPoint_liveScrollOffset_isRTL_completion___block_invoke_2;
    block[3] = &unk_1E7776F60;
    v5 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __116__PKRecognitionSessionManager_fetchIntersectedStrokesBetweenTopPoint_bottomPoint_liveScrollOffset_isRTL_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_firstStrokesInSelectedStrokes:(uint64_t)a3 isRTL:
{
  id v5;
  void *v6;
  void *v7;

  v5 = a2;
  if (a1 && objc_msgSend(a1, "state") == 3)
  {
    -[PKRecognitionSessionManager groupQuery]((uint64_t)a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstStrokesInStrokes:isRTL:", v5, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_lastStrokesInSelectedStrokes:(uint64_t)a3 isRTL:
{
  id v5;
  void *v6;
  void *v7;

  v5 = a2;
  if (a1 && objc_msgSend(a1, "state") == 3)
  {
    -[PKRecognitionSessionManager groupQuery]((uint64_t)a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastStrokesInStrokes:isRTL:", v5, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes:(void *)a3 completion:
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (objc_msgSend(a1, "state") == 3)
    {
      v7 = a1[3];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __107__PKRecognitionSessionManager_fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes_completion___block_invoke;
      block[3] = &unk_1E77773F0;
      block[4] = a1;
      v9 = v5;
      v10 = v6;
      dispatch_async(v7, block);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
    }
  }

}

void __107__PKRecognitionSessionManager_fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  -[PKRecognitionSessionManager q_groupQuery](*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    -[PKRecognitionSessionManager q_groupQuery](*(void **)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __107__PKRecognitionSessionManager_fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes_completion___block_invoke_2;
    v8[3] = &unk_1E777CD68;
    v4 = *(_QWORD *)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v3, "q_fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes:completion:", v4, v8);
    v5 = &v9;

  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __107__PKRecognitionSessionManager_fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes_completion___block_invoke_4;
    v6[3] = &unk_1E7776F60;
    v5 = &v7;
    v7 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], v6);
  }

}

void __107__PKRecognitionSessionManager_fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__PKRecognitionSessionManager_fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes_completion___block_invoke_3;
  block[3] = &unk_1E7778418;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __107__PKRecognitionSessionManager_fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __107__PKRecognitionSessionManager_fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (uint64_t)contentTypeForIntersectedStrokes:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (a1)
  {
    -[PKRecognitionSessionManager groupQuery](a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "contentTypeForIntersectedStrokes:", v3);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)updateWithRefinableStroke:(uint64_t)a1
{
  void *v3;
  id v4;

  v4 = a2;
  if (a1)
  {
    v3 = *(void **)(a1 + 144);
    if (v3)
      -[PKAutoRefineTaskManager cancelTasksGivenRefinableStroke:](v3, v4);
  }

}

- (CGAffineTransform)_affineTransformFromBounds:(double)a3 targetHeight:(double)a4 targetPoint:(double)a5
{
  CGAffineTransform *result;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v26;
  CGAffineTransform v27;

  result = (CGAffineTransform *)CGRectIsEmpty(*(CGRect *)&a2);
  if ((_DWORD)result)
  {
    v16 = MEMORY[0x1E0C9BAA8];
    v17 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&a1->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&a1->c = v17;
    v18 = *(_OWORD *)(v16 + 32);
  }
  else
  {
    *(_OWORD *)&a1->c = 0u;
    *(_OWORD *)&a1->tx = 0u;
    *(_OWORD *)&a1->a = 0u;
    CGAffineTransformMakeTranslation(a1, a7, a8);
    memset(&v27, 0, sizeof(v27));
    CGAffineTransformMakeTranslation(&v27, -a2, -a3);
    t1 = v27;
    CGAffineTransformMakeScale(&t2, a6 / a5, a6 / a5);
    CGAffineTransformConcat(&v26, &t1, &t2);
    v27 = v26;
    v23 = v26;
    v19 = *(_OWORD *)&a1->a;
    v20 = *(_OWORD *)&a1->tx;
    *(_OWORD *)&v22.c = *(_OWORD *)&a1->c;
    *(_OWORD *)&v22.tx = v20;
    *(_OWORD *)&v22.a = v19;
    result = CGAffineTransformConcat(&v26, &v23, &v22);
    v21 = *(_OWORD *)&v26.c;
    *(_OWORD *)&a1->a = *(_OWORD *)&v26.a;
    *(_OWORD *)&a1->c = v21;
    v18 = *(_OWORD *)&v26.tx;
  }
  *(_OWORD *)&a1->tx = v18;
  return result;
}

- (void)synthesizeDrawingForText:(void *)a3 sourceDrawing:(void *)a4 originalBounds:(double)a5 fitInBounds:(double)a6 inputScale:(double)a7 completion:(double)a8
{
  id v27;
  id v28;
  id v29;
  NSObject *v30;
  _QWORD block[5];
  id v33;
  id v34;
  id v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;

  v27 = a2;
  v28 = a3;
  v29 = a4;
  if (a1)
  {
    v30 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __119__PKRecognitionSessionManager_synthesizeDrawingForText_sourceDrawing_originalBounds_fitInBounds_inputScale_completion___block_invoke;
    block[3] = &unk_1E777CD90;
    v36 = a5;
    v37 = a6;
    v38 = a7;
    v39 = a8;
    block[4] = a1;
    v33 = v27;
    v34 = v28;
    v40 = a9;
    v41 = a10;
    v42 = a11;
    v43 = a12;
    v44 = a17;
    v35 = v29;
    dispatch_async(v30, block);

  }
}

void __119__PKRecognitionSessionManager_synthesizeDrawingForText_sourceDrawing_originalBounds_fitInBounds_inputScale_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  id v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double MidX;
  double MidY;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  CGFloat v51;
  double MinX;
  double v53;
  double MaxX;
  CGFloat v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  double v60;
  id v61;
  CGFloat v62;
  CGFloat v63;
  void *v64;
  CGFloat v65;
  CGFloat v66;
  _QWORD block[4];
  id v68;
  id v69;
  id v70;
  id v71;
  CGAffineTransform v72;
  CGAffineTransform v73;
  CGAffineTransform v74;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v77;
  CGAffineTransform v78;
  CGAffineTransform v79;
  CGAffineTransform v80;
  _QWORD v81[2];
  _QWORD v82[4];
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;

  v82[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D167D8];
  v82[0] = MEMORY[0x1E0C9AAB0];
  v3 = *MEMORY[0x1E0D167E0];
  v81[0] = v2;
  v81[1] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 88));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 2);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v71 = 0;
  objc_msgSend(v6, "synthesizeDrawingForString:options:shouldCancel:error:", v5, v64, &__block_literal_global_76, &v71);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v71;
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "drawing");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 48);
  v11 = *(double *)(a1 + 64);
  v12 = *(double *)(a1 + 72);
  v62 = *(double *)(a1 + 88);
  v63 = *(double *)(a1 + 80);
  v13 = *(double *)(a1 + 112);
  v65 = *(double *)(a1 + 104);
  v66 = *(double *)(a1 + 96);
  v14 = *(double *)(a1 + 120);
  v15 = *(double *)(a1 + 128);
  v16 = v9;
  v17 = v10;
  if (v8)
  {
    memset(&v80, 0, sizeof(v80));
    objc_msgSend(v16, "bounds");
    -[PKRecognitionSessionManager _affineTransformFromBounds:targetHeight:targetPoint:](&v80, v18, v19, v20, v21, v14, *MEMORY[0x1E0C9D538], *(CGFloat *)(MEMORY[0x1E0C9D538] + 8));
    v79 = v80;
    objc_msgSend(v17, "strokes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v17, "strokeClass");
    objc_msgSend(v17, "strokes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "ink");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKStroke _createStrokesFromCHDrawing:transform:inputScale:sourceStrokes:strokeClass:newInk:suggestedHeight:shouldSetSynthesizedFlag:](PKStroke, "_createStrokesFromCHDrawing:transform:inputScale:sourceStrokes:strokeClass:newInk:suggestedHeight:shouldSetSynthesizedFlag:", v16, &v79, v22, v23, v26, 1, v15, -1.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStrokes:fromDrawing:", v27, v17);
    objc_msgSend(v28, "bounds");
    -[PKRecognitionSessionManager _affineTransformFromBounds:targetHeight:targetPoint:](&v78, v29, v30, v31, v32, v14, v66, v65);
    v80 = v78;
    objc_msgSend(v28, "drawingByApplyingTransform:transformInk:", &v78, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "bounds");
    v38 = v34;
    v39 = v35;
    v40 = v36;
    v41 = v37;
    if (v36 <= v13)
    {
      v44 = v33;
    }
    else
    {
      v60 = v12;
      MidX = CGRectGetMidX(*(CGRect *)&v34);
      v83.origin.x = v38;
      v83.origin.y = v39;
      v83.size.width = v40;
      v83.size.height = v41;
      MidY = CGRectGetMidY(v83);
      CGAffineTransformMakeTranslation(&v77, -MidX, -MidY);
      v80 = v77;
      t1 = v77;
      CGAffineTransformMakeScale(&t2, v13 / v40, v13 / v40);
      CGAffineTransformConcat(&v77, &t1, &t2);
      v80 = v77;
      v74 = v77;
      CGAffineTransformMakeTranslation(&v73, MidX, MidY);
      CGAffineTransformConcat(&v77, &v74, &v73);
      v80 = v77;
      objc_msgSend(v33, "drawingByApplyingTransform:transformInk:", &v77, 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v60;
      objc_msgSend(v44, "bounds");
      v38 = v45;
      v39 = v46;
      v40 = v47;
      v41 = v48;
    }
    v84.origin.x = v11;
    v84.origin.y = v12;
    v84.size.height = v62;
    v84.size.width = v63;
    v49 = CGRectGetMidX(v84);
    v85.origin.x = v38;
    v85.origin.y = v39;
    v85.size.width = v40;
    v85.size.height = v41;
    v50 = v49 - CGRectGetMidX(v85);
    v51 = v38 + v50;
    v86.origin.x = v51;
    v86.origin.y = v39;
    v86.size.width = v40;
    v86.size.height = v41;
    MinX = CGRectGetMinX(v86);
    v87.origin.y = v65;
    v87.origin.x = v66;
    v87.size.width = v13;
    v87.size.height = v14;
    v53 = fmin(MinX - CGRectGetMinX(v87), 0.0);
    v88.origin.x = v51 - v53;
    v88.origin.y = v39;
    v88.size.width = v40;
    v88.size.height = v41;
    MaxX = CGRectGetMaxX(v88);
    v89.origin.y = v65;
    v89.origin.x = v66;
    v89.size.width = v13;
    v89.size.height = v14;
    v55 = CGRectGetMaxX(v89);
    CGAffineTransformMakeTranslation(&v72, v50 - v53 - fmax(MaxX - v55, 0.0), 0.0);
    objc_msgSend(v44, "drawingByApplyingTransform:", &v72);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v56 = 0;
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __119__PKRecognitionSessionManager_synthesizeDrawingForText_sourceDrawing_originalBounds_fitInBounds_inputScale_completion___block_invoke_3;
  block[3] = &unk_1E7778418;
  v57 = *(id *)(a1 + 56);
  v69 = v7;
  v70 = v57;
  v68 = v56;
  v58 = v7;
  v59 = v56;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __119__PKRecognitionSessionManager_synthesizeDrawingForText_sourceDrawing_originalBounds_fitInBounds_inputScale_completion___block_invoke_2()
{
  return 0;
}

void __119__PKRecognitionSessionManager_synthesizeDrawingForText_sourceDrawing_originalBounds_fitInBounds_inputScale_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "segmentContents");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "segmentStrokeIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id, void *))(v3 + 16))(v3, v2, v5, v4);

}

- (void)synthesizeDrawingForMathResultBlock:(void *)a3 fallbackText:(void *)a4 drawing:(void *)a5 mathItem:(void *)a6 inkColor:(void *)a7 inputScale:(double)a8 completion:
{
  id v15;
  id v16;
  void *v17;
  void *v18;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  NSObject *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  unint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  _QWORD block[4];
  id v53;
  uint64_t v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  double v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t buf[16];
  _BYTE v70[128];
  uint64_t v71;
  CGRect v72;

  v71 = *MEMORY[0x1E0C80C00];
  v49 = a2;
  v50 = a3;
  v15 = a4;
  v16 = a5;
  v48 = a6;
  v51 = a7;
  if (a1)
  {
    v17 = (void *)objc_msgSend(v15, "copy");

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "symbolStrokes");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "boundsForTriggerStrokes");
    x = v72.origin.x;
    y = v72.origin.y;
    width = v72.size.width;
    height = v72.size.height;
    if (CGRectIsNull(v72))
    {
      v23 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BE213000, v23, OS_LOG_TYPE_ERROR, "No trigger bounds for drawing. Falling back to full bounds", buf, 2u);
      }

      objc_msgSend(v17, "bounds");
      x = v24;
      y = v25;
      width = v26;
      height = v27;
    }
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v28 = v47;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v66;
      v31 = 0.0;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v66 != v30)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
          objc_msgSend(v18, "addObject:", v33);
          objc_msgSend(v33, "ink");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "color");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "alphaComponent");
          v37 = v36;

          v31 = v31 + v37;
        }
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
      }
      while (v29);
    }
    else
    {
      v31 = 0.0;
    }

    if (objc_msgSend(v18, "count"))
    {
      v38 = objc_msgSend(v18, "count");
      objc_msgSend(v18, "firstObject");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "colorWithAlphaComponent:", v31 / (double)v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "ink");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKInk inkFromInk:color:](PKInk, "inkFromInk:color:", v41, v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v42 = 0;
    }
    v43 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStrokes:fromDrawing:", v18, v17);
    v44 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __128__PKRecognitionSessionManager_synthesizeDrawingForMathResultBlock_fallbackText_drawing_mathItem_inkColor_inputScale_completion___block_invoke;
    block[3] = &unk_1E777CDD8;
    v53 = v16;
    v54 = a1;
    v58 = v49;
    v55 = v50;
    v56 = v43;
    v60 = x;
    v61 = y;
    v62 = width;
    v63 = height;
    v57 = v42;
    v64 = a8;
    v59 = v51;
    v45 = v42;
    v46 = v43;
    dispatch_async(v44, block);

  }
  else
  {
    v17 = v15;
  }

}

void __128__PKRecognitionSessionManager_synthesizeDrawingForMathResultBlock_fallbackText_drawing_mathItem_inkColor_inputScale_completion___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  id v26;
  id v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat MaxY;
  CGFloat MaxX;
  CGAffineTransform *v46;
  CGAffineTransform *v47;
  double v48;
  CGFloat v49;
  CGFloat MidY;
  CGFloat v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  double v61;
  double v62;
  double v63;
  _QWORD block[4];
  id v65;
  id v66;
  id v67;
  id v68;
  CGAffineTransform v69;
  CGAffineTransform v70;
  CGAffineTransform v71;
  CGAffineTransform v72;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v75;
  CGAffineTransform v76;
  CGAffineTransform v77;
  _QWORD v78[2];
  _QWORD v79[4];
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;

  v79[2] = *MEMORY[0x1E0C80C00];
  v2 = -[PKMathRecognitionItem suggestedHeightForResult](*(_QWORD *)(a1 + 32));
  v78[0] = *MEMORY[0x1E0D167E0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v78[1] = *MEMORY[0x1E0D167D8];
  v79[0] = v3;
  v79[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v78, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "isVerticalExpression")
    && (v5 = -[PKMathRecognitionItem suggestedDistanceBetweenDigits](*(void **)(a1 + 32)), v5 > 0.0))
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D167D0]);

    v8 = (void *)objc_msgSend(v6, "copy");
  }
  else
  {
    v8 = v4;
  }
  v9 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
  v10 = *(_QWORD *)(a1 + 72);
  v68 = 0;
  objc_msgSend(v9, "synthesizeExpressionEvaluationResultWithBlock:options:shouldCancel:error:", v10, v8, &__block_literal_global_135, &v68);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v68;
  if (!v11)
  {
    v13 = *(_QWORD *)(a1 + 48);
    v14 = *(void **)(*(_QWORD *)(a1 + 40) + 64);
    v67 = v12;
    objc_msgSend(v14, "synthesizeDrawingForString:options:shouldCancel:error:", v13, v8, &__block_literal_global_136, &v67);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v67;

    v12 = v15;
  }
  v16 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v11, "drawing");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(double *)(a1 + 88);
  v19 = *(double *)(a1 + 96);
  v20 = *(double *)(a1 + 104);
  v21 = *(double *)(a1 + 112);
  v22 = *(void **)(a1 + 56);
  v23 = *(void **)(a1 + 64);
  v63 = *(double *)(a1 + 120);
  v24 = objc_msgSend(*(id *)(a1 + 32), "isVerticalExpression");
  v25 = v17;
  v26 = v22;
  v27 = v23;
  if (v16)
  {
    v28 = v2 + 4.0;
    v29 = (v2 + 4.0) * 8.0 / -30.0;
    if (v24)
      v30 = 0.0;
    else
      v30 = (v2 + 4.0) * 8.0 / -30.0;
    if (v24)
      v31 = v29;
    else
      v31 = 0.0;
    v80.origin.x = v18;
    v80.origin.y = v19;
    v80.size.width = v20;
    v80.size.height = v21;
    v81 = CGRectInset(v80, v30, v31);
    x = v81.origin.x;
    y = v81.origin.y;
    width = v81.size.width;
    height = v81.size.height;
    objc_msgSend(v26, "bounds");
    v83 = CGRectInset(v82, v30, v31);
    v59 = v83.origin.y;
    v60 = v83.origin.x;
    v57 = v83.size.height;
    v58 = v83.size.width;
    objc_msgSend(v25, "bounds");
    v37 = v36;
    objc_msgSend(v25, "bounds");
    v61 = v40;
    v62 = v41;
    v42 = v28 / v37;
    if (v24)
    {
      v43 = v38;
      v84.origin.x = x;
      v84.origin.y = y;
      v84.size.width = width;
      v84.size.height = height;
      MaxY = CGRectGetMaxY(v84);
      v85.origin.y = v59;
      v85.origin.x = v60;
      v85.size.height = v57;
      v85.size.width = v58;
      MaxX = CGRectGetMaxX(v85);
      memset(&v77, 0, sizeof(v77));
      CGAffineTransformMakeTranslation(&v77, MaxX - v43 * v42, MaxY);
      memset(&v76, 0, sizeof(v76));
      CGAffineTransformMakeTranslation(&v76, -v61, -v62);
      t1 = v76;
      CGAffineTransformMakeScale(&t2, v42, v42);
      CGAffineTransformConcat(&v75, &t1, &t2);
      v76 = v75;
      v72 = v75;
      v71 = v77;
      v46 = &v72;
      v47 = &v71;
    }
    else
    {
      v48 = v39;
      v86.origin.x = x;
      v86.origin.y = y;
      v86.size.width = width;
      v86.size.height = height;
      v49 = CGRectGetMaxX(v86);
      v87.origin.x = x;
      v87.origin.y = y;
      v87.size.width = width;
      v87.size.height = height;
      MidY = CGRectGetMidY(v87);
      v51 = v48 * 0.5;
      memset(&v77, 0, sizeof(v77));
      CGAffineTransformMakeTranslation(&v77, v49, MidY - v51);
      memset(&v76, 0, sizeof(v76));
      CGAffineTransformMakeTranslation(&v76, -v61, -v62 - v51);
      t1 = v76;
      CGAffineTransformMakeScale(&t2, v42, v42);
      CGAffineTransformConcat(&v75, &t1, &t2);
      v76 = v75;
      v72 = v75;
      CGAffineTransformMakeTranslation(&v71, 0.0, v51);
      CGAffineTransformConcat(&v75, &v72, &v71);
      v76 = v75;
      v70 = v75;
      v69 = v77;
      v46 = &v70;
      v47 = &v69;
    }
    CGAffineTransformConcat(&v75, v46, v47);
    v77 = v75;
    v76 = v75;
    objc_msgSend(v26, "strokes");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKStroke _createStrokesFromCHDrawing:transform:inputScale:sourceStrokes:strokeClass:newInk:suggestedHeight:shouldSetSynthesizedFlag:](PKStroke, "_createStrokesFromCHDrawing:transform:inputScale:sourceStrokes:strokeClass:newInk:suggestedHeight:shouldSetSynthesizedFlag:", v25, &v76, v52, objc_msgSend(v26, "strokeClass"), v27, 1, v63, -1.0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStrokes:fromDrawing:", v53, v26);
  }
  else
  {
    v54 = 0;
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __128__PKRecognitionSessionManager_synthesizeDrawingForMathResultBlock_fallbackText_drawing_mathItem_inkColor_inputScale_completion___block_invoke_4;
  block[3] = &unk_1E7776F88;
  v55 = *(id *)(a1 + 80);
  v65 = v54;
  v66 = v55;
  v56 = v54;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __128__PKRecognitionSessionManager_synthesizeDrawingForMathResultBlock_fallbackText_drawing_mathItem_inkColor_inputScale_completion___block_invoke_2()
{
  return 0;
}

uint64_t __128__PKRecognitionSessionManager_synthesizeDrawingForMathResultBlock_fallbackText_drawing_mathItem_inkColor_inputScale_completion___block_invoke_3()
{
  return 0;
}

uint64_t __128__PKRecognitionSessionManager_synthesizeDrawingForMathResultBlock_fallbackText_drawing_mathItem_inkColor_inputScale_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (BOOL)canSynthesizeDrawingForText:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;

  v3 = a2;
  if (a1 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 64), "supportedCharacterIndexesForString:options:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "length");
    v6 = objc_msgSend(v4, "count");
    v7 = 1.0 - (double)(unint64_t)(v5 - v6) / (double)(unint64_t)objc_msgSend(v3, "length") >= 0.65;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)synthesizeDrawingForText:(void *)a3 drawing:(double)a4 inkColor:(double)a5 inputScale:(double)a6 suggestedHeight:(double)a7 bounds:(double)a8 progress:(double)a9 completion:(uint64_t)a10
{
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  NSObject *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35[7];
  id location;

  v22 = a2;
  v23 = a3;
  v24 = a11;
  v25 = a12;
  if (a1)
  {
    v26 = (void *)objc_msgSend(v23, "copy");
    objc_initWeak(&location, a1);
    v27 = a1[3];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __127__PKRecognitionSessionManager_synthesizeDrawingForText_drawing_inkColor_inputScale_suggestedHeight_bounds_progress_completion___block_invoke;
    v30[3] = &unk_1E777CE48;
    objc_copyWeak(v35, &location);
    v28 = v22;
    v35[1] = *(id *)&a6;
    v35[2] = *(id *)&a7;
    v35[3] = *(id *)&a8;
    v35[4] = *(id *)&a9;
    v35[5] = *(id *)&a4;
    v35[6] = *(id *)&a5;
    v31 = v28;
    v32 = v26;
    v33 = v25;
    v34 = v24;
    v29 = v26;
    dispatch_async(v27, v30);

    objc_destroyWeak(v35);
    objc_destroyWeak(&location);
  }

}

void __127__PKRecognitionSessionManager_synthesizeDrawingForText_drawing_inkColor_inputScale_suggestedHeight_bounds_progress_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  __int128 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v4 = objc_alloc(MEMORY[0x1E0D16890]);
    -[PKRecognitionSessionManager session](WeakRetained);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithRecognitionSession:", v5);

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(double *)(a1 + 72);
    v9 = *(double *)(a1 + 80);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __127__PKRecognitionSessionManager_synthesizeDrawingForText_drawing_inkColor_inputScale_suggestedHeight_bounds_progress_completion___block_invoke_2;
    v14[3] = &unk_1E777CE00;
    objc_copyWeak(&v18, v2);
    v15 = *(id *)(a1 + 32);
    v10 = *(_OWORD *)(a1 + 88);
    v19 = *(_OWORD *)(a1 + 72);
    v20 = v10;
    v21 = *(_OWORD *)(a1 + 104);
    v16 = *(id *)(a1 + 40);
    v17 = *(id *)(a1 + 48);
    objc_msgSend(v6, "synthesizeTokensForString:point:completion:shouldCancel:", v7, v14, &__block_literal_global_141, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v18);
  }
  else
  {
    v11 = 0;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  (*(void (**)(_QWORD, void *, uint64_t, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v11, v12, v13);

}

void __127__PKRecognitionSessionManager_synthesizeDrawingForText_drawing_inkColor_inputScale_suggestedHeight_bounds_progress_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id *WeakRetained;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v7 = *(double *)(a1 + 96);
    v8 = *(double *)(a1 + 104);
    v10 = *(void **)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    objc_msgSend(v9, "strokes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRecognitionSessionManager completeTextSynthesisForText:bounds:ink:inputScale:suggestedHeight:contextDrawing:sourceStrokes:tokenStringRanges:tokens:completion:](WeakRetained, v10, 0, v9, v11, v12, v5, *(void **)(a1 + 48), v7, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)completeTextSynthesisForText:(id *)a1 bounds:(void *)a2 ink:(void *)a3 inputScale:(void *)a4 suggestedHeight:(void *)a5 contextDrawing:(void *)a6 sourceStrokes:(void *)a7 tokenStringRanges:(void *)a8 tokens:(double)a9 completion:(double)a10
{
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  _OWORD *v22;
  double *v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  unint64_t i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  id obj;
  id obja;
  void *v51;
  id v52;
  id v53;
  void *v54;
  _QWORD block[4];
  id v56;
  id v57;
  id v58;
  id v59;
  _OWORD v60[3];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v44 = a2;
  v53 = a3;
  v18 = a4;
  v52 = a5;
  v45 = a6;
  v19 = a7;
  v46 = a8;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v19, "count"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v19, "count"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "strokeProviderSnapshot");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v19;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v62;
    v22 = (_OWORD *)MEMORY[0x1E0C9BAA8];
    v23 = (double *)MEMORY[0x1E0C9D628];
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v62 != v21)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * v24), "drawing");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v22[1];
        v60[0] = *v22;
        v60[1] = v26;
        v60[2] = v22[2];
        +[PKStroke _createStrokesFromCHDrawing:transform:inputScale:sourceStrokes:strokeClass:newInk:suggestedHeight:shouldSetSynthesizedFlag:](PKStroke, "_createStrokesFromCHDrawing:transform:inputScale:sourceStrokes:strokeClass:newInk:suggestedHeight:shouldSetSynthesizedFlag:", v25, v60, v52, objc_msgSend(v18, "strokeClass"), v53, 1, a9, a10);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStrokes:fromDrawing:", v27, v18);
        objc_msgSend(v28, "set_canvasBounds:", *v23, v23[1], v23[2], v23[3]);
        objc_msgSend(v51, "addObject:", v28);
        objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "addObject:", v29);

        ++v24;
      }
      while (v20 != v24);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    }
    while (v20);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __163__PKRecognitionSessionManager_completeTextSynthesisForText_bounds_ink_inputScale_suggestedHeight_contextDrawing_sourceStrokes_tokenStringRanges_tokens_completion___block_invoke;
  block[3] = &unk_1E777CEE0;
  v42 = v46;
  v59 = v42;
  v41 = v45;
  v56 = v41;
  v30 = obj;
  v57 = v30;
  v43 = v51;
  v58 = v43;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  for (i = 0; i < objc_msgSend(v30, "count"); ++i)
  {
    objc_msgSend(v30, "objectAtIndexedSubscript:", i);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {

      break;
    }
    objc_msgSend(v54, "objectAtIndexedSubscript:", i);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKStrokeProvider _identifiersForStrokes:](PKStrokeProvider, "_identifiersForStrokes:", v33);
    obja = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "asFullTextResultWithStrokeIdentifiers:strokeProvider:", obja, v47);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "objectAtIndexedSubscript:", i);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v34;
    v37 = v35;
    v38 = (void *)MEMORY[0x1E0C99E60];
    +[PKStrokeProvider _identifiersForStrokes:](PKStrokeProvider, "_identifiersForStrokes:", v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setWithArray:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[12], "addCachedTranscription:forStrokeGroup:", v36, v40);
  }

}

uint64_t __127__PKRecognitionSessionManager_synthesizeDrawingForText_drawing_inkColor_inputScale_suggestedHeight_bounds_progress_completion___block_invoke_3()
{
  return 0;
}

- (void)synthesizeDrawingForReplacementText:(void *)a3 drawing:(void *)a4 strokes:(void *)a5 bounds:(CGFloat)a6 inputScale:(CGFloat)a7 completion:(CGFloat)a8
{
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42[6];
  _BYTE location[12];
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;
  CGRect v49;

  v48 = *MEMORY[0x1E0C80C00];
  v19 = a2;
  v20 = a3;
  v21 = a4;
  v22 = a5;
  if (a1)
  {
    v23 = (void *)objc_msgSend(v20, "copy");

    if (objc_msgSend(v21, "count"))
    {
      objc_msgSend(v21, "lastObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "ink");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v21, "lastObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "ink");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "color");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKInk inkWithIdentifier:color:weight:](PKInk, "inkWithIdentifier:color:weight:", CFSTR("com.apple.ink.monoline"), v27, 1.0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v28 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStrokes:fromDrawing:", v21, v23);
    v29 = os_log_create("com.apple.pencilkit", "Proofreading");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v23, "uuid");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v49.origin.x = a6;
      v49.origin.y = a7;
      v49.size.width = a8;
      v49.size.height = a9;
      NSStringFromCGRect(v49);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138412803;
      *(_QWORD *)&location[4] = v33;
      v44 = 2112;
      v45 = v34;
      v46 = 2117;
      v47 = v19;
      _os_log_debug_impl(&dword_1BE213000, v29, OS_LOG_TYPE_DEBUG, "Requested to synthesize drawing: %@ in bounds: %@ for replacement text: \"%{sensitive}@\", location, 0x20u);

    }
    objc_initWeak((id *)location, a1);
    v30 = a1[3];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __112__PKRecognitionSessionManager_synthesizeDrawingForReplacementText_drawing_strokes_bounds_inputScale_completion___block_invoke;
    v35[3] = &unk_1E777CEB8;
    objc_copyWeak(v42, (id *)location);
    v36 = v21;
    v37 = v19;
    v20 = v23;
    v42[1] = *(id *)&a6;
    v42[2] = *(id *)&a7;
    v42[3] = *(id *)&a8;
    v42[4] = *(id *)&a9;
    v38 = v20;
    v39 = v25;
    v42[5] = *(id *)&a10;
    v40 = v28;
    v41 = v22;
    v31 = v28;
    v32 = v25;
    dispatch_async(v30, v35);

    objc_destroyWeak(v42);
    objc_destroyWeak((id *)location);
  }

}

void __112__PKRecognitionSessionManager_synthesizeDrawingForReplacementText_drawing_strokes_bounds_inputScale_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 80);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    v4 = objc_alloc(MEMORY[0x1E0D16890]);
    -[PKRecognitionSessionManager session](WeakRetained);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithRecognitionSession:", v5);

    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKStrokeProvider _identifiersForStrokes:](PKStrokeProvider, "_identifiersForStrokes:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __112__PKRecognitionSessionManager_synthesizeDrawingForReplacementText_drawing_strokes_bounds_inputScale_completion___block_invoke_2;
    v15[3] = &unk_1E777CE70;
    objc_copyWeak(&v22, v2);
    v16 = *(id *)(a1 + 48);
    v23 = *(_OWORD *)(a1 + 88);
    v24 = *(_OWORD *)(a1 + 104);
    v17 = *(id *)(a1 + 40);
    v18 = *(id *)(a1 + 56);
    v25 = *(_QWORD *)(a1 + 120);
    v19 = *(id *)(a1 + 64);
    v20 = *(id *)(a1 + 32);
    v21 = *(id *)(a1 + 72);
    v10 = (id)objc_msgSend(v6, "synthesizeTokensForString:replacingStrokes:completion:shouldCancel:", v9, v8, v15, &__block_literal_global_148);

    objc_destroyWeak(&v22);
  }
  else
  {
    v11 = os_log_create("com.apple.pencilkit", "Proofreading");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 48), "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCGRect(*(CGRect *)(a1 + 88));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412803;
      v27 = v12;
      v28 = 2112;
      v29 = v13;
      v30 = 2117;
      v31 = v14;
      _os_log_debug_impl(&dword_1BE213000, v11, OS_LOG_TYPE_DEBUG, "Ignoring synthesis of drawing: %@ in bounds: %@, for replacement text: \"%{sensitive}@\", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

void __112__PKRecognitionSessionManager_synthesizeDrawingForReplacementText_drawing_strokes_bounds_inputScale_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id *WeakRetained;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;
  CGRect v43;

  v42 = *MEMORY[0x1E0C80C00];
  v25 = a2;
  v26 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v26, "count"));
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v6 = v26;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v28 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v11 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v10, "string");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "bounds");
          NSStringFromCGRect(v43);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ [%@]"), v12, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
      }
      while (v7);
    }

    v15 = os_log_create("com.apple.pencilkit", "Proofreading");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCGRect(*(CGRect *)(a1 + 88));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138413315;
      v32 = v17;
      v33 = 2112;
      v34 = v18;
      v35 = 2117;
      v36 = v19;
      v37 = 2112;
      v38 = v25;
      v39 = 2117;
      v40 = v5;
      _os_log_debug_impl(&dword_1BE213000, v15, OS_LOG_TYPE_DEBUG, "Did synthesize drawing: %@ in bounds: %@, for replacement text: \"%{sensitive}@\". Token ranges: %@. Token: %{sensitive}@", buf, 0x34u);

    }
    -[PKRecognitionSessionManager completeTextSynthesisForText:bounds:ink:inputScale:suggestedHeight:contextDrawing:sourceStrokes:tokenStringRanges:tokens:completion:](WeakRetained, *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64), v25, v6, *(void **)(a1 + 72), *(double *)(a1 + 120), *(double *)(a1 + 112));

  }
  else
  {
    v16 = os_log_create("com.apple.pencilkit", "Proofreading");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCGRect(*(CGRect *)(a1 + 88));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412803;
      v32 = v20;
      v33 = 2112;
      v34 = v21;
      v35 = 2117;
      v36 = v22;
      _os_log_debug_impl(&dword_1BE213000, v16, OS_LOG_TYPE_DEBUG, "Ignoring synthesis of drawing: %@ in bounds: %@ for replacement text: \"%{sensitive}@\", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

uint64_t __112__PKRecognitionSessionManager_synthesizeDrawingForReplacementText_drawing_strokes_bounds_inputScale_completion___block_invoke_147()
{
  return 0;
}

uint64_t __163__PKRecognitionSessionManager_completeTextSynthesisForText_bounds_ink_inputScale_suggestedHeight_contextDrawing_sourceStrokes_tokenStringRanges_tokens_completion___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)cacheTranscription:(void *)a3 strokeGroup:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (a1)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    +[PKStrokeProvider _identifiersForStrokes:](PKStrokeProvider, "_identifiersForStrokes:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 88), "addCachedTranscription:forStrokeGroup:", v9, v8);
  }

}

- (void)dataDetectorQuery:(id)a3 foundItems:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id WeakRetained;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        +[PKDataDetectorItem dataDetectorItemWithQueryItem:sessionManager:](PKDataDetectorItem, "dataDetectorItemWithQueryItem:sessionManager:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), self, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v6, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  if ((*(_BYTE *)&self->_delegateFlags & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v13 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(WeakRetained, "recognitionSessionManager:foundDataDetectorItems:", self, v13);

  }
}

- (void)hashtagQuery:(id)a3 foundItems:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id WeakRetained;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        +[PKHashtagItem hashtagItemWithQueryItem:sessionManager:](PKHashtagItem, "hashtagItemWithQueryItem:sessionManager:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), self, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v6, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  if ((*(_BYTE *)&self->_delegateFlags & 2) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v13 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(WeakRetained, "recognitionSessionManager:foundHashtagItems:", self, v13);

  }
}

- (void)mentionQuery:(id)a3 foundItems:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id WeakRetained;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        +[PKMentionItem mentionItemWithQueryItem:sessionManager:](PKMentionItem, "mentionItemWithQueryItem:sessionManager:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), self, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v6, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  if ((*(_BYTE *)&self->_delegateFlags & 2) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v13 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(WeakRetained, "recognitionSessionManager:foundMentionItems:", self, v13);

  }
}

- (void)proofreadingQuery:(id)a3 foundItems:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  double v19;
  void *v20;
  NSTimer *v21;
  NSTimer *proofreadingTimer;
  void *v23;
  id v24;
  id v25;
  id obj;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE location[12];
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v24 = a4;
  -[NSTimer invalidate](self->_proofreadingTimer, "invalidate");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v24;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v36 != v6)
          objc_enumerationMutation(obj);
        +[PKProofreadingItem proofreadingItemWithQueryItem:sessionManager:](PKProofreadingItem, "proofreadingItemWithQueryItem:sessionManager:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i), self);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v27, "addObject:", v8);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v5);
  }

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v27, "count"));
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v25 = v27;
  v10 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v25);
        v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
        v14 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v13, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "replacementStrings");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("{identifer:%@, replacementStrings:%@}"), v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v17);

      }
      v10 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
    }
    while (v10);
  }

  v18 = os_log_create("com.apple.pencilkit", "Proofreading");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v25, "valueForKey:", CFSTR("identifier"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 138412547;
    *(_QWORD *)&location[4] = v23;
    v40 = 2117;
    v41 = v9;
    _os_log_debug_impl(&dword_1BE213000, v18, OS_LOG_TYPE_DEBUG, "Recognized proofreading items: %@. Strings: %{sensitive}@", location, 0x16u);

  }
  if ((*(_BYTE *)&self->_delegateFlags & 8) != 0)
  {
    objc_initWeak((id *)location, self);
    if (self->q_wantsAutoRefine)
      v19 = 0.0;
    else
      v19 = 1.0;
    v20 = (void *)MEMORY[0x1E0C99E88];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __60__PKRecognitionSessionManager_proofreadingQuery_foundItems___block_invoke;
    v28[3] = &unk_1E777CF08;
    objc_copyWeak(&v30, (id *)location);
    v29 = v25;
    objc_msgSend(v20, "scheduledTimerWithTimeInterval:repeats:block:", 0, v28, v19);
    v21 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    proofreadingTimer = self->_proofreadingTimer;
    self->_proofreadingTimer = v21;

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)location);
  }

}

void __60__PKRecognitionSessionManager_proofreadingQuery_foundItems___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
    v3 = objc_loadWeakRetained(WeakRetained + 23);
  else
    v3 = 0;
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v3, "recognitionSessionManager:foundProofreadingItems:", v5, v4);

}

- (void)groupQuery:(id)a3 foundItems:(id)a4
{
  id v5;
  id WeakRetained;
  id v7;

  v5 = a4;
  if ((*(_BYTE *)&self->_delegateFlags & 0x10) != 0)
  {
    v7 = v5;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "recognitionSessionManager:foundStrokeGroupItems:", self, v7);

    v5 = v7;
  }

}

void __49__PKRecognitionSessionManager_transcriptionQuery__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "state");
  v3 = *(id **)(*(_QWORD *)(a1 + 32) + 120);
  if (v2 == 3)
    -[PKRecognitionQueryController drawingQueryWithIdentifier:](v3, (uint64_t)CFSTR("Transcription"));
  else
    -[PKRecognitionQueryController visibleStrokesQueryWithIdentifier:](v3, (uint64_t)CFSTR("Transcription"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)fetchTranscriptionForStrokes:(void *)a3 cancelBlock:(void *)a4 withCompletion:
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[6];
  uint64_t block;
  uint64_t p_block;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = *(NSObject **)(a1 + 24);
    v11 = MEMORY[0x1E0C809B0];
    block = MEMORY[0x1E0C809B0];
    p_block = 3221225472;
    v23 = (uint64_t)__53__PKRecognitionSessionManager_setWantsTranscription___block_invoke;
    v24 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E7778538;
    v25 = (void (*)(uint64_t))a1;
    LOBYTE(v26) = 1;
    dispatch_async(v10, &block);
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKStrokeProvider _identifiersForStrokes:](PKStrokeProvider, "_identifiersForStrokes:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    block = 0;
    p_block = (uint64_t)&block;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__29;
    v25 = __Block_byref_object_dispose__29;
    v26 = 0;
    v14 = *(NSObject **)(a1 + 24);
    v20[0] = v11;
    v20[1] = 3221225472;
    v20[2] = __49__PKRecognitionSessionManager_transcriptionQuery__block_invoke;
    v20[3] = &unk_1E77795A8;
    v20[4] = a1;
    v20[5] = &block;
    dispatch_sync(v14, v20);
    v15 = *(id *)(p_block + 40);
    _Block_object_dispose(&block, 8);

    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = __87__PKRecognitionSessionManager_fetchTranscriptionForStrokes_cancelBlock_withCompletion___block_invoke;
    v18[3] = &unk_1E777CF58;
    v19 = v9;
    objc_msgSend(v15, "contextualTextResultsForContextStrokes:completion:shouldCancel:", v13, v18, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __87__PKRecognitionSessionManager_fetchTranscriptionForStrokes_cancelBlock_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  _QWORD *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__29;
  v7[4] = __Block_byref_object_dispose__29;
  objc_msgSend(v3, "topTranscription");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __87__PKRecognitionSessionManager_fetchTranscriptionForStrokes_cancelBlock_withCompletion___block_invoke_2;
  v4[3] = &unk_1E777CF30;
  v5 = *(id *)(a1 + 32);
  v6 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

  _Block_object_dispose(v7, 8);
}

uint64_t __87__PKRecognitionSessionManager_fetchTranscriptionForStrokes_cancelBlock_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

+ (id)enabledLocales
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6), (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
          objc_msgSend(v2, "addObject:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)hasAutoRefineLocaleEnabled
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  char v7;
  BOOL v8;
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
  objc_msgSend((id)objc_opt_class(), "enabledLocales", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "languageCode");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(&unk_1E77ECE38, "containsObject:", v6);

        if ((v7 & 1) != 0)
        {
          v8 = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (void)autoRefineQuery:(id)a3 didUpdateWithQueryItem:(id)a4 validProviderVersion:(id)a5
{
  id v7;
  id v8;
  NSObject *recognitionSessionQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  recognitionSessionQueue = self->_recognitionSessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__PKRecognitionSessionManager_autoRefineQuery_didUpdateWithQueryItem_validProviderVersion___block_invoke;
  block[3] = &unk_1E7776FB0;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_sync(recognitionSessionQueue, block);

}

void __91__PKRecognitionSessionManager_autoRefineQuery_didUpdateWithQueryItem_validProviderVersion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id *v26;
  id *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  id v38;
  int v39;
  id v40;
  _QWORD v41[5];
  NSObject *v42;
  _QWORD v43[5];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 192));
  if (WeakRetained)
  {
    v40 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 40), "textResult");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 192));
      v5 = objc_msgSend(v4, "hasRefinableStrokes");

      if (v5)
      {
        -[PKRecognitionSessionManager directStrokeProviderSnapshot](*(void **)(a1 + 32));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 0u;
        v45 = 0u;
        v46 = 0u;
        v44 = 0u;
        objc_msgSend(*(id *)(a1 + 40), "strokeIdentifiers");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
        if (v8)
        {
          v9 = 0;
          v10 = *(_QWORD *)v45;
          while (2)
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v45 != v10)
                objc_enumerationMutation(v7);
              v12 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
              if ((objc_msgSend(v6, "isValidStrokeIdentifier:", v12) & 1) == 0)
              {

                v37 = os_log_create("com.apple.pencilkit", "AutoRefine");
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1BE213000, v37, OS_LOG_TYPE_DEFAULT, "AutoRefine item rejected because some strokes are invalid in new snapshot", buf, 2u);
                }
                goto LABEL_30;
              }
              objc_msgSend(v6, "strokeForIdentifier:", v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v9 & 1) != 0)
              {
                v9 = 1;
              }
              else
              {
                v14 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 192));
                objc_msgSend(v13, "stroke");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v9 = objc_msgSend(v14, "isRefinableStroke:", v15);

              }
            }
            v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
            if (v8)
              continue;
            break;
          }

          if ((v9 & 1) != 0)
          {
            v16 = *(void **)(a1 + 48);
            objc_msgSend(v6, "strokeProviderVersion");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v16, "isEqual:", v17);

            v19 = os_log_create("com.apple.pencilkit", "AutoRefine");
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              v20 = *(_QWORD *)(a1 + 48);
              objc_msgSend(v6, "strokeProviderVersion");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "orderedStrokes");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "count");
              objc_msgSend(*(id *)(a1 + 40), "strokeIdentifiers");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "count");
              *(_DWORD *)buf = 138413314;
              v49 = v20;
              v50 = 2112;
              v51 = v21;
              v52 = 1024;
              v53 = v18;
              v54 = 2048;
              v55 = v23;
              v56 = 2048;
              v57 = v25;
              _os_log_impl(&dword_1BE213000, v19, OS_LOG_TYPE_DEFAULT, "AutoRefine processing new item received in recognition manager. Versions = %@ vs %@, match ? %d. Current stroke count = %ld, strokes in item = %ld.", buf, 0x30u);

            }
            v26 = -[PKAutoRefineQueryItem initWithQueryItem:usingStrokeProvider:]([PKAutoRefineQueryItem alloc], *(void **)(a1 + 40), v6);
            v27 = v26;
            if (v26)
              v28 = v26[5];
            else
              v28 = 0;
            v29 = v28;
            v30 = MEMORY[0x1E0C809B0];
            v43[0] = MEMORY[0x1E0C809B0];
            v43[1] = 3221225472;
            v43[2] = __91__PKRecognitionSessionManager_autoRefineQuery_didUpdateWithQueryItem_validProviderVersion___block_invoke_180;
            v43[3] = &unk_1E777CF80;
            v43[4] = *(_QWORD *)(a1 + 32);
            objc_msgSend(v29, "indexesOfObjectsPassingTest:", v43);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (v27)
              objc_setProperty_nonatomic_copy(v27, v32, v31, 48);
            -[PKAutoRefineTaskManager cancelTasksGivenQueryItem:](*(void **)(*(_QWORD *)(a1 + 32) + 144), v27);
            v33 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144);
            objc_msgSend(*(id *)(a1 + 40), "textResult");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "tokenColumnCount") - 1;
            v36 = *(void **)(a1 + 48);
            v41[0] = v30;
            v41[1] = 3221225472;
            v41[2] = __91__PKRecognitionSessionManager_autoRefineQuery_didUpdateWithQueryItem_validProviderVersion___block_invoke_2;
            v41[3] = &unk_1E777CFD0;
            v41[4] = *(_QWORD *)(a1 + 32);
            v37 = v27;
            v42 = v37;
            -[PKAutoRefineTaskManager scheduleAutoRefineTaskForItem:firstColumnToCommit:lastColumnToCommit:providerVersion:delay:taskInitBlock:](v33, v37, 0, v35, v36, v41, 0.0);

            goto LABEL_30;
          }
        }
        else
        {

        }
        v37 = os_log_create("com.apple.pencilkit", "AutoRefine");
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          v38 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 192));
          v39 = objc_msgSend(v38, "hasRefinableStrokes");
          *(_DWORD *)buf = 67109120;
          LODWORD(v49) = v39;
          _os_log_impl(&dword_1BE213000, v37, OS_LOG_TYPE_DEFAULT, "AutoRefine item rejected because it contains no refinable strokes, current tracker has refinable strokes ? %d", buf, 8u);

        }
LABEL_30:

      }
    }
    else
    {

    }
  }
}

uint64_t __91__PKRecognitionSessionManager_autoRefineQuery_didUpdateWithQueryItem_validProviderVersion___block_invoke_180(uint64_t a1, uint64_t a2)
{
  void *v3;
  id WeakRetained;
  uint64_t v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "_visibleStrokeForIdentifier:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 192));
  v5 = objc_msgSend(WeakRetained, "isRefinableStroke:", v3);

  return v5;
}

void __91__PKRecognitionSessionManager_autoRefineQuery_didUpdateWithQueryItem_validProviderVersion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id WeakRetained;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  -[PKRecognitionSessionManager directStrokeProviderSnapshot](*(void **)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAutoRefineTaskManager setCurrentDrawingUUID:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144), v5);

  v6 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v16 = v3;
    _os_log_impl(&dword_1BE213000, v6, OS_LOG_TYPE_DEFAULT, "AutoRefine running init block for immediate task %p - checking if task should be cancelled against one of the autorefinable strokes", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 192));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __91__PKRecognitionSessionManager_autoRefineQuery_didUpdateWithQueryItem_validProviderVersion___block_invoke_182;
  v11[3] = &unk_1E777CFA8;
  v12 = *(id *)(a1 + 40);
  v8 = v3;
  v13 = v8;
  v9 = v4;
  v14 = v9;
  objc_msgSend(WeakRetained, "enumerateRefinableStrokesWithOptions:usingBlock:", 2, v11);

  -[PKRecognitionSessionManager directStrokeProviderSnapshot](*(void **)(a1 + 32));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSqueezePaletteViewContext setSelectedColor:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144), v10);

}

void __91__PKRecognitionSessionManager_autoRefineQuery_didUpdateWithQueryItem_validProviderVersion___block_invoke_182(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  _QWORD *v7;
  _QWORD *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = *(_QWORD **)(a1 + 32);
  if (v7)
    v7 = (_QWORD *)v7[5];
  v8 = v7;
  v9 = objc_msgSend(v8, "containsObject:", v6);

  if (v9)
  {
    v10 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v19 = 134217984;
      v20 = v11;
      _os_log_impl(&dword_1BE213000, v10, OS_LOG_TYPE_DEFAULT, "AutoRefine found a refinable stroke covered by the item in the task %p", (uint8_t *)&v19, 0xCu);
    }

    *a4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "drawing");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_visibleStrokeForIdentifier:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      LOBYTE(v19) = 0;
      v14 = *(_QWORD **)(a1 + 40);
      objc_msgSend(v13, "_bounds");
      -[PKAutoRefineTask trimTaskForNewStrokeInRect:shouldCancel:](v14, &v19, v15, v16, v17, v18);
      if ((_BYTE)v19)
      {
        -[PKAutoRefineTask cancel](*(_QWORD *)(a1 + 40));
        *a4 = 1;
      }
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mentionSuffixes, 0);
  objc_destroyWeak((id *)&self->_autoRefineViewDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_proofreadingTimer, 0);
  objc_storeStrong((id *)&self->q_listeners, 0);
  objc_storeStrong((id *)&self->q_autoRefineManager, 0);
  objc_storeStrong((id *)&self->q_autoRefineQuery, 0);
  objc_storeStrong((id *)&self->_observerWrapper, 0);
  objc_storeStrong((id *)&self->q_queryController, 0);
  objc_storeStrong((id *)&self->q_visibleOnscreenStrokes, 0);
  objc_storeStrong((id *)&self->q_stagingTranscriptionCache, 0);
  objc_storeStrong((id *)&self->q_transcriptionCache, 0);
  objc_storeStrong((id *)&self->q_calculateDocumentProvider, 0);
  objc_storeStrong((id *)&self->q_previousTime, 0);
  objc_storeStrong((id *)&self->q_textSynthesizer, 0);
  objc_storeStrong((id *)&self->q_textSynthesizerWithLocaleFallback, 0);
  objc_storeStrong((id *)&self->q_session, 0);
  objc_storeStrong((id *)&self->q_drawing, 0);
  objc_storeStrong((id *)&self->_drawingForGetter, 0);
  objc_storeStrong((id *)&self->_recognitionSessionQueue, 0);
}

@end
