@implementation DDContextMenuAction

+ (void)performAction:(id)a3 fromView:(id)a4 alertController:(id)a5 interactionDelegate:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v9, "interactionType"))
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __82__DDContextMenuAction_performAction_fromView_alertController_interactionDelegate___block_invoke;
    v14[3] = &unk_1E42582F8;
    v15 = v9;
    v16 = v10;
    v17 = v11;
    v18 = v12;
    dispatch_async(MEMORY[0x1E0C80D38], v14);

  }
  else
  {
    +[DDDetectionController sharedController](DDDetectionController, "sharedController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "performAction:fromView:alertController:interactionDelegate:", v9, v10, v11, v12);

  }
}

void __82__DDContextMenuAction_performAction_fromView_alertController_interactionDelegate___block_invoke(_QWORD *a1)
{
  id v2;

  +[DDDetectionController sharedController](DDDetectionController, "sharedController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performAction:fromView:alertController:interactionDelegate:", a1[4], a1[5], a1[6], a1[7]);

}

+ (BOOL)validateContext:(id)a3 silent:(BOOL)a4
{
  void *v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SourceRect"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 && !a4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    +[DDContextMenuAction validateContext:silent:].cold.1();
  return v5 != 0;
}

+ (id)updateContext:(id)a3 withSourceRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  void *v9;
  void *v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (a3)
  {
    v8 = objc_msgSend(a3, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", x, y, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("SourceRect"));

  objc_msgSend(v9, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("defaultHttpActionRequested"));
  return v9;
}

+ (id)contextMenuConfigurationAtIndex:(unint64_t)a3 inTextStorage:(id)a4 inView:(id)a5 context:(id)a6 menuIdentifier:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t RangeForURLification;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v55;
  uint64_t v56;

  v11 = a4;
  v12 = a5;
  v13 = a7;
  v14 = a6;
  v15 = -[DDContextMenuAction initAtIndex:inTextStorage:]([DDContextMenuAction alloc], "initAtIndex:inTextStorage:", a3, v11);
  v16 = v15[1];
  v17 = v15[2];
  +[DDDetectionController updateContext:forResult:atIndex:ofStorage:](DDDetectionController, "updateContext:forResult:atIndex:ofStorage:", v14, v17, a3, v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!+[DDDetectionController largeScreenIdiom](DDDetectionController, "largeScreenIdiom"))
    goto LABEL_24;
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("SourceRect"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = a1;
    goto LABEL_23;
  }
  objc_msgSend(v11, "layoutManagers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v12, "layoutManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
  }
  objc_msgSend(v22, "textContainers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "firstObject");
  v52 = objc_claimAutoreleasedReturnValue();

  v53 = v22;
  if (v17)
  {
    RangeForURLification = DDResultGetRangeForURLification();
    v26 = v25;
    v20 = a1;
    goto LABEL_10;
  }
  objc_msgSend(v16, "scheme");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v41, "isEqualToString:", CFSTR("x-apple-data-detectors-clientdefined")) & 1) != 0)
  {
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("CustomActionRanges"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      objc_msgSend(v16, "path");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "integerValue");

      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("CustomActionRanges"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = a1;
      if (objc_msgSend(v45, "count") <= v44)
      {
        v26 = 0;
        RangeForURLification = -1;
      }
      else
      {
        objc_msgSend(v45, "objectAtIndexedSubscript:", v44);
        v51 = v45;
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        RangeForURLification = objc_msgSend(v46, "rangeValue");
        v26 = v47;

        v45 = v51;
      }

      goto LABEL_10;
    }
  }
  else
  {

  }
  v55 = 0;
  v56 = 0;
  objc_msgSend(v11, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0CEA0C0], a3, &v55);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = a1;
  if (!v48)
    goto LABEL_21;
  RangeForURLification = v55;
  v26 = v56;
LABEL_10:
  if (RangeForURLification != -1)
  {
    v27 = objc_msgSend(v53, "glyphRangeForCharacterRange:actualCharacterRange:", RangeForURLification, v26, 0);
    v28 = (void *)v52;
    objc_msgSend(v53, "boundingRectForGlyphRange:inTextContainer:", v27, v29, v52);
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "textContainerInset");
      v31 = v31 + v38;
      v33 = v33 + v39;
    }
    +[DDContextMenuAction updateContext:withSourceRect:](DDContextMenuAction, "updateContext:withSourceRect:", v18, v31, v33, v35, v37);
    v40 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v40;
    goto LABEL_22;
  }
LABEL_21:
  v28 = (void *)v52;
LABEL_22:

LABEL_23:
  if (!objc_msgSend(v20, "validateContext:silent:", v18, 0))
  {
    v49 = 0;
    goto LABEL_26;
  }
LABEL_24:
  objc_msgSend(v15, "contextMenuConfigurationWithIdentifier:inView:context:", v13, v12, v18);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:

  return v49;
}

+ (id)contextMenuConfigurationForURL:(id)a3 identifier:(id)a4 selectedText:(id)a5 results:(id)a6 inView:(id)a7 context:(id)a8 menuIdentifier:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  DDContextMenuAction *v26;
  id v28;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  if (objc_msgSend(a1, "validateContext:silent:", v20, 0) && (dd_urlLooksSuspicious(v15) & 1) == 0)
  {
    +[DDDetectionController sharedController](DDDetectionController, "sharedController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v24 = objc_msgSend(v23, "resultForURL:identifier:selectedText:results:context:extendedContext:", v15, v16, v17, v18, v20, &v28);
    v25 = v28;

    v26 = -[DDContextMenuAction initWithResult:URL:]([DDContextMenuAction alloc], "initWithResult:URL:", v24, v15);
    -[DDContextMenuAction contextMenuConfigurationWithIdentifier:inView:context:](v26, "contextMenuConfigurationWithIdentifier:inView:context:", v21, v19, v25);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)contextMenuConfigurationWithResult:(__DDResult *)a3 inView:(id)a4 context:(id)a5 menuIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  DDContextMenuAction *v13;
  void *v14;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(a1, "validateContext:silent:", v11, 0))
  {
    v13 = -[DDContextMenuAction initWithResult:URL:]([DDContextMenuAction alloc], "initWithResult:URL:", a3, 0);
    -[DDContextMenuAction contextMenuConfigurationWithIdentifier:inView:context:](v13, "contextMenuConfigurationWithIdentifier:inView:context:", v12, v10, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)contextMenuConfigurationWithURL:(id)a3 inView:(id)a4 context:(id)a5 menuIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  DDContextMenuAction *v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(a1, "validateContext:silent:", v12, 0) && (dd_urlLooksSuspicious(v10) & 1) == 0)
  {
    v15 = -[DDContextMenuAction initWithResult:URL:]([DDContextMenuAction alloc], "initWithResult:URL:", 0, v10);
    -[DDContextMenuAction contextMenuConfigurationWithIdentifier:inView:context:](v15, "contextMenuConfigurationWithIdentifier:inView:context:", v13, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)contextMenuConfigurationWithRVItem:(id)a3 inView:(id)a4 context:(id)a5 menuIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  DDContextMenuAction *v14;
  void *v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(a1, "validateContext:silent:", v12, 0))
  {
    v14 = -[DDContextMenuAction initWithRVItem:]([DDContextMenuAction alloc], "initWithRVItem:", v10);
    -[DDContextMenuAction contextMenuConfigurationWithIdentifier:inView:context:](v14, "contextMenuConfigurationWithIdentifier:inView:context:", v13, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)defaultActionWithResult:(__DDResult *)a3 context:(id)a4
{
  id v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  if (objc_msgSend(a1, "validateContext:silent:", v6, 0))
  {
    +[DDDetectionController sharedController](DDDetectionController, "sharedController");
    v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "_shouldImmediatelyShowActionSheetForCoreResult:", a3) & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D1CE68], "resultFromCoreResult:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)v7[7];
      objc_msgSend(v9, "url");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "defaultActionForURL:result:context:", v11, a3, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)defaultActionWithURL:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "validateContext:silent:", v7, 0))
  {
    +[DDDetectionController sharedController](DDDetectionController, "sharedController");
    v8 = (id *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "_shouldImmediatelyShowActionSheetForURL:", v6) & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(v8[7], "defaultActionForURL:result:context:", v6, 0, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)previewViewProviderForPreviewAction:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", CFSTR("kDDContextMenuWantsPreviewKey"));

  if (v8)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("kDDContextMenuWantsPreviewKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

  }
  else
  {
    v10 = 1;
  }
  v11 = 0;
  if (v5 && v10)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __67__DDContextMenuAction_previewViewProviderForPreviewAction_context___block_invoke;
    v14[3] = &unk_1E4258B30;
    v15 = v5;
    v11 = (void *)MEMORY[0x1A1AF3244](v14);

  }
  v12 = (void *)MEMORY[0x1A1AF3244](v11);

  return v12;
}

id __67__DDContextMenuAction_previewViewProviderForPreviewAction_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  DDClientPreviewAction *v5;
  void *v6;
  DDClientPreviewAction *v7;

  objc_msgSend(*(id *)(a1 + 32), "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2
    && +[DDClientPreviewAction clientCanPerformActionWithUrl:](DDClientPreviewAction, "clientCanPerformActionWithUrl:", v2))
  {
    if ((dd_isDeviceLocked() & 1) != 0)
    {
      v3 = 0;
    }
    else
    {
      v5 = [DDClientPreviewAction alloc];
      objc_msgSend(*(id *)(a1 + 32), "context");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[DDAction initWithURL:result:context:](v5, "initWithURL:result:context:", v2, 0, v6);
      -[DDClientPreviewAction viewController](v7, "viewController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "previewViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

+ (id)buttonActionsForURL:(id)a3 result:(__DDResult *)a4 contact:(id)a5 icsString:(id)a6 context:(id)a7 view:(id)a8 identifier:(id)a9 suggestedActions:(id)a10 defaultAction:(id *)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  DDContextMenuAction *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void (**v31)(id, id);
  id v33;

  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  if (!v16 && !a4 && !v17 && !v18)
  {
    if (a11)
    {
      v23 = 0;
      *a11 = 0;
      goto LABEL_21;
    }
LABEL_12:
    v23 = 0;
    goto LABEL_21;
  }
  if ((dd_urlLooksSuspicious(v16) & 1) != 0)
    goto LABEL_12;
  if (_DDResultIsURL((uint64_t)a4))
  {
    _DDURLFromResult((uint64_t)a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (!v24 || (dd_urlLooksSuspicious(v24) & 1) != 0)
    {

      goto LABEL_12;
    }

  }
  +[DDDetectionController barcodeContext:preview:contact:ics:](DDDetectionController, "barcodeContext:preview:contact:ics:", v19, 1, v17, v18);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = -[DDContextMenuAction initWithResult:URL:]([DDContextMenuAction alloc], "initWithResult:URL:", a4, v16);
  v33 = 0;
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("kDDContextUsePlaceholderDefaultActionKey"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "BOOLValue"))
    v29 = 2;
  else
    v29 = 0;
  v30 = -[DDContextMenuAction contextMenuConfigurationWithIdentifier:inView:context:defaultAction:menuProvider:options:](v27, "contextMenuConfigurationWithIdentifier:inView:context:defaultAction:menuProvider:options:", v21, v20, v26, a11, &v33, v29);
  v31 = (void (**)(id, id))v33;

  if (v31)
  {
    v31[2](v31, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }

  v19 = v26;
LABEL_21:

  return v23;
}

- (id)_rawContextMenuContentForView:(id)a3 interactionDelegate:(id)a4 context:(id)a5 elements:(id)a6 defaultAction:(id *)a7 options:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  RVItem *item;
  DDLookupAction *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSAttributedString *menuTitle;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  unint64_t v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  DDLookupAction *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  int64_t v57;
  id *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  _BYTE v68[128];
  uint64_t v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  item = self->_item;
  if (!item)
  {
    v58 = a7;
    +[DDContextMenuAction previewActionForResult:URL:context:](DDContextMenuAction, "previewActionForResult:URL:context:", self->_result, self->_url, v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v23;
    goto LABEL_8;
  }
  if (-[RVItem normalizedType](item, "normalizedType") == 6)
  {
    v58 = a7;
    v19 = [DDLookupAction alloc];
    -[RVItem query](self->_item, "query");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[DDLookupAction initWithRVQuery:context:](v19, "initWithRVQuery:context:", v20, v16);
    goto LABEL_4;
  }
  v26 = -[RVItem highlightRange](self->_item, "highlightRange");
  if (v26 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v28 = v26 + v27;
    -[RVItem text](self->_item, "text");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "length");

    if (v28 <= v30)
    {
      v58 = a7;
      v48 = [DDLookupAction alloc];
      -[RVItem text](self->_item, "text");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[RVItem highlightRange](self->_item, "highlightRange");
      v21 = -[DDLookupAction initWithQueryString:range:context:](v48, "initWithQueryString:range:context:", v20, v49, v50, v16);
LABEL_4:
      v22 = (void *)v21;

      if (+[DDParsecAction isAvailable](DDLookupAction, "isAvailable"))
        v23 = v22;
      else
        v23 = 0;
LABEL_8:
      v57 = a8;
      if (v22)
      {
        if ((objc_msgSend(v22, "showMenuTitle") & 1) == 0)
        {
          menuTitle = self->_menuTitle;
          self->_menuTitle = 0;

        }
        objc_msgSend(v22, "menuActions");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          -[DDContextMenuAction _updateMenuElementItems:withActions:view:interactionDelegate:options:](self, "_updateMenuElementItems:withActions:view:interactionDelegate:options:", v17, v25, v14, v15, v57);
          *v58 = (id)objc_claimAutoreleasedReturnValue();
LABEL_37:

          v31 = v23;
          goto LABEL_38;
        }
        v52 = v23;
        v53 = v17;
        v56 = v15;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        +[DDDetectionController sharedController](DDDetectionController, "sharedController");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v16;
        objc_msgSend(v40, "actionsForResult:context:", self->_result, v16);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
        if (v42)
        {
          v43 = v42;
          v44 = *(_QWORD *)v64;
          do
          {
            for (i = 0; i != v43; ++i)
            {
              if (*(_QWORD *)v64 != v44)
                objc_enumerationMutation(v41);
              v69 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i);
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "addObject:", v46);

            }
            v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
          }
          while (v43);
        }

        v23 = v52;
        v15 = v56;
        v17 = v53;
        if (objc_msgSend(v39, "count"))
        {
          -[DDContextMenuAction _updateMenuElementItems:withActions:view:interactionDelegate:options:](self, "_updateMenuElementItems:withActions:view:interactionDelegate:options:", v53, v39, v14, v56, v57);
          *v58 = (id)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        v51 = v23;
        v55 = v15;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        +[DDDetectionController sharedController](DDDetectionController, "sharedController");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v16;
        objc_msgSend(v32, "actionsForResult:context:", self->_result, v16);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v60;
          do
          {
            for (j = 0; j != v35; ++j)
            {
              if (*(_QWORD *)v60 != v36)
                objc_enumerationMutation(v33);
              v67 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * j);
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "addObject:", v38);

            }
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
          }
          while (v35);
        }

        v23 = v51;
        if (!objc_msgSend(v25, "count"))
        {
          v16 = v54;
          v15 = v55;
          goto LABEL_37;
        }
        v15 = v55;
        -[DDContextMenuAction _updateMenuElementItems:withActions:view:interactionDelegate:options:](self, "_updateMenuElementItems:withActions:view:interactionDelegate:options:", v17, v25, v14, v55, v57);
        *v58 = (id)objc_claimAutoreleasedReturnValue();
      }
      v16 = v54;
      goto LABEL_37;
    }
  }
  v31 = 0;
LABEL_38:

  return v31;
}

+ (id)filterResultsForQuickActions:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (_DDResultIsURL(objc_msgSend(v9, "coreResult")))
        {
          objc_msgSend(v9, "url");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (!v10 || dd_urlLooksSuspicious(v10))
          {

            continue;
          }

        }
        if ((objc_msgSend(v9, "ddui_canBeCombinedToOthers") & 1) == 0)
        {
          v12 = (void *)MEMORY[0x1A1AF30A0]();
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v13 = v4;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v21;
            while (2)
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v21 != v16)
                  objc_enumerationMutation(v13);
                if ((objc_msgSend(v9, "ddui_isEquivalentToResult:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j)) & 1) != 0)
                {

                  objc_autoreleasePoolPop(v12);
                  goto LABEL_24;
                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
              if (v15)
                continue;
              break;
            }
          }

          objc_autoreleasePoolPop(v12);
        }
        objc_msgSend(v4, "addObject:", v9);
        if (objc_msgSend(v4, "count") == 50)
          goto LABEL_26;
LABEL_24:
        ;
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v6);
  }
LABEL_26:

  return v4;
}

+ (id)identificationStringsForMenuElement:(id)a3 useDefault:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  objc_class *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7 && !v4)
      goto LABEL_15;
    if (v7 == 0 && v4)
      v8 = CFSTR("none");
    else
      v8 = (__CFString *)v7;
    objc_msgSend(v6, "addObject:", v8);
  }
  else
  {
    if (!v4)
      goto LABEL_15;
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("_UIImmutableCommand")))
    {
      v10 = (const char *)objc_msgSend(v5, "action");
      if (v10)
      {
        NSStringFromSelector(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v11);

      }
      v12 = (const char *)objc_msgSend(v5, "fallbackAction");
      if (v12)
      {
        NSStringFromSelector(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v13);

      }
    }
  }

LABEL_15:
  if (objc_msgSend(v6, "count"))
    v14 = v6;
  else
    v14 = 0;
  v15 = v14;

  return v15;
}

- (id)contextMenuConfigurationWithIdentifier:(id)a3 inView:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kDDContextUsePlaceholderDefaultActionKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "BOOLValue"))
    v12 = 2;
  else
    v12 = 0;
  -[DDContextMenuAction contextMenuConfigurationWithIdentifier:inView:context:defaultAction:menuProvider:options:](self, "contextMenuConfigurationWithIdentifier:inView:context:defaultAction:menuProvider:options:", v10, v9, v8, 0, 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)contextMenuConfigurationWithIdentifier:(id)a3 inView:(id)a4 context:(id)a5 defaultAction:(id *)a6 menuProvider:(id *)a7 options:(int64_t)a8
{
  id v13;
  __DDResult *v14;
  __DDResult *v15;
  __DDResult *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  DDLookupAction *v23;
  void *v24;
  void *v25;
  id v26;
  int v27;
  char v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v49;
  void *v51;
  id v52;
  id v53;
  void *v54;
  DDRVInteractionDelegate *v55;
  void *v56;
  id val;
  _QWORD v58[4];
  id v59;
  DDRVInteractionDelegate *v60;
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  id v69;
  char v70;
  _QWORD v71[4];
  id v72;
  id location;
  id v74;
  DDLookupAction *v75;
  _QWORD v76[3];

  v76[1] = *MEMORY[0x1E0C80C00];
  v53 = a3;
  val = a4;
  v13 = a5;
  v14 = self->_result;
  if (v14)
  {
    v15 = (__DDResult *)DDCreateUpdatedResultWithContext(v14, v13);
    if (v15)
    {
      v16 = self->_result;
      self->_result = v15;
      CFRelease(v16);
    }
  }
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ICS"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v54, "length"))
  {
    +[DDAddEventAction cachedEventForICSString:](DDAddEventAction, "cachedEventForICSString:", v54);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      +[DDAction contextByAddingValue:toKey:inContext:](DDAction, "contextByAddingValue:toKey:inContext:", v17, 0x1E4259480, v13);
      v18 = objc_claimAutoreleasedReturnValue();

      v13 = (id)v18;
    }

  }
  v56 = (void *)objc_msgSend(v13, "copy");

  if (self->_originalItem)
    v55 = -[DDRVInteractionDelegate initWithItem:]([DDRVInteractionDelegate alloc], "initWithItem:", self->_originalItem);
  else
    v55 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = 0;
  -[DDContextMenuAction _rawContextMenuContentForView:interactionDelegate:context:elements:defaultAction:options:](self, "_rawContextMenuContentForView:interactionDelegate:context:elements:defaultAction:options:", val, v55, v56, v19, &v74, a8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v74;
  objc_initWeak(&location, val);
  if (!objc_msgSend(v19, "count"))
  {
    v34 = 0;
    goto LABEL_38;
  }
  if (self->_additionalLookupItem && +[DDParsecAction isAvailable](DDLookupAction, "isAvailable"))
  {
    -[RVItem ddResult](self->_additionalLookupItem, "ddResult");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "value");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v22, "length"))
    {
      v23 = -[DDLookupAction initWithQueryString:range:context:]([DDLookupAction alloc], "initWithQueryString:range:context:", v22, 0, objc_msgSend(v22, "length"), v56);
      v75 = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v76[0] = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[DDContextMenuAction _updateMenuElementItems:withActions:view:interactionDelegate:options:](self, "_updateMenuElementItems:withActions:view:interactionDelegate:options:", v19, v25, val, v55, a8);

    }
  }
  v27 = objc_msgSend(v20, "menuHasHeaderView");
  v28 = a8 & 1;
  v29 = MEMORY[0x1E0C809B0];
  if (v27)
  {
    v30 = (void *)MEMORY[0x1E0CEA4D8];
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = __112__DDContextMenuAction_contextMenuConfigurationWithIdentifier_inView_context_defaultAction_menuProvider_options___block_invoke;
    v71[3] = &unk_1E4258B58;
    v72 = v20;
    objc_msgSend(v30, "elementWithViewProvider:", v71);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "insertObject:atIndex:", v31, 0);

    v32 = 0;
    v33 = v72;
LABEL_19:

    goto LABEL_25;
  }
  if ((a8 & 1) != 0)
  {
    v32 = 0;
    goto LABEL_25;
  }
  -[NSAttributedString string](self->_menuTitle, "string");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v32, "length") >= 0x100)
  {
    objc_msgSend(v32, "substringToIndex:", 255);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringByAppendingString:", CFSTR("…"));
    v35 = objc_claimAutoreleasedReturnValue();

    v32 = (void *)v35;
    goto LABEL_19;
  }
LABEL_25:
  v65[0] = v29;
  v65[1] = 3221225472;
  v65[2] = __112__DDContextMenuAction_contextMenuConfigurationWithIdentifier_inView_context_defaultAction_menuProvider_options___block_invoke_2;
  v65[3] = &unk_1E4258B80;
  v66 = v19;
  v70 = v28;
  v36 = v56;
  v67 = v36;
  v49 = v32;
  v68 = v49;
  v37 = v53;
  v69 = v37;
  v51 = (void *)MEMORY[0x1A1AF3244](v65);
  if (a7)
    *a7 = (id)objc_msgSend(v51, "copy", v49);
  objc_msgSend((id)objc_opt_class(), "previewViewProviderForPreviewAction:context:", v20, v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](DDContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", v37, v38, v51);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v20, "commitURL");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setInteractionURL:", v39);

    if ((objc_msgSend(v20, "wantsSeamlessCommit") & 1) != 0
      || objc_msgSend(v20, "wantsCustomViewControllerCommit"))
    {
      v40 = dd_isDeviceLocked() ^ 1;
    }
    else
    {
      v40 = 0;
    }
    objc_msgSend(v34, "setExpandPreviewOnInteraction:", v40, v49);
    if ((_DWORD)v40)
    {
      v62[0] = v29;
      v62[1] = 3221225472;
      v62[2] = __112__DDContextMenuAction_contextMenuConfigurationWithIdentifier_inView_context_defaultAction_menuProvider_options___block_invoke_3;
      v62[3] = &unk_1E4258BA8;
      objc_copyWeak(&v64, &location);
      v63 = v20;
      objc_msgSend(v34, "setInteractionViewControllerProvider:", v62);

      objc_destroyWeak(&v64);
    }
    objc_msgSend(v34, "setPrefersActionMenuStyle:", objc_msgSend(v20, "prefersActionMenuStyle"));
  }
  if (a6)
  {
    v58[0] = v29;
    v58[1] = 3221225472;
    v58[2] = __112__DDContextMenuAction_contextMenuConfigurationWithIdentifier_inView_context_defaultAction_menuProvider_options___block_invoke_4;
    v58[3] = &unk_1E4258BD0;
    objc_copyWeak(&v61, &location);
    v41 = v52;
    v59 = v41;
    v60 = v55;
    v42 = (void *)MEMORY[0x1A1AF3244](v58);
    objc_msgSend(v41, "compactTitle");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "compactIcon");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "generateIdentifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    +[DDUIAction actionWithTitle:image:identifier:handler:](DDUIAction, "actionWithTitle:image:identifier:handler:", v43, v44, v45, v42);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v46, "setDd_action:", v41);
    objc_msgSend(v46, "setDd_handler:", v42);
    v47 = objc_retainAutorelease(v46);
    *a6 = v47;

    objc_destroyWeak(&v61);
  }

LABEL_38:
  objc_destroyWeak(&location);

  return v34;
}

uint64_t __112__DDContextMenuAction_contextMenuConfigurationWithIdentifier_inView_context_defaultAction_menuProvider_options___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "menuHeaderView");
}

id __112__DDContextMenuAction_contextMenuConfigurationWithIdentifier_inView_context_defaultAction_menuProvider_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[DDParsecAction isAvailable](DDLookupAction, "isAvailable"))
  {
    v37 = &unk_1E426BF48;
  }
  else
  {
    objc_msgSend(&unk_1E426BF48, "arrayByAddingObject:", *MEMORY[0x1E0CEB9B8]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (*(_BYTE *)(a1 + 64))
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v5 = (void *)objc_msgSend(v4, "copy");
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
    if (v6)
    {
      v7 = v6;
      v35 = a1;
      v36 = v4;
      v34 = v3;
      v8 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v51 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
          +[DDContextMenuAction identificationStringsForMenuElement:useDefault:](DDContextMenuAction, "identificationStringsForMenuElement:useDefault:", v10, 0, v34);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "firstObject");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            v48 = 0u;
            v49 = 0u;
            v46 = 0u;
            v47 = 0u;
            v13 = objc_msgSend(&unk_1E426BF60, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v47;
              while (2)
              {
                for (j = 0; j != v14; ++j)
                {
                  if (*(_QWORD *)v47 != v15)
                    objc_enumerationMutation(&unk_1E426BF60);
                  if (objc_msgSend(v12, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j)))
                  {
                    objc_msgSend(v36, "removeObject:", v10);
                    goto LABEL_21;
                  }
                }
                v14 = objc_msgSend(&unk_1E426BF60, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
                if (v14)
                  continue;
                break;
              }
            }
          }
LABEL_21:

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
      }
      while (v7);
      v3 = v34;
      v4 = v36;
      goto LABEL_44;
    }
  }
  else
  {
    v35 = a1;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v17 = v3;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v43;
      do
      {
        for (k = 0; k != v19; ++k)
        {
          if (*(_QWORD *)v43 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * k);
          +[DDContextMenuAction identificationStringsForMenuElement:useDefault:](DDContextMenuAction, "identificationStringsForMenuElement:useDefault:", v22, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "firstObject");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v24 || (objc_msgSend(v37, "containsObject:", v24) & 1) == 0)
            objc_msgSend(v4, "addObject:", v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
      }
      while (v19);
    }

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    a1 = v35;
    objc_msgSend(*(id *)(v35 + 40), "objectForKey:", CFSTR("kDDContextMenuActionsKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v39;
      do
      {
        for (m = 0; m != v26; ++m)
        {
          if (*(_QWORD *)v39 != v27)
            objc_enumerationMutation(v5);
          v29 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * m);
          +[DDContextMenuAction identificationStringsForMenuElement:useDefault:](DDContextMenuAction, "identificationStringsForMenuElement:useDefault:", v29, 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "firstObject");
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v31 || (objc_msgSend(v37, "containsObject:", v31) & 1) == 0)
            objc_msgSend(v4, "addObject:", v29);

        }
        v26 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
      }
      while (v26);
LABEL_44:
      a1 = v35;
    }
  }

  objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), v4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

id __112__DDContextMenuAction_contextMenuConfigurationWithIdentifier_inView_context_defaultAction_menuProvider_options___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "expandViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "popoverPresentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setupPopoverPresentationController:view:", v4, WeakRetained);

  return v3;
}

void __112__DDContextMenuAction_contextMenuConfigurationWithIdentifier_inView_context_defaultAction_menuProvider_options___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    +[DDContextMenuAction performAction:fromView:alertController:interactionDelegate:](DDContextMenuAction, "performAction:fromView:alertController:interactionDelegate:", *(_QWORD *)(a1 + 32), WeakRetained, 0, *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (id)initAtIndex:(unint64_t)a3 inTextStorage:(id)a4
{
  id v6;
  DDContextMenuAction *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSAttributedString *menuTitle;
  objc_super v16;

  v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DDContextMenuAction;
  v7 = -[DDContextMenuAction init](&v16, sel_init);
  if (v7)
  {
    +[DDDetectionController sharedController](DDDetectionController, "sharedController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "resultForLinkAtIndex:inTextStorage:", a3, v6);

    if (v9)
    {
      v10 = 0;
    }
    else
    {
      +[DDDetectionController sharedController](DDDetectionController, "sharedController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "linkAtIndex:inTextStorage:", a3, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[DDContextMenuAction commonInitWithResult:URL:](v7, "commonInitWithResult:URL:", v9, v10);
    +[DDDetectionController sharedController](DDDetectionController, "sharedController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "attributedTitleForResultAtIndex:ofStorage:updaterBlock:", a3, v6, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    menuTitle = v7->_menuTitle;
    v7->_menuTitle = (NSAttributedString *)v13;

  }
  return v7;
}

- (DDContextMenuAction)initWithResult:(__DDResult *)a3 URL:(id)a4
{
  id v6;
  DDContextMenuAction *v7;
  DDContextMenuAction *v8;
  void *v9;
  uint64_t v10;
  NSAttributedString *menuTitle;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)DDContextMenuAction;
  v7 = -[DDContextMenuAction init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    -[DDContextMenuAction commonInitWithResult:URL:](v7, "commonInitWithResult:URL:", a3, v6);
    if (a3)
    {
      +[DDDetectionController sharedController](DDDetectionController, "sharedController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "attributedTitleForResult:updaterBlock:", a3, 0);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      menuTitle = v8->_menuTitle;
      v8->_menuTitle = (NSAttributedString *)v10;

      goto LABEL_7;
    }
    if (v6)
    {
      +[DDDetectionController sharedController](DDDetectionController, "sharedController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "attributedTitleForURL:updaterBlock:", v6, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
LABEL_7:

  return v8;
}

- (DDContextMenuAction)initWithRVItem:(id)a3
{
  id v5;
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  DDContextMenuAction *v14;
  void *v15;
  char v16;
  void *v17;
  DDContextMenuAction *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  NSAttributedString *v28;
  NSAttributedString *menuTitle;
  objc_super v31;

  v5 = a3;
  objc_storeStrong((id *)&self->_originalItem, a3);
  switch(objc_msgSend(v5, "normalizedType"))
  {
    case 1:
      objc_msgSend(v5, "normalizedURL");
      v14 = (DDContextMenuAction *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v5, "normalizedURL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = dd_urlLooksSuspicious(v15);

        if ((v16 & 1) != 0)
          goto LABEL_13;
        objc_msgSend(v5, "normalizedURL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = self;
        v19 = 0;
        v20 = v17;
        goto LABEL_18;
      }
      break;
    case 2:
    case 6:
      v31.receiver = self;
      v31.super_class = (Class)DDContextMenuAction;
      self = -[DDContextMenuAction init](&v31, sel_init);
      if (self)
      {
        objc_msgSend(v5, "query");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "title");
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (!-[__CFString length](v7, "length"))
        {
          objc_msgSend(v5, "ddResult");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "matchedString");
          v9 = objc_claimAutoreleasedReturnValue();

          v7 = (__CFString *)v9;
        }
        if (!-[__CFString length](v7, "length"))
        {
          objc_msgSend(v5, "text");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = objc_msgSend(v5, "highlightRange");
          v13 = v12;
          if (objc_msgSend(v10, "length") && v11 + v13 <= (unint64_t)objc_msgSend(v10, "length"))
          {
            objc_msgSend(v10, "substringWithRange:", v11, v13);
            v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v7 = 0;
          }

        }
        v26 = &stru_1E4259460;
        if (v7)
          v26 = v7;
        v27 = v26;

        objc_storeStrong((id *)&self->_item, a3);
        v28 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v27);

        menuTitle = self->_menuTitle;
        self->_menuTitle = v28;

      }
      goto LABEL_24;
    case 3:
      objc_msgSend(v5, "ddResult");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "category");

      if (v22 == 1)
      {
LABEL_13:
        v14 = 0;
      }
      else
      {
        objc_msgSend(v5, "ddResult");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "type");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "isEqualToString:", *MEMORY[0x1E0D1CB38]))
          v25 = 0;
        else
          v25 = v5;
        objc_storeStrong((id *)&self->_additionalLookupItem, v25);

        objc_msgSend(v5, "ddResult");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "coreResult");
        v18 = self;
        v20 = 0;
LABEL_18:
        self = -[DDContextMenuAction initWithResult:URL:](v18, "initWithResult:URL:", v19, v20);

        v14 = self;
      }
      break;
    default:
LABEL_24:
      self = self;
      v14 = self;
      break;
  }

  return v14;
}

- (void)commonInitWithResult:(__DDResult *)a3 URL:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  if (a3)
  {
    v9 = v7;
    self->_result = (__DDResult *)CFRetain(a3);
    +[DDDetectionController sharedController](DDDetectionController, "sharedController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "interactionDidStartForResult:", a3);
LABEL_5:

    v7 = v9;
    goto LABEL_6;
  }
  if (v7)
  {
    v9 = v7;
    objc_storeStrong((id *)&self->_url, a4);
    +[DDDetectionController sharedController](DDDetectionController, "sharedController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "interactionDidStartForURL:", v9);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)dealloc
{
  __DDResult *result;
  objc_super v4;

  result = self->_result;
  if (result)
    CFRelease(result);
  v4.receiver = self;
  v4.super_class = (Class)DDContextMenuAction;
  -[DDContextMenuAction dealloc](&v4, sel_dealloc);
}

- (id)_updateMenuElementItems:(id)a3 withActions:(id)a4 view:(id)a5 interactionDelegate:(id)a6 options:(int64_t)a7
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  int v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  uint64_t v61;
  DDPlaceholderAction *v62;
  DDPlaceholderAction *v63;
  void *v65;
  void *v66;
  void *v67;
  id obj;
  void *v70;
  void *v71;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  id v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  int64_t v83;
  _QWORD v84[5];
  id v85;
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD v95[4];
  id v96;
  id v97;
  id v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  id location;
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v78 = a6;
  v70 = v10;
  v73 = v12;
  v65 = v11;
  if (v10 && objc_msgSend(v11, "count"))
  {
    objc_initWeak(&location, v12);
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    obj = v11;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v106, 16);
    if (v13)
    {
      v80 = 0;
      v83 = a7 & 5;
      v74 = *(_QWORD *)v100;
      v75 = v13;
      while (1)
      {
        v76 = 0;
        do
        {
          if (*(_QWORD *)v100 != v74)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * v76);
          objc_msgSend(v14, "firstObject", v65);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0)
          {
            if (objc_msgSend(v14, "count") == 1)
            {
              objc_msgSend(v14, "firstObject");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v20 = objc_opt_isKindOfClass();

              if ((v20 & 1) == 0)
              {
                objc_msgSend(v14, "firstObject");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if (+[DDActionController presentingBaseView:isLargeEnoughForAction:](DDActionController, "presentingBaseView:isLargeEnoughForAction:", v73, v17))
                {
                  v44 = objc_msgSend(v17, "menuItemattributes");
                  v45 = (void *)MEMORY[0x1E0CEA2A8];
                  v46 = v17;
                  objc_msgSend(v17, "localizedName");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((v44 & 1) != 0)
                  {
                    v48 = 0;
                  }
                  else
                  {
                    objc_msgSend(v17, "icon");
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    v48 = v66;
                  }
                  objc_msgSend(v46, "generateIdentifier");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  v95[0] = MEMORY[0x1E0C809B0];
                  v95[1] = 3221225472;
                  v95[2] = __92__DDContextMenuAction__updateMenuElementItems_withActions_view_interactionDelegate_options___block_invoke;
                  v95[3] = &unk_1E4258BD0;
                  objc_copyWeak(&v98, &location);
                  v58 = v46;
                  v96 = v58;
                  v97 = v78;
                  objc_msgSend(v45, "actionWithTitle:image:identifier:handler:", v47, v48, v57, v95);
                  v59 = (void *)objc_claimAutoreleasedReturnValue();

                  if ((v44 & 1) == 0)
                  objc_msgSend(v58, "subtitle");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v59, "setSubtitle:", v60);

                  objc_msgSend(v59, "setAttributes:", objc_msgSend(v58, "menuItemattributes"));
                  if (!v80)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                      v80 = 0;
                    else
                      v80 = v58;
                  }
                  objc_msgSend(v70, "addObject:", v59);

                  objc_destroyWeak(&v98);
                  v17 = v58;
                }
                goto LABEL_64;
              }
            }
            if (!objc_msgSend(v14, "count"))
              goto LABEL_65;
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v93 = 0u;
            v94 = 0u;
            v92 = 0u;
            v91 = 0u;
            v22 = v14;
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v91, v105, 16);
            if (v23)
            {
              v24 = *(_QWORD *)v92;
              do
              {
                for (i = 0; i != v23; ++i)
                {
                  if (*(_QWORD *)v92 != v24)
                    objc_enumerationMutation(v22);
                  v26 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * i);
                  if (+[DDActionController presentingBaseView:isLargeEnoughForAction:](DDActionController, "presentingBaseView:isLargeEnoughForAction:", v73, v26))
                  {
                    objc_msgSend(v21, "addObject:", v26);
                  }
                }
                v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v91, v105, 16);
              }
              while (v23);
            }

            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "firstObject");
            v27 = objc_claimAutoreleasedReturnValue();
            v89 = 0u;
            v90 = 0u;
            v87 = 0u;
            v88 = 0u;
            v77 = v21;
            v28 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v87, v104, 16);
            v71 = (void *)v27;
            if (!v28)
            {
LABEL_49:

              v40 = objc_msgSend(v71, "groupDisplayOption");
              objc_msgSend(v71, "setTreatAsMenu:", 1);
              if ((v40 & 1) != 0)
                v41 = ((unint64_t)a7 >> 2) & 1;
              else
                v41 = 1;
              v42 = (void *)MEMORY[0x1E0CEA740];
              if (v41 == 1)
              {
                objc_msgSend(v71, "localizedName");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = v67;
              }
              else
              {
                v43 = 0;
              }
              objc_msgSend(v71, "icon");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "generateIdentifier");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "menuWithTitle:image:identifier:options:children:", v43, v49, v50, v40, v79);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "addObject:", v51);

              if (v41)
              objc_msgSend(v71, "setTreatAsMenu:", 0);

              v17 = v77;
              goto LABEL_64;
            }
            v29 = *(_QWORD *)v88;
            while (2)
            {
              v30 = 0;
LABEL_28:
              if (*(_QWORD *)v88 != v29)
                objc_enumerationMutation(v77);
              v31 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v30);
              v32 = objc_msgSend(v31, "menuItemattributes");
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0
                || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
                || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v33 = (void *)MEMORY[0x1E0CEA2A8];
                if (v83 == 5)
                {
                  objc_msgSend(v31, "oneLinerLocalizedSubItemName");
                  v34 = objc_claimAutoreleasedReturnValue();
                  v82 = (void *)v34;
                  if ((v32 & 1) != 0)
                    goto LABEL_35;
LABEL_37:
                  objc_msgSend(v31, "icon");
                  v12 = (id)objc_claimAutoreleasedReturnValue();
                  v35 = v12;
                }
                else
                {
                  objc_msgSend(v31, "localizedSubItemName");
                  v34 = objc_claimAutoreleasedReturnValue();
                  v81 = (void *)v34;
                  if ((v32 & 1) == 0)
                    goto LABEL_37;
LABEL_35:
                  v35 = 0;
                }
                objc_msgSend(v31, "generateIdentifier");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v84[0] = MEMORY[0x1E0C809B0];
                v84[1] = 3221225472;
                v84[2] = __92__DDContextMenuAction__updateMenuElementItems_withActions_view_interactionDelegate_options___block_invoke_2;
                v84[3] = &unk_1E4258BD0;
                objc_copyWeak(&v86, &location);
                v84[4] = v31;
                v85 = v78;
                objc_msgSend(v33, "actionWithTitle:image:identifier:handler:", v34, v35, v36, v84);
                v37 = (void *)objc_claimAutoreleasedReturnValue();

                if ((v32 & 1) == 0)
                v38 = v82;
                if (v83 != 5)
                  v38 = v81;

                objc_msgSend(v31, "subtitle");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "setSubtitle:", v39);

                objc_msgSend(v37, "setAttributes:", objc_msgSend(v31, "menuItemattributes"));
                if (!v80)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    v80 = 0;
                  else
                    v80 = v31;
                }
                objc_msgSend(v79, "addObject:", v37);

                objc_destroyWeak(&v86);
              }
              if (v28 == ++v30)
              {
                v28 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v87, v104, 16);
                if (!v28)
                  goto LABEL_49;
                continue;
              }
              goto LABEL_28;
            }
          }
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[DDContextMenuAction _updateMenuElementItems:withActions:view:interactionDelegate:options:](self, "_updateMenuElementItems:withActions:view:interactionDelegate:options:");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            if (!v80)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v80 = 0;
              else
                v80 = v18;
            }
            objc_msgSend(v18, "setTreatAsMenu:", 1);
            v52 = (void *)MEMORY[0x1E0CEA740];
            objc_msgSend(v18, "menuName");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "menuIcon");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "generateIdentifier");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "menuWithTitle:image:identifier:options:children:", v53, v54, v55, 0, v17);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "addObject:", v56);

            objc_msgSend(v18, "setTreatAsMenu:", 0);
          }

LABEL_64:
LABEL_65:
          ++v76;
        }
        while (v76 != v75);
        v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v106, 16);
        v75 = v61;
        if (!v61)
          goto LABEL_79;
      }
    }
    v80 = 0;
LABEL_79:

    if ((a7 & 2) != 0 && objc_msgSend(v80, "isMemberOfClass:", objc_opt_class()))
      v63 = objc_alloc_init(DDPlaceholderAction);
    else
      v63 = (DDPlaceholderAction *)v80;
    v62 = v63;
    objc_destroyWeak(&location);

  }
  else
  {
    v62 = 0;
  }

  return v62;
}

void __92__DDContextMenuAction__updateMenuElementItems_withActions_view_interactionDelegate_options___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  +[DDContextMenuAction performAction:fromView:alertController:interactionDelegate:](DDContextMenuAction, "performAction:fromView:alertController:interactionDelegate:", *(_QWORD *)(a1 + 32), WeakRetained, 0, *(_QWORD *)(a1 + 40));

}

void __92__DDContextMenuAction__updateMenuElementItems_withActions_view_interactionDelegate_options___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  +[DDContextMenuAction performAction:fromView:alertController:interactionDelegate:](DDContextMenuAction, "performAction:fromView:alertController:interactionDelegate:", *(_QWORD *)(a1 + 32), WeakRetained, 0, *(_QWORD *)(a1 + 40));

}

+ (id)previewActionForResult:(__DDResult *)a3 URL:(id)a4 context:(id)a5
{
  unint64_t v7;
  id v8;
  int Category;
  const __CFString *Type;
  uint64_t v11;
  __objc2_class *v12;
  __objc2_class *v13;
  void *v14;
  id v15;
  unint64_t v16;
  __DDResult *v17;

  v7 = (unint64_t)a4;
  v8 = a5;
  if (!((unint64_t)a3 | v7))
  {
    +[DDPreviewAction previewActionForURL:result:context:](DDPreviewAction, "previewActionForURL:result:context:", 0, 0, v8);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_60:
    v14 = (void *)v11;
    goto LABEL_61;
  }
  if (a3)
  {
    Category = DDResultGetCategory();
    switch(Category)
    {
      case 0:
      case 5:
        Type = (const __CFString *)DDResultGetType();
        if (CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E0D1CBA0], 0) == kCFCompareEqualTo
          || CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E0D1CAF0], 0) == kCFCompareEqualTo)
        {
          v13 = DDURLPreviewAction;
          goto LABEL_58;
        }
        if (CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E0D1CAB8], 0) == kCFCompareEqualTo)
        {
          v13 = DDFlightPreviewAction;
          goto LABEL_58;
        }
        if (CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E0D1CB38], 0) == kCFCompareEqualTo
          || CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E0D1CA58], 0) == kCFCompareEqualTo)
        {
          v13 = DDParsecPreviewAction;
          goto LABEL_58;
        }
        if (CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E0D1CA38], 0) == kCFCompareEqualTo)
          goto LABEL_23;
        if (CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E0D1CB48], 0) == kCFCompareEqualTo)
        {
          v13 = DDConversionPreviewAction;
          goto LABEL_58;
        }
        if (CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E0D1CB28], 0)
          && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          +[DDContextMenuAction previewActionForResult:URL:context:].cold.2((uint64_t)Type);
        }
        goto LABEL_23;
      case 1:
        if (+[DDNewsPreviewAction handlesUrl:result:](DDNewsPreviewAction, "handlesUrl:result:", 0, a3))
        {
          v13 = DDNewsPreviewAction;
        }
        else if (+[DDAppleStorePreviewAction handlesUrl:result:](DDAppleStorePreviewAction, "handlesUrl:result:", 0, a3))
        {
          v13 = DDAppleStorePreviewAction;
        }
        else if (+[DDMapAction handlesUrl:result:](DDMapAction, "handlesUrl:result:", 0, a3))
        {
          v13 = DDMapAction;
        }
        else if (+[DDURLPreviewAction handlesUrl:result:](DDURLPreviewAction, "handlesUrl:result:", 0, a3))
        {
          v13 = DDURLPreviewAction;
        }
        else if (+[DDChatBotAction handlesUrl:result:](DDChatBotAction, "handlesUrl:result:", 0, a3))
        {
          v13 = DDChatBotAction;
        }
        else if (+[DDPersonAction handlesUrl:result:](DDPersonAction, "handlesUrl:result:", 0, a3))
        {
          v13 = DDPersonAction;
        }
        else
        {
          v14 = 0;
          if (!+[DDGenericURLPreviewAction handlesUrl:result:](DDGenericURLPreviewAction, "handlesUrl:result:", 0, a3))goto LABEL_61;
          v13 = DDGenericURLPreviewAction;
        }
LABEL_58:
        v15 = [v13 alloc];
        v16 = 0;
        v17 = a3;
        break;
      case 2:
        v13 = DDPersonAction;
        goto LABEL_58;
      case 3:
        v13 = DDMapAction;
        goto LABEL_58;
      case 4:
        v13 = DDTimeLineAction;
        goto LABEL_58;
      case 6:
        v13 = DDMoneyPreviewAction;
        goto LABEL_58;
      default:
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          +[DDContextMenuAction previewActionForResult:URL:context:].cold.1((uint64_t)a3, Category);
        goto LABEL_23;
    }
    goto LABEL_59;
  }
  if (v7)
  {
    if (+[DDClientPreviewAction clientCanPerformActionWithUrl:](DDClientPreviewAction, "clientCanPerformActionWithUrl:", v7))
    {
      v12 = DDClientPreviewAction;
LABEL_55:
      v15 = [v12 alloc];
      v16 = v7;
      v17 = 0;
LABEL_59:
      v11 = objc_msgSend(v15, "initWithURL:result:context:", v16, v17, v8);
      goto LABEL_60;
    }
    if (+[DDNewsPreviewAction handlesUrl:result:](DDNewsPreviewAction, "handlesUrl:result:", v7, 0))
    {
      v12 = DDNewsPreviewAction;
      goto LABEL_55;
    }
    if (+[DDAppleStorePreviewAction handlesUrl:result:](DDAppleStorePreviewAction, "handlesUrl:result:", v7, 0))
    {
      v12 = DDAppleStorePreviewAction;
      goto LABEL_55;
    }
    if (+[DDMapAction handlesUrl:result:](DDMapAction, "handlesUrl:result:", v7, 0))
    {
      v12 = DDMapAction;
      goto LABEL_55;
    }
    if (+[DDURLPreviewAction handlesUrl:result:](DDURLPreviewAction, "handlesUrl:result:", v7, 0))
    {
      v12 = DDURLPreviewAction;
      goto LABEL_55;
    }
    if (+[DDChatBotAction handlesUrl:result:](DDChatBotAction, "handlesUrl:result:", v7, 0))
    {
      v12 = DDChatBotAction;
      goto LABEL_55;
    }
    if (+[DDPersonAction handlesUrl:result:](DDPersonAction, "handlesUrl:result:", v7, 0))
    {
      v12 = DDPersonAction;
      goto LABEL_55;
    }
    v14 = 0;
    if (+[DDGenericURLPreviewAction handlesUrl:result:](DDGenericURLPreviewAction, "handlesUrl:result:", v7, 0))
    {
      v12 = DDGenericURLPreviewAction;
      goto LABEL_55;
    }
  }
  else
  {
LABEL_23:
    v14 = 0;
  }
LABEL_61:

  return v14;
}

+ (void)performDefaultActionWithResult:(__DDResult *)a3 inView:(id)a4 atLocation:(CGPoint)a5 withMenuInteraction:(id)a6 context:(id)a7
{
  double y;
  double x;
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;

  y = a5.y;
  x = a5.x;
  v12 = (objc_class *)MEMORY[0x1E0D87C60];
  v13 = a7;
  v14 = a6;
  v15 = a4;
  v16 = [v12 alloc];
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1CE68]), "initWithCoreResult:", a3);
  v18 = (id)objc_msgSend(v16, "initWithDDResult:", v17);

  +[DDRevealBridge _revealItem:view:location:menuInteraction:context:](DDRevealBridge, "_revealItem:view:location:menuInteraction:context:", v18, v15, v14, v13, x, y);
}

+ (void)performDefaultActionWithURL:(id)a3 inView:(id)a4 atLocation:(CGPoint)a5 withMenuInteraction:(id)a6 context:(id)a7
{
  double y;
  double x;
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;

  y = a5.y;
  x = a5.x;
  v12 = (objc_class *)MEMORY[0x1E0D87C60];
  v13 = a7;
  v14 = a6;
  v15 = a4;
  v16 = a3;
  v17 = [v12 alloc];
  objc_msgSend(v16, "absoluteString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v17, "initWithURL:rangeInContext:", v16, 0, objc_msgSend(v18, "length"));

  +[DDRevealBridge _revealItem:view:location:menuInteraction:context:](DDRevealBridge, "_revealItem:view:location:menuInteraction:context:", v19, v15, v14, v13, x, y);
}

+ (id)previewViewProviderForURL:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a1, "previewActionForResult:URL:context:", 0, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "previewViewProviderForPreviewAction:context:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)previewViewProviderForResult:(__DDResult *)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a1, "previewActionForResult:URL:context:", a3, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "previewViewProviderForPreviewAction:context:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalLookupItem, 0);
  objc_storeStrong((id *)&self->_menuTitle, 0);
  objc_storeStrong((id *)&self->_originalItem, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

+ (void)validateContext:silent:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Requesting a DDContextMenuConfiguration without a source rect is invalid. See +[DDContextMenuConfiguration updateContext:withSourceRect:]", v0, 2u);
}

+ (void)previewActionForResult:(uint64_t)a1 URL:(int)a2 context:.cold.1(uint64_t a1, int a2)
{
  _DWORD v2[2];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109378;
  v2[1] = a2;
  v3 = 2112;
  v4 = a1;
  _os_log_error_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unknown DDResult category %d for result %@; could not find any actions",
    (uint8_t *)v2,
    0x12u);
}

+ (void)previewActionForResult:(uint64_t)a1 URL:context:.cold.2(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unknown result type %@ in the Misc category; no actions found",
    (uint8_t *)&v1,
    0xCu);
}

@end
