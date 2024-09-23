@implementation QLTextItemViewController

- (id)displayedDocumentURLForItem:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[QLTextItemViewController shouldEditByCreatingCopy](self, "shouldEditByCreatingCopy"))
    objc_msgSend(v4, "editedFileURL");
  else
    objc_msgSend(v4, "saveURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)openDocumentWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  _QWORD v6[5];
  void (**v7)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  if (-[QLTextItemViewController isDocumentOpen](self, "isDocumentOpen"))
  {
    v4[2](v4, 1);
  }
  else
  {
    -[QLTextItemViewController textDocument](self, "textDocument");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __78__QLTextItemViewController_FilePresenting__openDocumentWithCompletionHandler___block_invoke;
    v6[3] = &unk_24C7253E8;
    v6[4] = self;
    v7 = v4;
    objc_msgSend(v5, "openWithCompletionHandler:", v6);

  }
}

uint64_t __78__QLTextItemViewController_FilePresenting__openDocumentWithCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);
    v5 = *MEMORY[0x24BEBE130];
    objc_msgSend(v4, "textDocument");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v4, sel_textDocumentChangedRemotely_, v5, v6);

    objc_msgSend(*(id *)(a1 + 32), "_loadDocumentContent");
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)closeDocumentWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[QLTextItemViewController _saveDocumentContentIfNeeded](self, "_saveDocumentContentIfNeeded");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BEBE130], 0);

  -[QLTextItemViewController textDocument](self, "textDocument");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "closeWithCompletionHandler:", v4);

}

- (void)_loadDocumentContent
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  -[QLTextItemViewController textDocument](self, "textDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasRichContent");

  -[QLTextItemViewController textDocument](self, "textDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "attributedTextContent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLTextItemViewController textView](self, "textView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAttributedText:", v7);

    -[QLTextItemViewController textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v9;
    v10 = 1;
  }
  else
  {
    objc_msgSend(v5, "textContent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLTextItemViewController textView](self, "textView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v11);

    -[QLTextItemViewController textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v9;
    v10 = 0;
  }
  objc_msgSend(v9, "setAllowsEditingTextAttributes:", v10);

}

- (void)_saveDocumentContentIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  -[QLTextItemViewController textDocument](self, "textDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedTextContent");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[QLTextItemViewController textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributedText");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v5)
  {
    -[QLTextItemViewController textDocument](self, "textDocument");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "saveWithTextContent:", v5);

  }
}

- (void)textDocumentChangedRemotely:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[QLTextItemViewController textDocument](self, "textDocument");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v4)
  {
    -[QLTextItemViewController textDocument](self, "textDocument");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "documentState");

    if (v6 != 2)
      -[QLTextItemViewController _loadDocumentContent](self, "_loadDocumentContent");
  }
  else
  {

  }
}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v7 = a3;
  v11 = a4;
  v12 = a5;
  v8 = v12;
  v9 = v11;
  v10 = v7;
  QLRunInMainThread();

}

void __88__QLTextItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke(id *a1)
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  int v5;
  id *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void (**v12)(id, _QWORD);
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  objc_msgSend(a1[4], "setupTextView:", objc_msgSend(a1[4], "_isContentPotentiallySuspicious:context:", a1[5], a1[6]));
  objc_msgSend(a1[5], "string");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v4 = (void *)v3[138];
  v3[138] = v2;

  *((_BYTE *)a1[4] + 1128) = 0;
  v5 = _os_feature_enabled_impl();
  v6 = (id *)a1[4];
  if (v5)
  {
    objc_msgSend(a1[6], "item");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUpDocumentWithItem:", v7);

    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __88__QLTextItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_2;
    v14[3] = &unk_24C725528;
    v8 = a1[4];
    v9 = a1[5];
    v10 = a1[4];
    v15 = v9;
    v16 = v10;
    v17 = a1[7];
    objc_msgSend(v8, "openDocumentWithCompletionHandler:", v14);

  }
  else
  {
    objc_msgSend(v6[143], "textStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAttributedString:", *((_QWORD *)a1[4] + 138));

    objc_msgSend(a1[5], "attributes");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "_setupTextViewWithDocumentAttributes:");
    v12 = (void (**)(id, _QWORD))a1[7];
    if (v12)
      v12[2](v12, 0);

  }
}

uint64_t __88__QLTextItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  uint64_t result;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "attributes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_setupTextViewWithDocumentAttributes:", v3);
    objc_msgSend(*(id *)(a1 + 40), "setUpTextInputShortcutsBar");

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)setupTextView:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  UITextView *v6;
  UITextView *textView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *leftConstraint;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  NSLayoutConstraint *v24;
  NSLayoutConstraint *rightConstraint;
  void *v26;
  void *v27;
  UITextView *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  _QWORD v32[2];

  v3 = a3;
  v32[1] = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc(MEMORY[0x24BEBDA88]);
  v6 = (UITextView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  textView = self->_textView;
  self->_textView = v6;

  -[UITextView setEditable:](self->_textView, "setEditable:", -[QLTextItemViewController shouldAllowEditingContents](self, "shouldAllowEditingContents"));
  -[UITextView setDelegate:](self->_textView, "setDelegate:", self);
  -[UITextView setContentInsetAdjustmentBehavior:](self->_textView, "setContentInsetAdjustmentBehavior:", 2);
  -[UITextView setFindInteractionEnabled:](self->_textView, "setFindInteractionEnabled:", 1);
  -[UITextView setKeyboardDismissMode:](self->_textView, "setKeyboardDismissMode:", 2);
  -[UITextView textLayoutManager](self->_textView, "textLayoutManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLimitsLayoutForSuspiciousContents:", v3);

  -[QLTextItemViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", self->_textView);

  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITextView leftAnchor](self->_textView, "leftAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLTextItemViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leftAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLItemViewController appearance](self, "appearance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "peripheryInsets");
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "ql_activatedConstraint");
  v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  leftConstraint = self->_leftConstraint;
  self->_leftConstraint = v16;

  -[QLTextItemViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "rightAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView rightAnchor](self->_textView, "rightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLItemViewController appearance](self, "appearance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "peripheryInsets");
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "ql_activatedConstraint");
  v24 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  rightConstraint = self->_rightConstraint;
  self->_rightConstraint = v24;

  -[QLTextItemViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)MEMORY[0x24BDD1628];
  v28 = self->_textView;
  v31 = CFSTR("textView");
  v32[0] = v28;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[textView]|"), 0, 0, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addConstraints:", v30);

}

- (UIEdgeInsets)customEdgeInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  -[QLItemViewController appearance](self, "appearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "presentationMode") == 4)
  {
    v4 = *MEMORY[0x24BEBE158];
    v3 = *(double *)(MEMORY[0x24BEBE158] + 8);
    v6 = *(double *)(MEMORY[0x24BEBE158] + 16);
    v5 = *(double *)(MEMORY[0x24BEBE158] + 24);
  }
  else
  {
    objc_msgSend(v2, "peripheryInsets");
    v4 = v7;
    v3 = v8;
    v6 = v9;
    v5 = v10;
  }
  objc_msgSend(v2, "topInset");
  if (v4 < v11)
    v4 = v11;
  objc_msgSend(v2, "bottomInset");
  if (v6 < v12)
    v6 = v12;

  v13 = v4;
  v14 = v3;
  v15 = v6;
  v16 = v5;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)previewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (_os_feature_enabled_impl())
    -[QLTextItemViewController openDocumentWithCompletionHandler:](self, "openDocumentWithCompletionHandler:", &__block_literal_global_2);
  v5.receiver = self;
  v5.super_class = (Class)QLTextItemViewController;
  -[QLItemViewController previewWillAppear:](&v5, sel_previewWillAppear_, v3);
}

- (void)previewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (_os_feature_enabled_impl())
    -[QLTextItemViewController closeDocumentWithCompletionHandler:](self, "closeDocumentWithCompletionHandler:", &__block_literal_global_11);
  v5.receiver = self;
  v5.super_class = (Class)QLTextItemViewController;
  -[QLItemViewController previewWillDisappear:](&v5, sel_previewWillDisappear_, v3);
}

- (BOOL)_isContentPotentiallySuspicious:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[5];

  v25[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = *MEMORY[0x24BDF8670];
  v25[0] = *MEMORY[0x24BDF8440];
  v25[1] = v7;
  v8 = *MEMORY[0x24BDF8530];
  v25[2] = *MEMORY[0x24BDF8678];
  v25[3] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDF8238];
    objc_msgSend(v6, "contentType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "typeWithIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = v9;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v14);
          if ((objc_msgSend(v13, "conformsToType:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), (_QWORD)v20) & 1) != 0)
          {
            objc_msgSend(v5, "string");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v15) = (unint64_t)objc_msgSend(v18, "length") > 0xF4240;

            goto LABEL_12;
          }
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v15)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (void)_setupTextViewWithDocumentAttributes:(id)a3
{
  id v4;

  v4 = a3;
  -[QLTextItemViewController _setupTextViewColorsWithDocumentAttributes:](self, "_setupTextViewColorsWithDocumentAttributes:", v4);
  -[QLTextItemViewController _setupTextViewMarginsWithDocumentAttributes:](self, "_setupTextViewMarginsWithDocumentAttributes:", v4);

}

- (void)_setupTextViewColorsWithDocumentAttributes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BEBB328]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UITextView setBackgroundColor:](self->_textView, "setBackgroundColor:", v4);
  }
  else
  {
    if (-[QLTextItemViewController _documentAttributesContainTextColors:](self, "_documentAttributesContainTextColors:", v10))
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView setBackgroundColor:](self->_textView, "setBackgroundColor:", v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView setBackgroundColor:](self->_textView, "setBackgroundColor:", v6);

      -[UITextView textStorage](self->_textView, "textStorage");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *MEMORY[0x24BEBB368];
      objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView textStorage](self->_textView, "textStorage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addAttribute:value:range:", v7, v8, 0, objc_msgSend(v9, "length"));

    }
  }

}

- (void)_setupTextViewMarginsWithDocumentAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;

  v4 = a3;
  v5 = *MEMORY[0x24BEBB398];
  v26 = v4;
  objc_msgSend(v4, "valueForKey:", *MEMORY[0x24BEBB398]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v26, "valueForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UIEdgeInsetsValue");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    v16 = *MEMORY[0x24BEBB3A0];
    objc_msgSend(v26, "valueForKey:", *MEMORY[0x24BEBB3A0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v26, "valueForKey:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "CGSizeValue");
      v20 = v19;
      v22 = v21;

      -[UITextView frame](self->_textView, "frame");
      v24 = v23 / v20;
      -[UITextView frame](self->_textView, "frame");
      v9 = v9 * (v25 / v22);
      v11 = v11 * v24;
      v13 = v13 * (v25 / v22);
      v15 = v15 * v24;
    }
    -[UITextView setTextContainerInset:](self->_textView, "setTextContainerInset:", v9, v11, v13, v15);
  }

}

- (BOOL)_documentAttributesContainTextColors:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v18[5];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BEBB350]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BEBB3B0]);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    -[UITextView textStorage](self->_textView, "textStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10 >= 0xC350)
      v11 = 50000;
    else
      v11 = v10;
    -[UITextView textStorage](self->_textView, "textStorage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x24BEBB368];
    v14 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __65__QLTextItemViewController__documentAttributesContainTextColors___block_invoke;
    v19[3] = &unk_24C7255B0;
    v19[4] = &v20;
    objc_msgSend(v12, "enumerateAttribute:inRange:options:usingBlock:", v13, 0, v11, 0x100000, v19);

    if (*((_BYTE *)v21 + 24))
    {
      v7 = 1;
    }
    else
    {
      -[UITextView textStorage](self->_textView, "textStorage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *MEMORY[0x24BEBB320];
      v18[0] = v14;
      v18[1] = 3221225472;
      v18[2] = __65__QLTextItemViewController__documentAttributesContainTextColors___block_invoke_2;
      v18[3] = &unk_24C7255B0;
      v18[4] = &v20;
      objc_msgSend(v15, "enumerateAttribute:inRange:options:usingBlock:", v16, 0, v11, 0x100000, v18);

      v7 = *((_BYTE *)v21 + 24) != 0;
    }
    _Block_object_dispose(&v20, 8);
  }

  return v7;
}

uint64_t __65__QLTextItemViewController__documentAttributesContainTextColors___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

uint64_t __65__QLTextItemViewController__documentAttributesContainTextColors___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)QLTextItemViewController;
  -[QLTextItemViewController viewDidLoad](&v7, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__keyboardWillAppear_, *MEMORY[0x24BEBE580], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__keyboardWillAppear_, *MEMORY[0x24BEBE550], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__keyboardWillDisappear_, *MEMORY[0x24BEBE578], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__keyboardWillAppear_, *MEMORY[0x24BEBE570], 0);

}

- (void)previewDidAppear:(BOOL)a3
{
  void *v4;
  int v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QLTextItemViewController;
  -[QLItemViewController previewDidAppear:](&v6, sel_previewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isHardwareKeyboardAvailable");

  if (v5)
    -[UITextView becomeFirstResponder](self->_textView, "becomeFirstResponder");
}

- (id)toolbarButtonsForTraitCollection:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)QLTextItemViewController;
  -[QLItemViewController toolbarButtonsForTraitCollection:](&v7, sel_toolbarButtonsForTraitCollection_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7BFD8]), "initWithIdentifier:", CFSTR("QLSearchButton"));
  objc_msgSend(v5, "setSymbolImageName:", CFSTR("magnifyingglass"));
  objc_msgSend(v5, "setPlacement:", 0);
  objc_msgSend(v5, "setForceToNavBar:", _UIBarsDesktopNavigationBarEnabled() ^ 1);
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("QLTextItemViewControllerBarSearchRightButtonAccessibilityIdentifier"));
  objc_msgSend(v4, "addObject:", v5);

  return v4;
}

- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("QLSearchButton")))
  {
    -[UITextView findInteraction](self->_textView, "findInteraction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentFindNavigatorShowingReplace:", 0);

    v7[2](v7);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)QLTextItemViewController;
    -[QLItemViewController buttonPressedWithIdentifier:completionHandler:](&v9, sel_buttonPressedWithIdentifier_completionHandler_, v6, v7);
  }

}

- (BOOL)canSwipeToDismiss
{
  return 0;
}

- (BOOL)canPinchToDismiss
{
  return 1;
}

- (id)registeredKeyCommands
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)QLTextItemViewController;
  -[QLItemViewController registeredKeyCommands](&v3, sel_registeredKeyCommands);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldRecognizeGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  UITextView *textView;
  void *v7;
  void *v8;
  uint64_t v9;
  UITextView *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "locationInView:", self->_textView);
    -[UITextView characterRangeAtPoint:](self->_textView, "characterRangeAtPoint:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    textView = self->_textView;
    -[UITextView beginningOfDocument](textView, "beginningOfDocument");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "start");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[UITextView offsetFromPosition:toPosition:](textView, "offsetFromPosition:toPosition:", v7, v8);

    v10 = self->_textView;
    -[UITextView beginningOfDocument](v10, "beginningOfDocument");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "end");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[UITextView offsetFromPosition:toPosition:](v10, "offsetFromPosition:toPosition:", v11, v12);

    if ((objc_msgSend(v5, "isEmpty") & 1) != 0)
    {
      v14 = 1;
    }
    else
    {
      -[UITextView attributedText](self->_textView, "attributedText");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "attributedSubstringFromRange:", v9, v13 - v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v16, "length"))
      {
        objc_msgSend(v16, "attribute:atIndex:effectiveRange:", *MEMORY[0x24BEBB388], 0, 0);
        v17 = objc_claimAutoreleasedReturnValue();
        v14 = v17 == 0;

        v16 = (void *)v17;
      }
      else
      {
        v14 = 1;
      }

    }
  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v6;

  v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)QLTextItemViewController;
  -[QLItemViewController setAppearance:animated:](&v6, sel_setAppearance_animated_, a3);
  -[QLTextItemViewController _updateConstraintConstants:](self, "_updateConstraintConstants:", v4);
  -[QLTextItemViewController updateContentFrame](self, "updateContentFrame");
}

- (id)scrollView
{
  return self->_textView;
}

- (BOOL)automaticallyUpdateScrollViewContentOffset
{
  return 1;
}

- (BOOL)automaticallyUpdateScrollViewContentInset
{
  return 1;
}

- (BOOL)automaticallyUpdateScrollViewIndicatorInset
{
  return 0;
}

- (BOOL)canToggleFullScreen
{
  uint64_t v2;

  -[UITextView selectedRange](self->_textView, "selectedRange");
  return v2 == 0;
}

- (BOOL)canClickToToggleFullscreen
{
  return 0;
}

- (UISimpleTextPrintFormatter)printFormatter
{
  UISimpleTextPrintFormatter *printFormatter;
  UISimpleTextPrintFormatter *v4;
  UISimpleTextPrintFormatter *v5;

  printFormatter = self->_printFormatter;
  if (!printFormatter)
  {
    v4 = (UISimpleTextPrintFormatter *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6DA0]), "initWithAttributedText:", self->_content);
    v5 = self->_printFormatter;
    self->_printFormatter = v4;

    printFormatter = self->_printFormatter;
  }
  return printFormatter;
}

- (UIPrintPageRenderer)pageRenderer
{
  UIPrintPageRenderer *pageRenderer;
  UIPrintPageRenderer *v4;
  UIPrintPageRenderer *v5;
  UIPrintPageRenderer *v6;
  void *v7;

  pageRenderer = self->_pageRenderer;
  if (!pageRenderer)
  {
    v4 = (UIPrintPageRenderer *)objc_alloc_init(MEMORY[0x24BDF6CE8]);
    v5 = self->_pageRenderer;
    self->_pageRenderer = v4;

    v6 = self->_pageRenderer;
    -[QLTextItemViewController printFormatter](self, "printFormatter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintPageRenderer addPrintFormatter:startingAtPageAtIndex:](v6, "addPrintFormatter:startingAtPageAtIndex:", v7, 0);

    pageRenderer = self->_pageRenderer;
  }
  return pageRenderer;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5
{
  id v6;
  void *v7;

  v6 = a4;
  -[QLItemViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previewItemViewController:wantsToOpenURL:", self, v6);

  return 0;
}

- (void)updateContentFrame
{
  void *v3;
  id v4;

  -[QLTextItemViewController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextView selectionContainerView](self->_textView, "selectionContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  objc_msgSend(v4, "convertRect:fromView:", self->_textView);
  -[QLItemViewController setContentFrame:](self, "setContentFrame:");

}

- (void)numberOfPagesWithSize:(CGSize)a3 completionHandler:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  QLRunInMainThreadSync();

}

void __68__QLTextItemViewController_numberOfPagesWithSize_completionHandler___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  id v15;

  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "pageRenderer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrintableRect:", 0.0, 0.0, v2, v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "printableRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "pageRenderer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPaperRect:", v6, v8, v10, v12);

  v14 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "printFormatter");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, objc_msgSend(v15, "pageCount"));

}

- (void)pdfDataForPageAtIndex:(int64_t)a3 withCompletionHandler:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  QLRunInMainThreadSync();

}

void __72__QLTextItemViewController_pdfDataForPageAtIndex_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  NSMutableData *data;
  CGRect v22;

  data = (NSMutableData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 0);
  objc_msgSend(*(id *)(a1 + 32), "pageRenderer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "printableRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  UIGraphicsBeginPDFContextToData(data, v22, 0);
  UIGraphicsBeginPDFPage();
  objc_msgSend(*(id *)(a1 + 32), "printFormatter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rectForPageAtIndex:", *(_QWORD *)(a1 + 48));
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  objc_msgSend(*(id *)(a1 + 32), "printFormatter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "drawInRect:forPageAtIndex:", *(_QWORD *)(a1 + 48), v13, v15, v17, v19);

  UIGraphicsEndPDFContext();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)provideCurrentPageAndVisibleRectWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD, double, double, double, double))a3 + 2))(a3, 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  return 1;
}

- (void)_keyboardWillAppear:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[QLTextItemViewController _updateViewConstraintsFromKeyboardAppearanceInfo:notificationName:](self, "_updateViewConstraintsFromKeyboardAppearanceInfo:notificationName:", v6, v5);
}

- (void)_keyboardWillDisappear:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[QLTextItemViewController _updateViewConstraintsFromKeyboardAppearanceInfo:notificationName:](self, "_updateViewConstraintsFromKeyboardAppearanceInfo:notificationName:", v6, v5);
}

- (void)_updateViewConstraintsFromKeyboardAppearanceInfo:(id)a3 notificationName:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  void *v30;
  double MaxY;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  float v37;
  _QWORD v38[5];
  CGRect v39;
  CGRect v40;

  v5 = *MEMORY[0x24BEBE468];
  v6 = a3;
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "CGRectValue");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[QLTextItemViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "window");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "screen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "coordinateSpace");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[QLTextItemViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "coordinateSpace");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "convertRect:toCoordinateSpace:", v21, v9, v11, v13, v15);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  -[QLTextItemViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bounds");
  MaxY = CGRectGetMaxY(v39);
  v40.origin.x = v23;
  v40.origin.y = v25;
  v40.size.width = v27;
  v40.size.height = v29;
  v32 = MaxY - CGRectGetMinY(v40);

  -[QLTextItemViewController customEdgeInsets](self, "customEdgeInsets");
  v34 = v33;
  -[UITextView setContentInset:](self->_textView, "setContentInset:");
  -[UITextView setScrollIndicatorInsets:](self->_textView, "setScrollIndicatorInsets:", 0.0, 0.0, v32 - v34, 0.0);
  v35 = (void *)MEMORY[0x24BEBDB00];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BEBE408]);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "floatValue");
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __94__QLTextItemViewController__updateViewConstraintsFromKeyboardAppearanceInfo_notificationName___block_invoke;
  v38[3] = &unk_24C724B00;
  v38[4] = self;
  objc_msgSend(v35, "animateWithDuration:animations:", v38, v37);

}

void __94__QLTextItemViewController__updateViewConstraintsFromKeyboardAppearanceInfo_notificationName___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

- (void)setUpDocumentWithItem:(id)a3
{
  _TtC9QuickLook14QLTextDocument *v4;
  _TtC9QuickLook14QLTextDocument *textDocument;
  id v6;

  -[QLTextItemViewController displayedDocumentURLForItem:](self, "displayedDocumentURLForItem:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[QLTextDocument initWithFileURL:]([_TtC9QuickLook14QLTextDocument alloc], "initWithFileURL:", v6);
  textDocument = self->_textDocument;
  self->_textDocument = v4;

}

- (void)_updateConstraintConstants:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  _QWORD aBlock[5];

  v3 = a3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__QLTextItemViewController__updateConstraintConstants___block_invoke;
  aBlock[3] = &unk_24C724B00;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  v5 = v4;
  if (v3)
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v4, 0.2);
  else
    (*((void (**)(void *))v4 + 2))(v4);

}

void __55__QLTextItemViewController__updateConstraintConstants___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  double v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "appearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "peripheryInsets");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "setConstant:", v3);

  objc_msgSend(*(id *)(a1 + 32), "appearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "peripheryInsets");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "setConstant:", v5);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsLayout");

}

- (BOOL)isDocumentOpen
{
  return self->_isDocumentOpen;
}

- (void)setIsDocumentOpen:(BOOL)a3
{
  self->_isDocumentOpen = a3;
}

- (_TtC9QuickLook14QLTextDocument)textDocument
{
  return self->_textDocument;
}

- (UITextView)textView
{
  return self->_textView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageRenderer, 0);
  objc_storeStrong((id *)&self->_printFormatter, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_textDocument, 0);
  objc_storeStrong((id *)&self->_rightConstraint, 0);
  objc_storeStrong((id *)&self->_leftConstraint, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

- (BOOL)shouldAllowEditingContents
{
  void *v2;
  void *v4;
  int v5;
  BOOL v6;
  void *v7;
  void *v8;

  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
  {
    -[QLItemViewController context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "canBeEdited");
    if (v5
      && (-[QLItemViewController context](self, "context"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v2, "editedFileBehavior")))
    {
      v6 = 1;
    }
    else
    {
      -[QLItemViewController context](self, "context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "item");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "editingMode") != 0;

      if (!v5)
      {
LABEL_9:

        return v6;
      }
    }

    goto LABEL_9;
  }
  return 0;
}

- (BOOL)shouldEditByCreatingCopy
{
  void *v2;
  void *v4;
  int v5;
  BOOL v6;
  void *v7;
  void *v8;

  -[QLItemViewController context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canBeEdited");
  if (v5)
  {
    -[QLItemViewController context](self, "context");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "editedFileBehavior") == 2)
    {
      v6 = 1;
LABEL_5:

      goto LABEL_6;
    }
  }
  -[QLItemViewController context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "editingMode") == 2;

  if (v5)
    goto LABEL_5;
LABEL_6:

  return v6;
}

- (void)savePreviewEditedCopyWithCompletionHandler:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v4 = a3;
  if (-[QLTextItemViewController shouldAllowEditingContents](self, "shouldAllowEditingContents"))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __80__QLTextItemViewController_Editing__savePreviewEditedCopyWithCompletionHandler___block_invoke;
    v5[3] = &unk_24C726048;
    v6 = v4;
    -[QLTextItemViewController _saveTextIfEdited:withCompletionHandler:](self, "_saveTextIfEdited:withCompletionHandler:", 1, v5);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

uint64_t __80__QLTextItemViewController_Editing__savePreviewEditedCopyWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_saveTextIfEdited:(BOOL)a3 withCompletionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  BOOL v18;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  -[QLItemViewController context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "previewItemContentType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDF8238];
    -[QLItemViewController context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "item");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "previewItemContentType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "typeWithIdentifier:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __77__QLTextItemViewController_Editing___saveTextIfEdited_withCompletionHandler___block_invoke;
    v15[3] = &unk_24C726070;
    v16 = v6;
    objc_copyWeak(&v17, &location);
    v18 = a3;
    -[QLItemViewController editedCopyToSaveChangesWithOutputType:completionHandler:](self, "editedCopyToSaveChangesWithOutputType:completionHandler:", v14, v15);
    objc_destroyWeak(&v17);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE7BF30], 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v14);
  }

  objc_destroyWeak(&location);
}

void __77__QLTextItemViewController_Editing___saveTextIfEdited_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id WeakRetained;
  NSObject **v9;
  NSObject *v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v9 = (NSObject **)MEMORY[0x24BE7BF48];
    v10 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_20D4F5000, v10, OS_LOG_TYPE_ERROR, "Could not create edited text because could not generate a URL to save the file. #AnyItemViewController", v11, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_saveTextIfEditedWithEditedCopy:shouldDismissAfterSaving:completionHandler:", v5, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

  }
}

- (void)_saveTextIfEditedWithEditedCopy:(id)a3 shouldDismissAfterSaving:(BOOL)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v7 = a3;
  v8 = a5;
  if (_os_feature_enabled_impl())
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __112__QLTextItemViewController_Editing___saveTextIfEditedWithEditedCopy_shouldDismissAfterSaving_completionHandler___block_invoke;
    v9[3] = &unk_24C7253E8;
    v10 = v7;
    v11 = v8;
    -[QLTextItemViewController closeDocumentWithCompletionHandler:](self, "closeDocumentWithCompletionHandler:", v9);

  }
}

uint64_t __112__QLTextItemViewController_Editing___saveTextIfEditedWithEditedCopy_shouldDismissAfterSaving_completionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t (*v3)(void);

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "bumpVersion");
    objc_msgSend(*(id *)(a1 + 32), "markAsPurgeable");
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  return v3();
}

- (void)setUpTextInputShortcutsBar
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v3 = objc_alloc(MEMORY[0x24BDBCEB8]);
  -[QLTextItemViewController _textInputShortcutsBarButtons](self, "_textInputShortcutsBarButtons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v3, "initWithArray:", v4);

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[QLTextItemViewController textView](self, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inputAssistantItem");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc(MEMORY[0x24BEBD410]);
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("textFormat"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithImage:style:target:action:", v10, 0, 0, 0);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD418]), "initWithBarButtonItems:representativeItem:", v18, v11);
    v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v8, "trailingBarButtonGroups");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectsFromArray:", v14);

    objc_msgSend(v13, "addObject:", v12);
    objc_msgSend(v8, "setTrailingBarButtonGroups:", v13);

  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x24BEBDA90]);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemFillColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v15);

    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTintColor:", v16);

    objc_msgSend(MEMORY[0x24BEBD410], "flexibleSpaceItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "insertObject:atIndex:", v17, 0);

    objc_msgSend(v8, "setItems:", v18);
    objc_msgSend(v8, "sizeToFit");
    -[QLTextItemViewController textView](self, "textView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setInputAccessoryView:", v8);
  }

}

- (id)_textInputShortcutsBarButtons
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (-[QLTextItemViewController shouldAllowEditingContents](self, "shouldAllowEditingContents"))
  {
    -[QLTextItemViewController textDocument](self, "textDocument");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasRichContent");

    if (v5)
    {
      objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("pencil.tip"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithImage:style:target:action:", v6, 0, self, sel_presentColorPicker);
      objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("QLTextItemViewControllerBarColorPickerRightButtonAccessibilityIdentifier"));
      objc_msgSend(v3, "addObject:", v7);
      objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("textformat.size"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithImage:style:target:action:", v8, 0, self, sel_presentTextSizePicker);
      objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("QLTextItemViewControllerBarTextSizePickerRightButtonAccessibilityIdentifier"));
      objc_msgSend(v3, "addObject:", v9);
      objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("textformat"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithImage:style:target:action:", v10, 0, self, sel_presentFontPicker);
      objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("QLTextItemViewControllerBarFontPickerRightButtonAccessibilityIdentifier"));
      objc_msgSend(v3, "addObject:", v11);

    }
  }
  return v3;
}

- (void)updateTextWithFont:(id)a3 undoable:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v4 = a4;
  v6 = a3;
  -[QLTextItemViewController textView](self, "textView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v9, "selectedRange");
  -[QLTextItemViewController updateTextWithFont:range:undoable:](self, "updateTextWithFont:range:undoable:", v6, v7, v8, v4);

}

- (void)updateTextWithFont:(id)a3 range:(_NSRange)a4 undoable:(BOOL)a5
{
  _BOOL8 v5;
  NSUInteger length;
  NSUInteger location;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a5;
  length = a4.length;
  location = a4.location;
  v13 = a3;
  if (length)
  {
    -[QLTextItemViewController textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "font");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLTextItemViewController updateSelectionAttributesWithFont:oldFont:range:undoable:](self, "updateSelectionAttributesWithFont:oldFont:range:undoable:", v13, v10, location, length, v5);

  }
  -[QLTextItemViewController textView](self, "textView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLTextItemViewController updateTypingAttributesWithFont:color:](self, "updateTypingAttributesWithFont:color:", v13, v12);

}

- (void)updateTextWithColor:(id)a3 undoable:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v4 = a4;
  v6 = a3;
  -[QLTextItemViewController textView](self, "textView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v9, "selectedRange");
  -[QLTextItemViewController updateTextWithColor:range:undoable:](self, "updateTextWithColor:range:undoable:", v6, v7, v8, v4);

}

- (void)updateTextWithColor:(id)a3 range:(_NSRange)a4 undoable:(BOOL)a5
{
  _BOOL8 v5;
  NSUInteger length;
  NSUInteger location;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a5;
  length = a4.length;
  location = a4.location;
  v13 = a3;
  if (length)
  {
    -[QLTextItemViewController textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLTextItemViewController updateSelectionAttributesWithColor:oldColor:range:undoable:](self, "updateSelectionAttributesWithColor:oldColor:range:undoable:", v13, v10, location, length, v5);

  }
  -[QLTextItemViewController textView](self, "textView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "font");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLTextItemViewController updateTypingAttributesWithFont:color:](self, "updateTypingAttributesWithFont:color:", v12, v13);

}

- (void)updateTypingAttributesWithFont:(id)a3 color:(id)a4
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v6 = *MEMORY[0x24BEBB368];
  v12[0] = *MEMORY[0x24BEBB360];
  v12[1] = v6;
  v13[0] = a3;
  v13[1] = a4;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[QLTextItemViewController textView](self, "textView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTypingAttributes:", v10);

}

- (void)updateSelectionAttributesWithFont:(id)a3 oldFont:(id)a4 range:(_NSRange)a5 undoable:(BOOL)a6
{
  _BOOL4 v6;
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v6 = a6;
  length = a5.length;
  location = a5.location;
  v23[1] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v22 = *MEMORY[0x24BEBB360];
  v23[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLTextItemViewController textView](self, "textView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "textStorage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAttributes:range:", v13, location, length);

  if (v6)
  {
    -[QLTextItemViewController textView](self, "textView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "undoManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "prepareWithInvocationTarget:", self);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "updateSelectionAttributesWithFont:oldFont:range:undoable:", v12, v11, location, length, 1);

    -[QLTextItemViewController textView](self, "textView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "undoManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    QLLocalizedString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setActionName:", v21);

  }
}

- (void)updateSelectionAttributesWithColor:(id)a3 oldColor:(id)a4 range:(_NSRange)a5 undoable:(BOOL)a6
{
  _BOOL4 v6;
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v6 = a6;
  length = a5.length;
  location = a5.location;
  v23[1] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v22 = *MEMORY[0x24BEBB368];
  v23[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLTextItemViewController textView](self, "textView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "textStorage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAttributes:range:", v13, location, length);

  if (v6)
  {
    -[QLTextItemViewController textView](self, "textView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "undoManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "prepareWithInvocationTarget:", self);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "updateSelectionAttributesWithColor:oldColor:range:undoable:", v12, v11, location, length, 1);

    -[QLTextItemViewController textView](self, "textView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "undoManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    QLLocalizedString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setActionName:", v21);

  }
}

- (void)presentFontPicker
{
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x24BEBD600]);
  objc_msgSend(v4, "setIncludeFaces:", 1);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD5F8]), "initWithConfiguration:", v4);
  objc_msgSend(v3, "setDelegate:", self);
  -[QLTextItemViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

}

- (void)fontPickerViewControllerDidPickFont:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "selectedFontDescriptor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v4 = (void *)MEMORY[0x24BEBB520];
    -[QLTextItemViewController textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "font");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pointSize");
    objc_msgSend(v4, "fontWithDescriptor:size:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[QLTextItemViewController updateTextWithFont:undoable:](self, "updateTextWithFont:undoable:", v7, 1);
  }

}

- (id)availableTextSizes
{
  return &unk_24C749648;
}

- (void)presentTextSizePicker
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BEBD800]);
  objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setDataSource:", self);
  objc_msgSend(v3, "setDelegate:", self);
  v5 = objc_alloc_init(MEMORY[0x24BEBDB08]);
  objc_msgSend(v5, "setView:", v3);
  QLLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v6);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_textSizePickerDidCancel);
  objc_msgSend(v5, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRightBarButtonItem:", v8);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v5);
  objc_msgSend(v10, "setModalPresentationStyle:", 2);
  objc_msgSend(MEMORY[0x24BEBD950], "mediumDetent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sheetPresentationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDetents:", v12);

  -[QLTextItemViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[QLTextItemViewController availableTextSizes](self, "availableTextSizes", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  void *v6;
  void *v7;
  void *v8;

  -[QLTextItemViewController availableTextSizes](self, "availableTextSizes", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  id v14;

  v7 = (void *)MEMORY[0x24BEBB520];
  -[QLTextItemViewController textView](self, "textView", a3, a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "font");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fontDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLTextItemViewController availableTextSizes](self, "availableTextSizes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");
  objc_msgSend(v7, "fontWithDescriptor:size:", v10, v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[QLTextItemViewController updateTextWithFont:undoable:](self, "updateTextWithFont:undoable:", v14, 1);
}

- (void)textSizePickerDidCancel
{
  id v2;

  -[QLTextItemViewController presentedViewController](self, "presentedViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)presentColorPicker
{
  void *v3;
  void *v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BEBD4C8]);
  -[QLTextItemViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedColor:", v4);

  objc_msgSend(v5, "setDelegate:", self);
  -[QLTextItemViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

}

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  _BOOL4 v5;
  id v7;

  v5 = a5;
  objc_msgSend(a3, "selectedColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[QLTextItemViewController updateTextWithColor:undoable:](self, "updateTextWithColor:undoable:", v7, !v5);

}

@end
