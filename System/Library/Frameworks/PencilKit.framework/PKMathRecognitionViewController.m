@implementation PKMathRecognitionViewController

- (PKMathRecognitionViewController)initWithController:(id)a3 view:(id)a4 delegate:(id)a5
{
  _BYTE *v9;
  id v10;
  id v11;
  char *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  unsigned int *v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  char v44;
  unsigned int v45;
  int v46;
  unsigned int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  uint64_t v54;
  void *v55;
  id v56;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  objc_super v62;
  uint8_t buf[4];
  _BYTE *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v62.receiver = self;
  v62.super_class = (Class)PKMathRecognitionViewController;
  v12 = -[PKMathRecognitionViewController init](&v62, sel_init);
  if (v12)
  {
    v13 = os_log_create("com.apple.pencilkit", "Math");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v64 = v9;
      _os_log_impl(&dword_1BE213000, v13, OS_LOG_TYPE_DEFAULT, "Creating PKMathRecognitionViewController for: %p", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12[105] = objc_msgSend(v14, "BOOLForKey:", CFSTR("internalSettings.drawing.disableMathAlternatives"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12[106] = objc_msgSend(v15, "BOOLForKey:", CFSTR("internalSettings.drawing.disableMathErrors"));

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)*((_QWORD *)v12 + 2);
    *((_QWORD *)v12 + 2) = v16;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)*((_QWORD *)v12 + 4);
    *((_QWORD *)v12 + 4) = v18;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)*((_QWORD *)v12 + 3);
    *((_QWORD *)v12 + 3) = v20;

    objc_msgSend(v10, "bounds");
    *((_QWORD *)v12 + 18) = v22;
    *((_QWORD *)v12 + 19) = v23;
    *((_QWORD *)v12 + 20) = v24;
    *((_QWORD *)v12 + 21) = v25;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)*((_QWORD *)v12 + 22);
    *((_QWORD *)v12 + 22) = v26;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)*((_QWORD *)v12 + 23);
    *((_QWORD *)v12 + 23) = v28;

    objc_msgSend(v12, "setSolvingStyle:", 0);
    objc_msgSend(v12, "setShouldCacheDrawingForResults:", 1);
    objc_storeWeak((id *)v12 + 30, v11);
    objc_storeWeak((id *)v12 + 31, v10);
    objc_storeStrong((id *)v12 + 32, a3);
    v30 = objc_msgSend(v10, "effectiveUserInterfaceLayoutDirection");
    if (v9)
      v9[88] = v30 == 1;
    objc_msgSend(*((id *)v12 + 32), "setDelegate:", v12);
    v31 = (unsigned int *)(v12 + 192);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v32 = 4;
    else
      v32 = 0;
    *v31 = *((_DWORD *)v12 + 48) & 0xFFFFFFFB | v32;
    *v31 = *v31 & 0xFFFFFFFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v33 = 8;
    else
      v33 = 0;
    *v31 = *v31 & 0xFFFFFFF7 | v33;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v34 = 2;
    else
      v34 = 0;
    *v31 = *v31 & 0xFFFFFFFD | v34;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v35 = 16;
    else
      v35 = 0;
    *v31 = *v31 & 0xFFFFFFEF | v35;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v36 = 32;
    else
      v36 = 0;
    *v31 = *v31 & 0xFFFFFFDF | v36;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v37 = 64;
    else
      v37 = 0;
    *v31 = *v31 & 0xFFFFFFBF | v37;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v38 = 128;
    else
      v38 = 0;
    *v31 = *v31 & 0xFFFFFF7F | v38;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v39 = 256;
    else
      v39 = 0;
    *v31 = *v31 & 0xFFFFFEFF | v39;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v40 = 512;
    else
      v40 = 0;
    *v31 = *v31 & 0xFFFFFDFF | v40;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v41 = 1024;
    else
      v41 = 0;
    *v31 = *v31 & 0xFFFFFBFF | v41;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v42 = 2048;
    else
      v42 = 0;
    *v31 = *v31 & 0xFFFFF7FF | v42;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v43 = 4096;
    else
      v43 = 0;
    *v31 = *v31 & 0xFFFFEFFF | v43;
    v44 = objc_opt_respondsToSelector();
    v45 = *v31;
    if ((v44 & 1) != 0)
      v46 = 0x2000;
    else
      v46 = 0;
    v47 = v45 & 0xFFFF9FFF | v46;
    v48 = (4 * v45) & 0x4000;
    if ((v44 & 1) != 0)
      v48 = 0x4000;
    *v31 = v47 | v48;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v49 = 0x8000;
    else
      v49 = 0;
    *v31 = *v31 & 0xFFFF7FFF | v49;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v50 = 0x10000;
    else
      v50 = 0;
    *v31 = *v31 & 0xFFFEFFFF | v50;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v51 = 0x20000;
    else
      v51 = 0;
    *v31 = *v31 & 0xFFFDFFFF | v51;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v52 = 0x40000;
    else
      v52 = 0;
    *v31 = *v31 & 0xFFFBFFFF | v52;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v53 = 0x80000;
    else
      v53 = 0;
    *v31 = *v31 & 0xFFF7FFFF | v53;
    objc_initWeak((id *)buf, v12);
    v54 = MEMORY[0x1E0C809B0];
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __68__PKMathRecognitionViewController_initWithController_view_delegate___block_invoke;
    v60[3] = &unk_1E7778C40;
    objc_copyWeak(&v61, (id *)buf);
    +[PKHoverSettings checkIfHoverIsSupported:](PKHoverSettings, "checkIfHoverIsSupported:", v60);
    objc_msgSend(MEMORY[0x1E0DC3E88], "systemTraitsAffectingColorAppearance");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v54;
    v58[1] = 3221225472;
    v58[2] = __68__PKMathRecognitionViewController_initWithController_view_delegate___block_invoke_2;
    v58[3] = &unk_1E7778F68;
    objc_copyWeak(&v59, (id *)buf);
    v56 = (id)objc_msgSend(v10, "registerForTraitChanges:withHandler:", v55, v58);

    objc_destroyWeak(&v59);
    objc_destroyWeak(&v61);
    objc_destroyWeak((id *)buf);
  }

  return (PKMathRecognitionViewController *)v12;
}

void __68__PKMathRecognitionViewController_initWithController_view_delegate___block_invoke(uint64_t a1, int a2)
{
  id *WeakRetained;
  void *v4;
  int64x2_t *v5;
  id v6;
  _BYTE *v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (a2 && WeakRetained)
  {
    v8 = WeakRetained;
    -[PKMathRecognitionViewController tiledView](WeakRetained);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PKHoverController initWithDelegate:view:]((int64x2_t *)[PKHoverController alloc], v8, v4);
    v6 = v8[25];
    v8[25] = v5;

    v7 = v8[25];
    if (v7)
      v7[427] = 1;

    WeakRetained = v8;
  }

}

- (id)tiledView
{
  id v1;
  id WeakRetained;

  v1 = a1;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 30);
    objc_msgSend(WeakRetained, "mathViewControllerTiledView:", v1);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

void __68__PKMathRecognitionViewController_initWithController_view_delegate___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained[35];
    if (v2)
    {
      v3 = WeakRetained;
      objc_msgSend(*(id *)(v2 + 16), "dismissMenu");
      WeakRetained = v3;
    }
  }

}

- (void)dealloc
{
  NSObject *v3;
  PKMathRecognitionController *controller;
  objc_super v5;
  uint8_t buf[4];
  PKMathRecognitionController *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[PKMathRecognitionViewController removedFromView](self, "removedFromView");
  v3 = os_log_create("com.apple.pencilkit", "Math");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      controller = self->_controller;
    else
      controller = 0;
    *(_DWORD *)buf = 134217984;
    v7 = controller;
    _os_log_impl(&dword_1BE213000, v3, OS_LOG_TYPE_DEFAULT, "Tearing down PKMathRecognitionViewController for: %p", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)PKMathRecognitionViewController;
  -[PKMathRecognitionViewController dealloc](&v5, sel_dealloc);
}

- (id)view
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 31);
  return WeakRetained;
}

- (id)overlayDrawingController
{
  id *v1;
  uint64_t v2;
  id v3;
  id WeakRetained;
  PKOverlayDrawingController *v5;
  id *v6;
  id v7;

  if (a1)
  {
    v1 = a1;
    if (a1[33] || objc_msgSend(a1, "solvingStyle") == 2)
    {
      v2 = objc_msgSend(v1, "solvingStyle");
      v3 = v1[33];
      if (v2 != 2 || !v3)
        goto LABEL_9;
      -[PKOverlayDrawingController removedFromView]((uint64_t)v3);
      WeakRetained = v1[33];
      v1[33] = 0;
    }
    else
    {
      v5 = [PKOverlayDrawingController alloc];
      WeakRetained = objc_loadWeakRetained(v1 + 31);
      v6 = -[PKOverlayDrawingController initForView:delegate:]((id *)&v5->super.isa, WeakRetained, v1);
      v7 = v1[33];
      v1[33] = v6;

    }
    v3 = v1[33];
LABEL_9:
    a1 = (id *)v3;
  }
  return a1;
}

- (void)setSolvingStyle:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableDictionary *currentResultsLookup;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  self->_solvingStyle = a3;
  if (-[PKMathRecognitionViewController solvingStyle](self, "solvingStyle") != 2 && !self->_overlayDrawingController)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[NSMutableDictionary allValues](self->_currentMathItemsLookup, "allValues", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          currentResultsLookup = self->_currentResultsLookup;
          objc_msgSend(v9, "uuid");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](currentResultsLookup, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12 && objc_msgSend(v9, "shouldSolveMathFlagIsSet"))
            -[PKMathRecognitionViewController _presentResult:mathItem:defaultAnimationType:fromHint:hadOldResult:]((uint64_t)self, v12, v9, (void *)2, 0, 1);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

  }
  if (-[PKMathRecognitionViewController solvingStyle](self, "solvingStyle"))
  {
    if (-[PKMathRecognitionViewController solvingStyle](self, "solvingStyle") != 1)
      -[PKOverlayDrawingController removeAllTokens]((uint64_t)self->_overlayDrawingController);
  }
}

- (void)_presentResult:(void *)a3 mathItem:(void *)a4 defaultAnimationType:(char)a5 fromHint:(char)a6 hadOldResult:
{
  NSObject *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double *v15;
  void *v16;
  id v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  _BOOL4 v26;
  const char *v27;
  NSObject *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  BOOL v46;
  void *v50;
  void *v51;
  id newValue;
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  uint64_t v57;
  id v58;
  double *v59;
  id v60[2];
  BOOL v61;
  char v62;
  char v63;
  _QWORD v64[4];
  id WeakRetained;
  uint64_t v66;
  id v67;
  _QWORD aBlock[4];
  id v69;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  id v73;
  uint64_t v74;
  CGRect v75;
  CGRect v76;

  v74 = *MEMORY[0x1E0C80C00];
  newValue = a2;
  v53 = a3;
  if (a1)
  {
    v8 = os_log_create("com.apple.pencilkit", "Math");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v53, "expression");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      v71 = v9;
      v72 = 2113;
      v73 = newValue;
      _os_log_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEFAULT, "Presenting result for expression: %{private}@, result: %{private}@", buf, 0x16u);

    }
    -[PKMathRecognitionViewController tiledView]((id *)a1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "uuid");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMathRecognitionViewController overlayDrawingController]((id *)a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "bounds");
    -[PKOverlayDrawingController viewForUUID:estimatedFrameForNewView:]((uint64_t)v10, v50, v11, v12, v13, v14);
    v15 = (double *)objc_claimAutoreleasedReturnValue();

    if (v15)
      v16 = (void *)*((_QWORD *)v15 + 54);
    else
      v16 = 0;
    v17 = v16;
    if (objc_msgSend(v17, "isEqual:", newValue))
    {
      if (v15)
      {
        v19 = v15[55];
        v18 = v15[56];
        v20 = v15[57];
        v21 = v15[58];
      }
      else
      {
        v18 = 0.0;
        v20 = 0.0;
        v21 = 0.0;
        v19 = 0.0;
      }
      objc_msgSend(v53, "boundsForTriggerStrokes");
      v76.origin.x = v22;
      v76.origin.y = v23;
      v76.size.width = v24;
      v76.size.height = v25;
      v75.origin.x = v19;
      v75.origin.y = v18;
      v75.size.width = v20;
      v75.size.height = v21;
      v26 = CGRectEqualToRect(v75, v76);

      if (v26)
      {
        v28 = os_log_create("com.apple.pencilkit", "Math");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v53, "expression");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138478083;
          v71 = v29;
          v72 = 2113;
          v73 = newValue;
          _os_log_impl(&dword_1BE213000, v28, OS_LOG_TYPE_DEFAULT, "Already had correct result for expression: %{private}@, result: %{private}@", buf, 0x16u);

        }
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {

    }
    -[PKOverlayDrawingView hideImageViewWithDuration:]((uint64_t)v15, v27, 0.1);
    if (v15)
    {
      objc_setProperty_nonatomic_copy(v15, v30, newValue, 432);
      objc_msgSend(v53, "boundsForTriggerStrokes");
      *((_QWORD *)v15 + 55) = v31;
      *((_QWORD *)v15 + 56) = v32;
      *((_QWORD *)v15 + 57) = v33;
      *((_QWORD *)v15 + 58) = v34;
    }
    else
    {
      objc_msgSend(v53, "boundsForTriggerStrokes");
    }
    v46 = *(_QWORD *)(a1 + 88) != 0;
    objc_initWeak((id *)buf, (id)a1);
    objc_msgSend(v51, "inputScale");
    v36 = v35;
    v37 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke;
    aBlock[3] = &unk_1E777BFC8;
    v38 = newValue;
    v69 = v38;
    v39 = _Block_copy(aBlock);
    if ((*(_BYTE *)(a1 + 194) & 8) != 0)
    {
      v64[0] = v37;
      v64[1] = 3221225472;
      v64[2] = __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_2;
      v64[3] = &unk_1E777BFF0;
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 240));
      v66 = a1;
      v67 = v50;
      v40 = WeakRetained;
      v41 = _Block_copy(v64);

      v39 = v41;
    }
    -[PKMathRecognitionViewController recognitionManager](*(id **)(a1 + 256));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMathRecognitionViewController drawing]((id *)a1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_loadWeakRetained((id *)(a1 + 248));
    objc_msgSend(v44, "tintColor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v37;
    v54[1] = 3221225472;
    v54[2] = __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_3;
    v54[3] = &unk_1E777C0B8;
    objc_copyWeak(v60, (id *)buf);
    v55 = v53;
    v56 = v38;
    v57 = a1;
    v61 = v46;
    v62 = a5;
    v58 = v51;
    v59 = v15;
    v60[1] = a4;
    v63 = a6;
    -[PKRecognitionSessionManager synthesizeDrawingForMathResultBlock:fallbackText:drawing:mathItem:inkColor:inputScale:completion:]((uint64_t)v42, v39, v56, v43, v55, v45, v54, v36);

    objc_destroyWeak(v60);
    objc_destroyWeak((id *)buf);
    goto LABEL_19;
  }
LABEL_20:

}

- (id)drawing
{
  id v1;
  id WeakRetained;

  v1 = a1;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 30);
    objc_msgSend(WeakRetained, "mathViewControllerDrawing:", v1);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (void)drawingTransformFromDelegate
{
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a2 + 240));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "mathViewControllerDrawingTransform:", a2);
    WeakRetained = v5;
  }
  else
  {
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
  }

}

- (void)drawingTransform
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  __int128 v8;
  _OWORD v9[3];

  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  if (a2)
  {
    -[PKMathRecognitionViewController drawingTransformFromDelegate](a1, a2);
    if ((*(_BYTE *)(a2 + 192) & 0x10) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a2 + 240));
      -[PKMathRecognitionViewController drawing]((id *)a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "mathViewController:coordinateSpaceForDrawing:", a2, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = objc_loadWeakRetained((id *)(a2 + 248));
        PK_transformToConvertFromCoordinateSpaceToCoordinateSpace(v6, v7, v9);
        v8 = v9[1];
        *a1 = v9[0];
        a1[1] = v8;
        a1[2] = v9[2];

      }
    }
  }
}

- (id)recognitionManager
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 13);
  return WeakRetained;
}

- (void)layoutSubviews
{
  double width;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  id v9;

  width = self->_currentViewBounds.size.width;
  -[PKMathRecognitionViewController view]((id *)&self->super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  self->_currentViewBounds.origin.x = v5;
  self->_currentViewBounds.origin.y = v6;
  self->_currentViewBounds.size.width = v7;
  self->_currentViewBounds.size.height = v8;

  if (vabdd_f64(width, self->_currentViewBounds.size.width) >= 0.00999999978)
    -[PKMathRecognitionViewController dismissPopovers](self, "dismissPopovers");
  -[PKMathRecognitionViewController overlayDrawingController]((id *)&self->super.isa);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PKOverlayDrawingController viewDidLayout]((uint64_t)v9);

}

- (void)redrawSubviews
{
  void *v2;
  id v3;

  -[PKMathRecognitionViewController overlayDrawingController]((id *)&self->super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "_updateDrawingViews");
    v2 = v3;
  }

}

- (id)overlayViews
{
  id *v2;
  void *v3;

  -[PKMathRecognitionViewController overlayDrawingController]((id *)&self->super.isa);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKOverlayDrawingController allViews](v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)resultViewForItemUUID:(id)a3
{
  id v4;
  id *v5;
  id *v6;
  void *v7;

  v4 = a3;
  -[PKMathRecognitionViewController overlayDrawingController]((id *)&self->super.isa);
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKOverlayDrawingController existingViewForUUID:](v5, (uint64_t)v4);
  v6 = (id *)objc_claimAutoreleasedReturnValue();

  -[PKOverlayDrawingView imageView](v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)removedFromView
{
  UIEditMenuInteraction *alternativedEditMenuInteraction;
  void *v4;
  UIEditMenuInteraction *v5;
  NSUUID *popoverHintItemUUID;
  NSUUID *addGraphItemUUID;

  alternativedEditMenuInteraction = self->_alternativedEditMenuInteraction;
  if (alternativedEditMenuInteraction)
  {
    -[UIEditMenuInteraction view](alternativedEditMenuInteraction, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeInteraction:", self->_alternativedEditMenuInteraction);

    v5 = self->_alternativedEditMenuInteraction;
    self->_alternativedEditMenuInteraction = 0;

  }
  -[PKOverlayDrawingController removedFromView]((uint64_t)self->_overlayDrawingController);
  if (self->_scrubberController)
    -[PKMathRecognitionViewController hideScrubber](self, "hideScrubber");
  if (self->_mathFloatingLabelView)
    -[PKMathRecognitionViewController hideMathFloatingLabelView](self, "hideMathFloatingLabelView");
  if (self->_typesetViewController)
    -[PKMathRecognitionViewController _cleanupTypesetViewController]((uint64_t)self);
  popoverHintItemUUID = self->_popoverHintItemUUID;
  self->_popoverHintItemUUID = 0;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_openPopoverForHint, 0);
  addGraphItemUUID = self->_addGraphItemUUID;
  self->_addGraphItemUUID = 0;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_openPopoverForAddingGraph, 0);
}

- (void)_cleanupTypesetViewController
{
  void *v2;
  id WeakRetained;
  void *v4;

  if (a1)
  {
    v2 = *(void **)(a1 + 48);
    if (v2)
    {
      if ((*(_BYTE *)(a1 + 194) & 4) != 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 240));
        objc_msgSend(WeakRetained, "mathViewControllerDidDismissPopoverUI:", a1);

        v2 = *(void **)(a1 + 48);
      }
    }
    *(_QWORD *)(a1 + 48) = 0;

    objc_msgSend(*(id *)(a1 + 56), "_setVisibilityUpdatesEnabled:", 1);
    v4 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = 0;

  }
}

- (uint64_t)cancelOpenPopoverForHint
{
  uint64_t v1;
  void *v2;

  if (result)
  {
    v1 = result;
    v2 = *(void **)(result + 120);
    *(_QWORD *)(result + 120) = 0;

    return objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", v1, sel_openPopoverForHint, 0);
  }
  return result;
}

- (uint64_t)cancelOpenPopoverForAddingGraph
{
  uint64_t v1;
  void *v2;

  if (result)
  {
    v1 = result;
    v2 = *(void **)(result + 128);
    *(_QWORD *)(result + 128) = 0;

    return objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", v1, sel_openPopoverForAddingGraph, 0);
  }
  return result;
}

- (void)_updateDrawingOverlayCache
{
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[PKMathRecognitionViewController shouldCacheDrawingForResults](self, "shouldCacheDrawingForResults"))
  {
    -[PKMathRecognitionViewController overlayDrawingController]((id *)&self->super.isa);
    v3 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKMathRecognitionViewController drawing]((id *)&self->super.isa);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKOverlayDrawingController drawingForAllResultsForSourceDrawing:](v3, v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    +[PKDrawingOverlayCache sharedCache](PKDrawingOverlayCache, "sharedCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMathRecognitionViewController drawing]((id *)&self->super.isa);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDrawingOverlayCache setOverlayDrawing:forDrawingUUID:]((uint64_t)v5, v8, v7);

  }
}

- (void)setTokens:(id)a3 forItem:(id)a4
{
  id v6;
  _BOOL4 v7;
  id v8;

  v6 = a4;
  v8 = a3;
  v7 = -[PKMathRecognitionItem isGraphable]((uint64_t)v6);
  -[PKMathRecognitionViewController setTokens:forItem:graphable:]((uint64_t)self, v8, v6, v7);

}

- (void)setTokens:(void *)a3 forItem:(int)a4 graphable:
{
  _BYTE *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _BYTE *v11;
  _QWORD *v12;
  PKMathRecognitionToken *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PKMathRecognitionError *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  double x;
  double y;
  double width;
  double height;
  const char *v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  BOOL v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  const char *v60;
  int v61;
  int v62;
  void *v63;
  void *v64;
  _BOOL4 v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t j;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  id obj;
  void *v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE buf[12];
  __int16 v93;
  void *v94;
  __int16 v95;
  int v96;
  _QWORD v97[4];
  CGRect v98;

  v97[1] = *MEMORY[0x1E0C80C00];
  obj = a2;
  v7 = a3;
  if (!a1)
    goto LABEL_66;
  v8 = os_log_create("com.apple.pencilkit", "Math");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(obj, "count");
    objc_msgSend(v7, "expression");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218499;
    *(_QWORD *)&buf[4] = v9;
    v93 = 2113;
    v94 = v10;
    v95 = 1024;
    v96 = a4;
    _os_log_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEFAULT, "Set tokens: %lu, %{private}@, graphable: %{BOOL}d", buf, 0x1Cu);

  }
  if (objc_msgSend(v7, "isLowConfidenceMath"))
  {
    v11 = v7;
    v12 = v11;
    if (v11)
      *((_WORD *)v11 + 24) = 1;
    v13 = objc_alloc_init(PKMathRecognitionToken);
    -[PKMathRecognitionToken setItem:](v13, "setItem:", v12);
    objc_msgSend(v12, "expression");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMathRecognitionToken setText:](v13, "setText:", v14);

    objc_msgSend(v12, "expression");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMathRecognitionToken setCharacterRange:](v13, "setCharacterRange:", 0, objc_msgSend(v15, "length"));

    objc_msgSend(v12, "bounds");
    -[PKMathRecognitionToken setBounds:](v13, "setBounds:");
    _PencilKitBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Unsupported or unrecognized math"), CFSTR("Unsupported or unrecognized math"), CFSTR("Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_alloc_init(PKMathRecognitionError);
    -[PKMathRecognitionError setErrorString:](v18, "setErrorString:", v17);
    *(_QWORD *)buf = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMathRecognitionToken setErrors:](v13, "setErrors:", v19);

    v20 = -[PKMathRecognitionItem characterRangeForTriggerSymbol](v12);
    if (v20 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v22 = v20;
      v23 = v21;
      -[PKMathRecognitionItem _strokeIndexesForCharacterRange:]((uint64_t)v12, v20, v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v98.origin.x = -[PKMathRecognitionItem _boundsForStrokeIndexes:](v12, v24);
      x = v98.origin.x;
      y = v98.origin.y;
      width = v98.size.width;
      height = v98.size.height;
      if (!CGRectIsNull(v98))
      {
        -[PKMathRecognitionToken setCharacterRange:](v13, "setCharacterRange:", v22, v23);
        -[PKMathRecognitionToken setBounds:](v13, "setBounds:", x, y, width, height);
      }

    }
    v97[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_setProperty_nonatomic_copy(v12, v29, v30, 96);

    if ((!objc_msgSend((id)a1, "solvingStyle") || objc_msgSend((id)a1, "solvingStyle") == 1)
      && ((-[PKMathRecognitionItem isRecentlyModified]((double *)v12) & 1) != 0
       || (-[PKMathRecognitionViewController overlayDrawingController]((id *)a1),
           v31 = (void *)objc_claimAutoreleasedReturnValue(),
           objc_msgSend(v12, "uuid"),
           v32 = (void *)objc_claimAutoreleasedReturnValue(),
           v33 = -[PKOverlayDrawingController hasVisibleTokensForItem:]((uint64_t)v31, (uint64_t)v32),
           v32,
           v31,
           v33)))
    {
      -[PKMathRecognitionViewController overlayDrawingController]((id *)a1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        v35 = (void *)v12[12];
      else
        v35 = 0;
      v36 = v35;
      -[PKOverlayDrawingController setTokens:item:]((uint64_t)v34, v36, v12);

    }
    else
    {
      -[PKMathRecognitionViewController overlayDrawingController]((id *)a1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKOverlayDrawingController removeTokensFor:]((uint64_t)v34, v12);
    }

    goto LABEL_66;
  }
  v78 = a4;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v7;
  objc_msgSend(v7, "expression");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v38, "length");

  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  obj = obj;
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v91, 16);
  if (!v39)
    goto LABEL_49;
  v40 = v39;
  v41 = *(_QWORD *)v87;
  do
  {
    for (i = 0; i != v40; ++i)
    {
      if (*(_QWORD *)v87 != v41)
        objc_enumerationMutation(obj);
      v43 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
      objc_msgSend(v43, "setItem:", v37);
      v44 = objc_msgSend(v43, "characterRange");
      v46 = v44;
      if (!v45)
      {
        v49 = 0;
        goto LABEL_38;
      }
      v47 = v45;
      if (v44)
        v48 = 0;
      else
        v48 = v45 == v81;
      if (v48)
      {
        objc_msgSend(v43, "errors");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v51, "count");

        if (v50)
        {
          v52 = -[PKMathRecognitionItem characterRangeForTriggerSymbol](v37);
          if (v52 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v50 = v52;
            v49 = v53;
            objc_msgSend(v43, "setCharacterRange:", v52, v53);
            v46 = v50;
            v47 = v49;
            goto LABEL_37;
          }
          v50 = 0;
        }
        v49 = v81;
      }
      else
      {
        v49 = v45;
        v50 = v44;
      }
LABEL_37:
      -[PKMathRecognitionItem _strokeIndexesForCharacterRange:]((uint64_t)v37, v46, v47);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setBounds:", -[PKMathRecognitionItem _boundsForStrokeIndexes:](v37, v54));

      v46 = v50;
LABEL_38:
      if (*(_BYTE *)(a1 + 106))
        objc_msgSend(v43, "setErrors:", 0);
      objc_msgSend(v43, "errors");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "count");

      if (v56)
      {
        if (!v49 || v46 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v59 = os_log_create("com.apple.pencilkit", "Math");
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BE213000, v59, OS_LOG_TYPE_DEFAULT, "Invalid range for error token", buf, 2u);
          }

        }
        else
        {
          v57 = objc_msgSend(v43, "characterRange");
          objc_msgSend(v80, "addIndexesInRange:", v57, v58);
        }
      }
    }
    v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v91, 16);
  }
  while (v40);
LABEL_49:

  if (*(_BYTE *)(a1 + 105))
  {
    v7 = v37;
    v61 = v78;
    if (v37)
      goto LABEL_51;
  }
  else
  {
    v7 = v37;
    -[PKMathRecognitionItem alternativesTokens]((uint64_t)v37);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v67, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      v85 = 0u;
      v69 = v67;
      v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
      if (v70)
      {
        v71 = v70;
        v72 = *(_QWORD *)v83;
        do
        {
          for (j = 0; j != v71; ++j)
          {
            if (*(_QWORD *)v83 != v72)
              objc_enumerationMutation(v69);
            v74 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * j);
            v75 = objc_msgSend(v74, "characterRange");
            if ((objc_msgSend(v80, "containsIndexesInRange:", v75, v76) & 1) == 0)
              objc_msgSend(v68, "addObject:", v74);
          }
          v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
        }
        while (v71);
      }

      if (objc_msgSend(v68, "count"))
      {
        objc_msgSend(obj, "arrayByAddingObjectsFromArray:", v68);
        v77 = objc_claimAutoreleasedReturnValue();

        obj = (id)v77;
      }
      v61 = v78;

    }
    else
    {
      v61 = v78;
    }

    if (v37)
LABEL_51:
      objc_setProperty_nonatomic_copy(v7, v60, obj, 96);
  }
  if (v61)
    v62 = -[PKMathRecognitionItem hasAnyErrors]((uint64_t)v7) ^ 1;
  else
    LOBYTE(v62) = 0;
  if (v7)
  {
    v7[48] = 1;
    v7[49] = v62;
  }
  if ((!objc_msgSend((id)a1, "solvingStyle") || objc_msgSend((id)a1, "solvingStyle") == 1)
    && ((-[PKMathRecognitionItem isRecentlyModified]((double *)v7) & 1) != 0
     || (-[PKMathRecognitionViewController overlayDrawingController]((id *)a1),
         v63 = (void *)objc_claimAutoreleasedReturnValue(),
         objc_msgSend(v7, "uuid"),
         v64 = (void *)objc_claimAutoreleasedReturnValue(),
         v65 = -[PKOverlayDrawingController hasVisibleTokensForItem:]((uint64_t)v63, (uint64_t)v64),
         v64,
         v63,
         v65)))
  {
    -[PKMathRecognitionViewController overlayDrawingController]((id *)a1);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKOverlayDrawingController setTokens:item:]((uint64_t)v66, obj, v7);
  }
  else
  {
    -[PKMathRecognitionViewController overlayDrawingController]((id *)a1);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKOverlayDrawingController removeTokensFor:]((uint64_t)v66, v7);
  }

LABEL_66:
}

- (void)setTokens:(id)a3 forItemUUID:(id)a4 graphable:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  id v9;

  v5 = a5;
  v9 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_currentMathItemsLookup, "objectForKeyedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    -[PKMathRecognitionViewController setTokens:forItem:graphable:]((uint64_t)self, v9, v8, v5);

}

- (void)_scrubVariable:(void *)a3 item:(uint64_t)a4 openAsCompact:
{
  _QWORD *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double x;
  double y;
  double width;
  double height;
  id WeakRetained;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  id v45;
  id v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  PKLiveMathVariable *v52;
  void *v53;
  id v54;
  _QWORD *v55;
  id v56;
  id v57;
  CGPoint v58;
  CGSize v59;
  void *v60;
  void *v61;
  id v62;
  NSArray *v63;
  NSArray *originalStrokes;
  NSArray *v65;
  uint64_t v66;
  PKDrawing *originalStrokesDrawing;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  double v74;
  CGFloat v75;
  void *v76;
  void *v77;
  id v78;
  id obj;
  id v80;
  void *v81;
  CGAffineTransform v82;
  CGAffineTransform buf;
  uint64_t v84;
  CGRect v85;
  CGRect v86;

  v84 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  if (a1)
  {
    objc_msgSend((id)a1, "hideScrubber");
    objc_msgSend(v9, "expression");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    obj = a2;
    if (v8)
    {
      v12 = v8[5];
      v13 = v8[6];
    }
    else
    {
      v13 = 0;
      v12 = 0;
    }
    objc_msgSend(v10, "substringWithRange:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = os_log_create("com.apple.pencilkit", "Math");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "expression");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.a) = 138478083;
      *(_QWORD *)((char *)&buf.a + 4) = v16;
      WORD2(buf.b) = 2113;
      *(_QWORD *)((char *)&buf.b + 6) = v14;
      _os_log_impl(&dword_1BE213000, v15, OS_LOG_TYPE_DEFAULT, "Opening scrubber for expression: %{private}@, variable: %{private}@", (uint8_t *)&buf, 0x16u);

    }
    memset(&buf, 0, sizeof(buf));
    -[PKMathRecognitionViewController drawingTransform](&buf, a1);
    v80 = a3;
    if (v8)
      v17 = (void *)v8[4];
    else
      v17 = 0;
    v18 = v17;
    v19 = -[PKMathRecognitionItem _boundsForStrokeIndexes:](v9, v18);
    v21 = v20;
    v23 = v22;
    v25 = v24;

    v82 = buf;
    v85.origin.x = v19;
    v85.origin.y = v21;
    v85.size.width = v23;
    v85.size.height = v25;
    v86 = CGRectApplyAffineTransform(v85, &v82);
    x = v86.origin.x;
    y = v86.origin.y;
    width = v86.size.width;
    height = v86.size.height;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 248));
    objc_msgSend(WeakRetained, "window");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "rootViewController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "view");
    v33 = objc_claimAutoreleasedReturnValue();

    v34 = objc_loadWeakRetained((id *)(a1 + 240));
    objc_msgSend(v34, "mathViewController:createScrubberControllerForView:delegate:", a1, v33, a1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = objc_loadWeakRetained((id *)(a1 + 248));
    v81 = (void *)v33;
    objc_msgSend(v36, "convertRect:toView:", v33, x, y, width, height);
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v44 = v43;

    objc_storeStrong((id *)(a1 + 64), v35);
    *(_BYTE *)(a1 + 72) = a4;
    if ((*(_BYTE *)(a1 + 194) & 2) != 0)
    {
      v45 = objc_loadWeakRetained((id *)(a1 + 240));
      objc_msgSend(v45, "mathViewController:willPresentPopoverUI:", a1, 0);

    }
    v46 = objc_loadWeakRetained((id *)(a1 + 248));
    objc_msgSend(v46, "window");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKToolPicker activeToolPickerForWindow:](PKToolPicker, "activeToolPickerForWindow:", v47);
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = v48;

    objc_msgSend(*(id *)(a1 + 56), "_setVisibilityUpdatesEnabled:", 0);
    v50 = *(void **)(a1 + 64);
    -[PKMathRecognitionItem _stringForVariable:](v9, v8);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "showScrubberFor:frame:compact:", v51, a4, v38, v40, v42, v44);

    v52 = [PKLiveMathVariable alloc];
    -[PKMathRecognitionViewController drawing]((id *)a1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v53;
    v55 = v8;
    v56 = v9;
    if (v52)
    {
      *(_QWORD *)&v82.a = v52;
      *(_QWORD *)&v82.b = PKLiveMathVariable;
      v57 = -[CGAffineTransform init]((objc_super *)&v82, sel_init);
      v52 = (PKLiveMathVariable *)v57;
      if (v57)
      {
        v78 = v9;
        objc_storeStrong((id *)v57 + 2, v53);
        objc_storeStrong((id *)&v52->_variable, obj);
        objc_storeStrong((id *)&v52->_mathItem, v80);
        v58 = (CGPoint)*MEMORY[0x1E0C9D628];
        v59 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
        v52->_calculatedFitBounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
        v52->_calculatedFitBounds.size = v59;
        v52->_calculatedFitBoundsForExtraLeadingSlack.origin = v58;
        v52->_calculatedFitBoundsForExtraLeadingSlack.size = v59;
        v77 = v35;
        v60 = v14;
        if (v8)
          v61 = (void *)v55[4];
        else
          v61 = 0;
        v62 = v61;
        -[PKMathRecognitionItem _strokesForStrokeIndexes:](v56, v62);
        v63 = (NSArray *)objc_claimAutoreleasedReturnValue();

        originalStrokes = v52->_originalStrokes;
        v52->_originalStrokes = v63;
        v65 = v63;

        v66 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStrokes:fromDrawing:", v65, v54);
        originalStrokesDrawing = v52->_originalStrokesDrawing;
        v52->_originalStrokesDrawing = (PKDrawing *)v66;

        -[PKDrawing bounds](v52->_originalStrokesDrawing, "bounds");
        v69 = v68;
        v71 = v70;
        v73 = v72;
        v75 = v74;

        v52->_originalStrokesBounds.origin.x = v69;
        v52->_originalStrokesBounds.origin.y = v71;
        v52->_originalStrokesBounds.size.width = v73;
        v52->_originalStrokesBounds.size.height = v75;
        v14 = v60;
        v35 = v77;
        v9 = v78;
      }
    }

    v76 = *(void **)(a1 + 88);
    *(_QWORD *)(a1 + 88) = v52;

    if (*(_BYTE *)(a1 + 72))
      objc_msgSend((id)a1, "performSelector:withObject:afterDelay:", sel_hideScrubber, 0, 3.0);

  }
}

- (void)_triggerPopupToAddGraphForItem:(uint64_t)a1
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  os_log_t v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double MidY;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  double v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  double MinY;
  double MidX;
  uint8_t buf[16];
  float64x2_t v36;
  float64x2_t v37;
  uint64_t v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 128);
    *(_QWORD *)(a1 + 128) = 0;

    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", a1, sel_openPopoverForAddingGraph, 0);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 248));
    objc_msgSend(WeakRetained, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v16 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BE213000, v16, OS_LOG_TYPE_ERROR, "No window when trying to open popover to graph.", buf, 2u);
      }
      goto LABEL_17;
    }
    if ((*(_BYTE *)(a1 + 192) & 4) != 0)
    {
      v39.origin.x = -[PKMathRecognitionItem boundsForAnyEqualSign](v3);
      x = v39.origin.x;
      y = v39.origin.y;
      width = v39.size.width;
      height = v39.size.height;
      if (!CGRectIsNull(v39))
      {
        v11 = os_log_create("com.apple.pencilkit", "Math");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v3, "expression");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138477827;
          *(_QWORD *)&buf[4] = v12;
          _os_log_impl(&dword_1BE213000, v11, OS_LOG_TYPE_DEFAULT, "Open popover to graph: %{private}@", buf, 0xCu);

        }
        v40.origin.x = x;
        v40.origin.y = y;
        v40.size.width = width;
        v40.size.height = height;
        MidX = CGRectGetMidX(v40);
        v41.origin.x = x;
        v41.origin.y = y;
        v41.size.width = width;
        v41.size.height = height;
        MinY = CGRectGetMinY(v41);
        v36 = 0u;
        v37 = 0u;
        *(_OWORD *)buf = 0u;
        -[PKMathRecognitionViewController drawingTransform](buf, a1);
        v30 = v36;
        v31 = v37;
        v32 = *(float64x2_t *)buf;
        v13 = v3;
        v14 = v13;
        if ((*(_BYTE *)(a1 + 192) & 2) != 0)
        {
          v42.origin.x = -[PKMathRecognitionItem boundsForAnyEqualSign](v13);
          v17 = v42.origin.x;
          v18 = v42.origin.y;
          v19 = v42.size.width;
          v20 = v42.size.height;
          v29 = CGRectGetMidX(v42);
          v43.origin.x = v17;
          v43.origin.y = v18;
          v43.size.width = v19;
          v43.size.height = v20;
          MidY = CGRectGetMidY(v43);
          v22 = objc_loadWeakRetained((id *)(a1 + 240));
          objc_msgSend(v22, "mathViewController:expressionIdentifiersForExistingGraphNearLocation:", a1, v29, MidY);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            objc_msgSend(v14, "uuid");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "UUIDString");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v23, "containsObject:", v25) ^ 1;

          }
          else
          {
            v15 = 0;
          }

        }
        else
        {
          v15 = 0;
        }

        v26 = objc_loadWeakRetained((id *)(a1 + 248));
        +[PKMathContextMenuController insertGraphControllerForItem:tapBounds:alsoShowAddToExisiting:view:delegate:](x, y, width, height, (uint64_t)PKMathContextMenuController, v14, v15, v26, (void *)a1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = *(void **)(a1 + 280);
        *(_QWORD *)(a1 + 280) = v27;
        v16 = v27;

        if (v16)
          -[objc_class _presentMenuAtLocation:](v16[2].isa, "_presentMenuAtLocation:", vaddq_f64(v31, vmlaq_n_f64(vmulq_n_f64(v30, MinY), v32, MidX)));
LABEL_17:

      }
    }
  }

}

- (void)setContextMenuController:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 280), a2);
}

- (void)openPopoverForAddingGraph
{
  void *v3;
  NSUUID *addGraphItemUUID;
  NSObject *v5;
  double v6;
  double v7;
  double v8;
  NSObject *v9;
  NSObject *v10;
  NSMutableSet *expressionsWeCreatedGraphsFor;
  void *v12;
  int v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_addGraphItemUUID)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_currentMathItemsLookup, "objectForKeyedSubscript:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    addGraphItemUUID = self->_addGraphItemUUID;
    self->_addGraphItemUUID = 0;

    if (self->_contextMenuController)
    {
      v5 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEFAULT, "Context menu already open when trying to open popover for graphing.", (uint8_t *)&v13, 2u);
      }

    }
    else if (v3 && -[PKMathRecognitionItem isGraphable]((uint64_t)v3))
    {
      if (os_variant_has_internal_ui())
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v7 = v6;
        v8 = -[PKMathRecognitionItem mostRecentStrokeTimestamp](v3);
        _PKSignpostLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v9))
        {
          v13 = 134217984;
          v14 = v7 - v8;
          _os_signpost_emit_with_name_impl(&dword_1BE213000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MathRecognitionToInsertGraph", "%f", (uint8_t *)&v13, 0xCu);
        }

        v10 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          LOWORD(v13) = 0;
          _os_log_impl(&dword_1BE213000, v10, OS_LOG_TYPE_INFO, "DISCRETE \"MathRecognitionToInsertGraph\", (uint8_t *)&v13, 2u);
        }

      }
      expressionsWeCreatedGraphsFor = self->_expressionsWeCreatedGraphsFor;
      objc_msgSend(v3, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](expressionsWeCreatedGraphsFor, "addObject:", v12);

      -[PKMathRecognitionViewController _triggerPopupToAddGraphForItem:]((uint64_t)self, v3);
    }

  }
}

- (void)openPopoverForHint
{
  void *v3;
  NSUUID *popoverHintItemUUID;
  NSObject *v5;
  double v6;
  double v7;
  double v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_popoverHintItemUUID)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_currentMathItemsLookup, "objectForKeyedSubscript:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    popoverHintItemUUID = self->_popoverHintItemUUID;
    self->_popoverHintItemUUID = 0;

    if (self->_contextMenuController)
    {
      v5 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEFAULT, "Context menu already open when trying to open popover for hint.", (uint8_t *)&v11, 2u);
      }

    }
    else if (v3)
    {
      if (os_variant_has_internal_ui())
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v7 = v6;
        v8 = -[PKMathRecognitionItem mostRecentStrokeTimestamp](v3);
        _PKSignpostLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v9))
        {
          v11 = 134217984;
          v12 = v7 - v8;
          _os_signpost_emit_with_name_impl(&dword_1BE213000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MathRecognitionToHint", "%f", (uint8_t *)&v11, 0xCu);
        }

        v10 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          LOWORD(v11) = 0;
          _os_log_impl(&dword_1BE213000, v10, OS_LOG_TYPE_INFO, "DISCRETE \"MathRecognitionToHint\", (uint8_t *)&v11, 2u);
        }

      }
      -[PKMathRecognitionViewController _showDetectionAnimationForItem:](self, v3);
      -[PKMathRecognitionViewController _triggerPopupToSolveItem:supportCopy:]((uint64_t)self, v3, 0);
    }

  }
}

- (void)_showDetectionAnimationForItem:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id location;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;

  v3 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    -[PKMathRecognitionViewController tiledView]((id *)a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "strokes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count")
      && objc_msgSend(v3, "shouldBeSolved")
      && -[PKMathRecognitionItem isRecentlyModified]((double *)v3))
    {
      -[PKMathRecognitionViewController drawing]((id *)a1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __66__PKMathRecognitionViewController__showDetectionAnimationForItem___block_invoke;
      v16[3] = &unk_1E777BFA0;
      v16[0] = MEMORY[0x1E0C809B0];
      objc_copyWeak(&v18, &location);
      v16[4] = a1;
      v17 = v4;
      v8 = v5;
      v9 = v6;
      v10 = v16;
      -[PKMathRecognitionViewController tiledView]((id *)a1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v7;
      v20[1] = 3221225472;
      v20[2] = __75__PKMathRecognitionViewController__maskImageForStrokes_drawing_completion___block_invoke;
      v20[3] = &unk_1E777BF78;
      v21 = v11;
      v12 = v8;
      v22 = v12;
      v13 = v9;
      v23 = v13;
      v14 = v10;
      v24 = v14;
      v15 = v11;
      -[PKMathRecognitionViewController _imageViewForStrokes:drawing:completion:]((uint64_t)a1, v12, v13, v20);

      objc_destroyWeak(&v18);
    }

    objc_destroyWeak(&location);
  }

}

- (void)_triggerPopupToSolveItem:(char)a3 supportCopy:
{
  id v5;
  void *v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double MidY;
  id v22;
  void *v23;
  void *v24;
  double MidX;
  CGAffineTransform v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v6 = *(void **)(a1 + 120);
    *(_QWORD *)(a1 + 120) = 0;

    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", a1, sel_openPopoverForHint, 0);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 248));
    objc_msgSend(WeakRetained, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = os_log_create("com.apple.pencilkit", "Math");
    v10 = v9;
    if (!v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BE213000, v10, OS_LOG_TYPE_ERROR, "No window when trying to trigger popup to solve.", buf, 2u);
      }
      goto LABEL_10;
    }
    v11 = v9;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "expression");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v28 = v12;
      _os_log_impl(&dword_1BE213000, v11, OS_LOG_TYPE_DEFAULT, "Trigger popover to solve: %{private}@", buf, 0xCu);

    }
    objc_msgSend(v5, "boundsForTriggerStrokes");
    x = v30.origin.x;
    y = v30.origin.y;
    width = v30.size.width;
    height = v30.size.height;
    if (!CGRectIsNull(v30))
    {
      -[PKMathRecognitionViewController drawingTransform](&v26, a1);
      v31.origin.x = x;
      v31.origin.y = y;
      v31.size.width = width;
      v31.size.height = height;
      v32 = CGRectApplyAffineTransform(v31, &v26);
      v17 = v32.origin.x;
      v18 = v32.origin.y;
      v19 = v32.size.width;
      v20 = v32.size.height;
      MidX = CGRectGetMidX(v32);
      v33.origin.x = v17;
      v33.origin.y = v18;
      v33.size.width = v19;
      v33.size.height = v20;
      MidY = CGRectGetMidY(v33);
      v22 = objc_loadWeakRetained((id *)(a1 + 248));
      +[PKMathContextMenuController mathSolvingControllerForItem:tapBounds:supportCopy:view:delegate:](x, y, width, height, (uint64_t)PKMathContextMenuController, v5, a3, v22, (void *)a1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = *(void **)(a1 + 280);
      *(_QWORD *)(a1 + 280) = v23;
      v10 = v23;

      if (v10)
        -[objc_class _presentMenuAtLocation:](v10[2].isa, "_presentMenuAtLocation:", MidX, MidY);
LABEL_10:

    }
  }

}

- (BOOL)handleSingleTapAtDrawingLocation:(CGPoint)a3
{
  return -[PKMathRecognitionViewController _handleSingleTapAtDrawingLocation:fromHover:]((uint64_t)self, 0, a3.x, a3.y);
}

- (uint64_t)_handleSingleTapAtDrawingLocation:(double)a3 fromHover:(double)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t i;
  _BYTE *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  void *v29;
  id v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  uint64_t v38;
  id *v39;
  void *v40;
  double y;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  id *v48;
  void *v49;
  uint64_t v50;
  id v51;
  CGFloat x;
  CGFloat v53;
  CGFloat width;
  CGFloat height;
  void *v56;
  id WeakRetained;
  void *v58;
  uint64_t v59;
  void *v60;
  id v61;
  id v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  BOOL v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  CGFloat v79;
  double v80;
  CGFloat v81;
  double v82;
  CGFloat v83;
  double v84;
  CGFloat v85;
  void *v86;
  id *v87;
  id *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  id *v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  id *v97;
  void *v98;
  void *v99;
  NSObject *v100;
  double v101;
  double v102;
  double v103;
  double v104;
  void *v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  void *v114;
  double v115;
  CGFloat v116;
  double v117;
  CGFloat v118;
  double v119;
  CGFloat v120;
  double v121;
  CGFloat v122;
  CGFloat v123;
  CGFloat v124;
  CGFloat v125;
  CGFloat v126;
  void *v127;
  id *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  uint64_t v134;
  void *v135;
  void *v136;
  id *v137;
  void *v138;
  double v139;
  CGFloat v140;
  double v141;
  CGFloat v142;
  double v143;
  CGFloat v144;
  double v145;
  CGFloat v146;
  void *v147;
  id *v148;
  double v149;
  double v150;
  double v151;
  double v152;
  CGFloat v153;
  CGFloat v154;
  CGFloat v155;
  CGFloat v156;
  void *v157;
  CGFloat v158;
  CGFloat v159;
  CGFloat v160;
  CGFloat v161;
  void *v162;
  unsigned int v163;
  void *v164;
  _QWORD *v165;
  id *v166;
  id *v167;
  uint64_t v168;
  CGPoint point;
  double MinY;
  void *v172;
  double v174;
  double MidX;
  void *v176;
  CGAffineTransform v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  _QWORD block[5];
  _QWORD *v183;
  id *v184;
  char v185;
  float64x2_t v186[3];
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  CGAffineTransform v195;
  float64x2_t v196[3];
  unsigned __int8 v197;
  CGAffineTransform v198;
  _BYTE v199[128];
  _BYTE v200[128];
  _BYTE v201[128];
  CGAffineTransform buf;
  uint64_t v203;
  CGPoint v204;
  CGPoint v205;
  CGRect v206;
  CGRect v207;
  CGRect v208;
  CGRect v209;
  CGRect v210;
  CGRect v211;
  CGRect v212;
  CGRect v213;
  CGRect v214;
  CGRect v215;
  CGRect v216;
  CGRect v217;
  CGRect v218;

  v203 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    if (objc_msgSend((id)result, "solvingStyle") && objc_msgSend((id)v5, "solvingStyle") != 1)
      return 0;
    objc_msgSend(*(id *)(v5 + 256), "processDelayedItemsIfNecessary");
    if ((a2 & 1) != 0)
    {
LABEL_5:
      v163 = a2;
      -[PKMathRecognitionViewController drawingTransform](v196, v5);
      point = (CGPoint)vaddq_f64(v196[2], vmlaq_n_f64(vmulq_n_f64(v196[1], a4), v196[0], a3));
      memset(&v195, 0, sizeof(v195));
      -[PKMathRecognitionViewController drawingTransform](&v195, v5);
      v193 = 0u;
      v194 = 0u;
      v191 = 0u;
      v192 = 0u;
      objc_msgSend(*(id *)(v5 + 8), "allValues");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v191, v201, 16);
      v168 = v5;
      if (v7)
      {
        v8 = v7;
        v9 = 0;
        v10 = 0;
        v11 = *(_QWORD *)v192;
        v164 = v6;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v192 != v11)
              objc_enumerationMutation(v6);
            v13 = *(_BYTE **)(*((_QWORD *)&v191 + 1) + 8 * i);
            objc_msgSend(v13, "tappableStrokes");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            +[PKDrawing _boundingBoxForStrokeArray:](PKDrawing, "_boundingBoxForStrokeArray:", v14);
            v16 = v15;
            v18 = v17;
            v20 = v19;
            v22 = v21;

            v206.origin.x = v16;
            v206.origin.y = v18;
            v206.size.width = v20;
            v206.size.height = v22;
            if (!CGRectIsNull(v206))
            {
              v198 = v195;
              DKD_CGAffineTransformDecompose((uint64_t)&v198, (uint64_t)&buf);
              v207.origin.x = v16;
              v207.origin.y = v18;
              v207.size.width = v20;
              v207.size.height = v22;
              v208 = CGRectInset(v207, buf.a * -6.0, buf.a * -6.0);
              v204.x = a3;
              v204.y = a4;
              if (CGRectContainsPoint(v208, v204))
              {
                v39 = v13;

                v9 = v39;
                goto LABEL_41;
              }
            }
            if (_os_feature_enabled_impl() && (~*(_DWORD *)(v5 + 192) & 0x160) == 0 && (!v13 || !v13[67]))
            {
              v189 = 0u;
              v190 = 0u;
              v187 = 0u;
              v188 = 0u;
              objc_msgSend(v13, "scrubbableVariables");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v187, v200, 16);
              if (v24)
              {
                v25 = v24;
                v165 = v10;
                v166 = v9;
                v26 = *(_QWORD *)v188;
LABEL_18:
                v27 = 0;
                while (1)
                {
                  if (*(_QWORD *)v188 != v26)
                    objc_enumerationMutation(v23);
                  v28 = *(_QWORD **)(*((_QWORD *)&v187 + 1) + 8 * v27);
                  v29 = v28 ? (void *)v28[4] : 0;
                  v30 = v29;
                  v31 = -[PKMathRecognitionItem _boundsForStrokeIndexes:](v13, v30);
                  v33 = v32;
                  v35 = v34;
                  v37 = v36;

                  v209.origin.x = v31;
                  v209.origin.y = v33;
                  v209.size.width = v35;
                  v209.size.height = v37;
                  v205.x = a3;
                  v205.y = a4;
                  if (CGRectContainsPoint(v209, v205))
                    break;
                  if (v25 == ++v27)
                  {
                    v38 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v187, v200, 16);
                    v25 = v38;
                    if (!v38)
                    {
                      v10 = v165;
                      v9 = v166;
                      goto LABEL_30;
                    }
                    goto LABEL_18;
                  }
                }
                v9 = v13;

                v10 = v28;
LABEL_30:
                v5 = v168;
                v6 = v164;
              }

            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v191, v201, 16);
          if (v8)
            continue;
          break;
        }
      }
      else
      {
        v9 = 0;
        v10 = 0;
      }
LABEL_41:

      -[PKMathRecognitionViewController overlayDrawingController]((id *)v5);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      y = point.y;
      -[PKOverlayDrawingController tokenAtLocation:]((uint64_t)v40, point.x, point.y);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42)
      {
        objc_msgSend(v42, "errors");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "firstObject");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "errorString");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "length");

        if (v46)
        {
          objc_msgSend(v42, "bounds");
          if (CGRectIsEmpty(v210))
          {
            v47 = os_log_create("com.apple.pencilkit", "Math");
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              LOWORD(buf.a) = 0;
              _os_log_error_impl(&dword_1BE213000, v47, OS_LOG_TYPE_ERROR, "Unable to find bounds for token, using hit test location instead", (uint8_t *)&buf, 2u);
            }

            v48 = (id *)v168;
          }
          else
          {
            objc_msgSend(v42, "bounds");
            MidX = CGRectGetMidX(v214);
            objc_msgSend(v42, "bounds");
            MinY = CGRectGetMinY(v215);
            v48 = (id *)v168;
            -[PKMathRecognitionViewController drawingTransform](v186, v168);
            point = (CGPoint)vaddq_f64(v186[2], vmlaq_n_f64(vmulq_n_f64(v186[1], MinY), v186[0], MidX));
            y = point.y;
          }
          objc_msgSend(v42, "errors");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "firstObject");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "errorString");
          v76 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v42, "item");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "bounds");
          v79 = v78;
          v81 = v80;
          v83 = v82;
          v85 = v84;
          -[PKMathRecognitionViewController view](v48);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          +[PKMathContextMenuController mathErrorControllerForItem:token:tapBounds:errorString:view:delegate:](v79, v81, v83, v85, (uint64_t)PKMathContextMenuController, v77, v42, v76, v86, v48);
          v87 = (id *)objc_claimAutoreleasedReturnValue();

          -[PKMathRecognitionViewController setContextMenuController:]((uint64_t)v48, v87);
          if (v87)
            objc_msgSend(v87[2], "_presentMenuAtLocation:", point.x, y);
          v197 = 1;

          goto LABEL_80;
        }
        if (objc_msgSend(v42, "type") == 4)
        {
          objc_msgSend(v42, "alternatives");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "count");

          if (v50)
          {
            v51 = v42;
            objc_msgSend(v51, "bounds");
            x = v211.origin.x;
            v53 = v211.origin.y;
            width = v211.size.width;
            height = v211.size.height;
            if (!CGRectIsNull(v211))
            {
              memset(&buf, 0, sizeof(buf));
              -[PKMathRecognitionViewController drawingTransform](&buf, v168);
              v212.origin.x = x;
              v212.origin.y = v53;
              v212.size.width = width;
              v212.size.height = height;
              v174 = CGRectGetMidX(v212);
              v213.origin.x = x;
              v213.origin.y = v53;
              v213.size.width = width;
              v213.size.height = height;
              objc_msgSend(MEMORY[0x1E0DC3798], "configurationWithIdentifier:sourcePoint:", CFSTR("token"), vaddq_f64(*(float64x2_t *)&buf.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&buf.c, CGRectGetMinY(v213)), *(float64x2_t *)&buf.a, v174)));
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_storeStrong((id *)(v168 + 96), v42);
              if ((*(_BYTE *)(v168 + 194) & 2) != 0)
              {
                WeakRetained = objc_loadWeakRetained((id *)(v168 + 240));
                objc_msgSend(WeakRetained, "mathViewController:willPresentPopoverUI:", v168, 2);

              }
              v58 = *(void **)(v168 + 272);
              if (!v58)
              {
                v59 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC37A0]), "initWithDelegate:", v168);
                v60 = *(void **)(v168 + 272);
                *(_QWORD *)(v168 + 272) = v59;

                v61 = objc_loadWeakRetained((id *)(v168 + 248));
                objc_msgSend(v61, "addInteraction:", *(_QWORD *)(v168 + 272));

                v58 = *(void **)(v168 + 272);
              }
              v62 = v58;
              objc_msgSend(v62, "presentEditMenuWithConfiguration:", v56);

            }
            v197 = 1;
            v42 = v51;
            goto LABEL_80;
          }
        }
      }
      if (v10)
      {
        if (*(_QWORD *)(v168 + 88))
        {
          objc_msgSend((id)v168, "hideScrubber");
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __79__PKMathRecognitionViewController__handleSingleTapAtDrawingLocation_fromHover___block_invoke;
          block[3] = &unk_1E777BF28;
          block[4] = v168;
          v183 = v10;
          v184 = v9;
          v185 = v163;
          dispatch_async(MEMORY[0x1E0C80D38], block);

        }
        else
        {
          -[PKMathRecognitionViewController _scrubVariable:item:openAsCompact:](v168, v10, v9, v163);
        }
        goto LABEL_79;
      }
      if (v9)
      {
        if (-[PKMathRecognitionItem isGraphable]((uint64_t)v9) && (*(_BYTE *)(v168 + 192) & 4) != 0)
        {
          -[PKMathRecognitionViewController _triggerPopupToAddGraphForItem:](v168, v9);
LABEL_79:
          v197 = 1;
LABEL_80:

          return v197;
        }
        v63 = os_log_create("com.apple.pencilkit", "Math");
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v9, "expression");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf.a) = 138477827;
          *(_QWORD *)((char *)&buf.a + 4) = v64;
          _os_log_impl(&dword_1BE213000, v63, OS_LOG_TYPE_DEFAULT, "Tapped on expression: %{private}@", (uint8_t *)&buf, 0xCu);

        }
        objc_msgSend((id)v168, "hideMathFloatingLabelView");
        objc_msgSend(v9, "expressionToPresent");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v65, "length"))
        {
          if (-[PKMathRecognitionItem hasAnyErrorsOrAlternatives]((uint64_t)v9))
          {
            -[PKMathRecognitionViewController overlayDrawingController]((id *)v168);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "uuid");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = -[PKOverlayDrawingController hasVisibleTokensForItem:]((uint64_t)v66, (uint64_t)v67);

            if (!v68)
            {
              -[PKMathRecognitionViewController overlayDrawingController]((id *)v168);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              v70 = v9[12];
              -[PKOverlayDrawingController setTokens:item:]((uint64_t)v69, v70, v9);

            }
          }
          v71 = *(void **)(v168 + 16);
          objc_msgSend(v9, "uuid");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "objectForKeyedSubscript:", v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v9, "shouldSolveMathFlagIsSet") & 1) == 0
            && objc_msgSend(v9, "shouldBeSolved")
            && objc_msgSend(v73, "length"))
          {
            -[PKMathRecognitionViewController _triggerPopupToSolveItem:supportCopy:](v168, v9, 1);
            v197 = 1;
LABEL_129:

            goto LABEL_80;
          }
          -[PKMathRecognitionViewController overlayDrawingController]((id *)v168);
          v97 = (id *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "uuid");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKOverlayDrawingController existingViewForUUID:](v97, (uint64_t)v98);
          v99 = (void *)objc_claimAutoreleasedReturnValue();

          v167 = v9;
          if (v73 && objc_msgSend(v9, "shouldSolveMathFlagIsSet"))
          {
            if (!v99)
            {
              v100 = os_log_create("com.apple.pencilkit", "Math");
              if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(buf.a) = 0;
                _os_log_impl(&dword_1BE213000, v100, OS_LOG_TYPE_DEFAULT, "Recreating missing result view", (uint8_t *)&buf, 2u);
              }

              -[PKMathRecognitionViewController _presentResult:mathItem:defaultAnimationType:fromHint:hadOldResult:](v168, v73, v9, (void *)2, 0, 1);
            }
            v176 = v99;
            if (objc_msgSend(v9, "isVerticalExpression"))
              v101 = -[PKMathRecognitionItem boundsForVerticalExpressionLine](v9);
            else
              v101 = -[PKMathRecognitionItem boundsForAnyEqualSign](v9);
            v158 = v101;
            v159 = v102;
            v160 = v103;
            v161 = v104;
            -[PKMathRecognitionViewController view]((id *)v168);
            v162 = (void *)objc_claimAutoreleasedReturnValue();
            +[PKMathContextMenuController mathResultControllerForItem:tapBounds:view:delegate:](v158, v159, v160, v161, (uint64_t)PKMathContextMenuController, v9, v162, (void *)v168);
            v137 = (id *)objc_claimAutoreleasedReturnValue();

            objc_storeStrong((id *)(v168 + 280), v137);
            if (v137)
              objc_msgSend(v137[2], "_presentMenuAtLocation:", point);
            v130 = v42;
          }
          else
          {
            -[PKMathRecognitionViewController overlayDrawingController]((id *)v168);
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKOverlayDrawingController tokenAtLocation:]((uint64_t)v129, point.x, point.y);
            v130 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v130)
              goto LABEL_132;
            objc_msgSend(v130, "errors");
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v131, "firstObject");
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v132, "errorString");
            v133 = (void *)objc_claimAutoreleasedReturnValue();
            v134 = objc_msgSend(v133, "length");

            if (!v134)
            {
LABEL_132:
              if (objc_msgSend(v167, "isVerticalExpression"))
                v149 = -[PKMathRecognitionItem boundsForVerticalExpressionLine](v167);
              else
                v149 = -[PKMathRecognitionItem boundsForAnyEqualSign](v167);
              v153 = v149;
              v154 = v150;
              v155 = v151;
              v156 = v152;
              -[PKMathRecognitionViewController view]((id *)v168);
              v157 = (void *)objc_claimAutoreleasedReturnValue();
              +[PKMathContextMenuController mathCopyControllerForItem:tapBounds:view:delegate:](v153, v154, v155, v156, (uint64_t)PKMathContextMenuController, v167, v157, (void *)v168);
              v137 = (id *)objc_claimAutoreleasedReturnValue();

              objc_storeStrong((id *)(v168 + 280), v137);
              if (v137)
                objc_msgSend(v137[2], "_presentMenuAtLocation:", point);
              goto LABEL_128;
            }
            v176 = v99;
            v172 = v73;
            objc_msgSend(v130, "errors");
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v135, "firstObject");
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v136, "errorString");
            v137 = (id *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v130, "item");
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v130, "bounds");
            v140 = v139;
            v142 = v141;
            v144 = v143;
            v146 = v145;
            -[PKMathRecognitionViewController view]((id *)v168);
            v147 = (void *)objc_claimAutoreleasedReturnValue();
            +[PKMathContextMenuController mathErrorControllerForItem:token:tapBounds:errorString:view:delegate:](v140, v142, v144, v146, (uint64_t)PKMathContextMenuController, v138, v130, v137, v147, (void *)v168);
            v148 = (id *)objc_claimAutoreleasedReturnValue();

            objc_storeStrong((id *)(v168 + 280), v148);
            if (v148)
              objc_msgSend(v148[2], "_presentMenuAtLocation:", point);

            v73 = v172;
          }
          v99 = v176;
LABEL_128:

          v197 = 1;
          v42 = v130;
          v9 = v167;
          goto LABEL_129;
        }
      }
      else
      {
        v180 = 0u;
        v181 = 0u;
        v178 = 0u;
        v179 = 0u;
        -[PKMathRecognitionViewController overlayDrawingController]((id *)v168);
        v88 = (id *)objc_claimAutoreleasedReturnValue();
        -[PKOverlayDrawingController allViews](v88);
        v65 = (void *)objc_claimAutoreleasedReturnValue();

        v89 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v178, v199, 16);
        if (v89)
        {
          v90 = v89;
          v91 = *(_QWORD *)v179;
          while (2)
          {
            v92 = 0;
            do
            {
              if (*(_QWORD *)v179 != v91)
                objc_enumerationMutation(v65);
              v93 = *(id **)(*((_QWORD *)&v178 + 1) + 8 * v92);
              objc_msgSend(v93, "frame");
              if (CGRectContainsPoint(v216, point))
              {
                if (v93)
                {
                  v94 = v93[53];
                  if (v94)
                  {
                    objc_msgSend(*(id *)(v168 + 8), "objectForKeyedSubscript:", v94);
                    v95 = objc_claimAutoreleasedReturnValue();
                    if (v95)
                    {
                      v105 = (void *)v95;
                      objc_msgSend(v93, "bounds");
                      v107 = v106;
                      v109 = v108;
                      v111 = v110;
                      v113 = v112;
                      -[PKMathRecognitionViewController view]((id *)v168);
                      v114 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v93, "convertRect:toView:", v114, v107, v109, v111, v113);
                      v116 = v115;
                      v118 = v117;
                      v120 = v119;
                      v122 = v121;

                      memset(&buf, 0, sizeof(buf));
                      -[PKMathRecognitionViewController drawingTransform](&v177, v168);
                      CGAffineTransformInvert(&buf, &v177);
                      v198 = buf;
                      v217.origin.x = v116;
                      v217.origin.y = v118;
                      v217.size.width = v120;
                      v217.size.height = v122;
                      v218 = CGRectApplyAffineTransform(v217, &v198);
                      v123 = v218.origin.x;
                      v124 = v218.origin.y;
                      v125 = v218.size.width;
                      v126 = v218.size.height;
                      -[PKMathRecognitionViewController view]((id *)v168);
                      v127 = (void *)objc_claimAutoreleasedReturnValue();
                      +[PKMathContextMenuController mathResultControllerForItem:tapBounds:view:delegate:](v123, v124, v125, v126, (uint64_t)PKMathContextMenuController, v105, v127, (void *)v168);
                      v128 = (id *)objc_claimAutoreleasedReturnValue();

                      objc_storeStrong((id *)(v168 + 280), v128);
                      if (v128)
                        objc_msgSend(v128[2], "_presentMenuAtLocation:", point);
                      v197 = 1;

                      v9 = 0;
                      goto LABEL_80;
                    }
                  }
                }
                else
                {
                  v94 = 0;
                }

              }
              ++v92;
            }
            while (v90 != v92);
            v96 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v178, v199, 16);
            v90 = v96;
            if (v96)
              continue;
            break;
          }
        }
        v9 = 0;
      }

      v197 = 0;
      goto LABEL_80;
    }
    if (!*(_QWORD *)(v5 + 280))
    {
      if (*(_QWORD *)(v5 + 88))
      {
        objc_msgSend((id)v5, "hideScrubber");
      }
      else if (*(_QWORD *)(v5 + 40))
      {
        objc_msgSend((id)v5, "hideMathFloatingLabelView");
      }
      else if (!*(_BYTE *)(v5 + 104))
      {
        -[PKMathRecognitionViewController cancelOpenPopoverForHint](v5);
        -[PKMathRecognitionViewController cancelOpenPopoverForAddingGraph](v5);
        goto LABEL_5;
      }
    }
    return 1;
  }
  return result;
}

void __79__PKMathRecognitionViewController__handleSingleTapAtDrawingLocation_fromHover___block_invoke(uint64_t a1)
{
  -[PKMathRecognitionViewController _scrubVariable:item:openAsCompact:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

- (void)didEraseStrokes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  NSMutableSet *expressionsWithActiveAnimations;
  void *v19;
  void *v20;
  int v21;
  PKOverlayDrawingController *overlayDrawingController;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "_strokeUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v8);
  }

  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_regenerateResultsIfNecessary, 0);
    -[PKMathRecognitionViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_regenerateResultsIfNecessary, 0, 2.0);
    goto LABEL_22;
  }
  v23 = v6;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[NSMutableDictionary allValues](self->_currentMathItemsLookup, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (!v13)
    goto LABEL_20;
  v14 = v13;
  v15 = *(_QWORD *)v25;
  do
  {
    for (j = 0; j != v14; ++j)
    {
      if (*(_QWORD *)v25 != v15)
        objc_enumerationMutation(v12);
      v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
      expressionsWithActiveAnimations = self->_expressionsWithActiveAnimations;
      objc_msgSend(v17, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((-[NSMutableSet containsObject:](expressionsWithActiveAnimations, "containsObject:", v19) & 1) == 0)
      {
        -[PKMathRecognitionItem strokeUUIDs](v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v5, "intersectsSet:", v20);

        if (!v21)
          continue;
        overlayDrawingController = self->_overlayDrawingController;
        objc_msgSend(v17, "uuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKOverlayDrawingController removeViewForUUID:animated:]((id *)&overlayDrawingController->super.isa, v19, 1);
      }

    }
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  }
  while (v14);
LABEL_20:

  v6 = v23;
LABEL_22:

}

- (void)regenerateResultsIfNecessary
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableDictionary *currentResultsLookup;
  void *v11;
  void *v12;
  id *v13;
  void *v14;
  void *v15;
  NSObject *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[NSMutableDictionary allValues](self->_currentMathItemsLookup, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v21;
    *(_QWORD *)&v5 = 138477827;
    v19 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        currentResultsLookup = self->_currentResultsLookup;
        objc_msgSend(v9, "uuid", v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](currentResultsLookup, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKMathRecognitionViewController overlayDrawingController]((id *)&self->super.isa);
        v13 = (id *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKOverlayDrawingController existingViewForUUID:](v13, (uint64_t)v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "length"))
        {
          if (objc_msgSend(v9, "shouldSolveMathFlagIsSet") && v15 == 0)
          {
            v17 = os_log_create("com.apple.pencilkit", "Math");
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v9, "expression");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v19;
              v25 = v18;
              _os_log_impl(&dword_1BE213000, v17, OS_LOG_TYPE_DEFAULT, "Regenerating missing results view for: %{private}@", buf, 0xCu);

            }
            -[PKMathRecognitionViewController _presentResult:mathItem:defaultAnimationType:fromHint:hadOldResult:]((uint64_t)self, v12, v9, (void *)2, 0, 1);
          }
        }

      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v6);
  }

}

- (void)eraserMovedToLocation:(CGPoint)a3
{
  id *v4;
  id *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  double y;
  double x;
  float64x2_t v13;
  float64x2_t v14[3];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)&self->_delegateFlags + 1) & 0x40) != 0)
  {
    y = a3.y;
    x = a3.x;
    -[PKMathRecognitionViewController drawingTransform](v14, (uint64_t)self);
    v13 = vaddq_f64(v14[2], vmlaq_n_f64(vmulq_n_f64(v14[1], y), v14[0], x));
    -[PKMathRecognitionViewController overlayDrawingController]((id *)&self->super.isa);
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKOverlayDrawingController drawingViewAtLocation:](v4, v13.f64[0], v13.f64[1]);
    v5 = (id *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = v5[53];
      if (v6)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_currentMathItemsLookup, "objectForKeyedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7 && objc_msgSend(v7, "shouldSolveMathFlagIsSet"))
        {
          v9 = os_log_create("com.apple.pencilkit", "Math");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v8, "expression");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138477827;
            v16 = v10;
            _os_log_impl(&dword_1BE213000, v9, OS_LOG_TYPE_DEFAULT, "Remove result for: %{private}@", buf, 0xCu);

          }
          -[PKMathRecognitionViewController _commitSetShouldSolve:undoable:item:]((uint64_t)self, 0, 1, v8);
        }
        goto LABEL_11;
      }
    }
    else
    {
      v6 = 0;
    }
    v8 = 0;
LABEL_11:

  }
}

- (void)_commitSetShouldSolve:(uint64_t)a3 undoable:(void *)a4 item:
{
  _QWORD *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id WeakRetained;
  void *v13;
  _DWORD v14[2];
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (a1 && (*(_BYTE *)(a1 + 193) & 0x40) != 0)
  {
    v8 = os_log_create("com.apple.pencilkit", "Math");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "expression");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = 67109379;
      v14[1] = a2;
      v15 = 2113;
      v16 = v9;
      _os_log_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEFAULT, "Commit set should solve: %{BOOL}d, for: %{private}@", (uint8_t *)v14, 0x12u);

    }
    -[PKMathRecognitionItem heroStroke](v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_DWORD *)(a1 + 192);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 240));
    v13 = WeakRetained;
    if ((v11 & 0x2000) != 0)
      objc_msgSend(WeakRetained, "mathViewController:setShouldSolve:item:heroStroke:flag:undoable:", a1, a2, v7, v10, 0x20000000000, a3);
    else
      objc_msgSend(WeakRetained, "mathViewController:setShouldSolve:item:heroStroke:flag:", a1, a2, v7, v10, 0x20000000000);

  }
}

- (void)didBeginDrawing
{
  -[PKMathRecognitionViewController cancelOpenPopoverForHint]((uint64_t)self);
  -[PKMathRecognitionViewController cancelOpenPopoverForAddingGraph]((uint64_t)self);
}

- (void)dismissPopovers
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PKMathRecognitionViewController_dismissPopovers__block_invoke;
  block[3] = &unk_1E7778020;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __50__PKMathRecognitionViewController_dismissPopovers__block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL4 v3;
  id *v4;
  id v5;
  id *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id *v12;
  void *v13;
  _QWORD v14[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "activeScrubberView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;
  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "hideScrubber");
  v4 = *(id **)(a1 + 32);
  if (v4[5])
  {
    objc_msgSend(*(id *)(a1 + 32), "hideMathFloatingLabelView");
    v4 = *(id **)(a1 + 32);
    v3 = 1;
  }
  if (!v4[6])
    goto LABEL_16;
  objc_msgSend(v4, "viewControllerForPresentingUI");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = v4 + 31;
    WeakRetained = objc_loadWeakRetained(v6);
    objc_msgSend(WeakRetained, "nextResponder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = WeakRetained;
LABEL_11:
      v5 = v8;
      WeakRetained = v9;
      v9 = v5;
    }
    else
    {
      while (1)
      {
        v9 = v8;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;

        objc_msgSend(v8, "nextResponder");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        WeakRetained = v9;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_11;
      }
      v5 = 0;
    }

    if (!v5)
    {
      v10 = objc_loadWeakRetained(v6);
      objc_msgSend(v10, "window");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "rootViewController");
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__PKMathRecognitionViewController_dismissPopovers__block_invoke_2;
  v14[3] = &unk_1E7778020;
  v14[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v14);

  v4 = *(id **)(a1 + 32);
  if (v4)
  {
LABEL_16:
    v12 = (id *)v4[35];
    if (v12)
      objc_msgSend(v12[2], "dismissMenu");
  }
  if (v3)
  {
    -[PKMathRecognitionViewController tiledView](*(id **)(a1 + 32));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_pauseHoverPreviewForTimeInterval:", 0.1);

  }
}

void __50__PKMathRecognitionViewController_dismissPopovers__block_invoke_2(uint64_t a1)
{
  -[PKMathRecognitionViewController _cleanupTypesetViewController](*(_QWORD *)(a1 + 32));
}

- (id)hitTest:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id WeakRetained;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD block[5];

  y = a3.y;
  x = a3.x;
  -[PKCalculateScrubberController activeScrubberView](self->_scrubberController, "activeScrubberView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);
    objc_msgSend(WeakRetained, "convertPoint:toView:", v6, x, y);
    v9 = v8;
    v11 = v10;

    objc_msgSend(v6, "hitTest:withEvent:", 0, v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __43__PKMathRecognitionViewController_hitTest___block_invoke;
      block[3] = &unk_1E7778020;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      v14 = v6;
    }
    v15 = v14;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __43__PKMathRecognitionViewController_hitTest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hideScrubber");
}

- (id)adjustedSelectedStrokes:(id)a3 selectionPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  id *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  void *v57;
  id v59;
  id v60;
  void *v61;
  PKMathRecognitionViewController *v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  CGAffineTransform v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  CGAffineTransform v73;
  CGAffineTransform v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;

  v77 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_retainAutorelease(v7);
  if (objc_msgSend(v9, "CGPath"))
  {
    v59 = v9;
    v60 = v6;
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    memset(&v74, 0, sizeof(v74));
    -[PKMathRecognitionViewController drawingTransform](&v73, (uint64_t)self);
    CGAffineTransformInvert(&v74, &v73);
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    -[PKMathRecognitionViewController overlayDrawingController]((id *)&self->super.isa);
    v18 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKOverlayDrawingController allViews](v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
    if (v20)
    {
      v21 = v20;
      v63 = *(_QWORD *)v70;
      v61 = v19;
      v62 = self;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v70 != v63)
            objc_enumerationMutation(v19);
          v23 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * v22);
          -[PKOverlayDrawingView imageView]((id *)v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            -[PKMathRecognitionViewController view]((id *)&self->super.isa);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKOverlayDrawingView imageView]((id *)v23);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "bounds");
            v28 = v27;
            v30 = v29;
            v32 = v31;
            v34 = v33;
            -[PKOverlayDrawingView imageView]((id *)v23);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "convertRect:fromView:", v35, v28, v30, v32, v34);
            v37 = v36;
            v39 = v38;
            v41 = v40;
            v43 = v42;

            v68 = v74;
            v78.origin.x = v37;
            v78.origin.y = v39;
            v78.size.width = v41;
            v78.size.height = v43;
            v79 = CGRectApplyAffineTransform(v78, &v68);
            v80.origin.x = v11;
            v80.origin.y = v13;
            v80.size.width = v15;
            v80.size.height = v17;
            if (CGRectIntersectsRect(v79, v80))
            {
              if (CGPathIntersectsRect())
              {
                if (v23)
                  v44 = *(void **)(v23 + 424);
                else
                  v44 = 0;
                v45 = v44;
                -[NSMutableDictionary objectForKeyedSubscript:](self->_currentMathItemsLookup, "objectForKeyedSubscript:", v45);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = v46;
                if (v46)
                {
                  v66 = 0u;
                  v67 = 0u;
                  v64 = 0u;
                  v65 = 0u;
                  objc_msgSend(v46, "strokes");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
                  if (v49)
                  {
                    v50 = v49;
                    v51 = *(_QWORD *)v65;
                    do
                    {
                      for (i = 0; i != v50; ++i)
                      {
                        if (*(_QWORD *)v65 != v51)
                          objc_enumerationMutation(v48);
                        objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * i), "_strokeUUID");
                        v53 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v8, "addObject:", v53);

                      }
                      v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
                    }
                    while (v50);
                  }

                  self = v62;
                  v19 = v61;
                }

              }
            }
          }
          ++v22;
        }
        while (v22 != v21);
        v54 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
        v21 = v54;
      }
      while (v54);
    }

    v9 = v59;
    v6 = v60;
  }
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v6, "allObjects");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v55);

    v56 = (id)objc_msgSend(v8, "copy");
  }
  else
  {
    v56 = v6;
  }
  v57 = v56;

  return v57;
}

- (void)overlayController:(id)a3 imageViewForStrokes:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  PKMathRecognitionViewController *v15;
  id v16;

  v7 = a5;
  v8 = a4;
  -[PKMathRecognitionViewController tiledView]((id *)&self->super.isa);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMathRecognitionViewController drawing]((id *)&self->super.isa);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __84__PKMathRecognitionViewController_overlayController_imageViewForStrokes_completion___block_invoke;
  v13[3] = &unk_1E777BF50;
  v14 = v9;
  v15 = self;
  v16 = v7;
  v11 = v7;
  v12 = v9;
  -[PKMathRecognitionViewController _imageViewForStrokes:drawing:completion:]((uint64_t)self, v8, v10, v13);

}

void __84__PKMathRecognitionViewController_overlayController_imageViewForStrokes_completion___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;

  v21 = a2;
  objc_msgSend(v21, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = *(void **)(a1 + 32);
  -[PKMathRecognitionViewController view](*(id **)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertRect:toView:", v12, v4, v6, v8, v10);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)_imageViewForStrokes:(void *)a3 drawing:(void *)a4 completion:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15[3];
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    -[PKMathRecognitionViewController tiledView]((id *)a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 192) & 0x10) != 0
      && (WeakRetained = objc_loadWeakRetained((id *)(a1 + 240)),
          objc_msgSend(WeakRetained, "mathViewController:coordinateSpaceForDrawing:", a1, v8),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          WeakRetained,
          v12))
    {
      v17 = 0u;
      v18 = 0u;
      v16 = 0u;
      -[PKMathRecognitionViewController drawingTransformFromDelegate](&v16, a1);
      objc_msgSend(v10, "selectionController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v16;
      v15[1] = v17;
      v15[2] = v18;
      -[PKSelectionController _imageViewForStrokes:drawing:drawingTransform:coordinateSpace:completion:]((uint64_t)v13, v7, v8, v15, v12, v9);

    }
    else
    {
      objc_msgSend(v10, "selectionController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController _imageViewForStrokes:drawing:completion:]((uint64_t)v14, v7, v8, v9);

    }
  }

}

- (void)overlayController:(id)a3 willUpdateView:(id)a4 animationDuration:(double)a5
{
  id v5;

  -[PKMathRecognitionViewController tiledView]((id *)&self->super.isa);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_pauseHoverPreviewForTimeInterval:", 0.5);

}

- (CGAffineTransform)overlayControllerDrawingTransform:(SEL)a3
{
  CGAffineTransform *result;

  -[PKMathRecognitionViewController drawingTransform](retstr, (uint64_t)self);
  return result;
}

void __75__PKMathRecognitionViewController__maskImageForStrokes_drawing_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "selectionController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController _maskImageForStrokes:drawing:imageView:completion:]((uint64_t)v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v4, *(void **)(a1 + 56));

}

- (void)mathRecognitionController:(id)a3 didUpdateExpressions:(id)a4 newItems:(id)a5 removedItems:(id)a6 mathItems:(id)a7
{
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  _QWORD *v17;
  NSMutableDictionary *currentMathItemsLookup;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  NSMutableDictionary *v25;
  NSMutableDictionary *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  void *v35;
  int v36;
  NSObject *v37;
  _BOOL4 v38;
  void *v39;
  NSObject *v40;
  const char *v41;
  void *v42;
  char v43;
  void *v44;
  char v45;
  NSObject *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  void *v53;
  id *v54;
  id WeakRetained;
  NSMutableDictionary *v56;
  void *v57;
  void *v58;
  NSMutableSet *expressionsWeCreatedGraphsFor;
  void *v60;
  NSUUID *v61;
  NSUUID *addGraphItemUUID;
  void *v63;
  void *v64;
  id v65;
  id v66;
  id obj;
  id v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint8_t v82[128];
  uint8_t buf[4];
  void *v84;
  _BYTE v85[128];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v68 = a4;
  v69 = a5;
  v65 = a6;
  v11 = a7;
  -[PKMathRecognitionViewController cancelOpenPopoverForHint]((uint64_t)self);
  -[PKMathRecognitionViewController cancelOpenPopoverForAddingGraph]((uint64_t)self);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  obj = v11;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v79 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD **)(*((_QWORD *)&v78 + 1) + 8 * i);
        currentMathItemsLookup = self->_currentMathItemsLookup;
        objc_msgSend(v17, "uuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](currentMathItemsLookup, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "uuid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, v21);

        if (v20)
        {
          objc_msgSend(v17, "uuid");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v68, "containsObject:", v22))
          {

          }
          else
          {
            objc_msgSend(v17, "uuid");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v69, "containsObject:", v23);

            if ((v24 & 1) == 0)
              -[PKMathRecognitionItem _updateFromOldItem:](v17, v20);
          }
        }

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
    }
    while (v14);
  }

  v25 = (NSMutableDictionary *)objc_msgSend(v12, "copy");
  v26 = self->_currentMathItemsLookup;
  self->_currentMathItemsLookup = v25;

  objc_msgSend(v69, "setByAddingObjectsFromSet:", v68);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "mutableCopy");

  v29 = (void *)objc_msgSend(v65, "mutableCopy");
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v64 = v28;
  v66 = (id)objc_msgSend(v28, "copy");
  v30 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v75;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v75 != v32)
          objc_enumerationMutation(v66);
        v34 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * j);
        objc_msgSend(v12, "objectForKeyedSubscript:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v35)
          goto LABEL_31;
        v36 = objc_msgSend(v69, "containsObject:", v34);
        v37 = os_log_create("com.apple.pencilkit", "Math");
        v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
        if (v36)
        {
          if (v38)
          {
            objc_msgSend(v35, "expression");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138477827;
            v84 = v39;
            v40 = v37;
            v41 = "New expression: %{private}@";
LABEL_24:
            _os_log_impl(&dword_1BE213000, v40, OS_LOG_TYPE_DEFAULT, v41, buf, 0xCu);

          }
        }
        else if (v38)
        {
          objc_msgSend(v35, "expression");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138477827;
          v84 = v39;
          v40 = v37;
          v41 = "Updated expression: %{private}@";
          goto LABEL_24;
        }

        if (!objc_msgSend(v35, "shouldBeSolved")
          || (-[PKMathRecognitionViewController drawing]((id *)&self->super.isa),
              v42 = (void *)objc_claimAutoreleasedReturnValue(),
              v43 = objc_msgSend(v35, "isValidForDrawing:", v42),
              v42,
              (v43 & 1) == 0))
        {
          -[PKMathRecognitionViewController drawing]((id *)&self->super.isa);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v35, "isValidForDrawing:", v44);

          if ((v45 & 1) == 0)
          {
            v46 = os_log_create("com.apple.pencilkit", "Math");
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v35, "expression");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138477827;
              v84 = v47;
              _os_log_impl(&dword_1BE213000, v46, OS_LOG_TYPE_DEFAULT, "Detected stale item: %{private}@", buf, 0xCu);

            }
          }
LABEL_31:
          objc_msgSend(v29, "addObject:", v34);
        }

      }
      v31 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
    }
    while (v31);
  }

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v48 = v29;
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v71;
    do
    {
      for (k = 0; k != v50; ++k)
      {
        if (*(_QWORD *)v71 != v51)
          objc_enumerationMutation(v48);
        v53 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * k);
        -[PKMathRecognitionViewController overlayDrawingController]((id *)&self->super.isa);
        v54 = (id *)objc_claimAutoreleasedReturnValue();
        -[PKOverlayDrawingController removeViewForUUID:animated:](v54, v53, 1);

      }
      v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
    }
    while (v50);
  }

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "mathViewController:didUpdateExpressions:newExpressions:removedExpressions:mathItems:", self, v68, v69, v65, obj);

  if (objc_msgSend(v64, "count") == 1)
  {
    v56 = self->_currentMathItemsLookup;
    objc_msgSend(v64, "anyObject");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v56, "objectForKeyedSubscript:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58
      && -[PKMathRecognitionItem isRecentlyModified]((double *)v58)
      && -[PKMathRecognitionItem isGraphable]((uint64_t)v58)
      && -[PKMathRecognitionItem isRecentlyCreated](v58)
      && (!-[PKMathRecognitionViewController solvingStyle](self, "solvingStyle")
       || -[PKMathRecognitionViewController solvingStyle](self, "solvingStyle") == 1))
    {
      expressionsWeCreatedGraphsFor = self->_expressionsWeCreatedGraphsFor;
      objc_msgSend(v58, "uuid");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(expressionsWeCreatedGraphsFor) = -[NSMutableSet containsObject:](expressionsWeCreatedGraphsFor, "containsObject:", v60);

      if ((expressionsWeCreatedGraphsFor & 1) == 0)
      {
        objc_msgSend(v58, "uuid");
        v61 = (NSUUID *)objc_claimAutoreleasedReturnValue();
        addGraphItemUUID = self->_addGraphItemUUID;
        self->_addGraphItemUUID = v61;

        -[PKMathRecognitionViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_openPopoverForAddingGraph, 0, -[PKMathRecognitionViewController _remainingDelayForMathItem:delay:]((uint64_t)self, v58, 1.0));
      }
    }

  }
  -[PKMathRecognitionViewController overlayDrawingController]((id *)&self->super.isa);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKOverlayDrawingController didUpdateExpressions:newItems:removedItems:]((uint64_t)v63, v68);

}

- (double)_remainingDelayForMathItem:(double)a3 delay:
{
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;

  if (!a1)
    return 0.0;
  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a2;
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v7 = v6;
  v8 = -[PKMathRecognitionItem mostRecentStrokeTimestamp](v5);

  return fmax(a3 - (v7 - v8), 0.0);
}

- (double)mathRecognitionControllerTimestampForLatestUserInteraction:(id)a3
{
  void *v4;
  double v5;
  double v6;
  id WeakRetained;
  double v8;

  -[PKMathRecognitionViewController tiledView]((id *)&self->super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestampForLatestUserInteraction");
  v6 = v5;

  if ((*((_BYTE *)&self->_delegateFlags + 2) & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "mathViewControllerTimestampForLatestUserInteraction:", self);
    v6 = v8;

  }
  return v6;
}

- (void)mathRecognitionController:(id)a3 solveStateChangedForExpressions:(id)a4 mathItems:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  _QWORD *v15;
  void *v16;
  NSMutableDictionary *currentMathItemsLookup;
  void *v18;
  void *v19;
  NSMutableDictionary *v20;
  NSMutableDictionary *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  id *v30;
  void *v31;
  BOOL v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v39 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v15, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v16);

        currentMathItemsLookup = self->_currentMathItemsLookup;
        objc_msgSend(v15, "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](currentMathItemsLookup, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
          -[PKMathRecognitionItem _updateFromOldItem:](v15, v19);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v12);
  }
  v33 = v10;

  v20 = (NSMutableDictionary *)objc_msgSend(v9, "copy");
  v21 = self->_currentMathItemsLookup;
  self->_currentMathItemsLookup = v20;

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v22 = v7;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v35 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        objc_msgSend(v9, "objectForKeyedSubscript:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "shouldSolveMathFlagIsSet"))
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_currentResultsLookup, "objectForKeyedSubscript:", v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKMathRecognitionViewController overlayDrawingController]((id *)&self->super.isa);
          v30 = (id *)objc_claimAutoreleasedReturnValue();
          -[PKOverlayDrawingController existingViewForUUID:](v30, (uint64_t)v27);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31)
            v32 = 1;
          else
            v32 = v29 == 0;
          if (!v32)
            -[PKMathRecognitionViewController _presentResult:mathItem:defaultAnimationType:fromHint:hadOldResult:]((uint64_t)self, v29, v28, (void *)2, 0, 0);
        }
        else
        {
          -[PKMathRecognitionViewController overlayDrawingController]((id *)&self->super.isa);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKOverlayDrawingController removeViewForUUID:animated:]((id *)v29, v27, 1);
        }

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v24);
  }

}

- (void)mathRecognitionController:(id)a3 didEraseStrokesInExpressions:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSUUID *uuidForLatestLiveVariableExpression;
  void *v12;
  NSUUID *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        uuidForLatestLiveVariableExpression = self->_uuidForLatestLiveVariableExpression;
        if (!uuidForLatestLiveVariableExpression
          || (-[NSUUID isEqual:](uuidForLatestLiveVariableExpression, "isEqual:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9)) & 1) == 0)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_currentMathItemsLookup, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12
            && (-[NSMutableSet containsObject:](self->_expressionsWithActiveAnimations, "containsObject:", v10) & 1) == 0)
          {
            -[PKOverlayDrawingController removeViewForUUID:animated:]((id *)&self->_overlayDrawingController->super.isa, v10, 1);
          }

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  v13 = self->_uuidForLatestLiveVariableExpression;
  self->_uuidForLatestLiveVariableExpression = 0;

}

- (void)hideMathFloatingLabelView
{
  UIView *mathFloatingLabelView;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_hideMathFloatingLabelView, 0);
  -[UIView removeFromSuperview](self->_mathFloatingLabelView, "removeFromSuperview");
  mathFloatingLabelView = self->_mathFloatingLabelView;
  self->_mathFloatingLabelView = 0;

}

void __66__PKMathRecognitionViewController__showDetectionAnimationForItem___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id *WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  id v26;

  v26 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    -[PKMathRecognitionViewController view](*(id **)(a1 + 32));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tintColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "imageWithTintColor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = *(void **)(a1 + 40);
    v16 = objc_loadWeakRetained(WeakRetained + 31);
    objc_msgSend(v15, "convertRect:toView:", v16, a3, a4, a5, a6);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

    -[PKMathRecognitionViewController overlayDrawingController](WeakRetained);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKOverlayDrawingController showDetectionAnimationWithImage:frame:]((uint64_t)v25, v14, v18, v20, v22, v24);

    v26 = v14;
  }

}

- (void)_sendUpdatedResult:(void *)a3 strokes:(void *)a4 uuid:
{
  id v7;
  id v8;
  id WeakRetained;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 192) & 0x80) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 240));
      objc_msgSend(WeakRetained, "mathViewController:updatedResult:strokes:expressionUUID:", a1, v10, v7, v8);

    }
    if (objc_msgSend((id)a1, "shouldCacheDrawingForResults"))
    {
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", a1, sel__updateDrawingOverlayCache, 0);
      objc_msgSend((id)a1, "performSelector:withObject:afterDelay:", sel__updateDrawingOverlayCache, 0, 0.1);
    }
  }

}

- (void)mathResult:(id)a3 itemUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  NSMutableDictionary *currentResultsLookup;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  void *v18;
  NSUUID *v19;
  NSUUID *popoverHintItemUUID;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  PKLiveMathVariable *liveVariable;
  PKLiveMathVariable *v26;
  NSObject *v27;
  NSObject *p_super;
  void *v29;
  void *v30;
  int v31;
  int v32;
  int v33;
  NSObject *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_currentMathItemsLookup, "objectForKeyedSubscript:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && -[NSObject shouldBeSolved](v8, "shouldBeSolved") && objc_msgSend(v6, "length"))
  {
    -[PKMathRecognitionViewController drawing]((id *)&self->super.isa);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[NSObject isValidForDrawing:](v9, "isValidForDrawing:", v10) & 1) != 0)
    {
      v11 = -[NSObject isLowConfidenceMath](v9, "isLowConfidenceMath");

      if (!v11)
      {
        currentResultsLookup = self->_currentResultsLookup;
        -[NSObject uuid](v9, "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](currentResultsLookup, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = self->_currentResultsLookup;
        -[NSObject uuid](v9, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v6, v16);

        -[PKMathRecognitionViewController drawing]((id *)&self->super.isa);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKMathRecognitionItem _heroStrokeInDrawing:](v9, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[PKMathRecognitionViewController solvingStyle](self, "solvingStyle"))
        {
          if ((-[NSObject shouldSolveMathFlagIsSet](v9, "shouldSolveMathFlagIsSet") & 1) == 0)
          {
            if (-[PKMathRecognitionItem isRecentlyModified]((double *)v9)
              && -[PKMathRecognitionViewController solvingStyle](self, "solvingStyle") == 1)
            {
              -[NSObject uuid](v9, "uuid");
              v19 = (NSUUID *)objc_claimAutoreleasedReturnValue();
              popoverHintItemUUID = self->_popoverHintItemUUID;
              self->_popoverHintItemUUID = v19;

              -[PKMathRecognitionViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_openPopoverForHint, 0, -[PKMathRecognitionViewController _remainingDelayForMathItem:delay:]((uint64_t)self, v9, 0.7));
            }
            goto LABEL_38;
          }
        }
        else
        {
          v32 = -[PKMathRecognitionItem isRecentlyModified]((double *)v9);
          v33 = v32;
          if ((*((_BYTE *)&self->_delegateFlags + 1) & 0x40) != 0
            && v32
            && v18
            && (-[NSObject shouldSolveMathFlagIsSet](v9, "shouldSolveMathFlagIsSet") & 1) == 0)
          {
            -[PKMathRecognitionViewController _commitSetShouldSolve:undoable:item:]((uint64_t)self, 1, 0, v9);
          }
          else if (((-[NSObject shouldSolveMathFlagIsSet](v9, "shouldSolveMathFlagIsSet") | v33) & 1) == 0)
          {
LABEL_38:
            v34 = os_log_create("com.apple.pencilkit", "Math");
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              -[NSObject expression](v9, "expression");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = 138478083;
              v38 = v35;
              v39 = 2113;
              v40 = v6;
              _os_log_impl(&dword_1BE213000, v34, OS_LOG_TYPE_DEFAULT, "Should not show results for expression: %{private}@, result: %{private}@", (uint8_t *)&v37, 0x16u);

            }
            -[PKMathRecognitionItem _logRecentlyModifiedAndCreated](v9);
            -[PKMathRecognitionViewController overlayDrawingController]((id *)&self->super.isa);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKOverlayDrawingController hideImageForUUID:]((uint64_t)v36, v7);

            -[PKMathRecognitionViewController _sendUpdatedResult:strokes:uuid:]((uint64_t)self, 0, MEMORY[0x1E0C9AA60], v7);
            goto LABEL_43;
          }
        }
        -[PKMathRecognitionViewController _presentResult:mathItem:defaultAnimationType:fromHint:hadOldResult:]((uint64_t)self, v6, v9, (void *)2, 0, v14 != 0);
LABEL_43:

        goto LABEL_30;
      }
    }
    else
    {

    }
  }
  if (-[NSObject shouldBeSolved](v9, "shouldBeSolved"))
  {
    v21 = os_log_create("com.apple.pencilkit", "Math");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject expression](v9, "expression");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKMathRecognitionViewController drawing]((id *)&self->super.isa);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138478595;
      v38 = v22;
      v39 = 2113;
      v40 = v6;
      v41 = 1024;
      v42 = -[NSObject isValidForDrawing:](v9, "isValidForDrawing:", v23);
      v43 = 1024;
      v44 = -[NSObject isLowConfidenceMath](v9, "isLowConfidenceMath");
      _os_log_impl(&dword_1BE213000, v21, OS_LOG_TYPE_DEFAULT, "Skipping presenting result for expression: %{private}@, result: %{private}@, valid: %{BOOL}d, lowConfidence: %{BOOL}d", (uint8_t *)&v37, 0x22u);

    }
  }
  -[PKMathRecognitionViewController overlayDrawingController]((id *)&self->super.isa);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKOverlayDrawingController hideImageForUUID:]((uint64_t)v24, v7);

  -[PKMathRecognitionViewController _sendUpdatedResult:strokes:uuid:]((uint64_t)self, 0, MEMORY[0x1E0C9AA60], v7);
  if (v9)
  {
    liveVariable = self->_liveVariable;
    if (liveVariable)
      liveVariable = (PKLiveMathVariable *)liveVariable->_mathItem;
    v26 = liveVariable;
    v27 = v9;
    if (v26 == (PKLiveMathVariable *)v9)
      goto LABEL_28;
    p_super = &v26->super;
    if (-[PKMathRecognitionItem isRecentlyModified]((double *)v9))
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_currentResultsLookup, "objectForKeyedSubscript:", v7);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {

LABEL_23:
        v27 = os_log_create("com.apple.pencilkit", "Math");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject expression](v9, "expression");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = 138477827;
          v38 = v30;
          _os_log_impl(&dword_1BE213000, v27, OS_LOG_TYPE_DEFAULT, "Detected math item with no result and no error: %{private}@", (uint8_t *)&v37, 0xCu);

        }
        goto LABEL_28;
      }
      if ((-[PKMathRecognitionItem hasAnyErrors]((uint64_t)v9) & 1) == 0)
      {
        v31 = -[NSObject shouldBeSolved](v9, "shouldBeSolved");

        if (!v31)
          goto LABEL_29;
        goto LABEL_23;
      }
    }
    v27 = p_super;
LABEL_28:

  }
LABEL_29:
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentResultsLookup, "setObject:forKeyedSubscript:", 0, v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentResultsAttributionLookup, "setObject:forKeyedSubscript:", 0, v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentResultsDrawings, "setObject:forKeyedSubscript:", 0, v7);
LABEL_30:

}

- (void)mathResultAttributionImage:(id)a3 darkModeImage:(id)a4 string:(id)a5 date:(id)a6 itemUUID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  PKMathResultAttribution *v16;
  NSMutableDictionary *currentResultsAttributionLookup;
  id v18;

  v18 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v18 && v12)
  {
    v15 = a7;
    v16 = objc_alloc_init(PKMathResultAttribution);
    -[PKMathResultAttribution setImage:]((uint64_t)v16, v18);
    -[PKMathResultAttribution setDarkModeImage:]((uint64_t)v16, v12);
    -[PKMathResultAttribution setDate:]((uint64_t)v16, v14);
    -[PKMathResultAttribution setString:]((uint64_t)v16, v13);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentResultsAttributionLookup, "setObject:forKeyedSubscript:", v16, v15);

  }
  else
  {
    currentResultsAttributionLookup = self->_currentResultsAttributionLookup;
    v16 = (PKMathResultAttribution *)a7;
    -[NSMutableDictionary setObject:forKeyedSubscript:](currentResultsAttributionLookup, "setObject:forKeyedSubscript:", 0, v16);
  }

}

id __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "mathViewController:resultForLocale:itemUUID:", *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48));
}

void __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id *WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  double v12;
  id v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  void *v23;
  NSObject *v24;
  double v25;
  double v26;
  double MaxX;
  double v28;
  double v29;
  uint64_t v30;
  double v31;
  double v32;
  NSObject *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  id *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  dispatch_time_t v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id *v58;
  id *v59;
  id v60;
  id v61;
  uint64_t v62;
  id v63;
  id v64;
  id v65;
  double v66;
  uint8_t buf[4];
  double v68;
  __int16 v69;
  double v70;
  __int16 v71;
  double v72;
  uint64_t v73;
  CGRect v74;

  v73 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id *)(a1 + 72);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    objc_msgSend(v3, "strokes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    -[PKMathRecognitionViewController drawing](WeakRetained);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend(v7, "isValidForDrawing:", v8);

    if ((v7 & 1) != 0)
    {
      v9 = WeakRetained[4];
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v3, v10);

    }
    else
    {
      v11 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "expression");
        v12 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 138477827;
        v68 = v12;
        _os_log_impl(&dword_1BE213000, v11, OS_LOG_TYPE_DEFAULT, "Synthesize found invalid math item for expression: %{private}@", buf, 0xCu);

      }
      v13 = WeakRetained[4];
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, v14);

      v6 = (void *)MEMORY[0x1E0C9AA60];
    }
    +[PKDrawing _boundingBoxForStrokeArray:](PKDrawing, "_boundingBoxForStrokeArray:", v6);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[PKMathRecognitionViewController drawing](WeakRetained);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = os_log_create("com.apple.pencilkit", "Math");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "expression");
      v25 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v26 = *(double *)(a1 + 40);
      *(_DWORD *)buf = 138478083;
      v68 = v25;
      v69 = 2113;
      v70 = v26;
      _os_log_impl(&dword_1BE213000, v24, OS_LOG_TYPE_DEFAULT, "Updating drawing view for: %{private}@, result: %{private}@", buf, 0x16u);

    }
    v74.origin.x = v16;
    v74.origin.y = v18;
    v74.size.width = v20;
    v74.size.height = v22;
    MaxX = CGRectGetMaxX(v74);
    objc_msgSend(*(id *)(a1 + 48), "canvasWidth");
    v29 = v28;
    objc_msgSend(*(id *)(a1 + 48), "canvasWidth");
    v30 = MEMORY[0x1E0C809B0];
    if (v31 > 0.0
      && objc_msgSend(v6, "count")
      && !*(_BYTE *)(a1 + 88)
      && (v32 = MaxX - v29, v32 > 4.0)
      && ((-[PKMathRecognitionItem isRecentlyModified](*(double **)(a1 + 32)) & 1) != 0 || *(_BYTE *)(a1 + 89)))
    {
      v33 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE213000, v33, OS_LOG_TYPE_DEFAULT, "Triggering wink animation", buf, 2u);
      }

      v34 = v32 + 20.0;
      objc_msgSend(*(id *)(a1 + 32), "bounds");
      v36 = v35;
      objc_msgSend(v3, "bounds");
      v38 = fmax(1.0 - v34 / (v36 + v37), 0.5);
      v39 = WeakRetained[22];
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addObject:", v40);

      -[PKMathRecognitionViewController overlayDrawingController](WeakRetained);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = v30;
      v57[1] = 3221225472;
      v57[2] = __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_127;
      v57[3] = &unk_1E777C090;
      v58 = (id *)*(id *)(a1 + 32);
      v59 = WeakRetained;
      v60 = *(id *)(a1 + 56);
      v42 = v23;
      v43 = *(_QWORD *)(a1 + 48);
      v61 = v42;
      v62 = v43;
      v66 = v38;
      v63 = *(id *)(a1 + 64);
      v64 = v6;
      v65 = *(id *)(a1 + 40);
      objc_msgSend(WeakRetained, "overlayController:imageViewForStrokes:completion:", v41, v64, v57);

      v44 = v58;
    }
    else
    {
      if (*(_BYTE *)(a1 + 88))
      {
        v45 = 0;
      }
      else
      {
        v45 = *(_QWORD *)(a1 + 80);
        if (-[PKMathRecognitionItem isRecentlyModified](*(double **)(a1 + 32)) && !*(_BYTE *)(a1 + 90))
        {
          if (!*(_BYTE *)(a1 + 89))
            -[PKMathRecognitionViewController _showDetectionAnimationForItem:](WeakRetained, *(void **)(a1 + 32));
          v45 = 1;
        }
      }
      -[PKMathRecognitionViewController overlayDrawingController](WeakRetained);
      v44 = (id *)objc_claimAutoreleasedReturnValue();
      -[PKOverlayDrawingController updateDrawingView:strokes:animationType:result:imageView:](v44, *(void **)(a1 + 64), v6, (void *)v45, *(void **)(a1 + 40), 0);
    }

    v46 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMathRecognitionViewController _sendUpdatedResult:strokes:uuid:]((uint64_t)WeakRetained, v46, v6, v47);

    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v49 = v48;
    v50 = -[PKMathRecognitionItem mostRecentStrokeTimestamp](*(void **)(a1 + 32));
    if (v49 - v50 < 5.0
      && objc_msgSend(v6, "count")
      && !*(_BYTE *)(a1 + 88)
      && !objc_msgSend(*(id *)(a1 + 48), "solvingStyle"))
    {
      v51 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134284033;
        v68 = v50;
        v69 = 2049;
        v70 = v49;
        v71 = 2049;
        v72 = v49 - v50;
        _os_log_impl(&dword_1BE213000, v51, OS_LOG_TYPE_DEFAULT, "Most recent stroke timestamp: %{private}f, Synthesized drawing timestamp: %{private}f, MathRecognitionToDrawing: %{private}f", buf, 0x20u);
      }

      if (os_variant_has_internal_ui())
      {
        _PKSignpostLog();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v52))
        {
          *(_DWORD *)buf = 134217984;
          v68 = v49 - v50;
          _os_signpost_emit_with_name_impl(&dword_1BE213000, v52, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MathRecognitionToDrawing", "%f", buf, 0xCu);
        }

        v53 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BE213000, v53, OS_LOG_TYPE_INFO, "DISCRETE \"MathRecognitionToDrawing\", buf, 2u);
        }

      }
    }
    v54 = dispatch_time(0, 100000000);
    v55[0] = v30;
    v55[1] = 3221225472;
    v55[2] = __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_131;
    v55[3] = &unk_1E7777588;
    objc_copyWeak(&v56, v4);
    dispatch_after(v54, MEMORY[0x1E0C80D38], v55);
    objc_destroyWeak(&v56);

  }
}

void __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_127(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "strokes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[PKStroke copyStrokes:hidden:](PKStroke, "copyStrokes:hidden:", v4, 1);

  v6 = *(id **)(a1 + 40);
  -[PKMathRecognitionViewController overlayDrawingController](v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "strokes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_2_129;
  v15[3] = &unk_1E777C068;
  v16 = *(id *)(a1 + 48);
  v17 = v5;
  v9 = *(id *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 64);
  v11 = *(void **)(a1 + 72);
  v18 = v9;
  v19 = v10;
  v26 = *(_QWORD *)(a1 + 96);
  v12 = *(_QWORD *)(a1 + 40);
  v20 = v3;
  v21 = v12;
  v22 = v11;
  v23 = *(id *)(a1 + 80);
  v24 = *(id *)(a1 + 88);
  v25 = *(id *)(a1 + 32);
  v13 = v3;
  v14 = v5;
  objc_msgSend(v6, "overlayController:imageViewForStrokes:completion:", v7, v8, v15);

}

void __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_2_129(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  id v54;
  id v55;
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  double v65;
  double v66;
  CGFloat v67;
  CGFloat v68;
  _QWORD v69[4];
  id v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[4];
  id v83;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_setAdditionalStrokes:inDrawing:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), &__block_literal_global_65);
  -[PKMathRecognitionViewController view](*(id **)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

  -[PKMathRecognitionViewController view](*(id **)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", *(_QWORD *)(a1 + 64));

  objc_msgSend(v3, "frame");
  v7 = v6;
  v9 = v8;
  v46 = v11;
  v47 = v10;
  DKDScaleRectAroundPoint(v6, v8, v10, v11, v6, v8, *(CGFloat *)(a1 + 112));
  v41 = v13;
  v42 = v12;
  v39 = v15;
  v40 = v14;
  objc_msgSend(*(id *)(a1 + 64), "frame");
  v44 = v17;
  v45 = v16;
  v43 = v18;
  v20 = v19;
  DKDScaleRectAroundPoint(v16, v17, v18, v19, v7, v9, *(CGFloat *)(a1 + 112));
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v29 = MEMORY[0x1E0C809B0];
  v30 = (void *)MEMORY[0x1E0DC3F10];
  v82[0] = MEMORY[0x1E0C809B0];
  v82[1] = 3221225472;
  v82[2] = __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_4;
  v82[3] = &unk_1E7778020;
  v83 = *(id *)(a1 + 64);
  objc_msgSend(v30, "performWithoutAnimation:", v82);
  v31 = (void *)MEMORY[0x1E0DC3F10];
  v80[0] = v29;
  v80[1] = 3221225472;
  v80[2] = __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_5;
  v80[3] = &unk_1E7778020;
  v81 = *(id *)(a1 + 64);
  objc_msgSend(v31, "animateWithDuration:animations:", v80, 0.2);
  v32 = (void *)MEMORY[0x1E0DC3F10];
  v69[0] = v29;
  v69[1] = 3221225472;
  v69[2] = __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_6;
  v69[3] = &unk_1E777C018;
  v70 = *(id *)(a1 + 64);
  v72 = v22;
  v73 = v24;
  v74 = v26;
  v75 = v28;
  v33 = v3;
  v71 = v33;
  v76 = v42;
  v77 = v41;
  v78 = v40;
  v79 = v39;
  objc_msgSend(v32, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v69, 0, 0.57, 0.0, 2.0, 300.0, 30.0, 0.0);
  v34 = (void *)MEMORY[0x1E0DC3F10];
  v58[0] = v29;
  v58[1] = 3221225472;
  v58[2] = __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_7;
  v58[3] = &unk_1E777C018;
  v59 = *(id *)(a1 + 64);
  v61 = v45;
  v62 = v44;
  v63 = v43;
  v64 = v20;
  v60 = v33;
  v65 = v7;
  v66 = v9;
  v67 = v47;
  v68 = v46;
  v48[0] = v29;
  v48[1] = 3221225472;
  v48[2] = __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_8;
  v48[3] = &unk_1E777C040;
  v49 = *(id *)(a1 + 32);
  v50 = *(id *)(a1 + 48);
  v51 = v60;
  v35 = *(id *)(a1 + 64);
  v36 = *(_QWORD *)(a1 + 72);
  v37 = *(void **)(a1 + 80);
  v52 = v35;
  v53 = v36;
  v54 = v37;
  v55 = *(id *)(a1 + 88);
  v56 = *(id *)(a1 + 96);
  v57 = *(id *)(a1 + 104);
  v38 = v60;
  objc_msgSend(v34, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v58, v48, 0.57, 0.97, 2.0, 300.0, 50.0, 0.0);

}

uint64_t __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  return objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
}

uint64_t __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_7(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  return objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
}

void __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_8(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id WeakRetained;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_9;
    v12[3] = &unk_1E7778020;
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v3, "_setAdditionalStrokes:inDrawing:completion:", MEMORY[0x1E0C9AA60], v4, v12);
    objc_msgSend(*(id *)(a1 + 56), "removeFromSuperview");
    -[PKMathRecognitionViewController overlayDrawingController](*(id **)(a1 + 64));
    v5 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKOverlayDrawingController updateDrawingView:strokes:animationType:result:imageView:](v5, *(void **)(a1 + 72), *(void **)(a1 + 80), 0, *(void **)(a1 + 88), *(void **)(a1 + 56));

    v6 = *(void **)(*(_QWORD *)(a1 + 64) + 176);
    objc_msgSend(*(id *)(a1 + 96), "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v7);

    v8 = *(_QWORD *)(a1 + 64);
    if ((*(_BYTE *)(v8 + 193) & 0x80) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(v8 + 240));
      v10 = *(_QWORD *)(a1 + 64);
      objc_msgSend(*(id *)(a1 + 96), "strokes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "mathViewController:selectStrokes:", v10, v11);

    }
  }
}

uint64_t __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

void __102__PKMathRecognitionViewController__presentResult_mathItem_defaultAnimationType_fromHint_hadOldResult___block_invoke_131(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && ((_BYTE)WeakRetained[24] & 1) != 0)
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 30);
    objc_msgSend(v2, "mathViewControllerUpdateFrameForContainer:", v3);

    WeakRetained = v3;
  }

}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  UIEditMenuInteraction *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t i;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  double v27;
  id WeakRetained;
  void *v29;
  const __CFString *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  id v35;
  id v36;
  UIEditMenuInteraction *v37;
  PKMathRecognitionToken *v38;
  _QWORD v39[4];
  PKMathRecognitionToken *v40;
  id v41;
  __CFString *v42;
  id v43;
  id location;

  v8 = (UIEditMenuInteraction *)a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  if (self->_alternativedEditMenuInteraction == v8)
  {
    -[PKMathRecognitionToken alternatives](self->_currentMenuToken, "alternatives");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      v35 = v10;
      v36 = v9;
      v37 = v8;
      v38 = self->_currentMenuToken;
      -[PKMathRecognitionToken item](v38, "item");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = 0; ; ++i)
      {
        -[PKMathRecognitionToken alternatives](self->_currentMenuToken, "alternatives", v35, v36, v37);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        if (i >= v17)
          break;
        -[PKMathRecognitionToken alternatives](self->_currentMenuToken, "alternatives");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", i);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = v19;
        -[PKMathRecognitionToken renderableAlternatives](self->_currentMenuToken, "renderableAlternatives");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "count");

        v23 = v20;
        if (i < v22)
        {
          -[PKMathRecognitionToken renderableAlternatives](self->_currentMenuToken, "renderableAlternatives");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectAtIndexedSubscript:", i);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v25 = v23;
        if ((*((_BYTE *)&self->_delegateFlags + 1) & 4) != 0)
        {
          v27 = +[PKMathTypesetViewController fontSize]();
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(WeakRetained, "mathViewController:createTypesetImageForExpression:latex:fontSize:", self, v25, 1, v27);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v26 = 0;
        }

        v29 = (void *)MEMORY[0x1E0DC3428];
        if (v26)
          v30 = &stru_1E777DEE8;
        else
          v30 = v20;
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __93__PKMathRecognitionViewController_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke;
        v39[3] = &unk_1E777C0E0;
        objc_copyWeak(&v43, &location);
        v40 = v38;
        v41 = v14;
        v31 = v20;
        v42 = v31;
        objc_msgSend(v29, "actionWithTitle:image:identifier:handler:", v30, v26, 0, v39);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v32);

        objc_destroyWeak(&v43);
      }

      v9 = v36;
      v8 = v37;
      v10 = v35;
    }
  }
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v11);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&location);

  return v33;
}

void __93__PKMathRecognitionViewController_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  _QWORD *v7;
  id v8;
  void *v9;
  _QWORD *v10;
  os_log_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id *v32;
  id *v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  os_log_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v6 = *(id *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  if (WeakRetained)
  {
    objc_msgSend(v7, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)WeakRetained + 1), "objectForKeyedSubscript:", v9);
    v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    if (v10 == v7)
    {
      objc_msgSend(v7, "expression");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (os_log_t)objc_msgSend(v12, "mutableCopy");

      v13 = objc_msgSend(v6, "characterRange");
      -[NSObject substringWithRange:](v11, "substringWithRange:", v13, v14);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138478339;
        v35 = v8;
        v36 = 2113;
        v37 = v15;
        v38 = 2113;
        v39 = v11;
        _os_log_impl(&dword_1BE213000, v16, OS_LOG_TYPE_DEFAULT, "Selected alternative: %{private}@, original: %{private}@, in: %{private}@", buf, 0x20u);
      }
      v29 = (void *)v15;
      v32 = v2;

      v17 = objc_msgSend(v6, "characterRange");
      -[NSObject replaceCharactersInRange:withString:](v11, "replaceCharactersInRange:withString:", v17, v18, v8);
      -[PKMathRecognitionItem heroStroke](v7);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      if ((*((_BYTE *)WeakRetained + 193) & 0x40) != 0
        && v19
        && (objc_msgSend(v7, "shouldSolveMathFlagIsSet") & 1) == 0)
      {
        -[PKMathRecognitionViewController _commitSetShouldSolve:undoable:item:]((uint64_t)WeakRetained, 1, 1, v7);
      }
      -[PKMathRecognitionItem _updatePreferredTranscriptionChangingToken:withAlternative:]((uint64_t)v7, v6, v8);
      -[PKMathRecognitionController _updateExpressionForItem:expression:](*((_QWORD *)WeakRetained + 32), v7, v11);
      objc_msgSend(*((id *)WeakRetained + 1), "allValues");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v6;
      v22 = objc_loadWeakRetained((id *)WeakRetained + 30);
      v28 = v20;
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
      v30 = v8;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v24 = v9;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "mathViewController:didUpdateExpressions:newExpressions:removedExpressions:mathItems:", WeakRetained, v23, v25, v26, v21);

      v9 = v24;
      v8 = v30;

      v6 = v31;
      v2 = v32;
    }
    else
    {
      v11 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BE213000, v11, OS_LOG_TYPE_ERROR, "Math item changed before selecting alternative.", buf, 2u);
      }
    }

  }
  v33 = (id *)objc_loadWeakRetained(v2);
  -[PKMathRecognitionViewController overlayDrawingController](v33);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKOverlayDrawingController removeToken:]((uint64_t)v27, *(void **)(a1 + 32));

}

- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5
{
  self->_menuIsVisible = 1;
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  PKMathRecognitionToken *currentMenuToken;
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __96__PKMathRecognitionViewController_editMenuInteraction_willDismissMenuForConfiguration_animator___block_invoke;
  v7[3] = &unk_1E7778020;
  v7[4] = self;
  objc_msgSend(a5, "addCompletion:", v7, a4);
  currentMenuToken = self->_currentMenuToken;
  self->_currentMenuToken = 0;

}

void __96__PKMathRecognitionViewController_editMenuInteraction_willDismissMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 104) = 0;
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 48))
  {
    if ((*(_BYTE *)(v1 + 194) & 4) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(v1 + 240));
      objc_msgSend(WeakRetained, "mathViewControllerDidDismissPopoverUI:", *(_QWORD *)(a1 + 32));

    }
  }
}

void __79__PKMathRecognitionViewController__fitBoundsForVariable_needExtraLeadingSlack___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

BOOL __79__PKMathRecognitionViewController__fitBoundsForVariable_needExtraLeadingSlack___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return *(_BYTE *)(a1[6] * a2 + a1[5] * a3 + a1[4] + 3) != 0;
}

BOOL __79__PKMathRecognitionViewController__fitBoundsForVariable_needExtraLeadingSlack___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  int v10;

  if (a3 >= a4)
    return 0;
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) != 0)
    return 1;
  v8 = a3 + 1;
  do
  {
    v9 = v8;
    if (a4 == v8)
      break;
    v10 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v8 = v9 + 1;
  }
  while (!v10);
  return v9 < a4;
}

- (void)scrubberController:(id)a3 valueDidChange:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  PKMathRecognitionController *v9;
  PKMathRecognitionController *v10;
  id WeakRetained;
  PKLiveMathVariable *liveVariable;
  PKLiveMathVariable *v13;
  PKLiveMathVariable *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  NSArray *v27;
  PKMathRecognitionItem *mathItem;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  id v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  id v51;
  CGImage *v52;
  size_t v53;
  unint64_t v54;
  CGColorSpace *DeviceRGB;
  uint64_t v56;
  CGContext *v57;
  double v58;
  double v59;
  CGFloat v60;
  double v61;
  double v62;
  double v63;
  double v64;
  uint64_t v65;
  void *v66;
  id v67;
  unsigned int (**v68)(void *, uint64_t, uint64_t, uint64_t);
  double v69;
  double v70;
  double MinX;
  double MinY;
  uint64_t v73;
  uint64_t MaxY;
  uint64_t v75;
  double v76;
  uint64_t v77;
  uint64_t v78;
  double MaxX;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  PKLiveMathVariable *v89;
  PKLiveMathVariable *v90;
  PKLiveMathVariable *v91;
  PKLiveMathVariable *v92;
  PKLiveMathVariable *v93;
  PKLiveMathVariable *v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  double v101;
  double v102;
  double v103;
  double v104;
  NSArray *v105;
  void *v106;
  CGFloat v107;
  void *v108;
  CGFloat v109;
  id v110;
  CGFloat rect;
  PKMathRecognitionController *recta;
  void *v113;
  unint64_t v114;
  void *v115;
  void *v116;
  id v117;
  void *v118;
  double height;
  double x;
  double width;
  double y;
  PKLiveMathVariable *v123;
  uint64_t v124;
  int v125;
  uint64_t v126;
  id v127;
  _QWORD v128[4];
  id v129;
  id location;
  _QWORD v131[4];
  id v132;
  _QWORD aBlock[7];
  CGAffineTransform v134;
  CGAffineTransform v135;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v138;
  _QWORD v139[5];
  CGAffineTransform v140;
  CGAffineTransform v141;
  CGAffineTransform v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;

  v6 = a3;
  v127 = a4;
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self);
  if (!self->_scrubberController)
    goto LABEL_61;
  -[PKMathRecognitionViewController tiledView]((id *)&self->super.isa);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_pauseHoverPreviewForTimeInterval:", 0.5);
  v118 = v7;
  objc_msgSend(v7, "inputScale");
  v124 = v8;
  objc_initWeak(&location, self);
  v125 = objc_msgSend(v127, "hasPrefix:", CFSTR("-"));
  v9 = self->_controller;
  v10 = v9;
  if (v9)
    WeakRetained = objc_loadWeakRetained((id *)&v9[1].super.isa);
  else
    WeakRetained = 0;
  liveVariable = self->_liveVariable;
  if (liveVariable)
    liveVariable = (PKLiveMathVariable *)liveVariable->_originalStrokesDrawing;
  v123 = liveVariable;
  v13 = self->_liveVariable;
  v117 = v6;
  if (v13)
  {
    y = v13->_originalStrokesBounds.origin.y;
    x = v13->_originalStrokesBounds.origin.x;
    width = v13->_originalStrokesBounds.size.width;
    height = v13->_originalStrokesBounds.size.height;
    v14 = v13;
    if (v125)
    {
      v15 = v14->_calculatedFitBoundsForExtraLeadingSlack.origin.x;
      v16 = v14->_calculatedFitBoundsForExtraLeadingSlack.origin.y;
      v17 = v14->_calculatedFitBoundsForExtraLeadingSlack.size.width;
      v18 = v14->_calculatedFitBoundsForExtraLeadingSlack.size.height;
      goto LABEL_9;
    }
    v24 = v14->_calculatedFitBounds.origin.x;
    v23 = v14->_calculatedFitBounds.origin.y;
    v25 = v14->_calculatedFitBounds.size.width;
    v26 = v14->_calculatedFitBounds.size.height;
LABEL_13:
    v143.origin.x = v24;
    v143.origin.y = v23;
    v143.size.width = v25;
    v143.size.height = v26;
    if (!CGRectIsNull(v143))
    {
      if (v13)
      {
        v19 = v13->_calculatedFitBounds.origin.x;
        v20 = v13->_calculatedFitBounds.origin.y;
        v22 = v13->_calculatedFitBounds.size.width;
        v21 = v13->_calculatedFitBounds.size.height;
        goto LABEL_54;
      }
LABEL_69:
      v21 = 0.0;
      v22 = 0.0;
      v20 = 0.0;
      v19 = 0.0;
      goto LABEL_54;
    }
LABEL_14:
    if (v13)
    {
      v27 = v13->_originalStrokes;
      mathItem = v13->_mathItem;
    }
    else
    {
      v27 = 0;
      mathItem = 0;
    }
    -[PKMathRecognitionItem strokes](mathItem, "strokes");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[PKMathRecognitionItem bounds](v13->_mathItem, "bounds");
      v30 = v29;
      v32 = v31;
      v34 = v33;
      v36 = v35;
      v107 = v13->_originalStrokesBounds.origin.x;
      rect = v13->_originalStrokesBounds.origin.y;
      v37 = v13->_originalStrokesBounds.size.width;
      v38 = v13->_originalStrokesBounds.size.height;
    }
    else
    {
      objc_msgSend(0, "bounds");
      v30 = v101;
      v32 = v102;
      v34 = v103;
      v36 = v104;
      v37 = 0.0;
      rect = 0.0;
      v38 = 0.0;
      v107 = 0.0;
    }
    v109 = v37;
    if (v37 >= v38)
      v39 = v37;
    else
      v39 = v38;
    v116 = (void *)objc_msgSend(v115, "mutableCopy");
    objc_msgSend(v116, "removeObjectsInArray:", v27);
    memset(&v142, 0, sizeof(v142));
    -[PKMathRecognitionViewController drawingTransform](&v142, (uint64_t)self);
    memset(&v141, 0, sizeof(v141));
    v140 = v142;
    CGAffineTransformInvert(&v141, &v140);
    v140 = v142;
    v144.origin.x = v30 - v39;
    v144.origin.y = v32;
    v144.size.width = v34 + v39 * 2.0;
    v144.size.height = v36;
    v145 = CGRectApplyAffineTransform(v144, &v140);
    v146.origin.x = DKDRoundedRectForScale(v145.origin.x, v145.origin.y, v145.size.width, v145.size.height, 1.0);
    v147 = CGRectInset(v146, -1.0, -1.0);
    v40 = v147.size.width;
    v41 = v147.size.height;
    v140 = v141;
    v148 = CGRectApplyAffineTransform(v147, &v140);
    v42 = v148.origin.x;
    v43 = v148.origin.y;
    v44 = v148.size.width;
    v45 = v148.size.height;
    v46 = objc_loadWeakRetained((id *)&self->_parentView);
    objc_msgSend(v46, "traitCollection");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "displayScale");
    v49 = v48;

    v50 = fmax(v49, 1.0);
    v51 = -[PKImageRenderer initSyncWithSize:scale:]([PKImageRenderer alloc], "initSyncWithSize:scale:", v40, v41, v50);
    v140.a = 0.0;
    *(_QWORD *)&v140.b = &v140;
    *(_QWORD *)&v140.c = 0x3032000000;
    *(_QWORD *)&v140.d = __Block_byref_object_copy__22;
    *(_QWORD *)&v140.tx = __Block_byref_object_dispose__22;
    v140.ty = 0.0;
    v139[0] = MEMORY[0x1E0C809B0];
    v139[1] = 3221225472;
    v139[2] = __79__PKMathRecognitionViewController__fitBoundsForVariable_needExtraLeadingSlack___block_invoke;
    v139[3] = &unk_1E777C108;
    v139[4] = &v140;
    objc_msgSend(v51, "renderStrokes:clippedToStrokeSpaceRect:scale:completion:", v116, v139, v42, v43, v44, v45, v50);
    v52 = (CGImage *)objc_msgSend(objc_retainAutorelease(*(id *)(*(_QWORD *)&v140.b + 40)), "CGImage");
    v53 = CGImageGetWidth(v52);
    v54 = CGImageGetHeight(v52);
    v106 = v51;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v56 = 4 * v53;
    v105 = v27;
    v113 = malloc_type_calloc(v54 * 4 * v53, 1uLL, 0x100004077774924uLL);
    v114 = v53;
    v57 = CGBitmapContextCreate(v113, v53, v54, 8uLL, 4 * v53, DeviceRGB, 0x4001u);
    CGColorSpaceRelease(DeviceRGB);
    v149.size.height = (double)v54;
    v149.origin.x = 0.0;
    v149.origin.y = 0.0;
    v149.size.width = (double)v114;
    CGContextDrawImage(v57, v149, v52);
    CGContextRelease(v57);
    memset(&v138, 0, sizeof(v138));
    CGAffineTransformMakeScale(&t1, v44 / (double)v114, v44 / (double)v114);
    CGAffineTransformMakeTranslation(&t2, v42, v43);
    CGAffineTransformConcat(&v138, &t1, &t2);
    v134 = v138;
    memset(&v135, 0, sizeof(v135));
    CGAffineTransformInvert(&v135, &v134);
    v134 = v135;
    v150.origin.x = v107;
    v150.size.width = v109;
    v150.origin.y = rect;
    v150.size.height = v38;
    v151 = CGRectApplyAffineTransform(v150, &v134);
    v58 = DKDRoundedRectForScale(v151.origin.x, v151.origin.y, v151.size.width, v151.size.height, 1.0);
    v60 = v59;
    v62 = v61;
    v64 = v63;
    v65 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__PKMathRecognitionViewController__fitBoundsForVariable_needExtraLeadingSlack___block_invoke_2;
    aBlock[3] = &__block_descriptor_56_e11_B24__0q8q16l;
    aBlock[4] = v113;
    aBlock[5] = v56;
    aBlock[6] = 4;
    v66 = _Block_copy(aBlock);
    v131[0] = v65;
    v131[1] = 3221225472;
    v131[2] = __79__PKMathRecognitionViewController__fitBoundsForVariable_needExtraLeadingSlack___block_invoke_3;
    v131[3] = &unk_1E777C150;
    v67 = v66;
    v132 = v67;
    v68 = (unsigned int (**)(void *, uint64_t, uint64_t, uint64_t))_Block_copy(v131);
    if (v62 >= v64)
      v69 = v62;
    else
      v69 = v64;
    if (v50 * 8.0 >= v69)
      v70 = v50 * 8.0;
    else
      v70 = v69;
    v152.origin.x = v58;
    v152.origin.y = v60;
    v152.size.width = v62;
    v152.size.height = v64;
    MinX = CGRectGetMinX(v152);
    v153.origin.x = v58;
    v153.origin.y = v60;
    v153.size.width = v62;
    v153.size.height = v64;
    MinY = CGRectGetMinY(v153);
    v110 = WeakRetained;
    recta = v10;
    v154.origin.x = v58;
    v154.origin.y = v60;
    v154.size.width = v62;
    v154.size.height = v64;
    v108 = v67;
    v73 = (uint64_t)MinX;
    MaxY = (uint64_t)CGRectGetMaxY(v154);
    v75 = ((uint64_t)MinX - (uint64_t)v70) & ~(((uint64_t)MinX - (uint64_t)v70) >> 63);
    v76 = 2.0;
    if (v125)
      v76 = 6.0;
    if (v75 <= v73)
    {
      v126 = (uint64_t)(v76 * v50);
      v78 = (uint64_t)MinX;
      while (!v68[2](v68, v78, (uint64_t)MinY, MaxY))
      {
        v77 = v78 - 1;
        if (v78-- <= v75)
          goto LABEL_41;
      }
      if (v126 + v78 >= v73)
        v77 = (uint64_t)MinX;
      else
        v77 = v126 + v78;
    }
    else
    {
      v77 = (uint64_t)MinX;
    }
LABEL_41:
    v155.origin.x = v58;
    v155.origin.y = v60;
    v155.size.width = v62;
    v155.size.height = v64;
    MaxX = CGRectGetMaxX(v155);
    v81 = (uint64_t)MaxX;
    if (v114 >= (uint64_t)MaxX + (uint64_t)v70)
      v82 = (uint64_t)MaxX + (uint64_t)v70;
    else
      v82 = v114;
    if (v82 > v81)
    {
      v83 = (uint64_t)(v50 + v50);
      v84 = (uint64_t)MaxX;
      while (!v68[2](v68, v84, (uint64_t)MinY, MaxY))
      {
        if (v82 == ++v84)
        {
          v81 = v82;
          goto LABEL_51;
        }
      }
      if (v84 - v83 > v81)
        v81 = v84 - v83;
    }
LABEL_51:
    WeakRetained = v110;
    v10 = recta;
    free(v113);
    v156.origin.x = (double)v77;
    v156.size.width = (double)(v81 - v77);
    v134 = v138;
    v156.origin.y = v60;
    v156.size.height = v64;
    v157 = CGRectApplyAffineTransform(v156, &v134);
    v19 = v157.origin.x;
    v20 = v157.origin.y;
    v22 = v157.size.width;
    v21 = v157.size.height;
    if (v13)
      v13->_calculatedFitBounds = v157;

    _Block_object_dispose(&v140, 8);
    goto LABEL_54;
  }
  v15 = 0.0;
  width = 0.0;
  y = 0.0;
  height = 0.0;
  x = 0.0;
  v16 = 0.0;
  v17 = 0.0;
  v18 = 0.0;
  v23 = 0.0;
  v25 = 0.0;
  v26 = 0.0;
  v24 = 0.0;
  if ((v125 & 1) == 0)
    goto LABEL_13;
LABEL_9:
  if (CGRectIsNull(*(CGRect *)&v15))
    goto LABEL_14;
  if (!v13)
    goto LABEL_69;
  v19 = v13->_calculatedFitBoundsForExtraLeadingSlack.origin.x;
  v20 = v13->_calculatedFitBoundsForExtraLeadingSlack.origin.y;
  v22 = v13->_calculatedFitBoundsForExtraLeadingSlack.size.width;
  v21 = v13->_calculatedFitBoundsForExtraLeadingSlack.size.height;
LABEL_54:

  v128[0] = MEMORY[0x1E0C809B0];
  v128[1] = 3221225472;
  v128[2] = __69__PKMathRecognitionViewController_scrubberController_valueDidChange___block_invoke;
  v128[3] = &unk_1E777C178;
  objc_copyWeak(&v129, &location);
  -[PKRecognitionSessionManager synthesizeDrawingForText:sourceDrawing:originalBounds:fitInBounds:inputScale:completion:]((uint64_t)WeakRetained, v127, v123, v128, x, y, width, height, v19, v20, v22, v21, v85, v86, v87, v88, v124);

  v89 = self->_liveVariable;
  if (v89)
    v89 = (PKLiveMathVariable *)v89->_mathItem;
  v90 = v89;
  v91 = self->_liveVariable;
  if (v91)
    v91 = (PKLiveMathVariable *)v91->_variable;
  v92 = v91;
  -[PKMathRecognitionItem _updateVariable:valueString:]((uint64_t)v90, v92, v127);

  v93 = self->_liveVariable;
  if (v93)
    v93 = (PKLiveMathVariable *)v93->_mathItem;
  v94 = v93;
  -[PKLiveMathVariable uuid](v94, "uuid");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allValues](self->_currentMathItemsLookup, "allValues");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "mathViewController:didUpdateExpressions:newExpressions:removedExpressions:mathItems:", self, v96, v98, v99, v100);

  objc_destroyWeak(&v129);
  objc_destroyWeak(&location);

  v6 = v117;
LABEL_61:
  if (self->_shouldAutohideScrubber)
    -[PKMathRecognitionViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_hideScrubber, 0, 3.0);

}

void __69__PKMathRecognitionViewController_scrubberController_valueDidChange___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id val;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id location;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  val = objc_loadWeakRetained(v6);
  v10 = v9;
  v11 = v8;
  v12 = v7;
  if (val)
  {
    objc_initWeak(&location, val);
    -[PKMathRecognitionViewController tiledView]((id *)val);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "selectionController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "strokes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMathRecognitionViewController drawing]((id *)val);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __98__PKMathRecognitionViewController__updateLiveVariableWithDrawing_tokenSymbols_tokenStrokeIndexes___block_invoke;
    v18[3] = &unk_1E777C1A0;
    objc_copyWeak(&v22, &location);
    v19 = v10;
    v20 = v11;
    v21 = v12;
    -[PKSelectionController _imageViewForStrokes:drawing:completion:]((uint64_t)v14, v15, v16, v18);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

}

- (void)_cleanupAfterScrubbing
{
  void *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD *v18;
  void *v19;
  _QWORD *v20;
  id v21;
  void *v22;
  _QWORD *v23;
  _QWORD *v24;
  void *v25;
  char v26;
  _QWORD *v27;
  _QWORD *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD *v35;
  void *v36;
  void *v37;
  _QWORD *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  os_log_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint8_t v57[16];

  if (a1)
  {
    v2 = *(void **)(a1 + 64);
    if (v2 && (*(_BYTE *)(a1 + 194) & 4) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 240));
      objc_msgSend(WeakRetained, "mathViewControllerDidDismissPopoverUI:", a1);

      v2 = *(void **)(a1 + 64);
    }
    *(_QWORD *)(a1 + 64) = 0;

    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", a1, sel_hideScrubber, 0);
    objc_msgSend(*(id *)(a1 + 56), "_setVisibilityUpdatesEnabled:", 1);
    v4 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = 0;

    v5 = *(_QWORD *)(a1 + 88);
    if (!v5)
      goto LABEL_40;
    if (*(_BYTE *)(v5 + 8))
    {
      v6 = objc_loadWeakRetained((id *)(a1 + 240));
      objc_msgSend(v6, "mathViewController:setHiddenStrokes:", a1, MEMORY[0x1E0C9AA60]);

      v7 = *(_QWORD *)(a1 + 88);
      if (!v7)
        goto LABEL_43;
      *(_BYTE *)(v7 + 8) = 0;
      v5 = *(_QWORD *)(a1 + 88);
      if (!v5)
        goto LABEL_43;
    }
    v8 = *(_QWORD *)(v5 + 32);
    if (!v8
      || (v9 = *(void **)(v8 + 32), *(_QWORD *)(v8 + 32) = 0, v9, (v5 = *(_QWORD *)(a1 + 88)) != 0))
    {
      v10 = *(void **)(v5 + 56);
    }
    else
    {
LABEL_43:
      v10 = 0;
    }
    objc_msgSend(v10, "strokes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (!v12)
      goto LABEL_38;
    v13 = *(_QWORD **)(a1 + 88);
    if (v13)
      v13 = (_QWORD *)v13[4];
    v14 = v13;
    objc_msgSend(v14, "uuid");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(void **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = v15;

    v17 = objc_loadWeakRetained((id *)(a1 + 240));
    v18 = *(_QWORD **)(a1 + 88);
    if (v18)
    {
      v19 = (void *)v18[5];
      v18 = (_QWORD *)v18[7];
    }
    else
    {
      v19 = 0;
    }
    v20 = v18;
    v21 = v19;
    objc_msgSend(v20, "strokes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "mathViewController:replaceStrokes:withStrokes:", a1, v21, v22);

    v23 = *(_QWORD **)(a1 + 88);
    if (v23)
      v23 = (_QWORD *)v23[4];
    v24 = v23;
    -[PKMathRecognitionItem mathResult]((uint64_t)v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_opt_respondsToSelector();

    if ((v26 & 1) == 0)
    {
LABEL_38:
      v54 = *(_QWORD *)(a1 + 88);
      if (v54)
      {
        v55 = *(void **)(v54 + 64);
LABEL_41:
        objc_msgSend(v55, "removeFromSuperview");
        v56 = *(void **)(a1 + 88);
        *(_QWORD *)(a1 + 88) = 0;

        return;
      }
LABEL_40:
      v55 = 0;
      goto LABEL_41;
    }
    v27 = *(_QWORD **)(a1 + 88);
    if (v27)
      v27 = (_QWORD *)v27[4];
    v28 = v27;
    -[PKMathRecognitionItem mathResult]((uint64_t)v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *(_QWORD *)(a1 + 88);
    if (v30)
    {
      v31 = *(id *)(v30 + 24);
      v32 = v31;
      if (v31)
      {
        v33 = (void *)*((_QWORD *)v31 + 4);
LABEL_25:
        v34 = v33;
        v35 = *(_QWORD **)(a1 + 88);
        if (v35)
        {
          v36 = (void *)v35[9];
          v37 = (void *)v35[10];
          v35 = (_QWORD *)v35[7];
        }
        else
        {
          v37 = 0;
          v36 = 0;
        }
        v38 = v35;
        v39 = v37;
        v40 = v36;
        objc_msgSend(v38, "CHDrawing");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (void *)objc_msgSend(v29, "newResultWithScrubbedStrokes:scrubbedValueTokens:scrubbedValueStrokeIndexes:scrubbedValueDrawing:", v34, v40, v39, v41);

        if (v42)
        {
          v43 = *(_QWORD *)(a1 + 88);
          if (v43)
            v44 = *(void **)(v43 + 32);
          else
            v44 = 0;
          objc_msgSend(v44, "strokes");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = (os_log_t)objc_msgSend(v45, "mutableCopy");

          v47 = *(_QWORD *)(a1 + 88);
          if (v47)
            v48 = *(_QWORD *)(v47 + 40);
          else
            v48 = 0;
          -[NSObject removeObjectsInArray:](v46, "removeObjectsInArray:", v48);
          v49 = *(_QWORD *)(a1 + 88);
          if (v49)
            v50 = *(void **)(v49 + 56);
          else
            v50 = 0;
          objc_msgSend(v50, "strokes");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObjectsFromArray:](v46, "addObjectsFromArray:", v51);

          -[PKMathRecognitionViewController recognitionManager](*(id **)(a1 + 256));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v46);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKRecognitionSessionManager cacheTranscription:strokeGroup:]((uint64_t)v52, v42, v53);

        }
        else
        {
          v46 = os_log_create("com.apple.pencilkit", ");
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v57 = 0;
            _os_log_error_impl(&dword_1BE213000, v46, OS_LOG_TYPE_ERROR, "Unable to add scrubbed expression in the transcription cache.", v57, 2u);
          }
        }

        goto LABEL_38;
      }
    }
    else
    {
      v32 = 0;
    }
    v33 = 0;
    goto LABEL_25;
  }
}

void __98__PKMathRecognitionViewController__updateLiveVariableWithDrawing_tokenSymbols_tokenStrokeIndexes___block_invoke(_QWORD *a1, void *a2)
{
  id *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _BYTE *v14;
  id v15;
  _QWORD *v16;
  uint64_t v17;
  _BYTE *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  _QWORD *v36;
  void *v37;
  id v38;
  id *v39;
  id *v40;
  id *v41;
  id *v42;
  void *v43;
  id *WeakRetained;

  v4 = (id *)(a1 + 7);
  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v4);
  v7 = (void *)a1[4];
  v6 = (void *)a1[5];
  v8 = (void *)a1[6];
  v9 = v7;
  v10 = v6;
  v11 = v8;
  v12 = v5;
  if (WeakRetained && WeakRetained[11])
  {
    -[PKMathRecognitionViewController tiledView](WeakRetained);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = WeakRetained[11];
    if (!v14 || !v14[8])
    {
      v15 = objc_loadWeakRetained(WeakRetained + 30);
      v16 = WeakRetained[11];
      v17 = v16 ? v16[5] : 0;
      objc_msgSend(v15, "mathViewController:setHiddenStrokes:", WeakRetained, v17);

      v18 = WeakRetained[11];
      if (v18)
        v18[8] = 1;
    }
    objc_msgSend(v12, "frame", v9);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v27 = objc_loadWeakRetained(WeakRetained + 31);
    objc_msgSend(v13, "convertRect:toView:", v27, v20, v22, v24, v26);
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;

    objc_msgSend(v12, "setFrame:", v29, v31, v33, v35);
    v36 = WeakRetained[11];
    if (v36)
      v37 = (void *)v36[8];
    else
      v37 = 0;
    objc_msgSend(v37, "removeFromSuperview");
    v38 = objc_loadWeakRetained(WeakRetained + 31);
    objc_msgSend(v38, "addSubview:", v12);

    v39 = (id *)WeakRetained[11];
    if (v39)
    {
      objc_storeStrong(v39 + 8, a2);
      v40 = (id *)WeakRetained[11];
      if (v40)
      {
        objc_storeStrong(v40 + 7, v7);
        v41 = (id *)WeakRetained[11];
        if (v41)
        {
          objc_storeStrong(v41 + 9, v6);
          v42 = (id *)WeakRetained[11];
          if (v42)
            objc_storeStrong(v42 + 10, v8);
        }
      }
    }

    v9 = v43;
  }

}

- (void)hideScrubber
{
  -[PKCalculateScrubberController hideScrubber](self->_scrubberController, "hideScrubber");
  -[PKMathRecognitionViewController _cleanupAfterScrubbing]((uint64_t)self);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)hoverController:(id)a3 holdGestureMeanInputPoint:(id *)a4 latestInputPoint:(id *)a5
{
  double x;
  double y;
  void *v8;
  id WeakRetained;
  double v10;
  uint64_t v11;
  id v12;
  _BOOL4 v13;
  float64x2_t v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGPoint v21;
  CGRect v22;

  x = a5->var0.var0.x;
  y = a5->var0.var0.y;
  -[PKMathRecognitionViewController tiledView]((id *)&self->super.isa);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);
  else
    WeakRetained = 0;
  objc_msgSend(v8, "convertPoint:toView:", WeakRetained, x, y);
  v16 = v11;
  v18 = v10;

  if (self)
    v12 = objc_loadWeakRetained((id *)&self->_parentView);
  else
    v12 = 0;
  objc_msgSend(v12, "bounds", v16);
  v21.y = v17;
  v21.x = v18;
  v13 = CGRectContainsPoint(v22, v21);

  if (v13)
  {
    memset(&v20, 0, sizeof(v20));
    -[PKMathRecognitionViewController drawingTransform](&v19, (uint64_t)self);
    CGAffineTransformInvert(&v20, &v19);
    v14 = vaddq_f64(*(float64x2_t *)&v20.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v20.c, v17), *(float64x2_t *)&v20.a, v18));
    if (-[PKMathRecognitionViewController _handleSingleTapAtDrawingLocation:fromHover:]((uint64_t)self, 1u, v14.f64[0], v14.f64[1]))
    {
      -[PKMathRecognitionViewController tiledView]((id *)&self->super.isa);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_pauseHoverPreviewForTimeInterval:", 0.5);

    }
  }
}

- (void)contextMenuController:(id)a3 removeResultForItemUUID:(id)a4
{
  _QWORD *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_currentMathItemsLookup, "objectForKeyedSubscript:", a4);
    v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[PKMathRecognitionViewController drawing]((id *)&self->super.isa);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKMathRecognitionItem _heroStrokeInDrawing:](v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v8 = os_log_create("com.apple.pencilkit", "Math");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v5, "expression");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = 138477827;
          v11 = v9;
          _os_log_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEFAULT, "Remove result for: %{private}@", (uint8_t *)&v10, 0xCu);

        }
        if (objc_msgSend(v5, "shouldSolveMathFlagIsSet"))
        {
          if ((*((_BYTE *)&self->_delegateFlags + 1) & 0x40) != 0)
            -[PKMathRecognitionViewController _commitSetShouldSolve:undoable:item:]((uint64_t)self, 0, 1, v5);
        }
      }

    }
  }
}

- (void)contextMenuController:(id)a3 solveItemUUID:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_currentResultsLookup, "objectForKeyedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_currentMathItemsLookup, "objectForKeyedSubscript:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[PKMathRecognitionViewController _commitSetShouldSolve:undoable:item:]((uint64_t)self, 1, 1, v8);
      -[PKMathRecognitionViewController _presentResult:mathItem:defaultAnimationType:fromHint:hadOldResult:]((uint64_t)self, v7, v8, (void *)1, 1, 1);
    }

  }
}

- (id)contextMenuController:(id)a3 resultDrawingForItemUUID:(id)a4
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_currentResultsDrawings, "objectForKeyedSubscript:", a4);
}

- (id)contextMenuController:(id)a3 resultForItemUUID:(id)a4
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_currentResultsLookup, "objectForKeyedSubscript:", a4);
}

- (id)contextMenuController:(id)a3 resultAttributionForItemUUID:(id)a4
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_currentResultsAttributionLookup, "objectForKeyedSubscript:", a4);
}

- (CGAffineTransform)contextMenuControllerDrawingTransform:(SEL)a3
{
  CGAffineTransform *result;

  -[PKMathRecognitionViewController drawingTransform](retstr, (uint64_t)self);
  return result;
}

- (id)contextMenuController:(id)a3 imageForItemUUID:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  NSMutableDictionary *currentResultsLookup;
  void *v9;
  void *v10;
  double v11;
  $A762C94CF618D886B575AAF925B431A1 delegateFlags;
  uint64_t v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_currentMathItemsLookup, "objectForKeyedSubscript:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (*((_BYTE *)&self->_delegateFlags + 1) & 0xC) != 0)
  {
    v7 = v5;
    currentResultsLookup = self->_currentResultsLookup;
    objc_msgSend(v7, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](currentResultsLookup, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = +[PKMathTypesetViewController fontSize]();
    delegateFlags = self->_delegateFlags;
    if ((*(_WORD *)&delegateFlags & 0x800) != 0)
    {
      if (objc_msgSend(v10, "length"))
        v13 = objc_msgSend(v7, "shouldSolveMathFlagIsSet");
      else
        v13 = 0;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v7, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "mathViewController:createTypesetImageForItemUUID:showResult:fontSize:", self, v16, v13, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
LABEL_17:

        goto LABEL_18;
      }
      delegateFlags = self->_delegateFlags;
    }
    if ((*(_WORD *)&delegateFlags & 0x400) != 0)
    {
      objc_msgSend(v7, "expressionToPresent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "length")
        && (objc_msgSend(v7, "isVerticalExpression") & 1) == 0
        && objc_msgSend(v7, "shouldSolveMathFlagIsSet"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ = %@"), v17, v10);
        v18 = objc_claimAutoreleasedReturnValue();

        v17 = (void *)v18;
      }
      v19 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v19, "mathViewController:createTypesetImageForExpression:latex:fontSize:", self, v17, 1, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }
    goto LABEL_17;
  }
  v14 = 0;
LABEL_18:

  return v14;
}

- (void)contextMenuController:(id)a3 dismissErrorForItem:(id)a4 token:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  -[PKMathRecognitionViewController overlayDrawingController]((id *)&self->super.isa);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PKOverlayDrawingController removeToken:]((uint64_t)v7, v6);

}

- (void)contextMenuController:(id)a3 addGraphForItemUUID:(id)a4 addToExisting:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  NSObject *v23;
  void *v24;
  id WeakRetained;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  uint64_t v35;
  CGRect v36;
  CGRect v37;

  v5 = a5;
  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "UUIDString", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v27 = v7;
  if (self)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v7);
    if (v8 && (*(_BYTE *)&self->_delegateFlags & 4) != 0)
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      -[NSMutableDictionary allValues](self->_currentMathItemsLookup, "allValues");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v29;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v29 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            objc_msgSend(v14, "uuid");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqual:", v8);

            if (v16)
            {
              v36.origin.x = -[PKMathRecognitionItem boundsForAnyEqualSign](v14);
              x = v36.origin.x;
              y = v36.origin.y;
              width = v36.size.width;
              height = v36.size.height;
              MidX = CGRectGetMidX(v36);
              v37.origin.x = x;
              v37.origin.y = y;
              v37.size.width = width;
              v37.size.height = height;
              MidY = CGRectGetMidY(v37);
              v23 = os_log_create("com.apple.pencilkit", "Math");
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v14, "expression");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138477827;
                v33 = v24;
                _os_log_impl(&dword_1BE213000, v23, OS_LOG_TYPE_DEFAULT, "Adding graph for expression: %{private}@", buf, 0xCu);

              }
              WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
              objc_msgSend(v14, "expression");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(WeakRetained, "mathViewController:addGraphForExpression:range:identifier:expressionLocation:addToExisting:", self, v26, v27, v5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), MidX, MidY);

              goto LABEL_16;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
          if (v11)
            continue;
          break;
        }
      }
LABEL_16:

    }
    v7 = v27;
  }

}

- (void)contextMenuControllerDidFinish:(id)a3
{
  -[PKMathRecognitionViewController setContextMenuController:]((uint64_t)self, 0);
}

- (int64_t)solvingStyle
{
  return self->_solvingStyle;
}

- (BOOL)shouldCacheDrawingForResults
{
  return self->_shouldCacheDrawingForResults;
}

- (void)setShouldCacheDrawingForResults:(BOOL)a3
{
  self->_shouldCacheDrawingForResults = a3;
}

- (double)canvasWidth
{
  return self->_canvasWidth;
}

- (void)setCanvasWidth:(double)a3
{
  self->_canvasWidth = a3;
}

- (UIViewController)viewControllerForPresentingUI
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewControllerForPresentingUI);
}

- (void)setViewControllerForPresentingUI:(id)a3
{
  objc_storeWeak((id *)&self->_viewControllerForPresentingUI, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextMenuController, 0);
  objc_storeStrong((id *)&self->_alternativedEditMenuInteraction, 0);
  objc_storeStrong((id *)&self->_overlayDrawingController, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_destroyWeak((id *)&self->_parentView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_viewControllerForPresentingUI);
  objc_storeStrong((id *)&self->_hoverController, 0);
  objc_storeStrong((id *)&self->_expressionsWeCreatedGraphsFor, 0);
  objc_storeStrong((id *)&self->_expressionsWithActiveAnimations, 0);
  objc_storeStrong((id *)&self->_solveItemUUID, 0);
  objc_storeStrong((id *)&self->_addGraphItemUUID, 0);
  objc_storeStrong((id *)&self->_popoverHintItemUUID, 0);
  objc_storeStrong((id *)&self->_solveResult, 0);
  objc_storeStrong((id *)&self->_currentMenuToken, 0);
  objc_storeStrong((id *)&self->_liveVariable, 0);
  objc_storeStrong((id *)&self->_uuidForLatestLiveVariableExpression, 0);
  objc_storeStrong((id *)&self->_scrubberController, 0);
  objc_storeStrong((id *)&self->_activeToolPickerForPresentedViewController, 0);
  objc_storeStrong((id *)&self->_typesetViewController, 0);
  objc_storeStrong((id *)&self->_mathFloatingLabelView, 0);
  objc_storeStrong((id *)&self->_currentResultsDrawings, 0);
  objc_storeStrong((id *)&self->_currentResultsAttributionLookup, 0);
  objc_storeStrong((id *)&self->_currentResultsLookup, 0);
  objc_storeStrong((id *)&self->_currentMathItemsLookup, 0);
}

@end
