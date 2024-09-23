@implementation PKRecognitionController

- (PKRecognitionController)initWithDrawing:(id)a3
{
  return -[PKRecognitionController initWithDrawing:visibleOnscreenStrokes:](self, "initWithDrawing:visibleOnscreenStrokes:", a3, 0);
}

- (PKRecognitionController)initWithDrawing:(id)a3 visibleOnscreenStrokes:(id)a4
{
  return -[PKRecognitionController initWithDrawing:visibleOnscreenStrokes:useSessionCache:](self, "initWithDrawing:visibleOnscreenStrokes:useSessionCache:", a3, a4, 0);
}

- (PKRecognitionController)initWithDrawing:(id)a3 visibleOnscreenStrokes:(id)a4 useSessionCache:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  PKRecognitionController *v10;
  uint64_t v11;
  NSUUID *listenerID;
  _BYTE *v13;
  void *v14;
  char *v15;
  PKRecognitionSessionManager *sessionManager;
  char *v17;
  void *v18;
  objc_super v20;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PKRecognitionController;
  v10 = -[PKRecognitionController init](&v20, sel_init);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = objc_claimAutoreleasedReturnValue();
    listenerID = v10->_listenerID;
    v10->_listenerID = (NSUUID *)v11;

    +[PKRecognitionSessionManagerConfiguration interactiveCanvasConfiguration]();
    v13 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v5 && v13)
      v13[8] = 1;
    v15 = -[PKRecognitionSessionManager initWithConfiguration:]((char *)[PKRecognitionSessionManager alloc], v13);
    -[PKRecognitionSessionManager setDelegate:]((uint64_t)v15, v10);
    -[PKRecognitionSessionManager addListener:]((uint64_t)v15, v10->_listenerID);
    sessionManager = v10->_sessionManager;
    v10->_sessionManager = (PKRecognitionSessionManager *)v15;
    v17 = v15;

    objc_msgSend(v8, "uuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKRecognitionSessionCache addRecognitionSession:forUUID:]((uint64_t)PKRecognitionSessionCache, v17, v18);

    if (v9)
      -[PKRecognitionSessionManager setDrawing:withVisibleOnscreenStrokes:](v17, v8, v9);
    else
      -[PKRecognitionSessionManager setDrawing:](v17, v8);

    -[PKRecognitionController _drawingDidUpdate:]((uint64_t)v10, v8);
  }

  return v10;
}

- (void)_drawingDidUpdate:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void **v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = *(_QWORD *)(a1 + 16);
    if (v4)
    {
      -[PKMathRecognitionController _drawingDidUpdate:](v4, v3);
      v5 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(v3, "strokes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setWithCapacity:", objc_msgSend(v6, "count"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      objc_msgSend(v3, "strokes", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v21;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v21 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v12), "_strokeUUID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
              objc_msgSend(v7, "addObject:", v13);

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v10);
      }

      v15 = (void **)(a1 + 32);
      v14 = *(void **)(a1 + 32);
      if (v14)
      {
        v16 = (void *)objc_msgSend(v14, "mutableCopy");
        objc_msgSend(v16, "minusSet:", v7);
        objc_storeStrong((id *)(a1 + 32), v7);
        if (objc_msgSend(v16, "count"))
        {
          v17 = *(void **)(a1 + 16);
          v18 = (void *)objc_msgSend(v16, "copy");
          objc_msgSend(v17, "didEraseStrokes:", v18);

        }
      }
      else
      {
        v19 = v7;
        v16 = *v15;
        *v15 = v19;
      }

    }
  }

}

- (void)dealloc
{
  objc_super v3;

  -[PKRecognitionSessionManager removeListener:]((uint64_t)self->_sessionManager, self->_listenerID);
  v3.receiver = self;
  v3.super_class = (Class)PKRecognitionController;
  -[PKRecognitionController dealloc](&v3, sel_dealloc);
}

- (void)tagAsIdle
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.pencilkit", "Math");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[PKRecognitionController drawing](self, "drawing");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1BE213000, v3, OS_LOG_TYPE_DEFAULT, "Tag recognition session as idle: %@", (uint8_t *)&v7, 0xCu);

  }
  -[PKRecognitionSessionManager session](self->_sessionManager);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdle");

}

- (void)tagAsActive
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.pencilkit", "Math");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[PKRecognitionController drawing](self, "drawing");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1BE213000, v3, OS_LOG_TYPE_DEFAULT, "Tag recognition session as active: %@", (uint8_t *)&v7, 0xCu);

  }
  -[PKRecognitionSessionManager session](self->_sessionManager);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive");

}

- (void)setDrawing:(id)a3 withVisibleOnscreenStrokes:(id)a4
{
  PKRecognitionSessionManager *sessionManager;
  id v7;

  sessionManager = self->_sessionManager;
  v7 = a3;
  -[PKRecognitionSessionManager setDrawing:withVisibleOnscreenStrokes:](sessionManager, v7, a4);
  -[PKRecognitionController _drawingDidUpdate:]((uint64_t)self, v7);

}

- (void)setVisibleOnscreenStrokes:(id)a3
{
  -[PKRecognitionSessionManager setVisibleOnscreenStrokes:]((uint64_t)self->_sessionManager, a3);
}

- (void)setDrawing:(id)a3
{
  PKRecognitionSessionManager *sessionManager;
  id v5;

  sessionManager = self->_sessionManager;
  v5 = a3;
  -[PKRecognitionSessionManager setDrawing:](sessionManager, v5);
  -[PKRecognitionController _drawingDidUpdate:]((uint64_t)self, v5);

}

- (PKDrawing)drawing
{
  return (PKDrawing *)-[PKRecognitionSessionManager drawing](self->_sessionManager);
}

- (_PKDataDetectorController)dataDetectorController
{
  _PKDataDetectorController **p_dataDetectorController;
  _PKDataDetectorController *v4;

  p_dataDetectorController = &self->_dataDetectorController;
  v4 = self->_dataDetectorController;
  if (!v4)
  {
    v4 = objc_alloc_init(_PKDataDetectorController);
    objc_storeStrong((id *)p_dataDetectorController, v4);
    -[PKRecognitionSessionManager setWantsDataDetection:]((uint64_t)self->_sessionManager, 1);
  }
  return v4;
}

- (PKMathRecognitionController)mathRecognitionController
{
  PKMathRecognitionController **p_mathRecognitionController;
  PKMathRecognitionController *v4;
  PKMathRecognitionController *v5;
  PKMathRecognitionController *v6;
  PKRecognitionSessionManager *sessionManager;
  _QWORD v9[4];
  PKMathRecognitionController *v10;

  p_mathRecognitionController = &self->_mathRecognitionController;
  v4 = self->_mathRecognitionController;
  if (!v4)
  {
    v5 = objc_alloc_init(PKMathRecognitionController);
    v6 = v5;
    if (v5)
      objc_storeWeak((id *)&v5[1].super.isa, self->_sessionManager);
    objc_storeStrong((id *)p_mathRecognitionController, v6);
    -[PKRecognitionSessionManager setupForMath]((uint64_t)self->_sessionManager);
    sessionManager = self->_sessionManager;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__PKRecognitionController_mathRecognitionController__block_invoke;
    v9[3] = &unk_1E777CB60;
    v4 = v6;
    v10 = v4;
    -[PKRecognitionSessionManager fetchCurrentStrokeGroupItems:]((uint64_t)sessionManager, v9);

  }
  return v4;
}

void __52__PKRecognitionController_mathRecognitionController__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4 = os_log_create("com.apple.pencilkit", "Math");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v9 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Found existing stroke groups when setting up math: %lu", buf, 0xCu);
    }

    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __52__PKRecognitionController_mathRecognitionController__block_invoke_10;
    v5[3] = &unk_1E7777C20;
    v6 = *(id *)(a1 + 32);
    v7 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

void __52__PKRecognitionController_mathRecognitionController__block_invoke_10(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    -[PKMathRecognitionController _foundStrokeGroups:canDelay:](v2, *(void **)(a1 + 40), 1);
}

- (id)contextLookupResultsAtLocation:(CGPoint)a3 completion:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = objc_alloc(MEMORY[0x1E0D167F0]);
  -[PKRecognitionSessionManager session](self->_sessionManager);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithRecognitionSession:", v9);

  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __69__PKRecognitionController_contextLookupResultsAtLocation_completion___block_invoke;
  v17[3] = &unk_1E777CB88;
  objc_copyWeak(&v19, &location);
  v12 = v7;
  v18 = v12;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __69__PKRecognitionController_contextLookupResultsAtLocation_completion___block_invoke_2;
  v15[3] = &unk_1E777CBB0;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v10, "contextLookupResultsAtLocation:completion:shouldCancel:", v17, v15, x, y);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v13;
}

void __69__PKRecognitionController_contextLookupResultsAtLocation_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id *WeakRetained;
  id *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = WeakRetained[6];
    -[PKRecognitionSessionManager drawing](v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "strokesForCHStrokeIdentifiers:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v11, v5);

  }
}

BOOL __69__PKRecognitionController_contextLookupResultsAtLocation_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  _BOOL8 v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained == 0;

  return v2;
}

- (id)contextLookupResultsForPath:(CGPath *)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  v7 = objc_alloc(MEMORY[0x1E0D167F0]);
  -[PKRecognitionSessionManager session](self->_sessionManager);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithRecognitionSession:", v8);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __66__PKRecognitionController_contextLookupResultsForPath_completion___block_invoke;
    v15[3] = &unk_1E777CBD8;
    objc_copyWeak(&v17, &location);
    v16 = v6;
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __66__PKRecognitionController_contextLookupResultsForPath_completion___block_invoke_2;
    v13[3] = &unk_1E777CBB0;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v9, "contextLookupResultsWithSelectionPath:completion:shouldCancel:", a3, v15, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v14);

    objc_destroyWeak(&v17);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, 0, 0);
    v11 = 0;
  }

  objc_destroyWeak(&location);
  return v11;
}

void __66__PKRecognitionController_contextLookupResultsForPath_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id *WeakRetained;
  id *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = WeakRetained[6];
    -[PKRecognitionSessionManager drawing](v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "strokesForCHStrokeIdentifiers:", v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v10[6];
    -[PKRecognitionSessionManager drawing](v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "strokesForCHStrokeIdentifiers:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topTranscription");
    v17 = v8;
    v18 = v7;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, void *))(v11 + 16))(v11, v13, v16, v19);

    v7 = v18;
    v8 = v17;

  }
}

BOOL __66__PKRecognitionController_contextLookupResultsForPath_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  _BOOL8 v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained == 0;

  return v2;
}

- (id)contextLookupResultsWithSelectedStrokes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = objc_alloc(MEMORY[0x1E0D167F0]);
  -[PKRecognitionSessionManager session](self->_sessionManager);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithRecognitionSession:", v9);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKStrokeProvider _identifiersForStrokes:](PKStrokeProvider, "_identifiersForStrokes:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __78__PKRecognitionController_contextLookupResultsWithSelectedStrokes_completion___block_invoke;
    v18[3] = &unk_1E777CBD8;
    objc_copyWeak(&v20, &location);
    v19 = v7;
    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __78__PKRecognitionController_contextLookupResultsWithSelectedStrokes_completion___block_invoke_2;
    v16[3] = &unk_1E777CBB0;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v10, "contextLookupResultsWithSelectedStrokes:completion:shouldCancel:", v12, v18, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v17);

    objc_destroyWeak(&v20);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, 0, 0);
    v14 = 0;
  }

  objc_destroyWeak(&location);
  return v14;
}

void __78__PKRecognitionController_contextLookupResultsWithSelectedStrokes_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id *WeakRetained;
  id *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a2;
  v7 = a3;
  v8 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = WeakRetained[6];
    -[PKRecognitionSessionManager drawing](v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "strokesForCHStrokeIdentifiers:", v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v10[6];
    -[PKRecognitionSessionManager drawing](v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "strokesForCHStrokeIdentifiers:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topTranscription");
    v17 = v8;
    v18 = v7;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, void *))(v11 + 16))(v11, v13, v16, v19);

    v7 = v18;
    v8 = v17;

  }
}

BOOL __78__PKRecognitionController_contextLookupResultsWithSelectedStrokes_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  _BOOL8 v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained == 0;

  return v2;
}

- (id)reflowableLinesInitialStrokes:(id)a3 atLocation:(CGPoint)a4 completion:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  PKRecognitionSessionManager *v19;
  PKRecognitionSessionManager *v20;
  id WeakRetained;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  _QWORD v30[5];
  id v31;
  os_signpost_id_t v32;
  uint8_t buf[8];
  id location;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v10 = a5;
  objc_initWeak(&location, self);
  _PKSignpostLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);

  _PKSignpostLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE213000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "reflowableLinesInitialStrokes", (const char *)&unk_1BE532412, buf, 2u);
  }

  v15 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE213000, v15, OS_LOG_TYPE_INFO, "BEGIN \"reflowableLinesInitialStrokes\", buf, 2u);
  }

  v16 = objc_alloc(MEMORY[0x1E0D16838]);
  -[PKRecognitionSessionManager session](self->_sessionManager);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithRecognitionSession:", v17);

  v19 = self->_sessionManager;
  v20 = v19;
  if (v19)
    WeakRetained = objc_loadWeakRetained((id *)&v19->_autoRefineViewDelegate);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "clearRefinableStrokes");

  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKStrokeProvider _identifiersForStrokes:](PKStrokeProvider, "_identifiersForStrokes:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __79__PKRecognitionController_reflowableLinesInitialStrokes_atLocation_completion___block_invoke;
  v30[3] = &unk_1E777CC00;
  v32 = v12;
  v30[4] = self;
  v25 = v10;
  v31 = v25;
  v28[0] = v24;
  v28[1] = 3221225472;
  v28[2] = __79__PKRecognitionController_reflowableLinesInitialStrokes_atLocation_completion___block_invoke_26;
  v28[3] = &unk_1E777CBB0;
  objc_copyWeak(&v29, &location);
  objc_msgSend(v18, "reflowableTextTokensForInitialStrokes:point:completion:shouldCancel:", v23, v30, v28, x, y);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v29);

  objc_destroyWeak(&location);
  return v26;
}

void __79__PKRecognitionController_reflowableLinesInitialStrokes_atLocation_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void (*v11)(void);
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t buf[16];

  v3 = a2;
  _PKSignpostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = a1[6];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE213000, v5, OS_SIGNPOST_INTERVAL_END, v6, "reflowableLinesInitialStrokes", (const char *)&unk_1BE532412, buf, 2u);
  }

  v7 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_INFO, "END \"reflowableLinesInitialStrokes\", v13, 2u);
  }

  v8 = a1[4];
  if (v8
    && (v9 = *(_QWORD *)(v8 + 48)) != 0
    && -[PKAutoRefineTaskManager hasOngoingAnimationTask](*(void **)(v9 + 144)))
  {
    v10 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1BE213000, v10, OS_LOG_TYPE_ERROR, "AutoRefine: No reflow result because hasOngoingAutoRefineAnimationTask=YES", v12, 2u);
    }

    v11 = *(void (**)(void))(a1[5] + 16);
  }
  else
  {
    v11 = *(void (**)(void))(a1[5] + 16);
  }
  v11();

}

BOOL __79__PKRecognitionController_reflowableLinesInitialStrokes_atLocation_completion___block_invoke_26(uint64_t a1)
{
  id WeakRetained;
  _BOOL8 v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained == 0;

  return v2;
}

- (void)setCalculateDocumentProvider:(id)a3
{
  -[PKRecognitionSessionManager setCalculateDocumentProvider:]((uint64_t)self->_sessionManager, a3);
}

- (BOOL)canConvertTextToHandwriting:(id)a3
{
  id v4;
  PKRecognitionSessionManager *sessionManager;
  BOOL v6;

  v4 = a3;
  if (CHGetPersonalizedSynthesisSupportState() == 3)
  {
    if (self)
      sessionManager = self->_sessionManager;
    else
      sessionManager = 0;
    v6 = -[PKRecognitionSessionManager canSynthesizeDrawingForText:]((uint64_t)sessionManager, v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)convertTextToHandwriting:(id)a3 bounds:(CGRect)a4 inkColor:(id)a5 inputScale:(double)a6 suggestedHeight:(double)a7 suggestedDrawing:(id)a8 progress:(id)a9 completion:(id)a10
{
  double height;
  double width;
  double y;
  double x;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  os_signpost_id_t v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  os_signpost_id_t v34;
  uint8_t buf[16];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v21 = a3;
  v22 = a5;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  _PKSignpostLog();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = os_signpost_id_generate(v26);

  _PKSignpostLog();
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE213000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v27, "Synthesize convertTextToHandwriting", (const char *)&unk_1BE532412, buf, 2u);
  }

  v30 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE213000, v30, OS_LOG_TYPE_INFO, "BEGIN \"Synthesize convertTextToHandwriting\", buf, 2u);
  }

  if (!v23)
  {
    -[PKRecognitionController drawing](self, "drawing");
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (self)
    self = (PKRecognitionController *)self->_sessionManager;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __132__PKRecognitionController_convertTextToHandwriting_bounds_inkColor_inputScale_suggestedHeight_suggestedDrawing_progress_completion___block_invoke;
  v32[3] = &unk_1E777CC50;
  v33 = v25;
  v34 = v27;
  v31 = v25;
  -[PKRecognitionSessionManager synthesizeDrawingForText:drawing:inkColor:inputScale:suggestedHeight:bounds:progress:completion:](self, v21, v23, a6, a7, x, y, width, height, (uint64_t)v22, v24, v32);

}

void __132__PKRecognitionController_convertTextToHandwriting_bounds_inkColor_inputScale_suggestedHeight_suggestedDrawing_progress_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __132__PKRecognitionController_convertTextToHandwriting_bounds_inkColor_inputScale_suggestedHeight_suggestedDrawing_progress_completion___block_invoke_2;
  block[3] = &unk_1E777CC28;
  v10 = *(void **)(a1 + 32);
  v19 = *(_QWORD *)(a1 + 40);
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __132__PKRecognitionController_convertTextToHandwriting_bounds_inkColor_inputScale_suggestedHeight_suggestedDrawing_progress_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  uint8_t v7[16];
  uint8_t buf[16];

  _PKSignpostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE213000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Synthesize convertTextToHandwriting", (const char *)&unk_1BE532412, buf, 2u);
  }

  v5 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_INFO, "END \"Synthesize convertTextToHandwriting\", v7, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)replaceStrokes:(id)a3 withString:(id)a4 inBounds:(CGRect)a5 inputScale:(double)a6 completion:(id)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  PKRecognitionSessionManager *sessionManager;
  PKRecognitionSessionManager *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  os_signpost_id_t v29;
  uint8_t buf[16];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v15 = a7;
  v16 = a4;
  v17 = a3;
  _PKSignpostLog();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_signpost_id_generate(v18);

  _PKSignpostLog();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE213000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "Synthesize replaceStrokes", (const char *)&unk_1BE532412, buf, 2u);
  }

  v22 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE213000, v22, OS_LOG_TYPE_INFO, "BEGIN \"Synthesize replaceStrokes\", buf, 2u);
  }

  if (self)
    sessionManager = self->_sessionManager;
  else
    sessionManager = 0;
  v24 = sessionManager;
  -[PKRecognitionController drawing](self, "drawing");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __84__PKRecognitionController_replaceStrokes_withString_inBounds_inputScale_completion___block_invoke;
  v27[3] = &unk_1E777CC50;
  v28 = v15;
  v29 = v19;
  v26 = v15;
  -[PKRecognitionSessionManager synthesizeDrawingForReplacementText:drawing:strokes:bounds:inputScale:completion:](v24, v16, v25, v17, v27, x, y, width, height, a6);

}

void __84__PKRecognitionController_replaceStrokes_withString_inBounds_inputScale_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__PKRecognitionController_replaceStrokes_withString_inBounds_inputScale_completion___block_invoke_2;
  block[3] = &unk_1E777CC28;
  v10 = *(void **)(a1 + 32);
  v19 = *(_QWORD *)(a1 + 40);
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __84__PKRecognitionController_replaceStrokes_withString_inBounds_inputScale_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  uint8_t v7[16];
  uint8_t buf[16];

  _PKSignpostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE213000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Synthesize replaceStrokes", (const char *)&unk_1BE532412, buf, 2u);
  }

  v5 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_INFO, "END \"Synthesize replaceStrokes\", v7, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

+ (void)removeStrokesFromStyleInventory:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[PKStrokeProvider slicesForStrokes:](PKStrokeProvider, "slicesForStrokes:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "encodedStrokeIdentifier", (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0D16828], "updateStyleInventoryWithRemovedStrokeIdentifiers:", v4);
}

- (void)recognitionSessionManager:(id)a3 foundDataDetectorItems:(id)a4
{
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a4;
  -[_PKDataDetectorController _foundDataDetectorItems:]((uint64_t)self->_dataDetectorController, (uint64_t)v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_internalDelegate);
    objc_msgSend(v7, "recognitionController:foundDataDetectorItems:", self, v8);

  }
}

- (void)recognitionSessionManager:(id)a3 foundHashtagItems:(id)a4
{
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_internalDelegate);
    objc_msgSend(v7, "recognitionController:foundHashtagItems:", self, v8);

  }
}

- (void)recognitionSessionManager:(id)a3 foundMentionItems:(id)a4
{
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_internalDelegate);
    objc_msgSend(v7, "recognitionController:foundMentionItems:", self, v8);

  }
}

- (void)recognitionSessionManager:(id)a3 foundProofreadingItems:(id)a4
{
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_internalDelegate);
    objc_msgSend(v7, "recognitionController:foundProofreadingItems:", self, v8);

  }
}

- (void)recognitionSessionManager:(id)a3 foundStrokeGroupItems:(id)a4
{
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v6 = v5;
  if (self->_mathRecognitionController)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __75__PKRecognitionController_recognitionSessionManager_foundStrokeGroupItems___block_invoke;
    v7[3] = &unk_1E7777C20;
    v7[4] = self;
    v8 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

void __75__PKRecognitionController_recognitionSessionManager_foundStrokeGroupItems___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "mathRecognitionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    -[PKMathRecognitionController _foundStrokeGroups:canDelay:]((uint64_t)v2, *(void **)(a1 + 40), 1);
    v2 = v3;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_destroyWeak((id *)&self->_internalDelegate);
  objc_storeStrong((id *)&self->_currentDrawingStrokeUUIDs, 0);
  objc_storeStrong((id *)&self->_listenerID, 0);
  objc_storeStrong((id *)&self->_mathRecognitionController, 0);
  objc_storeStrong((id *)&self->_dataDetectorController, 0);
}

@end
