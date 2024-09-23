@implementation CKContextContentProviderComponent

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
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)MEMORY[0x1E0C99E60];
    v3 = *MEMORY[0x1E0CEBC58];
    v11[0] = *MEMORY[0x1E0CEBC48];
    v11[1] = v3;
    v4 = *MEMORY[0x1E0CEBCD0];
    v11[2] = *MEMORY[0x1E0CEBD10];
    v11[3] = v4;
    v5 = *MEMORY[0x1E0CEBCC0];
    v11[4] = *MEMORY[0x1E0CEBCA8];
    v11[5] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 6);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setWithArray:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)kSensitiveContentTypes_0;
    kSensitiveContentTypes_0 = v7;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6246F98);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)kNotNotableSuperviewClassNames_0;
    kNotNotableSuperviewClassNames_0 = v9;

  }
}

- (CKContextContentProviderComponent)init
{
  CKContextContentProviderComponent *v2;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  CKContextContentProviderComponent *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CKContextContentProviderComponent;
  v2 = -[CKContextContentProviderComponent init](&v14, sel_init);
  if (v2)
  {
    v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
    if (v3)
      -[CKContextContentProviderComponent init].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    +[CKContextContentProviderManager sharedManager](CKContextContentProviderManager, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addProvider:", v2);

    v12 = v2;
  }

  return v2;
}

- (void)extractUsingExecutor:(id)a3 withOptions:(unint64_t)a4
{
  id v6;
  UIView **p_view;
  id WeakRetained;
  void *v9;
  id v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    p_view = &self->_view;
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);

    if (WeakRetained)
    {
      v9 = (void *)objc_opt_class();
      v10 = objc_loadWeakRetained((id *)p_view);
      objc_msgSend(v9, "_donateContentsOfParentView:usingExecutor:withOptions:", v10, v6, a4);

    }
    else
    {
      v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v11)
        -[CKContextContentProviderComponent extractUsingExecutor:withOptions:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[CKContextContentProviderComponent extractUsingExecutor:withOptions:].cold.2();
  }

}

+ (void)_donateContentsOfParentView:(id)a3 usingExecutor:(id)a4 withOptions:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t i;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  CKContextUIElement *v24;
  double v25;
  void *v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  char v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  unint64_t v58;
  void *v59;
  id obj;
  _BOOL4 v61;
  id v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[16];
  _BYTE v73[128];
  uint64_t v74;
  CGSize v75;

  v74 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "window");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_decendantsRelevantForExtractionFromParentView:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v58 = (unint64_t)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v56 = v7;
    v57 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v7, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "windowScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_sceneIdentifier");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v54 = v9;
    obj = v9;
    v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
    v12 = 0;
    if (!v65)
      goto LABEL_30;
    v64 = *(_QWORD *)v69;
    v62 = a1;
    while (1)
    {
      for (i = 0; i != v65; ++i)
      {
        if (*(_QWORD *)v69 != v64)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
        objc_msgSend(a1, "_bestVisibleStringForView:usingExecutor:", v14, v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "length"))
        {
          v66 = v12;
          if ((objc_msgSend(v63, "containsObject:", v15) & 1) == 0)
            objc_msgSend(v63, "addObject:", v15);
          v16 = (objc_class *)objc_opt_class();
          NSStringFromClass(v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_getNotableSuperviewClassNamesForView:", v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_fontSizeOfView:usingExecutor:", v14, v8);
          v20 = v19;
          v21 = objc_msgSend(v15, "length");
          if (v21 >= 0xFA)
            v22 = 250;
          else
            v22 = v21;
          objc_msgSend(v15, "substringWithRange:", 0, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = -[CKContextUIElement initWithText:className:]([CKContextUIElement alloc], "initWithText:className:", v23, v17);
          -[CKContextUIElement setSuperviewClassNames:](v24, "setSuperviewClassNames:", v18);
          *(float *)&v25 = v20;
          -[CKContextUIElement setFontSize:](v24, "setFontSize:", v25);
          -[CKContextUIElement sceneIdentifier](v24, "sceneIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "length");

          if (!v27)
          {
            v28 = (void *)objc_msgSend(v55, "copy");
            -[CKContextUIElement setSceneIdentifier:](v24, "setSceneIdentifier:", v28);

          }
          if ((a5 & 4) != 0)
          {
            v61 = +[CKContextSharedExtractionHelper elementIsOnScreenWithView:window:](CKContextSharedExtractionHelper, "elementIsOnScreenWithView:window:", v14, v59);
            objc_msgSend(v14, "bounds");
            objc_msgSend(v14, "convertRect:toView:", v59);
            v30 = v29;
            v32 = v31;
            -[CKContextUIElement setFrameInWindow:](v24, "setFrameInWindow:");
            objc_msgSend(v59, "screen");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "coordinateSpace");
            v34 = v8;
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "convertPoint:toCoordinateSpace:", v35, v30, v32);
            -[CKContextUIElement setAbsoluteOriginOnScreen:](v24, "setAbsoluteOriginOnScreen:");

            v8 = v34;
            -[CKContextUIElement setOnScreen:](v24, "setOnScreen:", v61);
          }
          if (-[CKContextUIElement isOnScreen](v24, "isOnScreen"))
          {
            v36 = (void *)v58;
            if ((unint64_t)objc_msgSend((id)v58, "count") >= 0xFA)
              goto LABEL_22;
LABEL_21:
            objc_msgSend(v36, "addObject:", v24);
          }
          else
          {
            v36 = v57;
            if ((unint64_t)objc_msgSend(v57, "count") <= 0xF9)
              goto LABEL_21;
          }
LABEL_22:

          a1 = v62;
          v12 = v66;
        }
        if ((a5 & 1) != 0 && !v12)
        {
          +[CKContextSharedExtractionHelper bestImageForView:](CKContextSharedExtractionHelper, "bestImageForView:", v14);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v37;
          if (v37)
            v38 = v37;

        }
      }
      v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
      if (!v65)
      {
LABEL_30:

        v39 = 250 - objc_msgSend((id)v58, "count");
        v40 = objc_msgSend(v57, "count");
        if (v39 >= v40)
          v41 = v40;
        else
          v41 = v39;
        objc_msgSend(v57, "subarrayWithRange:", 0, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v58, "addObjectsFromArray:", v42);

        v43 = 0;
        if ((a5 & 2) != 0)
        {
          v7 = v56;
          v9 = v54;
          if (!v12)
          {
            objc_msgSend(v59, "bounds");
            v45 = v44;
            v47 = v46;
            v49 = v48;
            v51 = v50;
            v52 = objc_msgSend(v59, "isOpaque");
            v75.width = v49;
            v75.height = v51;
            UIGraphicsBeginImageContextWithOptions(v75, v52, 0.0);
            objc_msgSend(v59, "drawViewHierarchyInRect:afterScreenUpdates:", 1, v45, v47, v49, v51);
            UIGraphicsGetImageFromCurrentImageContext();
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            UIGraphicsEndImageContext();
          }
        }
        else
        {
          v7 = v56;
          v9 = v54;
        }
        objc_msgSend(v63, "componentsJoinedByString:", CFSTR("\n\n"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_donateText:withTitle:debugText:debugUrlString:leadImage:snapshot:uiElements:usingContextFromExecutor:", v53, 0, 0, 0, v12, v43, v58 & ((uint64_t)(a5 << 60) >> 63), v8);

        goto LABEL_40;
      }
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B0D39000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "There are no descendants on the view provided for extraction.", buf, 2u);
  }
LABEL_40:

}

+ (id)_decendantsRelevantForExtractionFromParentView:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double Width;
  double v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  id v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(v3, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reverseObjectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v40;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v40 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isHidden") & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_12;
          objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "bounds");
          v15 = v14;
          v17 = v16;
          v19 = v18;
          v21 = v20;

          objc_msgSend(v12, "frame");
          v23 = v22;
          v25 = v24;
          v27 = v26;
          v29 = v28;
          v45.origin.x = v15;
          v45.origin.y = v17;
          v45.size.width = v19;
          v45.size.height = v21;
          Width = CGRectGetWidth(v45);
          objc_msgSend(v12, "frame");
          v31 = CGRectGetWidth(v46);
          if (!v9)
            goto LABEL_11;
          v32 = v31;
          objc_msgSend(v9, "frame");
          v48.origin.x = v33;
          v48.origin.y = v34;
          v48.size.width = v35;
          v48.size.height = v36;
          v47.origin.x = v23;
          v47.origin.y = v25;
          v47.size.width = v27;
          v47.size.height = v29;
          if (!CGRectEqualToRect(v47, v48) || vabdd_f64(Width, v32) <= 20.0)
          {
LABEL_11:
            v37 = v12;

            v9 = v37;
LABEL_12:
            +[CKContextSharedExtractionHelper descendantsRelevantForContentExtractionFromView:intoArray:](CKContextSharedExtractionHelper, "descendantsRelevantForContentExtractionFromView:intoArray:", v12, v4);
            continue;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (!v8)
        goto LABEL_17;
    }
  }
  v9 = 0;
LABEL_17:

  return v4;
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

    if ((objc_msgSend((id)kNotNotableSuperviewClassNames_0, "containsObject:", v8) & 1) == 0)
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

+ (void)_donateText:(id)a3 withTitle:(id)a4 debugText:(id)a5 debugUrlString:(id)a6 leadImage:(id)a7 snapshot:(id)a8 uiElements:(id)a9 usingContextFromExecutor:(id)a10
{
  objc_class *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;

  v16 = (objc_class *)MEMORY[0x1E0D14378];
  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  v26 = objc_alloc_init(v16);
  objc_msgSend(v26, "setText:", v24);

  objc_msgSend(v26, "setTitle:", v23);
  objc_msgSend(v26, "setDebugText:", v22);

  objc_msgSend(v26, "setDebugUrlString:", v21);
  objc_msgSend(v26, "setUiElements:", v18);

  +[CKContextExtractionUtil renderSnapshot:toDonationItem:](CKContextExtractionUtil, "renderSnapshot:toDonationItem:", v19, v26);
  +[CKContextExtractionUtil renderLeadImage:toDonationItem:](CKContextExtractionUtil, "renderLeadImage:toDonationItem:", v20, v26);

  objc_msgSend(v17, "context");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "addItem:", v26);
}

+ (BOOL)_isSensitiveTextContentType:(id)a3
{
  return objc_msgSend((id)kSensitiveContentTypes_0, "containsObject:", a3);
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
  void *v8;
  uint64_t v9;
  id v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;

  v6 = a3;
  v7 = a4;
  if (+[CKContextUIClasses isSFSafariView:](CKContextUIClasses, "isSFSafariView:", v6))
  {
    objc_msgSend(v7, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRemoteProcesses:", objc_msgSend(v8, "remoteProcesses") + 1);

  }
  if (+[CKContextUIClasses isWKWebView:](CKContextUIClasses, "isWKWebView:", v6))
  {
    objc_msgSend(a1, "_handleWKWebView:withExecutor:", v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v10 = (id)v9;
    goto LABEL_8;
  }
  if (+[CKContextUIClasses isPDFView:](CKContextUIClasses, "isPDFView:", v6))
  {
    objc_msgSend(a1, "handlePDFView:withExecutor:", v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "textContentType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(a1, "_isSensitiveTextContentType:", v12) & 1) != 0)
    {

LABEL_16:
      v10 = 0;
      goto LABEL_8;
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v6, "isSecureTextEntry") & 1) != 0)
    goto LABEL_16;
  v13 = 0;
  if (!objc_msgSend(0, "length"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "attributedText");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v14, "string");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }
  if (!objc_msgSend(v13, "length") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "performSelector:", sel_text);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = v15;

      v13 = v16;
    }

  }
  if (!objc_msgSend(v13, "length") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "performSelector:", sel_accessibilityLabel);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)objc_msgSend(v17, "length") >= 0x14)
    {
      v18 = v17;

      v13 = v18;
    }

  }
  if (!objc_msgSend(v13, "length") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "performSelector:", sel_component);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v19, "performSelector:", sel_text);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = v20;

        v13 = v21;
      }

    }
  }
  if (!objc_msgSend(v13, "length") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "performSelector:", sel_dataDetectorElement);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v22, "performSelector:", sel_scannerResult);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v23, "performSelector:", sel_value);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v25 = v24;

          v13 = v25;
        }

      }
    }

  }
  if (objc_msgSend(v13, "length"))
    v26 = v13;
  else
    v26 = 0;
  v10 = v26;

LABEL_8:
  return v10;
}

+ (id)_UIElementsForWebViewContentString:(id)a3 withSceneIdentifier:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;
  float v21;
  CKContextUIElement *v22;
  double v23;
  void *v24;
  void *v26;
  id v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v29 = a4;
  if (objc_msgSend(v5, "length"))
  {
    +[CKContextSharedExtractionHelper blocksFromText:](CKContextSharedExtractionHelper, "blocksFromText:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v6, "count"))
    {
      v26 = v6;
      v27 = v5;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v31 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            if (!+[CKContextSharedExtractionHelper textBlockLooksLikeAListWithText:](CKContextSharedExtractionHelper, "textBlockLooksLikeAListWithText:", v12))
            {
              objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "componentsSeparatedByCharactersInSet:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("@distinctUnionOfObjects.%@"), CFSTR("self"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "valueForKeyPath:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v16, "count");
              v19 = objc_msgSend(v17, "length");
              if (v19)
                v20 = v18 == 0;
              else
                v20 = 1;
              if (!v20)
              {
                v21 = (float)v19 / (float)v18;
                v22 = -[CKContextUIElement initWithText:className:]([CKContextUIElement alloc], "initWithText:className:", v17, CFSTR("WKWebView"));
                *(float *)&v23 = v21;
                -[CKContextUIElement setDensity:](v22, "setDensity:", v23);
                v24 = (void *)objc_msgSend(v29, "copy");
                -[CKContextUIElement setSceneIdentifier:](v22, "setSceneIdentifier:", v24);

                objc_msgSend(v28, "addObject:", v22);
              }

            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v9);
      }

      v6 = v26;
      v5 = v27;
    }

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

+ (id)_handleWKWebView:(id)a3 withExecutor:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  void *v12;
  char v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B0D39000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Extracting from a WKWebView", buf, 2u);
  }
  v8 = objc_msgSend(a1, "controlCodeForExecutor:", v7);
  +[CKContextContentProviderManager optionsForControlCode:](CKContextContentProviderManager, "optionsForControlCode:", v8);
  if ((_DWORD)v8 != 2 && (_DWORD)v8 != 4 && objc_msgSend(v6, "isLoading"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v9 = MEMORY[0x1E0C81028];
      v10 = "The web view is still loading. There should be no attempt to extract content from it without user gesture.";
LABEL_14:
      _os_log_impl(&dword_1B0D39000, v9, OS_LOG_TYPE_INFO, v10, buf, 2u);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  objc_msgSend(v6, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "websiteDataStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isPersistent");

  if ((v13 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v9 = MEMORY[0x1E0C81028];
      v10 = "The webview data store is not persistent. We cannot extract from it for privacy reasons without user gesture.";
      goto LABEL_14;
    }
LABEL_15:
    v22 = &stru_1E6243B40;
    goto LABEL_16;
  }
  v14 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
  if (v14)
    +[CKContextContentProviderComponent _handleWKWebView:withExecutor:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
  objc_msgSend(v7, "markIncomplete");
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __67__CKContextContentProviderComponent__handleWKWebView_withExecutor___block_invoke;
  v24[3] = &unk_1E6243448;
  v26 = a1;
  v25 = v6;
  objc_msgSend(v7, "addWorkItem:", v24);

  v22 = 0;
LABEL_16:

  return (id)v22;
}

void __67__CKContextContentProviderComponent__handleWKWebView_withExecutor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  char v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  char v22;
  BOOL v23;
  BOOL v24;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 40), "controlCodeForExecutor:", v3);
  v5 = v4;
  v6 = +[CKContextContentProviderManager optionsForControlCode:](CKContextContentProviderManager, "optionsForControlCode:", v4);
  v7 = (v6 >> 2) & 1;
  v18[2] = __67__CKContextContentProviderComponent__handleWKWebView_withExecutor___block_invoke_2;
  v18[3] = &unk_1E6243668;
  v8 = *(void **)(a1 + 32);
  v21 = *(_QWORD *)(a1 + 40);
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v22 = v5;
  v23 = (v6 & 4) != 0;
  v24 = (v6 & 8) != 0;
  v19 = v8;
  v20 = v3;
  v10 = v3;
  v11 = (void *)MEMORY[0x1B5E103A4](v18);
  v14 = a1 + 32;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v14 + 8);
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __67__CKContextContentProviderComponent__handleWKWebView_withExecutor___block_invoke_3;
  v16[3] = &unk_1E6243690;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v13, "_extractContentFromWebView:includingUIBoundingBox:withCompletionHandler:", v12, v7, v16);

}

void __67__CKContextContentProviderComponent__handleWKWebView_withExecutor___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v4;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  unsigned int v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;

  v32 = a2;
  v30 = a3;
  v8 = *(void **)(a1 + 48);
  v9 = *(void **)(a1 + 32);
  v10 = a4;
  objc_msgSend(v9, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "windowScene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_sceneIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_UIElementsForWebViewContentString:withSceneIdentifier:", v32, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKContextSharedExtractionHelper bestContentStringForWebViewUIElements:andTitle:](CKContextSharedExtractionHelper, "bestContentStringForWebViewUIElements:andTitle:", v14, v15);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v14, "count");
  if (v16 >= 0xFA)
    v17 = 250;
  else
    v17 = v16;
  objc_msgSend(v14, "subarrayWithRange:", 0, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v10, "count");
  if (v19 >= 0xFA)
    v20 = 250;
  else
    v20 = v19;
  objc_msgSend(v10, "subarrayWithRange:", 0, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (*(unsigned __int8 *)(a1 + 56) < 6u) & (0x2Cu >> *(_BYTE *)(a1 + 56));
  if (*(_BYTE *)(a1 + 57))
    v23 = v21;
  else
    v23 = v18;
  v24 = v23;
  v25 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "title");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "absoluteString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v32;
  }
  else
  {
    v28 = 0;
    v27 = 0;
  }
  if (*(_BYTE *)(a1 + 58))
    v29 = v24;
  else
    v29 = 0;
  objc_msgSend(v25, "_donateText:withTitle:debugText:debugUrlString:leadImage:snapshot:uiElements:usingContextFromExecutor:", v31, v26, v28, v27, 0, v30, v29, *(_QWORD *)(a1 + 40));
  if (v22)
  {

  }
  objc_msgSend(*(id *)(a1 + 40), "markReady");

}

uint64_t __67__CKContextContentProviderComponent__handleWKWebView_withExecutor___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)_extractContentFromWebView:(id)a3 includingUIBoundingBox:(BOOL)a4 withCompletionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  _QWORD block[4];
  id v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD v36[4];
  id v37;
  NSObject *v38;
  id v39;
  id v40;
  _QWORD *v41;
  _QWORD v42[4];
  NSObject *v43;
  id v44;
  _QWORD *v45;
  uint64_t v46;
  _QWORD v47[5];
  id v48;
  _QWORD v49[5];
  id v50;
  _QWORD v51[5];
  void *v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[5];
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (v9)
  {
    objc_msgSend(v8, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "_isDisplayingPDF"))
    {
      objc_msgSend(v8, "_dataForDisplayedPDF");
      v11 = objc_claimAutoreleasedReturnValue();
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __109__CKContextContentProviderComponent__extractContentFromWebView_includingUIBoundingBox_withCompletionHandler___block_invoke;
      v53[3] = &unk_1E62434E8;
      v54 = v9;
      objc_msgSend(a1, "extractContentFromWebViewPDFData:withCompletionHandler:", v11, v53);
      v12 = v54;
    }
    else
    {
      v13 = dispatch_group_create();
      v51[0] = 0;
      v51[1] = v51;
      v51[2] = 0x3032000000;
      v51[3] = __Block_byref_object_copy__0;
      v51[4] = __Block_byref_object_dispose__0;
      v52 = 0;
      v49[0] = 0;
      v49[1] = v49;
      v49[2] = 0x3032000000;
      v49[3] = __Block_byref_object_copy__0;
      v49[4] = __Block_byref_object_dispose__0;
      v50 = 0;
      v47[0] = 0;
      v47[1] = v47;
      v47[2] = 0x3032000000;
      v47[3] = __Block_byref_object_copy__0;
      v47[4] = __Block_byref_object_dispose__0;
      v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      dispatch_group_enter(v13);
      v14 = MEMORY[0x1E0C809B0];
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __109__CKContextContentProviderComponent__extractContentFromWebView_includingUIBoundingBox_withCompletionHandler___block_invoke_89;
      v42[3] = &unk_1E62436B8;
      v45 = v51;
      v46 = 3000;
      v11 = v13;
      v43 = v11;
      v15 = v8;
      v44 = v15;
      objc_msgSend(v15, "_getContentsAsStringWithCompletionHandler:", v42);
      v56 = 0;
      v57 = &v56;
      v58 = 0x2050000000;
      v16 = (void *)getWKContentWorldClass_softClass_0;
      v59 = getWKContentWorldClass_softClass_0;
      if (!getWKContentWorldClass_softClass_0)
      {
        v55[0] = v14;
        v55[1] = 3221225472;
        v55[2] = __getWKContentWorldClass_block_invoke_0;
        v55[3] = &unk_1E6243378;
        v55[4] = &v56;
        __getWKContentWorldClass_block_invoke_0((uint64_t)v55);
        v16 = (void *)v57[3];
      }
      v17 = objc_retainAutorelease(v16);
      _Block_object_dispose(&v56, 8);
      objc_msgSend(v17, "worldWithName:", CFSTR("CKContextExtractionContentWorld"));
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      if (v6 && v18)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
        if (v21)
          +[CKContextContentProviderComponent _extractContentFromWebView:includingUIBoundingBox:withCompletionHandler:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);
        dispatch_group_enter(v11);
        +[CKContextSharedExtractionHelper webPageNodeExtractionJavaScript](CKContextSharedExtractionHelper, "webPageNodeExtractionJavaScript");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = v14;
        v36[1] = 3221225472;
        v36[2] = __109__CKContextContentProviderComponent__extractContentFromWebView_includingUIBoundingBox_withCompletionHandler___block_invoke_93;
        v36[3] = &unk_1E62436E0;
        v30 = v20;
        v37 = v30;
        v38 = v11;
        v39 = v15;
        v40 = v10;
        v41 = v47;
        objc_msgSend(v39, "evaluateJavaScript:inFrame:inContentWorld:completionHandler:", v29, 0, v19, v36);

      }
      block[0] = v14;
      block[1] = 3221225472;
      block[2] = __109__CKContextContentProviderComponent__extractContentFromWebView_includingUIBoundingBox_withCompletionHandler___block_invoke_98;
      block[3] = &unk_1E6243708;
      v32 = v9;
      v33 = v51;
      v34 = v49;
      v35 = v47;
      dispatch_group_notify(v11, MEMORY[0x1E0C80D38], block);

      _Block_object_dispose(v47, 8);
      _Block_object_dispose(v49, 8);

      _Block_object_dispose(v51, 8);
      v12 = v52;
    }

  }
}

uint64_t __109__CKContextContentProviderComponent__extractContentFromWebView_includingUIBoundingBox_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __109__CKContextContentProviderComponent__extractContentFromWebView_includingUIBoundingBox_withCompletionHandler___block_invoke_89(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[16];

  v3 = a2;
  if ((unint64_t)objc_msgSend(v3, "length") < 0x96)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0D39000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Failed to extract enough text from main webpage frame. Trying to get content from all frames", buf, 2u);
    }
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __109__CKContextContentProviderComponent__extractContentFromWebView_includingUIBoundingBox_withCompletionHandler___block_invoke_90;
    v12[3] = &unk_1E6243510;
    v10 = *(_QWORD *)(a1 + 56);
    v14 = *(_QWORD *)(a1 + 48);
    v15 = v10;
    v11 = *(void **)(a1 + 40);
    v13 = *(id *)(a1 + 32);
    objc_msgSend(v11, "_getContentsOfAllFramesAsStringWithCompletionHandler:", v12);

  }
  else
  {
    v4 = *(_QWORD *)(a1 + 56);
    v5 = objc_msgSend(v3, "length");
    if (v4 >= v5)
      v6 = v5;
    else
      v6 = v4;
    objc_msgSend(v3, "substringWithRange:", 0, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void __109__CKContextContentProviderComponent__extractContentFromWebView_includingUIBoundingBox_withCompletionHandler___block_invoke_90(uint64_t a1, void *a2)
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

void __109__CKContextContentProviderComponent__extractContentFromWebView_includingUIBoundingBox_withCompletionHandler___block_invoke_93(uint64_t a1, void *a2, void *a3)
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
  id v83;
  uint64_t v84;
  uint64_t v85;
  id obj;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  id v96;
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    __109__CKContextContentProviderComponent__extractContentFromWebView_includingUIBoundingBox_withCompletionHandler___block_invoke_93_cold_3(a1);
    if (v6)
      goto LABEL_3;
  }
  else if (v6)
  {
LABEL_3:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_2_cold_2((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    goto LABEL_62;
  }
  objc_msgSend(v5, "description");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "length"))
  {
    objc_msgSend(v14, "dataUsingEncoding:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v15, 0, &v96);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v96;
    if (v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v70 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v70)
        __192__CKContextContentProviderUIScene__extractContentFromWebView_includingSnapshot_includingUIBoundingBox_ignoreViewTextLengthRequirements_ignoreViewCountCap_includeRawHTML_withCompletionHandler___block_invoke_2_cold_1(v70, v71, v72, v73, v74, v75, v76, v77);
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
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
          v82 = v6;
          v83 = v5;
          v92 = 0u;
          v93 = 0u;
          v94 = 0u;
          v95 = 0u;
          obj = v18;
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v97, 16);
          v78 = v18;
          if (v19)
          {
            v20 = v19;
            v21 = 0x1E0C99000uLL;
            v22 = *(_QWORD *)v93;
            v84 = *(_QWORD *)v93;
            do
            {
              v23 = 0;
              v85 = v20;
              do
              {
                if (*(_QWORD *)v93 != v22)
                  objc_enumerationMutation(obj);
                v24 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v23);
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
                    v87 = 0;
                  }
                  else
                  {
                    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("className"));
                    v87 = (void *)objc_claimAutoreleasedReturnValue();
                  }

                  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("left"));
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*(id *)(v21 + 3640), "null");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v30, "isEqual:", v31) & 1) != 0)
                  {
                    v91 = 0;
                  }
                  else
                  {
                    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("left"));
                    v91 = (void *)objc_claimAutoreleasedReturnValue();
                  }

                  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("right"));
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*(id *)(v21 + 3640), "null");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v32, "isEqual:", v33) & 1) != 0)
                  {
                    v90 = 0;
                  }
                  else
                  {
                    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("right"));
                    v90 = (void *)objc_claimAutoreleasedReturnValue();
                  }

                  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("top"));
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  v35 = v21;
                  objc_msgSend(*(id *)(v21 + 3640), "null");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v34, "isEqual:", v36) & 1) != 0)
                  {
                    v89 = 0;
                  }
                  else
                  {
                    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("top"));
                    v89 = (void *)objc_claimAutoreleasedReturnValue();
                  }

                  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("bottom"));
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*(id *)(v35 + 3640), "null");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  v88 = v27;
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
                    v47 = -[CKContextUIElement initWithText:className:](v43, "initWithText:className:", v46, v87);

                    -[CKContextUIElement setOnScreen:](v47, "setOnScreen:", objc_msgSend(v42, "BOOLValue"));
                    objc_msgSend(*(id *)(a1 + 48), "window");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v48, "windowScene");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v49, "_sceneIdentifier");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    v51 = a1;
                    v52 = (void *)objc_msgSend(v50, "copy");
                    -[CKContextUIElement setSceneIdentifier:](v47, "setSceneIdentifier:", v52);

                    a1 = v51;
                    if (v91 && v90 && v89 && v39)
                    {
                      v53 = *(void **)(v51 + 48);
                      objc_msgSend(v91, "doubleValue");
                      v55 = v54;
                      objc_msgSend(v89, "doubleValue");
                      objc_msgSend(v53, "_convertPointFromContentsToView:", v55, v56);
                      v58 = v57;
                      v60 = v59;
                      v61 = *(void **)(v51 + 48);
                      objc_msgSend(v90, "doubleValue");
                      v63 = v62;
                      objc_msgSend(v39, "doubleValue");
                      objc_msgSend(v61, "_convertPointFromContentsToView:", v63, v64);
                      objc_msgSend(*(id *)(v51 + 48), "convertRect:toView:", 0, v58, v60, v65 - v58, v66 - v60);
                      objc_msgSend(*(id *)(v51 + 56), "convertRect:toView:", 0);
                      -[CKContextUIElement setFrameInWindow:](v47, "setFrameInWindow:");
                      objc_msgSend(*(id *)(v51 + 56), "screen");
                      v67 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v67, "coordinateSpace");
                      v68 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v68)
                      {
                        v69 = *(void **)(v51 + 56);
                        -[CKContextUIElement frameInWindow](v47, "frameInWindow");
                        objc_msgSend(v69, "convertPoint:toCoordinateSpace:", v68);
                        -[CKContextUIElement setAbsoluteOriginOnScreen:](v47, "setAbsoluteOriginOnScreen:");
                      }

                    }
                    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v51 + 64) + 8) + 40), "addObject:", v47);

                    v27 = v88;
                  }

                  v21 = v35;
                  v22 = v84;
                  v20 = v85;
                }
                ++v23;
              }
              while (v20 != v23);
              v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v97, 16);
            }
            while (v20);
          }

          v6 = v82;
          v5 = v83;
          v18 = v78;
          v17 = 0;
          v15 = v80;
          v14 = v81;
          v16 = v79;
        }
      }
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

    }
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

LABEL_62:
}

uint64_t __109__CKContextContentProviderComponent__extractContentFromWebView_includingUIBoundingBox_withCompletionHandler___block_invoke_98(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
}

- (void)init
{
  OUTLINED_FUNCTION_0(&dword_1B0D39000, MEMORY[0x1E0C81028], a3, "Creating the bespoke extraction component.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)extractUsingExecutor:(uint64_t)a3 withOptions:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B0D39000, MEMORY[0x1E0C81028], a3, "There is no view to extract from", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)extractUsingExecutor:withOptions:.cold.2()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_1B0D39000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "CKContextContentProviderComponent is unexpectedly trying to capture from off of the main thread.", v0, 2u);
  OUTLINED_FUNCTION_3();
}

+ (void)_handleWKWebView:(uint64_t)a3 withExecutor:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B0D39000, MEMORY[0x1E0C81028], a3, "Marking the executor as incomplete", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

+ (void)_extractContentFromWebView:(uint64_t)a3 includingUIBoundingBox:(uint64_t)a4 withCompletionHandler:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B0D39000, MEMORY[0x1E0C81028], a3, "Trying to get bounding boxes by injecting Javascript into WKWebView", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void __109__CKContextContentProviderComponent__extractContentFromWebView_includingUIBoundingBox_withCompletionHandler___block_invoke_93_cold_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v4 = 134217984;
  v5 = v3;
  _os_log_debug_impl(&dword_1B0D39000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Evaluated after %f seconds", (uint8_t *)&v4, 0xCu);

}

@end
