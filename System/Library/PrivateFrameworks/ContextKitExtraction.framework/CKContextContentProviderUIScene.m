@implementation CKContextContentProviderUIScene

+ (void)initialize
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[7];

  v13[6] = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)MEMORY[0x1E0C99E60];
    v3 = *MEMORY[0x1E0CEBC58];
    v13[0] = *MEMORY[0x1E0CEBC48];
    v13[1] = v3;
    v4 = *MEMORY[0x1E0CEBCD0];
    v13[2] = *MEMORY[0x1E0CEBD10];
    v13[3] = v4;
    v5 = *MEMORY[0x1E0CEBCC0];
    v13[4] = *MEMORY[0x1E0CEBCA8];
    v13[5] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 6);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setWithArray:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)kSensitiveContentTypes;
    kSensitiveContentTypes = v7;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6246F50);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)kNotNotableSuperviewClassNames;
    kNotNotableSuperviewClassNames = v9;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6246F68);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)kClassesExcludedFromTextExtraction;
    kClassesExcludedFromTextExtraction = v11;

  }
}

- (CKContextContentProviderUIScene)initWithScene:(id)a3
{
  id v4;
  CKContextContentProviderUIScene *v5;
  CKContextContentProviderUIScene *v6;
  void *v7;
  CKContextContentProviderUIScene *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKContextContentProviderUIScene;
  v5 = -[CKContextContentProviderUIScene init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[CKContextContentProviderUIScene _setScene:](v5, "_setScene:", v4);
    +[CKContextContentProviderManager sharedManager](CKContextContentProviderManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addProvider:", v6);

    if (+[CKContextContentProviderManager isSpringBoard](CKContextContentProviderManager, "isSpringBoard"))
    {
      -[CKContextContentProviderUIScene _setUpDebuggingControlsIfPossibleAfterDelay:](v6, "_setUpDebuggingControlsIfPossibleAfterDelay:", 2.0);
    }
    v8 = v6;
  }

  return v6;
}

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->__scene, a3);
}

- (void)_sceneWillInvalidate:(id)a3
{
  NSTimer **p_toolInstallationTimer;
  id WeakRetained;
  int v6;
  id v7;
  void *v8;

  p_toolInstallationTimer = &self->_toolInstallationTimer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_toolInstallationTimer);
  v6 = objc_msgSend(WeakRetained, "isValid");

  if (v6)
  {
    v7 = objc_loadWeakRetained((id *)p_toolInstallationTimer);
    objc_msgSend(v7, "invalidate");

    objc_storeWeak((id *)p_toolInstallationTimer, 0);
  }
  +[CKContextContentProviderManager sharedManager](CKContextContentProviderManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeProvider:", self);

  -[CKContextContentProviderUIScene _setScene:](self, "_setScene:", 0);
}

- (void)extractUsingExecutor:(id)a3 withOptions:(unint64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  -[CKContextContentProviderUIScene _scene](self, "_scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend((id)objc_opt_class(), "extractFromScene:usingExecutor:withOptions:", v6, v7, a4);

}

+ (void)extractFromScene:(id)a3 usingExecutor:(id)a4 withOptions:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[6];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    if (v7 && (unint64_t)objc_msgSend(v7, "activationState") <= 1)
    {
      objc_msgSend(v7, "_visibleWindows");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count"))
      {
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v17 = v9;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v20;
          v14 = MEMORY[0x1E0C809B0];
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v20 != v13)
                objc_enumerationMutation(v10);
              v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15);
              v18[0] = v14;
              v18[1] = 3221225472;
              v18[2] = __78__CKContextContentProviderUIScene_extractFromScene_usingExecutor_withOptions___block_invoke;
              v18[3] = &unk_1E6243448;
              v18[4] = v16;
              v18[5] = a5;
              objc_msgSend(v8, "addWorkItem:", v18);
              ++v15;
            }
            while (v12 != v15);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          }
          while (v12);
        }

        v9 = v17;
      }

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    +[CKContextContentProviderUIScene extractFromScene:usingExecutor:withOptions:].cold.1();
  }

}

void __78__CKContextContentProviderUIScene_extractFromScene_usingExecutor_withOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = (void *)MEMORY[0x1B5E10230]();
  +[CKContextContentProviderUIScene _donateContentsOfWindow:usingExecutor:withOptions:](CKContextContentProviderUIScene, "_donateContentsOfWindow:usingExecutor:withOptions:", *(_QWORD *)(a1 + 32), v4, *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v3);

}

+ (BOOL)_isRelevantForExtractionWithView:(id)a3
{
  id v3;
  double v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  int v9;
  objc_class *v11;
  void *v12;
  CGRect v13;
  CGRect v14;

  v3 = a3;
  if ((objc_msgSend(v3, "isHidden") & 1) != 0)
    goto LABEL_5;
  objc_msgSend(v3, "alpha");
  if (v4 < 0.05)
    goto LABEL_5;
  objc_msgSend(v3, "frame");
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  if (CGRectGetWidth(v13) < 30.0
    || (v14.origin.x = x, v14.origin.y = y,
                          v14.size.width = width,
                          v14.size.height = height,
                          CGRectGetHeight(v14) < 17.0))
  {
LABEL_5:
    LOBYTE(v9) = 0;
  }
  else
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend((id)kClassesExcludedFromTextExtraction, "containsObject:", v12) ^ 1;

  }
  return v9;
}

+ (void)_descendantsRelevantForContentExtractionFromView:(id)a3 intoArray:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;
  CGRect v33;
  CGRect v34;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "_isRelevantForExtractionWithView:", v6))
  {
    objc_msgSend(v7, "addObject:", v6);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v6, "subviews", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reverseObjectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v13);
          if (!objc_msgSend(v6, "clipsToBounds"))
            goto LABEL_9;
          objc_msgSend(v6, "bounds");
          v16 = v15;
          v18 = v17;
          v20 = v19;
          v22 = v21;
          objc_msgSend(v14, "frame");
          v34.origin.x = v23;
          v34.origin.y = v24;
          v34.size.width = v25;
          v34.size.height = v26;
          v33.origin.x = v16;
          v33.origin.y = v18;
          v33.size.width = v20;
          v33.size.height = v22;
          if (CGRectIntersectsRect(v33, v34))
LABEL_9:
            objc_msgSend(a1, "_descendantsRelevantForContentExtractionFromView:intoArray:", v14, v7);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v11);
    }

  }
}

+ (id)_descendantsRelevantForContentExtractionFromWindow:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double Width;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  id v38;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v40 = v4;
  objc_msgSend(v4, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reverseObjectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v42;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v42 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isHidden") & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_12;
          objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "bounds");
          v16 = v15;
          v18 = v17;
          v20 = v19;
          v22 = v21;

          objc_msgSend(v13, "frame");
          v24 = v23;
          v26 = v25;
          v28 = v27;
          v30 = v29;
          v47.origin.x = v16;
          v47.origin.y = v18;
          v47.size.width = v20;
          v47.size.height = v22;
          Width = CGRectGetWidth(v47);
          objc_msgSend(v13, "frame");
          v32 = CGRectGetWidth(v48);
          if (!v10)
            goto LABEL_11;
          v33 = v32;
          objc_msgSend(v10, "frame");
          v50.origin.x = v34;
          v50.origin.y = v35;
          v50.size.width = v36;
          v50.size.height = v37;
          v49.origin.x = v24;
          v49.origin.y = v26;
          v49.size.width = v28;
          v49.size.height = v30;
          if (!CGRectEqualToRect(v49, v50) || vabdd_f64(Width, v33) <= 20.0)
          {
LABEL_11:
            v38 = v13;

            v10 = v38;
LABEL_12:
            objc_msgSend(a1, "_descendantsRelevantForContentExtractionFromView:intoArray:", v13, v5);
            continue;
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (!v9)
        goto LABEL_17;
    }
  }
  v10 = 0;
LABEL_17:

  return v5;
}

+ (id)_allViewControllersFromUIViews:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "_firstAvailableUIViewControllerForUIView:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)_firstAvailableUIViewControllerForUIView:(id)a3
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "nextResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v3, "nextResponder");
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v4;
    }
    while (v4);
  }
  return v3;
}

+ (void)_donateContentsOfWindow:(id)a3 usingExecutor:(id)a4 withOptions:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  objc_class *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  unint64_t v25;
  unint64_t v26;
  __CFString *v27;
  CKContextUIElement *v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  unint64_t v40;
  void *v41;
  id v42;
  void *v43;
  unint64_t v44;
  void *v45;
  unint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  char v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  unint64_t v64;
  void *v65;
  void *v66;
  unint64_t v67;
  id v68;
  unint64_t v69;
  void *v70;
  _BOOL4 v71;
  uint64_t v72;
  id v73;
  unint64_t v74;
  id v75;
  id obj;
  void *v77;
  void *v78;
  unint64_t v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint8_t buf[4];
  unint64_t v86;
  _BYTE v87[128];
  uint64_t v88;
  CGSize v89;

  v88 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v77 = v8;
  objc_msgSend(a1, "_descendantsRelevantForContentExtractionFromWindow:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "count"))
    goto LABEL_48;
  v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v69 = (unint64_t)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v68 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = a5 & 0x20;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v66 = v10;
  obj = v10;
  v74 = v11;
  v75 = a1;
  v79 = a5;
  v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
  v12 = 0;
  if (!v80)
    goto LABEL_36;
  v13 = *(_QWORD *)v82;
  v14 = 250;
  if ((a5 & 0x20) != 0)
    v14 = -1;
  v67 = v14;
  v72 = *(_QWORD *)v82;
  v73 = v9;
  do
  {
    for (i = 0; i != v80; ++i)
    {
      if (*(_QWORD *)v82 != v13)
        objc_enumerationMutation(obj);
      v16 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
      objc_msgSend(a1, "_bestVisibleStringForView:usingExecutor:", v16, v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "length");
      if (v11 | v18)
      {
        v19 = v18;
        v78 = v12;
        if (v18 && (objc_msgSend(v70, "containsObject:", v17) & 1) == 0)
          objc_msgSend(v70, "addObject:", v17);
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_getNotableSuperviewClassNamesForView:", v16);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_fontSizeOfView:usingExecutor:", v16, v9);
        v24 = v23;
        if (v19)
        {
          v25 = objc_msgSend(v17, "length");
          if (v67 >= v25)
            v26 = v25;
          else
            v26 = v67;
          objc_msgSend(v17, "substringWithRange:", 0, v26);
          v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v27 = &stru_1E6243B40;
        }
        v28 = -[CKContextUIElement initWithText:className:]([CKContextUIElement alloc], "initWithText:className:", v27, v21);
        -[CKContextUIElement setSuperviewClassNames:](v28, "setSuperviewClassNames:", v22);
        *(float *)&v29 = v24;
        -[CKContextUIElement setFontSize:](v28, "setFontSize:", v29);
        objc_msgSend(v77, "windowScene");
        a5 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)a5, "_sceneIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v30, "copy");
        -[CKContextUIElement setSceneIdentifier:](v28, "setSceneIdentifier:", v31);

        LOBYTE(a5) = v79;
        if ((v79 & 4) != 0)
        {
          v71 = +[CKContextSharedExtractionHelper elementIsOnScreenWithView:window:](CKContextSharedExtractionHelper, "elementIsOnScreenWithView:window:", v16, v77);
          objc_msgSend(v16, "bounds");
          objc_msgSend(v16, "convertRect:toView:", v77);
          v33 = v32;
          v35 = v34;
          -[CKContextUIElement setFrameInWindow:](v28, "setFrameInWindow:");
          objc_msgSend(v77, "screen");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "coordinateSpace");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(a5) = v79;
          objc_msgSend(v77, "convertPoint:toCoordinateSpace:", v37, v33, v35);
          -[CKContextUIElement setAbsoluteOriginOnScreen:](v28, "setAbsoluteOriginOnScreen:");

          -[CKContextUIElement setOnScreen:](v28, "setOnScreen:", v71);
        }
        if (-[CKContextUIElement isOnScreen](v28, "isOnScreen"))
        {
          v38 = (void *)v69;
          v9 = v73;
          a1 = v75;
          if ((a5 & 0x10) == 0)
          {
            v39 = objc_msgSend((id)v69, "count");
            v38 = (void *)v69;
            LOBYTE(a5) = v79;
            if (v39 >= 0xFA)
              goto LABEL_28;
          }
        }
        else
        {
          v38 = v68;
          v9 = v73;
          a1 = v75;
          if ((a5 & 0x10) == 0)
          {
            v40 = objc_msgSend(v68, "count");
            v38 = v68;
            LOBYTE(a5) = v79;
            if (v40 > 0xF9)
              goto LABEL_28;
          }
        }
        objc_msgSend(v38, "addObject:", v28);
LABEL_28:

        v12 = v78;
        v11 = v74;
        v13 = v72;
      }
      if ((a5 & 1) != 0 && !v12)
      {
        +[CKContextSharedExtractionHelper bestImageForView:](CKContextSharedExtractionHelper, "bestImageForView:", v16);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v41;
        if (v41)
          v42 = v41;

      }
    }
    v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
  }
  while (v80);
LABEL_36:

  if ((a5 & 0x10) != 0)
  {
    v45 = v68;
    v47 = objc_msgSend(v68, "count");
    v43 = (void *)v69;
  }
  else
  {
    v43 = (void *)v69;
    v44 = 250 - objc_msgSend((id)v69, "count");
    v45 = v68;
    v46 = objc_msgSend(v68, "count");
    if (v44 >= v46)
      v47 = v46;
    else
      v47 = v44;
  }
  objc_msgSend(v45, "subarrayWithRange:", 0, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addObjectsFromArray:", v48);

  v49 = 0;
  if ((v79 & 2) != 0)
  {
    v10 = v66;
    if (!v12)
    {
      objc_msgSend(v77, "bounds");
      v51 = v50;
      v53 = v52;
      v55 = v54;
      v57 = v56;
      v58 = objc_msgSend(v77, "isOpaque");
      v89.width = v55;
      v89.height = v57;
      UIGraphicsBeginImageContextWithOptions(v89, v58, 0.0);
      objc_msgSend(v77, "drawViewHierarchyInRect:afterScreenUpdates:", 1, v51, v53, v55, v57);
      UIGraphicsGetImageFromCurrentImageContext();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      UIGraphicsEndImageContext();
    }
  }
  else
  {
    v10 = v66;
  }
  objc_msgSend(a1, "_allViewControllersFromUIViews:", obj);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_extractItemsFromViewControllers:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "componentsJoinedByString:", CFSTR("\n\n"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "stringByTrimmingCharactersInSet:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "length");

  if (objc_msgSend(v60, "count") || objc_msgSend((id)v69, "count") | v74 || v64 > 0x2C)
  {
    v65 = (void *)v69;
    objc_msgSend(v75, "_donateText:withTitle:debugText:debugUrlString:rawHTML:leadImage:snapshot:uiElements:extractionItems:usingContextFromExecutor:", v61, 0, 0, 0, 0, v12, v49, v69 & ((uint64_t)(v79 << 60) >> 63), v60, v9);
  }
  else
  {
    v65 = (void *)v69;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v86 = v64;
      _os_log_impl(&dword_1B0D39000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "The extracted text (length %lu) is too short. Donation from UIKit hierarchy aborted.", buf, 0xCu);
    }
  }

LABEL_48:
}

+ (id)_getNotableSuperviewClassNamesForView:(id)a3
{
  id v3;
  id v4;
  void *v5;
  int v6;
  objc_class *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 20;
  while (1)
  {
    if (!v5)
    {
      v9 = 0;
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend((id)kNotNotableSuperviewClassNames, "containsObject:", v8) & 1) == 0)
      break;
LABEL_6:

    v5 = v9;
    if (!--v6)
      goto LABEL_10;
  }
  if ((unint64_t)objc_msgSend(v4, "count") <= 5)
  {
    objc_msgSend(v4, "addObject:", v8);
    goto LABEL_6;
  }

LABEL_10:
  return v4;
}

+ (void)_donateText:(id)a3 withTitle:(id)a4 debugText:(id)a5 debugUrlString:(id)a6 rawHTML:(id)a7 leadImage:(id)a8 snapshot:(id)a9 uiElements:(id)a10 extractionItems:(id)a11 usingContextFromExecutor:(id)a12
{
  objc_class *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;

  v18 = (objc_class *)MEMORY[0x1E0D14378];
  v29 = a12;
  v19 = a11;
  v20 = a10;
  v21 = a9;
  v22 = a8;
  v23 = a7;
  v24 = a6;
  v25 = a5;
  v26 = a4;
  v27 = a3;
  v30 = objc_alloc_init(v18);
  objc_msgSend(v30, "setText:", v27);

  objc_msgSend(v30, "setTitle:", v26);
  objc_msgSend(v30, "setDebugText:", v25);

  objc_msgSend(v30, "setDebugUrlString:", v24);
  objc_msgSend(v30, "setUiElements:", v20);

  objc_msgSend(v30, "setExtractionItems:", v19);
  objc_msgSend(v30, "setRawHTML:", v23);

  +[CKContextExtractionUtil renderSnapshot:toDonationItem:](CKContextExtractionUtil, "renderSnapshot:toDonationItem:", v21, v30);
  +[CKContextExtractionUtil renderLeadImage:toDonationItem:](CKContextExtractionUtil, "renderLeadImage:toDonationItem:", v22, v30);

  objc_msgSend(v29, "context");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "addItem:", v30);
}

+ (BOOL)_isSensitiveTextContentType:(id)a3
{
  return objc_msgSend((id)kSensitiveContentTypes, "containsObject:", a3);
}

+ (double)_fontSizeOfView:(id)a3 usingExecutor:(id)a4
{
  id v4;
  double v5;
  void *v6;
  double v7;

  v4 = a3;
  objc_opt_class();
  v5 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "performSelector:", sel_font);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "pointSize");
      v5 = v7;
    }

  }
  return v5;
}

+ (id)_bestVisibleStringForView:(id)a3 usingExecutor:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  objc_class *v22;
  Ivar InstanceVariable;
  objc_ivar *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[16];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[CKContextUIClasses isSFSafariView:](CKContextUIClasses, "isSFSafariView:", v6))
  {
    objc_msgSend(v7, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRemoteProcesses:", objc_msgSend(v10, "remoteProcesses") + 1);

  }
  if (+[CKContextUIClasses isWKWebView:](CKContextUIClasses, "isWKWebView:", v6))
  {
    objc_msgSend(a1, "_handleWKWebView:withExecutor:", v6, v7);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v12 = (id)v11;
    goto LABEL_11;
  }
  if (+[CKContextUIClasses isPDFView:](CKContextUIClasses, "isPDFView:", v6))
  {
    objc_msgSend(a1, "handlePDFView:withExecutor:", v6, v7);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (objc_msgSend(a1, "controlCodeForExecutor:", v7) == 1
    || +[CKContextContentProviderManager isSafariContentProvider](CKContextContentProviderManager, "isSafariContentProvider"))
  {
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "textContentType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(a1, "_isSensitiveTextContentType:", v14) & 1) != 0)
    {

      goto LABEL_10;
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v6, "isSecureTextEntry") & 1) != 0)
    goto LABEL_10;
  v15 = 0;
  if (!objc_msgSend(0, "length"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "attributedText");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v16, "string");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
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
  }
  if (!objc_msgSend(v15, "length") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "performSelector:", sel_text);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v17;

      v15 = v18;
    }

  }
  if (!objc_msgSend(v15, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bundleIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.mobilecal")) & 1) != 0)
    {
      v21 = objc_msgSend(v9, "isEqualToString:", CFSTR("EKEventDetailAttendeesListView"));

      if (v21)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B0D39000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Performing special handling for Calendar", buf, 2u);
        }
        v22 = (objc_class *)objc_opt_class();
        InstanceVariable = class_getInstanceVariable(v22, "_inviteeNames");
        if (InstanceVariable)
        {
          v24 = InstanceVariable;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            +[CKContextContentProviderUIScene _bestVisibleStringForView:usingExecutor:].cold.1();
          object_getIvar(v6, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v26 = v25;
            if (objc_msgSend(v26, "count"))
            {
              v50 = v9;
              v51 = v26;
              v52 = v25;
              v53 = v15;
              objc_msgSend(v26, "firstObject");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = 0u;
              v56 = 0u;
              v57 = 0u;
              v58 = 0u;
              v28 = v27;
              v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
              if (v29)
              {
                v30 = v29;
                v31 = *(_QWORD *)v56;
                do
                {
                  v32 = 0;
                  do
                  {
                    if (*(_QWORD *)v56 != v31)
                      objc_enumerationMutation(v28);
                    v33 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v32);
                    if ((objc_opt_respondsToSelector() & 1) != 0)
                    {
                      objc_msgSend(v33, "performSelector:", sel_displayString);
                      v34 = (void *)objc_claimAutoreleasedReturnValue();
                      if ((objc_opt_respondsToSelector() & 1) != 0)
                      {
                        objc_msgSend(v34, "performSelector:", sel_string);
                        v35 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v54, "addObject:", v35);

                      }
                    }
                    ++v32;
                  }
                  while (v30 != v32);
                  v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
                }
                while (v30);
              }

              v36 = objc_alloc_init(MEMORY[0x1E0CB3738]);
              objc_msgSend(v36, "stringFromItems:", v54);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              v26 = v51;
              v25 = v52;
              v9 = v50;
            }

          }
        }
      }
    }
    else
    {

    }
  }
  if (!objc_msgSend(v15, "length") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "performSelector:", sel_accessibilityLabel);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)objc_msgSend(v37, "length") >= 0x14)
    {
      v38 = v37;

      v15 = v38;
    }

  }
  if (!objc_msgSend(v15, "length") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "performSelector:", sel_component);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v39, "performSelector:", sel_text);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v41 = v40;

        v15 = v41;
      }

    }
  }
  if (!objc_msgSend(v15, "length") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "performSelector:", sel_delegate);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v42, "performSelector:", sel_text);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v44 = v43;

        v15 = v44;
      }

    }
  }
  if (!objc_msgSend(v15, "length") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "performSelector:", sel_dataDetectorElement);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v45, "performSelector:", sel_scannerResult);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v46, "performSelector:", sel_value);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v48 = v47;

          v15 = v48;
        }

      }
    }

  }
  if (objc_msgSend(v15, "length"))
    v49 = v15;
  else
    v49 = 0;
  v12 = v49;

LABEL_11:
  return v12;
}

+ (id)_extractItemsFromViewControllers:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_class *v10;
  void *v11;
  CKContextExtractionItem *v12;
  CKContextExtractionItem *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  CKContextExtractionItem *v34;
  uint64_t v35;
  id v37;
  uint64_t v38;
  id v39;
  void *v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v6)
  {
    v7 = v6;
    v41 = *(_QWORD *)v43;
    v37 = v5;
    do
    {
      v8 = 0;
      v38 = v7;
      do
      {
        if (*(_QWORD *)v43 != v41)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v8);
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "hasPrefix:", CFSTR("HUDashboardViewController")) & 1) != 0
          || objc_msgSend(v11, "hasPrefix:", CFSTR("HOHomeViewController")))
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v9, "performSelector:", sel_context);
            v12 = (CKContextExtractionItem *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              -[CKContextExtractionItem performSelector:](v12, "performSelector:", sel_room);
              v13 = (CKContextExtractionItem *)objc_claimAutoreleasedReturnValue();
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                -[CKContextExtractionItem performSelector:](v13, "performSelector:", sel_name);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v15 = v14;
                else
                  v15 = 0;
                v16 = v15;

              }
              else
              {
                v16 = 0;
              }
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                -[CKContextExtractionItem performSelector:](v13, "performSelector:", sel_uniqueIdentifier);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v21 = v20;
                else
                  v21 = 0;
                v19 = v21;

                if (v19 && v16)
                {
                  v13 = -[CKContextExtractionItem initWithTitle:type:bundleIdentifier:]([CKContextExtractionItem alloc], "initWithTitle:type:bundleIdentifier:", v16, 0, v40);
                  objc_msgSend(v19, "UUIDString");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  -[CKContextExtractionItem setIdentifier:](v13, "setIdentifier:", v22);

                  -[CKContextExtractionItem setExtractionSourceClassName:](v13, "setExtractionSourceClassName:", v11);
                  -[CKContextExtractionItem setOnScreen:](v13, "setOnScreen:", 1);
                  objc_msgSend(v39, "addObject:", v13);
                  v19 = v20;
                  goto LABEL_26;
                }
              }
              else
              {
                v19 = 0;
LABEL_26:

              }
            }
            else
            {
              v19 = 0;
              v16 = 0;
            }
            if ((objc_opt_respondsToSelector() & 1) == 0)
            {
              v17 = 0;
              v18 = 0;
              goto LABEL_44;
            }
            -[CKContextExtractionItem performSelector:](v12, "performSelector:", sel_home);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v23, "performSelector:", sel_name);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v25 = v24;
              else
                v25 = 0;
              v18 = v25;

            }
            else
            {
              v18 = 0;
            }
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v23, "performSelector:", sel_uniqueIdentifier);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v27 = v26;
              else
                v27 = 0;
              v17 = v27;

              v5 = v37;
            }
            else
            {
              v17 = 0;
            }

            if (v17)
            {
              v7 = v38;
              if (v18)
              {
                v12 = -[CKContextExtractionItem initWithTitle:type:bundleIdentifier:]([CKContextExtractionItem alloc], "initWithTitle:type:bundleIdentifier:", v18, 2, v40);
                objc_msgSend(v17, "UUIDString");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                -[CKContextExtractionItem setIdentifier:](v12, "setIdentifier:", v28);

                v5 = v37;
                -[CKContextExtractionItem setExtractionSourceClassName:](v12, "setExtractionSourceClassName:", v11);
                -[CKContextExtractionItem setOnScreen:](v12, "setOnScreen:", 1);
                objc_msgSend(v39, "addObject:", v12);
LABEL_44:

              }
            }
            else
            {
              v7 = v38;
            }
          }
          else
          {
            v17 = 0;
            v18 = 0;
            v19 = 0;
            v16 = 0;
          }

        }
        if (objc_msgSend(v11, "hasPrefix:", CFSTR("HomeUI.DashboardAccessoryControlViewController")))
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v9, "performSelector:", sel_description);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "componentsSeparatedByString:", CFSTR(" uniqueIdentifier: "));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v30, "count") == 2)
            {
              objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = 0;
              v33 = 0;
              if (objc_msgSend(v31, "hasPrefix:", CFSTR("accessoryName: ")))
              {
                objc_msgSend(v31, "substringFromIndex:", objc_msgSend(CFSTR("accessoryName: "), "length"));
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "objectAtIndexedSubscript:", 1);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
              }

            }
            else
            {
              v32 = 0;
              v33 = 0;
            }

            if (v32 && v33)
            {
              v34 = -[CKContextExtractionItem initWithTitle:type:bundleIdentifier:]([CKContextExtractionItem alloc], "initWithTitle:type:bundleIdentifier:", v33, 1, v40);
              -[CKContextExtractionItem setIdentifier:](v34, "setIdentifier:", v32);
              -[CKContextExtractionItem setExtractionSourceClassName:](v34, "setExtractionSourceClassName:", v11);
              -[CKContextExtractionItem setOnScreen:](v34, "setOnScreen:", 1);
              objc_msgSend(v39, "addObject:", v34);

            }
          }
          else
          {
            v33 = 0;
            v32 = 0;
          }

        }
        ++v8;
      }
      while (v7 != v8);
      v35 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      v7 = v35;
    }
    while (v35);
  }

  return v39;
}

+ (id)_UIElementsForWebViewContentString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  BOOL v18;
  float v19;
  CKContextUIElement *v20;
  double v21;
  void *v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    +[CKContextSharedExtractionHelper blocksFromText:](CKContextSharedExtractionHelper, "blocksFromText:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v4, "count"))
    {
      v23 = v4;
      v24 = v3;
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v5 = v4;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v27 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            if (!+[CKContextSharedExtractionHelper textBlockLooksLikeAListWithText:](CKContextSharedExtractionHelper, "textBlockLooksLikeAListWithText:", v10))
            {
              objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "componentsSeparatedByCharactersInSet:", v11);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("@distinctUnionOfObjects.%@"), CFSTR("self"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "valueForKeyPath:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v14, "count");
              v17 = objc_msgSend(v15, "length");
              if (v17)
                v18 = v16 == 0;
              else
                v18 = 1;
              if (!v18)
              {
                v19 = (float)v17 / (float)v16;
                v20 = -[CKContextUIElement initWithText:className:]([CKContextUIElement alloc], "initWithText:className:", v15, CFSTR("WKWebView"));
                *(float *)&v21 = v19;
                -[CKContextUIElement setDensity:](v20, "setDensity:", v21);
                objc_msgSend(v25, "addObject:", v20);

              }
            }
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v7);
      }

      v4 = v23;
      v3 = v24;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

+ (id)_bestContentStringForWebViewUIElements:(id)a3 andTitle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  float v14;
  void *v15;
  __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v13, "density");
          if (v14 > 43.0)
          {
            objc_msgSend(v13, "text");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v15);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

    objc_msgSend(v7, "componentsJoinedByString:", CFSTR("\n\n"));
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      v17 = &stru_1E6243B40;
      if (v16)
        v17 = v16;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v6, CFSTR("\n\n"), v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v16 = (__CFString *)v18;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)_handleWKWebView:(id)a3 withExecutor:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  const __CFString *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  BOOL v18;
  BOOL v19;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(a1, "controlCodeForExecutor:", v7);
  v9 = +[CKContextContentProviderManager optionsForControlCode:](CKContextContentProviderManager, "optionsForControlCode:", v8);
  if ((_DWORD)v8 != 2 && (_DWORD)v8 != 4 && objc_msgSend(v6, "isLoading"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[CKContextContentProviderUIScene _handleWKWebView:withExecutor:].cold.1();
LABEL_10:
    v13 = &stru_1E6243B40;
    goto LABEL_11;
  }
  objc_msgSend(v6, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "websiteDataStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isPersistent");

  if ((v12 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0D39000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "The webview data store is not persistent. We cannot extract from it for privacy reasons without user gesture.", buf, 2u);
    }
    goto LABEL_10;
  }
  objc_msgSend(v7, "markIncomplete");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__CKContextContentProviderUIScene__handleWKWebView_withExecutor___block_invoke;
  v15[3] = &unk_1E62434C0;
  v17 = a1;
  v16 = v6;
  v18 = (v9 & 0x10) != 0;
  v19 = (v9 & 0x20) != 0;
  objc_msgSend(v7, "addWorkItem:", v15);

  v13 = 0;
LABEL_11:

  return (id)v13;
}

void __65__CKContextContentProviderUIScene__handleWKWebView_withExecutor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  char v25;
  char v26;
  char v27;
  char v28;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 40), "controlCodeForExecutor:", v3);
  v5 = v4;
  v6 = +[CKContextContentProviderManager optionsForControlCode:](CKContextContentProviderManager, "optionsForControlCode:", v4);
  v7 = (v6 >> 1) & 1;
  v8 = (v6 >> 2) & 1;
  v9 = (v6 >> 3) & 1;
  v10 = MEMORY[0x1E0C809B0];
  v11 = (v6 >> 6) & 1;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __65__CKContextContentProviderUIScene__handleWKWebView_withExecutor___block_invoke_2;
  v22[3] = &unk_1E6243470;
  v12 = *(id *)(a1 + 32);
  v25 = *(_BYTE *)(a1 + 48);
  v26 = v5;
  v27 = v8;
  v28 = v9;
  v23 = v12;
  v24 = v3;
  v13 = v3;
  v14 = (void *)MEMORY[0x1B5E103A4](v22);
  v16 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(a1 + 40);
  v17 = *(unsigned __int8 *)(a1 + 49);
  v18 = *(unsigned __int8 *)(a1 + 48);
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __65__CKContextContentProviderUIScene__handleWKWebView_withExecutor___block_invoke_3;
  v20[3] = &unk_1E6243498;
  v21 = v14;
  v19 = v14;
  objc_msgSend(v15, "_extractContentFromWebView:includingSnapshot:includingUIBoundingBox:ignoreViewTextLengthRequirements:ignoreViewCountCap:includeRawHTML:withCompletionHandler:", v16, v7, v8, v17, v18, v11, v20);

}

void __65__CKContextContentProviderUIScene__handleWKWebView_withExecutor___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  unsigned int v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;

  v31 = a2;
  v30 = a3;
  v28 = a4;
  v9 = a5;
  +[CKContextContentProviderUIScene _UIElementsForWebViewContentString:](CKContextContentProviderUIScene, "_UIElementsForWebViewContentString:", v31);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKContextContentProviderUIScene _bestContentStringForWebViewUIElements:andTitle:](CKContextContentProviderUIScene, "_bestContentStringForWebViewUIElements:andTitle:", v10, v11);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 48))
  {
    v12 = v10;
  }
  else
  {
    v13 = objc_msgSend(v10, "count");
    if (v13 >= 0xFA)
      v14 = 250;
    else
      v14 = v13;
    objc_msgSend(v10, "subarrayWithRange:", 0, v14);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v12;
  if (*(_BYTE *)(a1 + 48))
  {
    v16 = v9;
  }
  else
  {
    v17 = objc_msgSend(v9, "count");
    if (v17 >= 0xFA)
      v18 = 250;
    else
      v18 = v17;
    objc_msgSend(v9, "subarrayWithRange:", 0, v18);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v16;
  v20 = (*(unsigned __int8 *)(a1 + 49) < 6u) & (0x2Cu >> *(_BYTE *)(a1 + 49));
  if (*(_BYTE *)(a1 + 50))
    v21 = v16;
  else
    v21 = v15;
  v22 = v21;
  objc_msgSend(*(id *)(a1 + 32), "title");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v15;
  if (v20 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "absoluteString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v31;
  }
  else
  {
    v25 = 0;
    v24 = 0;
  }
  if (*(_BYTE *)(a1 + 51))
    v26 = v22;
  else
    v26 = 0;
  +[CKContextContentProviderUIScene _donateText:withTitle:debugText:debugUrlString:rawHTML:leadImage:snapshot:uiElements:extractionItems:usingContextFromExecutor:](CKContextContentProviderUIScene, "_donateText:withTitle:debugText:debugUrlString:rawHTML:leadImage:snapshot:uiElements:extractionItems:usingContextFromExecutor:", v27, v23, v25, v24, v30, 0, v28, v26, 0, *(_QWORD *)(a1 + 40));
  if (v20)
  {

  }
  objc_msgSend(*(id *)(a1 + 40), "markReady");

}

uint64_t __65__CKContextContentProviderUIScene__handleWKWebView_withExecutor___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)_extractContentFromWebView:(id)a3 includingSnapshot:(BOOL)a4 includingUIBoundingBox:(BOOL)a5 ignoreViewTextLengthRequirements:(BOOL)a6 ignoreViewCountCap:(BOOL)a7 includeRawHTML:(BOOL)a8 withCompletionHandler:(id)a9
{
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  objc_class *v47;
  id v48;
  uint8_t v49;
  _QWORD block[4];
  id v51;
  _QWORD *v52;
  uint64_t *v53;
  _QWORD *v54;
  _QWORD *v55;
  _QWORD v56[4];
  NSObject *v57;
  uint64_t *v58;
  _QWORD v59[4];
  NSObject *v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  _QWORD v68[4];
  NSObject *v69;
  id v70;
  id v71;
  _QWORD *v72;
  _QWORD v73[4];
  NSObject *v74;
  id v75;
  _QWORD *v76;
  uint64_t v77;
  BOOL v78;
  _QWORD v79[5];
  id v80;
  _QWORD v81[5];
  id v82;
  _QWORD v83[5];
  void *v84;
  _QWORD v85[4];
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t v95;

  v9 = a8;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v14 = a3;
  v15 = a9;
  if (v15)
  {
    objc_msgSend(v14, "window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "_isDisplayingPDF"))
    {
      objc_msgSend(v14, "_dataForDisplayedPDF");
      v17 = objc_claimAutoreleasedReturnValue();
      v85[0] = MEMORY[0x1E0C809B0];
      v85[1] = 3221225472;
      v85[2] = __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke;
      v85[3] = &unk_1E62434E8;
      v86 = v15;
      objc_msgSend(a1, "extractContentFromWebViewPDFData:withCompletionHandler:", v17, v85);
      v18 = v86;
    }
    else
    {
      v19 = dispatch_group_create();
      v83[0] = 0;
      v83[1] = v83;
      v83[2] = 0x3032000000;
      v83[3] = __Block_byref_object_copy_;
      v83[4] = __Block_byref_object_dispose_;
      v84 = 0;
      v81[0] = 0;
      v81[1] = v81;
      v81[2] = 0x3032000000;
      v81[3] = __Block_byref_object_copy_;
      v81[4] = __Block_byref_object_dispose_;
      v82 = 0;
      v79[0] = 0;
      v79[1] = v79;
      v79[2] = 0x3032000000;
      v79[3] = __Block_byref_object_copy_;
      v79[4] = __Block_byref_object_dispose_;
      v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (v10)
        v21 = -1;
      else
        v21 = 10000;
      v80 = v20;
      dispatch_group_enter(v19);
      v73[0] = MEMORY[0x1E0C809B0];
      v73[1] = 3221225472;
      v73[2] = __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_138;
      v73[3] = &unk_1E6243538;
      v78 = v10;
      v76 = v83;
      v77 = v21;
      v17 = v19;
      v74 = v17;
      v22 = v14;
      v75 = v22;
      objc_msgSend(v22, "_getContentsAsStringWithCompletionHandler:", v73);
      v87 = 0;
      v88 = (uint64_t)&v87;
      v89 = 0x2050000000;
      v23 = (void *)getWKContentWorldClass_softClass;
      v90 = (void *)getWKContentWorldClass_softClass;
      v24 = MEMORY[0x1E0C809B0];
      if (!getWKContentWorldClass_softClass)
      {
        v62 = MEMORY[0x1E0C809B0];
        v63 = 3221225472;
        v64 = (uint64_t)__getWKContentWorldClass_block_invoke;
        v65 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6243378;
        v66 = (void (*)(uint64_t))&v87;
        __getWKContentWorldClass_block_invoke((uint64_t)&v62);
        v23 = *(void **)(v88 + 24);
      }
      v25 = objc_retainAutorelease(v23);
      _Block_object_dispose(&v87, 8);
      objc_msgSend(v25, "worldWithName:", CFSTR("CKContextExtractionContentWorld"));
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v26;
      if (v11 && v26)
      {
        dispatch_group_enter(v17);
        +[CKContextSharedExtractionHelper webPageNodeExtractionJavaScript](CKContextSharedExtractionHelper, "webPageNodeExtractionJavaScript");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v68[0] = v24;
        v68[1] = 3221225472;
        v68[2] = __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_2;
        v68[3] = &unk_1E6243560;
        v69 = v17;
        v29 = v22;
        v70 = v29;
        v71 = v16;
        v72 = v79;
        v30 = v29;
        v24 = MEMORY[0x1E0C809B0];
        objc_msgSend(v30, "evaluateJavaScript:inFrame:inContentWorld:completionHandler:", v28, 0, v27, v68);

      }
      v62 = 0;
      v63 = (uint64_t)&v62;
      v64 = 0x3032000000;
      v65 = __Block_byref_object_copy_;
      v66 = __Block_byref_object_dispose_;
      v67 = 0;
      if (v12)
      {
        dispatch_group_enter(v17);
        objc_msgSend(v16, "bounds");
        objc_msgSend(v16, "convertRect:toView:", v22);
        v39 = v38;
        v41 = v40;
        v43 = v42;
        v45 = v44;
        v92 = 0;
        v93 = &v92;
        v94 = 0x2050000000;
        v46 = (void *)getWKSnapshotConfigurationClass_softClass;
        v95 = getWKSnapshotConfigurationClass_softClass;
        if (!getWKSnapshotConfigurationClass_softClass)
        {
          v87 = v24;
          v88 = 3221225472;
          v89 = (uint64_t)__getWKSnapshotConfigurationClass_block_invoke;
          v90 = &unk_1E6243378;
          v91 = &v92;
          __getWKSnapshotConfigurationClass_block_invoke((uint64_t)&v87, v31, v32, v33, v34, v35, v36, v37, v49);
          v46 = (void *)v93[3];
        }
        v47 = objc_retainAutorelease(v46);
        _Block_object_dispose(&v92, 8);
        v48 = objc_alloc_init(v47);
        objc_msgSend(v48, "setRect:", v39, v41, v43, v45);
        v59[0] = v24;
        v59[1] = 3221225472;
        v59[2] = __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_145;
        v59[3] = &unk_1E6243588;
        v60 = v17;
        v61 = v81;
        objc_msgSend(v22, "takeSnapshotWithConfiguration:completionHandler:", v48, v59);

      }
      if (v9)
      {
        dispatch_group_enter(v17);
        v56[0] = v24;
        v56[1] = 3221225472;
        v56[2] = __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_2_149;
        v56[3] = &unk_1E62435B0;
        v57 = v17;
        v58 = &v62;
        objc_msgSend(v22, "evaluateJavaScript:completionHandler:", CFSTR("document.documentElement.outerHTML.toString()"), v56);

      }
      block[0] = v24;
      block[1] = 3221225472;
      block[2] = __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_3;
      block[3] = &unk_1E62435D8;
      v51 = v15;
      v52 = v83;
      v53 = &v62;
      v54 = v81;
      v55 = v79;
      dispatch_group_notify(v17, MEMORY[0x1E0C80D38], block);

      _Block_object_dispose(&v62, 8);
      _Block_object_dispose(v79, 8);

      _Block_object_dispose(v81, 8);
      _Block_object_dispose(v83, 8);
      v18 = v84;
    }

  }
}

uint64_t __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_138(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (*(_BYTE *)(a1 + 64) || (unint64_t)objc_msgSend(v5, "length") < 0x96)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0D39000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Failed to extract enough text from main webpage frame. Trying to get content from all frames", buf, 2u);
    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_139;
    v15[3] = &unk_1E6243510;
    v13 = *(_QWORD *)(a1 + 56);
    v17 = *(_QWORD *)(a1 + 48);
    v18 = v13;
    v14 = *(void **)(a1 + 40);
    v16 = *(id *)(a1 + 32);
    objc_msgSend(v14, "_getContentsOfAllFramesAsStringWithCompletionHandler:", v15);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 56);
    v8 = objc_msgSend(v5, "length");
    if (v7 >= v8)
      v9 = v8;
    else
      v9 = v7;
    objc_msgSend(v5, "substringWithRange:", 0, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_139(uint64_t a1, void *a2)
{
  unint64_t v3;
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = *(_QWORD *)(a1 + 48);
  v4 = a2;
  v5 = objc_msgSend(v4, "length");
  if (v3 >= v5)
    v6 = v5;
  else
    v6 = v3;
  objc_msgSend(v4, "substringWithRange:", 0, v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  CKContextUIElement *v43;
  unint64_t v44;
  uint64_t v45;
  void *v46;
  CKContextUIElement *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  _BOOL8 v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  id obj;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  id v95;
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_2_cold_2((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    objc_msgSend(v5, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
    {
      objc_msgSend(v14, "dataUsingEncoding:", 4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v15, 0, &v95);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v95;
      if (v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v70 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v70)
          __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_2_cold_1(v70, v71, v72, v73, v74, v75, v76, v77);
        dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
      }
      else
      {
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("nodes"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v79 = v16;
            v80 = v15;
            v81 = v14;
            v82 = v5;
            v91 = 0u;
            v92 = 0u;
            v93 = 0u;
            v94 = 0u;
            obj = v18;
            v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v96, 16);
            v78 = v18;
            if (v19)
            {
              v20 = v19;
              v21 = 0x1E0C99000uLL;
              v22 = *(_QWORD *)v92;
              v83 = *(_QWORD *)v92;
              do
              {
                v23 = 0;
                v84 = v20;
                do
                {
                  if (*(_QWORD *)v92 != v22)
                    objc_enumerationMutation(obj);
                  v24 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v23);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("text"));
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(*(id *)(v21 + 3640), "null");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v25, "isEqual:", v26) & 1) != 0)
                    {
                      v27 = 0;
                    }
                    else
                    {
                      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("text"));
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                    }

                    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("className"));
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(*(id *)(v21 + 3640), "null");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v28, "isEqual:", v29) & 1) != 0)
                    {
                      v86 = 0;
                    }
                    else
                    {
                      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("className"));
                      v86 = (void *)objc_claimAutoreleasedReturnValue();
                    }

                    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("left"));
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(*(id *)(v21 + 3640), "null");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v30, "isEqual:", v31) & 1) != 0)
                    {
                      v90 = 0;
                    }
                    else
                    {
                      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("left"));
                      v90 = (void *)objc_claimAutoreleasedReturnValue();
                    }

                    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("right"));
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(*(id *)(v21 + 3640), "null");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v32, "isEqual:", v33) & 1) != 0)
                    {
                      v89 = 0;
                    }
                    else
                    {
                      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("right"));
                      v89 = (void *)objc_claimAutoreleasedReturnValue();
                    }

                    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("top"));
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    v35 = v21;
                    objc_msgSend(*(id *)(v21 + 3640), "null");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v34, "isEqual:", v36) & 1) != 0)
                    {
                      v88 = 0;
                    }
                    else
                    {
                      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("top"));
                      v88 = (void *)objc_claimAutoreleasedReturnValue();
                    }

                    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("bottom"));
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(*(id *)(v35 + 3640), "null");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    v87 = v27;
                    if ((objc_msgSend(v37, "isEqual:", v38) & 1) != 0)
                    {
                      v39 = 0;
                    }
                    else
                    {
                      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("bottom"));
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                    }

                    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("onScreen"));
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(*(id *)(v35 + 3640), "null");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v40, "isEqual:", v41) & 1) != 0)
                    {
                      v42 = 0;
                    }
                    else
                    {
                      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("onScreen"));
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                    }

                    if (objc_msgSend(v27, "length"))
                    {
                      v43 = [CKContextUIElement alloc];
                      v44 = objc_msgSend(v27, "length");
                      if (v44 >= 0xFA)
                        v45 = 250;
                      else
                        v45 = v44;
                      objc_msgSend(v27, "substringWithRange:", 0, v45);
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      v47 = -[CKContextUIElement initWithText:className:](v43, "initWithText:className:", v46, v86);

                      -[CKContextUIElement setOnScreen:](v47, "setOnScreen:", objc_msgSend(v42, "BOOLValue"));
                      objc_msgSend(*(id *)(a1 + 40), "window");
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v48, "windowScene");
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v49, "_sceneIdentifier");
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      v51 = a1;
                      v52 = (void *)objc_msgSend(v50, "copy");
                      -[CKContextUIElement setSceneIdentifier:](v47, "setSceneIdentifier:", v52);

                      a1 = v51;
                      if (v90 && v89 && v88 && v39)
                      {
                        v53 = *(void **)(v51 + 40);
                        objc_msgSend(v90, "doubleValue");
                        v55 = v54;
                        objc_msgSend(v88, "doubleValue");
                        objc_msgSend(v53, "_convertPointFromContentsToView:", v55, v56);
                        v58 = v57;
                        v60 = v59;
                        v61 = *(void **)(v51 + 40);
                        objc_msgSend(v89, "doubleValue");
                        v63 = v62;
                        objc_msgSend(v39, "doubleValue");
                        objc_msgSend(v61, "_convertPointFromContentsToView:", v63, v64);
                        objc_msgSend(*(id *)(v51 + 40), "convertRect:toView:", 0, v58, v60, v65 - v58, v66 - v60);
                        objc_msgSend(*(id *)(v51 + 48), "convertRect:toView:", 0);
                        -[CKContextUIElement setFrameInWindow:](v47, "setFrameInWindow:");
                        objc_msgSend(*(id *)(v51 + 48), "screen");
                        v67 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v67, "coordinateSpace");
                        v68 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v68)
                        {
                          v69 = *(void **)(v51 + 48);
                          -[CKContextUIElement frameInWindow](v47, "frameInWindow");
                          objc_msgSend(v69, "convertPoint:toCoordinateSpace:", v68);
                          -[CKContextUIElement setAbsoluteOriginOnScreen:](v47, "setAbsoluteOriginOnScreen:");
                        }

                      }
                      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v51 + 56) + 8) + 40), "addObject:", v47);

                      v27 = v87;
                    }

                    v21 = v35;
                    v22 = v83;
                    v20 = v84;
                  }
                  ++v23;
                }
                while (v20 != v23);
                v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v96, 16);
              }
              while (v20);
            }

            v6 = 0;
            v5 = v82;
            v18 = v78;
            v17 = 0;
            v15 = v80;
            v14 = v81;
            v16 = v79;
          }
        }
        dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

      }
    }
    else
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }

  }
}

void __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_145(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;

  v6 = a2;
  if (v6 && !a3)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_2_149(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id obj;

  objc_msgSend(a2, "description");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "length");
  if (!a3 && v5)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40));
}

- (BOOL)_determineIfDebuggingControlsShouldBeAllowed
{
  void *v2;
  char v3;

  if (!+[CKContextContentProviderManager isSpringBoard](CKContextContentProviderManager, "isSpringBoard")
    || !os_variant_has_internal_content())
  {
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("CKContextAllowAppSwitcherDebuggingControls"));

  return v3;
}

- (BOOL)_shouldInstallAppSwitcherControls
{
  void *v3;
  BOOL v4;
  void *v5;

  if (!self->_allowAppSwitcherControls)
    return 0;
  -[UIButton superview](self->_debugButton, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 0;
  -[UIButton superview](self->_recentsButton, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5 == 0;

  return v4;
}

- (void)_installDebuggingControlsIfApplicable
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4;
  id location;

  if (self->_allowAppSwitcherControls)
  {
    objc_initWeak(&location, self);
    v2 = dispatch_time(0, 2000000000);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __72__CKContextContentProviderUIScene__installDebuggingControlsIfApplicable__block_invoke;
    v3[3] = &unk_1E6243600;
    objc_copyWeak(&v4, &location);
    dispatch_after(v2, MEMORY[0x1E0C80D38], v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __72__CKContextContentProviderUIScene__installDebuggingControlsIfApplicable__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  int v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "_shouldInstallAppSwitcherControls");
    v2 = v4;
    if (v3)
    {
      objc_msgSend(v4, "_installDebuggingButton");
      objc_msgSend(v4, "_installRecentsButton");
      objc_msgSend(v4, "_installDebuggingControlsIfApplicable");
      v2 = v4;
    }
  }

}

- (void)_setUpDebuggingControlsIfPossibleAfterDelay:(double)a3
{
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0C99E88];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__CKContextContentProviderUIScene__setUpDebuggingControlsIfPossibleAfterDelay___block_invoke;
  v7[3] = &unk_1E6243628;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v5, "scheduledTimerWithTimeInterval:repeats:block:", 0, v7, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_toolInstallationTimer, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __79__CKContextContentProviderUIScene__setUpDebuggingControlsIfPossibleAfterDelay___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  int v3;
  _BYTE *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "_determineIfDebuggingControlsShouldBeAllowed");
    v2 = v4;
    v4[24] = v3;
    if (v3)
    {
      objc_msgSend(v4, "_installDebuggingControlsIfApplicable");
      v2 = v4;
    }
  }

}

- (void)_installRecentsButton
{
  void *v3;
  UIButton *v4;
  UIButton *recentsButton;
  void *v6;
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
  void *v18;
  void *v19;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  if (self->_allowAppSwitcherControls)
  {
    -[CKContextContentProviderUIScene _containerViewForDebugButtons](self, "_containerViewForDebugButtons");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("clock.fill"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA3A0], "systemButtonWithImage:target:action:", v19, self, sel__didSelectRecentsControl_);
      v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
      recentsButton = self->_recentsButton;
      self->_recentsButton = v4;

      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTintColor:](self->_recentsButton, "setTintColor:", v6);

      -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_recentsButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v3, "addSubview:", self->_recentsButton);
      v16 = (void *)MEMORY[0x1E0CB3718];
      -[UIButton topAnchor](self->_recentsButton, "topAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "topAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:", v17);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v7;
      -[UIButton leadingAnchor](self->_recentsButton, "leadingAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "leadingAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "constraintEqualToAnchor:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = v10;
      -[UIButton widthAnchor](self->_recentsButton, "widthAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToConstant:", 70.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2] = v12;
      -[UIButton heightAnchor](self->_recentsButton, "heightAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToConstant:", 70.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20[3] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "activateConstraints:", v15);

    }
  }
}

- (void)_installDebuggingButton
{
  void *v3;
  UIButton *v4;
  UIButton *debugButton;
  void *v6;
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
  void *v18;
  void *v19;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  if (self->_allowAppSwitcherControls)
  {
    -[CKContextContentProviderUIScene _containerViewForDebugButtons](self, "_containerViewForDebugButtons");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("square.and.arrow.up.fill"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA3A0], "systemButtonWithImage:target:action:", v19, self, sel__didSelectDebugControl_);
      v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
      debugButton = self->_debugButton;
      self->_debugButton = v4;

      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTintColor:](self->_debugButton, "setTintColor:", v6);

      -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_debugButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v3, "addSubview:", self->_debugButton);
      v16 = (void *)MEMORY[0x1E0CB3718];
      -[UIButton topAnchor](self->_debugButton, "topAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "topAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:", v17);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v7;
      -[UIButton trailingAnchor](self->_debugButton, "trailingAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "trailingAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "constraintEqualToAnchor:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = v10;
      -[UIButton widthAnchor](self->_debugButton, "widthAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToConstant:", 70.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2] = v12;
      -[UIButton heightAnchor](self->_debugButton, "heightAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToConstant:", 70.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20[3] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "activateConstraints:", v15);

    }
  }
}

- (void)_didSelectRecentsControl:(id)a3
{
  if (self->_allowAppSwitcherControls)
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_1);
}

void __60__CKContextContentProviderUIScene__didSelectRecentsControl___block_invoke()
{
  void *v0;
  id v1;

  v0 = (void *)*MEMORY[0x1E0CEB258];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("universal-recents://"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performSelector:withObject:", sel_openURL_, v1);

}

- (void)_didSelectDebugControl:(id)a3
{
  id v4;
  void *v5;
  _QWORD block[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (self->_allowAppSwitcherControls)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__CKContextContentProviderUIScene__didSelectDebugControl___block_invoke;
    block[3] = &unk_1E6243148;
    v7 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __58__CKContextContentProviderUIScene__didSelectDebugControl___block_invoke(uint64_t a1)
{
  objc_class *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;

  v1 = (objc_class *)MEMORY[0x1E0CEA2D8];
  v2 = *(id *)(a1 + 32);
  v5 = (id)objc_msgSend([v1 alloc], "initWithActivityItems:applicationActivities:", &unk_1E6246F80, 0);
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentViewController:animated:completion:", v5, 1, 0);

}

- (id)_containerViewForDebugButtons
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  objc_class *v15;
  void *v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!self->_allowAppSwitcherControls)
    return 0;
  -[CKContextContentProviderUIScene _scene](self, "_scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_visibleWindows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v5 = v4;
    v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v20)
    {
      v6 = *(_QWORD *)v27;
      v21 = v5;
      v19 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v27 != v6)
            objc_enumerationMutation(v5);
          -[CKContextContentProviderUIScene _descendantsRelevantForDebugControls:](self, "_descendantsRelevantForDebugControls:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v9 = v8;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v23;
            while (2)
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v23 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
                v15 = (objc_class *)objc_opt_class();
                NSStringFromClass(v15);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v16, "containsString:", CFSTR("SBFluidSwitcherContentView")) & 1) != 0)
                {
                  v17 = v14;

                  v5 = v21;
                  goto LABEL_23;
                }

              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
              if (v11)
                continue;
              break;
            }
          }

          v5 = v21;
          v6 = v19;
        }
        v17 = 0;
        v20 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v20);
    }
    else
    {
      v17 = 0;
    }
LABEL_23:

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_descendantsRelevantForDebugControls:(id)a3
{
  id v4;
  void *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v10;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  CGRect v24;
  CGRect v25;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_allowAppSwitcherControls)
    goto LABEL_4;
  objc_msgSend(v4, "frame");
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  if (CGRectGetWidth(v24) < 150.0)
    goto LABEL_4;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  if (CGRectGetHeight(v25) >= 150.0)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v10, "addObject:", v5);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v5, "subviews", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          -[CKContextContentProviderUIScene _descendantsRelevantForDebugControls:](self, "_descendantsRelevantForDebugControls:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObjectsFromArray:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v14);
    }

  }
  else
  {
LABEL_4:
    v10 = 0;
  }

  return v10;
}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->__scene);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__scene);
  objc_destroyWeak((id *)&self->_toolInstallationTimer);
  objc_storeStrong((id *)&self->_recentsButton, 0);
  objc_storeStrong((id *)&self->_debugButton, 0);
}

+ (void)extractFromScene:usingExecutor:withOptions:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_1B0D39000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "CKContextContentProviderUIScene is unexpectedly trying to capture from off of the main thread.", v0, 2u);
  OUTLINED_FUNCTION_3();
}

+ (void)_bestVisibleStringForView:usingExecutor:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_1B0D39000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Was able to access the invitees list via introspection, for better or worse.", v0, 2u);
  OUTLINED_FUNCTION_3();
}

+ (void)_handleWKWebView:withExecutor:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1B0D39000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "The web view is still loading. There should be no attempt to extract content from it without user gesture.", v0, 2u);
  OUTLINED_FUNCTION_3();
}

void __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B0D39000, MEMORY[0x1E0C81028], a3, "Error parsing node information to JSON dictionary: %@", a5, a6, a7, a8, 2u);
}

void __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_2_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B0D39000, MEMORY[0x1E0C81028], a3, "Error evaluating JavaScript for node extraction: %@", a5, a6, a7, a8, 2u);
}

@end
