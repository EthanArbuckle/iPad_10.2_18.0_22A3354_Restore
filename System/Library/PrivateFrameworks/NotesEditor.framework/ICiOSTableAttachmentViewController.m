@implementation ICiOSTableAttachmentViewController

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  -[ICiOSTableAttachmentViewController rowLongPress](self, "rowLongPress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICiOSTableAttachmentViewController ic_viewControllerManager](self, "ic_viewControllerManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mainSplitViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewControllerForColumn:", 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    ICDynamicCast();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "interactivePopGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICiOSTableAttachmentViewController rowLongPress](self, "rowLongPress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFailureRequirement:", v9);

  }
  -[ICiOSTableAttachmentViewController cleanUpKVOIfNeeded](self, "cleanUpKVOIfNeeded");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:", self);

  v11.receiver = self;
  v11.super_class = (Class)ICiOSTableAttachmentViewController;
  -[ICTableAttachmentViewController dealloc](&v11, sel_dealloc);
}

- (CGRect)editingViewport
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  -[ICiOSTableAttachmentViewController noteScrollView](self, "noteScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICiOSTableAttachmentViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentOffset");
    objc_msgSend(v6, "convertPoint:fromView:", v3);
    v8 = v7;
  }
  else
  {
    objc_msgSend(v3, "contentOffset");
    v10 = v9;
    -[ICTableAttachmentViewController proposedLineFragmentRect](self, "proposedLineFragmentRect");
    v12 = v10 - v11;
    -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "textContainerInset");
    -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lineFragmentPadding");

    -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textContainerInset");
    v8 = v12 - v16;
  }

  -[ICTableAttachmentViewController scrollView](self, "scrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contentOffset");
  v19 = v18;

  if (v3)
  {
    -[ICTableAttachmentViewController availableWidth](self, "availableWidth");
    v21 = v20;
    objc_msgSend(v3, "bounds");
    v23 = v22;
  }
  else
  {
    v21 = 0.0;
    v23 = 0.0;
  }

  v24 = v19;
  v25 = v8;
  v26 = v21;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (id)noteEditorViewController
{
  int IsTextKit2Enabled;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  objc_opt_class();
  -[ICiOSTableAttachmentViewController parentViewController](self, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (IsTextKit2Enabled)
  {
    ICCheckedDynamicCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "parentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)auxiliaryTextViewHost
{
  void *v2;
  void *v3;

  -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  ICClassAndProtocolCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICiOSTableAttachmentViewController;
  -[ICTableAttachmentViewController loadView](&v7, sel_loadView);
  -[ICTableAttachmentViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDirectionalLockEnabled:", 1);

  -[ICTableAttachmentViewController scrollView](self, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsVerticalScrollIndicator:", 0);

  -[ICTableAttachmentViewController scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[ICTableAttachmentViewController headerClipView](self, "headerClipView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAutoresizingMask:", 34);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICiOSTableAttachmentViewController;
  -[ICiOSTableAttachmentViewController viewDidLoad](&v7, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel_dragCellRange_);
  objc_msgSend(v3, "setMinimumPressDuration:", 0.0);
  -[ICTableAttachmentViewController startKnob](self, "startKnob");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addGestureRecognizer:", v3);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel_dragCellRange_);
  objc_msgSend(v5, "setMinimumPressDuration:", 0.0);
  -[ICTableAttachmentViewController endKnob](self, "endKnob");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addGestureRecognizer:", v5);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICiOSTableAttachmentViewController;
  -[ICiOSTableAttachmentViewController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICiOSTableAttachmentViewController;
  -[ICiOSTableAttachmentViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[ICiOSTableAttachmentViewController setupKVOIfNeeded](self, "setupKVOIfNeeded");
  if (ICInternalSettingsIsTextKit2Enabled())
    -[ICTableAttachmentViewController updateAllColumnWidthsAndRedraw](self, "updateAllColumnWidthsAndRedraw");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICiOSTableAttachmentViewController;
  -[ICiOSTableAttachmentViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[ICiOSTableAttachmentViewController cleanUpKVOIfNeeded](self, "cleanUpKVOIfNeeded");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ICiOSTableAttachmentViewController;
  -[ICiOSTableAttachmentViewController viewWillLayoutSubviews](&v13, sel_viewWillLayoutSubviews);
  -[ICiOSTableAttachmentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[ICTableAttachmentViewController scrollView](self, "scrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[ICTableAttachmentViewController updateTiles](self, "updateTiles");
}

- (void)viewDidLayoutSubviews
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD block[4];
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICiOSTableAttachmentViewController;
  -[ICiOSTableAttachmentViewController viewDidLayoutSubviews](&v10, sel_viewDidLayoutSubviews);
  v3 = -[ICTableAttachmentViewController shouldBeginInitialEditing](self, "shouldBeginInitialEditing");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    objc_initWeak(&location, self);
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __59__ICiOSTableAttachmentViewController_viewDidLayoutSubviews__block_invoke;
    block[3] = &unk_1EA7DD6B8;
    objc_copyWeak(&v8, &location);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    -[ICTableAttachmentViewController setShouldBeginInitialEditing:](self, "setShouldBeginInitialEditing:", 0);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  -[ICiOSTableAttachmentViewController performInitialLayoutIfNeeded](self, "performInitialLayoutIfNeeded");
  -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __59__ICiOSTableAttachmentViewController_viewDidLayoutSubviews__block_invoke_2;
  v6[3] = &unk_1EA7DDD30;
  v6[4] = self;
  objc_msgSend(v5, "enumerateTextViewsWithBlock:", v6);

}

void __59__ICiOSTableAttachmentViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "beginEditingInitialCell");

}

uint64_t __59__ICiOSTableAttachmentViewController_viewDidLayoutSubviews__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateKeyboardAppearanceForTextView:", a2);
}

- (void)willMoveToParentViewController:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICiOSTableAttachmentViewController;
  -[ICiOSTableAttachmentViewController willMoveToParentViewController:](&v5, sel_willMoveToParentViewController_);
  if (!a3)
    -[ICiOSTableAttachmentViewController cleanUpKVOIfNeeded](self, "cleanUpKVOIfNeeded");
}

- (void)didMoveToParentViewController:(id)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICiOSTableAttachmentViewController;
  -[ICiOSTableAttachmentViewController didMoveToParentViewController:](&v6, sel_didMoveToParentViewController_);
  if (a3)
  {
    -[ICTableAttachmentViewController textViewManager](self, "textViewManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parentViewDidChange");

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)ICiOSTableAttachmentViewController;
  -[ICiOSTableAttachmentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[ICiOSTableAttachmentViewController editingViewport](self, "editingViewport");
  -[ICTableAttachmentViewController setTransitionViewport:](self, "setTransitionViewport:");
  if (ICInternalSettingsIsTextKit2Enabled())
    -[ICTableAttachmentViewController updateAllColumnWidthsAndRedraw](self, "updateAllColumnWidthsAndRedraw");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__ICiOSTableAttachmentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_1EA7DD1E8;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", &__block_literal_global_1, v8);

}

void __89__ICiOSTableAttachmentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  _QWORD block[5];
  id v3;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "setTransitionViewport:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_initWeak(&location, *(id *)(a1 + 32));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__ICiOSTableAttachmentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
  block[3] = &unk_1EA7DDD98;
  objc_copyWeak(&v3, &location);
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __89__ICiOSTableAttachmentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "updateAllColumnWidthsAndRedraw");
    objc_msgSend(*(id *)(a1 + 32), "currentlyEditingTextView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v6;
    if (v3)
    {
      v4 = *(void **)(a1 + 32);
      objc_msgSend(v4, "currentlyEditingTextView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "scrollToCaretIfNeededForTextView:", v5);

      WeakRetained = v6;
    }
  }

}

- (void)setupKVOIfNeeded
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  if (!-[ICiOSTableAttachmentViewController isObservingContentOffset](self, "isObservingContentOffset"))
  {
    -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEditingOnSystemPaper");

    if ((v4 & 1) == 0)
    {
      -[ICiOSTableAttachmentViewController noteScrollView](self, "noteScrollView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ic_addObserver:forKeyPath:context:", self, CFSTR("contentOffset"), &compoundliteral);

      -[ICiOSTableAttachmentViewController setIsObservingContentOffset:](self, "setIsObservingContentOffset:", 1);
    }
    -[ICiOSTableAttachmentViewController view](self, "view");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ic_addObserver:forKeyPath:context:", self, CFSTR("frame"), &compoundliteral_581);

  }
}

- (void)cleanUpKVOIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[ICiOSTableAttachmentViewController isObservingContentOffset](self, "isObservingContentOffset"))
  {
    -[ICiOSTableAttachmentViewController noteScrollView](self, "noteScrollView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ic_removeObserver:forKeyPath:context:", self, CFSTR("contentOffset"), &compoundliteral);

    -[ICiOSTableAttachmentViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, CFSTR("frame"), &compoundliteral_581);

    -[ICiOSTableAttachmentViewController setIsObservingContentOffset:](self, "setIsObservingContentOffset:", 0);
  }
  -[ICiOSTableAttachmentViewController keyboardWillShowScrollObservation](self, "keyboardWillShowScrollObservation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[ICiOSTableAttachmentViewController keyboardWillShowScrollObservation](self, "keyboardWillShowScrollObservation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:", v6);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  char v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  _QWORD v34[5];
  objc_super v35;

  v10 = a4;
  v11 = a5;
  v12 = a3;
  if ((-[ICiOSTableAttachmentViewController ic_didAddObserverForContext:inScope:](self, "ic_didAddObserverForContext:inScope:", a6, "/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/Common/TextAttachmentUI/iOS/ICiOSTableAttachmentViewController.m") & 1) != 0)
  {
    v13 = -[ICiOSTableAttachmentViewController ic_shouldIgnoreObserveValue:ofObject:forKeyPath:](self, "ic_shouldIgnoreObserveValue:ofObject:forKeyPath:", v11, v10, v12);

    if ((v13 & 1) == 0)
    {
      if (a6 == &compoundliteral)
      {
        if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
          objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICiOSTableAttachmentViewController observeValueForKeyPath:ofObject:change:context:]", 1, 0, CFSTR("Unexpected call from background thread"));
        -[ICiOSTableAttachmentViewController previousNoteContentOffset](self, "previousNoteContentOffset");
        v25 = v24;
        v27 = v26;
        -[ICiOSTableAttachmentViewController noteScrollView](self, "noteScrollView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "contentOffset");
        v30 = v29;
        v32 = v31;

        if (v25 != v30 || v27 != v32)
        {
          -[ICiOSTableAttachmentViewController noteScrollView](self, "noteScrollView");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "contentOffset");
          -[ICiOSTableAttachmentViewController setPreviousNoteContentOffset:](self, "setPreviousNoteContentOffset:");

          v34[0] = MEMORY[0x1E0C809B0];
          v34[1] = 3221225472;
          v34[2] = __85__ICiOSTableAttachmentViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
          v34[3] = &unk_1EA7DD2D8;
          v34[4] = self;
          objc_msgSend(MEMORY[0x1E0DC3F10], "ic_performWithoutAnimation:", v34);
          objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_scrollViewDidEndScrollingAnimation_, v10);
          -[ICiOSTableAttachmentViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_scrollViewDidEndScrollingAnimation_, v10, 0.2);
        }
      }
      else if (a6 == &compoundliteral_581)
      {
        if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
          objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICiOSTableAttachmentViewController observeValueForKeyPath:ofObject:change:context:]", 1, 0, CFSTR("Unexpected call from background thread"));
        -[ICiOSTableAttachmentViewController previousViewOrigin](self, "previousViewOrigin");
        v15 = v14;
        v17 = v16;
        -[ICiOSTableAttachmentViewController view](self, "view");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "frame");
        v20 = v19;
        v22 = v21;

        if (v15 != v20 || v17 != v22)
        {
          -[ICiOSTableAttachmentViewController view](self, "view");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "frame");
          -[ICiOSTableAttachmentViewController setPreviousViewOrigin:](self, "setPreviousViewOrigin:");

          -[ICTableAttachmentViewController updateTiles](self, "updateTiles");
        }
      }
    }
  }
  else
  {
    v35.receiver = self;
    v35.super_class = (Class)ICiOSTableAttachmentViewController;
    -[ICiOSTableAttachmentViewController observeValueForKeyPath:ofObject:change:context:](&v35, sel_observeValueForKeyPath_ofObject_change_context_, v12, v10, v11, a6);

  }
}

uint64_t __85__ICiOSTableAttachmentViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateTiles");
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  id v5;

  -[ICTableAttachmentViewController updateTiles](self, "updateTiles", a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController scrollView](self, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("ICTableScrollViewBoundsDidChangeNotification"), v4);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_showRangeSelectionMenu, 0);
    -[ICiOSTableAttachmentViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_showRangeSelectionMenu, 0, 0.2);
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_showRangeSelectionMenu, 0);
  -[ICiOSTableAttachmentViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_showRangeSelectionMenu, 0, 0.2);
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_scrollViewDidEndScrollingAnimation_, a3);
  -[ICiOSTableAttachmentViewController showRangeSelectionMenu](self, "showRangeSelectionMenu");
}

- (void)didUpdateContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICiOSTableAttachmentViewController;
  -[ICTableAttachmentViewController didUpdateContentSize](&v9, sel_didUpdateContentSize);
  -[ICTableAttachmentViewController intrinsicSize](self, "intrinsicSize");
  v4 = v3;
  v6 = v5;
  -[ICTableAttachmentViewController scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentSize:", v4, v6);

  -[ICTableAttachmentViewController scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentInsetAdjustmentBehavior:", 2);

}

- (void)adjustScrollPositionByOffset:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  y = a3.y;
  x = a3.x;
  -[ICTableAttachmentViewController scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentOffset");
  v8 = v7;
  v10 = v9;

  -[ICTableAttachmentViewController scrollView](self, "scrollView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentOffset:", x + v8, y + v10);

}

- (void)scrollToRect:(CGRect)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  CGFloat height;
  CGFloat width;
  double y;
  id v10;
  void (**v11)(_QWORD);
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  const void *v35;
  CGFloat v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double MinY;
  double MaxY;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double MinX;
  double MaxX;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  CGRect rect;
  void *v78;
  void (**v79)(_QWORD);
  _QWORD v80[4];
  id v81;
  id v82;
  double v83;
  double v84;
  double v85;
  double v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;

  v5 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  rect.origin.x = a3.origin.x;
  v10 = a5;
  if (!-[ICTableAttachmentViewController preventScrolling](self, "preventScrolling"))
  {
    v75 = width;
    v73 = height;
    -[ICTableAttachmentViewController viewport](self, "viewport");
    v13 = v12;
    v15 = v14;
    v74 = v16;
    v18 = v17;
    -[ICiOSTableAttachmentViewController noteScrollView](self, "noteScrollView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "contentInset");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

    if (ICInternalSettingsIsTextKit2Enabled())
    {
      -[ICiOSTableAttachmentViewController noteScrollView](self, "noteScrollView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "safeAreaInsets");
      v21 = v29;

    }
    v30 = v13 + v23;
    v31 = v15 + v21;
    v32 = v21;
    v33 = v74 - (v23 + v27);
    v71 = v32;
    v34 = v18 - (v25 + v32);
    if (v10)
      v35 = v10;
    else
      v35 = &__block_literal_global_109;
    v11 = (void (**)(_QWORD))_Block_copy(v35);

    v87.origin.x = v30;
    v87.origin.y = v31;
    v87.size.width = v74 - (v23 + v27);
    v87.size.height = v34;
    v36 = v75;
    v98.origin.x = rect.origin.x;
    v98.origin.y = y;
    v98.size.width = v75;
    v98.size.height = v73;
    if (CGRectContainsRect(v87, v98))
    {
      v11[2](v11);
      goto LABEL_27;
    }
    -[ICiOSTableAttachmentViewController noteScrollView](self, "noteScrollView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController scrollView](self, "scrollView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICiOSTableAttachmentViewController noteScrollView](self, "noteScrollView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "convertRect:fromView:", v40, rect.origin.x, y, v75, v73);
    v67 = v42;
    v68 = v41;
    v65 = v44;
    v66 = v43;

    objc_msgSend(v37, "contentOffset");
    v69 = v45;
    v70 = v46;
    v88.origin.x = rect.origin.x;
    v88.origin.y = y;
    v88.size.width = v75;
    v88.size.height = v73;
    MinY = CGRectGetMinY(v88);
    v89.origin.x = v30;
    v89.origin.y = v31;
    v89.size.width = v33;
    v89.size.height = v34;
    if (MinY < CGRectGetMinY(v89))
      goto LABEL_12;
    v90.origin.x = rect.origin.x;
    v90.origin.y = y;
    v90.size.width = v75;
    v90.size.height = v73;
    MaxY = CGRectGetMaxY(v90);
    v91.origin.x = v30;
    v91.origin.y = v31;
    v91.size.width = v33;
    v91.size.height = v34;
    if (MaxY > CGRectGetMaxY(v91))
    {
LABEL_12:
      v92.origin.y = v67;
      v92.origin.x = v68;
      v92.size.height = v65;
      v92.size.width = v66;
      v49 = CGRectGetMidY(v92) + v34 * -0.5 - v71;
      objc_msgSend(v37, "contentSize");
      v51 = v50 - v34;
      objc_msgSend(v37, "contentInset");
      v53 = -v52;
      if (v49 >= v51)
        v54 = v51;
      else
        v54 = v49;
      v36 = v75;
      if (v54 > v53)
        v53 = v54;
      v70 = v53;
    }
    objc_msgSend(v38, "contentOffset", *(_QWORD *)&v65, *(_QWORD *)&v66, *(_QWORD *)&v67, *(_QWORD *)&v68);
    v72 = v55;
    v76 = v56;
    v93.origin.x = rect.origin.x;
    v93.origin.y = y;
    v93.size.width = v36;
    v93.size.height = v73;
    MinX = CGRectGetMinX(v93);
    v94.size.height = v34;
    v94.origin.x = v30;
    v94.origin.y = v31;
    v94.size.width = v33;
    if (MinX < CGRectGetMinX(v94))
      goto LABEL_20;
    v95.origin.x = rect.origin.x;
    v95.origin.y = y;
    v95.size.width = v36;
    v95.size.height = v73;
    MaxX = CGRectGetMaxX(v95);
    v96.origin.x = v30;
    v96.origin.y = v31;
    v96.size.width = v33;
    v96.size.height = v34;
    if (MaxX <= CGRectGetMaxX(v96))
    {
      v62 = v72;
      if (v5)
      {
LABEL_23:
        v63 = (void *)MEMORY[0x1E0DC3F10];
        v64 = MEMORY[0x1E0C809B0];
        v80[0] = MEMORY[0x1E0C809B0];
        v80[1] = 3221225472;
        v80[2] = __71__ICiOSTableAttachmentViewController_scrollToRect_animated_completion___block_invoke_2;
        v80[3] = &unk_1EA7DDDE0;
        v81 = v37;
        v83 = v69;
        v84 = v70;
        v82 = v38;
        v85 = v62;
        v86 = v76;
        rect.origin.y = v64;
        *(_QWORD *)&rect.size.width = 3221225472;
        *(_QWORD *)&rect.size.height = __71__ICiOSTableAttachmentViewController_scrollToRect_animated_completion___block_invoke_3;
        v78 = &unk_1EA7DDE08;
        v79 = v11;
        objc_msgSend(v63, "ic_animateWithDuration:animations:completion:", v80, &rect.origin.y, 0.3);

LABEL_26:
        goto LABEL_27;
      }
    }
    else
    {
LABEL_20:
      v97.origin.x = rect.origin.x;
      v97.origin.y = y;
      v97.size.width = v36;
      v97.size.height = v73;
      v59 = CGRectGetMidX(v97) + v33 * -0.5;
      -[ICTableAttachmentViewController intrinsicSize](self, "intrinsicSize");
      v61 = v60 - v74;
      if (v59 < v61)
        v61 = v59;
      v62 = fmax(v61, 0.0);
      if (v5)
        goto LABEL_23;
    }
    objc_msgSend(v37, "setContentOffset:", v69, v70);
    objc_msgSend(v38, "setContentOffset:", v62, v76);
    v11[2](v11);
    goto LABEL_26;
  }
  v11 = (void (**)(_QWORD))v10;
LABEL_27:

}

uint64_t __71__ICiOSTableAttachmentViewController_scrollToRect_animated_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setContentOffset:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 40), "setContentOffset:", *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __71__ICiOSTableAttachmentViewController_scrollToRect_animated_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)beginEditingNoteAtRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  length = a3.length;
  location = a3.location;
  objc_opt_class();
  -[ICiOSTableAttachmentViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "editorController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSelectedRange:", location, length);

  objc_msgSend(v7, "editorController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startEditing");

  -[ICiOSTableAttachmentViewController speakAccessibilityExitedTableAnnouncementAndDidRemoveRow:](self, "speakAccessibilityExitedTableAnnouncementAndDidRemoveRow:", 0);
}

- (id)dragSnapshotFromRect:(CGRect)a3 afterScreenUpdates:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[ICTableAttachmentViewController scrollView](self, "scrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", v4, x, y, width, height, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
  {
    objc_msgSend(v11, "setBackgroundColor:", 0);
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0DC3658];
    -[ICiOSTableAttachmentViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ic_attachmentBackgroundColorForTraitCollection:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "colorWithAlphaComponent:", 0.7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v16);

  }
  return v11;
}

- (void)setupTableTextView:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICiOSTableAttachmentViewController;
  v4 = a3;
  -[ICTableAttachmentViewController setupTableTextView:](&v5, sel_setupTableTextView_, v4);
  -[ICiOSTableAttachmentViewController updateKeyboardAppearanceForTextView:](self, "updateKeyboardAppearanceForTextView:", v4, v5.receiver, v5.super_class);

}

- (void)updateKeyboardAppearanceForTextView:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOverrideUserInterfaceStyle:", objc_msgSend(v5, "overrideUserInterfaceStyle"));

  -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKeyboardAppearance:", objc_msgSend(v6, "keyboardAppearance"));

}

- (void)setupEventHandling
{
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_didTapEmptyTable_);
  objc_msgSend(v4, "setDelegate:", self);
  -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addGestureRecognizer:", v4);

}

- (void)didTapEmptyTable:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  if (objc_msgSend(v12, "state") == 3)
  {
    -[ICTableAttachmentViewController table](self, "table");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "columnCount"))
    {

LABEL_6:
      -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "locationInView:", v7);
      v9 = v8;
      v11 = v10;

      -[ICTableAttachmentViewController tappedTableAtLocation:](self, "tappedTableAtLocation:", v9, v11);
      goto LABEL_7;
    }
    -[ICTableAttachmentViewController table](self, "table");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "rowCount");

    if (!v6)
      goto LABEL_6;
  }
LABEL_7:

}

- (BOOL)becomeFirstResponderForAuxStyling
{
  void *v2;
  char v3;

  -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "becomeFirstResponder");

  return v3;
}

- (BOOL)resignFirstResponderForAuxStyling
{
  void *v2;
  char v3;

  -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "resignFirstResponder");

  return v3;
}

- (void)ic_makeFirstResponder:(id)a3
{
  objc_msgSend(a3, "becomeFirstResponder");
}

- (void)ic_resignFirstResponder:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
}

- (void)makeDelegateOfTextView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setIcDelegate:", self);
  objc_msgSend(v4, "layoutManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setDelegate:", self);
}

- (BOOL)cursorPrefersWordBoundary
{
  return 1;
}

- (unint64_t)preferredNavigationSelection
{
  return 2;
}

- (void)willBeginEditingWithTextView:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICiOSTableAttachmentViewController;
  -[ICTableAttachmentViewController willBeginEditingWithTextView:](&v7, sel_willBeginEditingWithTextView_, a3);
  -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEditable");

  if ((v5 & 1) == 0)
  {
    -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEditable:", 1);

  }
}

- (void)didBeginEditingWithTextView:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICiOSTableAttachmentViewController;
  -[ICTableAttachmentViewController didBeginEditingWithTextView:](&v6, sel_didBeginEditingWithTextView_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("ICNoteEditorViewControllerSelectionDidChangeNotification"), v5);

}

- (void)cellFirstResponderChanged
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICiOSTableAttachmentViewController;
  -[ICTableAttachmentViewController cellFirstResponderChanged](&v4, sel_cellFirstResponderChanged);
  -[ICiOSTableAttachmentViewController convertUnconfirmedHashtagsMentionsIfNecessary](self, "convertUnconfirmedHashtagsMentionsIfNecessary");
  -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableCellFirstResponderChanged");

}

- (void)convertUnconfirmedHashtagsMentionsIfNecessary
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  uint64_t v33;
  id v34;

  -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[ICTableAttachmentViewController currentlyEditingTextStorage](self, "currentlyEditingTextStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "editorController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mentionsController");
      v34 = (id)objc_claimAutoreleasedReturnValue();

      v8 = (void *)MEMORY[0x1E0D63BB0];
      -[ICTableAttachmentViewController currentlyEditingTextStorage](self, "currentlyEditingTextStorage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "rangeOfUnconfirmedMentionInTextStorage:", v9);
      v12 = v11;

      if (v10 != 0x7FFFFFFFFFFFFFFFLL && v12)
      {
        -[ICTableAttachmentViewController currentlyEditingTextStorage](self, "currentlyEditingTextStorage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTableAttachmentViewController note](self, "note");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "languageHasSpaces");
        -[ICAttachmentViewController attachment](self, "attachment");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        BYTE1(v33) = v17;
        LOBYTE(v33) = 1;
        objc_msgSend(v34, "checkForMentionInEditedRange:ofTextStorage:note:textView:allowAutoExplicitMention:isEndingEditing:languageHasSpaces:parentAttachment:", v10, v12, v13, v14, v15, 1, v33, v18);

      }
      -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "editorController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "hashtagController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)MEMORY[0x1E0D63B28];
      -[ICTableAttachmentViewController currentlyEditingTextStorage](self, "currentlyEditingTextStorage");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "rangeOfUnconfirmedHashtagInTextStorage:", v23);
      v26 = v25;

      if (v24 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v26)
        {
          -[ICTableAttachmentViewController currentlyEditingTextStorage](self, "currentlyEditingTextStorage");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICTableAttachmentViewController note](self, "note");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "languageHasSpaces");
          -[ICAttachmentViewController attachment](self, "attachment");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          BYTE1(v33) = v31;
          LOBYTE(v33) = 1;
          objc_msgSend(v21, "checkForHashtagInEditedRange:ofTextStorage:note:textView:allowAutoExplicitHashtag:isEndingEditing:languageHasSpaces:parentAttachment:", v24, v26, v27, v28, v29, 1, v33, v32);

        }
      }

    }
  }
}

- (void)showButtonsAtColumns:(id)a3 rows:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  ICTableColumnRowButton *v11;
  void *v12;
  id v13;
  ICTableColumnRowButton *v14;
  void *v15;
  id v16;
  void *v17;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
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
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  id v79;

  v6 = a4;
  v7 = a3;
  -[ICTableAttachmentViewController columnButton](self, "columnButton");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8
    || (v9 = (void *)v8,
        -[ICTableAttachmentViewController rowButton](self, "rowButton"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        !v10))
  {
    v11 = [ICTableColumnRowButton alloc];
    -[ICTableAttachmentViewController table](self, "table");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[ICTableColumnRowButton initAsColumn:isLeftToRight:](v11, "initAsColumn:isLeftToRight:", 1, objc_msgSend(v12, "isLeftToRight"));
    -[ICTableAttachmentViewController setColumnButton:](self, "setColumnButton:", v13);

    v14 = [ICTableColumnRowButton alloc];
    -[ICTableAttachmentViewController table](self, "table");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[ICTableColumnRowButton initAsColumn:isLeftToRight:](v14, "initAsColumn:isLeftToRight:", 0, objc_msgSend(v15, "isLeftToRight"));
    -[ICTableAttachmentViewController setRowButton:](self, "setRowButton:", v16);

    -[ICTableAttachmentViewController columnButton](self, "columnButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addTarget:action:forControlEvents:", self, sel_columnButtonTouched_, 1);

    -[ICTableAttachmentViewController columnButton](self, "columnButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addTarget:action:forControlEvents:", self, sel_columnButtonPressed_, 64);

    -[ICTableAttachmentViewController columnButton](self, "columnButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addTarget:action:forControlEvents:", self, sel_columnButtonMenuActionTriggered_, 0x4000);

    -[ICTableAttachmentViewController columnButton](self, "columnButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setExclusiveTouch:", 1);

    -[ICTableAttachmentViewController columnButton](self, "columnButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setShowsMenuAsPrimaryAction:", 1);

    -[ICTableAttachmentViewController rowButton](self, "rowButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addTarget:action:forControlEvents:", self, sel_rowButtonTouched_, 1);

    -[ICTableAttachmentViewController rowButton](self, "rowButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addTarget:action:forControlEvents:", self, sel_rowButtonPressed_, 64);

    -[ICTableAttachmentViewController rowButton](self, "rowButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addTarget:action:forControlEvents:", self, sel_rowButtonMenuActionTriggered_, 0x4000);

    -[ICTableAttachmentViewController rowButton](self, "rowButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setExclusiveTouch:", 1);

    -[ICTableAttachmentViewController rowButton](self, "rowButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setShowsMenuAsPrimaryAction:", 1);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Column selection handle"), &stru_1EA7E9860, 0);
    v79 = v6;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController columnButton](self, "columnButton");
    v78 = v7;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setAccessibilityLabel:", v28);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("Double tap and drag to reorder this column."), &stru_1EA7E9860, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController columnButton](self, "columnButton");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setAccessibilityHint:", v31);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Row selection handle"), &stru_1EA7E9860, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController rowButton](self, "rowButton");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setAccessibilityLabel:", v34);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("Double tap and drag to reorder this row."), &stru_1EA7E9860, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController rowButton](self, "rowButton");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setAccessibilityHint:", v37);

    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel_dragColumn_);
    objc_msgSend(v39, "setDelegate:", self);
    -[ICTableAttachmentViewController columnButton](self, "columnButton");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addGestureRecognizer:", v39);

    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel_dragColumn_);
    objc_msgSend(v41, "setDelegate:", self);
    objc_msgSend(v41, "setMinimumPressDuration:", 0.3);
    -[ICTableAttachmentViewController columnButton](self, "columnButton");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addGestureRecognizer:", v41);

    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel_dragRow_);
    objc_msgSend(v43, "setDelegate:", self);
    -[ICTableAttachmentViewController rowButton](self, "rowButton");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addGestureRecognizer:", v43);

    v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel_dragRow_);
    objc_msgSend(v45, "setDelegate:", self);
    objc_msgSend(v45, "setMinimumPressDuration:", 0.3);
    -[ICTableAttachmentViewController rowButton](self, "rowButton");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addGestureRecognizer:", v45);

    -[ICiOSTableAttachmentViewController setRowLongPress:](self, "setRowLongPress:", v45);
    -[ICiOSTableAttachmentViewController ic_viewControllerManager](self, "ic_viewControllerManager");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "mainSplitViewController");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "viewControllerForColumn:", 3);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    ICDynamicCast();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "interactivePopGestureRecognizer");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v51, "requireGestureRecognizerToFail:", v45);
    -[ICiOSTableAttachmentViewController view](self, "view");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "outsideViews");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController columnButton](self, "columnButton");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addObject:", v54);

    -[ICiOSTableAttachmentViewController view](self, "view");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "outsideViews");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController rowButton](self, "rowButton");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "addObject:", v57);

    -[ICiOSTableAttachmentViewController invalidateCachedChildrenForAccessibilityReparenting](self, "invalidateCachedChildrenForAccessibilityReparenting");
    v7 = v78;

    v6 = v79;
  }
  -[ICTableAttachmentViewController columnButton](self, "columnButton");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "superview");
  v59 = objc_claimAutoreleasedReturnValue();
  if (!v59)
  {

LABEL_8:
    -[ICTableAttachmentViewController headerClipView](self, "headerClipView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController columnButton](self, "columnButton");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "addSubview:", v64);

    -[ICiOSTableAttachmentViewController view](self, "view");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController rowButton](self, "rowButton");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "addSubview:", v66);

    goto LABEL_9;
  }
  v60 = (void *)v59;
  -[ICTableAttachmentViewController rowButton](self, "rowButton");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "superview");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v62)
    goto LABEL_8;
LABEL_9:
  -[ICTableAttachmentViewController columnButton](self, "columnButton");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setColumnOrRowIdentifiers:", v7);

  -[ICTableAttachmentViewController rowButton](self, "rowButton");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setColumnOrRowIdentifiers:", v6);

  -[ICTableAttachmentViewController showColumnRowButtons](self, "showColumnRowButtons");
  v69 = *MEMORY[0x1E0C9D648];
  v70 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v71 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v72 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  -[ICTableAttachmentViewController columnButton](self, "columnButton");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setFrame:", v69, v70, v71, v72);

  -[ICTableAttachmentViewController rowButton](self, "rowButton");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setFrame:", v69, v70, v71, v72);

  -[ICTableAttachmentViewController updateButtonFrames](self, "updateButtonFrames");
  -[ICiOSTableAttachmentViewController view](self, "view");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "superview");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICiOSTableAttachmentViewController view](self, "view");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "bringSubviewToFront:", v77);

  -[ICiOSTableAttachmentViewController updateAccessibilityValueForColumnAndRowButtons](self, "updateAccessibilityValueForColumnAndRowButtons");
}

- (void)updateChrome
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  ICiOSTableAttachmentViewController *v13;
  void *v14;
  ICiOSTableAttachmentViewController *v15;
  objc_super v16;

  if (!-[ICTableAttachmentViewController lockSelection](self, "lockSelection"))
  {
    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "moving");

    if ((v4 & 1) == 0)
    {
      v16.receiver = self;
      v16.super_class = (Class)ICiOSTableAttachmentViewController;
      -[ICTableAttachmentViewController updateChrome](&v16, sel_updateChrome);
      -[ICiOSTableAttachmentViewController columnMenu](self, "columnMenu");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTableAttachmentViewController columnButton](self, "columnButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setMenu:", v5);

      -[ICiOSTableAttachmentViewController rowMenu](self, "rowMenu");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTableAttachmentViewController rowButton](self, "rowButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setMenu:", v7);

      -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "type");

      if ((unint64_t)(v10 - 1) < 4)
      {
        -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v13 = self;
LABEL_5:
        objc_msgSend(v11, "setAuxiliaryStylingController:", v13);

        return;
      }
      if (!v10)
      {
        -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "auxiliaryStylingController");
        v15 = (ICiOSTableAttachmentViewController *)objc_claimAutoreleasedReturnValue();

        if (v15 == self)
        {
          -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          v13 = 0;
          goto LABEL_5;
        }
      }
    }
  }
}

- (void)unselectColumnRow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICiOSTableAttachmentViewController;
  -[ICTableAttachmentViewController unselectColumnRow](&v9, sel_unselectColumnRow);
  -[ICTableAttachmentViewController columnButton](self, "columnButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSelected:", 0);

  -[ICiOSTableAttachmentViewController columnMenu](self, "columnMenu");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController columnButton](self, "columnButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMenu:", v4);

  -[ICTableAttachmentViewController rowButton](self, "rowButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelected:", 0);

  -[ICiOSTableAttachmentViewController rowMenu](self, "rowMenu");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController rowButton](self, "rowButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMenu:", v7);

}

- (void)columnButtonTouched:(id)a3
{
  -[ICiOSTableAttachmentViewController setTouchingColumnButton:](self, "setTouchingColumnButton:", 1);
  dispatchMainAfterDelay();
}

void __58__ICiOSTableAttachmentViewController_columnButtonTouched___block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "isTouchingColumnButton"))
  {
    objc_msgSend(*(id *)(a1 + 32), "columnButton");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setMenu:", 0);

  }
}

- (void)columnButtonPressed:(id)a3
{
  id v4;
  uint64_t v5;
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
  id v18;

  v4 = a3;
  -[ICiOSTableAttachmentViewController setTouchingColumnButton:](self, "setTouchingColumnButton:", 0);
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "columnOrRowIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)v5, "selectColumns:", v6);
  -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v7, "ic_isFirstResponder");

  if ((v5 & 1) == 0)
  {
    -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[ICTableAttachmentViewController scrollView](self, "scrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);

    -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "becomeFirstResponder");

  }
  -[ICiOSTableAttachmentViewController updateChrome](self, "updateChrome");
  -[ICTableAttachmentViewController columnButton](self, "columnButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSelected:", 1);

  -[ICiOSTableAttachmentViewController columnMenu](self, "columnMenu");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController columnButton](self, "columnButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMenu:", v13);

  -[ICTableAttachmentViewController rowButton](self, "rowButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSelected:", 0);

  -[ICiOSTableAttachmentViewController rowMenu](self, "rowMenu");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController rowButton](self, "rowButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMenu:", v16);

  -[ICTableAttachmentViewController showColumnRowButtons](self, "showColumnRowButtons");
  -[ICTableAttachmentViewController tableAXController](self, "tableAXController");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "tableRowOrColumnSelectionDidChange");

}

- (void)columnButtonMenuActionTriggered:(id)a3
{
  void *v4;
  id v5;

  -[ICiOSTableAttachmentViewController setTouchingColumnButton:](self, "setTouchingColumnButton:", 0);
  -[ICiOSTableAttachmentViewController columnMenu](self, "columnMenu");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController columnButton](self, "columnButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMenu:", v5);

}

- (void)rowButtonTouched:(id)a3
{
  -[ICiOSTableAttachmentViewController setTouchingRowButton:](self, "setTouchingRowButton:", 1);
  dispatchMainAfterDelay();
}

void __55__ICiOSTableAttachmentViewController_rowButtonTouched___block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "isTouchingRowButton"))
  {
    objc_msgSend(*(id *)(a1 + 32), "rowButton");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setMenu:", 0);

  }
}

- (void)rowButtonPressed:(id)a3
{
  id v4;
  uint64_t v5;
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
  id v18;

  v4 = a3;
  -[ICiOSTableAttachmentViewController setTouchingRowButton:](self, "setTouchingRowButton:", 0);
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "columnOrRowIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)v5, "selectRows:", v6);
  -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v7, "ic_isFirstResponder");

  if ((v5 & 1) == 0)
  {
    -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[ICTableAttachmentViewController scrollView](self, "scrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);

    -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "becomeFirstResponder");

  }
  -[ICiOSTableAttachmentViewController updateChrome](self, "updateChrome");
  -[ICTableAttachmentViewController columnButton](self, "columnButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSelected:", 0);

  -[ICiOSTableAttachmentViewController columnMenu](self, "columnMenu");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController columnButton](self, "columnButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMenu:", v13);

  -[ICTableAttachmentViewController rowButton](self, "rowButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSelected:", 1);

  -[ICiOSTableAttachmentViewController rowMenu](self, "rowMenu");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController rowButton](self, "rowButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMenu:", v16);

  -[ICTableAttachmentViewController showColumnRowButtons](self, "showColumnRowButtons");
  -[ICTableAttachmentViewController tableAXController](self, "tableAXController");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "tableRowOrColumnSelectionDidChange");

}

- (void)rowButtonMenuActionTriggered:(id)a3
{
  void *v4;
  id v5;

  -[ICiOSTableAttachmentViewController setTouchingRowButton:](self, "setTouchingRowButton:", 0);
  -[ICiOSTableAttachmentViewController rowMenu](self, "rowMenu");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController rowButton](self, "rowButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMenu:", v5);

}

- (void)showSelectionMenuFromRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat MaxX;
  void *v9;
  double MinX;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  MaxX = CGRectGetMaxX(v19);
  v9 = v18;
  if (MaxX > 0.0)
  {
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    MinX = CGRectGetMinX(v20);
    -[ICiOSTableAttachmentViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    if (MinX >= CGRectGetWidth(v21))
    {
LABEL_5:

      v9 = v18;
      goto LABEL_6;
    }
    v12 = objc_msgSend(v18, "isMenuVisible");

    v9 = v18;
    if ((v12 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObserver:selector:name:object:", self, sel_menuWillHide_, *MEMORY[0x1E0DC5048], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObserver:selector:name:object:", self, sel_menuDidHide_, *MEMORY[0x1E0DC5040], 0);

      -[ICiOSTableAttachmentViewController view](self, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "showMenuFromView:rect:", v15, x, y, width, height);

      LODWORD(v15) = *MEMORY[0x1E0DC4578];
      objc_msgSend(MEMORY[0x1E0DC3538], "sharedCalloutBar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_accessibleSubviews");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification((UIAccessibilityNotifications)v15, v17);

      goto LABEL_5;
    }
  }
LABEL_6:

}

- (void)ensureGesturesOnSelectionGrabbers:(id)a3
{
  void *v4;
  char v5;
  ICTableSelectionGrabberRecognizer *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "gestureRecognizers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "ic_containsObjectOfClass:", objc_opt_class());

  if ((v5 & 1) == 0)
  {
    v6 = -[ICTableSelectionGrabberRecognizer initWithTarget:action:]([ICTableSelectionGrabberRecognizer alloc], "initWithTarget:action:", self, sel_dragTextRange_);
    -[ICTableSelectionGrabberRecognizer setMinimumPressDuration:](v6, "setMinimumPressDuration:", 0.0);
    -[ICTableSelectionGrabberRecognizer setCancelsTouchesInView:](v6, "setCancelsTouchesInView:", 0);
    -[ICTableSelectionGrabberRecognizer setDelegate:](v6, "setDelegate:", self);
    objc_msgSend(v7, "addGestureRecognizer:", v6);

  }
}

- (void)dragTextRange:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _QWORD block[5];

  v4 = a3;
  if (objc_msgSend(v4, "state") == 2)
  {
    -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v5);
    v7 = v6;
    v9 = v8;

    -[ICTableAttachmentViewController textRangeDraggedAtLocation:](self, "textRangeDraggedAtLocation:", v7, v9);
  }
  else if (objc_msgSend(v4, "state") == 3 || objc_msgSend(v4, "state") == 4 || objc_msgSend(v4, "state") == 5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__ICiOSTableAttachmentViewController_dragTextRange___block_invoke;
    block[3] = &unk_1EA7DD2D8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __52__ICiOSTableAttachmentViewController_dragTextRange___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "textRangeDragEnded");
  return objc_msgSend(*(id *)(a1 + 32), "showRangeSelectionMenuAfterDelay");
}

- (void)dragCellRange:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "state") == 1)
  {
    objc_msgSend(v10, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController cellRangeDragBeganOnView:](self, "cellRangeDragBeganOnView:", v4);

  }
  else if (objc_msgSend(v10, "state") == 2)
  {
    -[ICTableAttachmentViewController tableContentView](self, "tableContentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locationInView:", v5);
    v7 = v6;
    v9 = v8;

    -[ICTableAttachmentViewController cellRangeDraggedAtLocation:](self, "cellRangeDraggedAtLocation:", v7, v9);
  }
  else if (objc_msgSend(v10, "state") == 3 || objc_msgSend(v10, "state") == 4 || objc_msgSend(v10, "state") == 5)
  {
    -[ICiOSTableAttachmentViewController showRangeSelectionMenu](self, "showRangeSelectionMenu");
  }

}

- (void)selectCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[ICiOSTableAttachmentViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  -[ICTableAttachmentViewController selectionHighlightView](self, "selectionHighlightView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "becomeFirstResponder");

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__ICiOSTableAttachmentViewController_selectCell__block_invoke;
  v7[3] = &unk_1EA7DD2D8;
  v7[4] = self;
  objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v7);
}

uint64_t __48__ICiOSTableAttachmentViewController_selectCell__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "tableSelection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "columnButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "columnOrRowIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "rowButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "columnOrRowIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectCellRangeAtColumns:rows:", v4, v6);

  objc_msgSend(*(id *)(a1 + 32), "updateChrome");
  return objc_msgSend(*(id *)(a1 + 32), "showRangeSelectionMenu");
}

- (void)showRangeSelectionMenuAfterDelay
{
  -[ICiOSTableAttachmentViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_showRangeSelectionMenu, 0, 0.075);
}

- (void)showRangeSelectionMenu
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  if (!UIAccessibilityIsVoiceOverRunning())
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_showRangeSelectionMenu, 0);
    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "type");

    if (v4 == 4)
    {
      -[ICTableAttachmentViewController startKnob](self, "startKnob");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "center");
      v7 = v6;
      v9 = v8;

      -[ICTableAttachmentViewController endKnob](self, "endKnob");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "center");
      v12 = v11;
      v14 = v13;

      if (v7 >= v12)
        v15 = v12;
      else
        v15 = v7;
      if (v9 >= v14)
        v16 = v14;
      else
        v16 = v9;
      -[ICiOSTableAttachmentViewController showSelectionMenuFromRect:](self, "showSelectionMenuFromRect:", v15, v16, vabdd_f64(v7, v12), vabdd_f64(v9, v14));
    }
  }
}

- (void)dragColumn:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[ICiOSTableAttachmentViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "locationInView:", v4);
  v6 = v5;
  v8 = v7;

  if (objc_msgSend(v11, "state") == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMenuVisible:animated:", 0, 1);

    objc_msgSend(MEMORY[0x1E0DC3958], "activeInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeAutocorrection");

    -[ICTableAttachmentViewController dragBeganOnColumnOrRow:atLocation:](self, "dragBeganOnColumnOrRow:atLocation:", 1, v6, v8);
  }
  else if (objc_msgSend(v11, "state") == 2)
  {
    -[ICTableAttachmentViewController dragMovedOnColumnOrRow:atLocation:](self, "dragMovedOnColumnOrRow:atLocation:", 1, v6, v8);
  }
  else if (objc_msgSend(v11, "state") == 3 || objc_msgSend(v11, "state") == 5 || objc_msgSend(v11, "state") == 4)
  {
    -[ICTableAttachmentViewController dragEndedOnColumnOrRow:atLocation:](self, "dragEndedOnColumnOrRow:atLocation:", 1, v6, v8);
  }

}

- (void)dragRow:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  id v19;

  v19 = a3;
  -[ICiOSTableAttachmentViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "locationInView:", v4);
  v6 = v5;
  v8 = v7;

  if (objc_msgSend(v19, "state") == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMenuVisible:animated:", 0, 1);

    objc_msgSend(MEMORY[0x1E0DC3958], "activeInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeAutocorrection");

    -[ICTableAttachmentViewController dragBeganOnColumnOrRow:atLocation:](self, "dragBeganOnColumnOrRow:atLocation:", 0, v6, v8);
    -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentInset");
    v13 = v12;
    -[ICTableAttachmentViewController tableAutoScroller](self, "tableAutoScroller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTopThresholdDistance:", v13);

    -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contentInset");
    v17 = v16;
    -[ICTableAttachmentViewController tableAutoScroller](self, "tableAutoScroller");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBottomThresholdDistance:", v17);

  }
  else if (objc_msgSend(v19, "state") == 2)
  {
    -[ICTableAttachmentViewController dragMovedOnColumnOrRow:atLocation:](self, "dragMovedOnColumnOrRow:atLocation:", 0, v6, v8);
  }
  else if (objc_msgSend(v19, "state") == 3 || objc_msgSend(v19, "state") == 5 || objc_msgSend(v19, "state") == 4)
  {
    -[ICTableAttachmentViewController dragEndedOnColumnOrRow:atLocation:](self, "dragEndedOnColumnOrRow:atLocation:", 0, v6, v8);
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;

  v5 = a3;
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v5, "view"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        -[ICTableAttachmentViewController tableContentView](self, "tableContentView"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v8 == v9))
  {
    -[ICTableAttachmentViewController table](self, "table");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "columnCount"))
    {
      -[ICTableAttachmentViewController table](self, "table");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      isKindOfClass = objc_msgSend(v16, "rowCount") == 0;

    }
    else
    {
      isKindOfClass = 1;
    }

  }
  else
  {
    objc_msgSend(v5, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController columnButton](self, "columnButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 == v11)
    {
      isKindOfClass = (unint64_t)(v7 - 1) < 2;
    }
    else
    {
      objc_msgSend(v5, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTableAttachmentViewController rowButton](self, "rowButton");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v13)
      {
        isKindOfClass = (v7 & 0xFFFFFFFFFFFFFFFDLL) == 1;
      }
      else
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
      }
    }
  }

  return isKindOfClass & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v4;
  char isKindOfClass;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)toggleBoldAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v3 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Bold"), &stru_1EA7E9860, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__ICiOSTableAttachmentViewController_toggleBoldAction__block_invoke;
  v8[3] = &unk_1EA7DDE30;
  v8[4] = self;
  objc_msgSend(v3, "ic_actionWithTitle:imageName:handler:", v5, CFSTR("bold"), v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __54__ICiOSTableAttachmentViewController_toggleBoldAction__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "toggleBoldface:", a2);
}

- (id)toggleItalicAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v3 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Italic"), &stru_1EA7E9860, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__ICiOSTableAttachmentViewController_toggleItalicAction__block_invoke;
  v8[3] = &unk_1EA7DDE30;
  v8[4] = self;
  objc_msgSend(v3, "ic_actionWithTitle:imageName:handler:", v5, CFSTR("italic"), v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __56__ICiOSTableAttachmentViewController_toggleItalicAction__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "toggleItalics:", a2);
}

- (id)toggleUnderlineAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v3 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Underline"), &stru_1EA7E9860, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__ICiOSTableAttachmentViewController_toggleUnderlineAction__block_invoke;
  v8[3] = &unk_1EA7DDE30;
  v8[4] = self;
  objc_msgSend(v3, "ic_actionWithTitle:imageName:handler:", v5, CFSTR("underline"), v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __59__ICiOSTableAttachmentViewController_toggleUnderlineAction__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "toggleUnderline:", a2);
}

- (id)toggleStrikethroughAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v3 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Strikethrough"), &stru_1EA7E9860, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__ICiOSTableAttachmentViewController_toggleStrikethroughAction__block_invoke;
  v8[3] = &unk_1EA7DDE30;
  v8[4] = self;
  objc_msgSend(v3, "ic_actionWithTitle:imageName:handler:", v5, CFSTR("strikethrough"), v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __63__ICiOSTableAttachmentViewController_toggleStrikethroughAction__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "toggleStrikethrough:", a2);
}

- (id)toggleTableDirectionAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  if (!objc_msgSend(MEMORY[0x1E0D64C80], "supportsRTL"))
    return 0;
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v4 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Table Direction"), &stru_1EA7E9860, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__ICiOSTableAttachmentViewController_toggleTableDirectionAction__block_invoke;
  v9[3] = &unk_1EA7DDE30;
  v9[4] = self;
  objc_msgSend(v4, "ic_actionWithTitle:imageName:handler:", v6, CFSTR("arrow.left.arrow.right.square.fill"), v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __64__ICiOSTableAttachmentViewController_toggleTableDirectionAction__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reverseTableColumnDirection:", *(_QWORD *)(a1 + 32));
}

- (id)formatMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
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
  void *v20;

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isRangeOrSpanningSelection"))
  {
    v10 = 0;
LABEL_6:

    return v10;
  }
  -[ICTableAttachmentViewController table](self, "table");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "columns");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rows");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "isEmptyAtColumnIdentifiers:rowIdentifiers:", v6, v8);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICiOSTableAttachmentViewController toggleBoldAction](self, "toggleBoldAction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ic_addNonNilObject:", v11);

    -[ICiOSTableAttachmentViewController toggleItalicAction](self, "toggleItalicAction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ic_addNonNilObject:", v12);

    -[ICiOSTableAttachmentViewController toggleUnderlineAction](self, "toggleUnderlineAction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ic_addNonNilObject:", v13);

    -[ICiOSTableAttachmentViewController toggleStrikethroughAction](self, "toggleStrikethroughAction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ic_addNonNilObject:", v14);

    -[ICiOSTableAttachmentViewController toggleTableDirectionAction](self, "toggleTableDirectionAction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ic_addNonNilObject:", v15);

    v16 = (void *)MEMORY[0x1E0DC39D0];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Format"), &stru_1EA7E9860, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("bold.italic.underline"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v3, "copy");
    objc_msgSend(v16, "menuWithTitle:image:identifier:options:children:", v18, v19, 0, 0, v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v10 = 0;
  return v10;
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICiOSTableAttachmentViewController;
  v4 = a3;
  -[ICiOSTableAttachmentViewController buildMenuWithBuilder:](&v7, sel_buildMenuWithBuilder_, v4);
  v5 = *MEMORY[0x1E0DC5158];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__ICiOSTableAttachmentViewController_buildMenuWithBuilder___block_invoke;
  v6[3] = &unk_1EA7DDE58;
  v6[4] = self;
  objc_msgSend(v4, "replaceChildrenOfMenuForIdentifier:fromChildrenBlock:", v5, v6);

}

id __59__ICiOSTableAttachmentViewController_buildMenuWithBuilder___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  char v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  void *v24;
  char v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v6)
  {

    v14 = 0;
    v12 = 0;
    v13 = 0;
    goto LABEL_20;
  }
  v7 = v6;
  v23 = a1;
  v24 = v4;
  v25 = 0;
  v26 = 0;
  v8 = 0;
  v9 = *(_QWORD *)v28;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v28 != v9)
        objc_enumerationMutation(v5);
      objc_opt_class();
      ICDynamicCast();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (sel_isEqual((SEL)objc_msgSend(v11, "action"), sel_toggleBoldface_))
      {
        v8 = 1;
      }
      else if (sel_isEqual((SEL)objc_msgSend(v11, "action"), sel_toggleItalics_))
      {
        LOBYTE(v26) = 1;
      }
      else if (sel_isEqual((SEL)objc_msgSend(v11, "action"), sel_toggleUnderline_))
      {
        v25 = 1;
      }
      else
      {
        HIDWORD(v26) |= sel_isEqual((SEL)objc_msgSend(v11, "action"), sel_strikethrough_);
      }

    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  }
  while (v7);

  if ((v8 & 1) == 0)
  {
    a1 = v23;
    v4 = v24;
    v14 = v26;
    v12 = BYTE4(v26);
    v13 = v25;
LABEL_20:
    objc_msgSend(*(id *)(a1 + 32), "toggleBoldAction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_addNonNilObject:", v15);

    if ((v14 & 1) != 0)
      goto LABEL_22;
    goto LABEL_21;
  }
  a1 = v23;
  v4 = v24;
  v12 = BYTE4(v26);
  v13 = v25;
  if ((v26 & 1) == 0)
  {
LABEL_21:
    objc_msgSend(*(id *)(a1 + 32), "toggleItalicAction");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_addNonNilObject:", v16);

  }
LABEL_22:
  if ((v13 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "toggleUnderlineAction");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_addNonNilObject:", v17);

  }
  if ((v12 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "toggleStrikethroughAction");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_addNonNilObject:", v18);

  }
  objc_msgSend(*(id *)(a1 + 32), "toggleTableDirectionAction");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_addNonNilObject:", v19);

  v20 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)removeColumnAction
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type") == 2)
  {
    -[ICTableAttachmentViewController table](self, "table");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "columnCount");

    if (v5 != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Delete %lu Column"), &stru_1EA7E9860, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = (void *)MEMORY[0x1E0DC3428];
      v9 = (void *)MEMORY[0x1E0CB3940];
      -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "columns");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringWithFormat:", v7, objc_msgSend(v11, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __56__ICiOSTableAttachmentViewController_removeColumnAction__block_invoke;
      v15[3] = &unk_1EA7DDE30;
      v15[4] = self;
      objc_msgSend(v8, "ic_actionWithTitle:imageName:handler:", v12, CFSTR("rectangle.badge.minus"), v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      return v13;
    }
  }
  else
  {

  }
  return 0;
}

uint64_t __56__ICiOSTableAttachmentViewController_removeColumnAction__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteSelectedColumns:", a2);
}

- (id)addColumnAction
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4 != 2)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ADD_COLUMN_MENU_ACTION"), CFSTR("Add Column"), CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__ICiOSTableAttachmentViewController_addColumnAction__block_invoke;
  v9[3] = &unk_1EA7DDE30;
  v9[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3428], "ic_actionWithTitle:imageName:handler:", v6, CFSTR("rectangle.badge.plus"), v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __53__ICiOSTableAttachmentViewController_addColumnAction__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addColumnAfterSelection:", a2);
}

- (id)removeRowAction
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type") == 3)
  {
    -[ICTableAttachmentViewController table](self, "table");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "rowCount");

    if (v5 != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Delete %lu Row"), &stru_1EA7E9860, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = (void *)MEMORY[0x1E0DC3428];
      v9 = (void *)MEMORY[0x1E0CB3940];
      -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "rows");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringWithFormat:", v7, objc_msgSend(v11, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __53__ICiOSTableAttachmentViewController_removeRowAction__block_invoke;
      v15[3] = &unk_1EA7DDE30;
      v15[4] = self;
      objc_msgSend(v8, "ic_actionWithTitle:imageName:handler:", v12, CFSTR("rectangle.badge.minus"), v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      return v13;
    }
  }
  else
  {

  }
  return 0;
}

uint64_t __53__ICiOSTableAttachmentViewController_removeRowAction__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteSelectedRows:", a2);
}

- (id)addRowAction
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4 != 3)
    return 0;
  v5 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Add Row"), &stru_1EA7E9860, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__ICiOSTableAttachmentViewController_addRowAction__block_invoke;
  v10[3] = &unk_1EA7DDE30;
  v10[4] = self;
  objc_msgSend(v5, "ic_actionWithTitle:imageName:handler:", v7, CFSTR("rectangle.badge.plus"), v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __50__ICiOSTableAttachmentViewController_addRowAction__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addRowBelowSelection:", a2);
}

- (id)copySelectionAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isRangeOrSpanningSelection") & 1) == 0)
  {

    return 0;
  }
  -[ICTableAttachmentViewController table](self, "table");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "columns");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rows");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "isEmptyAtColumnIdentifiers:rowIdentifiers:", v6, v8);

  if ((v9 & 1) != 0)
    return 0;
  v10 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Copy"), &stru_1EA7E9860, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__ICiOSTableAttachmentViewController_copySelectionAction__block_invoke;
  v15[3] = &unk_1EA7DDE30;
  v15[4] = self;
  objc_msgSend(v10, "ic_actionWithTitle:imageName:handler:", v12, CFSTR("doc.on.doc"), v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __57__ICiOSTableAttachmentViewController_copySelectionAction__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "copySelection:", a2);
}

- (id)cutSelectionAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isRangeOrSpanningSelection") & 1) != 0)
  {
    -[ICTableAttachmentViewController table](self, "table");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "columns");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rows");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "isEmptyAtColumnIdentifiers:rowIdentifiers:", v6, v8);

    if ((v9 & 1) == 0)
    {
      v10 = (void *)MEMORY[0x1E0DC3428];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Cut"), &stru_1EA7E9860, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __56__ICiOSTableAttachmentViewController_cutSelectionAction__block_invoke;
      v15[3] = &unk_1EA7DDE30;
      v15[4] = self;
      objc_msgSend(v10, "ic_actionWithTitle:imageName:handler:", v12, CFSTR("scissors"), v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      return v13;
    }
  }
  else
  {

  }
  return 0;
}

uint64_t __56__ICiOSTableAttachmentViewController_cutSelectionAction__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cutSelection:", a2);
}

- (id)pasteSelectionAction
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasStrings") & 1) != 0)
  {
    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isRangeOrSpanningSelection");

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0DC3428];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Paste"), &stru_1EA7E9860, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __58__ICiOSTableAttachmentViewController_pasteSelectionAction__block_invoke;
      v11[3] = &unk_1EA7DDE30;
      v11[4] = self;
      objc_msgSend(v6, "ic_actionWithTitle:imageName:handler:", v8, CFSTR("doc.on.clipboard"), v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      return v9;
    }
  }
  else
  {

  }
  return 0;
}

uint64_t __58__ICiOSTableAttachmentViewController_pasteSelectionAction__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "pasteIntoSelection:", a2);
}

- (id)columnMenu
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4 == 2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICiOSTableAttachmentViewController removeColumnAction](self, "removeColumnAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ic_addNonNilObject:", v6);

    -[ICiOSTableAttachmentViewController addColumnAction](self, "addColumnAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ic_addNonNilObject:", v7);

    -[ICiOSTableAttachmentViewController formatMenu](self, "formatMenu");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ic_addNonNilObject:", v8);

    v9 = -[ICiOSTableAttachmentViewController copySelectionAction](self, "copySelectionAction");
    objc_msgSend(v5, "ic_addNonNilObject:", v9);

    -[ICiOSTableAttachmentViewController cutSelectionAction](self, "cutSelectionAction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ic_addNonNilObject:", v10);

    -[ICiOSTableAttachmentViewController pasteSelectionAction](self, "pasteSelectionAction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ic_addNonNilObject:", v11);

    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)rowMenu
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4 == 3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICiOSTableAttachmentViewController removeRowAction](self, "removeRowAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ic_addNonNilObject:", v6);

    -[ICiOSTableAttachmentViewController addRowAction](self, "addRowAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ic_addNonNilObject:", v7);

    -[ICiOSTableAttachmentViewController formatMenu](self, "formatMenu");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ic_addNonNilObject:", v8);

    v9 = -[ICiOSTableAttachmentViewController copySelectionAction](self, "copySelectionAction");
    objc_msgSend(v5, "ic_addNonNilObject:", v9);

    -[ICiOSTableAttachmentViewController cutSelectionAction](self, "cutSelectionAction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ic_addNonNilObject:", v10);

    -[ICiOSTableAttachmentViewController pasteSelectionAction](self, "pasteSelectionAction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ic_addNonNilObject:", v11);

    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  ICiOSTableAttachmentViewController *v5;
  void *v6;
  const char *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  void *v24;
  uint64_t v25;

  v5 = self;
  -[ICiOSTableAttachmentViewController biuTextView](self, "biuTextView", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (sel_isEqual(a3, sel_toggleBoldface_)
      || sel_isEqual(a3, sel_toggleItalics_)
      || sel_isEqual(a3, sel_toggleUnderline_))
    {
      goto LABEL_9;
    }
    v7 = sel_strikethrough_;
    goto LABEL_6;
  }
  if (sel_isEqual(a3, sel_strikethrough_))
    goto LABEL_9;
  if (sel_isEqual(a3, sel_cut_) || sel_isEqual(a3, sel_copy_))
  {
    -[ICTableAttachmentViewController tableSelection](v5, "tableSelection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isRangeOrSpanningSelection"))
    {
      -[ICTableAttachmentViewController table](v5, "table");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTableAttachmentViewController tableSelection](v5, "tableSelection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "columns");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTableAttachmentViewController tableSelection](v5, "tableSelection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "rows");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v5) = objc_msgSend(v10, "isEmptyAtColumnIdentifiers:rowIdentifiers:", v12, v14) ^ 1;

LABEL_15:
LABEL_20:

      return (char)v5;
    }
    goto LABEL_19;
  }
  if (sel_isEqual(a3, sel_paste_))
  {
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "hasStrings"))
    {
      -[ICTableAttachmentViewController tableSelection](v5, "tableSelection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = objc_msgSend(v10, "isRangeOrSpanningSelection");
      goto LABEL_15;
    }
LABEL_19:
    LOBYTE(v5) = 0;
    goto LABEL_20;
  }
  if (sel_isEqual(a3, sel_convertToTag_))
    return -[ICiOSTableAttachmentViewController canConvertToTag](v5, "canConvertToTag");
  if (sel_isEqual(a3, sel_convertToText_))
    return -[ICiOSTableAttachmentViewController canConvertToText](v5, "canConvertToText");
  if (!sel_isEqual(a3, sel_makeTextWritingDirectionLeftToRight_))
  {
    if (!sel_isEqual(a3, sel_makeTextWritingDirectionRightToLeft_))
    {
      if (sel_isEqual(a3, sel_copyTable_)
        || sel_isEqual(a3, sel_shareTable_)
        || sel_isEqual(a3, sel_convertTableToText_))
      {
        goto LABEL_9;
      }
      v7 = sel_deleteTable_;
LABEL_6:
      if (!sel_isEqual(a3, v7))
      {
LABEL_7:
        LOBYTE(v5) = 0;
        return (char)v5;
      }
LABEL_9:
      LOBYTE(v5) = 1;
      return (char)v5;
    }
    if (objc_msgSend(MEMORY[0x1E0D64C80], "supportsRTL"))
    {
      -[ICTableAttachmentViewController tableSelection](v5, "tableSelection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "type");

      if (v20 == 2)
      {
        -[ICTableAttachmentViewController table](v5, "table");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v5) = objc_msgSend(v9, "isRightToLeft") ^ 1;
        goto LABEL_20;
      }
    }
    if (!objc_msgSend(MEMORY[0x1E0D64C80], "supportsRTL"))
      goto LABEL_7;
    -[ICTableAttachmentViewController tableSelection](v5, "tableSelection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "type");

    if (v25 != 4)
      goto LABEL_7;
    v23 = -[ICTableAttachmentViewController textDirectionForCurrentSelection](v5, "textDirectionForCurrentSelection") == 0;
LABEL_43:
    LOBYTE(v5) = v23;
    return (char)v5;
  }
  if (!objc_msgSend(MEMORY[0x1E0D64C80], "supportsRTL")
    || (-[ICTableAttachmentViewController tableSelection](v5, "tableSelection"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "type"),
        v15,
        v16 != 2))
  {
    if (!objc_msgSend(MEMORY[0x1E0D64C80], "supportsRTL"))
      goto LABEL_7;
    -[ICTableAttachmentViewController tableSelection](v5, "tableSelection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "type");

    if (v22 != 4)
      goto LABEL_7;
    v23 = -[ICTableAttachmentViewController textDirectionForCurrentSelection](v5, "textDirectionForCurrentSelection") == 1;
    goto LABEL_43;
  }
  -[ICTableAttachmentViewController table](v5, "table");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isRightToLeft");

  return v18;
}

- (BOOL)canConvertToTag
{
  void *v3;
  void *v4;
  _BOOL4 v5;

  -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "ic_canConvertToTag"))
    v5 = !-[ICiOSTableAttachmentViewController canConvertToText](self, "canConvertToText");
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (void)convertToTag:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  v4 = (void *)MEMORY[0x1E0D63B40];
  -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController note](self, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createHashtagAttachmentIfApplicableWithHashtagText:creatingHashtagIfNecessary:note:parentAttachment:", v6, 1, v7, 0);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v8 = objc_alloc(MEMORY[0x1E0D64AF8]);
    -[ICTableAttachmentViewController note](self, "note");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithNote:", v9);

    -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "selectedRange");
    v14 = v13;
    -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v10, "addInlineAttachment:atTextRange:textView:", v19, v12, v14, v15);

    objc_msgSend(v19, "updateChangeCountWithReason:", CFSTR("Converted text to tag"));
    -[ICTableAttachmentViewController note](self, "note");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateChangeCountWithReason:", CFSTR("Converted text to tag"));

    -[ICTableAttachmentViewController note](self, "note");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "save");

  }
  -[ICiOSTableAttachmentViewController setEditing:animated:](self, "setEditing:animated:", 1, 1);

}

- (BOOL)canConvertToText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "selectedRange");
  v9 = objc_msgSend(v4, "canConvertInlineAttachmentToTextInTextView:forRange:", v5, v7, v8);

  return v9;
}

- (void)convertToText:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  NSRange v19;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19.location = objc_msgSend(v5, "selectedRange");
    NSStringFromRange(v19);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412290;
    v17 = v6;
    _os_log_impl(&dword_1DD7B0000, v4, OS_LOG_TYPE_INFO, "Converting inline attachment at %@ to text", (uint8_t *)&v16, 0xCu);

  }
  -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "selectedRange");
  objc_msgSend(v8, "convertInlineAttachmentToTextInTextView:forRange:", v9, v11, v12);

  -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICiOSTableAttachmentViewController textViewDidChange:](self, "textViewDidChange:", v13);

  -[ICTableAttachmentViewController note](self, "note");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateChangeCountWithReason:", CFSTR("Converted tag to text"));

  -[ICTableAttachmentViewController note](self, "note");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "save");

}

- (void)menuWillHide:(id)a3
{
  id v4;

  -[ICiOSTableAttachmentViewController setMenuHiding:](self, "setMenuHiding:", 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5048], 0);

}

- (void)menuDidHide:(id)a3
{
  void *v4;
  void *v5;

  -[ICiOSTableAttachmentViewController setMenuHiding:](self, "setMenuHiding:", 0);
  -[ICiOSTableAttachmentViewController setShowingTextStyleOptions:](self, "setShowingTextStyleOptions:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5040], 0);

  -[ICiOSTableAttachmentViewController biuTextView](self, "biuTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  -[ICiOSTableAttachmentViewController setBiuTextView:](self, "setBiuTextView:", 0);
  -[ICiOSTableAttachmentViewController moveAccessibilityFocusToSelectedColumnOrRowButton](self, "moveAccessibilityFocusToSelectedColumnOrRowButton");
}

- (void)paste:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__ICiOSTableAttachmentViewController_paste___block_invoke;
  v6[3] = &unk_1EA7DD498;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __44__ICiOSTableAttachmentViewController_paste___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pasteIntoSelection:", *(_QWORD *)(a1 + 40));
}

- (void)strikethrough:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  if (v5 == 1)
  {
    -[ICTableAttachmentViewController currentlyEditingTextView](self, "currentlyEditingTextView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "toggleStrikethrough");

  }
  else
  {
    -[ICTableAttachmentViewController toggleStrikethrough:](self, "toggleStrikethrough:", v7);
  }

}

- (void)makeTextWritingDirectionLeftToRight:(id)a3
{
  -[ICiOSTableAttachmentViewController setTextViewWritingDirection:sender:](self, "setTextViewWritingDirection:sender:", 0, a3);
}

- (void)makeTextWritingDirectionRightToLeft:(id)a3
{
  -[ICiOSTableAttachmentViewController setTextViewWritingDirection:sender:](self, "setTextViewWritingDirection:sender:", 1, a3);
}

- (void)setTextViewWritingDirection:(int64_t)a3 sender:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a4;
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  if (v7 == 2)
  {
    -[ICTableAttachmentViewController reverseTableColumnDirection:](self, "reverseTableColumnDirection:", v10);
  }
  else
  {
    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "type");

    if (v9 == 4)
    {
      -[ICTableAttachmentViewController setSelectionDirection:](self, "setSelectionDirection:", a3);
    }
    else if (-[ICTableAttachmentViewController containedInNoteSelection](self, "containedInNoteSelection"))
    {
      -[ICTableAttachmentViewController updateTableColumnDirectionForWritingDirection:](self, "updateTableColumnDirectionForWritingDirection:", a3);
    }
  }

}

- (void)shareTable:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  -[ICAttachmentViewController attachment](self, "attachment", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D96D28]);
  objc_msgSend(v4, "activityItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithActivityItems:applicationActivities:", v6, 0);

  -[ICAttachmentViewController attachment](self, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "note");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsContentManaged:", objc_msgSend(v10, "isManaged"));

  v11 = *MEMORY[0x1E0D63EF0];
  v27[0] = *MEMORY[0x1E0D96DC8];
  v27[1] = v11;
  v27[2] = *MEMORY[0x1E0D96E28];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExcludedActivityTypes:", v12);

  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
    v13 = -2;
  else
    v13 = 7;
  objc_msgSend(v7, "setModalPresentationStyle:", v13);
  -[ICiOSTableAttachmentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  -[ICiOSTableAttachmentViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v7, "popoverPresentationController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setSourceRect:", v16, v18, v20, v22);

  -[ICiOSTableAttachmentViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "superview");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "popoverPresentationController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setSourceView:", v25);

}

- (id)icTableDataFromPasteboard
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataForPasteboardType:", CFSTR("com.apple.notes.table"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)soloPlainTextStringFromPasteboard
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1
    && (objc_msgSend(v2, "dataForPasteboardType:", *MEMORY[0x1E0D637F0]),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    objc_msgSend(v2, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)notesDataFromPasteboard
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataForPasteboardType:", *MEMORY[0x1E0D637F0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)copySelection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController pasteboardItemsForSelection](self, "pasteboardItemsForSelection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setItems:", v6);

  -[ICiOSTableAttachmentViewController _accessibilityPostPasteboardTextForOperation:](self, "_accessibilityPostPasteboardTextForOperation:", *MEMORY[0x1E0CF45A0]);
}

- (void)selectionDidResignFirstResponder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ICiOSTableAttachmentViewController;
  -[ICTableAttachmentViewController selectionDidResignFirstResponder:](&v12, sel_selectionDidResignFirstResponder_, a3);
  if (!-[ICTableAttachmentViewController lockSelection](self, "lockSelection"))
  {
    -[ICiOSTableAttachmentViewController sendAnalyticsForEndEditIfNeeded](self, "sendAnalyticsForEndEditIfNeeded");
    -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateTextInputAccessoryViewForDidEndEditing:", 0);

    -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "auxiliaryResponder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

    }
    else
    {
      -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "textView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isBecomingFirstResponder");

      if ((v9 & 1) != 0)
        return;
      -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setEditable:", 0);

      -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setEditing:", 0);
    }

  }
}

- (void)tableAttachmentDidChange
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ICiOSTableAttachmentViewController;
  -[ICTableAttachmentViewController tableAttachmentDidChange](&v2, sel_tableAttachmentDidChange);
}

- (void)performInitialLayoutIfNeeded
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ICiOSTableAttachmentViewController;
  -[ICTableAttachmentViewController performInitialLayoutIfNeeded](&v2, sel_performInitialLayoutIfNeeded);
}

- (void)tableAttachmentSelectionDidChange:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("ICNoteEditorViewControllerSelectionDidChangeNotification"), v4);

}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "textViewShouldBeginEditing:", v4);

  if (v6)
  {
    -[ICiOSTableAttachmentViewController auxiliaryTextViewHost](self, "auxiliaryTextViewHost");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAuxiliaryResponder:", v4);

    -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textViewInputAccessoryView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInputAccessoryView:", v9);

  }
  return v6;
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  _QWORD block[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isStyleSelectorInputViewPresenting") & 1) != 0)
  {

  }
  else
  {
    v6 = objc_msgSend(v4, "isFirstResponder");

    if ((v6 & 1) != 0)
    {
      -[ICiOSTableAttachmentViewController sendAnalyticsForStartEditIfNeeded](self, "sendAnalyticsForStartEditIfNeeded");
      -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setEditing:", 1);

      -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ink");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "_isHandwritingInk");

      if ((v11 & 1) == 0)
      {
        -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "showInkPicker:animated:", 0, 1);

      }
      -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "updateTextInputAccessoryViewForDidBeginEditing:", v4);

      if (!-[ICTableAttachmentViewController preventScrolling](self, "preventScrolling")
        && !-[ICTableAttachmentViewController makingCellFirstResponder](self, "makingCellFirstResponder"))
      {
        objc_initWeak(&location, self);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __62__ICiOSTableAttachmentViewController_textViewDidBeginEditing___block_invoke;
        block[3] = &unk_1EA7DDD98;
        objc_copyWeak(&v16, &location);
        v15 = v4;
        dispatch_async(MEMORY[0x1E0C80D38], block);

        objc_destroyWeak(&v16);
        objc_destroyWeak(&location);
      }
    }
  }

}

void __62__ICiOSTableAttachmentViewController_textViewDidBeginEditing___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(*(id *)(a1 + 32), "selectedRange");
  objc_msgSend(v4, "columnID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowAtIndex:rowRange:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__ICiOSTableAttachmentViewController_textViewDidBeginEditing___block_invoke_2;
  v8[3] = &unk_1EA7DDE80;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "beginEditingCellWithColumnID:andRowID:textRange:", v6, v7, v8);

}

uint64_t __62__ICiOSTableAttachmentViewController_textViewDidBeginEditing___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "selectedRange");
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  ICiOSTableAttachmentViewController *v24;
  id v25;

  v4 = a3;
  -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isStyleSelectorInputViewPresenting");

  if ((v6 & 1) != 0)
    goto LABEL_12;
  objc_opt_class();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "auxiliaryResponder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v9)
    {
      -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isBecomingFirstResponder");

      if ((v12 & 1) != 0)
      {
LABEL_8:
        -[ICTableAttachmentViewController endCellEditingSessionWithTextView:](self, "endCellEditingSessionWithTextView:", v7);
        -[ICAttachmentViewController attachment](self, "attachment");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setIsBeingEditedLocallyOnDevice:", 0);

        goto LABEL_9;
      }
      -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "textView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setEditable:", 0);

      -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setEditing:", 0);
    }
    else
    {

    }
    goto LABEL_8;
  }
LABEL_9:
  -[ICiOSTableAttachmentViewController sendAnalyticsForEndEditIfNeeded](self, "sendAnalyticsForEndEditIfNeeded");
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __60__ICiOSTableAttachmentViewController_textViewDidEndEditing___block_invoke;
  v23 = &unk_1EA7DD498;
  v24 = self;
  v16 = v4;
  v25 = v16;
  dispatch_async(MEMORY[0x1E0C80D38], &v20);
  objc_msgSend(v16, "setInputAccessoryView:", 0, v20, v21, v22, v23, v24);
  -[ICiOSTableAttachmentViewController keyboardWillShowScrollObservation](self, "keyboardWillShowScrollObservation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICiOSTableAttachmentViewController keyboardWillShowScrollObservation](self, "keyboardWillShowScrollObservation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeObserver:", v19);

    -[ICiOSTableAttachmentViewController setKeyboardWillShowScrollObservation:](self, "setKeyboardWillShowScrollObservation:", 0);
  }

LABEL_12:
}

void __60__ICiOSTableAttachmentViewController_textViewDidEndEditing___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "noteEditorViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateTextInputAccessoryViewForDidEndEditing:", *(_QWORD *)(a1 + 40));

}

- (void)beginEditingCellWithColumnID:(id)a3 andRowID:(id)a4 textRange:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  objc_super v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ICiOSTableAttachmentViewController keyboardWillShowScrollObservation](self, "keyboardWillShowScrollObservation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICiOSTableAttachmentViewController keyboardWillShowScrollObservation](self, "keyboardWillShowScrollObservation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObserver:", v13);

    -[ICiOSTableAttachmentViewController setKeyboardWillShowScrollObservation:](self, "setKeyboardWillShowScrollObservation:", 0);
  }
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0DC4FE8];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __86__ICiOSTableAttachmentViewController_beginEditingCellWithColumnID_andRowID_textRange___block_invoke;
  v20[3] = &unk_1EA7DDED0;
  objc_copyWeak(&v23, &location);
  v16 = v8;
  v21 = v16;
  v17 = v9;
  v22 = v17;
  objc_msgSend(v14, "addObserverForName:object:queue:usingBlock:", v15, 0, 0, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICiOSTableAttachmentViewController setKeyboardWillShowScrollObservation:](self, "setKeyboardWillShowScrollObservation:", v18);

  v19.receiver = self;
  v19.super_class = (Class)ICiOSTableAttachmentViewController;
  -[ICTableAttachmentViewController beginEditingCellWithColumnID:andRowID:textRange:](&v19, sel_beginEditingCellWithColumnID_andRowID_textRange_, v16, v17, v10);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

void __86__ICiOSTableAttachmentViewController_beginEditingCellWithColumnID_andRowID_textRange___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "textViewManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textViewForColumn:createIfNeeded:", a1[4], 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(WeakRetained, "keyboardWillShowScrollObservation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "keyboardWillShowScrollObservation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObserver:", v7);

      objc_msgSend(WeakRetained, "setKeyboardWillShowScrollObservation:", 0);
      if ((objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode") & 1) == 0)
      {
        objc_msgSend(WeakRetained, "setPreventScrolling:", 0);
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __86__ICiOSTableAttachmentViewController_beginEditingCellWithColumnID_andRowID_textRange___block_invoke_2;
        v8[3] = &unk_1EA7DDEA8;
        v8[4] = WeakRetained;
        v9 = v4;
        v10 = a1[4];
        v11 = a1[5];
        dispatch_async(MEMORY[0x1E0C80D38], v8);

      }
    }
  }

}

void __86__ICiOSTableAttachmentViewController_beginEditingCellWithColumnID_andRowID_textRange___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __86__ICiOSTableAttachmentViewController_beginEditingCellWithColumnID_andRowID_textRange___block_invoke_3;
  v4[3] = &unk_1EA7DDBF0;
  v4[4] = v2;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "scrollToSelectionInTextView:animated:completion:", v3, 1, v4);

}

void __86__ICiOSTableAttachmentViewController_beginEditingCellWithColumnID_andRowID_textRange___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "updateTiles");
  v2 = *(void **)(a1 + 32);
  v6[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showButtonsAtColumns:rows:", v3, v4);

}

- (void)textViewDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllerManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissOverlayContent");

  -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHasMadeEdits");

  objc_msgSend(v4, "updateTextViewForDidChange");
  -[ICTableAttachmentViewController setNeedsSave](self, "setNeedsSave");
  v15 = v4;
  v8 = v4;
  dispatchMainAfterDelay();
  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "columns");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rows");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && v14)
    -[ICTableAttachmentViewController updateCellSizeAtColumn:row:immediateWidthUpdate:](self, "updateCellSizeAtColumn:row:immediateWidthUpdate:", v11, v14, 0);

}

void __56__ICiOSTableAttachmentViewController_textViewDidChange___block_invoke(uint64_t a1)
{
  UIAccessibilityPostNotification(*MEMORY[0x1E0DC10C0], *(id *)(a1 + 32));
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  NSRange v19;
  id v21;
  NSRange v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  char v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  char v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  NSUInteger v65;
  NSUInteger v66;
  NSRange v67;
  NSRange v68;
  NSRange v69;

  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v4, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v4, "selectedRange");
  v10 = v9;
  v11 = v8;
  v63 = v4;
  v64 = v7;
  if ((objc_msgSend(v7, "isApplyingUndoCommand") & 1) == 0)
  {
    v12 = objc_msgSend(v4, "selectedRange");
    v14 = v13;
    v15 = objc_msgSend(v4, "selectedRange");
    v17 = v16;
    v69.location = objc_msgSend(v5, "previousSelectedRange");
    v69.length = v18;
    v67.location = v15;
    v4 = v63;
    v67.length = v17;
    v19 = NSUnionRange(v67, v69);
    v7 = v64;
    if (v12 == v19.location && v14 == v19.length)
      v11 = objc_msgSend(v5, "previousSelectedRange");
  }
  v65 = 0;
  v66 = 0;
  v21 = (id)objc_msgSend(v7, "rowAtIndex:rowRange:", v11, &v65);
  v22.length = v66;
  v22.location = v66 + v65;
  if (v8 >= v66 + v65)
  {
    v22.length = 0;
  }
  else if (v66)
  {
    v68.location = v8;
    v68.length = v10;
    v22.location = v65;
    v22 = NSIntersectionRange(v68, v22);
  }
  else
  {
    v22.location = v65;
  }
  if (v22.location == v8 && v22.length == v10)
  {
    -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v23, "draggingText"))
    {
      -[ICTableAttachmentViewController tableSelection](self, "tableSelection");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v24, "moving") & 1) != 0 || (objc_msgSend(v4, "isFirstResponder") & 1) == 0)
      {

      }
      else
      {
        v25 = objc_msgSend(v5, "isResigningFirstResponder");

        if ((v25 & 1) != 0)
          goto LABEL_24;
        objc_opt_class();
        ICDynamicCast();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "selectedTextRange");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "isEmpty");

        if ((v27 & 1) != 0)
        {
          -[ICTableAttachmentViewController showColumnRowButtons](self, "showColumnRowButtons");
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            ICDynamicCast();
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICiOSTableAttachmentViewController ensureGesturesOnSelectionGrabbers:](self, "ensureGesturesOnSelectionGrabbers:", v58);

          }
          -[ICTableAttachmentViewController columnButton](self, "columnButton");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "setHidden:", 1);

          -[ICTableAttachmentViewController rowButton](self, "rowButton");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "setHidden:", 1);

        }
        if (v23)
        {
          -[ICiOSTableAttachmentViewController didBeginEditingWithTextView:](self, "didBeginEditingWithTextView:", v23);
          -[ICiOSTableAttachmentViewController scrollToCaretIfNeededForTextView:](self, "scrollToCaretIfNeededForTextView:", v23);
        }
      }
    }

  }
  else
  {
    objc_msgSend(v4, "setSelectedRange:");
  }
LABEL_24:
  v28 = objc_msgSend(v5, "selectedRange");
  objc_msgSend(v5, "setPreviousSelectedRange:", v28, v29);
  -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "editorController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "hashtagController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setHashtagTableKeyboardDelegate:", v5);

  -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "editorController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "mentionsController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setMentionsTableKeyboardDelegate:", v5);

  -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "editorController");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "mentionsController");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v5, "selectedRange");
  v41 = v40;
  -[ICTableAttachmentViewController note](self, "note");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v5, "languageHasSpaces");
  -[ICAttachmentViewController attachment](self, "attachment");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v61) = v43;
  LOBYTE(v61) = 0;
  v45 = v41;
  v46 = v64;
  LOBYTE(v39) = objc_msgSend(v38, "checkForMentionInEditedRange:ofTextStorage:note:textView:allowAutoExplicitMention:isEndingEditing:languageHasSpaces:parentAttachment:", v39, v45, v64, v42, v5, 0, v61, v44);

  if ((v39 & 1) == 0)
  {
    -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "editorController");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "hashtagController");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v5, "selectedRange");
    v52 = v51;
    -[ICTableAttachmentViewController note](self, "note");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v5, "languageHasSpaces");
    -[ICAttachmentViewController attachment](self, "attachment");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE1(v62) = v54;
    LOBYTE(v62) = 0;
    objc_msgSend(v49, "checkForHashtagInEditedRange:ofTextStorage:note:textView:allowAutoExplicitHashtag:isEndingEditing:languageHasSpaces:parentAttachment:", v50, v52, v64, v53, v5, 0, v62, v55);

    v46 = v64;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "postNotificationName:object:", CFSTR("ICNoteEditorViewControllerSelectionDidChangeNotification"), v57);

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  id v7;
  id v8;
  BOOL v9;

  v7 = a3;
  v8 = a5;
  if (!-[ICTableAttachmentViewController acceptsKeystrokes](self, "acceptsKeystrokes"))
    goto LABEL_10;
  if (objc_msgSend(v8, "hasSuffix:", CFSTR("\n"))
    && (objc_msgSend(MEMORY[0x1E0DC3938], "ic_isShiftKeyPressed") & 1) == 0)
  {
    if (objc_msgSend(v7, "returnKeyType") == 4)
      -[ICTableAttachmentViewController moveNextCell](self, "moveNextCell");
    else
      -[ICTableAttachmentViewController moveReturnCell](self, "moveReturnCell");
    goto LABEL_10;
  }
  if (objc_msgSend(v8, "hasSuffix:", CFSTR("\t")))
  {
    -[ICTableAttachmentViewController moveTabCell](self, "moveTabCell");
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (void)scrollToCaretIfNeededForTextView:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEmpty");

  if (v5)
    -[ICTableAttachmentViewController scrollToSelectionInTextView:animated:completion:](self, "scrollToSelectionInTextView:animated:completion:", v6, 1, 0);

}

- (void)layoutManager:(id)a3 didCompleteLayoutForTextContainer:(id)a4 atEnd:(BOOL)a5
{
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("ICTextViewLayoutDidChangeNotification"), v6);

}

- (void)selectCurrentColumnForAccessibility
{
  void *v3;
  id v4;

  -[ICTableAttachmentViewController columnButton](self, "columnButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICiOSTableAttachmentViewController columnButtonPressed:](self, "columnButtonPressed:", v3);

  LODWORD(v3) = *MEMORY[0x1E0DC4578];
  -[ICTableAttachmentViewController columnButton](self, "columnButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v3, v4);

}

- (void)selectCurrentRowForAccessibility
{
  void *v3;
  id v4;

  -[ICTableAttachmentViewController rowButton](self, "rowButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICiOSTableAttachmentViewController rowButtonPressed:](self, "rowButtonPressed:", v3);

  LODWORD(v3) = *MEMORY[0x1E0DC4578];
  -[ICTableAttachmentViewController rowButton](self, "rowButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v3, v4);

}

- (void)invalidateCachedChildrenForAccessibilityReparenting
{
  void *v3;
  id v4;

  objc_opt_class();
  -[ICTableAttachmentViewController noteTextView](self, "noteTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "icaxClearCachedChildrenForReparenting");
}

- (void)updateAccessibilityValueForColumnAndRowButtons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;

  -[ICTableAttachmentViewController table](self, "table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController columnButton](self, "columnButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "columnOrRowIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "columnIndexForIdentifier:", v6);

  -[ICTableAttachmentViewController table](self, "table");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController columnButton](self, "columnButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "columnOrRowIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "columnIndexForIdentifier:", v11);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = v7 + 1;
  if (v7 == v12)
  {
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("column %lu"), &stru_1EA7E9860, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0CB3940];
  }
  else
  {
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("columns %lu to %lu"), &stru_1EA7E9860, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0CB3940];
    v35 = v12 + 1;
  }
  objc_msgSend(v17, "localizedStringWithFormat:", v16, v15, v35);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController columnButton](self, "columnButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAccessibilityValue:", v18);

  -[ICTableAttachmentViewController table](self, "table");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController rowButton](self, "rowButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "columnOrRowIdentifiers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v20, "rowIndexForIdentifier:", v23);

  -[ICTableAttachmentViewController table](self, "table");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController rowButton](self, "rowButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "columnOrRowIdentifiers");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "lastObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v25, "rowIndexForIdentifier:", v28);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v24 == v29)
  {
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("row %lu"), &stru_1EA7E9860, 0);
    v37 = (id)objc_claimAutoreleasedReturnValue();

    v32 = (void *)MEMORY[0x1E0CB3940];
  }
  else
  {
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("rows %lu to %lu"), &stru_1EA7E9860, 0);
    v37 = (id)objc_claimAutoreleasedReturnValue();

    v32 = (void *)MEMORY[0x1E0CB3940];
    v36 = v29 + 1;
  }
  objc_msgSend(v32, "localizedStringWithFormat:", v37, v24 + 1, v36);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableAttachmentViewController rowButton](self, "rowButton");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setAccessibilityValue:", v33);

}

- (void)moveAccessibilityFocusToSelectedColumnOrRowButton
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  -[ICTableAttachmentViewController columnButton](self, "columnButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSelected");

  if (v4)
  {
    -[ICTableAttachmentViewController columnButton](self, "columnButton");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ICTableAttachmentViewController rowButton](self, "rowButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isSelected");

    if (!v7)
    {
      v8 = 0;
      goto LABEL_7;
    }
    -[ICTableAttachmentViewController rowButton](self, "rowButton");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v5;
LABEL_7:
  v9 = v8;
  UIAccessibilityPostNotification(*MEMORY[0x1E0DC4578], v8);

}

- (void)speakAccessibilityAnnouncementForMoveToCellWithColumnID:(id)a3 rowID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  -[ICTableAttachmentViewController table](self, "table");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "columnIndexForIdentifier:", v7);

  -[ICTableAttachmentViewController table](self, "table");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "rowIndexForIdentifier:", v6);

  -[ICTableAttachmentViewController tableAXController](self, "tableAXController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cellElementForColumnIndex:rowIndex:", v9, v11);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "accessibilityLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "accessibilityValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  __ICAccessibilityStringForVariables();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  UIAccessibilityPostNotification(*MEMORY[0x1E0DC44C8], v14);
}

- (void)speakAccessibilityExitedTableAnnouncementAndDidRemoveRow:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  id argument;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("Removed empty row and exited table");
  else
    v6 = CFSTR("Exited table");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1EA7E9860, 0);
  argument = (id)objc_claimAutoreleasedReturnValue();

  UIAccessibilityPostNotification(*MEMORY[0x1E0DC44C8], argument);
}

- (void)sendAnalyticsForStartEditIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  if (!-[ICiOSTableAttachmentViewController isTrackingAnalyticsEdit](self, "isTrackingAnalyticsEdit"))
  {
    -[ICiOSTableAttachmentViewController setIsTrackingAnalyticsEdit:](self, "setIsTrackingAnalyticsEdit:", 1);
    -[ICTableAttachmentViewController table](self, "table");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "columnCount");

    -[ICTableAttachmentViewController table](self, "table");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "rowCount");

    -[ICiOSTableAttachmentViewController eventReporter](self, "eventReporter");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushStartTableDataWithStartColumns:startRows:", v4, v6);

  }
}

- (void)sendAnalyticsForEndEditIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  objc_opt_class();
  -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "auxiliaryResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (-[ICiOSTableAttachmentViewController isTrackingAnalyticsEdit](self, "isTrackingAnalyticsEdit"))
  {
    if (v16)
    {
      -[ICiOSTableAttachmentViewController view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "isDescendantOfView:", v5) & 1) != 0)
      {
        -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "textView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isBecomingFirstResponder");

        if (!v8)
          goto LABEL_8;
      }
      else
      {

      }
    }
    -[ICTableAttachmentViewController table](self, "table");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "columnCount");

    -[ICTableAttachmentViewController table](self, "table");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "rowCount");

    -[ICiOSTableAttachmentViewController eventReporter](self, "eventReporter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICiOSTableAttachmentViewController noteEditorViewController](self, "noteEditorViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "note");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "submitTableEditEventForNote:endColumns:endRows:", v15, v10, v12);

    -[ICiOSTableAttachmentViewController setIsTrackingAnalyticsEdit:](self, "setIsTrackingAnalyticsEdit:", 0);
  }
LABEL_8:

}

- (ICNAEventReporter)eventReporter
{
  void *v3;
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  ICNAEventReporter *v8;
  ICNAEventReporter *eventReporter;
  void *v10;

  if (!self->_eventReporter)
  {
    if (objc_msgSend(MEMORY[0x1E0D62A30], "isOptedInForAnalytics"))
    {
      -[ICiOSTableAttachmentViewController viewIfLoaded](self, "viewIfLoaded");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        v4 = objc_alloc(MEMORY[0x1E0D62A30]);
        v5 = (objc_class *)objc_opt_class();
        NSStringFromClass(v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICiOSTableAttachmentViewController view](self, "view");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (ICNAEventReporter *)objc_msgSend(v4, "initWithSubTrackerName:view:", v6, v7);
        eventReporter = self->_eventReporter;
        self->_eventReporter = v8;

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_eventReporterLostSession_, *MEMORY[0x1E0D62A18], self->_eventReporter);

      }
    }
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

- (BOOL)isShowingTextStyleOptions
{
  return self->_showingTextStyleOptions;
}

- (void)setShowingTextStyleOptions:(BOOL)a3
{
  self->_showingTextStyleOptions = a3;
}

- (CGPoint)initialDragOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialDragOffset.x;
  y = self->_initialDragOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialDragOffset:(CGPoint)a3
{
  self->_initialDragOffset = a3;
}

- (BOOL)isObservingContentOffset
{
  return self->_isObservingContentOffset;
}

- (void)setIsObservingContentOffset:(BOOL)a3
{
  self->_isObservingContentOffset = a3;
}

- (BOOL)isMenuHiding
{
  return self->_menuHiding;
}

- (void)setMenuHiding:(BOOL)a3
{
  self->_menuHiding = a3;
}

- (CGPoint)previousNoteContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_previousNoteContentOffset.x;
  y = self->_previousNoteContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPreviousNoteContentOffset:(CGPoint)a3
{
  self->_previousNoteContentOffset = a3;
}

- (CGPoint)previousViewOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_previousViewOrigin.x;
  y = self->_previousViewOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPreviousViewOrigin:(CGPoint)a3
{
  self->_previousViewOrigin = a3;
}

- (_NSRange)previousSelectedRange
{
  _NSRange *p_previousSelectedRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_previousSelectedRange = &self->_previousSelectedRange;
  location = self->_previousSelectedRange.location;
  length = p_previousSelectedRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setPreviousSelectedRange:(_NSRange)a3
{
  self->_previousSelectedRange = a3;
}

- (UITextView)biuTextView
{
  return self->_biuTextView;
}

- (void)setBiuTextView:(id)a3
{
  objc_storeStrong((id *)&self->_biuTextView, a3);
}

- (UILongPressGestureRecognizer)rowLongPress
{
  return (UILongPressGestureRecognizer *)objc_loadWeakRetained((id *)&self->_rowLongPress);
}

- (void)setRowLongPress:(id)a3
{
  objc_storeWeak((id *)&self->_rowLongPress, a3);
}

- (void)setEventReporter:(id)a3
{
  objc_storeStrong((id *)&self->_eventReporter, a3);
}

- (BOOL)isTrackingAnalyticsEdit
{
  return self->_isTrackingAnalyticsEdit;
}

- (void)setIsTrackingAnalyticsEdit:(BOOL)a3
{
  self->_isTrackingAnalyticsEdit = a3;
}

- (BOOL)isTouchingColumnButton
{
  return self->_touchingColumnButton;
}

- (void)setTouchingColumnButton:(BOOL)a3
{
  self->_touchingColumnButton = a3;
}

- (BOOL)isTouchingRowButton
{
  return self->_touchingRowButton;
}

- (void)setTouchingRowButton:(BOOL)a3
{
  self->_touchingRowButton = a3;
}

- (NSObject)keyboardWillShowScrollObservation
{
  return self->_keyboardWillShowScrollObservation;
}

- (void)setKeyboardWillShowScrollObservation:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardWillShowScrollObservation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardWillShowScrollObservation, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_destroyWeak((id *)&self->_rowLongPress);
  objc_storeStrong((id *)&self->_biuTextView, 0);
}

@end
