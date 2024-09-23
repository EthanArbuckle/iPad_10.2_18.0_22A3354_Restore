@implementation PKTextInputInteraction

+ (id)interactionForScene:(id)a3
{
  return (id)objc_msgSend((id)_perSceneTextInputInteraction, "objectForKey:", a3);
}

- (PKTextInputInteraction)init
{
  id v2;
  int64_t v3;
  PKTextInputCanvasController *v4;
  void *v5;
  uint64_t v6;
  PKTextInputFeedbackController *v7;
  void *v8;
  PKTextInputPaletteController *v9;
  void *v10;
  PKTextInputCursorController *v11;
  void *v12;
  PKTextInputReserveSpaceController *v13;
  void *v14;
  PKTextInputDebugLogController *v15;
  void *v16;
  PKTextInputKeyboardSuppressionPolicyDelegate *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)PKTextInputInteraction;
  v2 = -[PKTextInputInteraction init](&v22, sel_init);
  if (v2)
  {
    v3 = +[PKTextInputSettings featureLevel](PKTextInputSettings, "featureLevel");
    *((_BYTE *)v2 + 8) = v3 != 0;
    if (v3)
    {
      v4 = objc_alloc_init(PKTextInputCanvasController);
      v5 = (void *)*((_QWORD *)v2 + 4);
      *((_QWORD *)v2 + 4) = v4;

      -[PKTextInputCanvasController setDelegate:](*((_QWORD *)v2 + 4), v2);
      v6 = *((_QWORD *)v2 + 4);
      if (v6)
        objc_storeWeak((id *)(v6 + 80), v2);
      v7 = objc_alloc_init(PKTextInputFeedbackController);
      v8 = (void *)*((_QWORD *)v2 + 5);
      *((_QWORD *)v2 + 5) = v7;

      objc_msgSend(*((id *)v2 + 5), "setDelegate:", v2);
      v9 = objc_alloc_init(PKTextInputPaletteController);
      v10 = (void *)*((_QWORD *)v2 + 6);
      *((_QWORD *)v2 + 6) = v9;

      objc_msgSend(*((id *)v2 + 6), "setDelegate:", v2);
      v11 = objc_alloc_init(PKTextInputCursorController);
      v12 = (void *)*((_QWORD *)v2 + 18);
      *((_QWORD *)v2 + 18) = v11;

      objc_msgSend(*((id *)v2 + 18), "setDelegate:", v2);
      v13 = -[PKTextInputReserveSpaceController initWithFeedbackController:]([PKTextInputReserveSpaceController alloc], "initWithFeedbackController:", *((_QWORD *)v2 + 5));
      v14 = (void *)*((_QWORD *)v2 + 19);
      *((_QWORD *)v2 + 19) = v13;

      objc_msgSend(*((id *)v2 + 19), "setDelegate:", v2);
      v15 = objc_alloc_init(PKTextInputDebugLogController);
      v16 = (void *)*((_QWORD *)v2 + 14);
      *((_QWORD *)v2 + 14) = v15;

      v17 = objc_alloc_init(PKTextInputKeyboardSuppressionPolicyDelegate);
      v18 = (void *)*((_QWORD *)v2 + 13);
      *((_QWORD *)v2 + 13) = v17;

      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSinceReferenceDate");
      *((_QWORD *)v2 + 10) = v20;

      +[PKTextInputAnalyticsController beginObservingSessionAnalytics](PKTextInputAnalyticsController, "beginObservingSessionAnalytics");
      +[PKPencilTouchDetectionService beginObservingTouchesForDetection](PKPencilTouchDetectionService, "beginObservingTouchesForDetection");
    }
  }
  return (PKTextInputInteraction *)v2;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;

  -[PKTextInputInteraction _canvasController](self, "_canvasController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputCanvasController setDelegate:]((uint64_t)v3, 0);

  -[PKTextInputInteraction _canvasController](self, "_canvasController");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    objc_storeWeak((id *)(v4 + 80), 0);

  -[PKTextInputInteraction _reserveSpaceController](self, "_reserveSpaceController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", 0);

  -[PKTextInputInteraction _containerView](self, "_containerView");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    objc_storeWeak((id *)(v7 + 416), 0);

  -[PKTextInputInteraction drawingGestureRecognizer](self, "drawingGestureRecognizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", 0);

  v10.receiver = self;
  v10.super_class = (Class)PKTextInputInteraction;
  -[PKTextInputInteraction dealloc](&v10, sel_dealloc);
}

+ (BOOL)writeCurrentPencilSharpenerLogsToURL:(id)a3 fullLogs:(BOOL)a4 windowScene:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  PKTextInputDebugSharpenerLog *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v6 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if ((os_variant_has_internal_diagnostics() & 1) != 0)
  {
    +[PKTextInputInteraction interactionForScene:](PKTextInputInteraction, "interactionForScene:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject debugLogController](v9, "debugLogController");
    v12 = (PKTextInputDebugSharpenerLog *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputDebugLogController sharpenerLogWithCurrentContent](v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v14 = 2;
    else
      v14 = 1;
    v19 = 0;
    v10 = objc_msgSend(v13, "writeToURL:withContentLevel:excludeEntyIndexes:error:", v7, v14, 0, &v19);
    v15 = v19;
    v16 = v15;
    if (v10)
      v17 = v15 == 0;
    else
      v17 = 0;
    if (!v17)
    {
      v18 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v21 = v7;
        v22 = 2112;
        v23 = v16;
        _os_log_error_impl(&dword_1BE213000, v18, OS_LOG_TYPE_ERROR, "Error writing pencil sharpener logs to url: %@, %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v9 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BE213000, v9, OS_LOG_TYPE_ERROR, "Only available in internal builds.", buf, 2u);
    }
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)willMoveToView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PKPencilSqueezeInteraction *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  PKPencilSqueezeInteraction *v20;
  void *v21;
  PKPencilSqueezeInteraction *v22;
  PKPencilSqueezeInteraction *pencilSqueezeInteraction;
  NSObject *v24;
  PKPencilSqueezeInteraction *v25;
  int v26;
  PKPencilSqueezeInteraction *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3938], "suppressionPolicyDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputInteraction _keyboardSuppressionPolicyDelegate](self, "_keyboardSuppressionPolicyDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v6)
      objc_msgSend(MEMORY[0x1E0DC3938], "setSuppressionPolicyDelegate:", 0);
  }
  -[PKTextInputInteraction set_hoverController:](self, "set_hoverController:", 0);
  -[PKTextInputInteraction _pencilObserverInteraction](self, "_pencilObserverInteraction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PKTextInputInteraction view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputInteraction _pencilObserverInteraction](self, "_pencilObserverInteraction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeInteraction:", v9);

    -[PKTextInputInteraction set_pencilObserverInteraction:](self, "set_pencilObserverInteraction:", 0);
  }
  v10 = _os_feature_enabled_impl();
  if (v4 && v10)
  {
    if (!self->__pencilSqueezeInteraction)
    {
      objc_msgSend(v4, "window");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "windowScene");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKPencilSqueezeInteraction _existingInteractionForWindowScene:](PKPencilSqueezeInteraction, "_existingInteractionForWindowScene:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = v13
          ? (PKPencilSqueezeInteraction *)v13
          : objc_alloc_init(PKPencilSqueezeInteraction);
      pencilSqueezeInteraction = self->__pencilSqueezeInteraction;
      self->__pencilSqueezeInteraction = v15;

      if (self->__pencilSqueezeInteraction)
      {
        v24 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = self->__pencilSqueezeInteraction;
          v26 = 134218243;
          v27 = v25;
          v28 = 2113;
          v29 = v4;
          _os_log_impl(&dword_1BE213000, v24, OS_LOG_TYPE_DEFAULT, "Adding pencil squeeze interaction: %p, to view: %{private}@", (uint8_t *)&v26, 0x16u);
        }

        objc_msgSend(v4, "addInteraction:", self->__pencilSqueezeInteraction);
      }
    }
  }
  else if (!v4)
  {
    if (self->__pencilSqueezeInteraction)
    {
      -[PKTextInputInteraction view](self, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "interactions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "indexOfObject:", self->__pencilSqueezeInteraction);

      if (v18 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v19 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          -[PKTextInputInteraction view](self, "view");
          v20 = (PKPencilSqueezeInteraction *)objc_claimAutoreleasedReturnValue();
          v26 = 138477827;
          v27 = v20;
          _os_log_impl(&dword_1BE213000, v19, OS_LOG_TYPE_DEFAULT, "Removing pencil squeeze interaction from view: %{private}@", (uint8_t *)&v26, 0xCu);

        }
        -[PKTextInputInteraction view](self, "view");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "removeInteraction:", self->__pencilSqueezeInteraction);

        v22 = self->__pencilSqueezeInteraction;
        self->__pencilSqueezeInteraction = 0;

      }
    }
  }

}

- (void)didMoveToView:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  const __CFString *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  void *v11;
  void *v12;
  void *v13;
  PKTextInputElementsController *v14;
  void *v15;
  id *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  _QWORD v34[4];
  char v35;
  uint8_t v36[8];
  _QWORD block[4];
  id v38;
  uint8_t buf[4];
  const __CFString *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v6)
      goto LABEL_10;
    if (self->_shouldBeActive)
      v7 = CFSTR("On");
    else
      v7 = CFSTR("Off");
    *(_DWORD *)buf = 138412290;
    v40 = v7;
    v8 = "Interaction moved to a view. Should be active: %@";
    v9 = v5;
    v10 = 12;
  }
  else
  {
    if (!v6)
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v8 = "Interaction uninstalled from its view.";
    v9 = v5;
    v10 = 2;
  }
  _os_log_impl(&dword_1BE213000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_10:

  if (self->_shouldBeActive)
  {
    objc_msgSend(v4, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "windowScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputInteraction saveInteractionForScene:](self, "saveInteractionForScene:", v12);

    -[PKTextInputInteraction setView:](self, "setView:", v4);
    -[PKTextInputInteraction view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = [PKTextInputElementsController alloc];
      -[PKTextInputInteraction view](self, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[PKTextInputElementsController initWithContainerView:]((id *)&v14->super.isa, v15);
      -[PKTextInputInteraction set_elementsController:](self, "set_elementsController:", v16);

      -[PKTextInputInteraction _elementsController](self, "_elementsController");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (v17)
        objc_storeWeak((id *)(v17 + 32), self);

      +[PKTextInputLanguageSelectionController sharedInstance](PKTextInputLanguageSelectionController, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObserver:", self);

    }
    else
    {
      -[PKTextInputInteraction set_elementsController:](self, "set_elementsController:", 0);
    }
    if (PK_UIApplicationIsSystemShell_onceToken != -1)
      dispatch_once(&PK_UIApplicationIsSystemShell_onceToken, &__block_literal_global_70);
    v20 = PK_UIApplicationIsSystemShell___result == 0;
    -[PKTextInputInteraction view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v20)
    {
      objc_msgSend(v21, "window");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "windowScene");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "coordinateSpace");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "bounds");
      -[PKTextInputInteraction setEditingOverlayContainerSceneBounds:](self, "setEditingOverlayContainerSceneBounds:");

    }
    else
    {
      objc_msgSend(v21, "superview");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "bounds");
      -[PKTextInputInteraction setEditingOverlayContainerSceneBounds:](self, "setEditingOverlayContainerSceneBounds:");
    }

    -[PKTextInputInteraction _updateInteractionEnabled](self, "_updateInteractionEnabled");
    -[PKTextInputInteraction _updateGestureRecognizers](self, "_updateGestureRecognizers");
    -[PKTextInputInteraction _updateElementsController](self, "_updateElementsController");
    -[PKTextInputInteraction _updatePaletteController](self, "_updatePaletteController");
    -[PKTextInputInteraction _updateContainerView](self, "_updateContainerView");
    if (v4)
    {
      objc_initWeak((id *)buf, self);
      v26 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __40__PKTextInputInteraction_didMoveToView___block_invoke;
      block[3] = &unk_1E7777588;
      objc_copyWeak(&v38, (id *)buf);
      dispatch_async(MEMORY[0x1E0C80D38], block);
      objc_msgSend(v4, "window");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "screen");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "displayIdentity");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "expectsSecureRendering");

      _PKSignpostLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v31))
      {
        *(_WORD *)v36 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BE213000, v31, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Prewarm text input block", (const char *)&unk_1BE532412, v36, 2u);
      }

      v32 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v36 = 0;
        _os_log_impl(&dword_1BE213000, v32, OS_LOG_TYPE_INFO, "BEGIN \"Prewarm text input block\", v36, 2u);
      }

      dispatch_get_global_queue(25, 0);
      v33 = objc_claimAutoreleasedReturnValue();
      v34[0] = v26;
      v34[1] = 3221225472;
      v34[2] = __40__PKTextInputInteraction_didMoveToView___block_invoke_31;
      v34[3] = &__block_descriptor_33_e5_v8__0l;
      v35 = v30;
      dispatch_async(v33, v34);

      objc_destroyWeak(&v38);
      objc_destroyWeak((id *)buf);
    }
  }
  +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");

}

void __40__PKTextInputInteraction_didMoveToView___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v2 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_INFO, "Checking if hover is supported", buf, 2u);
  }

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__PKTextInputInteraction_didMoveToView___block_invoke_25;
  v10[3] = &unk_1E7778C40;
  v3 = (id *)(a1 + 32);
  objc_copyWeak(&v11, v3);
  +[PKHoverSettings checkIfHoverIsSupported:](PKHoverSettings, "checkIfHoverIsSupported:", v10);
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)MEMORY[0x1E0DC3938];
    objc_msgSend(WeakRetained, "_keyboardSuppressionPolicyDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSuppressionPolicyDelegate:", v7);

    objc_msgSend(v5, "_keyboardSuppressionPolicyDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateKeyboardSuppressionPolicy");

    objc_msgSend(v5, "_paletteController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateFirstResponderVisibility");

  }
  objc_destroyWeak(&v11);
}

void __40__PKTextInputInteraction_didMoveToView___block_invoke_25(uint64_t a1, int a2)
{
  NSObject *v4;
  _QWORD *WeakRetained;
  void *v6;
  NSObject *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  id *v14;
  _DWORD v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v15[0] = 67109120;
    v15[1] = a2;
    _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_INFO, "Hover supported reply: %d", (uint8_t *)v15, 8u);
  }

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15[0]) = 0;
        _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_INFO, "Adding Hover interaction and controller", (uint8_t *)v15, 2u);
      }

      v8 = -[PKPencilObserverInteraction initWithDelegate:]([PKPencilObserverInteraction alloc], WeakRetained);
      v9 = (void *)WeakRetained[24];
      WeakRetained[24] = v8;

      objc_msgSend(WeakRetained, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addInteraction:", WeakRetained[24]);

      objc_msgSend(WeakRetained, "_containerView");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = (void *)v11;
        if (PK_UIApplicationIsSystemShell_onceToken != -1)
          dispatch_once(&PK_UIApplicationIsSystemShell_onceToken, &__block_literal_global_70);
        v13 = PK_UIApplicationIsSystemShell___result;

        if (!v13)
        {
          v14 = -[PKTextInputHoverController initWithDelegate:]((id *)[PKTextInputHoverController alloc], WeakRetained);
          objc_msgSend(WeakRetained, "set_hoverController:", v14);

        }
      }
    }

  }
}

void __40__PKTextInputInteraction_didMoveToView___block_invoke_31(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t v9[16];
  uint8_t v10[16];
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t buf[16];

  _PKSignpostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE213000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Prewarm text input work", (const char *)&unk_1BE532412, buf, 2u);
  }

  v3 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1BE213000, v3, OS_LOG_TYPE_INFO, "BEGIN \"Prewarm text input work\", v12, 2u);
  }

  +[PKTextInputCanvasController prewarmFutureCanvasesIfNecessarySecureRendering:]((uint64_t)PKTextInputCanvasController, *(unsigned __int8 *)(a1 + 32));
  _PKSignpostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE213000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Prewarm text input work", (const char *)&unk_1BE532412, v11, 2u);
  }

  v5 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_INFO, "END \"Prewarm text input work\", v10, 2u);
  }

  _PKSignpostLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE213000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Prewarm text input block", (const char *)&unk_1BE532412, v9, 2u);
  }

  v7 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_INFO, "END \"Prewarm text input block\", v8, 2u);
  }

}

- (void)saveInteractionForScene:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  -[PKTextInputInteraction view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)_perSceneTextInputInteraction;
    -[PKTextInputInteraction view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "windowScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v10);

  }
  v11 = v15;
  if (v15)
  {
    v12 = (void *)_perSceneTextInputInteraction;
    if (!_perSceneTextInputInteraction)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)_perSceneTextInputInteraction;
      _perSceneTextInputInteraction = v13;

      v12 = (void *)_perSceneTextInputInteraction;
    }
    objc_msgSend(v12, "setObject:forKey:", self, v15);
    v11 = v15;
  }

}

- (void)_setHandwritingInteractionEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->__handwritingInteractionEnabled != a3)
  {
    v3 = a3;
    self->__handwritingInteractionEnabled = a3;
    v5 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("Off");
      if (v3)
        v6 = CFSTR("On");
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEFAULT, "Changed interaction enabled state to: %@", (uint8_t *)&v7, 0xCu);
    }

    -[PKTextInputInteraction _updateContainerView](self, "_updateContainerView");
    -[PKTextInputInteraction _updateCanvasController](self, "_updateCanvasController");
    -[PKTextInputInteraction _updateElementsController](self, "_updateElementsController");
    -[PKTextInputInteraction _updateHandwritingController](self, "_updateHandwritingController");
    +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
  }
}

- (void)_setLastHandwritingEventTimestamp:(double)a3
{
  self->__lastHandwritingEventTimestamp = a3;
  -[PKTextInputInteraction _updateCanvasController](self, "_updateCanvasController");
  -[PKTextInputInteraction _updateContainerView](self, "_updateContainerView");
  -[PKTextInputInteraction _updateInteractionEnabled](self, "_updateInteractionEnabled");
  +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
}

- (void)setEditingOverlayContainerSceneBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(self->_editingOverlayContainerSceneBounds, a3))
  {
    self->_editingOverlayContainerSceneBounds.origin.x = x;
    self->_editingOverlayContainerSceneBounds.origin.y = y;
    self->_editingOverlayContainerSceneBounds.size.width = width;
    self->_editingOverlayContainerSceneBounds.size.height = height;
    -[PKTextInputInteraction _updatePaletteController](self, "_updatePaletteController");
  }
}

- (void)editingOverlayContainerDidChangeToSceneBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  id v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (PK_UIApplicationIsSystemShell_onceToken != -1)
    dispatch_once(&PK_UIApplicationIsSystemShell_onceToken, &__block_literal_global_70);
  if (PK_UIApplicationIsSystemShell___result)
    v8 = height;
  else
    v8 = width;
  if (PK_UIApplicationIsSystemShell___result)
    height = width;
  -[PKTextInputInteraction setEditingOverlayContainerSceneBounds:](self, "setEditingOverlayContainerSceneBounds:", x, y, v8, height);
  -[PKTextInputInteraction _paletteController](self, "_paletteController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "editingOverlayContainerDidChangeToSceneBounds:", x, y, v8, height);

}

- (void)_updateInteractionEnabled
{
  void *v3;
  _BOOL8 v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;

  -[PKTextInputInteraction view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  -[PKTextInputInteraction _canvasController](self, "_canvasController");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5 && (objc_msgSend(*(id *)(v5 + 96), "isDrawing") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    -[PKTextInputInteraction _reserveSpaceController](self, "_reserveSpaceController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isReserveSpaceActive");

  }
  -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "writingState");

    if (v11 == 1)
      v7 = 1;
  }

  if (v3 && (v7 & 1) == 0)
  {
    +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "interactionDisablingDelay");
    v14 = v13;

    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v16 = v15;
    -[PKTextInputInteraction _lastHandwritingEventTimestamp](self, "_lastHandwritingEventTimestamp");
    v4 = v16 - v17 < v14;
  }
  -[PKTextInputInteraction _setHandwritingInteractionEnabled:](self, "_setHandwritingInteractionEnabled:", v4);
  -[PKTextInputInteraction _canvasController](self, "_canvasController");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18 && *(_BYTE *)(v18 + 65) != v4)
  {
    *(_BYTE *)(v18 + 65) = v4;
    -[PKTextInputCanvasController _updateCanvasView](v18);
  }

  if (v4)
  {
    +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "interactionDisablingDelay");
    v22 = v21;

    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__updateInteractionEnabled, 0);
    -[PKTextInputInteraction performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__updateInteractionEnabled, 0, v22 + 0.1);
  }
}

- (void)_updateGestureRecognizers
{
  void *v3;
  void *v4;
  PKTextInputDrawingGestureRecognizer *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  PKTextInputTouchDetectionGestureRecognizer *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;

  -[PKTextInputInteraction view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKTextInputInteraction drawingGestureRecognizer](self, "drawingGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || v4)
  {
    if (!v3 && v4)
    {
      -[PKTextInputInteraction drawingGestureRecognizer](self, "drawingGestureRecognizer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDelegate:", 0);

      -[PKTextInputInteraction view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputInteraction drawingGestureRecognizer](self, "drawingGestureRecognizer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeGestureRecognizer:", v9);

      -[PKTextInputInteraction setDrawingGestureRecognizer:](self, "setDrawingGestureRecognizer:", 0);
    }
  }
  else
  {
    v5 = objc_alloc_init(PKTextInputDrawingGestureRecognizer);
    -[PKTextInputInteraction setDrawingGestureRecognizer:](self, "setDrawingGestureRecognizer:", v5);
    -[PKTextInputDrawingGestureRecognizer setDelegate:](v5, "setDelegate:", self);
    -[PKTextInputInteraction view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addGestureRecognizer:", v5);

  }
  -[PKTextInputInteraction view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[PKTextInputInteraction reserveSpaceController](self, "reserveSpaceController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isReserveSpaceActive");

  }
  else
  {
    v12 = 0;
  }

  -[PKTextInputInteraction _touchDetectionGestureRecognizer](self, "_touchDetectionGestureRecognizer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12 || v13)
  {
    if (v13)
      v16 = v12;
    else
      v16 = 1;
    if ((v16 & 1) == 0)
    {
      -[PKTextInputInteraction view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputInteraction _touchDetectionGestureRecognizer](self, "_touchDetectionGestureRecognizer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeGestureRecognizer:", v18);

      -[PKTextInputInteraction _touchDetectionGestureRecognizer](self, "_touchDetectionGestureRecognizer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setDelegate:", 0);

      -[PKTextInputInteraction set_touchDetectionGestureRecognizer:](self, "set_touchDetectionGestureRecognizer:", 0);
    }
  }
  else
  {
    v14 = objc_alloc_init(PKTextInputTouchDetectionGestureRecognizer);
    -[PKTextInputTouchDetectionGestureRecognizer setDelegate:](v14, "setDelegate:", self);
    -[PKTextInputInteraction set_touchDetectionGestureRecognizer:](self, "set_touchDetectionGestureRecognizer:", v14);
    -[PKTextInputInteraction view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addGestureRecognizer:", v14);

  }
  -[PKTextInputInteraction _updateCanvasController](self, "_updateCanvasController");
}

- (void)_updateContainerView
{
  void *v3;
  void *v4;
  PKTContainerView *v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _BYTE *v23;
  _BOOL4 v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint8_t buf[4];
  const __CFString *v49;
  __int16 v50;
  void *v51;
  _QWORD v52[6];

  v52[4] = *MEMORY[0x1E0C80C00];
  -[PKTextInputInteraction view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKTextInputInteraction _containerView](self, "_containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && !v4)
  {
    v47 = v3;
    v5 = [PKTContainerView alloc];
    v6 = -[PKTContainerView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "setHidden:", 1);
    if (v6)
      objc_storeWeak(v6 + 52, self);
    -[PKTextInputInteraction set_containerView:](self, "set_containerView:", v6);
    -[PKTextInputInteraction view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v6);

    objc_msgSend(v6, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputInteraction view](self, "view");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v44);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v43;
    objc_msgSend(v6, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputInteraction view](self, "view");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v40);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v39;
    objc_msgSend(v6, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputInteraction view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v52[2] = v10;
    objc_msgSend(v6, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputInteraction view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v52[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v15);
    v4 = 0;
    v3 = v47;
    goto LABEL_10;
  }
  if (!v3 && v4)
  {
    -[PKTextInputInteraction _containerView](self, "_containerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeFromSuperview");

    -[PKTextInputInteraction set_containerView:](self, "set_containerView:", 0);
    goto LABEL_25;
  }
  if (v3)
  {
LABEL_10:
    -[PKTextInputInteraction _containerView](self, "_containerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isHidden");

    -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "writingState");

      if (v22 == 1)
      {
        v24 = 1;
        goto LABEL_17;
      }
      if (v22)
      {
        v24 = 0;
        goto LABEL_21;
      }
    }
    -[PKTextInputInteraction canvasController](self, "canvasController");
    v23 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    if (v23)
      v24 = v23[64] != 0;
    else
      v24 = 0;

LABEL_17:
    if ((v24 & v18) == 1)
    {
      v25 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
          v31 = CFSTR("Y");
        else
          v31 = CFSTR("N");
        -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        PKTextInputDescriptionForWritingState(objc_msgSend(v32, "writingState"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v49 = v31;
        v50 = 2112;
        v51 = v33;
        _os_log_debug_impl(&dword_1BE213000, v25, OS_LOG_TYPE_DEBUG, "Showing container view. Has handwritingController: %@, writingState: %@", buf, 0x16u);

      }
      -[PKTextInputInteraction _containerView](self, "_containerView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      v28 = 0;
LABEL_24:
      objc_msgSend(v26, "setHidden:", v28);

      +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
      goto LABEL_25;
    }
LABEL_21:
    if (((v24 | v18) & 1) != 0)
      goto LABEL_25;
    v29 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
        v35 = CFSTR("Y");
      else
        v35 = CFSTR("N");
      -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      PKTextInputDescriptionForWritingState(objc_msgSend(v36, "writingState"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v49 = v35;
      v50 = 2112;
      v51 = v37;
      _os_log_debug_impl(&dword_1BE213000, v29, OS_LOG_TYPE_DEBUG, "Hiding container view. Has handwritingController: %@, writingState: %@", buf, 0x16u);

    }
    -[PKTextInputInteraction _containerView](self, "_containerView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = 1;
    goto LABEL_24;
  }
LABEL_25:
  if ((v3 != 0) != (v4 != 0))
  {
    -[PKTextInputInteraction _updateCanvasController](self, "_updateCanvasController");
    +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
  }
}

- (void)_updateCanvasController
{
  _BYTE *v3;
  int v4;
  void *v5;
  char v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  os_log_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  int v30;
  void *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  const __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[PKTextInputInteraction _canvasController](self, "_canvasController");
  v3 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = v3[64] != 0;
  else
    v4 = 0;

  -[PKTextInputInteraction _reserveSpaceController](self, "_reserveSpaceController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isReserveSpaceActive");

  if ((v6 & 1) != 0)
    goto LABEL_4;
  -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "writingState");

    if (v11 == 1)
    {
LABEL_4:
      v7 = 1;
      goto LABEL_13;
    }
    if (v11)
    {
      v7 = 0;
      goto LABEL_13;
    }
  }
  -[PKTextInputInteraction _canvasController](self, "_canvasController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[PKTextInputCanvasController canvasHasVisibleStrokes]((uint64_t)v12) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    -[PKTextInputInteraction drawingGestureRecognizer](self, "drawingGestureRecognizer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v13, "drawingTargetIsDrawing");

  }
LABEL_13:
  -[PKTextInputInteraction _canvasController](self, "_canvasController");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14 && *(unsigned __int8 *)(v14 + 64) != v7)
  {
    *(_BYTE *)(v14 + 64) = v7;
    -[PKTextInputCanvasController _updateCanvasView](v14);
  }

  if (v4 != v7)
    -[PKTextInputInteraction _updateContainerView](self, "_updateContainerView");
  if (((v4 | v7 ^ 1) & 1) == 0)
  {
    v17 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      PKTextInputDescriptionForWritingState(objc_msgSend(v18, "writingState"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputInteraction _canvasController](self, "_canvasController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PKTextInputCanvasController canvasHasVisibleStrokes]((uint64_t)v20))
        v21 = CFSTR("Yes");
      else
        v21 = CFSTR("No");
      -[PKTextInputInteraction drawingGestureRecognizer](self, "drawingGestureRecognizer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412802;
      if (objc_msgSend(v22, "drawingTargetIsDrawing"))
        v23 = CFSTR("Yes");
      else
        v23 = CFSTR("No");
      v31 = v19;
      v32 = 2112;
      v33 = v21;
      v34 = 2112;
      v35 = v23;
      _os_log_debug_impl(&dword_1BE213000, v17, OS_LOG_TYPE_DEBUG, "Showing canvas view. writingState: %@, canvas has strokes: %@, gesture is drawing: %@", (uint8_t *)&v30, 0x20u);

    }
    -[PKTextInputInteraction view](self, "view");
    v16 = (os_log_t)objc_claimAutoreleasedReturnValue();
    -[NSObject layoutIfNeeded](v16, "layoutIfNeeded");
    goto LABEL_25;
  }
  if ((v7 & 1) == 0 && ((v4 ^ 1) & 1) == 0)
  {
    v16 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      PKTextInputDescriptionForWritingState(objc_msgSend(v24, "writingState"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputInteraction _canvasController](self, "_canvasController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PKTextInputCanvasController canvasHasVisibleStrokes]((uint64_t)v26))
        v27 = CFSTR("Yes");
      else
        v27 = CFSTR("No");
      -[PKTextInputInteraction drawingGestureRecognizer](self, "drawingGestureRecognizer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412802;
      if (objc_msgSend(v28, "drawingTargetIsDrawing"))
        v29 = CFSTR("Yes");
      else
        v29 = CFSTR("No");
      v31 = v25;
      v32 = 2112;
      v33 = v27;
      v34 = 2112;
      v35 = v29;
      _os_log_debug_impl(&dword_1BE213000, v16, OS_LOG_TYPE_DEBUG, "Hiding canvas view. writingState: %@, canvas has strokes: %@, gesture is drawing: %@", (uint8_t *)&v30, 0x20u);

    }
LABEL_25:

  }
}

- (void)_updateHandwritingController
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  PKTextInputHandwritingController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PKTextInputHandwritingController *v13;
  void *v14;
  char v15;
  void *v16;

  if (-[PKTextInputInteraction _handwritingInteractionEnabled](self, "_handwritingInteractionEnabled"))
  {
    -[PKTextInputInteraction _elementsController](self, "_elementsController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 != 0;

  }
  else
  {
    v4 = 0;
  }
  -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 || v5)
  {
    if (v5)
      v15 = v4;
    else
      v15 = 1;
    if ((v15 & 1) == 0)
    {
      -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setDelegate:", 0);

      -[PKTextInputInteraction set_handwritingController:](self, "set_handwritingController:", 0);
    }
  }
  else
  {
    v6 = [PKTextInputHandwritingController alloc];
    -[PKTextInputInteraction _canvasController](self, "_canvasController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputInteraction _elementsController](self, "_elementsController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputInteraction _feedbackController](self, "_feedbackController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputInteraction _reserveSpaceController](self, "_reserveSpaceController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputInteraction _debugLogController](self, "_debugLogController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputInteraction _cursorController](self, "_cursorController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PKTextInputHandwritingController initWithCanvasController:elementsController:feedbackController:reserveSpaceController:debugLogController:cursorController:](v6, "initWithCanvasController:elementsController:feedbackController:reserveSpaceController:debugLogController:cursorController:", v7, v8, v9, v10, v11, v12);
    -[PKTextInputInteraction set_handwritingController:](self, "set_handwritingController:", v13);

    -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDelegate:", self);

  }
  if (v4 != (v5 != 0))
    -[PKTextInputInteraction _updateContainerView](self, "_updateContainerView");
}

- (void)_updateElementsController
{
  void *v3;
  void *v4;

  if (!-[PKTextInputInteraction _handwritingInteractionEnabled](self, "_handwritingInteractionEnabled")
    || (-[PKTextInputInteraction view](self, "view"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    -[PKTextInputInteraction _elementsController](self, "_elementsController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputElementsController flushDiscoveredElements]((uint64_t)v4);

  }
  -[PKTextInputInteraction _updateDebugController](self, "_updateDebugController");
}

- (void)_updatePaletteController
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  -[PKTextInputInteraction editingOverlayContainerSceneBounds](self, "editingOverlayContainerSceneBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKTextInputInteraction _paletteController](self, "_paletteController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEditingOverlayContainerSceneBounds:", v4, v6, v8, v10);

}

- (void)_setDebugControllerAnchorCorner:(unint64_t)a3
{
  if (self->__debugControllerAnchorCorner != a3)
  {
    self->__debugControllerAnchorCorner = a3;
    -[PKTextInputInteraction _updateDebugController](self, "_updateDebugController");
  }
}

- (void)_handlePotentialDebugOverlayGestureAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double MaxX;
  void *v8;
  double MaxY;
  uint64_t v10;
  _BOOL4 v11;
  double v13;
  BOOL v14;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect v20;

  y = a3.y;
  x = a3.x;
  if (os_variant_has_internal_diagnostics())
  {
    -[PKTextInputInteraction view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    MaxX = CGRectGetMaxX(v19);

    -[PKTextInputInteraction view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    MaxY = CGRectGetMaxY(v20);

    if (x > 20.0 || x < 0.0 || y > 20.0 || y < 0.0)
    {
      v11 = MaxX - x <= 20.0;
      if (MaxX - x <= 0.0)
        v11 = 0;
      if (!v11 || y > 20.0)
      {
        v13 = MaxY - y;
        if (x > 20.0 || (v13 > 0.0 ? (v14 = v13 > 20.0) : (v14 = 1), v14))
        {
          if (v13 <= 0.0)
            v11 = 0;
          if (!v11 || v13 > 20.0)
          {
            v10 = 0;
            v16 = 0.0;
            goto LABEL_29;
          }
          v10 = 8;
        }
        else
        {
          v10 = 4;
        }
      }
      else
      {
        v10 = 2;
      }
    }
    else
    {
      v10 = 1;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v16 = v17;
    -[PKTextInputInteraction _lastDebugCornerEventTimestamp](self, "_lastDebugCornerEventTimestamp");
    if (v16 - v18 >= 0.2)
    {
LABEL_30:
      -[PKTextInputInteraction set_lastDebugCornerEventTimestamp:](self, "set_lastDebugCornerEventTimestamp:", v16);
      return;
    }
LABEL_29:
    -[PKTextInputInteraction _setDebugControllerAnchorCorner:](self, "_setDebugControllerAnchorCorner:", v10);
    goto LABEL_30;
  }
}

- (void)_updateDebugController
{
  unint64_t v3;
  void *v4;
  PKTextInputDebugViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PKTextInputDebugStateIntrospector *v10;
  void *v11;
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
  unint64_t v22;
  id v23;

  v3 = -[PKTextInputInteraction _debugControllerAnchorCorner](self, "_debugControllerAnchorCorner");
  -[PKTextInputInteraction _debugViewController](self, "_debugViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || v4)
  {
    if (!v3 && v4)
    {
      -[PKTextInputInteraction _debugViewController](self, "_debugViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeFromSuperview");

      -[PKTextInputInteraction _debugViewController](self, "_debugViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "willMoveToParentViewController:", 0);

      -[PKTextInputInteraction _debugViewController](self, "_debugViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeFromParentViewController");

      -[PKTextInputInteraction _debugViewController](self, "_debugViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setIntrospectorDataSource:", 0);

      -[PKTextInputInteraction _debugStateIntrospector](self, "_debugStateIntrospector");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setDelegate:", 0);

      -[PKTextInputInteraction set_debugStateIntrospector:](self, "set_debugStateIntrospector:", 0);
      -[PKTextInputInteraction set_debugViewController:](self, "set_debugViewController:", 0);
    }
  }
  else
  {
    v5 = objc_alloc_init(PKTextInputDebugViewController);
    -[PKTextInputInteraction set_debugViewController:](self, "set_debugViewController:", v5);
    -[PKTextInputDebugViewController setDelegate:](v5, "setDelegate:", self);
    -[PKTextInputInteraction _debugLogController](self, "_debugLogController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputDebugViewController setDebugLogController:](v5, "setDebugLogController:", v6);

    -[PKTextInputDebugViewController view](v5, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputInteraction view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    objc_msgSend(v7, "setFrame:");

    objc_msgSend(v7, "setAutoresizingMask:", 18);
    -[PKTextInputInteraction view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v7);

    v10 = -[PKTextInputDebugStateIntrospector initWithInteraction:]([PKTextInputDebugStateIntrospector alloc], "initWithInteraction:", self);
    -[PKTextInputInteraction set_debugStateIntrospector:](self, "set_debugStateIntrospector:", v10);

    -[PKTextInputInteraction _debugStateIntrospector](self, "_debugStateIntrospector");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", v5);

    -[PKTextInputInteraction _debugStateIntrospector](self, "_debugStateIntrospector");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputDebugViewController setIntrospectorDataSource:](v5, "setIntrospectorDataSource:", v12);

    -[PKTextInputInteraction _debugViewController](self, "_debugViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNeedsReloadDebugStateData");

  }
  -[PKTextInputInteraction elementsController](self, "elementsController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputInteraction _debugViewController](self, "_debugViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setElementsController:", v20);

  v22 = -[PKTextInputInteraction _debugControllerAnchorCorner](self, "_debugControllerAnchorCorner");
  -[PKTextInputInteraction _debugViewController](self, "_debugViewController");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setStatusViewAnchorCorner:", v22);

}

- (id)paletteControllerDebugSharpenerLog:(id)a3
{
  PKTextInputDebugSharpenerLog *v3;
  void *v4;

  -[PKTextInputInteraction debugLogController](self, "debugLogController", a3);
  v3 = (PKTextInputDebugSharpenerLog *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugLogController sharpenerLogWithCurrentContent](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)textInputPaletteControllerFloatingKeyboardWillHide:(id)a3
{
  id v3;

  -[PKTextInputInteraction _keyboardSuppressionPolicyDelegate](self, "_keyboardSuppressionPolicyDelegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsFloatingKeyboardVisible:", 0);

}

- (void)textInputPaletteControllerFloatingKeyboardWillShow:(id)a3
{
  void *v4;
  id v5;

  -[PKTextInputInteraction _cursorController](self, "_cursorController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "makeCursorStrong");

  -[PKTextInputInteraction _keyboardSuppressionPolicyDelegate](self, "_keyboardSuppressionPolicyDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsFloatingKeyboardVisible:", 1);

}

- (id)canvasControllerDrawingGestureRecognizer:(id)a3
{
  -[PKTextInputInteraction _updateGestureRecognizers](self, "_updateGestureRecognizers", a3);
  return -[PKTextInputInteraction drawingGestureRecognizer](self, "drawingGestureRecognizer");
}

- (void)canvasControllerCanvasDidFinishAnimatingStrokes:(id)a3
{
  void *v4;
  uint64_t v5;
  id *v6;
  id *v7;

  v7 = (id *)a3;
  -[PKTextInputInteraction handwritingController](self, "handwritingController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "writingState");

  v6 = v7;
  if (v7 && !v5)
  {
    objc_msgSend(v7[12], "removeStuckStrokesAndSimulateCrashIfNecessary");
    v6 = v7;
  }

}

- (void)canvasControllerDidEndDrawing:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  -[PKTextInputInteraction _setLastHandwritingEventTimestamp:](self, "_setLastHandwritingEventTimestamp:");
  -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "canvasControllerDidEndDrawing:", v5);

  -[PKTextInputInteraction _reserveSpaceController](self, "_reserveSpaceController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCanvasControllerIsDrawing:", 0);

  -[PKTextInputInteraction _updateCanvasController](self, "_updateCanvasController");
  -[PKTextInputInteraction _updateInteractionEnabled](self, "_updateInteractionEnabled");
}

- (void)canvasControllerInProgressStrokeDidChange:(id)a3
{
  uint64_t *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  -[PKTextInputInteraction _hoverController](self, "_hoverController");
  v4 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputHoverController didReceiveNormalTouch:](v4, 0);

  -[PKTextInputInteraction drawingGestureRecognizer](self, "drawingGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "strokeAcceptanceState") != 1)
    goto LABEL_5;
  -[PKTextInputInteraction canvasController](self, "canvasController");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_5;
  v7 = (void *)v6;
  v8 = objc_msgSend(*(id *)(v6 + 96), "isDrawing");

  if (v8)
  {
    -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "canvasControllerInProgressStrokeDidChange:", v9);
LABEL_5:

  }
}

- (void)canvasControllerDidCancelStroke:(id)a3 strokeAcceptanceState:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "canvasControllerDidCancelStroke:strokeAcceptanceState:", v6, a4);

  -[PKTextInputInteraction _reserveSpaceController](self, "_reserveSpaceController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCanvasControllerIsDrawing:", 0);

  -[PKTextInputInteraction _updateCanvasController](self, "_updateCanvasController");
}

- (void)canvasControllerEndedStroke:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  -[PKTextInputInteraction _setLastHandwritingEventTimestamp:](self, "_setLastHandwritingEventTimestamp:");
  -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "canvasControllerEndedStroke:", v5);

  -[PKTextInputInteraction _reserveSpaceController](self, "_reserveSpaceController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCanvasControllerIsDrawing:", 0);

  -[PKTextInputInteraction _updateCanvasController](self, "_updateCanvasController");
}

- (void)canvasController:(id)a3 drawingDidChange:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "canvasController:drawingDidChange:", v7, v6);

  -[PKTextInputInteraction _updateCanvasController](self, "_updateCanvasController");
}

- (id)canvasControllerPreferredStrokeColor:(id)a3 animated:(BOOL *)a4
{
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  -[PKTextInputInteraction _canvasController](self, "_canvasController", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputCanvasController defaultStrokeColor](v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKTextInputInteraction handwritingController](self, "handwritingController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "strokeAlphaOverride");
  v10 = v9;

  -[PKTextInputInteraction drawingGestureRecognizer](self, "drawingGestureRecognizer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "strokeAcceptanceState"))
  {

  }
  else
  {
    -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "writingState");

    if (!v13)
    {
      v14 = 0;
      v10 = 0.2;
      goto LABEL_8;
    }
  }
  if (v10 < 1.0)
  {
    v14 = 1;
LABEL_8:
    objc_msgSend(v7, "colorWithAlphaComponent:", v10);
    v15 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v15;
    goto LABEL_9;
  }
  v14 = 0;
LABEL_9:
  *a4 = v14;
  return v7;
}

- (void)_updateCanvasStrokeColor
{
  id v2;

  -[PKTextInputInteraction _canvasController](self, "_canvasController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[PKTextInputCanvasController reloadPreferredStrokeColor]((uint64_t)v2);

}

- (BOOL)isCursorWeak
{
  void *v2;
  char v3;

  -[PKTextInputInteraction cursorController](self, "cursorController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCursorWeak");

  return v3;
}

- (BOOL)cursorControllerCustomHighlightFeedbackIsVisible:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  -[PKTextInputInteraction _feedbackController](self, "_feedbackController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "showingCustomFeedback");

  if (!v5)
    return 0;
  -[PKTextInputInteraction _feedbackController](self, "_feedbackController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "feedbackType");

  return (unint64_t)(v7 - 1) < 2;
}

- (int64_t)cursorControllerWritingState:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  -[PKTextInputInteraction _handwritingController](self, "_handwritingController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "writingState");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)windowSceneForController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PKTextInputInteraction _containerView](self, "_containerView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)hoverController:(id)a3 topLevelHitViewAt:(CGPoint)a4
{
  return -[PKTextInputInteraction _topLevelHitViewForContainerViewPosition:event:](self, "_topLevelHitViewForContainerViewPosition:event:", 0, a4.x, a4.y);
}

- (void)hoverControllerDidLift:(id)a3
{
  void *v4;
  int v5;
  id v6;

  +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "scribbleCommitOnLift");

  if (v5)
  {
    -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "quickCommitIfPossible");

  }
}

- (void)feedbackControllerShowingCustomFeedbackDidChange:(id)a3
{
  id v3;

  -[PKTextInputInteraction _cursorController](self, "_cursorController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "customHighlightFeedbackVisibilityDidChange");

}

- (void)handwritingControllerWritingStateDidChange:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  -[PKTextInputInteraction _setLastHandwritingEventTimestamp:](self, "_setLastHandwritingEventTimestamp:");
  v6 = objc_msgSend(v5, "writingState");

  -[PKTextInputInteraction _paletteController](self, "_paletteController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setWritingStateActive:", v6 == 1);

  -[PKTextInputInteraction _cursorController](self, "_cursorController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "writingStateDidChange");

  -[PKTextInputInteraction _updateCanvasStrokeColor](self, "_updateCanvasStrokeColor");
}

- (void)handwritingControllerDidFinishActiveCommands:(id)a3
{
  id v3;

  -[PKTextInputInteraction _keyboardSuppressionPolicyDelegate](self, "_keyboardSuppressionPolicyDelegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateKeyboardSuppressionPolicy");

}

- (void)elementsControllerLastDiscoveredElementsDidChange:(id)a3
{
  id v3;

  -[PKTextInputInteraction _debugViewController](self, "_debugViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsReloadTargetsVisualization");

}

- (id)containerView:(id)a3 hitTest:(CGPoint)a4 withEvent:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v7 = a3;
  v8 = a5;
  v9 = v8;
  if (v8 && objc_msgSend(v8, "type") != 11)
  {
    -[PKTextInputInteraction _hoverController](self, "_hoverController");
    v10 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputHoverController didReceiveNormalTouch:](v10, 0);

  }
  if (objc_msgSend(v9, "PK_isEventFromPencil"))
  {
    +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isScribbleActive") & 1) == 0)
    {

      if (!v9)
      {
LABEL_13:
        v16 = 0;
        goto LABEL_14;
      }
      goto LABEL_10;
    }
    -[PKTextInputInteraction _containerView](self, "_containerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isHidden");

    if (!v13)
      goto LABEL_12;
  }
  if (!v9)
    goto LABEL_13;
LABEL_10:
  if ((objc_msgSend(v9, "PK_isEventFromPencil") & 1) != 0)
    goto LABEL_13;
  -[PKTextInputInteraction handwritingController](self, "handwritingController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "writingState");

  if (v15 != 1)
    goto LABEL_13;
LABEL_12:
  -[PKTextInputInteraction _containerView](self, "_containerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v16;
}

- (id)_topLevelHitViewForContainerViewPosition:(CGPoint)a3 event:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  double v17;
  uint64_t i;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  id v30;
  void *v31;
  double v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  y = a3.y;
  x = a3.x;
  v39 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[PKTextInputInteraction view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_visibleWindows");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v35;
    v17 = -1.79769313e308;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(v12);
        v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        -[PKTextInputInteraction _containerView](self, "_containerView", (_QWORD)v34);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "PK_convertPoint:toView:", v19, x, y);
        v22 = v21;
        v24 = v23;

        objc_msgSend(v19, "hitTest:withEvent:", 0, v22, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v25)
        {
          objc_msgSend(v25, "window");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "windowLevel");
          v29 = v28;

          if (v29 > v17)
          {
            v30 = v26;

            objc_msgSend(v30, "window");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "windowLevel");
            v17 = v32;

            v15 = v30;
          }
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v14);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)_shouldAvoidStartingDrawingOnView:(id)a3 location:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  id v6;
  BOOL v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  NSObject *v16;
  os_log_t v17;
  void *v18;
  char v19;
  void *v20;
  char isKindOfClass;
  objc_class *v22;
  void *v23;
  char v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  int v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  y = a4.y;
  x = a4.x;
  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (+[PKTextInputElementsFinder responderSupportsPencilTextInput:]((uint64_t)PKTextInputElementsFinder, v6) & 1) == 0)
  {
    v7 = +[PKTextInputElementsFinder shouldConsiderTextInputSearchForView:referenceHitPoint:referenceCoordSpace:](x, y, (uint64_t)PKTextInputElementsFinder, v6, v6);
    v8 = v6;
    v9 = v8;
    if (v8)
    {
      v10 = v8;
      while (1)
      {
        PKScribbleInteractionInView(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isElementContainer"))
          break;
        objc_msgSend(v10, "superview");
        v12 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v12;
        if (!v12)
          goto LABEL_7;
      }

    }
    else
    {
LABEL_7:
      if (!v7)
      {
        v13 = os_log_create("com.apple.pencilkit", "PencilTextInput");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = (objc_class *)objc_opt_class();
          NSStringFromClass(v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 138412546;
          v30 = v15;
          v31 = 2048;
          v32 = v9;
          _os_log_impl(&dword_1BE213000, v13, OS_LOG_TYPE_DEFAULT, "Avoid starting to draw on view <%@: %p> because it's a control and is not an editable text view", (uint8_t *)&v29, 0x16u);

        }
        goto LABEL_26;
      }
    }
  }
  PKScribbleInteractionInView(v6);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16 && (-[NSObject shouldBeginAtLocation:](v16, "shouldBeginAtLocation:", x, y) & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "set_textInputSource:", 0);
    v25 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138412546;
      v30 = v27;
      v31 = 2048;
      v32 = v6;
      _os_log_impl(&dword_1BE213000, v25, OS_LOG_TYPE_DEFAULT, "Avoid starting to draw on view <%@: %p> because interaction delegate shouldBeginAtLocation: N", (uint8_t *)&v29, 0x16u);

    }
    goto LABEL_25;
  }

  +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "enableOnRemoteViews");

  if ((v19 & 1) == 0)
  {
    objc_msgSend(v6, "window");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v17 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138412546;
        v30 = v23;
        v31 = 2048;
        v32 = v6;
        _os_log_impl(&dword_1BE213000, v17, OS_LOG_TYPE_DEFAULT, "Avoid starting to draw on view <%@: %p> because it is in a hosted window", (uint8_t *)&v29, 0x16u);

      }
LABEL_25:

LABEL_26:
      v24 = 1;
      goto LABEL_27;
    }
  }
  v24 = +[PKTextInputElementsFinder shouldAvoidElementWithHitView:]((uint64_t)PKTextInputElementsFinder, v6);
LABEL_27:

  return v24;
}

- (BOOL)_isTapAwayFromCurrentStrokesAtCanvasViewLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  CGRect v24;

  y = a3.y;
  x = a3.x;
  -[PKTextInputInteraction _canvasController](self, "_canvasController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKTextInputCanvasController renderedStrokesBounds]((uint64_t)v5);
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v24.origin.x = v6;
  v24.origin.y = v8;
  v24.size.width = v10;
  v24.size.height = v12;
  if (CGRectIsNull(v24))
    return 0;
  if (x >= v6)
  {
    v13 = v6 + v10;
    v14 = x <= v6 + v10;
    v6 = x;
    if (!v14)
      v6 = v13;
  }
  v15 = v8 + v12;
  if (y <= v8 + v12)
    v15 = y;
  if (y >= v8)
    v8 = v15;
  if (v6 - x >= 0.0)
    v16 = v6 - x;
  else
    v16 = -(v6 - x);
  +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "drawingGestureDetectTapAwayFromCurrentStrokesHorizontalDistance");
  if (v16 > v18)
  {

  }
  else
  {
    if (v8 - y >= 0.0)
      v19 = v8 - y;
    else
      v19 = -(v8 - y);
    +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "drawingGestureDetectTapAwayFromCurrentStrokesVerticalDistance");
    v22 = v21;

    if (v19 <= v22)
      return 0;
  }
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[PKTextInputInteraction _touchDetectionGestureRecognizer](self, "_touchDetectionGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    -[PKTextInputInteraction _touchDetectionGestureRecognizer](self, "_touchDetectionGestureRecognizer");

  }
  return 1;
}

- (void)touchesDetected
{
  void *v3;
  uint64_t v4;
  id v5;

  -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "writingState");

  if (v4 != 1)
  {
    -[PKTextInputInteraction _reserveSpaceController](self, "_reserveSpaceController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishReserveSpaceAndInsertWhitespace:", 0);

  }
}

- (void)reserveSpaceControllerIsActiveChanged:(id)a3
{
  void *v4;
  void *v5;
  int v6;

  -[PKTextInputInteraction _updateCanvasController](self, "_updateCanvasController", a3);
  -[PKTextInputInteraction _updateInteractionEnabled](self, "_updateInteractionEnabled");
  -[PKTextInputInteraction _updateGestureRecognizers](self, "_updateGestureRecognizers");
  -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reserveSpaceControllerIsActiveChanged");

  -[PKTextInputInteraction _reserveSpaceController](self, "_reserveSpaceController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isReserveSpaceActive");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    -[PKTextInputInteraction _setLastHandwritingEventTimestamp:](self, "_setLastHandwritingEventTimestamp:");
  }
}

- (void)reserveSpaceControllerIsPlaceholderVisibleChanged:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  -[PKTextInputInteraction reserveSpaceController](self, "reserveSpaceController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isReserveSpacePlaceholderVisible");

  if (v5)
  {
    -[PKTextInputInteraction cursorController](self, "cursorController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "makeCursorStrong");

    -[PKTextInputInteraction drawingGestureRecognizer](self, "drawingGestureRecognizer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelDrawing");

  }
}

- (void)reserveSpaceController:(id)a3 willFocusElement:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[PKTextInputInteraction handwritingController](self, "handwritingController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reserveSpaceControllerWillFocusElement:", v5);

}

- (BOOL)drawingGestureRecognizer:(id)a3 shouldBeginDrawingWithTouches:(id)a4 event:(id)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  uint64_t *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  _BOOL4 v71;
  void *v72;
  void *v73;
  objc_class *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  _BOOL4 v79;
  NSObject *v80;
  void *v81;
  objc_class *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  id v90;
  _BYTE *v91;
  uint64_t v92;
  void *v93;
  CFTimeInterval v94;
  void *v95;
  void *v96;
  id v97;
  _BYTE *v98;
  char v99;
  void *v101;
  id obj;
  void *v103;
  uint64_t v104;
  void *v105;
  id v106;
  _QWORD v107[4];
  id v108;
  PKTextInputInteraction *v109;
  id v110;
  id v111;
  double v112;
  double v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  uint8_t buf[4];
  void *v119;
  __int16 v120;
  void *v121;
  __int16 v122;
  void *v123;
  _BYTE v124[128];
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v106 = a4;
  v9 = a5;
  -[PKTextInputInteraction _containerView](self, "_containerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = v8;
  objc_msgSend(v8, "locationInView:", v10);
  v12 = v11;
  v14 = v13;

  -[PKTextInputInteraction _containerView](self, "_containerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "window");
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v16, "windowScene");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPencilSqueezeInteraction _existingInteractionForWindowScene:](PKPencilSqueezeInteraction, "_existingInteractionForWindowScene:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v9;
  -[PKTextInputInteraction _containerView](self, "_containerView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = objc_msgSend(v18, "_isPointInsidePaletteView:fromView:withEvent:", v20, v9, v12, v14);

  if ((v16 & 1) != 0)
  {
    v21 = 0;
    v22 = v105;
    goto LABEL_59;
  }
  -[PKTextInputInteraction set_beginGestureElement:](self, "set_beginGestureElement:", 0);
  -[PKTextInputInteraction set_beginGestureElementContentForLineBreak:](self, "set_beginGestureElementContentForLineBreak:", 0);
  -[PKTextInputInteraction _hoverController](self, "_hoverController");
  v23 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputHoverController didReceiveNormalTouch:](v23, 0);

  v103 = v18;
  if (!objc_msgSend(v9, "PK_isEventFromPencil"))
  {
LABEL_12:
    v31 = 1;
    goto LABEL_13;
  }
  +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isScribbleActive");

  if ((v25 & 1) == 0)
  {
    v32 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v105, "drawingTouch");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134217984;
      v119 = v33;
      _os_log_impl(&dword_1BE213000, v32, OS_LOG_TYPE_DEFAULT, "Delegate to gesture touch %p, shouldBeginDrawing: N, because there is no active locale.", buf, 0xCu);

    }
    goto LABEL_12;
  }
  v101 = v9;
  -[PKTextInputInteraction view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "window");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = (void *)MEMORY[0x1E0DC3DB0];
    objc_msgSend(v27, "windowScene");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activeTextEffectsWindowForWindowScene:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30 != v27)
    {

LABEL_8:
      v31 = 1;
LABEL_31:
      v22 = v105;
LABEL_50:
      v19 = v101;
      goto LABEL_51;
    }
  }

  objc_msgSend(v106, "anyObject");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "window");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "windowScene");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    -[PKTextInputInteraction view](self, "view");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "locationInView:", v38);
    v40 = v39;
    v42 = v41;

    -[PKTextInputInteraction _handlePotentialDebugOverlayGestureAtPoint:](self, "_handlePotentialDebugOverlayGestureAtPoint:", v40, v42);
  }
  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  obj = v106;
  v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v124, 16);
  if (!v43)
    goto LABEL_28;
  v44 = v43;
  v104 = *(_QWORD *)v115;
  while (2)
  {
    for (i = 0; i != v44; ++i)
    {
      if (*(_QWORD *)v115 != v104)
        objc_enumerationMutation(obj);
      v46 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * i);
      objc_msgSend(v46, "window");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputInteraction view](self, "view");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "window");
      v49 = objc_claimAutoreleasedReturnValue();
      if (v47 == (void *)v49)
      {

      }
      else
      {
        v50 = (void *)v49;
        objc_msgSend(v46, "window");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "windowLevel");
        v53 = v52;
        -[PKTextInputInteraction view](self, "view");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "window");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "windowLevel");
        v57 = v56;

        if (v53 > v57)
        {
          v70 = os_log_create("com.apple.pencilkit", "PencilTextInput");
          v71 = os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT);
          v22 = v105;
          if (v71)
          {
            objc_msgSend(v105, "drawingTouch");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "window");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v74 = (objc_class *)objc_opt_class();
            NSStringFromClass(v74);
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "window");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218498;
            v119 = v72;
            v120 = 2112;
            v121 = v75;
            v122 = 2048;
            v123 = v76;
            _os_log_impl(&dword_1BE213000, v70, OS_LOG_TYPE_DEFAULT, "Delegate to gesture touch %p, shouldBeginDrawing: N, because the touch is on a higher level window <%@: %p>", buf, 0x20u);

          }
LABEL_49:

          v31 = 1;
          goto LABEL_50;
        }
      }
      objc_msgSend(v46, "window");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "windowScene");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputInteraction view](self, "view");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "window");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "windowScene");
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      if (v59 != v62)
      {
        v70 = os_log_create("com.apple.pencilkit", "PencilTextInput");
        v22 = v105;
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v105, "drawingTouch");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "window");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "windowScene");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v119 = v67;
          v120 = 2112;
          v121 = v69;
          _os_log_impl(&dword_1BE213000, v70, OS_LOG_TYPE_DEFAULT, "Delegate to gesture touch %p, shouldBeginDrawing: N, because the touch is on a different scene %@", buf, 0x16u);

        }
        goto LABEL_49;
      }
    }
    v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v124, 16);
    if (v44)
      continue;
    break;
  }
LABEL_28:

  -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)v63;
    -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "writingState");

    if (v66)
    {
      v31 = 0;
      goto LABEL_31;
    }
  }
  -[PKTextInputInteraction _topLevelHitViewForContainerViewPosition:event:](self, "_topLevelHitViewForContainerViewPosition:event:", 0, v12, v14);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (v77)
  {
    -[PKTextInputInteraction _containerView](self, "_containerView");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = -[PKTextInputInteraction _shouldAvoidStartingDrawingOnView:location:](self, "_shouldAvoidStartingDrawingOnView:location:", v77, PK_convertRectFromCoordinateSpaceToCoordinateSpace(v78, v77, v12, v14, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8)));

    if (v79)
    {
      v80 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v105, "drawingTouch");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = (objc_class *)objc_opt_class();
        NSStringFromClass(v82);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v119 = v81;
        v120 = 2112;
        v121 = v83;
        v122 = 2048;
        v123 = v77;
        _os_log_impl(&dword_1BE213000, v80, OS_LOG_TYPE_DEFAULT, "Delegate to gesture touch %p, shouldBeginDrawing: N, because should avoid drawing on hit view <%@: %p>", buf, 0x20u);

      }
      goto LABEL_8;
    }
  }

  -[PKTextInputInteraction view](self, "view");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "window");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "windowScene");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "_visibleWindows");
  v87 = objc_claimAutoreleasedReturnValue();
  v88 = (void *)v87;
  v89 = (void *)MEMORY[0x1E0C9AA60];
  if (v87)
    v89 = (void *)v87;
  v90 = v89;

  v91 = -[PKTextInputElementsFinder initWithWindowsToSearch:]([PKTextInputSingleElementFinder alloc], v90);
  v19 = v101;
  if (v91)
  {
    if (v91[9])
    {
      -[PKTextInputInteraction _hoverController](self, "_hoverController");
      v92 = objc_claimAutoreleasedReturnValue();
      if (!v92
        || (v93 = (void *)v92, v94 = CACurrentMediaTime() - *(double *)(v92 + 136), v93, v94 >= 0.1))
      {
        v91[9] = 0;
      }
    }
  }
  -[PKTextInputInteraction set_drawingGestureElementFinder:](self, "set_drawingGestureElementFinder:", v91);
  v95 = (void *)objc_msgSend(obj, "copy");
  -[PKTextInputInteraction _containerView](self, "_containerView");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v107[0] = MEMORY[0x1E0C809B0];
  v107[1] = 3221225472;
  v107[2] = __87__PKTextInputInteraction_drawingGestureRecognizer_shouldBeginDrawingWithTouches_event___block_invoke;
  v107[3] = &unk_1E7778C88;
  v108 = v91;
  v109 = self;
  v110 = v95;
  v111 = v101;
  v112 = v12;
  v113 = v14;
  v97 = v95;
  v98 = v91;
  objc_msgSend(v98, "findSingleElementCloseToPosition:coordinateSpace:completion:", v96, v107, v12, v14);

  v31 = 0;
LABEL_13:
  v22 = v105;
LABEL_51:
  if (objc_msgSend(v22, "state") == 5 || (objc_msgSend(v22, "state") == 4 ? (v99 = 1) : (v99 = v31), (v99 & 1) != 0))
  {
    v21 = 0;
  }
  else
  {
    -[PKTextInputInteraction _updateCanvasStrokeColor](self, "_updateCanvasStrokeColor");
    v21 = 1;
  }
  v18 = v103;
LABEL_59:

  return v21;
}

void __87__PKTextInputInteraction_drawingGestureRecognizer_shouldBeginDrawingWithTouches_event___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_drawingGestureElementFinder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "_notifyTargetElementOfTouches:event:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 40), "_drawingGestureElementFinderDidFinishWithLocationInContainerView:", *(double *)(a1 + 64), *(double *)(a1 + 72));
  }
}

- (BOOL)drawingGestureRecognizerRequiresTargetElementToBegin:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;

  -[PKTextInputInteraction _handwritingController](self, "_handwritingController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "writingState");

    v7 = v6 == 0;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)drawingGestureRecognizerRequiresPastTapToBegin:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;

  v4 = a3;
  -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "writingState");

    if (v8 == 1)
    {
      -[PKTextInputInteraction _containerView](self, "_containerView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "locationInView:", v10);
      v9 = -[PKTextInputInteraction _isTapAwayFromCurrentStrokesAtCanvasViewLocation:](self, "_isTapAwayFromCurrentStrokesAtCanvasViewLocation:");

      goto LABEL_7;
    }
    if (v8)
    {
      v9 = 0;
      goto LABEL_7;
    }
  }
  v9 = 1;
LABEL_7:

  return v9;
}

- (BOOL)drawingGestureRecognizerLongPressShouldBegin:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "enableReserveSpace");

  if (!v5)
    return 0;
  -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "writingState");

    v9 = v8 == 0;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)drawingGestureRecognizerLongPressStateDidChange:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  switch(objc_msgSend(v12, "longPressState"))
  {
    case 0:
    case 3:
      -[PKTextInputInteraction _reserveSpaceController](self, "_reserveSpaceController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "cancelReserveSpaceIntro");
      goto LABEL_5;
    case 1:
      objc_msgSend(v12, "targetElement");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputInteraction view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "locationInView:", v5);
      v7 = v6;
      v9 = v8;

      -[PKTextInputInteraction _reserveSpaceController](self, "_reserveSpaceController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputInteraction view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "beginIfPossibleWithElement:atLocation:coordinateSpace:", v4, v11, v7, v9);

      goto LABEL_5;
    case 2:
      -[PKTextInputInteraction _reserveSpaceController](self, "_reserveSpaceController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "reserveSpaceWhenReady");
LABEL_5:

      break;
    default:
      break;
  }

}

- (void)drawingGestureStrokeAcceptanceStateDidChange:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(v8, "strokeAcceptanceState");
  if (v4 == 2)
  {
    objc_msgSend(v8, "cancel");
  }
  else if (v4 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    -[PKTextInputInteraction _setLastHandwritingEventTimestamp:](self, "_setLastHandwritingEventTimestamp:");
    -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputInteraction _canvasController](self, "_canvasController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "canvasControllerDidBeginDrawing:", v6);

    -[PKTextInputInteraction _reserveSpaceController](self, "_reserveSpaceController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCanvasControllerIsDrawing:", 1);

  }
  -[PKTextInputInteraction _updateCanvasStrokeColor](self, "_updateCanvasStrokeColor");
  -[PKTextInputInteraction _updateCanvasController](self, "_updateCanvasController");

}

- (void)drawingGestureRecognizerDrawingTargetIsDrawingDidChange:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKTextInputInteraction _updateCanvasController](self, "_updateCanvasController");
  LODWORD(self) = objc_msgSend(v4, "drawingTargetIsDrawing");

  if ((_DWORD)self)
  {
    objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hideMenu");

  }
}

- (BOOL)drawingGestureRecognizer:(id)a3 shouldFinishGestureWithTouch:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  NSObject *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "strokeAcceptanceState") != 1)
  {
    objc_msgSend(v6, "targetElement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9 || objc_msgSend(v6, "state") || (objc_msgSend(v6, "hasMovedPastTapUseTimestampFromTouch:", 1) & 1) != 0)
    {
      -[PKTextInputInteraction _containerView](self, "_containerView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isHidden");

      if ((v11 & 1) != 0)
      {
        v8 = 0;
LABEL_14:

        goto LABEL_15;
      }
      -[PKTextInputInteraction _containerView](self, "_containerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "locationInView:", v12);
      -[PKTextInputInteraction _topLevelHitViewForContainerViewPosition:event:](self, "_topLevelHitViewForContainerViewPosition:event:", 0);
      v13 = objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NSObject sendActionsForControlEvents:](v13, "sendActionsForControlEvents:", 64);
        v14 = os_log_create("com.apple.pencilkit", "PencilTextInput");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = (objc_class *)objc_opt_class();
          NSStringFromClass(v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138412546;
          v19 = v16;
          v20 = 2048;
          v21 = v13;
          _os_log_impl(&dword_1BE213000, v14, OS_LOG_TYPE_DEFAULT, "Using drawing gesture as touch up inside control: <%@: %p>", (uint8_t *)&v18, 0x16u);

        }
      }
      v8 = 0;
    }
    else
    {
      v8 = -[PKTextInputInteraction _handleDrawingGestureTapInElement:gesture:touch:](self, "_handleDrawingGestureTapInElement:gesture:touch:", v9, v6, v7);
      v13 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138412290;
        v19 = v9;
        _os_log_impl(&dword_1BE213000, v13, OS_LOG_TYPE_DEFAULT, "Using drawing gesture as tap instead. element: %@", (uint8_t *)&v18, 0xCu);
      }
    }

    goto LABEL_14;
  }
  v8 = 1;
LABEL_15:

  return v8;
}

- (void)_notifyTargetElementOfTouches:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[PKTextInputInteraction _drawingGestureElementFinder](self, "_drawingGestureElementFinder");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "foundElement");
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputElement didTargetElementForTouches:event:](v8, v7, v6);

}

- (void)_drawingGestureElementFinderDidFinishWithLocationInContainerView:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  CGFloat v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id location;

  y = a3.y;
  x = a3.x;
  -[PKTextInputInteraction _drawingGestureElementFinder](self, "_drawingGestureElementFinder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputInteraction set_drawingGestureElementFinder:](self, "set_drawingGestureElementFinder:", 0);
  -[PKTextInputInteraction drawingGestureRecognizer](self, "drawingGestureRecognizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "foundElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "candidateElements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "finishedElementFindingWithElement:candidateElements:", v8, v9);

  -[PKTextInputInteraction _updateCanvasStrokeColor](self, "_updateCanvasStrokeColor");
  -[PKTextInputInteraction _handwritingController](self, "_handwritingController");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10
    || (v11 = (void *)v10,
        -[PKTextInputInteraction _handwritingController](self, "_handwritingController"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "writingState"),
        v12,
        v11,
        !v13))
  {
    +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "lineBreakOnTapEnabled");

    if (v15)
    {
      -[PKTextInputInteraction set_beginGestureElementContentForLineBreak:](self, "set_beginGestureElementContentForLineBreak:", 0);
      -[PKTextInputInteraction set_beginGestureElement:](self, "set_beginGestureElement:", 0);
      objc_msgSend(v6, "foundElement");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[PKTextInputElement isFocused]((uint64_t)v16);

      if (v17)
      {
        objc_msgSend(v6, "foundElement");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTextInputInteraction set_beginGestureElement:](self, "set_beginGestureElement:", v18);

        -[PKTextInputInteraction _containerView](self, "_containerView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTextInputInteraction _beginGestureElement](self, "_beginGestureElement");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTextInputElement coordinateSpace]((uint64_t)v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v19, v21, x, y, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
        v24 = v23;

        objc_initWeak(&location, self);
        -[PKTextInputInteraction _beginGestureElement](self, "_beginGestureElement");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTextInputInteraction _cursorController](self, "_cursorController");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v21) = objc_msgSend(v26, "isCursorWeak");
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __91__PKTextInputInteraction__drawingGestureElementFinderDidFinishWithLocationInContainerView___block_invoke;
        v27[3] = &unk_1E7778CB0;
        objc_copyWeak(&v28, &location);
        -[PKTextInputElement evaluateLineBreakForTapAtLocation:weakCursor:allowTrailingWhitespace:completion:]((uint64_t)v25, (char)v21, 0, v27, v22, v24);

        objc_destroyWeak(&v28);
        objc_destroyWeak(&location);
      }
    }
  }

}

void __91__PKTextInputInteraction__drawingGestureElementFinderDidFinishWithLocationInContainerView___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "set_beginGestureElementContentForLineBreak:", v3);

}

- (BOOL)_beginGestureIfPossible:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (objc_msgSend(v4, "state"))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "setState:", 1);
    v5 = objc_msgSend(v4, "state") == 1;
  }
  -[PKTextInputInteraction set_beginGestureElement:](self, "set_beginGestureElement:", 0);
  -[PKTextInputInteraction set_beginGestureElementContentForLineBreak:](self, "set_beginGestureElementContentForLineBreak:", 0);

  return v5;
}

- (id)_findControlFromHitView:(id)a3 referenceView:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = v7;
  v9 = 0;
  v10 = v7;
  if (v7 && v7 != v6)
  {
    v11 = v7;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v11, "superview");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      v9 = 0;
      if (v10)
      {
        v11 = v10;
        if (v10 != v6)
          continue;
      }
      goto LABEL_9;
    }
    v10 = v11;
    v9 = v10;
  }
LABEL_9:

  return v9;
}

- (BOOL)_handleDrawingGestureTapInElement:(id)a3 gesture:(id)a4 touch:(id)a5
{
  id *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  int v39;
  int v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  void *v48;
  unsigned int v49;
  id *v50;
  uint64_t v51;
  int v52;
  id *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = (id *)a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    -[PKTextInputElement coordinateSpace]((uint64_t)v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[PKTextInputInteraction _containerView](self, "_containerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "PK_locationInView:", v12);
      v14 = v13;
      v16 = v15;

      -[PKTextInputInteraction _topLevelHitViewForContainerViewPosition:event:](self, "_topLevelHitViewForContainerViewPosition:event:", 0, v14, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
        goto LABEL_8;
      -[PKTextInputElement referenceView](v8);
      v18 = objc_claimAutoreleasedReturnValue();
      if (!v18)
        goto LABEL_8;
      v19 = (void *)v18;
      -[PKTextInputElement referenceView](v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17 == v20)
        goto LABEL_8;
      -[PKTextInputElement referenceView](v8);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v22) = objc_msgSend(v17, "isDescendantOfView:", v21);

      if (!(_DWORD)v22)
      {
LABEL_27:

        goto LABEL_28;
      }
      -[PKTextInputElement referenceView](v8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputInteraction _findControlFromHitView:referenceView:](self, "_findControlFromHitView:referenceView:", v17, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
      {
LABEL_8:
        -[PKTextInputInteraction _containerView](self, "_containerView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTextInputElement coordinateSpace]((uint64_t)v8);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "PK_convertPoint:toCoordinateSpace:", v26, v14, v16);
        v28 = v27;
        v30 = v29;

        if (-[PKTextInputElement isFocused]((uint64_t)v8))
        {
          v31 = os_log_create("com.apple.pencilkit", "PencilTextInput");
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v52 = 138412290;
            v53 = v8;
            _os_log_impl(&dword_1BE213000, v31, OS_LOG_TYPE_DEFAULT, "Detected a pencil tap on focused element: %@", (uint8_t *)&v52, 0xCu);
          }

          -[PKTextInputInteraction _cursorController](self, "_cursorController");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "makeCursorStrong");

          +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v33, "enableReserveSpaceTapForNewlines")
            && (-[PKTextInputElement coordinateSpace]((uint64_t)v8), (v34 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v35 = (void *)v34;
            -[PKTextInputInteraction _reserveSpaceController](self, "_reserveSpaceController");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "isReserveSpaceActive");

            if (!v37
              || (-[PKTextInputInteraction _reserveSpaceController](self, "_reserveSpaceController"),
                  v38 = (void *)objc_claimAutoreleasedReturnValue(),
                  v39 = objc_msgSend(v38, "tapPointIsInPlaceholder:", v28, v30),
                  v38,
                  !v39)
              || !-[PKTextInputInteraction _beginGestureIfPossible:](self, "_beginGestureIfPossible:", v9))
            {
              v40 = 1;
LABEL_23:
              objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "hideMenu");
              if (v40
                && (-[PKTextInputInteraction _hoverController](self, "_hoverController"),
                    v45 = (void *)objc_claimAutoreleasedReturnValue(),
                    v46 = -[PKTextInputHoverController performLineBreakAfterTapIfPossibleForElement:location:]((uint64_t)v45, v8, v28, v30), v45, (v46 & 1) == 0))
              {
                -[PKTextInputInteraction _beginGestureElementContentForLineBreak](self, "_beginGestureElementContentForLineBreak");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                if (v22)
                {
                  -[PKTextInputInteraction _beginGestureElement](self, "_beginGestureElement");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  v49 = -[PKTextInputElement isEquivalentToElement:](v8, v48);

                  if (v49)
                  {
                    -[PKTextInputInteraction _beginGestureElementContentForLineBreak](self, "_beginGestureElementContentForLineBreak");
                    v50 = (id *)objc_claimAutoreleasedReturnValue();
                    v51 = -[PKTextInputElementContent contentLength]((uint64_t)v50);
                    -[PKTextInputElementContent insertTextsToCommit:withAlternatives:activePreviewText:replacingRange:completion:](v50, &unk_1E77EC9E8, &unk_1E77ECA00, 0, v51, 0, &__block_literal_global_20);

                  }
                  LOBYTE(v22) = 0;
                }
              }
              else
              {
                LOBYTE(v22) = 1;
              }
              -[PKTextInputInteraction set_beginGestureElement:](self, "set_beginGestureElement:", 0);
              -[PKTextInputInteraction set_beginGestureElementContentForLineBreak:](self, "set_beginGestureElementContentForLineBreak:", 0);

              goto LABEL_27;
            }
            -[PKTextInputInteraction _reserveSpaceController](self, "_reserveSpaceController");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "finishReserveSpaceAndInsertWhitespace:", 1);
            v40 = 0;
          }
          else
          {
            v40 = 1;
          }

          goto LABEL_23;
        }
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v42 = v41;
        -[PKTextInputInteraction cursorController](self, "cursorController");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setLastElementTapToFocusTimestamp:", v42);

      }
      LOBYTE(v22) = 0;
      goto LABEL_27;
    }
  }
  LOBYTE(v22) = 0;
LABEL_28:

  return (char)v22;
}

- (void)debugViewControllerNeedsDismiss:(id)a3
{
  -[PKTextInputInteraction _setDebugControllerAnchorCorner:](self, "_setDebugControllerAnchorCorner:", 0);
}

- (BOOL)isFloatingKeyboardVisible
{
  void *v3;
  void *v4;
  BOOL v5;
  NSObject *v7;
  uint8_t v8[16];

  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    -[PKTextInputInteraction _paletteController](self, "_paletteController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_floatingKeyboardController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PKPaletteFloatingKeyboardController isPresentingKeyboard]((uint64_t)v4);

    return v5;
  }
  else
  {
    v7 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_INFO, "Feature Flag is not enabled.", v8, 2u);
    }

    return 0;
  }
}

- (void)presentFloatingKeyboard
{
  void *v3;
  NSObject *v4;
  id v5;
  uint8_t buf[16];

  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    if (!-[PKTextInputInteraction isFloatingKeyboardVisible](self, "isFloatingKeyboardVisible"))
    {
      -[PKTextInputInteraction _paletteController](self, "_paletteController");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_floatingKeyboardController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaletteFloatingKeyboardController presentOrDismissIfPresented]((uint64_t)v3);

    }
  }
  else
  {
    v4 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_INFO, "Feature Flag is not enabled.", buf, 2u);
    }

  }
}

- (void)dismissFloatingKeyboard
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  if (_os_feature_enabled_impl())
  {
    -[PKTextInputInteraction _paletteController](self, "_paletteController");
    v3 = objc_claimAutoreleasedReturnValue();
    -[NSObject _floatingKeyboardController](v3, "_floatingKeyboardController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteFloatingKeyboardController dismissWithReason:]((uint64_t)v4, CFSTR("Majel SPI called"));

  }
  else
  {
    v3 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1BE213000, v3, OS_LOG_TYPE_INFO, "Feature Flag is not enabled.", v10, 2u);
    }
  }

  objc_msgSend(MEMORY[0x1E0DC3980], "activeKeyboardSceneDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaletteViewInteraction existingPaletteViewInteractionForWindowScene:](PKPaletteViewInteraction, "existingPaletteViewInteractionForWindowScene:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "paletteView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatingKeyboardController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteFloatingKeyboardController dismissWithReason:]((uint64_t)v9, CFSTR("UIKit SPI called"));

}

- (NSArray)enabledLanguageIdentifiers
{
  void *v2;
  NSObject *v3;
  uint8_t v5[16];

  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    +[PKTextInputLanguageSelectionController supportedAndEnabledLocaleIdentifiers](PKTextInputLanguageSelectionController, "supportedAndEnabledLocaleIdentifiers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1BE213000, v3, OS_LOG_TYPE_INFO, "Feature Flag is not enabled.", v5, 2u);
    }

    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v2;
}

- (NSString)currentLanguageIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v6;
  uint8_t v7[16];

  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    +[PKTextInputLanguageSelectionController sharedInstance](PKTextInputLanguageSelectionController, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "currentLanguageIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSString *)v4;
  }
  else
  {
    v6 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1BE213000, v6, OS_LOG_TYPE_INFO, "Feature Flag is not enabled.", v7, 2u);
    }

    return (NSString *)0;
  }
}

- (void)setCurrentLanguageIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    +[PKTextInputLanguageSelectionController sharedInstance](PKTextInputLanguageSelectionController, "sharedInstance");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "copy");
    -[NSObject _switchToLanguageIfSupported:](v4, "_switchToLanguageIfSupported:", v5);

  }
  else
  {
    v4 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_INFO, "Feature Flag is not enabled.", v6, 2u);
    }
  }

}

- (void)presentProblemReportingView
{
  NSObject *v3;
  void *v4;
  void *v5;
  PKTextInputDebugSharpenerLog *v6;
  NSObject *v7;
  PKTextInputDebugRadarViewController *v8;
  void *v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl() && (os_variant_has_internal_diagnostics() & 1) != 0)
  {
    -[PKTextInputInteraction view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rootViewController");
    v3 = objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[PKTextInputInteraction debugLogController](self, "debugLogController");
      v6 = (PKTextInputDebugSharpenerLog *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputDebugLogController sharpenerLogWithCurrentContent](v6);
      v7 = objc_claimAutoreleasedReturnValue();

      v8 = -[PKTextInputDebugRadarViewController initWithSharpenerLog:]([PKTextInputDebugRadarViewController alloc], "initWithSharpenerLog:", v7);
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v8);
      objc_msgSend(v9, "setModalPresentationStyle:", 2);
      -[NSObject presentViewController:animated:completion:](v3, "presentViewController:animated:completion:", v9, 1, 0);
      v10 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v3;
        _os_log_impl(&dword_1BE213000, v10, OS_LOG_TYPE_INFO, "Problem reporting UI presented from view controller %@", (uint8_t *)&v11, 0xCu);
      }

    }
    else
    {
      v7 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v11 = 138412290;
        v12 = 0;
        _os_log_error_impl(&dword_1BE213000, v7, OS_LOG_TYPE_ERROR, "Can't present internal-only problem reporting UI from view controller %@", (uint8_t *)&v11, 0xCu);
      }
    }

  }
  else
  {
    v3 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1BE213000, v3, OS_LOG_TYPE_INFO, "Feature Flag is not enabled or not an internal build.", (uint8_t *)&v11, 2u);
    }
  }

}

- (void)textInputLanguageSelectionControllerDidChangeLanguage:(id)a3
{
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[8];
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v10 = CFSTR("UITextInputUpdateKeyboardLanguageKey");
    -[PKTextInputInteraction currentLanguageIdentifier](self, "currentLanguageIdentifier");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    v6 = &stru_1E777DEE8;
    if (v4)
      v6 = (const __CFString *)v4;
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("UITextInputUpdateKeyboardLanguageNotification"), self, v7);

  }
  else
  {
    v7 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_INFO, "Feature Flag is not enabled. Language selection change can't be notified.", v9, 2u);
    }
  }

}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (PKTContainerView)_containerView
{
  return self->__containerView;
}

- (void)set_containerView:(id)a3
{
  objc_storeStrong((id *)&self->__containerView, a3);
}

- (PKTextInputCanvasController)_canvasController
{
  return self->__canvasController;
}

- (PKTextInputFeedbackController)_feedbackController
{
  return self->__feedbackController;
}

- (void)set_feedbackController:(id)a3
{
  objc_storeStrong((id *)&self->__feedbackController, a3);
}

- (PKTextInputPaletteController)_paletteController
{
  return self->__paletteController;
}

- (void)set_paletteController:(id)a3
{
  objc_storeStrong((id *)&self->__paletteController, a3);
}

- (PKTextInputTouchDetectionGestureRecognizer)_touchDetectionGestureRecognizer
{
  return self->__touchDetectionGestureRecognizer;
}

- (void)set_touchDetectionGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->__touchDetectionGestureRecognizer, a3);
}

- (PKTextInputElementsController)_elementsController
{
  return self->__elementsController;
}

- (void)set_elementsController:(id)a3
{
  objc_storeStrong((id *)&self->__elementsController, a3);
}

- (PKTextInputHandwritingController)_handwritingController
{
  return self->__handwritingController;
}

- (void)set_handwritingController:(id)a3
{
  objc_storeStrong((id *)&self->__handwritingController, a3);
}

- (BOOL)_handwritingInteractionEnabled
{
  return self->__handwritingInteractionEnabled;
}

- (double)_lastHandwritingEventTimestamp
{
  return self->__lastHandwritingEventTimestamp;
}

- (PKTextInputDrawingGestureRecognizer)drawingGestureRecognizer
{
  return self->_drawingGestureRecognizer;
}

- (void)setDrawingGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_drawingGestureRecognizer, a3);
}

- (PKTextInputSingleElementFinder)_drawingGestureElementFinder
{
  return self->__drawingGestureElementFinder;
}

- (void)set_drawingGestureElementFinder:(id)a3
{
  objc_storeStrong((id *)&self->__drawingGestureElementFinder, a3);
}

- (PKTextInputKeyboardSuppressionPolicyDelegate)_keyboardSuppressionPolicyDelegate
{
  return self->__keyboardSuppressionPolicyDelegate;
}

- (void)set_keyboardSuppressionPolicyDelegate:(id)a3
{
  objc_storeStrong((id *)&self->__keyboardSuppressionPolicyDelegate, a3);
}

- (PKTextInputDebugLogController)_debugLogController
{
  return self->__debugLogController;
}

- (void)set_debugLogController:(id)a3
{
  objc_storeStrong((id *)&self->__debugLogController, a3);
}

- (unint64_t)_debugControllerAnchorCorner
{
  return self->__debugControllerAnchorCorner;
}

- (PKTextInputDebugViewController)_debugViewController
{
  return self->__debugViewController;
}

- (void)set_debugViewController:(id)a3
{
  objc_storeStrong((id *)&self->__debugViewController, a3);
}

- (PKTextInputDebugStateIntrospector)_debugStateIntrospector
{
  return self->__debugStateIntrospector;
}

- (void)set_debugStateIntrospector:(id)a3
{
  objc_storeStrong((id *)&self->__debugStateIntrospector, a3);
}

- (PKTextInputCursorController)_cursorController
{
  return self->__cursorController;
}

- (void)set_cursorController:(id)a3
{
  objc_storeStrong((id *)&self->__cursorController, a3);
}

- (PKTextInputReserveSpaceController)_reserveSpaceController
{
  return self->__reserveSpaceController;
}

- (void)set_reserveSpaceController:(id)a3
{
  objc_storeStrong((id *)&self->__reserveSpaceController, a3);
}

- (CGRect)editingOverlayContainerSceneBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_editingOverlayContainerSceneBounds.origin.x;
  y = self->_editingOverlayContainerSceneBounds.origin.y;
  width = self->_editingOverlayContainerSceneBounds.size.width;
  height = self->_editingOverlayContainerSceneBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)_lastDebugCornerEventTimestamp
{
  return self->__lastDebugCornerEventTimestamp;
}

- (void)set_lastDebugCornerEventTimestamp:(double)a3
{
  self->__lastDebugCornerEventTimestamp = a3;
}

- (PKTextInputElement)_beginGestureElement
{
  return self->__beginGestureElement;
}

- (void)set_beginGestureElement:(id)a3
{
  objc_storeStrong((id *)&self->__beginGestureElement, a3);
}

- (PKTextInputElementContent)_beginGestureElementContentForLineBreak
{
  return self->__beginGestureElementContentForLineBreak;
}

- (void)set_beginGestureElementContentForLineBreak:(id)a3
{
  objc_storeStrong((id *)&self->__beginGestureElementContentForLineBreak, a3);
}

- (PKTextInputHoverController)_hoverController
{
  return self->__hoverController;
}

- (void)set_hoverController:(id)a3
{
  objc_storeStrong((id *)&self->__hoverController, a3);
}

- (PKPencilObserverInteraction)_pencilObserverInteraction
{
  return self->__pencilObserverInteraction;
}

- (void)set_pencilObserverInteraction:(id)a3
{
  objc_storeStrong((id *)&self->__pencilObserverInteraction, a3);
}

- (PKPencilSqueezeInteraction)_pencilSqueezeInteraction
{
  return self->__pencilSqueezeInteraction;
}

- (void)set_pencilSqueezeInteraction:(id)a3
{
  objc_storeStrong((id *)&self->__pencilSqueezeInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__pencilSqueezeInteraction, 0);
  objc_storeStrong((id *)&self->__pencilObserverInteraction, 0);
  objc_storeStrong((id *)&self->__hoverController, 0);
  objc_storeStrong((id *)&self->__beginGestureElementContentForLineBreak, 0);
  objc_storeStrong((id *)&self->__beginGestureElement, 0);
  objc_storeStrong((id *)&self->__reserveSpaceController, 0);
  objc_storeStrong((id *)&self->__cursorController, 0);
  objc_storeStrong((id *)&self->__debugStateIntrospector, 0);
  objc_storeStrong((id *)&self->__debugViewController, 0);
  objc_storeStrong((id *)&self->__debugLogController, 0);
  objc_storeStrong((id *)&self->__keyboardSuppressionPolicyDelegate, 0);
  objc_storeStrong((id *)&self->__drawingGestureElementFinder, 0);
  objc_storeStrong((id *)&self->_drawingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__handwritingController, 0);
  objc_storeStrong((id *)&self->__elementsController, 0);
  objc_storeStrong((id *)&self->__touchDetectionGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__paletteController, 0);
  objc_storeStrong((id *)&self->__feedbackController, 0);
  objc_storeStrong((id *)&self->__canvasController, 0);
  objc_storeStrong((id *)&self->__containerView, 0);
  objc_destroyWeak((id *)&self->_view);
}

- (void)_updateKeyboardSuppressionPolicy
{
  id v2;

  -[PKTextInputInteraction _keyboardSuppressionPolicyDelegate](self, "_keyboardSuppressionPolicyDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateKeyboardSuppressionPolicy");

}

- (void)reportDebugStateDescription:(id)a3
{
  id v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v5 = a3;
  -[PKTextInputInteraction view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = CFSTR("Yes");
  else
    v7 = CFSTR("No");
  (*((void (**)(id, const __CFString *, const __CFString *))a3 + 2))(v5, CFSTR("Installed in view"), v7);

  if (-[PKTextInputInteraction _handwritingInteractionEnabled](self, "_handwritingInteractionEnabled"))
    v8 = CFSTR("Yes");
  else
    v8 = CFSTR("No");
  (*((void (**)(id, const __CFString *, const __CFString *))a3 + 2))(v5, CFSTR("Interaction enabled"), v8);
  -[PKTextInputInteraction _containerView](self, "_containerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isHidden"))
    v10 = CFSTR("No");
  else
    v10 = CFSTR("Yes");
  (*((void (**)(id, const __CFString *, const __CFString *))a3 + 2))(v5, CFSTR("Container view visible"), v10);

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v12 = v11;
  -[PKTextInputInteraction _lastHandwritingEventTimestamp](self, "_lastHandwritingEventTimestamp");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.1fs ago"), v12 - v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, const __CFString *, id))a3 + 2))(v5, CFSTR("Last pencil event"), v14);

}

- (void)simulateReserveSpaceForTextInputView:(id)a3 location:(CGPoint)a4 completion:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  id *v11;
  void *v12;
  void *v13;
  dispatch_time_t v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id location;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v10 = a5;
  self->_replayCancelled = 0;
  v11 = -[PKTextInputElement initWithTextInput:]((id *)[PKTextInputElement alloc], v9);
  objc_initWeak(&location, self);
  -[PKTextInputInteraction _reserveSpaceController](self, "_reserveSpaceController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputElement coordinateSpace]((uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "beginIfPossibleWithElement:atLocation:coordinateSpace:", v11, v13, x, y);

  v14 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__PKTextInputInteraction_Internal__simulateReserveSpaceForTextInputView_location_completion___block_invoke;
  block[3] = &unk_1E7778CD8;
  objc_copyWeak(&v18, &location);
  v17 = v10;
  v15 = v10;
  dispatch_after(v14, MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __93__PKTextInputInteraction_Internal__simulateReserveSpaceForTextInputView_location_completion___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained && !WeakRetained[9])
  {
    objc_msgSend(WeakRetained, "_reserveSpaceController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reserveSpaceWhenReady");
    v4 = 1;
  }
  else
  {
    objc_msgSend(WeakRetained, "_reserveSpaceController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelReserveSpaceIntro");
    v4 = 0;
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v4);

}

- (void)cancelReplay
{
  id v2;

  self->_replayCancelled = 1;
  -[PKTextInputInteraction handwritingController](self, "handwritingController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cleanUpFromCancelledReplay");

}

@end
