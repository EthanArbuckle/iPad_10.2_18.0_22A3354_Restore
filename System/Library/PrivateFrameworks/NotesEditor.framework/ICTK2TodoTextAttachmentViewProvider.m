@implementation ICTK2TodoTextAttachmentViewProvider

- (void)loadView
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
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  id v27;

  v3 = objc_alloc(MEMORY[0x1E0D64DD8]);
  -[ICTK2TodoTextAttachmentViewProvider textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textDragInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (id)objc_msgSend(v3, "initWithDragDelegate:", v6);

  objc_msgSend(v27, "addTarget:action:forControlEvents:", self, sel_didPressTodoButton_, 64);
  -[ICTK2TodoTextAttachmentViewProvider todoTextAttachment](self, "todoTextAttachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "todo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[ICTK2TodoTextAttachmentViewProvider textController](self, "textController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trackedToDoParagraphs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTrackedParagraph:", v13);

  }
  objc_msgSend(v27, "setDone:animated:", objc_msgSend(v8, "done"), 0);
  -[ICTK2TodoTextAttachmentViewProvider todoTextAttachment](self, "todoTextAttachment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "foregroundAlpha");
  if (v15 == 0.0)
    v15 = 1.0;
  objc_msgSend(v27, "ic_setAlpha:", v15);

  -[ICTK2TodoTextAttachmentViewProvider todoTextAttachment](self, "todoTextAttachment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "highlightColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setHighlightColor:", v17);

  -[ICTK2TodoTextAttachmentViewProvider todoTextAttachment](self, "todoTextAttachment");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_highlightColor);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "ic_addObserver:forKeyPath:context:", self, v19, &compoundliteral_8);

  -[ICTK2TodoTextAttachmentViewProvider todoTextAttachment](self, "todoTextAttachment");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_foregroundAlpha);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ic_addObserver:forKeyPath:context:", self, v21, &compoundliteral_8);

  objc_opt_class();
  -[ICTK2TodoTextAttachmentViewProvider textView](self, "textView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "textContainer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "insideSiriSnippet");

  if (v25)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "ICTintColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setOverrideTintColor:", v26);

  }
  -[NSTextAttachmentViewProvider setView:](self, "setView:", v27);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  -[ICTK2TodoTextAttachmentViewProvider todoTextAttachment](self, "todoTextAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_highlightColor);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_removeObserver:forKeyPath:context:", self, v4, &compoundliteral_8);

  -[ICTK2TodoTextAttachmentViewProvider todoTextAttachment](self, "todoTextAttachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_foregroundAlpha);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_removeObserver:forKeyPath:context:", self, v6, &compoundliteral_8);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  v8.receiver = self;
  v8.super_class = (Class)ICTK2TodoTextAttachmentViewProvider;
  -[NSTextAttachmentViewProvider dealloc](&v8, sel_dealloc);
}

- (ICTodoButton)todoButton
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[NSTextAttachmentViewProvider view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICTodoButton *)v4;
}

- (ICTTTextStorage)textStorage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_opt_class();
  -[NSTextAttachmentViewProvider textLayoutManager](self, "textLayoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textContentStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v5, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICTTTextStorage *)v7;
}

- (ICTextController)textController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_opt_class();
  -[NSTextAttachmentViewProvider textLayoutManager](self, "textLayoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textContentStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v5, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "styler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICTextController *)v8;
}

- (ICTK2TextView)textView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_opt_class();
  -[NSTextAttachmentViewProvider textLayoutManager](self, "textLayoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v4, "textContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "tk2TextView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICTK2TextView *)v7;
}

- (ICTK2TodoTextAttachment)todoTextAttachment
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[NSTextAttachmentViewProvider textAttachment](self, "textAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICTK2TodoTextAttachment *)v4;
}

- (void)didPressTodoButton:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  int v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  BOOL v40;
  uint64_t v41;
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
  id v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  void *v58;
  _QWORD v59[4];
  void *v60;

  v4 = a3;
  -[ICTK2TodoTextAttachmentViewProvider textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDraggingChecklistItem");

  if ((v6 & 1) == 0)
  {
    -[ICTK2TodoTextAttachmentViewProvider textView](self, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTK2TodoTextAttachmentViewProvider textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "textViewShouldBeginEditing:", v9);

    objc_opt_class();
    -[NSTextAttachmentViewProvider textLayoutManager](self, "textLayoutManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICTK2TodoTextAttachmentViewProvider todoTextAttachment](self, "todoTextAttachment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "todo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trackedTodoParagraphForTrackingUUID:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v54 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        -[ICTK2TodoTextAttachmentViewProvider didPressTodoButton:].cold.1(v14, v54);

      -[ICTK2TodoTextAttachmentViewProvider textController](self, "textController");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTK2TodoTextAttachmentViewProvider textStorage](self, "textStorage");
      v52 = (id)objc_claimAutoreleasedReturnValue();
      -[ICTK2TodoTextAttachmentViewProvider textStorage](self, "textStorage");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v53, "ic_range");
      objc_msgSend(v49, "updateTrackedAttributesInTextStorage:range:changeInLength:", v52, v55, v56, 0);
      goto LABEL_24;
    }
    v17 = objc_msgSend(v16, "characterRange");
    if (!v10)
    {
LABEL_26:

      goto LABEL_27;
    }
    v19 = v17;
    v20 = v18;
    v58 = v12;
    v21 = objc_msgSend(v4, "isDone") ^ 1;
    -[ICTK2TodoTextAttachmentViewProvider textController](self, "textController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTK2TodoTextAttachmentViewProvider textStorage](self, "textStorage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "setDone:range:inTextStorage:", v21, v19, v20, v23);

    v25 = v24;
    if (v24)
    {
      objc_msgSend(v4, "setDone:", v21);
      objc_msgSend(v4, "wasPressed");
      -[ICTK2TodoTextAttachmentViewProvider textView](self, "textView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "icDelegate");
      v57 = v4;
      v27 = v16;
      v28 = v19;
      v29 = v14;
      v30 = v20;
      v31 = v24;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_opt_respondsToSelector();

      v25 = v31;
      v20 = v30;
      v14 = v29;
      v19 = v28;
      v16 = v27;
      v4 = v57;

      if ((v33 & 1) != 0)
      {
        -[ICTK2TodoTextAttachmentViewProvider textView](self, "textView");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "icDelegate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "didInvokeAnalyticsChecklistActionChecked:", v21);

      }
    }
    objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "isMenuVisible");

    if (v37)
    {
      objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setMenuVisible:animated:", 0, 1);

    }
    -[ICTK2TodoTextAttachmentViewProvider textView](self, "textView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "isFirstResponder"))
    {
      v40 = -[ICTK2TodoTextAttachmentViewProvider selectedRangesIntersectWithRange:](self, "selectedRangesIntersectWithRange:", v19, v20);

      if (v40)
        goto LABEL_16;
      if (v19 <= v20 + v19 - 1)
        v41 = v20 + v19 - 1;
      else
        v41 = v19;
      -[ICTK2TodoTextAttachmentViewProvider textView](self, "textView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setSelectedRange:", v41, 0);
    }

LABEL_16:
    v12 = v58;
    if (v25)
    {
      -[ICTK2TodoTextAttachmentViewProvider textView](self, "textView");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "delegate");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_opt_respondsToSelector();

      if ((v44 & 1) != 0)
      {
        -[ICTK2TodoTextAttachmentViewProvider textView](self, "textView");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "delegate");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTK2TodoTextAttachmentViewProvider textView](self, "textView");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "textViewDidChange:", v47);

      }
      objc_opt_class();
      -[ICTK2TodoTextAttachmentViewProvider textView](self, "textView");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v49)
        goto LABEL_25;
      -[ICTK2TodoTextAttachmentViewProvider eventReporter](self, "eventReporter");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTK2TodoTextAttachmentViewProvider textController](self, "textController");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __58__ICTK2TodoTextAttachmentViewProvider_didPressTodoButton___block_invoke;
      v59[3] = &unk_1EA7DE700;
      v60 = v50;
      v52 = v50;
      objc_msgSend(v51, "autoSortChecklistIfNecessaryForTrackedParagraph:textView:analyticsHandler:", v16, v49, v59);

      dispatchMainAfterDelay();
      v53 = v60;
LABEL_24:

LABEL_25:
      goto LABEL_26;
    }
    goto LABEL_26;
  }
LABEL_27:

}

uint64_t __58__ICTK2TodoTextAttachmentViewProvider_didPressTodoButton___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "submitMoveCheckedItemsToBottomSwitchEventWithNewState:isInApp:", a2, 1);
}

void __58__ICTK2TodoTextAttachmentViewProvider_didPressTodoButton___block_invoke_2()
{
  UIAccessibilityPostNotification(*MEMORY[0x1E0DC4578], 0);
}

- (ICNAEventReporter)eventReporter
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  ICNAEventReporter *v7;
  ICNAEventReporter *eventReporter;
  void *v9;

  if (!self->_eventReporter && objc_msgSend(MEMORY[0x1E0D62A30], "isOptedInForAnalytics"))
  {
    v3 = objc_alloc(MEMORY[0x1E0D62A30]);
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTK2TodoTextAttachmentViewProvider textView](self, "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (ICNAEventReporter *)objc_msgSend(v3, "initWithSubTrackerName:view:", v5, v6);
    eventReporter = self->_eventReporter;
    self->_eventReporter = v7;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_eventReporterLostSession_, *MEMORY[0x1E0D62A18], self->_eventReporter);

  }
  return self->_eventReporter;
}

- (void)eventReporterLostSession:(id)a3
{
  ICNAEventReporter *eventReporter;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  v5 = a3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D62A18];
  objc_msgSend(v5, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "removeObserver:name:object:", self, v6, v7);
}

- (BOOL)selectedRangesIntersectWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSUInteger v11;
  NSUInteger v12;
  NSRange v13;
  BOOL v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  NSRange v23;

  length = a3.length;
  location = a3.location;
  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[ICTK2TodoTextAttachmentViewProvider textView](self, "textView", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_selectedRanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "rangeValue");
        v13.location = v11;
        v13.length = v12;
        if (v12 || (v11 >= location ? (v14 = v11 - location >= length) : (v14 = 1), v14))
        {
          v23.location = location;
          v23.length = length;
          if (!NSIntersectionRange(v23, v13).length)
            continue;
        }
        v15 = 1;
        goto LABEL_17;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_17:

  return v15;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v10 = a4;
  v11 = a5;
  v12 = a3;
  if ((-[ICTK2TodoTextAttachmentViewProvider ic_didAddObserverForContext:inScope:](self, "ic_didAddObserverForContext:inScope:", a6, "/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/Common/TextAttachmentUI/ICTK2TodoTextAttachmentViewProvider.m") & 1) != 0)
  {
    v13 = -[ICTK2TodoTextAttachmentViewProvider ic_shouldIgnoreObserveValue:ofObject:forKeyPath:](self, "ic_shouldIgnoreObserveValue:ofObject:forKeyPath:", v11, v10, v12);

    if (a6 == &compoundliteral_8 && (v13 & 1) == 0)
    {
      -[ICTK2TodoTextAttachmentViewProvider todoTextAttachment](self, "todoTextAttachment");
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (v14 == v10)
      {
        -[ICTK2TodoTextAttachmentViewProvider todoButton](self, "todoButton");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTK2TodoTextAttachmentViewProvider todoTextAttachment](self, "todoTextAttachment");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "foregroundAlpha");
        if (v17 == 0.0)
          v17 = 1.0;
        objc_msgSend(v15, "ic_setAlpha:", v17);

        -[ICTK2TodoTextAttachmentViewProvider todoTextAttachment](self, "todoTextAttachment");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "highlightColor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTK2TodoTextAttachmentViewProvider todoButton](self, "todoButton");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setHighlightColor:", v19);

      }
    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)ICTK2TodoTextAttachmentViewProvider;
    -[ICTK2TodoTextAttachmentViewProvider observeValueForKeyPath:ofObject:change:context:](&v21, sel_observeValueForKeyPath_ofObject_change_context_, v12, v10, v11, a6);

  }
}

- (void)setEventReporter:(id)a3
{
  objc_storeStrong((id *)&self->_eventReporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventReporter, 0);
}

- (void)didPressTodoButton:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1DD7B0000, a2, OS_LOG_TYPE_ERROR, "No tracked paragraph found for uuid: %@. Attempting to recover, but checklist button press will be ignored.", (uint8_t *)&v4, 0xCu);

}

@end
