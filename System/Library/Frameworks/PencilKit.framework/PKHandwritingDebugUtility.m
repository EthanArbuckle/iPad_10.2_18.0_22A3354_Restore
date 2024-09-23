@implementation PKHandwritingDebugUtility

+ (id)lassoDrawingFromTiledView:(id)a3
{
  id v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  PKDrawing *v11;
  void *v12;
  void *v13;
  void *v14;
  PKDrawing *v15;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_8;
  objc_msgSend(v3, "selectionController");
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5[15];

    if (v6)
    {
      objc_msgSend(v4, "selectionController");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (v7)
        v9 = *(void **)(v7 + 120);
      else
        v9 = 0;
      v10 = v9;
      v11 = [PKDrawing alloc];
      objc_msgSend(v10, "strokes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "drawing");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[PKDrawing initWithStrokes:fromDrawing:](v11, "initWithStrokes:fromDrawing:", v13, v14);

      goto LABEL_7;
    }
LABEL_8:
    v15 = 0;
    goto LABEL_9;
  }
  v8 = 0;
  v15 = 0;
LABEL_7:

LABEL_9:
  return v15;
}

+ (id)localeIdentifiersFromDrawings:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v8, "recognitionSession");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v8, "recognitionSession");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "preferredLocales");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "localeIdentifier", (_QWORD)v21);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v18);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v15);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (void)presentHandwritingDebugViewFromViewController:(id)a3 allDrawings:(id)a4 tiledView:(id)a5
{
  id v8;
  id v9;
  id v10;
  double Width;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  _QWORD aBlock[4];
  id v53;
  id v54;
  _QWORD v55[2];
  _QWORD v56[4];
  CGRect v57;

  v56[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "frame");
  Width = CGRectGetWidth(v57);
  objc_msgSend(a1, "localeIdentifiersFromDrawings:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = CFSTR("viewWidth");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", Width);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = CFSTR("localeIdentifiers");
  v56[0] = v13;
  v56[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "lassoDrawingFromTiledView:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__PKHandwritingDebugUtility_presentHandwritingDebugViewFromViewController_allDrawings_tiledView___block_invoke;
  aBlock[3] = &unk_1E7778E78;
  v16 = v14;
  v53 = v16;
  v17 = v8;
  v54 = v17;
  v18 = _Block_copy(aBlock);
  v19 = v18;
  if (v15)
  {
    v20 = (void *)MEMORY[0x1E0DC3450];
    _PencilKitBundle();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Handwriting Feedback"), CFSTR("Handwriting Feedback"), CFSTR("Localizable"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    _PencilKitBundle();
    v43 = v12;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Do you want to include only your current selection or all drawings from this note?"), CFSTR("Do you want to include only your current selection or all drawings from this note?"), CFSTR("Localizable"));
    v42 = v16;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "alertControllerWithTitle:message:preferredStyle:", v22, v24, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)MEMORY[0x1E0DC3448];
    _PencilKitBundle();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Include Selection Only"), CFSTR("Include Selection Only"), CFSTR("Localizable"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = MEMORY[0x1E0C809B0];
    v41 = v17;
    v29 = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __97__PKHandwritingDebugUtility_presentHandwritingDebugViewFromViewController_allDrawings_tiledView___block_invoke_2;
    v49[3] = &unk_1E7778EA0;
    v30 = v19;
    v51 = v30;
    v50 = v15;
    objc_msgSend(v26, "actionWithTitle:style:handler:", v28, 0, v49);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addAction:", v31);

    v32 = (void *)MEMORY[0x1E0DC3448];
    _PencilKitBundle();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Include All Drawings"), CFSTR("Include All Drawings"), CFSTR("Localizable"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v29;
    v46[1] = 3221225472;
    v46[2] = __97__PKHandwritingDebugUtility_presentHandwritingDebugViewFromViewController_allDrawings_tiledView___block_invoke_3;
    v46[3] = &unk_1E7778EA0;
    v48 = v30;
    v47 = v9;
    objc_msgSend(v32, "actionWithTitle:style:handler:", v34, 0, v46);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addAction:", v35);

    v36 = (void *)MEMORY[0x1E0DC3448];
    _PencilKitBundle();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("Cancel handwriting feedback"), CFSTR("Cancel"), CFSTR("Localizable"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v29;
    v17 = v41;
    v44[1] = 3221225472;
    v44[2] = __97__PKHandwritingDebugUtility_presentHandwritingDebugViewFromViewController_allDrawings_tiledView___block_invoke_4;
    v44[3] = &unk_1E7778EC8;
    v45 = v25;
    v39 = v25;
    objc_msgSend(v36, "actionWithTitle:style:handler:", v38, 1, v44);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addAction:", v40);

    v12 = v43;
    v16 = v42;
    objc_msgSend(v41, "presentViewController:animated:completion:", v39, 1, 0);

  }
  else
  {
    (*((void (**)(void *, id))v18 + 2))(v18, v9);
  }

}

void __97__PKHandwritingDebugUtility_presentHandwritingDebugViewFromViewController_allDrawings_tiledView___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *v5;

  v3 = a2;
  v5 = -[PKHandwritingDataCollectionViewController initWithDrawings:metadata:]([PKHandwritingDataCollectionViewController alloc], v3, *(void **)(a1 + 32));

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v5);
  objc_msgSend(v4, "setModalPresentationStyle:", 2);
  objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v4, 1, 0);

}

void __97__PKHandwritingDebugUtility_presentHandwritingDebugViewFromViewController_allDrawings_tiledView___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 40);
  v3[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

}

uint64_t __97__PKHandwritingDebugUtility_presentHandwritingDebugViewFromViewController_allDrawings_tiledView___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __97__PKHandwritingDebugUtility_presentHandwritingDebugViewFromViewController_allDrawings_tiledView___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

+ (void)submitFeedbackWithAttachments:(id)a3 title:(id)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("PKShouldForceFeedbackAssistant"));

  if ((v8 & 1) == 0 && (os_variant_has_internal_diagnostics() & 1) != 0)
    objc_msgSend(a1, "openTapToRadarWithAttachments:title:", v9, v6);
  else
    objc_msgSend(a1, "openAppleFeedbackAssistantWithAttachments:", v9);

}

+ (void)openTapToRadarWithAttachments:(id)a3 title:(id)a4
{
  id v5;
  id v6;
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
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  id v31;

  v31 = a3;
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v6, "setScheme:", CFSTR("tap-to-radar"));
  objc_msgSend(v6, "setHost:", CFSTR("new"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ComponentName"), CFSTR("Handwriting"));
  objc_msgSend(v7, "addObject:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ComponentVersion"), CFSTR("iOS"));
  objc_msgSend(v7, "addObject:", v9);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ComponentID"), CFSTR("391023"));
  objc_msgSend(v7, "addObject:", v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("AutoDiagnostics"), CFSTR("1"));
  objc_msgSend(v7, "addObject:", v11);

  v30 = v5;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Title"), v5);
  objc_msgSend(v7, "addObject:", v12);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Keywords"), CFSTR("852187"));
  objc_msgSend(v7, "addObject:", v13);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Classification"), CFSTR("Other Bug"));
  objc_msgSend(v7, "addObject:", v14);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Reproducibility"), CFSTR("Not Applicable"));
  objc_msgSend(v7, "addObject:", v15);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "count"))
  {
    v18 = 0;
    do
    {
      objc_msgSend(v31, "objectAtIndexedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "pathExtension");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "compare:options:", CFSTR("png"), 1);

      if (v22)
        v23 = v16;
      else
        v23 = v17;
      objc_msgSend(v23, "addObject:", v20);

      ++v18;
    }
    while (objc_msgSend(v31, "count") > v18);
  }
  if (objc_msgSend(v17, "count"))
  {
    objc_msgSend(v17, "componentsJoinedByString:", CFSTR(","));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Screenshot"), v24);
    objc_msgSend(v7, "addObject:", v25);

  }
  if (objc_msgSend(v16, "count"))
  {
    objc_msgSend(v16, "componentsJoinedByString:", CFSTR(","));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Attachments"), v26);
    objc_msgSend(v7, "addObject:", v27);

  }
  objc_msgSend(v6, "setQueryItems:", v7);
  objc_msgSend(v6, "URL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "openURL:", v28);

}

+ (void)openAppleFeedbackAssistantWithAttachments:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
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
  id v19;
  void *v20;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v9, "pathComponents");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attach[%@]"), v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v9, "path");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@"), v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", v12, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v16);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("answers[:area]"), CFSTR("seedios:notes"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v17);

  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("answers[:handwriting_sample]"), CFSTR("Yes"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v18);

  v19 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v19, "setScheme:", CFSTR("applefeedback"));
  objc_msgSend(v19, "setHost:", CFSTR("new"));
  objc_msgSend(v19, "setQueryItems:", v4);
  objc_msgSend(v19, "URL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "openURL:", v20);

}

+ (void)openURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[objc_class sharedApplication](NSClassFromString(CFSTR("UIApplication")), "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0C99DB8];
    objc_msgSend(v3, "methodSignatureForSelector:", sel_openURL_options_completionHandler_);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invocationWithMethodSignature:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setSelector:", sel_openURL_options_completionHandler_);
    objc_msgSend(v7, "setArgument:atIndex:", &v8, 2);
    objc_msgSend(v7, "invokeWithTarget:", v4);

  }
}

@end
