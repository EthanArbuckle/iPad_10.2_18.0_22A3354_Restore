@implementation PKPencilSqueezeController

- (uint64_t)initWithContainerView:(void *)a3 rootViewController:(void *)a4 textEffectsWindowObserver:
{
  id *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  BOOL v33;
  PKPencilSqueezeContainerViewOverlay *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  PKUIPencilInteractionObserver *v51;
  uint64_t v52;
  _QWORD *v53;
  void *v54;
  PKAutoRefineSettingsObserver *v55;
  _QWORD *v56;
  void *v57;
  id *v58;
  void *v59;
  void *v60;
  PKPencilSqueezeUserDefaults *v61;
  void *v62;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  id obj;
  id v76;
  id *location;
  _QWORD v78[4];
  id v79;
  _QWORD v80[4];
  id v81;
  id from;
  objc_super v83;
  _QWORD v84[4];
  _QWORD v85[6];

  v85[4] = *MEMORY[0x1E0C80C00];
  obj = a2;
  v76 = a3;
  v74 = a4;
  if (a1)
  {
    v83.receiver = a1;
    v83.super_class = (Class)PKPencilSqueezeController;
    v7 = (id *)objc_msgSendSuper2(&v83, sel_init);
    v8 = (uint64_t)v7;
    if (v7)
    {
      location = v7 + 1;
      objc_storeWeak(v7 + 1, obj);
      objc_storeWeak((id *)(v8 + 224), v76);
      objc_storeStrong((id *)(v8 + 232), a4);
      *(_BYTE *)(v8 + 208) = 0;
      *(_QWORD *)(v8 + 144) = PKSqueezePaletteViewHideDelay;
      *(double *)(v8 + 24) = PKSqueezePaletteViewSize();
      *(_QWORD *)(v8 + 32) = v9;
      v10 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
      v11 = *(void **)(v8 + 64);
      *(_QWORD *)(v8 + 64) = v10;

      WeakRetained = objc_loadWeakRetained((id *)(v8 + 8));
      objc_msgSend(WeakRetained, "addLayoutGuide:", *(_QWORD *)(v8 + 64));

      objc_msgSend(*(id *)(v8 + 64), "widthAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToConstant:", 0.0);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(void **)(v8 + 72);
      *(_QWORD *)(v8 + 72) = v14;

      objc_msgSend(*(id *)(v8 + 64), "heightAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToConstant:", 0.0);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(void **)(v8 + 80);
      *(_QWORD *)(v8 + 80) = v17;

      v72 = (void *)MEMORY[0x1E0CB3718];
      v19 = *(_QWORD *)(v8 + 80);
      v85[0] = *(_QWORD *)(v8 + 72);
      v85[1] = v19;
      objc_msgSend(*(id *)(v8 + 64), "topAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_loadWeakRetained((id *)(v8 + 8));
      objc_msgSend(v21, "topAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v85[2] = v23;
      objc_msgSend(*(id *)(v8 + 64), "leadingAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_loadWeakRetained((id *)(v8 + 8));
      objc_msgSend(v25, "leadingAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "constraintEqualToAnchor:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v85[3] = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 4);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "activateConstraints:", v28);

      +[PKPencilInteraction fallbackPencilInteraction]();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = *(void **)(v8 + 128);
      *(_QWORD *)(v8 + 128) = v29;

      objc_msgSend(*(id *)(v8 + 128), "setDelegate:", v8);
      v31 = objc_loadWeakRetained((id *)(v8 + 8));
      objc_msgSend(v31, "addInteraction:", *(_QWORD *)(v8 + 128));

      v32 = *(_QWORD *)(v8 + 128);
      v33 = -[PKPencilSqueezeController _onlyShowUndoOrRedo]((uint64_t *)v8);
      if (v32)
        *(_BYTE *)(v32 + 136) = !v33;
      v34 = objc_alloc_init(PKPencilSqueezeContainerViewOverlay);
      v35 = *(void **)(v8 + 120);
      *(_QWORD *)(v8 + 120) = v34;

      objc_msgSend(*(id *)(v8 + 120), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v36 = objc_loadWeakRetained(location);
      objc_msgSend(v36, "addSubview:", *(_QWORD *)(v8 + 120));

      v64 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(*(id *)(v8 + 120), "topAnchor");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_loadWeakRetained(location);
      objc_msgSend(v73, "topAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "constraintEqualToAnchor:", v70);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v84[0] = v69;
      objc_msgSend(*(id *)(v8 + 120), "leadingAnchor");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_loadWeakRetained(location);
      objc_msgSend(v68, "leadingAnchor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "constraintEqualToAnchor:", v66);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v84[1] = v65;
      objc_msgSend(*(id *)(v8 + 120), "bottomAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_loadWeakRetained(location);
      objc_msgSend(v38, "bottomAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "constraintEqualToAnchor:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v84[2] = v40;
      objc_msgSend(*(id *)(v8 + 120), "trailingAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_loadWeakRetained(location);
      objc_msgSend(v42, "trailingAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "constraintEqualToAnchor:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v84[3] = v44;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 4);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "activateConstraints:", v45);

      v46 = objc_alloc_init(MEMORY[0x1E0DC3858]);
      v47 = *(void **)(v8 + 56);
      *(_QWORD *)(v8 + 56) = v46;

      v48 = objc_loadWeakRetained(location);
      objc_msgSend(v48, "addGestureRecognizer:", *(_QWORD *)(v8 + 56));

      objc_initWeak(&from, (id)v8);
      +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
      v49 = objc_claimAutoreleasedReturnValue();
      v50 = *(void **)(v8 + 96);
      *(_QWORD *)(v8 + 96) = v49;

      v51 = [PKUIPencilInteractionObserver alloc];
      v52 = MEMORY[0x1E0C809B0];
      v80[0] = MEMORY[0x1E0C809B0];
      v80[1] = 3221225472;
      v80[2] = __96__PKPencilSqueezeController_initWithContainerView_rootViewController_textEffectsWindowObserver___block_invoke;
      v80[3] = &unk_1E7777588;
      objc_copyWeak(&v81, &from);
      v53 = -[PKUIPencilInteractionObserver initWithPrefersPencilOnlyDrawsDidChangeHandler:](v51, v80);
      v54 = *(void **)(v8 + 104);
      *(_QWORD *)(v8 + 104) = v53;

      v55 = [PKAutoRefineSettingsObserver alloc];
      v78[0] = v52;
      v78[1] = 3221225472;
      v78[2] = __96__PKPencilSqueezeController_initWithContainerView_rootViewController_textEffectsWindowObserver___block_invoke_3;
      v78[3] = &unk_1E77785B0;
      objc_copyWeak(&v79, &from);
      v56 = -[PKAutoRefineSettingsObserver initWithHandler:](v55, v78);
      v57 = *(void **)(v8 + 112);
      *(_QWORD *)(v8 + 112) = v56;

      v58 = -[PKPencilSqueezeAnalyticsController initWithDelegate:]((id *)[PKPencilSqueezeAnalyticsController alloc], (void *)v8);
      v59 = *(void **)(v8 + 240);
      *(_QWORD *)(v8 + 240) = v58;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "addObserver:selector:name:object:", v8, sel__handleKeyboardWillHideNotification_, *MEMORY[0x1E0DC4FE0], 0);
      objc_msgSend(v60, "addObserver:selector:name:object:", v8, sel__handleKeyboardWillShowNotification_, *MEMORY[0x1E0DC4FE8], 0);
      objc_msgSend(v60, "addObserver:selector:name:object:", v8, sel__handleSceneWillEnterForegroundNotification_, *MEMORY[0x1E0DC5338], 0);
      objc_msgSend(v60, "addObserver:selector:name:object:", v8, sel__handleSceneDidEnterBackgroundNotification_, *MEMORY[0x1E0DC5318], 0);
      objc_msgSend(v60, "addObserver:selector:name:object:", v8, sel__handleHandwritingEducationPaneSettingsDidChange_, CFSTR("PKHandwritingEducationPaneSettingsDidChangeNotification"), 0);
      v61 = objc_alloc_init(PKPencilSqueezeUserDefaults);
      v62 = *(void **)(v8 + 192);
      *(_QWORD *)(v8 + 192) = v61;

      -[PKPencilSqueezeController _updateUIWithSqueeze:customHoverPoint:animated:](v8, 0, 0, 1);
      objc_destroyWeak(&v79);
      objc_destroyWeak(&v81);
      objc_destroyWeak(&from);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_onlyShowUndoOrRedo
{
  void *v1;
  void *v2;
  uint64_t v3;

  -[PKPencilSqueezeController _toolPickerForKeyWindow](a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_tools");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3 == 0;
}

void __96__PKPencilSqueezeController_initWithContainerView_rootViewController_textEffectsWindowObserver___block_invoke(uint64_t a1)
{
  _QWORD v1[4];
  id v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __96__PKPencilSqueezeController_initWithContainerView_rootViewController_textEffectsWindowObserver___block_invoke_2;
  v1[3] = &unk_1E7777588;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  PKPerformOnMainThread(v1);
  objc_destroyWeak(&v2);
}

void __96__PKPencilSqueezeController_initWithContainerView_rootViewController_textEffectsWindowObserver___block_invoke_2(uint64_t a1)
{
  id **WeakRetained;
  NSObject *v2;
  int v3;
  id **v4;
  uint8_t buf[4];
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id **)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    if (*((_BYTE *)WeakRetained + 208))
    {
      -[PKPencilSqueezeControllerPaletteViewDelegateProxy pencilInteractionSettingsDidChange](WeakRetained[11]);
    }
    else
    {
      v2 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v3 = *((unsigned __int8 *)v4 + 208);
        *(_DWORD *)buf = 67109120;
        v6 = v3;
        _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "Ignore pencil interaction settings did change, paletteViewVisible: %{BOOL}d", buf, 8u);
      }

    }
    WeakRetained = v4;
  }

}

void __96__PKPencilSqueezeController_initWithContainerView_rootViewController_textEffectsWindowObserver___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;

  v3 = a2;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __96__PKPencilSqueezeController_initWithContainerView_rootViewController_textEffectsWindowObserver___block_invoke_4;
  v4[3] = &unk_1E7777588;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  PKPerformOnMainThread(v4);
  objc_destroyWeak(&v5);

}

void __96__PKPencilSqueezeController_initWithContainerView_rootViewController_textEffectsWindowObserver___block_invoke_4(uint64_t a1)
{
  id **WeakRetained;
  NSObject *v2;
  int v3;
  id **v4;
  uint8_t buf[4];
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id **)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    if (*((_BYTE *)WeakRetained + 208))
    {
      -[PKPencilSqueezeControllerPaletteViewDelegateProxy autoRefineSettingsDidChange](WeakRetained[11]);
    }
    else
    {
      v2 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v3 = *((unsigned __int8 *)v4 + 208);
        *(_DWORD *)buf = 67109120;
        v6 = v3;
        _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "Ignore AutoRefine settings did change, paletteViewVisible: %{BOOL}d", buf, 8u);
      }

    }
    WeakRetained = v4;
  }

}

- (id)_loggableNotificationDescription:(uint64_t)a1
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a1)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    v3 = a2;
    objc_msgSend(v3, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "object");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "stringWithFormat:", CFSTR("notificationName:%@ object:<%@:%p>"), v4, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)_handleSceneWillEnterForegroundNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PKPencilSqueezeController _loggableNotificationDescription:]((uint64_t)self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138477827;
    v8 = v6;
    _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEFAULT, "Scene will enter foreground, notification: %{private}@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)_handleSceneDidEnterBackgroundNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PKPencilSqueezeController _loggableNotificationDescription:]((uint64_t)self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138477827;
    v12 = v6;
    _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEFAULT, "Scene did enter background, notification: %{private}@", buf, 0xCu);

  }
  objc_msgSend(v4, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPencilSqueezeController _keyWindow]((uint64_t *)self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v9 && self->_paletteViewVisible)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __72__PKPencilSqueezeController__handleSceneDidEnterBackgroundNotification___block_invoke;
    v10[3] = &unk_1E7778020;
    v10[4] = self;
    -[PKPencilSqueezeController _setPaletteViewVisible:notify:didChangeHandler:]((uint64_t)self, 0, v10);
    -[PKPencilSqueezeController _updateUIWithSqueeze:customHoverPoint:animated:]((uint64_t)self, 0, 0, 0);
  }

}

- (uint64_t)_keyWindow
{
  if (a1)
  {
    -[PKTextEffectsWindowObserver keyWindow](a1[29]);
    a1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

void __72__PKPencilSqueezeController__handleSceneDidEnterBackgroundNotification___block_invoke(uint64_t a1)
{
  -[PKPencilSqueezeAnalyticsController didHideMiniPaletteByChangingContext](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240));
}

- (void)_setPaletteViewVisible:(uint64_t)a1 notify:(uint64_t)a2 didChangeHandler:(void *)a3
{
  void (**v5)(_QWORD);
  id v6;
  char v7;
  id v8;
  char v9;
  id WeakRetained;
  char v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  BOOL v15;
  id v16;
  char v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  int v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1 && *(unsigned __int8 *)(a1 + 208) != (_DWORD)a2)
  {
    if (!*(_BYTE *)(a1 + 208)
      && (_DWORD)a2
      && (v6 = objc_loadWeakRetained((id *)(a1 + 216)),
          v7 = objc_opt_respondsToSelector(),
          v6,
          (v7 & 1) != 0)
      && (v8 = objc_loadWeakRetained((id *)(a1 + 216)),
          v9 = objc_msgSend(v8, "pencilSqueezeControllerCanShowPaletteView:", a1),
          v8,
          (v9 & 1) == 0))
    {
      v20 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_1BE213000, v20, OS_LOG_TYPE_DEFAULT, "Delegate doesn't want to show palette view", (uint8_t *)&v21, 2u);
      }

    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 216));
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) != 0)
      {
        v12 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v21 = 67109120;
          v22 = a2;
          _os_log_impl(&dword_1BE213000, v12, OS_LOG_TYPE_DEFAULT, "Notify palette view visibility will change, toVisible: %{BOOL}d", (uint8_t *)&v21, 8u);
        }

        v13 = objc_loadWeakRetained((id *)(a1 + 216));
        objc_msgSend(v13, "pencilSqueezeControllerWillChangePaletteViewVisibility:toVisible:", a1, a2);

      }
      *(_BYTE *)(a1 + 208) = a2;
      v14 = *(_QWORD *)(a1 + 128);
      v15 = -[PKPencilSqueezeController _onlyShowUndoOrRedo]((uint64_t *)a1);
      if (v14)
        *(_BYTE *)(v14 + 136) = !v15;
      v16 = objc_loadWeakRetained((id *)(a1 + 216));
      v17 = objc_opt_respondsToSelector();

      if ((v17 & 1) != 0)
      {
        v18 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v21 = 67109120;
          v22 = a2;
          _os_log_impl(&dword_1BE213000, v18, OS_LOG_TYPE_DEFAULT, "Notify palette view visibility did change, toVisible: %{BOOL}d", (uint8_t *)&v21, 8u);
        }

        v19 = objc_loadWeakRetained((id *)(a1 + 216));
        objc_msgSend(v19, "pencilSqueezeControllerDidChangePaletteViewVisibility:", a1);

      }
      if (v5)
        v5[2](v5);
    }
  }

}

- (void)_updateUIWithSqueeze:(void *)a3 customHoverPoint:(int)a4 animated:
{
  uint64_t v4;
  id *v5;
  NSObject *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *WeakRetained;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  int v24;
  PKPaletteBackgroundColorFactory *v25;
  void *v26;
  uint64_t v27;
  PKSqueezePaletteView *v28;
  id *v29;
  void *v30;
  id *v31;
  void *v32;
  PKSqueezePaletteViewContext *v33;
  const char *v34;
  void *v35;
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
  void *v48;
  void *v49;
  const char *v50;
  void *v51;
  void *v52;
  char v53;
  BOOL v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t i;
  void *v60;
  const char *v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  BOOL v67;
  id v68;
  void *v69;
  BOOL v70;
  void *v71;
  double v72;
  double v73;
  void *v74;
  CGFloat v75;
  CGFloat v76;
  double v77;
  double v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  NSObject *v83;
  void *v84;
  uint64_t v85;
  id *v86;
  void *v87;
  const char *v88;
  int v89;
  _QWORD *v90;
  void *v91;
  int v92;
  _QWORD *v93;
  void *v94;
  unsigned int v95;
  double v96;
  uint64_t v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  PKPaletteBackgroundColorFactory *v106;
  id v107;
  void *v108;
  PKPaletteBackgroundViewFactory *v109;
  void *v111;
  void *v112;
  PKSqueezePaletteViewLayoutFactory *v113;
  void *v114;
  void *v115;
  id v116;
  id v117;
  _QWORD v118[4];
  id v119;
  id v120;
  _QWORD v121[4];
  id v122;
  _QWORD v123[4];
  id v124;
  _QWORD v125[4];
  id v126;
  _QWORD v127[4];
  id v128;
  _QWORD v129[5];
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _QWORD v134[2];
  uint8_t buf[4];
  _BYTE v136[24];
  __int16 v137;
  id v138;
  __int16 v139;
  uint64_t v140;
  __int16 v141;
  void *v142;
  _QWORD v143[8];

  v143[5] = *MEMORY[0x1E0C80C00];
  v117 = a2;
  v116 = a3;
  if (!a1)
    goto LABEL_83;
  v8 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(unsigned __int8 *)(a1 + 208);
    objc_msgSend(v117, "hoverPose");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPencilSqueezeController _keyWindow]((uint64_t *)a1);
    v4 = objc_claimAutoreleasedReturnValue();
    -[PKPencilSqueezeController _keyWindow]((uint64_t *)a1);
    v5 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67110403;
    *(_DWORD *)v136 = v9;
    *(_WORD *)&v136[4] = 2048;
    *(_QWORD *)&v136[6] = v117;
    *(_WORD *)&v136[14] = 2113;
    *(_QWORD *)&v136[16] = v10;
    v137 = 2048;
    v138 = v116;
    v139 = 2113;
    v140 = v4;
    v141 = 2113;
    v142 = v11;
    _os_log_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEFAULT, "Update UI, visible: %{BOOL}d, squeeze: %p, hover pose: %{private}@ custom hover point: %p, window: %{private}@, scene: %{private}@", buf, 0x3Au);

  }
  v12 = *(void **)(a1 + 16);
  if (!*(_BYTE *)(a1 + 208))
  {
    if (v12)
    {
      v20 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE213000, v20, OS_LOG_TYPE_DEFAULT, "Hide mini palette", buf, 2u);
      }

      -[PKPencilSqueezeController _dismissPopovers]((id *)a1);
    }
LABEL_62:
    objc_initWeak((id *)buf, (id)a1);
    objc_msgSend(*(id *)(a1 + 120), "setHidden:", *(_BYTE *)(a1 + 208) == 0);
    v89 = *(unsigned __int8 *)(a1 + 208);
    if (*(_BYTE *)(a1 + 208))
    {
      v127[0] = MEMORY[0x1E0C809B0];
      v127[1] = 3221225472;
      v127[2] = __76__PKPencilSqueezeController__updateUIWithSqueeze_customHoverPoint_animated___block_invoke_50;
      v127[3] = &unk_1E77799A0;
      v4 = (uint64_t)&v128;
      objc_copyWeak(&v128, (id *)buf);
      v90 = v127;
    }
    else
    {
      v90 = 0;
    }
    v91 = *(void **)(a1 + 120);
    if (v91)
      objc_setProperty_nonatomic_copy(v91, v88, v90, 424);
    v92 = *(unsigned __int8 *)(a1 + 208);
    if (*(_BYTE *)(a1 + 208))
    {
      v125[0] = MEMORY[0x1E0C809B0];
      v125[1] = 3221225472;
      v125[2] = __76__PKPencilSqueezeController__updateUIWithSqueeze_customHoverPoint_animated___block_invoke_2;
      v125[3] = &unk_1E77788C0;
      v5 = &v126;
      objc_copyWeak(&v126, (id *)buf);
      v93 = v125;
    }
    else
    {
      v93 = 0;
    }
    v94 = *(void **)(a1 + 120);
    if (v94)
      objc_setProperty_nonatomic_copy(v94, v88, v93, 416);
    v95 = *(unsigned __int8 *)(a1 + 208);
    if (*(_BYTE *)(a1 + 208))
      v96 = 1.0;
    else
      v96 = 0.05;
    v97 = *(_QWORD *)(a1 + 152);
    v123[0] = MEMORY[0x1E0C809B0];
    v123[1] = 3221225472;
    v123[2] = __76__PKPencilSqueezeController__updateUIWithSqueeze_customHoverPoint_animated___block_invoke_3;
    v123[3] = &unk_1E7777588;
    objc_copyWeak(&v124, (id *)buf);
    v121[0] = MEMORY[0x1E0C809B0];
    v121[1] = 3221225472;
    v121[2] = __76__PKPencilSqueezeController__updateUIWithSqueeze_customHoverPoint_animated___block_invoke_4;
    v121[3] = &unk_1E77799C8;
    objc_copyWeak(&v122, (id *)buf);
    -[PKSqueezePaletteViewPresentationHandle animateToPaletteViewOpacity:paletteViewScale:animated:presentationValueHandler:completion:](v97, a4, v123, v121, (double)v95, v96);
    if (*(_BYTE *)(a1 + 208))
    {
      -[PKPencilSqueezeController _toolPickerForKeyWindow]((uint64_t *)a1);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "_windowScene");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v118[0] = MEMORY[0x1E0C809B0];
      v118[1] = 3221225472;
      v118[2] = __76__PKPencilSqueezeController__updateUIWithSqueeze_customHoverPoint_animated___block_invoke_5;
      v118[3] = &unk_1E77785D8;
      objc_copyWeak(&v120, (id *)buf);
      v100 = v99;
      v119 = v100;
      -[PKPencilSqueezeController _updateToolPickerVisibilityWithCompletion:]((uint64_t *)a1, v118);

      objc_destroyWeak(&v120);
    }
    else
    {
      -[PKPencilSqueezeController _updateToolPickerVisibilityWithCompletion:]((uint64_t *)a1, 0);
    }
    objc_destroyWeak(&v122);
    objc_destroyWeak(&v124);
    if (v92)
      objc_destroyWeak(v5);
    if (v89)
      objc_destroyWeak((id *)v4);
    objc_destroyWeak((id *)buf);
    goto LABEL_83;
  }
  objc_msgSend(v12, "removeFromSuperview");
  v13 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;

  -[PKPencilSqueezeController _toolPickerForKeyWindow]((uint64_t *)a1);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPencilSqueezeController _currentUndoManager]((uint64_t *)a1);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0DC3F10];
  -[PKPencilSqueezeController _keyWindow]((uint64_t *)a1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = objc_msgSend(v14, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v15, "semanticContentAttribute")) == 0;

  v113 = objc_alloc_init(PKSqueezePaletteViewLayoutFactory);
  v129[0] = MEMORY[0x1E0C809B0];
  v129[1] = 3221225472;
  v129[2] = __76__PKPencilSqueezeController__updateUIWithSqueeze_customHoverPoint_animated___block_invoke;
  v129[3] = &unk_1E7779978;
  v129[4] = a1;
  -[PKSqueezePaletteViewLayoutFactory makeInitialLayoutWithToolPicker:undoManager:paletteViewStartAngleProvider:isLTR:]((uint64_t *)v113, v112, v114, v129, (int)v14);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  if (v115)
  {
    v109 = objc_alloc_init(PKPaletteBackgroundViewFactory);
    v106 = objc_alloc_init(PKPaletteBackgroundColorFactory);
    -[PKPaletteBackgroundColorFactory makeBackgroundColor](v106);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteBackgroundViewFactory makeBackgroundViewWithName:backgroundColor:]((uint64_t)v109, CFSTR("com.apple.PencilKit.PKSqueezePaletteView"), v105);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "setUserInteractionEnabled:", 0);
    v107 = v117;
    objc_msgSend(v107, "hoverPose");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16 == 0;

    if (v17)
    {
      v26 = *(void **)(a1 + 56);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      objc_msgSend(v26, "azimuthAngleInView:", WeakRetained);
    }
    else
    {
      objc_msgSend(v107, "hoverPose");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "azimuthAngle");
    }
    v27 = v19;

    *(_QWORD *)(a1 + 184) = v27;
    v28 = [PKSqueezePaletteView alloc];
    v29 = -[PKSqueezePaletteView initWithBackgroundView:radius:contentHeight:layoutFactory:azimuth:]((id *)&v28->super.super.super.isa, v108, v113, *(double *)&PKSqueezePaletteViewRadius, *(double *)&PKSqueezePaletteViewContentHeight, *(double *)(a1 + 184));
    v30 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v29;

    v31 = -[PKPencilSqueezeControllerPaletteViewDelegateProxy initWithController:paletteView:]((id *)[PKPencilSqueezeControllerPaletteViewDelegateProxy alloc], (void *)a1, *(void **)(a1 + 16));
    v32 = *(void **)(a1 + 88);
    *(_QWORD *)(a1 + 88) = v31;

    -[PKSqueezePaletteView setDelegate:](*(_QWORD *)(a1 + 16), *(void **)(a1 + 88));
    objc_msgSend(*(id *)(a1 + 16), "setTintAdjustmentMode:", 1);
    -[PKPencilSqueezeController _toolPickerForKeyWindow]((uint64_t *)a1);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    if (v111)
    {
      v33 = objc_alloc_init(PKSqueezePaletteViewContext);
      objc_msgSend(v111, "_tools");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
        objc_setProperty_nonatomic_copy(v33, v34, v35, 16);

      objc_msgSend(v111, "selectedTool");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKMathResultAttribution setString:]((uint64_t)v33, v36);

      objc_msgSend(v111, "selectedTool");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      PKDisplayColorForTool(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSqueezePaletteViewContext setSelectedColor:]((uint64_t)v33, v38);

      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v104, CFSTR("black"));
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v143[0] = v103;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0823529412, 0.494117647, 0.984313725, 1.0);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v102, CFSTR("blue"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v143[1] = v39;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.325490196, 0.843137255, 0.411764706, 1.0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v40, CFSTR("green"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v143[2] = v41;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.996078431, 0.815686275, 0.188235294, 1.0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v42, CFSTR("yellow"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v143[3] = v43;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.988235294, 0.192156863, 0.258823529, 1.0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v44, CFSTR("red"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v143[4] = v45;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v143, 5);
      v101 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = (void *)MEMORY[0x1E0C99D20];
      objc_msgSend(v101, "reverseObjectEnumerator");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "allObjects");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "arrayWithArray:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
        objc_setProperty_nonatomic_copy(v33, v50, v49, 32);
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "bundleIdentifier");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "isEqualToString:", CFSTR("com.apple.mobilenotes"));

      if ((v53 & 1) != 0)
      {
        v54 = 1;
      }
      else
      {
        -[PKPencilSqueezeController _currentFirstResponder]((uint64_t *)a1);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          LODWORD(v56) = objc_msgSend(v55, "_supportsCanvasElements:", v111);
        }
        else
        {
          v132 = 0u;
          v133 = 0u;
          v130 = 0u;
          v131 = 0u;
          objc_msgSend(v111, "_observers");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v130, buf, 16);
          if (v56)
          {
            v58 = *(_QWORD *)v131;
            while (2)
            {
              for (i = 0; i != v56; ++i)
              {
                if (*(_QWORD *)v131 != v58)
                  objc_enumerationMutation(v57);
                v60 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * i);
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  LODWORD(v56) = objc_msgSend(v60, "_supportsCanvasElements:", v111);
                  goto LABEL_36;
                }
              }
              v56 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v130, buf, 16);
              if (v56)
                continue;
              break;
            }
          }
LABEL_36:

        }
        v54 = (_DWORD)v56 != 0;
      }
      if (v33)
        v33->_supportsCanvasElements = v54;

    }
    else
    {
      v33 = 0;
    }

    v62 = *(void **)(a1 + 16);
    if (v62)
      objc_setProperty_nonatomic_copy(v62, v61, v33, 584);

    -[PKSqueezePaletteView setCurrentLayout:](*(_QWORD *)(a1 + 16), v115);
    -[PKPencilSqueezeController _updateUserInterfaceStyle](a1);
    objc_msgSend(*(id *)(a1 + 16), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v63 = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(v63, "addSubview:", *(_QWORD *)(a1 + 16));

    v64 = v107;
    v65 = v64;
    if (v64)
    {
      objc_msgSend(v64, "hoverPose");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v66 != 0;

    }
    else
    {
      v67 = objc_msgSend(*(id *)(a1 + 56), "state") == 1 || objc_msgSend(*(id *)(a1 + 56), "state") == 2;
    }

    *(_BYTE *)(a1 + 160) = v67;
    v68 = v65;
    objc_msgSend(v68, "hoverPose");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v69 == 0;

    if (v70)
    {
      v74 = *(void **)(a1 + 56);
      v71 = objc_loadWeakRetained((id *)(a1 + 8));
      objc_msgSend(v74, "locationInView:", v71);
    }
    else
    {
      objc_msgSend(v68, "hoverPose");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "location");
    }
    v75 = v72;
    v76 = v73;

    *(CGFloat *)(a1 + 168) = v75;
    *(CGFloat *)(a1 + 176) = v76;
    if (*(_BYTE *)(a1 + 160))
    {
      -[PKPencilSqueezeUserDefaults saveLastPaletteHoverLocation:](*(_QWORD *)(a1 + 192), v75, v76);
      *(CFTimeInterval *)(a1 + 200) = CACurrentMediaTime();
    }
    if (v116)
    {
      objc_msgSend(v116, "CGPointValue");
      -[PKPencilSqueezeController _updatePalettePositionWithHoverLocation:](a1, v77, v78);
    }
    else
    {
      -[PKPencilSqueezeController _updatePalettePosition](a1);
    }
    v4 = MEMORY[0x1E0CB3718];
    objc_msgSend(*(id *)(a1 + 16), "widthAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "constraintEqualToConstant:", *(double *)(a1 + 24));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v134[0] = v80;
    objc_msgSend(*(id *)(a1 + 16), "heightAnchor");
    v5 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintEqualToConstant:", *(double *)(a1 + 32));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v134[1] = v81;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v134, 2);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v4, "activateConstraints:", v82);

    v83 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(unsigned __int8 *)(a1 + 160);
      NSStringFromCGPoint(*(CGPoint *)(a1 + 168));
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = *(_QWORD *)(a1 + 184);
      *(_DWORD *)buf = 67110147;
      *(_DWORD *)v136 = v4;
      *(_WORD *)&v136[4] = 2113;
      *(_QWORD *)&v136[6] = v84;
      *(_WORD *)&v136[14] = 2049;
      *(_QWORD *)&v136[16] = v85;
      v137 = 2113;
      v138 = v112;
      v139 = 2113;
      v140 = (uint64_t)v114;
      _os_log_impl(&dword_1BE213000, v83, OS_LOG_TYPE_DEFAULT, "Show mini palette, hovering: %{BOOL}d, location: %{private}@, azimuth: %{private}.2f, toolPicker: %{private}@, undoManager: %{private}@", buf, 0x30u);

    }
    if (!*(_QWORD *)(a1 + 152))
    {
      v86 = -[PKSqueezePaletteViewPresentationHandle initWithPaletteViewOpacityPresentationValue:paletteViewScalePresentationValue:]([PKSqueezePaletteViewPresentationHandle alloc], 0.0, 0.05);
      v87 = *(void **)(a1 + 152);
      *(_QWORD *)(a1 + 152) = v86;

    }
    -[PKPencilSqueezeController _updatePaletteViewPresentationState](a1);

    v25 = v106;
  }
  else
  {
    v21 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      v23 = objc_msgSend(v114, "canUndo");
      v24 = objc_msgSend(v114, "canRedo");
      *(_DWORD *)buf = 138478595;
      *(_QWORD *)v136 = v112;
      *(_WORD *)&v136[8] = 2113;
      *(_QWORD *)&v136[10] = v114;
      *(_WORD *)&v136[18] = 1024;
      *(_DWORD *)&v136[20] = v23;
      v137 = 1024;
      LODWORD(v138) = v24;
      _os_log_impl(&dword_1BE213000, v22, OS_LOG_TYPE_DEFAULT, "Unable to display mini palette, toolPicker: %{private}@, undoManager: %{private}@, canUndo: %{BOOL}d, canRedo: %{BOOL}d", buf, 0x22u);
      v25 = (PKPaletteBackgroundColorFactory *)v22;
      v109 = (PKPaletteBackgroundViewFactory *)v22;
    }
    else
    {
      v109 = (PKPaletteBackgroundViewFactory *)v21;
      v25 = (PKPaletteBackgroundColorFactory *)v21;
    }
  }

  if (v115)
    goto LABEL_62;
LABEL_83:

}

- (void)_handleKeyboardWillShowNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PKPencilSqueezeController _loggableNotificationDescription:]((uint64_t)self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138477827;
    v9 = v6;
    _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEFAULT, "Keyboard will show, notification: %{private}@", buf, 0xCu);

  }
  if (self->_paletteViewVisible)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __65__PKPencilSqueezeController__handleKeyboardWillShowNotification___block_invoke;
    v7[3] = &unk_1E7778020;
    v7[4] = self;
    -[PKPencilSqueezeController _setPaletteViewVisible:notify:didChangeHandler:]((uint64_t)self, 0, v7);
    -[PKPencilSqueezeController _updateUIWithSqueeze:customHoverPoint:animated:]((uint64_t)self, 0, 0, 1);
  }

}

void __65__PKPencilSqueezeController__handleKeyboardWillShowNotification___block_invoke(uint64_t a1)
{
  -[PKPencilSqueezeAnalyticsController didHideMiniPaletteByChangingContext](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240));
}

- (void)_handleKeyboardWillHideNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PKPencilSqueezeController _loggableNotificationDescription:]((uint64_t)self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138477827;
    v9 = v6;
    _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEFAULT, "Keyboard will hide, notification: %{private}@", buf, 0xCu);

  }
  if (self->_paletteViewVisible)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __65__PKPencilSqueezeController__handleKeyboardWillHideNotification___block_invoke;
    v7[3] = &unk_1E7778020;
    v7[4] = self;
    -[PKPencilSqueezeController _setPaletteViewVisible:notify:didChangeHandler:]((uint64_t)self, 0, v7);
    -[PKPencilSqueezeController _updateUIWithSqueeze:customHoverPoint:animated:]((uint64_t)self, 0, 0, 1);
  }

}

void __65__PKPencilSqueezeController__handleKeyboardWillHideNotification___block_invoke(uint64_t a1)
{
  -[PKPencilSqueezeAnalyticsController didHideMiniPaletteByChangingContext](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240));
}

- (void)_handleHandwritingEducationPaneSettingsDidChange:(id)a3
{
  NSObject *v4;
  _BOOL4 paletteViewVisible;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_paletteViewVisible)
  {
    -[PKPencilSqueezeControllerPaletteViewDelegateProxy handwritingEducationPaneSettingsDidChange]((id *)&self->_paletteViewDelegateProxy->super.isa);
  }
  else
  {
    v4 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      paletteViewVisible = self->_paletteViewVisible;
      v6[0] = 67109120;
      v6[1] = paletteViewVisible;
      _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Ignore handwriting education pane settings did change, paletteViewVisible: %{BOOL}d", (uint8_t *)v6, 8u);
    }

  }
}

- (void)keyWindowDidChangeBounds
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  uint64_t v10;
  CGRect v11;

  v10 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      -[PKPencilSqueezeController _keyWindow]((uint64_t *)a1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bounds");
      NSStringFromCGRect(v11);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(unsigned __int8 *)(a1 + 208);
      v6 = 138478083;
      v7 = v4;
      v8 = 1024;
      v9 = v5;
      _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "Key window bounds did change to: %{private}@, paletteVisible: %{BOOL}d", (uint8_t *)&v6, 0x12u);

    }
    -[PKPencilSqueezeController _updatePalettePosition](a1);
  }
}

- (void)_updatePalettePosition
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double MidX;
  double MidY;
  double v11;
  double v12;
  id v13;
  CGRect v14;
  CGRect v15;

  -[PKPencilSqueezeController _keyWindow]((uint64_t *)a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  v7 = v4 + -40.0;
  v8 = v6 + -50.0;
  if (CACurrentMediaTime() - *(double *)(a1 + 200) >= *(double *)&PKSqueezePaletteViewLastHoverLocationSavedTimeout)
  {
    v13 = 0;
  }
  else
  {
    -[PKPencilSqueezeUserDefaults loadLastPaletteHoverLocation](*(_QWORD *)(a1 + 192));
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14.origin.x = 20.0;
  v14.origin.y = 30.0;
  v14.size.width = v7;
  v14.size.height = v6 + -50.0;
  MidX = CGRectGetMidX(v14);
  v15.origin.x = 20.0;
  v15.origin.y = 30.0;
  v15.size.width = v7;
  v15.size.height = v8;
  MidY = CGRectGetMidY(v15);
  if (v13)
  {
    objc_msgSend(v13, "CGPointValue", MidY);
    MidX = v12;
  }
  else
  {
    v11 = MidY;
  }
  if (*(_BYTE *)(a1 + 160))
  {
    MidX = *(double *)(a1 + 168);
    v11 = *(double *)(a1 + 176);
  }
  -[PKPencilSqueezeController _updatePalettePositionWithHoverLocation:](a1, MidX, v11);

}

- (void)updateUserInterfaceStyle
{
  NSObject *v2;
  uint8_t v3[16];

  if (a1)
  {
    v2 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "Update UI style", v3, 2u);
    }

    -[PKPencilSqueezeController _updateUserInterfaceStyle](a1);
  }
}

- (void)_updateUserInterfaceStyle
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 208))
  {
    -[PKPencilSqueezeController _toolPickerForKeyWindow]((uint64_t *)a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPencilSqueezeController _keyWindow]((uint64_t *)a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceStyle");

    if (v2)
    {
      if (objc_msgSend(v2, "overrideUserInterfaceStyle"))
        v5 = objc_msgSend(v2, "overrideUserInterfaceStyle");
      v7 = *(void **)(a1 + 16);
      v6 = (uint64_t *)(a1 + 16);
      objc_msgSend(v7, "setOverrideUserInterfaceStyle:", v5);
      v8 = objc_msgSend(v2, "colorUserInterfaceStyle");
    }
    else
    {
      v9 = *(void **)(a1 + 16);
      v6 = (uint64_t *)(a1 + 16);
      objc_msgSend(v9, "setOverrideUserInterfaceStyle:", v5);
      v8 = 0;
    }
    -[PKSqueezePaletteView setColorUserInterfaceStyle:](*v6, v8);
    v10 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *v6;
      if (*v6)
        v11 = *(_QWORD *)(v11 + 592);
      v12 = 134283777;
      v13 = v5;
      v14 = 2049;
      v15 = v11;
      _os_log_impl(&dword_1BE213000, v10, OS_LOG_TYPE_DEFAULT, "Update palette UI style: %{private}ld, color UI style: %{private}ld", (uint8_t *)&v12, 0x16u);
    }

  }
}

- (void)performSqueezeAction
{
  NSObject *v2;
  _BOOL8 v3;
  _QWORD v4[5];
  uint8_t buf[16];

  if (a1)
  {
    v2 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "Perform squeeze action", buf, 2u);
    }

    v3 = *(_BYTE *)(a1 + 208) == 0;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __49__PKPencilSqueezeController_performSqueezeAction__block_invoke;
    v4[3] = &unk_1E7778020;
    v4[4] = a1;
    -[PKPencilSqueezeController _setPaletteViewVisible:notify:didChangeHandler:](a1, v3, v4);
    -[PKPencilSqueezeController _updateUIWithSqueeze:customHoverPoint:animated:](a1, 0, 0, 1);
    if (*(_BYTE *)(a1 + 208))
      -[PKPencilSqueezeController _didChangePaletteViewToVisible](a1);
  }
}

void __49__PKPencilSqueezeController_performSqueezeAction__block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 208))
    -[PKPencilSqueezeAnalyticsController didHideMiniPaletteBySqueezingAgain](*(_QWORD *)(v1 + 240));
}

- (void)_didChangePaletteViewToVisible
{
  uint64_t v2;
  id v3;
  int IsUndoRedoLayout;
  NSObject *v5;
  uint8_t v6[16];

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 16);
    if (v2)
    {
      v3 = *(id *)(v2 + 576);
      IsUndoRedoLayout = PKSqueezePaletteViewLayoutIsUndoRedoLayout(v3);

      -[PKPencilSqueezeAnalyticsController didShowMiniPaletteIsUndoRedoPalette:](*(_QWORD *)(a1 + 240), IsUndoRedoLayout);
    }
    else
    {
      v5 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_fault_impl(&dword_1BE213000, v5, OS_LOG_TYPE_FAULT, "Palette view shouldn't be nil when calling this method.", v6, 2u);
      }

    }
  }
}

- (void)pencilSettingsDidChange
{
  NSObject *v2;
  _QWORD v3[5];
  uint8_t buf[16];

  if (a1)
  {
    v2 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "Pencil settings did change", buf, 2u);
    }

    if (*(_BYTE *)(a1 + 208))
    {
      if (objc_msgSend(MEMORY[0x1E0DC3AC8], "preferredSqueezeAction") != 5)
      {
        v3[0] = MEMORY[0x1E0C809B0];
        v3[1] = 3221225472;
        v3[2] = __52__PKPencilSqueezeController_pencilSettingsDidChange__block_invoke;
        v3[3] = &unk_1E7778020;
        v3[4] = a1;
        -[PKPencilSqueezeController _setPaletteViewVisible:notify:didChangeHandler:](a1, 0, v3);
        -[PKPencilSqueezeController _updateUIWithSqueeze:customHoverPoint:animated:](a1, 0, 0, 1);
      }
    }
  }
}

void __52__PKPencilSqueezeController_pencilSettingsDidChange__block_invoke(uint64_t a1)
{
  -[PKPencilSqueezeAnalyticsController didHideMiniPaletteByChangingContext](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240));
}

- (void)setMiniPaletteVisible:(double)a3 hoverLocation:(double)a4
{
  int v6;
  void *v8;
  _QWORD v9[5];

  if (a1)
  {
    v6 = a2;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65__PKPencilSqueezeController_setMiniPaletteVisible_hoverLocation___block_invoke;
    v9[3] = &unk_1E7778020;
    v9[4] = a1;
    -[PKPencilSqueezeController _setPaletteViewVisible:notify:didChangeHandler:](a1, a2, v9);
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", a3, a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPencilSqueezeController _updateUIWithSqueeze:customHoverPoint:animated:](a1, 0, v8, 1);

      -[PKPencilSqueezeController _didChangePaletteViewToVisible](a1);
    }
    else
    {
      -[PKPencilSqueezeController _updateUIWithSqueeze:customHoverPoint:animated:](a1, 0, 0, 1);
    }
  }
}

void __65__PKPencilSqueezeController_setMiniPaletteVisible_hoverLocation___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 208))
    -[PKPencilSqueezeAnalyticsController didHideMiniPaletteByTappingOutsideOnScreen](*(_QWORD *)(v1 + 240));
}

- (id)hitTest:(void *)a3 fromView:(double)a4 withEvent:(double)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id WeakRetained;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;

  v9 = a2;
  v10 = a3;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 16), "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "convertPoint:fromWindow:", v12, a4, a5);
    v14 = v13;
    v16 = v15;

    objc_msgSend(*(id *)(a1 + 16), "convertPoint:fromView:", 0, v14, v16);
    objc_msgSend(*(id *)(a1 + 16), "hitTest:withEvent:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 224));
      objc_msgSend(WeakRetained, "presentedViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "convertPoint:toView:", v20, a4, a5);
      v22 = v21;
      v24 = v23;

      objc_msgSend(v19, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "hitTest:withEvent:", v10, v22, v24);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)_dismissPopovers
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 28);
    objc_msgSend(WeakRetained, "presentedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 && (objc_msgSend(v3, "isBeingDismissed") & 1) == 0)
    {
      v4 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v9 = v3;
        _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Dismiss presented view controller: %{private}@", buf, 0xCu);
      }

      objc_initWeak((id *)buf, a1);
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __45__PKPencilSqueezeController__dismissPopovers__block_invoke;
      v5[3] = &unk_1E77785D8;
      objc_copyWeak(&v7, (id *)buf);
      v6 = v3;
      objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v5);

      objc_destroyWeak(&v7);
      objc_destroyWeak((id *)buf);
    }

  }
}

void __60__PKPencilSqueezeController__handlePencilHitTest_withEvent___block_invoke(uint64_t a1)
{
  -[PKPencilSqueezeAnalyticsController didHideMiniPaletteByDrawing](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240));
}

void __72__PKPencilSqueezeController__handleContainerOverlayHitTest_point_event___block_invoke(uint64_t a1)
{
  -[PKPencilSqueezeAnalyticsController didHideMiniPaletteByTappingOutsideOnScreen](*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                             + 240));
}

- (void)pencilInteraction:(id)a3 didReceiveTap:(id)a4
{
  int v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_diagnostics())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v8, "BOOLForKey:", CFSTR("PKUsePencilDoubleTapAsSqueeze"));

  }
  else
  {
    v5 = 0;
  }
  v6 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v5;
    _os_log_impl(&dword_1BE213000, v6, OS_LOG_TYPE_DEFAULT, "Handle pencil interaction did tap, usePencilDoubleTapAsSqueeze: %{BOOL}d", (uint8_t *)v9, 8u);
  }

  if (v5)
  {
    -[PKPencilSqueezeController _setPaletteViewVisible:notify:didChangeHandler:]((uint64_t)self, !self->_paletteViewVisible, 0);
    -[PKPencilSqueezeController _updateUIWithSqueeze:customHoverPoint:animated:]((uint64_t)self, 0, 0, 1);
  }
  else if (self->_paletteViewVisible)
  {
    -[PKPencilSqueezeController _dismissPopovers]((id *)&self->super.isa);
    -[PKSqueezePaletteView pencilInteractionDidTap:]((uint64_t)self->_paletteView, objc_msgSend(MEMORY[0x1E0DC3AC8], "preferredTapAction"));
  }
  else
  {
    v7 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9[0]) = 0;
      _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEFAULT, "Pencil tap interaction ignored", (uint8_t *)v9, 2u);
    }

  }
}

- (void)pencilInteraction:(id)a3 didReceiveSqueeze:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 isHidingPaletteAfterDelay;
  NSObject *v10;
  void *v11;
  _BOOL4 paletteViewVisible;
  void *v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  double v17;
  NSObject *v18;
  void *v19;
  _BOOL4 paletteViewVisibleBeforeSqueezeBegan;
  _BOOL4 squeezeBeganOnPalette;
  PKSqueezePaletteView *paletteView;
  PKSqueezePaletteView *v23;
  void *v24;
  NSObject *v25;
  void (**v26)(void);
  _BOOL4 v27;
  PKSqueezePaletteView *v28;
  PKSqueezePaletteView *v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  dispatch_time_t v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  _QWORD block[5];
  id v38;
  _QWORD v39[5];
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  _BYTE v43[10];
  _BYTE v44[6];
  __int16 v45;
  void *v46;
  __int16 v47;
  _BOOL4 v48;
  __int16 v49;
  double v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_msgSend(MEMORY[0x1E0DC3AC8], "preferredSqueezeAction");
  v7 = objc_msgSend(v5, "phase");
  v8 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    isHidingPaletteAfterDelay = self->_isHidingPaletteAfterDelay;
    *(_DWORD *)buf = 134284033;
    v41 = v6;
    v42 = 2049;
    *(_QWORD *)v43 = v7;
    *(_WORD *)&v43[8] = 1024;
    *(_DWORD *)v44 = isHidingPaletteAfterDelay;
    _os_log_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEFAULT, "Handle pencil interaction did squeeze, preferredSqueezeAction: %{private}ld, phase: %{private}ld, isHidingPaletteAfterDelay: %{BOOL}d", buf, 0x1Cu);
  }

  if (self->_isHidingPaletteAfterDelay || v6 != 5)
  {
    v14 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v15 = "Pencil squeeze interaction ignored";
LABEL_13:
      _os_log_impl(&dword_1BE213000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
    }
LABEL_34:

  }
  else
  {
    switch(v7)
    {
      case 0:
        v10 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v5, "hoverPose");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138477827;
          v41 = (uint64_t)v11;
          _os_log_impl(&dword_1BE213000, v10, OS_LOG_TYPE_DEFAULT, "Pencil squeeze interaction phase began, hoverPose: %{private}@", buf, 0xCu);

        }
        paletteViewVisible = self->_paletteViewVisible;
        self->_paletteViewVisibleBeforeSqueezeBegan = paletteViewVisible;
        if (paletteViewVisible)
        {
          -[PKPencilSqueezeController _hoverViewInPalette:]((id *)&self->super.isa, v5);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          self->_squeezeBeganOnPalette = v13 != 0;

          if (self->_paletteViewVisible)
            break;
        }
        else
        {
          self->_squeezeBeganOnPalette = 0;
        }
        -[PKPencilSqueezeController _setPaletteViewVisible:notify:didChangeHandler:]((uint64_t)self, 1, 0);
        -[PKPencilSqueezeController _updateUIWithSqueeze:customHoverPoint:animated:]((uint64_t)self, v5, 0, 1);
        -[PKPencilSqueezeController _didChangePaletteViewToVisible]((uint64_t)self);
        break;
      case 1:
        v14 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v5, "hoverPose");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138477827;
          v41 = (uint64_t)v34;
          _os_log_debug_impl(&dword_1BE213000, v14, OS_LOG_TYPE_DEBUG, "Pencil squeeze interaction phase changed, hoverPose: %{private}@", buf, 0xCu);

        }
        goto LABEL_34;
      case 2:
        -[PKPencilSqueezeController _hoverViewInPalette:]((id *)&self->super.isa, v5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[PKSqueezePaletteViewPresentationHandle animationProgress]((uint64_t)self->_paletteViewPresentationHandle);
        v18 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v5, "hoverPose");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          paletteViewVisibleBeforeSqueezeBegan = self->_paletteViewVisibleBeforeSqueezeBegan;
          squeezeBeganOnPalette = self->_squeezeBeganOnPalette;
          *(_DWORD *)buf = 138479363;
          v41 = (uint64_t)v19;
          v42 = 1024;
          *(_DWORD *)v43 = paletteViewVisibleBeforeSqueezeBegan;
          *(_WORD *)&v43[4] = 1024;
          *(_DWORD *)&v43[6] = squeezeBeganOnPalette;
          *(_WORD *)v44 = 1024;
          *(_DWORD *)&v44[2] = v16 != 0;
          v45 = 2113;
          v46 = v16;
          v47 = 1024;
          v48 = v17 < 0.9;
          v49 = 2048;
          v50 = v17;
          _os_log_impl(&dword_1BE213000, v18, OS_LOG_TYPE_DEFAULT, "Pencil squeeze interaction phase ended, hoverState: %{private}@, paletteViewVisibleBeforeSqueezeBegan: %{BOOL}d, squeezeBeganOnPalette: %{BOOL}d, isHoverOnPalette: %{BOOL}d, hitView: %{private}@, isAnimating: %{BOOL}d, progress: %.f", buf, 0x38u);

        }
        if (v17 >= 0.9 && v16)
        {
          paletteView = self->_paletteView;
          if (paletteView)
            paletteView = (PKSqueezePaletteView *)paletteView->_currentLayout;
          v23 = paletteView;
          if (!self->_squeezeBeganOnPalette)
          {
            objc_msgSend(v16, "_pk_longSqueezeAction");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              v25 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138477827;
                v41 = (uint64_t)v16;
                _os_log_impl(&dword_1BE213000, v25, OS_LOG_TYPE_DEFAULT, "Perform long squeeze action on view: %{private}@", buf, 0xCu);
              }

              objc_msgSend(v16, "_pk_longSqueezeAction");
              v26 = (void (**)(void))objc_claimAutoreleasedReturnValue();
              v26[2]();

            }
          }
          if ((PKSqueezePaletteViewLayoutIsExpandedOptionsLayout(v23) & 1) != 0)
          {
            v27 = 1;
          }
          else
          {
            v28 = self->_paletteView;
            if (v28)
              v28 = (PKSqueezePaletteView *)v28->_currentLayout;
            v29 = v28;
            v27 = v23 != v29;

          }
          v30 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v41) = v27;
            _os_log_impl(&dword_1BE213000, v30, OS_LOG_TYPE_DEFAULT, "Keep palette visible: %{BOOL}d", buf, 8u);
          }

          if (!v27)
          {
            v31 = MEMORY[0x1E0C809B0];
            v39[0] = MEMORY[0x1E0C809B0];
            v39[1] = 3221225472;
            v39[2] = __65__PKPencilSqueezeController_pencilInteraction_didReceiveSqueeze___block_invoke;
            v39[3] = &unk_1E7778020;
            v39[4] = self;
            -[PKPencilSqueezeController _setPaletteViewVisible:notify:didChangeHandler:]((uint64_t)self, 0, v39);
            if (self->_squeezeBeganOnPalette)
            {
              -[PKPencilSqueezeController _updateUIWithSqueeze:customHoverPoint:animated:]((uint64_t)self, v5, 0, 1);
            }
            else
            {
              v32 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1BE213000, v32, OS_LOG_TYPE_DEFAULT, "Hide palette after delay", buf, 2u);
              }

              self->_isHidingPaletteAfterDelay = 1;
              v33 = dispatch_time(0, (uint64_t)(self->_hidePaletteDelay * 1000000000.0));
              block[0] = v31;
              block[1] = 3221225472;
              block[2] = __65__PKPencilSqueezeController_pencilInteraction_didReceiveSqueeze___block_invoke_39;
              block[3] = &unk_1E7777C20;
              block[4] = self;
              v38 = v5;
              dispatch_after(v33, MEMORY[0x1E0C80D38], block);

            }
          }

        }
        else if (self->_paletteViewVisibleBeforeSqueezeBegan)
        {
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __65__PKPencilSqueezeController_pencilInteraction_didReceiveSqueeze___block_invoke_2;
          v35[3] = &unk_1E7777C20;
          v35[4] = self;
          v36 = v5;
          -[PKPencilSqueezeController _setPaletteViewVisible:notify:didChangeHandler:]((uint64_t)self, 0, v35);

        }
        break;
      case 3:
        v14 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          goto LABEL_34;
        *(_WORD *)buf = 0;
        v15 = "Pencil squeeze interaction phase cancelled";
        goto LABEL_13;
      default:
        v14 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1BE213000, v14, OS_LOG_TYPE_ERROR, "Unhandled Pencil squeeze interaction phase", buf, 2u);
        }
        goto LABEL_34;
    }
  }

}

- (id)_hoverViewInPalette:(id *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (a1[2]
      && (objc_msgSend(v3, "hoverPose"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
    {
      objc_msgSend(v4, "hoverPose");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "location");
      v8 = v7;
      v10 = v9;

      v11 = a1[2];
      objc_msgSend(a1[16], "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "convertPoint:fromView:", v12, v8, v10);
      v14 = v13;
      v16 = v15;

      objc_msgSend(a1[2], "hitTest:withEvent:", 0, v14, v16);
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

void __65__PKPencilSqueezeController_pencilInteraction_didReceiveSqueeze___block_invoke(uint64_t a1)
{
  -[PKPencilSqueezeAnalyticsController didHideMiniPaletteBySqueezingAgain](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240));
}

void __65__PKPencilSqueezeController_pencilInteraction_didReceiveSqueeze___block_invoke_39(uint64_t a1)
{
  -[PKPencilSqueezeController _updateUIWithSqueeze:customHoverPoint:animated:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), 0, 1);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 138) = 0;
}

void __65__PKPencilSqueezeController_pencilInteraction_didReceiveSqueeze___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 208))
    v3 = *(void **)(a1 + 40);
  else
    v3 = 0;
  -[PKPencilSqueezeController _updateUIWithSqueeze:customHoverPoint:animated:](v2, v3, 0, 1);
  -[PKPencilSqueezeAnalyticsController didHideMiniPaletteBySqueezingAgain](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240));
}

- (uint64_t)_toolPickerForKeyWindow
{
  uint64_t *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t *v10;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v1 = a1;
  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    -[PKPencilSqueezeController _keyWindow](a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKToolPicker _toolPickersForWindow:]((uint64_t)PKToolPicker, v2);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v8, "_isEnabled", (_QWORD)v13) & 1) != 0)
          {
            v1 = v8;
            v10 = (uint64_t *)v3;
            goto LABEL_14;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v5)
          continue;
        break;
      }
    }

    +[PKToolPicker _existingToolPickerForWindow:](PKToolPicker, "_existingToolPickerForWindow:", v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9;
    }
    else
    {
      -[PKPencilSqueezeController _currentFirstResponder](v1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKToolPicker _cycleToolPickersForResponder:]((uint64_t)PKToolPicker, v12);
      +[PKToolPicker _existingToolPickerForWindow:](PKToolPicker, "_existingToolPickerForWindow:", v2);
      v10 = (uint64_t *)(id)objc_claimAutoreleasedReturnValue();

    }
    v1 = v10;
LABEL_14:

  }
  return v1;
}

- (id)_currentUndoManager
{
  void *v1;
  void *v2;

  if (a1)
  {
    -[PKPencilSqueezeController _currentFirstResponder](a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "undoManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

double __76__PKPencilSqueezeController__updateUIWithSqueeze_customHoverPoint_animated___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  void *v4;
  id WeakRetained;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v11;
  double v12;
  float v13;
  double v14;

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    return 0.0;
  v4 = *(void **)(v2 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
  objc_msgSend(v4, "azimuthAngleInView:", WeakRetained);
  v7 = v6;

  -[PKPencilSqueezeUserDefaults loadLastPaletteViewStartAngle](*(_QWORD *)(v2 + 192));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 != 0.0 || v8 == 0)
  {
    v11 = -v7;
    if (v7 >= 0.0)
      v11 = v7;
    v12 = 4.38077642;
    if (a2)
      v12 = 5.70722665;
    if (v11 >= 1.57079633)
      v14 = v12;
    else
      v14 = 3.45575192;
  }
  else
  {
    objc_msgSend(v8, "floatValue");
    v14 = v13;
  }
  if (v7 != 0.0)
    -[PKPencilSqueezeUserDefaults saveLastPaletteViewStartAngle:](*(_QWORD *)(v2 + 192), v14);

  return v14;
}

- (uint64_t)_updatePalettePositionWithHoverLocation:(double)a3
{
  uint64_t v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  void *v16;
  double v17;
  double v18;
  NSObject *v19;
  void *v20;
  double v21;
  NSObject *v22;
  double v23;
  BOOL v24;
  double v25;
  double v26;
  double v27;
  double v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  CGAffineTransform v39;
  uint8_t v40[4];
  void *v41;
  CGAffineTransform buf;
  uint64_t v43;
  CGPoint v44;
  CGRect v45;
  CGRect v46;

  v43 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(result + 208))
  {
    v5 = result;
    -[PKPencilSqueezeController _keyWindow]((uint64_t *)result);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    v15 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v45.origin.x = v8;
      v45.origin.y = v10;
      v45.size.width = v12;
      v45.size.height = v14;
      NSStringFromCGRect(v45);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.a) = 138477827;
      *(_QWORD *)((char *)&buf.a + 4) = v16;
      _os_log_impl(&dword_1BE213000, v15, OS_LOG_TYPE_DEFAULT, "Update palette view position, keyWindowBounds: %{private}@", (uint8_t *)&buf, 0xCu);

    }
    objc_msgSend(*(id *)(v5 + 72), "setConstant:", v12);
    objc_msgSend(*(id *)(v5 + 80), "setConstant:", v14);
    v17 = v12 + -40.0;
    v18 = v14 + -50.0;
    v19 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v46.origin.x = 20.0;
      v46.origin.y = 30.0;
      v46.size.width = v17;
      v46.size.height = v18;
      NSStringFromCGRect(v46);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.a) = 138477827;
      *(_QWORD *)((char *)&buf.a + 4) = v20;
      _os_log_impl(&dword_1BE213000, v19, OS_LOG_TYPE_DEFAULT, "Update palette view position, displayRect: %{private}@", (uint8_t *)&buf, 0xCu);

    }
    v21 = -[PKPencilSqueezeController _paletteViewScale](v5);
    v22 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.a) = 134283521;
      *(double *)((char *)&buf.a + 4) = v21;
      _os_log_impl(&dword_1BE213000, v22, OS_LOG_TYPE_DEFAULT, "Update palette view position, paletteViewScale: %{private}.2f", (uint8_t *)&buf, 0xCu);
    }

    memset(&buf, 0, sizeof(buf));
    CGAffineTransformMakeScale(&buf, v21, v21);
    v39 = buf;
    objc_msgSend(*(id *)(v5 + 16), "setTransform:", &v39);
    objc_msgSend(*(id *)(v5 + 40), "setActive:", 0);
    objc_msgSend(*(id *)(v5 + 48), "setActive:", 0);
    v23 = *(double *)(v5 + 184);
    if (v23 < 0.0)
      v23 = -v23;
    v24 = v23 < 1.57079633;
    v25 = -30.0;
    if (v24)
      v25 = 30.0;
    v26 = -[PKPencilSqueezeController _paletteViewCenterInRect:hoverLocation:paletteViewSize:](v5, 20.0, 30.0, v17, v18, a2 + v25, a3 + 30.0, *(double *)(v5 + 32) * buf.c + buf.a * *(double *)(v5 + 24));
    v28 = v27;
    v29 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v44.x = v26;
      v44.y = v28;
      NSStringFromCGPoint(v44);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v40 = 138477827;
      v41 = v30;
      _os_log_impl(&dword_1BE213000, v29, OS_LOG_TYPE_DEFAULT, "Update palette view position, center: %{private}@", v40, 0xCu);

    }
    objc_msgSend(*(id *)(v5 + 16), "centerXAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v5 + 64), "leftAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, v26);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v33;

    objc_msgSend(*(id *)(v5 + 16), "centerYAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v5 + 64), "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, v28);
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v37;

    objc_msgSend(*(id *)(v5 + 40), "setActive:", 1);
    return objc_msgSend(*(id *)(v5 + 48), "setActive:", 1);
  }
  return result;
}

- (uint64_t)_updatePaletteViewPresentationState
{
  uint64_t v1;
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  double v7;
  void *v8;
  CGAffineTransform v9;
  CGAffineTransform v10;

  if (result)
  {
    v1 = result;
    v2 = *(_QWORD *)(result + 152);
    v3 = 0.0;
    v4 = 0.0;
    if (v2)
      objc_msgSend(*(id *)(v2 + 24), "presentationValue", 0.0);
    objc_msgSend(*(id *)(v1 + 16), "setAlpha:", v4);
    v5 = -[PKPencilSqueezeController _paletteViewScale](v1);
    v6 = *(_QWORD *)(v1 + 152);
    if (v6)
    {
      objc_msgSend(*(id *)(v6 + 32), "presentationValue");
      v3 = v7;
    }
    CGAffineTransformMakeScale(&v10, v5 * v3, v5 * v3);
    v8 = *(void **)(v1 + 16);
    v9 = v10;
    return objc_msgSend(v8, "setTransform:", &v9);
  }
  return result;
}

id __76__PKPencilSqueezeController__updateUIWithSqueeze_customHoverPoint_animated___block_invoke_50(uint64_t a1, void *a2, double a3, double a4)
{
  id *v6;
  id v7;
  id *WeakRetained;
  id v9;
  NSObject *v10;
  int v11;
  void *v12;
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  v6 = (id *)(a1 + 32);
  v7 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v6);
  v9 = v7;
  if (!WeakRetained)
    goto LABEL_7;
  v10 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *((unsigned __int8 *)WeakRetained + 208);
    LODWORD(v14[0]) = 67109120;
    HIDWORD(v14[0]) = v11;
    _os_log_impl(&dword_1BE213000, v10, OS_LOG_TYPE_DEFAULT, "Handle pencil hit test, paletteViewVisible: %{BOOL}d", (uint8_t *)v14, 8u);
  }

  if (*((_BYTE *)WeakRetained + 208))
  {
    objc_msgSend(WeakRetained[2], "convertPoint:fromView:", WeakRetained[15], a3, a4);
    objc_msgSend(WeakRetained[2], "hitTest:withEvent:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[PKPencilSqueezeController _dismissPopovers](WeakRetained);
    }
    else
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __60__PKPencilSqueezeController__handlePencilHitTest_withEvent___block_invoke;
      v14[3] = &unk_1E7778020;
      v14[4] = WeakRetained;
      -[PKPencilSqueezeController _setPaletteViewVisible:notify:didChangeHandler:]((uint64_t)WeakRetained, 0, v14);
      -[PKPencilSqueezeController _updateUIWithSqueeze:customHoverPoint:animated:](WeakRetained, 0, 0, 1);
    }
  }
  else
  {
LABEL_7:
    v12 = 0;
  }

  return v12;
}

uint64_t __76__PKPencilSqueezeController__updateUIWithSqueeze_customHoverPoint_animated___block_invoke_2(uint64_t a1, void *a2, void *a3, double a4, double a5)
{
  id *v8;
  id v9;
  id v10;
  id *WeakRetained;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[5];

  v8 = (id *)(a1 + 32);
  v9 = a3;
  v10 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v8);
  v12 = v10;
  v13 = v9;
  v14 = v13;
  if (WeakRetained && v13 && *((_BYTE *)WeakRetained + 208) && objc_msgSend(v13, "type") != 11)
  {
    objc_msgSend(WeakRetained[2], "convertPoint:fromView:", v12, a4, a5);
    objc_msgSend(WeakRetained[2], "hitTest:withEvent:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[PKPencilSqueezeController _dismissPopovers](WeakRetained);
    }
    else
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __72__PKPencilSqueezeController__handleContainerOverlayHitTest_point_event___block_invoke;
      v18[3] = &unk_1E7778020;
      v18[4] = WeakRetained;
      -[PKPencilSqueezeController _setPaletteViewVisible:notify:didChangeHandler:]((uint64_t)WeakRetained, 0, v18);
      -[PKPencilSqueezeController _updateUIWithSqueeze:customHoverPoint:animated:](WeakRetained, 0, 0, 1);
    }
  }

  v16 = 0;
  return 0;
}

void __76__PKPencilSqueezeController__updateUIWithSqueeze_customHoverPoint_animated___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[PKPencilSqueezeController _updatePaletteViewPresentationState]((uint64_t)WeakRetained);

}

void __76__PKPencilSqueezeController__updateUIWithSqueeze_customHoverPoint_animated___block_invoke_4(uint64_t a1, int a2, char a3)
{
  id *WeakRetained;
  _BYTE *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  id v8;
  id v9;
  id *v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a2 && (a3 & 1) == 0)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v10 = WeakRetained;
      v5 = !*((_BYTE *)WeakRetained + 208)
        && ((v4 = WeakRetained[19]) == 0 || !v4[48])
        && WeakRetained[2]
        && *((_BYTE *)WeakRetained + 138) == 0;
      v6 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *((unsigned __int8 *)v10 + 208);
        *(_DWORD *)buf = 67109376;
        v12 = v7;
        v13 = 1024;
        v14 = v5;
        _os_log_impl(&dword_1BE213000, v6, OS_LOG_TYPE_DEFAULT, "Palette view presentation did finish, isVisible: %{BOOL}d, remove from view hierarchy: %{BOOL}d", buf, 0xEu);
      }

      WeakRetained = v10;
      if (v5)
      {
        v8 = v10[11];
        v10[11] = 0;

        objc_msgSend(v10[2], "removeFromSuperview");
        v9 = v10[2];
        v10[2] = 0;

        WeakRetained = v10;
      }
    }

  }
}

void __76__PKPencilSqueezeController__updateUIWithSqueeze_customHoverPoint_animated___block_invoke_5(uint64_t a1)
{
  id v2;
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(id *)(a1 + 32);
  if (WeakRetained && WeakRetained[208])
    +[PKToolPicker _dockToolPickerForWindowScene:toAutoHideCornerAnimated:]((uint64_t)PKToolPicker, v2, 0);

}

- (void)_updateToolPickerVisibilityWithCompletion:(uint64_t *)a1
{
  id v3;
  PKToolPickerVisibilityContext *v4;
  PKToolPickerVisibilityContext *v5;
  id v6;

  v3 = a2;
  -[PKPencilSqueezeController _toolPickerForKeyWindow](a1);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(PKToolPickerVisibilityContext);
  v5 = v4;
  if (v4)
    v4->_squeezePaletteVisibleDidChange = 1;
  -[PKToolPicker _updateToolPickerVisibilityWithContext:completion:](v6, v4, v3);

}

- (double)_paletteViewScale
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;

  -[PKPencilSqueezeController _keyWindow]((uint64_t *)a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  -[PKPencilSqueezeController _toolPickerForKeyWindow]((uint64_t *)a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = PKSqueezePaletteViewScaleFactor(v7, 20.0, 30.0, v4 + -40.0, v6 + -50.0, *(double *)(a1 + 24));

  return v8;
}

- (double)_paletteViewCenterInRect:(CGFloat)a3 hoverLocation:(CGFloat)a4 paletteViewSize:(CGFloat)a5
{
  double v13;
  double v14;
  double v15;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  if (!a1)
    return 0.0;
  v13 = a8 * 0.5;
  v14 = a8 * 0.5 + CGRectGetMinX(*(CGRect *)&a2);
  if (a6 < v14)
    a6 = v14;
  v17.origin.x = a2;
  v17.origin.y = a3;
  v17.size.width = a4;
  v17.size.height = a5;
  v15 = CGRectGetMaxX(v17) - v13;
  if (a6 >= v15)
    a6 = v15;
  v18.origin.x = a2;
  v18.origin.y = a3;
  v18.size.width = a4;
  v18.size.height = a5;
  CGRectGetMinY(v18);
  v19.origin.x = a2;
  v19.origin.y = a3;
  v19.size.width = a4;
  v19.size.height = a5;
  CGRectGetMaxY(v19);
  return a6;
}

- (double)paletteViewFrameForHoverLocation:(double)a3
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  id WeakRetained;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGAffineTransform v26;

  if (!a1)
    return 0.0;
  -[PKPencilSqueezeController _keyWindow]((uint64_t *)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;

  v11 = v8 + -40.0;
  v12 = v10 + -50.0;
  -[PKPencilSqueezeController _toolPickerForKeyWindow]((uint64_t *)a1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = PKSqueezePaletteViewScaleFactor(v13, 20.0, 30.0, v11, v12, *(double *)(a1 + 24));
  v15 = *(void **)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  objc_msgSend(v15, "azimuthAngleInView:", WeakRetained);
  v18 = v17;

  v19 = -v18;
  if (v18 >= 0.0)
    v19 = v18;
  v20 = v19 < 1.57079633;
  v21 = -30.0;
  if (v20)
    v21 = 30.0;
  v22 = a2 + v21;
  memset(&v26, 0, sizeof(v26));
  CGAffineTransformMakeScale(&v26, v14, v14);
  v23 = *(double *)(a1 + 32) * v26.c + v26.a * *(double *)(a1 + 24);
  v24 = -[PKPencilSqueezeController _paletteViewCenterInRect:hoverLocation:paletteViewSize:](a1, 20.0, 30.0, v11, v12, v22, a3 + 30.0, v23)- v23 * 0.5;

  return v24;
}

- (id)_currentFirstResponder
{
  void *v1;
  void *v2;

  if (a1)
  {
    -[PKPencilSqueezeController _keyWindow](a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "firstResponder");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)_isPresentedViewController:(uint64_t)a1
{
  id *v2;
  id v3;
  id WeakRetained;
  id v5;
  _BOOL8 v6;

  if (!a1)
    return 0;
  v2 = (id *)(a1 + 224);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "presentedViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v5 == v3;
  return v6;
}

- (void)_togglePresentViewControllerAsPopover:(void *)a3 sourceView:
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (a1)
  {
    if (-[PKPencilSqueezeController _isPresentedViewController:](a1, v6))
      objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
    else
      -[PKPencilSqueezeController _presentViewControllerAsPopover:sourceView:](a1, v6, v5);
  }

}

- (void)_presentViewControllerAsPopover:(void *)a3 sourceView:
{
  id v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  id WeakRetained;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  id v27;
  NSObject *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  _QWORD v33[2];
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (-[PKPencilSqueezeController _isPresentedViewController:](a1, v5)
      || (v7 = objc_msgSend(v5, "isBeingPresented"), !v6)
      || v7)
    {
      v28 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138478083;
        v35 = v5;
        v36 = 2113;
        v37 = v6;
        _os_log_impl(&dword_1BE213000, v28, OS_LOG_TYPE_DEFAULT, "Unable to present view controller: %{private}@, sourceView: %{private}@", buf, 0x16u);
      }

    }
    else
    {
      objc_msgSend(v5, "setModalPresentationStyle:", 7);
      objc_msgSend(v5, "popoverPresentationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDelegate:", a1);

      objc_msgSend(v5, "popoverPresentationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setSourceView:", v6);

      objc_msgSend(v6, "bounds");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      objc_msgSend(v5, "popoverPresentationController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setSourceRect:", v11, v13, v15, v17);

      objc_msgSend(v5, "popoverPresentationController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setSourceItem:", v6);

      objc_msgSend(v5, "popoverPresentationController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_setIgnoresKeyboardNotifications:", 1);

      v33[0] = *(_QWORD *)(a1 + 120);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      v33[1] = WeakRetained;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "popoverPresentationController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setPassthroughViews:", v22);

      objc_msgSend(v5, "popoverPresentationController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setPermittedArrowDirections:", 15);

      v25 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = objc_loadWeakRetained((id *)(a1 + 224));
        *(_DWORD *)buf = 138478083;
        v35 = v5;
        v36 = 2113;
        v37 = v26;
        _os_log_impl(&dword_1BE213000, v25, OS_LOG_TYPE_DEFAULT, "Present view controller: %{private}@, root view controller: %{private}@", buf, 0x16u);

      }
      objc_initWeak((id *)buf, (id)a1);
      v27 = objc_loadWeakRetained((id *)(a1 + 224));
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __72__PKPencilSqueezeController__presentViewControllerAsPopover_sourceView___block_invoke;
      v29[3] = &unk_1E77799F0;
      objc_copyWeak(&v32, (id *)buf);
      v30 = v5;
      v31 = v6;
      objc_msgSend(v27, "presentViewController:animated:completion:", v30, 1, v29);

      objc_destroyWeak(&v32);
      objc_destroyWeak((id *)buf);
    }
  }

}

void __72__PKPencilSqueezeController__presentViewControllerAsPopover_sourceView___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  BOOL v5;
  NSObject *v6;
  NSObject *v7;
  id WeakRetained;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v2;
  if (WeakRetained)
  {
    v5 = -[PKPencilSqueezeController _isPresentedViewController:]((uint64_t)WeakRetained, v3);
    v6 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v10 = v3;
        _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEFAULT, "Did present view controller: %{private}@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v10 = v3;
      _os_log_error_impl(&dword_1BE213000, v7, OS_LOG_TYPE_ERROR, "Unable to present view controller: %{private}@", buf, 0xCu);
    }

  }
}

void __45__PKPencilSqueezeController__dismissPopovers__block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t *WeakRetained;
  uint8_t buf[4];
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(id *)(a1 + 32);
  if (WeakRetained)
  {
    v3 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v6 = v2;
      _os_log_impl(&dword_1BE213000, v3, OS_LOG_TYPE_DEFAULT, "Did dismiss view controller: %{private}@", buf, 0xCu);
    }

    -[PKPencilSqueezeControllerPaletteViewDelegateProxy didDismissViewController:](WeakRetained[11], v2);
  }

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (BOOL)pencilSqueezeAnalyticsControllerIsHovering:(id)a3
{
  return self->_hovering;
}

- (double)pencilSqueezeAnalyticsControllerHoverZOffset:(id)a3
{
  double result;

  -[UIHoverGestureRecognizer zOffset](self->_hoverGestureRecognizer, "zOffset", a3);
  return result;
}

- (id)pencilSqueezeAnalyticsControllerHoverSettings:(id)a3
{
  return self->_hoverSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__analyticsController, 0);
  objc_storeStrong((id *)&self->_textEffectsWindowObserver, 0);
  objc_destroyWeak((id *)&self->_rootViewController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_paletteViewPresentationHandle, 0);
  objc_storeStrong((id *)&self->_pencilInteraction, 0);
  objc_storeStrong((id *)&self->_containerViewOverlay, 0);
  objc_storeStrong((id *)&self->_autoRefineSettingsObserver, 0);
  objc_storeStrong((id *)&self->_pencilInteractionObserver, 0);
  objc_storeStrong((id *)&self->_hoverSettings, 0);
  objc_storeStrong((id *)&self->_paletteViewDelegateProxy, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuideHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuideWidthConstraint, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_paletteViewCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_paletteViewCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_paletteView, 0);
  objc_destroyWeak((id *)&self->_containerView);
}

@end
