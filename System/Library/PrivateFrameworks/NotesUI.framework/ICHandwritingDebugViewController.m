@implementation ICHandwritingDebugViewController

- (ICHandwritingDebugViewController)initWithDelegate:(id)a3
{
  id v4;
  ICHandwritingDebugViewController *v5;
  ICHandwritingDebugViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICHandwritingDebugViewController;
  v5 = -[ICHandwritingDebugViewController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)ICHandwritingDebugViewController;
  -[ICHandwritingDebugViewController viewDidLoad](&v22, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0DC3E50]);
  -[ICHandwritingDebugViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = (void *)objc_msgSend(v3, "initWithFrame:");
  -[ICHandwritingDebugViewController setTextView:](self, "setTextView:", v5);

  -[ICHandwritingDebugViewController textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEditable:", 0);

  -[ICHandwritingDebugViewController textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[ICHandwritingDebugViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICHandwritingDebugViewController textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v9);

  -[ICHandwritingDebugViewController textView](self, "textView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ic_addAnchorsToFillSuperview");

  -[ICHandwritingDebugViewController textView](self, "textView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextContainerInset:", 0.0, 12.0, 0.0, 12.0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  -[ICHandwritingDebugViewController setActivityIndicator:](self, "setActivityIndicator:", v12);

  -[ICHandwritingDebugViewController activityIndicator](self, "activityIndicator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidesWhenStopped:", 1);

  v14 = objc_alloc(MEMORY[0x1E0DC34F0]);
  -[ICHandwritingDebugViewController activityIndicator](self, "activityIndicator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithCustomView:", v15);

  objc_msgSend(v16, "setEnabled:", 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 13, self, sel_refresh);
  v23[0] = v17;
  v23[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICHandwritingDebugViewController navigationItem](self, "navigationItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setRightBarButtonItems:", v18);

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_close);
  -[ICHandwritingDebugViewController navigationItem](self, "navigationItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setLeftBarButtonItem:", v20);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ICHandwritingDebugViewController;
  -[ICHandwritingDebugViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  -[ICHandwritingDebugViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNavigationBarHidden:animated:", 0, v3);

  -[ICHandwritingDebugViewController refresh](self, "refresh");
}

- (OS_dispatch_queue)recognitionQueue
{
  OS_dispatch_queue *recognitionQueue;
  NSObject *v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *v6;

  recognitionQueue = self->_recognitionQueue;
  if (!recognitionQueue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.notes.debug-recognition-queue", v4);
    v6 = self->_recognitionQueue;
    self->_recognitionQueue = v5;

    recognitionQueue = self->_recognitionQueue;
  }
  return recognitionQueue;
}

- (void)refresh
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[ICHandwritingDebugViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "drawingsForHandwritingDebug");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICHandwritingDebugViewController setDrawings:](self, "setDrawings:", v4);

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[ICHandwritingDebugViewController drawings](self, "drawings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v10, "visualizationManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "recognitionStatusReportingEnabled");

        if ((v12 & 1) == 0)
        {
          objc_msgSend(v10, "visualizationManager");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setRecognitionStatusReportingEnabled:", 1);

          objc_msgSend(v10, "visualizationManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setDelegate:", self);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v7);
  }

  v15 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    -[ICHandwritingDebugViewController drawings](self, "drawings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    *(_DWORD *)buf = 134217984;
    v29 = v17;
    _os_log_impl(&dword_1AC7A1000, v15, OS_LOG_TYPE_DEFAULT, "Refreshing handwriting debug view with %ld drawings", buf, 0xCu);

  }
  -[ICHandwritingDebugViewController drawings](self, "drawings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copy");

  -[ICHandwritingDebugViewController recognitionQueue](self, "recognitionQueue");
  v20 = objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __43__ICHandwritingDebugViewController_refresh__block_invoke;
  v22[3] = &unk_1E5C1D9A8;
  v22[4] = self;
  v23 = v19;
  v21 = v19;
  dispatch_async(v20, v22);

}

void __43__ICHandwritingDebugViewController_refresh__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
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
  id v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id obj;
  void *v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  _QWORD v50[5];
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD block[5];
  _BYTE v61[128];
  _BYTE v62[128];
  _QWORD v63[2];
  _QWORD v64[2];
  _QWORD v65[2];
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[3];
  _QWORD v70[5];

  v70[3] = *MEMORY[0x1E0C80C00];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__ICHandwritingDebugViewController_refresh__block_invoke_2;
  block[3] = &unk_1E5C1D540;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  v45 = objc_msgSend(*(id *)(a1 + 40), "count");
  v69[0] = *MEMORY[0x1E0DC1138];
  v2 = v69[0];
  objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 16.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_fontWithSingleLineA");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DC1248];
  v70[0] = v4;
  v70[1] = &unk_1E5C71E68;
  v6 = *MEMORY[0x1E0DC1140];
  v69[1] = v5;
  v69[2] = v6;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v70[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 3);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v67[0] = v2;
  objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 14.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ic_fontWithSingleLineA");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = v6;
  v68[0] = v9;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v68[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v65[0] = v2;
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ic_fontWithSingleLineA");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v65[1] = v6;
  v66[0] = v12;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v63[0] = v2;
  objc_msgSend(MEMORY[0x1E0DC1350], "italicSystemFontOfSize:", 14.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ic_fontWithSingleLineA");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v6;
  v64[0] = v15;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v40 = a1;
  obj = *(id *)(a1 + 40);
  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
  if (v46)
  {
    v44 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v46; ++i)
      {
        if (*(_QWORD *)v57 != v44)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        if ((objc_msgSend(v19, "recognitionEnabled") & 1) == 0)
          objc_msgSend(v19, "setRecognitionEnabled:", 1);
        if (v45 >= 2)
        {
          v20 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v19, "uuid");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "localizedStringWithFormat:", CFSTR("%@:\n\n"), v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v22, v41);
          objc_msgSend(v17, "appendAttributedString:", v23);

        }
        objc_msgSend(v19, "visualizationManager");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        objc_msgSend(MEMORY[0x1E0CD12C0], "availableRecognitionStatusKeys");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
        if (!v26)
        {

LABEL_27:
          v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("No results"), v43);
          objc_msgSend(v17, "appendAttributedString:", v36);

          goto LABEL_28;
        }
        v27 = v26;
        v47 = i;
        v28 = 0;
        v29 = *(_QWORD *)v53;
        do
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v53 != v29)
              objc_enumerationMutation(v25);
            v31 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j);
            objc_msgSend(MEMORY[0x1E0CD12C0], "localizedNameForRecognitionStatusKey:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (v32)
              v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v32, v49);
            else
              v33 = 0;
            objc_msgSend(v24, "valueForRecognitionStatusKey:", v31);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (v34)
            {
              v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v34, v48);
              if (v33)
              {
                objc_msgSend(v17, "appendAttributedString:", v33);
                objc_msgSend(v17, "ic_appendString:", CFSTR("\n"));
              }
              objc_msgSend(v17, "appendAttributedString:", v35);
              objc_msgSend(v17, "ic_appendString:", CFSTR("\n\n"));

              v28 = 1;
            }

          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
        }
        while (v27);

        i = v47;
        if ((v28 & 1) == 0)
          goto LABEL_27;
LABEL_28:
        objc_msgSend(v17, "ic_appendString:", CFSTR("\n\n"));

      }
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    }
    while (v46);
  }

  if (!objc_msgSend(*(id *)(v40 + 40), "count") || !objc_msgSend(v17, "length"))
  {
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("No inline drawings"), v43);
    objc_msgSend(v17, "appendAttributedString:", v37);

  }
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __43__ICHandwritingDebugViewController_refresh__block_invoke_38;
  v50[3] = &unk_1E5C1D9A8;
  v50[4] = *(_QWORD *)(v40 + 32);
  v51 = v17;
  v38 = v17;
  v39 = (void *)MEMORY[0x1E0C80D38];
  dispatch_sync(MEMORY[0x1E0C80D38], v50);

}

void __43__ICHandwritingDebugViewController_refresh__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "activityIndicator");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "startAnimating");

}

void __43__ICHandwritingDebugViewController_refresh__block_invoke_38(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttributedText:", v2);

  objc_msgSend(*(id *)(a1 + 32), "activityIndicator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAnimating");

}

- (void)close
{
  id v2;

  -[ICHandwritingDebugViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handwritingDebugShouldClose");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (ICHandwritingDebugDelegate)delegate
{
  return (ICHandwritingDebugDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)drawings
{
  return self->_drawings;
}

- (void)setDrawings:(id)a3
{
  objc_storeStrong((id *)&self->_drawings, a3);
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (void)setRecognitionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_recognitionQueue, a3);
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_recognitionQueue, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_drawings, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
