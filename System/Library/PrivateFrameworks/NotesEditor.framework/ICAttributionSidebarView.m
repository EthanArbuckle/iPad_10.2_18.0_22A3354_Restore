@implementation ICAttributionSidebarView

void __40__ICAttributionSidebarView_setTextView___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = (id *)(a1 + 32);
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        WeakRetained = objc_loadWeakRetained(v7);
        objc_msgSend(WeakRetained, "attributionViewMap");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "updatePositionAndVisibility");
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

- (double)visibleContentWidth
{
  return self->_visibleContentWidth;
}

- (ICTextView)textView
{
  return (ICTextView *)objc_loadWeakRetained((id *)&self->_textView);
}

- (void)textViewLayoutDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  -[ICAttributionSidebarView textView](self, "textView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "editorController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "note");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if ((-[ICAttributionSidebarView isHidden](self, "isHidden") & 1) == 0
    && objc_msgSend(v12, "isSharedViaICloud"))
  {
    -[ICAttributionSidebarView textView](self, "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "TTTextStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEditingTemporaryAttributes") & 1) != 0)
    {
      -[ICAttributionSidebarView textView](self, "textView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "TTTextStorage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "changeInLength");

      if (v10 < 1)
        goto LABEL_8;
    }
    else
    {

    }
    -[ICAttributionSidebarView reloadAttributionsDelayer](self, "reloadAttributionsDelayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "requestFire");

  }
LABEL_8:

}

- (void)setTextView:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id WeakRetained;
  id v8;
  id v9;
  void *v10;
  id v11;
  ICAttributionLayoutManager *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  ICAttributionLayoutManager *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id location;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("ICTextViewLayoutDidChangeNotification"), WeakRetained);

  v8 = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(v8, "ic_removeObserver:forKeyPath:context:", self, CFSTR("contentOffset"), compoundliteral_6);

  v9 = objc_storeWeak((id *)&self->_textView, v5);
  objc_msgSend(v5, "ic_addObserver:forKeyPath:context:", self, CFSTR("contentOffset"), compoundliteral_6);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_textViewLayoutDidChange_, CFSTR("ICTextViewLayoutDidChangeNotification"), v11);

  -[ICAttributionSidebarView setHidden:](self, "setHidden:", 1);
  v12 = [ICAttributionLayoutManager alloc];
  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "workerManagedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttributionSidebarView fullContentWidth](self, "fullContentWidth");
  v16 = v15;
  -[ICAttributionSidebarView previewContentWidth](self, "previewContentWidth");
  v18 = -[ICAttributionLayoutManager initWithTextView:managedObjectContext:panelWidth:previewPanelWidth:](v12, "initWithTextView:managedObjectContext:panelWidth:previewPanelWidth:", v5, v14, v16, v17);
  -[ICAttributionSidebarView setAttributionLayoutManager:](self, "setAttributionLayoutManager:", v18);

  objc_initWeak(&location, self);
  v23 = MEMORY[0x1E0C809B0];
  objc_copyWeak(&v24, &location);
  -[ICAttributionSidebarView attributionLayoutManager](self, "attributionLayoutManager", v23, 3221225472, __40__ICAttributionSidebarView_setTextView___block_invoke, &unk_1EA7E1208);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setUpdatedConfigurationHandler:", &v23);

  objc_msgSend(v5, "editorController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "note");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(WeakRetained) = objc_msgSend(v21, "isSharedViaICloud");

  if ((_DWORD)WeakRetained)
  {
    -[ICAttributionSidebarView reloadAttributionsDelayer](self, "reloadAttributionsDelayer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "fireImmediately");

  }
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

- (void)setAuthorHighlightsUpdater:(id)a3
{
  objc_storeWeak((id *)&self->_authorHighlightsUpdater, a3);
}

- (void)setAttributionLayoutManager:(id)a3
{
  objc_storeStrong((id *)&self->_attributionLayoutManager, a3);
}

- (ICSelectorDelayer)reloadAttributionsDelayer
{
  return self->_reloadAttributionsDelayer;
}

- (double)previewContentWidth
{
  double v2;

  -[ICAttributionSidebarView fullContentWidth](self, "fullContentWidth");
  return v2 * 0.66;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  char v13;
  id v14;
  int v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((-[ICAttributionSidebarView ic_didAddObserverForContext:inScope:](self, "ic_didAddObserverForContext:inScope:", a6, "/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/iOS/Editor/Attributions/ICAttributionSidebarView.m") & 1) != 0)
  {
    v13 = -[ICAttributionSidebarView ic_shouldIgnoreObserveValue:ofObject:forKeyPath:](self, "ic_shouldIgnoreObserveValue:ofObject:forKeyPath:", v12, v11, v10);

    if (a6 == compoundliteral_6 && (v13 & 1) == 0)
    {
      -[ICAttributionSidebarView textView](self, "textView");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v14 == v11)
      {
        v15 = objc_msgSend(v10, "isEqualToString:", CFSTR("contentOffset"));

        if (v15)
        {
          -[ICAttributionSidebarView reloadAttributionsDelayer](self, "reloadAttributionsDelayer");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "isScheduledToFire"))
          {
            -[ICAttributionSidebarView visibleContentWidth](self, "visibleContentWidth");
            v18 = v17;

            if (v18 == 0.0)
            {
              -[ICAttributionSidebarView reloadAttributionsDelayer](self, "reloadAttributionsDelayer");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "cancelPreviousFireRequests");

              -[ICAttributionSidebarView reloadAttributionsDelayer](self, "reloadAttributionsDelayer");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "requestFire");

            }
          }
          else
          {

          }
        }
      }
      else
      {

      }
    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)ICAttributionSidebarView;
    -[ICAttributionSidebarView observeValueForKeyPath:ofObject:change:context:](&v21, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);

  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ICAttributionSidebarView;
  -[ICAttributionSidebarView layoutSubviews](&v12, sel_layoutSubviews);
  -[ICAttributionSidebarView fullContentWidth](self, "fullContentWidth");
  v4 = v3;
  -[ICAttributionSidebarView attributionLayoutManager](self, "attributionLayoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPanelWidth:", v4);

  -[ICAttributionSidebarView previewContentWidth](self, "previewContentWidth");
  v7 = v6;
  -[ICAttributionSidebarView attributionLayoutManager](self, "attributionLayoutManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPreviewPanelWidth:", v7);

  -[ICAttributionSidebarView visibleContentWidth](self, "visibleContentWidth");
  v10 = v9;
  -[ICAttributionSidebarView attributionLayoutManager](self, "attributionLayoutManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setVisiblePanelWidth:", v10);

}

- (ICAttributionSidebarView)init
{
  ICAttributionSidebarView *v2;
  uint64_t v3;
  NSMapTable *attributionViewMap;
  id v5;
  uint64_t v6;
  ICSelectorDelayer *reloadAttributionsDelayer;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ICAttributionSidebarView;
  v2 = -[ICAttributionSidebarView init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 5);
    v3 = objc_claimAutoreleasedReturnValue();
    attributionViewMap = v2->_attributionViewMap;
    v2->_attributionViewMap = (NSMapTable *)v3;

    v5 = objc_alloc(MEMORY[0x1E0D64268]);
    +[ICAttributionsUpdater sidebarClosedRenderDelay](ICAttributionsUpdater, "sidebarClosedRenderDelay");
    v6 = objc_msgSend(v5, "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", v2, sel_reloadAttributions, 1, 1);
    reloadAttributionsDelayer = v2->_reloadAttributionsDelayer;
    v2->_reloadAttributionsDelayer = (ICSelectorDelayer *)v6;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel_willEnterForeground_, *MEMORY[0x1E0DC4860], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel_analyticsSessionWillEnd_, *MEMORY[0x1E0D62A20], 0);

  }
  return v2;
}

- (double)fullContentWidth
{
  void *v3;
  NSString *v4;
  BOOL IsAccessibilityCategory;
  void *v7;
  double v8;
  double v9;
  double v10;
  int v11;
  double v12;

  -[ICAttributionSidebarView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory)
    return 160.0;
  -[ICAttributionSidebarView textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8 * 0.38;

  v10 = floor(fmin(v9, 160.0));
  v11 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
  v12 = *MEMORY[0x1E0D64E70];
  if (!v11)
    v12 = 0.0;
  return v10 - v12;
}

- (ICAttributionLayoutManager)attributionLayoutManager
{
  return self->_attributionLayoutManager;
}

- (void)handleTapGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v4 = a3;
  -[ICAttributionSidebarView focusedAttributionViewConfiguration](self, "focusedAttributionViewConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICAttributionSidebarView unfocusAttributionDetails](self, "unfocusAttributionDetails");
LABEL_3:
    -[ICAttributionSidebarView textView](self, "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "editorController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "eventReporter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICAttributionSidebarView textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "editorController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "note");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v8, "submitAttributionSideBarViewEventForNote:contextPath:startState:endState:", v11, 0, 3, 3);
      objc_msgSend(v8, "startAttributionSideBarViewEventForNote:", v11);
    }

    goto LABEL_6;
  }
  objc_msgSend(v4, "locationInView:", self);
  if (v12 < 0.0 || (v13 = v12, -[ICAttributionSidebarView bounds](self, "bounds"), v13 > v14))
  {
    -[ICAttributionSidebarView textView](self, "textView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "editorController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "attributionSidebarController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hideSidebarAnimated:contextPath:", 1, 3);

    goto LABEL_10;
  }
  -[ICAttributionSidebarView attributionViewMap](self, "attributionViewMap");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectEnumerator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __45__ICAttributionSidebarView_handleTapGesture___block_invoke;
  v22[3] = &unk_1EA7E11E0;
  v23 = v4;
  objc_msgSend(v8, "ic_objectPassingTest:", v22);
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    -[ICAttributionSidebarView focusAttributionView:](self, "focusAttributionView:", v20);

    goto LABEL_3;
  }

LABEL_6:
LABEL_10:

}

BOOL __45__ICAttributionSidebarView_handleTapGesture___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGPoint v17;
  CGRect v18;

  v3 = a2;
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "locationInView:", v3);
  v13 = v12;
  v15 = v14;

  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  v17.x = v13;
  v17.y = v15;
  return CGRectContainsPoint(v18, v17);
}

- (void)setVisibleContentWidth:(double)a3 isGestureActive:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v4 = a4;
  v46 = *MEMORY[0x1E0C80C00];
  -[ICAttributionSidebarView setHidden:](self, "setHidden:", a3 == 0.0);
  -[ICAttributionSidebarView visibleContentWidth](self, "visibleContentWidth");
  v8 = v7;
  -[ICAttributionSidebarView attributionLayoutManager](self, "attributionLayoutManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "previewPanelWidth");
  v11 = v10;

  -[ICAttributionSidebarView attributionLayoutManager](self, "attributionLayoutManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "previewPanelWidth");
  v14 = v13;

  -[ICAttributionSidebarView visibleContentWidth](self, "visibleContentWidth");
  if (a3 > 0.0 && v15 <= 0.0)
  {
    -[ICAttributionSidebarView reloadAttributionsDelayer](self, "reloadAttributionsDelayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cancelPreviousFireRequests");

    -[ICAttributionSidebarView reloadAttributionsDelayer](self, "reloadAttributionsDelayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fireImmediately");

  }
  -[ICAttributionSidebarView setVisibleContentWidth:](self, "setVisibleContentWidth:", a3);
  -[ICAttributionSidebarView attributionLayoutManager](self, "attributionLayoutManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setVisiblePanelWidth:", a3);

  if (v8 <= v11 && v14 <= a3)
  {
    -[ICAttributionSidebarView setDidExpandSidebar:](self, "setDidExpandSidebar:", 1);
    +[ICAttributionsUpdater sidebarOpenedRenderDelay](ICAttributionsUpdater, "sidebarOpenedRenderDelay");
    v20 = v19;
    -[ICAttributionSidebarView reloadAttributionsDelayer](self, "reloadAttributionsDelayer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDelay:", v20);

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    -[ICAttributionSidebarView attributionViewMap](self, "attributionViewMap");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectEnumerator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v42 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v28, "configuration");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setPreview:", 0);

          objc_msgSend(v28, "updateContentAnimated:", 1);
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v25);
    }

  }
  if (a3 == 0.0 && !v4)
  {
    +[ICAttributionsUpdater sidebarClosedRenderDelay](ICAttributionsUpdater, "sidebarClosedRenderDelay");
    v31 = v30;
    -[ICAttributionSidebarView reloadAttributionsDelayer](self, "reloadAttributionsDelayer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setDelay:", v31);

    -[ICAttributionSidebarView setDidExpandSidebar:](self, "setDidExpandSidebar:", 0);
    -[ICAttributionSidebarView renderAttributions](self, "renderAttributions");
  }
  if (!v4
    || (-[ICAttributionSidebarView authorHighlightsUpdater](self, "authorHighlightsUpdater"),
        v33 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v33, "highlightedValue"),
        v35 = v34,
        v33,
        v35 < 1.0))
  {
    -[ICAttributionSidebarView attributionLayoutManager](self, "attributionLayoutManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "preferredHighlightValue");
    v38 = v37;
    -[ICAttributionSidebarView authorHighlightsUpdater](self, "authorHighlightsUpdater");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setHighlightedValue:", v38);

    -[ICAttributionSidebarView authorHighlightsUpdater](self, "authorHighlightsUpdater");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "scheduleUpdateAnimated:", !v4);

  }
  dispatchMainAfterDelay();
}

void __67__ICAttributionSidebarView_setVisibleContentWidth_isGestureActive___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "authorHighlightsUpdater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUpdatesVisibleRangesOnly:", v1);

}

- (void)reload
{
  id v2;

  -[ICAttributionSidebarView reloadAttributionsDelayer](self, "reloadAttributionsDelayer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestFire");

}

- (void)unfocusAttributionDetails
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
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
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
  -[ICAttributionSidebarView focusedAttributionViewConfiguration](self, "focusedAttributionViewConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICAttributionSidebarView setFocusedAttributionViewConfiguration:](self, "setFocusedAttributionViewConfiguration:", 0);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[ICAttributionSidebarView attributionViewMap](self, "attributionViewMap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectEnumerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v26 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v10, "configuration");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setBlurred:", 0);

          objc_msgSend(v10, "configuration");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setFocused:", 0);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v7);
    }

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[ICAttributionSidebarView attributionViewMap](self, "attributionViewMap", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectEnumerator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "updateContentAnimated:", 1);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v16);
    }

    -[ICAttributionSidebarView authorHighlightsUpdater](self, "authorHighlightsUpdater");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFocusedRangeValue:", 0);

    -[ICAttributionSidebarView authorHighlightsUpdater](self, "authorHighlightsUpdater");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "scheduleUpdateAnimated:", 1);

  }
}

- (void)setFilter:(id)a3
{
  -[ICAttributionSidebarView setFilter:animated:](self, "setFilter:animated:", a3, 0);
}

- (void)setFilter:(id)a3 animated:(BOOL)a4
{
  id v6;
  void *v7;
  ICTTTextEditFilter *filter;
  ICTTTextEditFilter *v9;
  void *v10;
  unint64_t v11;
  ICTTTextEditFilter *v12;
  unint64_t v13;
  void *v14;
  BOOL v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;

  v6 = a3;
  v7 = v6;
  filter = self->_filter;
  v9 = (ICTTTextEditFilter *)*MEMORY[0x1E0C9B0D0];
  if ((id)*MEMORY[0x1E0C9B0D0] == v6)
    v10 = 0;
  else
    v10 = v6;
  v11 = v10;
  if (v9 == filter)
    v12 = 0;
  else
    v12 = filter;
  v13 = v12;
  if (v11 | v13)
  {
    v14 = (void *)v13;
    if (v11)
      v15 = v13 == 0;
    else
      v15 = 1;
    if (v15)
    {

LABEL_15:
      objc_storeStrong((id *)&self->_filter, a3);
      -[ICAttributionSidebarView authorHighlightsUpdater](self, "authorHighlightsUpdater");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setFilter:", v7);

      -[ICAttributionSidebarView authorHighlightsUpdater](self, "authorHighlightsUpdater");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "scheduleUpdateAnimated:", 1);

      -[ICAttributionSidebarView attributionLayoutManager](self, "attributionLayoutManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setFilter:", v7);

      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __47__ICAttributionSidebarView_setFilter_animated___block_invoke;
      v20[3] = &unk_1EA7DD498;
      v20[4] = self;
      v21 = v7;
      -[ICAttributionSidebarView reloadAttributionsWithCompletion:](self, "reloadAttributionsWithCompletion:", v20);

      goto LABEL_16;
    }
    v16 = objc_msgSend((id)v11, "isEqual:", v13);

    if ((v16 & 1) == 0)
      goto LABEL_15;
  }
LABEL_16:

}

void __47__ICAttributionSidebarView_setFilter_animated___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __47__ICAttributionSidebarView_setFilter_animated___block_invoke_2;
  v2[3] = &unk_1EA7DD498;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

void __47__ICAttributionSidebarView_setFilter_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "authorHighlightsUpdater");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highlightedRangeValue");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v8;
  if (*(_QWORD *)(a1 + 40))
    v4 = v8 == 0;
  else
    v4 = 1;
  if (!v4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = objc_msgSend(v8, "rangeValue");
    objc_msgSend(v5, "scrollToRangeIfNeeded:", v6, v7);
    v3 = v8;
  }

}

- (void)willEnterForeground:(id)a3
{
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[ICAttributionSidebarView visibleContentWidth](self, "visibleContentWidth", a3);
  v5 = v4;
  -[ICAttributionSidebarView fullContentWidth](self, "fullContentWidth");
  if (v5 == v6)
  {
    -[ICAttributionSidebarView textView](self, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "editorController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "eventReporter");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    -[ICAttributionSidebarView textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "editorController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "note");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(v12, "startAttributionSideBarViewEventForNote:", v11);

  }
}

- (void)analyticsSessionWillEnd:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[ICAttributionSidebarView textView](self, "textView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "editorController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventReporter");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[ICAttributionSidebarView textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "editorController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "note");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v9, "submitAttributionSideBarViewEventForNote:contextPath:startState:endState:", v8, 0, 3, 3);

}

- (BOOL)accessibilityElementsHidden
{
  double v3;
  double v4;
  double v5;

  -[ICAttributionSidebarView visibleContentWidth](self, "visibleContentWidth");
  v4 = v3;
  -[ICAttributionSidebarView fullContentWidth](self, "fullContentWidth");
  return v4 < v5;
}

- (void)reloadAttributionsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ICAttributionSidebarView attributionLayoutManager](self, "attributionLayoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__ICAttributionSidebarView_reloadAttributionsWithCompletion___block_invoke;
  v7[3] = &unk_1EA7E1230;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "reloadConfigurationsWithCompletion:", v7);

}

void __61__ICAttributionSidebarView_reloadAttributionsWithCompletion___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 40);
  performBlockOnMainThread();

}

uint64_t __61__ICAttributionSidebarView_reloadAttributionsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "renderAttributions");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)reloadAttributions
{
  -[ICAttributionSidebarView reloadAttributionsWithCompletion:](self, "reloadAttributionsWithCompletion:", 0);
}

- (void)renderAttributions
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  ICAttributionView *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[ICAttributionSidebarView removeAllAttributionViews](self, "removeAllAttributionViews");
  -[ICAttributionSidebarView textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "editorController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSharedViaICloud");

  if (v6)
  {
    -[ICAttributionSidebarView attributionLayoutManager](self, "attributionLayoutManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewConfigurations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICAttributionSidebarView focusedAttributionViewConfiguration](self, "focusedAttributionViewConfiguration");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      -[ICAttributionSidebarView focusedAttributionViewConfiguration](self, "focusedAttributionViewConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v8, "containsObject:", v11);

      if ((v12 & 1) == 0)
      {
        -[ICAttributionSidebarView setFocusedAttributionViewConfiguration:](self, "setFocusedAttributionViewConfiguration:", 0);
        -[ICAttributionSidebarView authorHighlightsUpdater](self, "authorHighlightsUpdater");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setFocusedRangeValue:", 0);

        -[ICAttributionSidebarView authorHighlightsUpdater](self, "authorHighlightsUpdater");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "scheduleUpdateAnimated:", 0);

      }
    }
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v15 = v8;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v31 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          -[ICAttributionSidebarView focusedAttributionViewConfiguration](self, "focusedAttributionViewConfiguration", (_QWORD)v30);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToAttributionViewConfiguration:", v20);

          objc_msgSend(v20, "setFocused:", v22);
          -[ICAttributionSidebarView focusedAttributionViewConfiguration](self, "focusedAttributionViewConfiguration");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
            v24 = v22 ^ 1;
          else
            v24 = 0;
          objc_msgSend(v20, "setBlurred:", v24);

          -[ICAttributionSidebarView visibleContentWidth](self, "visibleContentWidth");
          v26 = v25;
          -[ICAttributionSidebarView attributionLayoutManager](self, "attributionLayoutManager");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "previewPanelWidth");
          objc_msgSend(v20, "setPreview:", v26 < v28);

          v29 = -[ICAttributionView initWithConfiguration:]([ICAttributionView alloc], "initWithConfiguration:", v20);
          -[ICAttributionSidebarView renderAttributionView:](self, "renderAttributionView:", v29);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v17);
    }

  }
}

- (void)removeAllAttributionViews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[ICAttributionSidebarView subviews](self, "subviews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "removeFromSuperview");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[ICAttributionSidebarView attributionViewMap](self, "attributionViewMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

}

- (void)focusAttributionView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttributionSidebarView setFocusedAttributionViewConfiguration:](self, "setFocusedAttributionViewConfiguration:", v5);

  -[ICAttributionSidebarView focusedAttributionViewConfiguration](self, "focusedAttributionViewConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFocused:", 1);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[ICAttributionSidebarView attributionViewMap](self, "attributionViewMap", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(id *)(*((_QWORD *)&v22 + 1) + 8 * v12);
        if (v13 != v4)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v12), "configuration");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setBlurred:", 1);

        }
        objc_msgSend(v13, "updateContentAnimated:", 1);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  v15 = (void *)MEMORY[0x1E0CB3B18];
  -[ICAttributionSidebarView focusedAttributionViewConfiguration](self, "focusedAttributionViewConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "range");
  objc_msgSend(v15, "valueWithRange:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttributionSidebarView authorHighlightsUpdater](self, "authorHighlightsUpdater");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFocusedRangeValue:", v19);

  -[ICAttributionSidebarView authorHighlightsUpdater](self, "authorHighlightsUpdater");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "scheduleUpdateAnimated:", 1);

}

- (void)renderAttributionView:(id)a3
{
  ICAttributionSidebarView *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "superview");
  v4 = (ICAttributionSidebarView *)objc_claimAutoreleasedReturnValue();

  if (v4 != self)
    -[ICAttributionSidebarView addSubview:](self, "addSubview:", v8);
  -[ICAttributionSidebarView attributionViewMap](self, "attributionViewMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v8, v6);

  objc_msgSend(v8, "updateContentAnimated:", 0);
  objc_msgSend(v8, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "adjustedFrame");
  objc_msgSend(v8, "setFrame:");

}

- (void)scrollToRangeIfNeeded:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSRange v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
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
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  BOOL v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  void *v68;
  uint64_t v69;
  double v70;
  double v71;
  id v72;
  _QWORD v73[7];
  NSRange v74;
  NSRange v75;
  CGRect v76;
  CGRect v77;

  length = a3.length;
  location = a3.location;
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __50__ICAttributionSidebarView_scrollToRangeIfNeeded___block_invoke;
    v73[3] = &unk_1EA7DEA60;
    v73[4] = self;
    v73[5] = location;
    v73[6] = length;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v73);
    return;
  }
  -[ICAttributionSidebarView textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "ic_range");
  v10 = v9;

  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    v74.location = v8;
    v74.length = v10;
    v75.location = location;
    v75.length = length;
    v11 = NSUnionRange(v74, v75);
    if (v11.location == v8 && v11.length == v10)
    {
      -[ICAttributionSidebarView textView](self, "textView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "layoutManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "ensureLayoutForCharacterRange:", location, length);

      -[ICAttributionSidebarView textView](self, "textView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "layoutManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "ensureGlyphsForCharacterRange:", location, length);

      -[ICAttributionSidebarView textView](self, "textView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "ic_rectForRange:", location, length);
      v69 = v17;

      -[ICAttributionSidebarView textView](self, "textView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bounds");
      v20 = v19;
      v22 = v21;
      v71 = v23;
      v25 = v24;
      -[ICAttributionSidebarView textView](self, "textView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "contentInset");
      v28 = v27;
      v30 = v29;
      v32 = v29 + v31;
      v34 = v27 + v33;

      -[ICAttributionSidebarView textView](self, "textView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "editorController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "presentedViewController");
      v72 = (id)objc_claimAutoreleasedReturnValue();

      -[ICAttributionSidebarView textView](self, "textView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0.0;
      if (objc_msgSend(v37, "ic_hasCompactWidth"))
      {
        objc_msgSend(v72, "view");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "window");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v40)
        {
LABEL_10:
          v42 = v20 + v30;
          v43 = v25 - v34;
          -[ICAttributionSidebarView textView](self, "textView", v69);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "editorController");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "activityStreamToolbar");
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          if (v46)
          {
            -[ICAttributionSidebarView textView](self, "textView");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "editorController");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "activityStreamToolbar");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "frame");
            v38 = v38 + v50;

          }
          v51 = v70;
          v52 = v43 - v38;
          v77.origin.x = 0.0;
          v77.size.width = 0.0;
          v77.size.height = 0.0;
          v76.origin.x = v42;
          v76.origin.y = v22 + v28;
          v76.size.width = v71 - v32;
          v76.size.height = v52;
          v77.origin.y = v70;
          if (!CGRectContainsRect(v76, v77))
          {
            if (v70 <= v22 + v28 + v52)
            {
              v63 = -44.0;
            }
            else
            {
              -[ICAttributionSidebarView attributionLayoutManager](self, "attributionLayoutManager");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "viewConfigurations");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "lastObject");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "associatedTextFrame");
              v57 = v56;
              v59 = v58;

              v60 = v57 + v59 - v70;
              v61 = v52 + v60;
              v62 = v60 < v52;
              v63 = 44.0;
              if (!v62)
              {
                v63 = -44.0;
                v61 = 0.0;
              }
              v51 = v70 - v61;
            }
            v64 = v63 + v51;
            -[ICAttributionSidebarView textView](self, "textView");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "safeAreaInsets");
            v67 = v64 - v66;

            -[ICAttributionSidebarView textView](self, "textView");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "setContentOffset:", 0.0, v67);

          }
          return;
        }
        objc_msgSend(v72, "view");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "frame");
        v38 = v41 + 0.0;
      }

      goto LABEL_10;
    }
  }
}

void __50__ICAttributionSidebarView_scrollToRangeIfNeeded___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "textView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollRangeToVisible:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (ICAuthorHighlightsUpdater)authorHighlightsUpdater
{
  return (ICAuthorHighlightsUpdater *)objc_loadWeakRetained((id *)&self->_authorHighlightsUpdater);
}

- (void)setVisibleContentWidth:(double)a3
{
  self->_visibleContentWidth = a3;
}

- (ICTTTextEditFilter)filter
{
  return self->_filter;
}

- (NSMapTable)attributionViewMap
{
  return self->_attributionViewMap;
}

- (void)setAttributionViewMap:(id)a3
{
  objc_storeStrong((id *)&self->_attributionViewMap, a3);
}

- (ICAttributionViewConfiguration)focusedAttributionViewConfiguration
{
  return self->_focusedAttributionViewConfiguration;
}

- (void)setFocusedAttributionViewConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_focusedAttributionViewConfiguration, a3);
}

- (BOOL)didExpandSidebar
{
  return self->_didExpandSidebar;
}

- (void)setDidExpandSidebar:(BOOL)a3
{
  self->_didExpandSidebar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionLayoutManager, 0);
  objc_storeStrong((id *)&self->_focusedAttributionViewConfiguration, 0);
  objc_storeStrong((id *)&self->_reloadAttributionsDelayer, 0);
  objc_storeStrong((id *)&self->_attributionViewMap, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_destroyWeak((id *)&self->_authorHighlightsUpdater);
  objc_destroyWeak((id *)&self->_textView);
}

@end
