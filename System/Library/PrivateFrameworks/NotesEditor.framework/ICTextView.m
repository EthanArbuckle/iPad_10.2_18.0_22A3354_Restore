@implementation ICTextView

void __96__ICTextView_updateCompatibilityBannerForNote_parentViewController_updateTextViewContentInsets___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_loadWeakRetained((id *)(a1 + 48));
  if (v2)
  {
    objc_msgSend(WeakRetained, "editorController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "note");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if (v6)
    {
      if (*(_BYTE *)(a1 + 56))
      {
        if ((objc_msgSend(WeakRetained, "showCompatibilityBannerWithParentViewController:", v2) & 1) == 0)
          goto LABEL_9;
      }
      else if (!objc_msgSend(WeakRetained, "hideCompatibilityBanner"))
      {
        goto LABEL_9;
      }
      if (*(_BYTE *)(a1 + 57))
      {
        objc_msgSend(WeakRetained, "editorController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "updateTextViewContentInsetsAnimated:", 1);

      }
    }
  }
LABEL_9:

}

void __96__ICTextView_updateCompatibilityBannerForNote_parentViewController_updateTextViewContentInsets___block_invoke(uint64_t a1, char a2)
{
  id v4;
  id v5;
  id v6;
  char v7;
  char v8;

  objc_copyWeak(&v5, (id *)(a1 + 40));
  objc_copyWeak(&v6, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 32);
  v7 = a2;
  v8 = *(_BYTE *)(a1 + 56);
  performBlockOnMainThread();

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);
}

uint64_t __32__ICTextView__updateContentSize__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a5 = 1;
  return result;
}

- (ICNoteEditorUserTitleView)userTitleView
{
  return self->_userTitleView;
}

- (unint64_t)updatingContentSizeCount
{
  return self->_updatingContentSizeCount;
}

- (void)updateOverscrollItemFrames
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  char v32;
  id v33;

  -[ICTextView bounds](self, "bounds");
  v4 = v3;
  -[ICTextView textContainerInset](self, "textContainerInset");
  v6 = v4 + v5 * -2.0;
  -[ICTextView compatibilityBannerView](self, "compatibilityBannerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredHeight");
  v9 = v8;

  -[ICTextView textContainerInset](self, "textContainerInset");
  v11 = v10;
  v12 = -v9;
  -[ICTextView compatibilityBannerView](self, "compatibilityBannerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v14 = TSDNearlyEqualRects();

  if ((v14 & 1) == 0)
  {
    -[ICTextView compatibilityBannerView](self, "compatibilityBannerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAvailableWidth:", v6);

    -[ICTextView compatibilityBannerView](self, "compatibilityBannerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFrame:", v11, -v9, v6, v9);

  }
  -[ICTextView dateView](self, "dateView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "preferredHeight");
  v19 = v18;

  -[ICTextView textContainerInset](self, "textContainerInset");
  v21 = v20;
  -[ICTextView dateView](self, "dateView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "frame");
  v23 = TSDNearlyEqualRects();

  if ((v23 & 1) == 0)
  {
    -[ICTextView dateView](self, "dateView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFrame:", v21, v12 - v19, v6, v19);

  }
  -[ICTextView userTitleView](self, "userTitleView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "preferredHeight");
  v27 = v26;

  -[ICTextView textContainerInset](self, "textContainerInset");
  v29 = v28;
  v30 = v12 - v27 - v19;
  -[ICTextView userTitleView](self, "userTitleView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "frame");
  v32 = TSDNearlyEqualRects();

  if ((v32 & 1) == 0)
  {
    -[ICTextView userTitleView](self, "userTitleView");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setFrame:", v29, v30, v6, v27);

  }
}

- (void)updateLayoutMargins
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[ICTextView minimumMargins](self, "minimumMargins");
  v4 = v3;
  v6 = v5;
  -[ICTextView layoutMargins](self, "layoutMargins");
  if (v7 >= v4)
    v4 = v7;
  -[ICTextView layoutMargins](self, "layoutMargins");
  if (v8 < v6)
    v8 = v6;
  -[ICTextView applyEdgeInsets:](self, "applyEdgeInsets:", 0.0, v4, 0.0, v8);
}

- (void)updateLayoutMarginsForMultipleTextViewsIfNecessary
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  id v7;

  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 >= 2)
  {
    if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
    {
      -[ICBaseTextView editorController](self, "editorController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "saveCurrentScrollState");

    }
    -[ICTextView updateLayoutMargins](self, "updateLayoutMargins");
    if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
    {
      -[ICBaseTextView editorController](self, "editorController");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "applyScrollStateIfAvailable");

    }
  }
}

- (void)updateCompatibilityBannerForNote:(id)a3 parentViewController:(id)a4 updateTextViewContentInsets:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  BOOL v16;
  id from;
  id location;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    objc_msgSend(v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    objc_initWeak(&from, v9);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __96__ICTextView_updateCompatibilityBannerForNote_parentViewController_updateTextViewContentInsets___block_invoke;
    v12[3] = &unk_1EA7DEF78;
    objc_copyWeak(&v14, &location);
    objc_copyWeak(&v15, &from);
    v11 = v10;
    v13 = v11;
    v16 = a5;
    +[ICNoteEditorCompatibilityBannerView checkShouldShowCompatibilityBannerViewForNote:parentViewController:completion:](ICNoteEditorCompatibilityBannerView, "checkShouldShowCompatibilityBannerViewForNote:parentViewController:completion:", v8, v9, v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
}

- (id)undoManager
{
  void *v2;
  void *v3;

  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "undoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)supportsAttachments
{
  return 1;
}

- (BOOL)shouldAutoScroll
{
  void *v3;
  void *v4;
  char v5;
  void *v7;
  BOOL v8;

  if (-[ICTextView isScrolling](self, "isScrolling"))
    return 0;
  objc_opt_class();
  -[ICTextView textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isTypingOrMarkingText");

  if ((v5 & 1) != 0)
    return 1;
  -[ICTextView scrollClampingControllerDelayedRelease](self, "scrollClampingControllerDelayedRelease");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isClamped") & 1) != 0)
  {

    return 0;
  }
  v8 = -[ICTextView isPerformingHighlightUpdates](self, "isPerformingHighlightUpdates");

  return !v8;
}

- (void)setUpdatingContentSizeCount:(unint64_t)a3
{
  self->_updatingContentSizeCount = a3;
}

- (void)setScrollClampingControllerDelayedRelease:(id)a3
{
  objc_storeStrong((id *)&self->_scrollClampingControllerDelayedRelease, a3);
}

- (void)setPreviousContentSize:(CGSize)a3
{
  self->_previousContentSize = a3;
}

- (void)setNeedsHideOverlappingAttachmentViews:(BOOL)a3
{
  self->_needsHideOverlappingAttachmentViews = a3;
}

- (void)setIsTransitioningToNewSize:(BOOL)a3
{
  self->_isTransitioningToNewSize = a3;
}

- (void)setIsSettingEditable:(BOOL)a3
{
  self->_isSettingEditable = a3;
}

- (void)setIsSettingContentOffset:(BOOL)a3
{
  self->_isSettingContentOffset = a3;
}

- (void)setIsInSetBounds:(BOOL)a3
{
  self->_isInSetBounds = a3;
}

- (void)setEditable:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  -[ICTextView setIsSettingEditable:](self, "setIsSettingEditable:", 1);
  -[ICTextView TTTextStorageOptional](self, "TTTextStorageOptional");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginTemporaryAttributeEditing");

  v7.receiver = self;
  v7.super_class = (Class)ICTextView;
  -[ICTextView setEditable:](&v7, sel_setEditable_, v3);
  -[ICTextView TTTextStorageOptional](self, "TTTextStorageOptional");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endTemporaryAttributeEditing");

  -[ICTextView setIsSettingEditable:](self, "setIsSettingEditable:", 0);
}

- (void)setDisplayingEditableContent:(BOOL)a3
{
  self->_displayingEditableContent = a3;
}

- (void)setDisableContentOffsetChanges:(BOOL)a3
{
  self->_disableContentOffsetChanges = a3;
}

- (void)setCurrentSetBoundsRect:(CGRect)a3
{
  self->_currentSetBoundsRect = a3;
}

- (void)setContentOffset:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  void *v18;
  char v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  char v32;
  void *v33;
  int v34;
  NSObject *v35;
  int v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  float v46;
  objc_super v47;
  objc_super v48;
  _QWORD v49[7];
  objc_super v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;
  NSPoint v56;

  y = a3.y;
  x = a3.x;
  v55 = *MEMORY[0x1E0C80C00];
  if (-[ICTextView updatingContentSizeCount](self, "updatingContentSizeCount"))
  {
    v50.receiver = self;
    v50.super_class = (Class)ICTextView;
    -[ICTextView setContentOffset:](&v50, sel_setContentOffset_, x, y);
    return;
  }
  -[ICTextView scrollEmbeddedScrollViewsWithProposedContentOffset:](self, "scrollEmbeddedScrollViewsWithProposedContentOffset:", x, y);
  v7 = v6;
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0D64CD0], "rootSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isRubberBandingEnabled")
    || !-[ICTextView shouldRubberBand](self, "shouldRubberBand"))
  {

    goto LABEL_9;
  }
  if ((-[ICTextView isDragging](self, "isDragging") & 1) != 0)
  {

    goto LABEL_18;
  }
  v19 = -[ICTextView isDecelerating](self, "isDecelerating");

  if ((v19 & 1) == 0)
  {
LABEL_9:
    -[ICBaseTextView editorController](self, "editorController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "attributionSidebarVisibility");

    -[ICBaseTextView editorController](self, "editorController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "authorHighlightsController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isPerformingHighlightUpdatesForTextStorage:", v15);

    if (v12 != 1 && (v16 & 1) == 0 && !-[ICTextView isSettingContentOffset](self, "isSettingContentOffset"))
    {
      if ((TSDPointHasInfComponents() & 1) != 0 || TSDPointHasNaNComponents())
      {
        v17 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v56.x = v7;
          v56.y = v9;
          NSStringFromPoint(v56);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v52 = "-[ICTextView setContentOffset:]";
          v53 = 2112;
          v54 = v18;
          _os_log_impl(&dword_1DD7B0000, v17, OS_LOG_TYPE_DEFAULT, "Calling %s with invalid value: %@", buf, 0x16u);

        }
      }
      else
      {
        -[ICTextView setIsSettingContentOffset:](self, "setIsSettingContentOffset:", 1);
        -[ICTextView contentOffset](self, "contentOffset");
        if ((v30 != 0.0 || v29 != v9) && !-[ICTextView isTransitioningToNewSize](self, "isTransitioningToNewSize"))
        {
          -[ICBaseTextView icDelegate](self, "icDelegate");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_opt_respondsToSelector();

          if ((v32 & 1) != 0
            && (-[ICBaseTextView icDelegate](self, "icDelegate"),
                v33 = (void *)objc_claimAutoreleasedReturnValue(),
                v34 = objc_msgSend(v33, "shouldLockTextViewContentOffset"),
                v33,
                v34))
          {
            v35 = os_log_create("com.apple.notes", "UI");
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              -[ICTextView setContentOffset:].cold.1(v35);

            v36 = 1;
          }
          else
          {
            v36 = 0;
          }
          -[ICTextView scrollClampingControllerDelayedRelease](self, "scrollClampingControllerDelayedRelease");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "clampedYValue");
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          if (v44 && !-[ICTextView isUpdatingPanGesture](self, "isUpdatingPanGesture"))
          {
            objc_msgSend(v44, "floatValue");
            v48.receiver = self;
            v48.super_class = (Class)ICTextView;
            -[ICTextView setContentOffset:](&v48, sel_setContentOffset_, 0.0, v46);
          }
          else if (-[ICTextView disableContentOffsetChanges](self, "disableContentOffsetChanges")
                 || (v36 | -[ICBaseTextView isInProcessEditingForTextStorage](self, "isInProcessEditingForTextStorage")) == 1)
          {
            if (!-[ICBaseTextView isInProcessEditingForTextStorage](self, "isInProcessEditingForTextStorage"))
            {
              -[ICTextView contentOffset](self, "contentOffset");
              v9 = v45;
            }
            -[ICTextView setClippedContentOffset:](self, "setClippedContentOffset:", 0.0, v9);
          }
          else
          {
            v47.receiver = self;
            v47.super_class = (Class)ICTextView;
            -[ICTextView setContentOffset:](&v47, sel_setContentOffset_, 0.0, v9);
          }

        }
        -[ICTextView setIsSettingContentOffset:](self, "setIsSettingContentOffset:", 0);
      }
    }
    return;
  }
LABEL_18:
  -[ICTextView rubberBandContentOffset](self, "rubberBandContentOffset");
  v21 = v20;
  objc_msgSend(MEMORY[0x1E0D64CD0], "rootSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "rubberBandRange");
  v24 = v23;

  objc_msgSend(MEMORY[0x1E0D64CD0], "rootSettings");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "rubberBandDragDistance");
  v27 = v26;

  if (v9 <= v21)
    goto LABEL_9;
  if (vabdd_f64(v9, v21) < v27)
  {
    ICTextViewRubberBandOffsetForOffset(0, v9, v21, v21, v24);
    v9 = v28;
    goto LABEL_9;
  }
  -[ICTextView setShouldRubberBand:](self, "setShouldRubberBand:", 0);
  -[ICTextView delegate](self, "delegate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_opt_respondsToSelector();

  if ((v38 & 1) != 0)
  {
    -[ICTextView delegate](self, "delegate");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "textViewDidBreakRubberBand:", self);

  }
  objc_msgSend(MEMORY[0x1E0D64CD0], "rootSettings");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "rubberBandCatchUpAnimationDuration");
  v42 = v41;

  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __31__ICTextView_setContentOffset___block_invoke;
  v49[3] = &unk_1EA7DEA60;
  *(CGFloat *)&v49[5] = v7;
  *(double *)&v49[6] = v9;
  v49[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v49, v42);
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  NSObject *v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  _BOOL8 v14;
  _BOOL8 v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;
  NSRect v30;
  CGRect v31;
  CGRect v32;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v29 = *MEMORY[0x1E0C80C00];
  if ((TSDRectHasInfComponents() & 1) != 0 || TSDRectHasNaNComponents())
  {
    v8 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v30.origin.x = x;
      v30.origin.y = y;
      v30.size.width = width;
      v30.size.height = height;
      NSStringFromRect(v30);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v26 = "-[ICTextView setBounds:]";
      v27 = 2112;
      v28 = v9;
      _os_log_impl(&dword_1DD7B0000, v8, OS_LOG_TYPE_DEFAULT, "Calling %s with invalid value: %@", buf, 0x16u);

    }
LABEL_6:

    return;
  }
  if (-[ICTextView isInSetBounds](self, "isInSetBounds"))
  {
    -[ICTextView currentSetBoundsRect](self, "currentSetBoundsRect");
    v32.origin.x = v10;
    v32.origin.y = v11;
    v32.size.width = v12;
    v32.size.height = v13;
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    if (CGRectEqualToRect(v31, v32))
    {
      v8 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD7B0000, v8, OS_LOG_TYPE_DEFAULT, "We hit the setBounds guard", buf, 2u);
      }
      goto LABEL_6;
    }
  }
  v14 = -[ICTextView disableContentOffsetChanges](self, "disableContentOffsetChanges");
  if (!-[ICTextView isTransitioningToNewSize](self, "isTransitioningToNewSize"))
    -[ICTextView setDisableContentOffsetChanges:](self, "setDisableContentOffsetChanges:", 1);
  -[ICTextView setIsTransitioningToNewSize:](self, "setIsTransitioningToNewSize:", 1);
  v15 = -[ICTextView isInSetBounds](self, "isInSetBounds");
  -[ICTextView currentSetBoundsRect](self, "currentSetBoundsRect");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[ICTextView setIsInSetBounds:](self, "setIsInSetBounds:", 1);
  -[ICTextView setCurrentSetBoundsRect:](self, "setCurrentSetBoundsRect:", x, y, width, height);
  v24.receiver = self;
  v24.super_class = (Class)ICTextView;
  -[ICTextView setBounds:](&v24, sel_setBounds_, x, y, width, height);
  -[ICTextView setIsTransitioningToNewSize:](self, "setIsTransitioningToNewSize:", 0);
  -[ICTextView setDisableContentOffsetChanges:](self, "setDisableContentOffsetChanges:", v14);
  -[ICTextView setIsInSetBounds:](self, "setIsInSetBounds:", v15);
  -[ICTextView setCurrentSetBoundsRect:](self, "setCurrentSetBoundsRect:", v17, v19, v21, v23);
  -[ICTextView updateLayoutMargins](self, "updateLayoutMargins");
}

- (CGPoint)scrollEmbeddedScrollViewsWithProposedContentOffset:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double MaxY;
  double v38;
  BOOL v39;
  double v40;
  CGFloat v41;
  double v42;
  char v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  CGFloat rect;
  CGFloat v65;
  CGFloat v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  uint64_t v72;
  CGPoint result;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  y = a3.y;
  x = a3.x;
  v72 = *MEMORY[0x1E0C80C00];
  -[ICTextView contentOffset](self, "contentOffset");
  v7 = v6;
  -[ICTextView contentOffset](self, "contentOffset");
  v9 = v8;
  -[ICTextView bounds](self, "bounds");
  v65 = v11;
  v66 = v10;
  rect = v12;
  v14 = v13;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  -[ICTextView embeddedScrollViews](self, "embeddedScrollViews");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
  if (v16)
  {
    v17 = v16;
    v61 = x - v7;
    v62 = x;
    v63 = y;
    v18 = y - v9;
    v19 = *(_QWORD *)v68;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v68 != v19)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        objc_msgSend(v21, "contentSize", *(_QWORD *)&v61);
        v23 = v22;
        objc_msgSend(v21, "bounds");
        if (v23 > CGRectGetHeight(v74))
        {
          objc_msgSend(v21, "bounds");
          objc_msgSend(v21, "convertRect:toView:", self);
          v25 = v24;
          v27 = v26;
          v29 = v28;
          v31 = v30;
          objc_msgSend(v21, "contentSize");
          v33 = v32;
          objc_msgSend(v21, "bounds");
          v34 = v33 - CGRectGetHeight(v75);
          objc_msgSend(v21, "contentInset");
          v36 = v34 + v35;
          v76.origin.x = v25;
          v76.origin.y = v27;
          v76.size.width = v29;
          v76.size.height = v31;
          MaxY = CGRectGetMaxY(v76);
          v77.origin.y = v65;
          v77.origin.x = v66;
          v77.size.width = rect;
          v77.size.height = v14;
          v38 = CGRectGetMaxY(v77);
          v39 = 0;
          if (v18 > 0.0 && MaxY - v18 < v38)
          {
            objc_msgSend(v21, "contentOffset");
            v39 = v40 < v36;
          }
          v78.origin.x = v25;
          v78.origin.y = v27;
          v78.size.width = v29;
          v78.size.height = v31;
          v41 = CGRectGetMaxY(v78) - v18;
          v79.origin.y = v65;
          v79.origin.x = v66;
          v79.size.width = rect;
          v79.size.height = v14;
          if (v41 <= CGRectGetMaxY(v79))
          {
            if (v39)
              goto LABEL_20;
          }
          else
          {
            objc_msgSend(v21, "contentOffset");
            v43 = v42 > 0.0 || v39;
            if ((v43 & 1) != 0)
            {
LABEL_20:
              objc_msgSend(v21, "contentOffset");
              v45 = v61 + v44;
              objc_msgSend(v21, "contentOffset");
              v47 = fmax(v18 + v46, 0.0);
              if (v47 >= v36)
                v48 = v36;
              else
                v48 = v47;
              objc_msgSend(v21, "contentOffset");
              v50 = v45 - v49;
              objc_msgSend(v21, "contentOffset");
              v52 = v48 - v51;
              objc_msgSend(v21, "setContentOffset:", v45, v48);
              -[ICTextView panGestureRecognizer](self, "panGestureRecognizer");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "translationInView:", self);
              v55 = v54;
              v57 = v56;

              -[ICTextView panGestureRecognizer](self, "panGestureRecognizer");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "setTranslation:inView:", self, v50 + v55, v57 + v52);

              x = v62 - v50;
              y = v63 - v52;
              goto LABEL_24;
            }
          }
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
      if (v17)
        continue;
      break;
    }
    x = v62;
    y = v63;
  }
LABEL_24:

  v59 = x;
  v60 = y;
  result.y = v60;
  result.x = v59;
  return result;
}

- (ICSharedScrollClampingController)scrollClampingControllerDelayedRelease
{
  return self->_scrollClampingControllerDelayedRelease;
}

- (void)sceneWillEnterForeground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v6)
    -[ICTextView updateLayoutMarginsForMultipleTextViewsIfNecessary](self, "updateLayoutMarginsForMultipleTextViewsIfNecessary");
}

- (BOOL)resignFirstResponder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  objc_super v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  ICTextView *v31;

  if (-[ICTextView isFirstResponder](self, "isFirstResponder"))
  {
    objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "extendDeauthenticationTimer");

    -[ICBaseTextView editorController](self, "editorController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mentionsController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0D63BB0];
    -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "rangeOfUnconfirmedMentionInTextStorage:", v7);
    v10 = v9;

    if (v8 != 0x7FFFFFFFFFFFFFFFLL && v10)
    {
      -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICBaseTextView editorController](self, "editorController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "note");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      BYTE1(v25) = -[ICBaseTextView languageHasSpaces](self, "languageHasSpaces");
      LOBYTE(v25) = 1;
      objc_msgSend(v5, "checkForMentionInEditedRange:ofTextStorage:note:textView:allowAutoExplicitMention:isEndingEditing:languageHasSpaces:parentAttachment:", v8, v10, v11, v13, self, 1, v25, 0);

    }
    -[ICBaseTextView editorController](self, "editorController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hashtagController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0D63B28];
    -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "rangeOfUnconfirmedHashtagInTextStorage:", v17);
    v20 = v19;

    if (v18 != 0x7FFFFFFFFFFFFFFFLL && v20)
    {
      -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICBaseTextView editorController](self, "editorController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "note");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      BYTE1(v25) = -[ICBaseTextView languageHasSpaces](self, "languageHasSpaces");
      LOBYTE(v25) = 1;
      objc_msgSend(v15, "checkForHashtagInEditedRange:ofTextStorage:note:textView:allowAutoExplicitHashtag:isEndingEditing:languageHasSpaces:parentAttachment:", v18, v20, v21, v23, self, 0, v25, 0);

    }
  }
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning())
  {
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __34__ICTextView_resignFirstResponder__block_invoke;
    v30 = &unk_1EA7DD2D8;
    v31 = self;
    dispatchMainAfterDelay();
  }
  v26.receiver = self;
  v26.super_class = (Class)ICTextView;
  return -[ICBaseTextView resignFirstResponder](&v26, sel_resignFirstResponder);
}

- (CGSize)previousContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_previousContentSize.width;
  height = self->_previousContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)minimumMargins
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  -[ICTextView textContainer](self, "textContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lineFragmentPadding");
  v4 = 12.0 - v3;

  v5 = 0.0;
  v6 = 0.0;
  v7 = v4;
  v8 = v4;
  result.right = v8;
  result.bottom = v6;
  result.left = v7;
  result.top = v5;
  return result;
}

- (double)leadingMargin
{
  void *v3;
  uint64_t v4;
  double result;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;

  if (-[ICTextView isEditingOnSystemPaper](self, "isEditingOnSystemPaper")
    && (-[ICTextView traitCollection](self, "traitCollection"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "userInterfaceIdiom"),
        v3,
        v4 == 1))
  {
    +[ICSystemPaperConstants noteLeadingMargin](ICSystemPaperConstants, "noteLeadingMargin");
  }
  else
  {
    -[ICTextView bounds](self, "bounds");
    v7 = ceil(v6 * 24.0 / 375.0);
    -[ICTextView textContainer](self, "textContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lineFragmentPadding");
    v10 = v7 - v9;

    -[ICTextView minimumMargins](self, "minimumMargins");
    if (v10 >= v11)
      return v10;
    else
      return v11;
  }
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    objc_opt_class();
    -[ICTextView layoutManager](self, "layoutManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[ICTextView shouldUpdateVisibleSupplementalViewsInLayoutSubviews](self, "shouldUpdateVisibleSupplementalViewsInLayoutSubviews"))
    {
      objc_msgSend(v4, "updateVisibleSupplementalViews");
    }

  }
  v6.receiver = self;
  v6.super_class = (Class)ICTextView;
  -[ICTextView layoutSubviews](&v6, sel_layoutSubviews);
  if ((-[ICTextView _freezeTextContainerSize](self, "_freezeTextContainerSize") & 1) == 0
    && !-[ICTextView isTransitioningToNewSize](self, "isTransitioningToNewSize"))
  {
    -[ICTextView updateOverscrollItemFrames](self, "updateOverscrollItemFrames");
  }
  ICInternalSettingsIsTextKit2Enabled();
  -[ICTextView dateView](self, "dateView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateLayoutIfNecessary");

  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
    -[ICTextView hideOverlappingAttachmentViewsIfNecessary](self, "hideOverlappingAttachmentViewsIfNecessary");
}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICTextView;
  -[ICTextView layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  -[ICTextView updateLayoutMargins](self, "updateLayoutMargins");
}

- (BOOL)isTransitioningToNewSize
{
  return self->_isTransitioningToNewSize;
}

- (BOOL)isSettingContentOffset
{
  return self->_isSettingContentOffset;
}

- (BOOL)isScrolling
{
  if ((-[ICTextView isDragging](self, "isDragging") & 1) != 0
    || (-[ICTextView isDecelerating](self, "isDecelerating") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return -[ICTextView _isAnimatingScroll](self, "_isAnimatingScroll");
  }
}

- (BOOL)isPerformingHighlightUpdates
{
  return self->_isPerformingHighlightUpdates;
}

- (BOOL)isInSetBounds
{
  return self->_isInSetBounds;
}

- (BOOL)isEditingOnSystemPaper
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[ICBaseTextView icDelegate](self, "icDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[ICBaseTextView icDelegate](self, "icDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEditingOnSystemPaper");

  return v6;
}

- (void)initializeScollClampingController
{
  ICSharedScrollClampingController *v3;

  v3 = -[ICSharedScrollClampingController initWithTextView:listensToMergeNotifications:clampingTurnOffDelay:]([ICSharedScrollClampingController alloc], "initWithTextView:listensToMergeNotifications:clampingTurnOffDelay:", self, 1, 0.5);
  -[ICTextView setScrollClampingControllerDelayedRelease:](self, "setScrollClampingControllerDelayedRelease:", v3);

}

- (ICTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  ICTextView *v16;
  void *v17;
  float v18;
  double v19;
  CATransformLayer *v20;
  CATransformLayer *splitLayerContainer;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSMutableArray *v37;
  NSMutableArray *highlightLayers;
  void *v39;
  ICTextFindingCoordinator *v40;
  objc_super v42;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  if (!v9)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((textContainer) != nil)", "-[ICTextView initWithFrame:textContainer:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "textContainer");
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    objc_msgSend(v9, "textLayoutManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((textContainer.textLayoutManager) != nil)", "-[ICTextView initWithFrame:textContainer:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "textContainer.textLayoutManager");
    objc_msgSend(v9, "textLayoutManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textContentManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((textContainer.textLayoutManager.textContentManager) != nil)", "-[ICTextView initWithFrame:textContainer:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "textContainer.textLayoutManager.textContentManager");
  }
  else
  {
    objc_msgSend(v9, "layoutManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((textContainer.layoutManager) != nil)", "-[ICTextView initWithFrame:textContainer:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "textContainer.layoutManager");
    objc_msgSend(v9, "layoutManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textStorage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((textContainer.layoutManager.textStorage) != nil)", "-[ICTextView initWithFrame:textContainer:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "textContainer.layoutManager.textStorage");
  }
  v42.receiver = self;
  v42.super_class = (Class)ICTextView;
  v16 = -[ICBaseTextView initWithFrame:textContainer:](&v42, sel_initWithFrame_textContainer_, v9, x, y, width, height);
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "floatForKey:", *MEMORY[0x1E0D64438]);
    v19 = v18;

    -[ICTextView setMaxTileHeight:](v16, "setMaxTileHeight:", v19);
    -[ICTextView setEditable:](v16, "setEditable:", 0);
    v20 = (CATransformLayer *)objc_alloc_init(MEMORY[0x1E0CD28C8]);
    splitLayerContainer = v16->_splitLayerContainer;
    v16->_splitLayerContainer = v20;

    -[ICTextView layer](v16, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSublayer:", v16->_splitLayerContainer);

    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[ICTextView setLayoutMarginsFollowReadableWidth:](v16, "setLayoutMarginsFollowReadableWidth:", 1);
    -[ICTextView createDateLabel](v16, "createDateLabel");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v16, sel_keyboardDidBeginDictation_, CFSTR("UIKeyboardDidBeginDictationNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v16, sel_dictationControllerDidPause_, *MEMORY[0x1E0DC4970], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v16, sel_dictationControllerDidResume_, *MEMORY[0x1E0DC4978], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v16, sel_dictationControllerDidFinish_, *MEMORY[0x1E0DC4968], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *MEMORY[0x1E0CB33A8];
    -[ICTextView undoManager](v16, "undoManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v16, sel_undoManagerDidOpenUndoGroup_, v28, v29);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObserver:selector:name:object:", v16, sel_handleAccessibilityDarkerSystemColorsStatusDidChange_, *MEMORY[0x1E0DC4508], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObserver:selector:name:object:", v16, sel_sceneWillEnterForeground_, *MEMORY[0x1E0DC5308], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObserver:selector:name:object:", v16, sel_splitViewAnimatedTransitionWillBegin_, CFSTR("ICSplitViewControllerWillBeginAnimatedTransitionToStateRequest"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObserver:selector:name:object:", v16, sel_splitViewAnimatedTransitionEnded_, CFSTR("ICSplitViewControllerDidEndAnimatedTransitionToStateRequest"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObserver:selector:name:object:", v16, sel_authorHighlightsControllerWillPerformHighlightUpdates_, *MEMORY[0x1E0D64910], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObserver:selector:name:object:", v16, sel_authorHighlightsControllerDidPerformHighlightUpdates_, *MEMORY[0x1E0D648F8], 0);

    -[ICTextView initializeScollClampingController](v16, "initializeScollClampingController");
    -[ICTextView setPreservesSuperviewLayoutMargins:](v16, "setPreservesSuperviewLayoutMargins:", 0);
    -[ICTextView containerViewForAttachments](v16, "containerViewForAttachments");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setShouldGroupAccessibilityChildren:", 1);

    -[ICBaseTextView setupTextViewDragAndDropDelegates](v16, "setupTextViewDragAndDropDelegates");
    objc_msgSend(MEMORY[0x1E0D64C38], "updateTouchPredictionPointsFromOverride");
    v37 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    highlightLayers = v16->_highlightLayers;
    v16->_highlightLayers = v37;

    objc_msgSend(MEMORY[0x1E0DC4250], "productivityPanGestureRecognizerWithTarget:action:delegate:", v16, sel_inProcessUndoPanGesture_, v16);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setName:", CFSTR("com.apple.MobileNotes.InProcess_UIKBProductivityPanGestureRecognizer"));
    -[ICTextView addGestureRecognizer:](v16, "addGestureRecognizer:", v39);
    -[ICTextView registerForTraitChanges](v16, "registerForTraitChanges");
    if (ICInternalSettingsIsAsyncFindEnabled())
    {
      v40 = -[ICTextFindingCoordinator initWithDataSource:]([ICTextFindingCoordinator alloc], "initWithDataSource:", v16);
      -[ICTextView setTextFindingCoordinator:](v16, "setTextFindingCoordinator:", v40);

    }
  }

  return v16;
}

- (BOOL)hideCompatibilityBanner
{
  void *v3;
  void *v4;

  -[ICTextView compatibilityBannerView](self, "compatibilityBannerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "removeFromSuperview");
    -[ICTextView setCompatibilityBannerView:](self, "setCompatibilityBannerView:", 0);
  }

  return v4 != 0;
}

- (NSSet)embeddedScrollViews
{
  return self->_embeddedScrollViews;
}

- (BOOL)disableContentOffsetChanges
{
  return self->_disableContentOffsetChanges;
}

- (ICNoteEditorDateView)dateView
{
  return self->_dateView;
}

- (CGRect)currentSetBoundsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_currentSetBoundsRect.origin.x;
  y = self->_currentSetBoundsRect.origin.y;
  width = self->_currentSetBoundsRect.size.width;
  height = self->_currentSetBoundsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)createUserTitleViewIfNecessaryForNote:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  ICNoteEditorDateView *dateView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[ICTextView userTitleView](self, "userTitleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4
    && +[ICNoteEditorUserTitleView shouldShowUserTitleViewForNote:](ICNoteEditorUserTitleView, "shouldShowUserTitleViewForNote:", v14))
  {
    v5 = +[ICNoteEditorUserTitleView newUserTitleView](ICNoteEditorUserTitleView, "newUserTitleView");
    -[ICTextView setUserTitleView:](self, "setUserTitleView:", v5);

    -[ICTextView userTitleView](self, "userTitleView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAutoresizingMask:", 5);

    -[ICTextView userTitleView](self, "userTitleView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_accessibilitySetIsSpeakThisElement:", 0);

    -[ICTextView userTitleView](self, "userTitleView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", self);

    dateView = self->_dateView;
    -[ICTextView userTitleView](self, "userTitleView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (dateView)
      -[ICTextView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v10, self->_dateView);
    else
      -[ICTextView addSubview:](self, "addSubview:", v10);

  }
  -[ICTextView userTitleView](self, "userTitleView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v14;
  if (v11)
  {
    -[ICTextView userTitleView](self, "userTitleView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNote:", v14);

    v12 = v14;
  }

}

- (void)createDateLabel
{
  void *v3;
  void *v4;
  char v5;
  ICNoteEditorDateView *v6;
  ICNoteEditorDateView *dateView;

  objc_opt_class();
  -[ICTextView textContainer](self, "textContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "insideSiriSnippet");

  if ((v5 & 1) == 0)
  {
    v6 = +[ICNoteEditorDateView newDateView](ICNoteEditorDateView, "newDateView");
    dateView = self->_dateView;
    self->_dateView = v6;

    -[ICNoteEditorDateView setAutoresizingMask:](self->_dateView, "setAutoresizingMask:", 21);
    -[ICNoteEditorDateView _accessibilitySetIsSpeakThisElement:](self->_dateView, "_accessibilitySetIsSpeakThisElement:", 0);
    -[ICTextView addSubview:](self, "addSubview:", self->_dateView);
  }
}

- (ICNoteEditorCompatibilityBannerView)compatibilityBannerView
{
  return self->_compatibilityBannerView;
}

- (BOOL)becomesEditableWithGestures
{
  return 0;
}

- (void)applyEdgeInsets:(UIEdgeInsets)a3
{
  double right;
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
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  ICTextView *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  double v29;
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
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  _BOOL4 v46;
  double v47;
  _BOOL4 v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  int IsTextKit2Enabled;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  uint64_t v72;

  right = a3.right;
  v72 = *MEMORY[0x1E0C80C00];
  if ((-[ICTextView _freezeTextContainerSize](self, "_freezeTextContainerSize", a3.top, a3.left, a3.bottom) & 1) != 0)
    return;
  if (!objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
  {
    -[ICTextView window](self, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      return;
    v14 = -[ICTextView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    -[ICTextView bounds](self, "bounds");
    v16 = v15;
    -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "textViews");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v18, "count") >= 2)
    {
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v65 = v18;
      v19 = v18;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v68;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v68 != v22)
              objc_enumerationMutation(v19);
            v24 = *(ICTextView **)(*((_QWORD *)&v67 + 1) + 8 * i);
            if (v24 != self)
            {
              objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * i), "window");
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              if (v25)
              {
                -[ICTextView window](v24, "window");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "windowScene");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v27, "activationState");

                if (v28 <= 1)
                {
                  -[ICTextView bounds](v24, "bounds");
                  if (v29 >= v16)
                    v16 = v29;
                }
              }
            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
        }
        while (v21);
      }

      v18 = v65;
    }
    -[ICTextView leadingMargin](self, "leadingMargin");
    v31 = v30;
    v32 = v16 - (right + v30);
    if (v16 > 1366.0)
    {
      v33 = 1.2;
LABEL_30:
      v35 = fmax(v33, 1.0);
      v36 = v16 - (v31 + v32 * v35);
      if (v36 >= v31)
        v37 = v36;
      else
        v37 = v31;
      -[ICTextView textContainerInset](self, "textContainerInset");
      v39 = v38;
      v41 = v40;
      if (v14 == 1)
        v42 = v31;
      else
        v42 = v37;
      if (v14 == 1)
        v31 = v37;
      -[ICTextView textContainerInset](self, "textContainerInset");
      v46 = v45 == v31;
      if (v47 != v39)
        v46 = 0;
      if (v44 != v42)
        v46 = 0;
      v48 = v43 == v41 && v46;
      if (!v48)
        -[ICTextView setTextContainerInset:](self, "setTextContainerInset:", v39, v31, v41, v42);
      -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      objc_msgSend(v49, "styler");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      ICCheckedDynamicCast();
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v51)
      {
        v54 = v18;
        v55 = 0;
        goto LABEL_63;
      }
      objc_msgSend(v51, "zoomController");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "zoomFactor");
      if (vabdd_f64(v35, v53) >= 0.00999999978)
      {
        if ((ICInternalSettingsIsTextKit2Enabled() & 1) != 0 || (unint64_t)objc_msgSend(v18, "count") < 2)
          goto LABEL_57;
        -[ICTextView window](self, "window");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "windowScene");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v57, "activationState") == 2)
        {
          v54 = v18;

          goto LABEL_50;
        }
        -[ICTextView window](self, "window");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "windowScene");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend(v59, "activationState");

        if (v66 != 1)
        {
LABEL_57:
          objc_msgSend(v52, "setZoomFactor:", v35);
          v60 = os_log_create("com.apple.notes", "UI");
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
            -[ICTextView applyEdgeInsets:].cold.1(v60, v35);
          v54 = v18;

          if (ICInternalSettingsIsTextKit2Enabled())
          {
            v55 = 1;
            -[ICBaseTextView setNeedsStylingRefreshOnNextLayout:](self, "setNeedsStylingRefreshOnNextLayout:", 1);
          }
          else
          {
            objc_msgSend(v51, "refreshTextStylingForTextStorage:withTextController:", v49, v51);
            v55 = 1;
          }
          goto LABEL_62;
        }
      }
      v54 = v18;
LABEL_50:
      v55 = 0;
LABEL_62:

LABEL_63:
      IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
      -[ICTextView setNeedsLayout](self, "setNeedsLayout");
      if (IsTextKit2Enabled)
      {
        if ((v55 | !v48) == 1)
        {
          objc_opt_class();
          -[ICTextView textLayoutManager](self, "textLayoutManager");
          v62 = objc_claimAutoreleasedReturnValue();
LABEL_68:
          v63 = (void *)v62;
          ICDynamicCast();
          v64 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v64, "zoomFactorOrInsetsDidChange");
        }
      }
      else
      {
        -[ICTextView frame](self, "frame");
        -[ICTextView setFrame:](self, "setFrame:");
        if ((v55 | !v48) == 1)
        {
          objc_opt_class();
          -[ICTextView layoutManager](self, "layoutManager");
          v62 = objc_claimAutoreleasedReturnValue();
          goto LABEL_68;
        }
      }

      return;
    }
    v33 = v16 * 0.5 / 375.0;
    if (v16 <= 1024.0)
    {
      if (v16 <= 989.0)
        goto LABEL_30;
      v34 = 0.85;
    }
    else
    {
      v34 = 0.68;
    }
    v33 = v33 * v34;
    goto LABEL_30;
  }
  objc_msgSend((id)objc_opt_class(), "overrideEdgeInset");
  v6 = v5;
  -[ICTextView textContainerInset](self, "textContainerInset");
  v8 = v7;
  -[ICTextView textContainerInset](self, "textContainerInset");
  if (v12 != v6 || v9 != v6 || v11 != v6 || v10 != v8)
    -[ICTextView setTextContainerInset:](self, "setTextContainerInset:", v6, v6, v8, v6);
}

- (void)_updateContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  float v14;
  _QWORD v15[5];
  objc_super v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  objc_super v22;

  -[ICTextView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!-[ICTextView updatingContentSizeCount](self, "updatingContentSizeCount"))
    {
      -[ICTextView contentSize](self, "contentSize");
      -[ICTextView setPreviousContentSize:](self, "setPreviousContentSize:");
    }
    -[ICTextView setUpdatingContentSizeCount:](self, "setUpdatingContentSizeCount:", -[ICTextView updatingContentSizeCount](self, "updatingContentSizeCount") + 1);
    v22.receiver = self;
    v22.super_class = (Class)ICTextView;
    -[ICTextView _updateContentSize](&v22, sel__updateContentSize);
    -[ICTextView setUpdatingContentSizeCount:](self, "setUpdatingContentSizeCount:", -[ICTextView updatingContentSizeCount](self, "updatingContentSizeCount") - 1);
    if (!-[ICTextView updatingContentSizeCount](self, "updatingContentSizeCount"))
    {
      -[ICTextView previousContentSize](self, "previousContentSize");
      v5 = v4;
      -[ICTextView contentSize](self, "contentSize");
      v7 = v6 - v5;
      if (v6 - v5 != 0.0)
      {
        v18 = 0;
        v19 = &v18;
        v20 = 0x2020000000;
        v21 = 0;
        -[ICBaseTextView editorController](self, "editorController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "note");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __32__ICTextView__updateContentSize__block_invoke;
        v17[3] = &unk_1EA7DD4E8;
        v17[4] = &v18;
        objc_msgSend(v9, "enumerateAttachmentsInOrderUsingBlock:", v17);

        if (*((_BYTE *)v19 + 24))
          -[ICTextView setNeedsHideOverlappingAttachmentViews:](self, "setNeedsHideOverlappingAttachmentViews:", 1);
        _Block_object_dispose(&v18, 8);
      }
      -[ICTextView scrollClampingControllerDelayedRelease](self, "scrollClampingControllerDelayedRelease", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "clampedYValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        if (!-[ICTextView isUpdatingPanGesture](self, "isUpdatingPanGesture"))
        {
          -[ICTextView contentOffset](self, "contentOffset");
          v13 = v12;
          objc_msgSend(v11, "floatValue");
          v16.receiver = self;
          v16.super_class = (Class)ICTextView;
          -[ICTextView setContentOffset:](&v16, sel_setContentOffset_, v13, v14);
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __32__ICTextView__updateContentSize__block_invoke_2;
          v15[3] = &unk_1EA7DD2D8;
          v15[4] = self;
          dispatch_async(MEMORY[0x1E0C80D38], v15);
        }
      }

    }
  }
}

- (void)_scrollToSelectionIfNeeded
{
  objc_super v3;

  if (-[ICTextView shouldAutoScroll](self, "shouldAutoScroll"))
  {
    v3.receiver = self;
    v3.super_class = (Class)ICTextView;
    -[ICTextView _scrollToSelectionIfNeeded](&v3, sel__scrollToSelectionIfNeeded);
  }
}

- (void)_adjustContentOffsetIfNecessary
{
  void *v3;
  objc_super v4;

  -[ICTextView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4.receiver = self;
    v4.super_class = (Class)ICTextView;
    -[ICTextView _adjustContentOffsetIfNecessary](&v4, sel__adjustContentOffsetIfNecessary);
  }
}

- (id)TTTextStorageOptional
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[ICTextView textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)initialize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___ICTextView;
  objc_msgSendSuper2(&v7, sel_initialize);
  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0D64438];
    v11[0] = &unk_1EA821E20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerDefaults:", v4);

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0D643F8];
    v9 = &unk_1EA821E38;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerDefaults:", v6);

  }
}

+ (double)overrideEdgeInset
{
  int v2;
  double result;

  v2 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
  result = 32.0;
  if (!v2)
    return 0.0;
  return result;
}

- (ICTextView)init
{
  return -[ICTextView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (ICTextView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  void *v9;
  void *v10;
  ICLayoutManager *v11;
  void *v12;
  ICTextView *v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_alloc(MEMORY[0x1E0D64D60]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithData:replicaID:", 0, v9);

  v11 = objc_alloc_init(ICLayoutManager);
  -[ICBaseLayoutManager setTextView:](v11, "setTextView:", self);
  objc_msgSend(v10, "addLayoutManager:", v11);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64DA8]), "initWithSize:", width, height);
  objc_msgSend(v12, "setWidthTracksTextView:", 1);
  -[ICLayoutManager addTextContainer:](v11, "addTextContainer:", v12);
  -[ICTextView registerForTraitChanges](self, "registerForTraitChanges");
  v13 = -[ICTextView initWithFrame:textContainer:](self, "initWithFrame:textContainer:", v12, x, y, width, height);

  return v13;
}

- (ICTextView)initWithCoder:(id)a3
{
  id v4;
  ICTextView *v5;
  objc_super v7;

  v4 = a3;
  NSLog(&CFSTR("Calling -initWithCoder: on ICTextView. ICTextView requires a custom NSTextContainer, and -initFromCoder: will n"
               "ot use this custom text container.").isa);
  v7.receiver = self;
  v7.super_class = (Class)ICTextView;
  v5 = -[ICBaseTextView initWithCoder:](&v7, sel_initWithCoder_, v4);

  if (v5)
  {
    -[ICTextView setEditable:](v5, "setEditable:", 0);
    -[ICTextView initializeScollClampingController](v5, "initializeScollClampingController");
    -[ICTextView registerForTraitChanges](v5, "registerForTraitChanges");
  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    -[ICTextView layoutManager](self, "layoutManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[ICTextView textStorage](self, "textStorage");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeLayoutManager:", v3);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)ICTextView;
  -[ICBaseTextView dealloc](&v6, sel_dealloc);
}

- (BOOL)_shouldBecomeEditableUponFocus
{
  return 1;
}

- (BOOL)_shouldBecomeEditableUponBecomingTargetOfKeyboardEventDeferringEnvironment
{
  return 1;
}

- (void)setAttachmentViewDelegate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_opt_class();
  -[ICTextView layoutManager](self, "layoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAttachmentViewDelegate:", v4);
}

- (ICAttachmentViewDelegate)attachmentViewDelegate
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[ICTextView layoutManager](self, "layoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "attachmentViewDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICAttachmentViewDelegate *)v5;
}

- (id)note
{
  void *v2;
  void *v3;

  -[ICBaseTextView editorController](self, "editorController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  -[ICTextView textFindingCoordinator](self, "textFindingCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configureFindInteraction:forTextView:", v7, self);

  v10.receiver = self;
  v10.super_class = (Class)ICTextView;
  -[ICTextView findInteraction:didBeginFindSession:](&v10, sel_findInteraction_didBeginFindSession_, v7, v6);

  -[ICBaseTextView editorController](self, "editorController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didBeginFindInteraction");

}

- (void)findInteraction:(id)a3 didEndFindSession:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICTextView;
  -[ICTextView findInteraction:didEndFindSession:](&v6, sel_findInteraction_didEndFindSession_, a3, a4);
  -[ICBaseTextView editorController](self, "editorController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didEndFindInteraction");

}

- (id)findInteraction:(id)a3 sessionForView:(id)a4
{
  return -[ICTextSearchingFindSession initWithTextView:]([ICTextSearchingFindSession alloc], "initWithTextView:", self);
}

- (void)willHighlightFoundTextRange:(id)a3 inDocument:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICTextView;
  -[ICTextView willHighlightFoundTextRange:inDocument:](&v4, sel_willHighlightFoundTextRange_inDocument_, a3, a4);
}

- (void)clearAllDecoratedFoundText
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICTextView;
  -[ICTextView clearAllDecoratedFoundText](&v4, sel_clearAllDecoratedFoundText);
  -[ICBaseTextView editorController](self, "editorController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showOrHideSearchPatternHighlightsIfNecessary");

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICTextView _clearHighlightView](self, "_clearHighlightView");
}

- (void)performTextSearchWithQueryString:(id)a3 usingOptions:(id)a4 resultAggregator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  ICTextView *v20;
  id v21;
  id v22;
  id v23;
  id from;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ICBaseTextView editorController](self, "editorController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didUpdateSearchQueryInFindInteraction:", v8);

  -[ICTextView textStorage](self, "textStorage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v10);
  objc_initWeak(&from, self);
  +[ICNoteEditorTextFindingController textFindingQueue](ICNoteEditorTextFindingController, "textFindingQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __77__ICTextView_performTextSearchWithQueryString_usingOptions_resultAggregator___block_invoke;
  v17[3] = &unk_1EA7DEED8;
  v18 = v9;
  v14 = v9;
  objc_copyWeak(&v22, &location);
  objc_copyWeak(&v23, &from);
  v19 = v8;
  v20 = self;
  v21 = v12;
  v15 = v12;
  v16 = v8;
  dispatch_async(v13, v17);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __77__ICTextView_performTextSearchWithQueryString_usingOptions_resultAggregator___block_invoke(uint64_t a1)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD aBlock[4];
  id v17;
  uint64_t v18;
  id v19;
  id v20;

  v2 = objc_msgSend(*(id *)(a1 + 32), "stringCompareOptions");
  v3 = objc_msgSend(*(id *)(a1 + 32), "wordMatchMethod");
  v4 = objc_msgSend(*(id *)(a1 + 32), "wordMatchMethod");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__ICTextView_performTextSearchWithQueryString_usingOptions_resultAggregator___block_invoke_2;
  aBlock[3] = &unk_1EA7DEE88;
  objc_copyWeak(&v19, (id *)(a1 + 64));
  objc_copyWeak(&v20, (id *)(a1 + 72));
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v17 = v5;
  v18 = v6;
  v7 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 48), "textFindingCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 48), "textFindingCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 56);
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "note");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __77__ICTextView_performTextSearchWithQueryString_usingOptions_resultAggregator___block_invoke_4;
    v14[3] = &unk_1EA7DEEB0;
    v15 = v7;
    objc_msgSend(v9, "matchesForString:inTextStorage:note:ignoreCase:wholeWords:startsWith:completion:", v11, v10, v12, v2 & 1, v3 == 2, v4 == 1, v14);

    v13 = v15;
  }
  else
  {
    +[ICNoteEditorTextFindingController textFindingResultsForPattern:textView:textStorage:ignoreCase:wholeWords:](ICNoteEditorTextFindingController, "textFindingResultsForPattern:textView:textStorage:ignoreCase:wholeWords:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v2 & 1, v3 == 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v7 + 2))(v7, v13);
  }

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);
}

void __77__ICTextView_performTextSearchWithQueryString_usingOptions_resultAggregator___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__ICTextView_performTextSearchWithQueryString_usingOptions_resultAggregator___block_invoke_3;
  block[3] = &unk_1EA7DEE60;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  objc_copyWeak(&v12, (id *)(a1 + 56));
  v8 = v3;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v11);
}

void __77__ICTextView_performTextSearchWithQueryString_usingOptions_resultAggregator___block_invoke_3(id *a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  uint64_t v17;
  id *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v18 = a1;
  v3 = objc_loadWeakRetained(a1 + 8);
  v4 = v3;
  v19 = WeakRetained;
  if (WeakRetained && v3)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = a1[4];
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v20)
    {
      v17 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          v21 = objc_msgSend(v6, "range");
          v8 = v7;
          objc_msgSend(v4, "beginningOfDocument");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "positionFromPosition:offset:", v22, v21);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "positionFromPosition:offset:", v9, v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "textRangeFromPosition:toPosition:", v9, v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "_ic_setTextFindingResult:", v6);
          objc_msgSend(v11, "_setAttachmentRange:", v6);
          objc_msgSend(v19, "foundRange:forSearchString:inDocument:", v11, v18[5], 0);
          objc_opt_class();
          objc_msgSend(v18[6], "textLayoutManager");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "textContentManager");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          ICDynamicCast();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "outlineController");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "expandAncestorsOfRange:", v21, v8);
        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v20);
    }

    objc_msgSend(v19, "finishedSearching");
  }

}

void __77__ICTextView_performTextSearchWithQueryString_usingOptions_resultAggregator___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void (*v6)(void);

  v4 = a3;
  if (v4)
  {
    v5 = os_log_create("com.apple.notes", "Find");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __77__ICTextView_performTextSearchWithQueryString_usingOptions_resultAggregator___block_invoke_4_cold_1((uint64_t)v4, v5);

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

- (id)selectionRectsForRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  ICTextSelectionRect *v20;
  objc_super v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "_ic_textFindingResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isAttachmentResult"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "framesForHighlightInTextView:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v11), "CGRectValue");
          v13 = v12;
          v15 = v14;
          v17 = v16;
          v19 = v18;
          v20 = objc_alloc_init(ICTextSelectionRect);
          -[ICTextSelectionRect setRect:](v20, "setRect:", v13, v15, v17, v19);
          objc_msgSend(v6, "addObject:", v20);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v9);
    }

  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)ICTextView;
    -[ICBaseTextView selectionRectsForRange:](&v22, sel_selectionRectsForRange_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)scrollRangeToVisible:(id)a3 inDocument:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "_ic_textFindingResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "scrollToVisibleInTextView:", self);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)ICTextView;
    -[ICTextView scrollRangeToVisible:inDocument:](&v10, sel_scrollRangeToVisible_inDocument_, v6, v7);
  }

}

- (BOOL)shouldReplaceFoundTextInRange:(id)a3 inDocument:(id)a4 withText:(id)a5
{
  void *v5;
  char isKindOfClass;

  objc_msgSend(a3, "_ic_textFindingResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isAttachmentResult"))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 1;
  }

  return isKindOfClass & 1;
}

- (void)replaceFoundTextInRange:(id)a3 inDocument:(id)a4 withText:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  objc_super v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "_ic_textFindingResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextView textFindingCoordinator](self, "textFindingCoordinator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && v11)
  {
    -[ICTextView textFindingCoordinator](self, "textFindingCoordinator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    objc_msgSend(v13, "replaceMatches:withString:error:", v14, v10, &v25);
    v15 = v25;

    if (v15)
    {
      v16 = os_log_create("com.apple.notes", "Find");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v27 = v11;
        v28 = 2112;
        v29 = v10;
        v30 = 2112;
        v31 = v15;
        _os_log_error_impl(&dword_1DD7B0000, v16, OS_LOG_TYPE_ERROR, "Unexpected error when trying to replace %@ with %@: %@", buf, 0x20u);
      }

    }
  }
  else
  {
    objc_opt_class();
    objc_msgSend(v8, "_ic_textFindingResult");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_opt_class();
      objc_msgSend(v15, "attachment");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "attachmentModel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = -[ICTextView characterRangeFromTextKitRange:](self, "characterRangeFromTextKitRange:", v8);
      -[ICTextView tableAttachmentViewControllerForRange:](self, "tableAttachmentViewControllerForRange:", v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "undoablyReplaceTextFindingResult:withReplacementString:tableViewController:", v15, v10, v23);

    }
    else
    {
      v24.receiver = self;
      v24.super_class = (Class)ICTextView;
      -[ICTextView replaceFoundTextInRange:inDocument:withText:](&v24, sel_replaceFoundTextInRange_inDocument_withText_, v8, v9, v10);
    }
  }

}

- (void)replaceAllOccurrencesOfQueryString:(id)a3 usingOptions:(id)a4 withText:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  BOOL v29;
  _QWORD v30[5];
  id v31;
  id v32;
  char v33;
  BOOL v34;
  BOOL v35;
  objc_super v36;
  _QWORD v37[4];
  id v38;
  id v39;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "stringCompareOptions") & 1;
  v12 = objc_msgSend(v9, "wordMatchMethod");
  v13 = objc_msgSend(v9, "wordMatchMethod");
  -[ICTextView textFindingCoordinator](self, "textFindingCoordinator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = v13 == 1;
    v16 = v12 == 2;
    -[ICTextView textFindingCoordinator](self, "textFindingCoordinator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTextView textStorage](self, "textStorage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTextView note](self, "note");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __71__ICTextView_replaceAllOccurrencesOfQueryString_usingOptions_withText___block_invoke;
    v37[3] = &unk_1EA7DE688;
    v38 = v8;
    v39 = v10;
    LOBYTE(v28) = v15;
    objc_msgSend(v17, "replaceAllOccurrencesOfQueryString:withString:inTextStorage:note:ignoreCase:wholeWords:startsWith:completion:", v8, v10, v18, v19, v11, v16, v28, v37);

    v20 = v38;
  }
  else
  {
    v29 = v13 == 1;
    v21 = v12 == 2;
    v36.receiver = self;
    v36.super_class = (Class)ICTextView;
    -[ICTextView replaceAllOccurrencesOfQueryString:usingOptions:withText:](&v36, sel_replaceAllOccurrencesOfQueryString_usingOptions_withText_, v8, v9, v10);
    -[ICTextView textStorage](self, "textStorage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *MEMORY[0x1E0DC10F8];
    -[ICTextView textStorage](self, "textStorage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "length");
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __71__ICTextView_replaceAllOccurrencesOfQueryString_usingOptions_withText___block_invoke_151;
    v30[3] = &unk_1EA7DEF00;
    v30[4] = self;
    v31 = v8;
    v33 = v11;
    v34 = v21;
    v35 = v29;
    v32 = v10;
    v26 = v10;
    v27 = v8;
    objc_msgSend(v22, "enumerateAttribute:inRange:options:usingBlock:", v23, 0, v25, 0, v30);

    v20 = v31;
  }

}

void __71__ICTextView_replaceAllOccurrencesOfQueryString_usingOptions_withText___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.notes", "Find");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __71__ICTextView_replaceAllOccurrencesOfQueryString_usingOptions_withText___block_invoke_cold_1(a1, (uint64_t)v3, v4);

  }
}

void __71__ICTextView_replaceAllOccurrencesOfQueryString_usingOptions_withText___block_invoke_151(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "attachment");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "isTable"))
  {
    objc_opt_class();
    objc_msgSend(v12, "attachmentModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "tableAttachmentViewControllerForRange:", a3, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "undoablyReplaceAllOccurrencesOfQueryString:textView:ignoreCase:wholeWords:startsWith:withText:tableViewController:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(unsigned __int8 *)(a1 + 58), *(_QWORD *)(a1 + 48), v11);

  }
}

- (int64_t)compareFoundRange:(id)a3 toRange:(id)a4 inDocument:(id)a5
{
  return objc_msgSend(a3, "ic_compare:inTextView:", a4, self, a5);
}

- (_NSRange)characterRangeFromTextKitRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange result;

  v4 = a3;
  -[ICTextView beginningOfDocument](self, "beginningOfDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICTextView offsetFromPosition:toPosition:](self, "offsetFromPosition:toPosition:", v5, v6);

  objc_msgSend(v4, "start");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "end");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ICTextView offsetFromPosition:toPosition:](self, "offsetFromPosition:toPosition:", v8, v9);
  v11 = v7;
  v12 = v10;
  result.length = v12;
  result.location = v11;
  return result;
}

- (id)tableAttachmentViewControllerForRange:(_NSRange)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a3.location, a3.length);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__6;
  v13 = __Block_byref_object_dispose__6;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__ICTextView_tableAttachmentViewControllerForRange___block_invoke;
  v8[3] = &unk_1EA7DEF28;
  v8[4] = &v9;
  -[ICBaseTextView ic_enumerateTableAttachmentViewControllersInRanges:usingBlock:](self, "ic_enumerateTableAttachmentViewControllersInRanges:usingBlock:", v5, v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __52__ICTextView_tableAttachmentViewControllerForRange___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)selectedText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  -[ICTextView textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], -[ICTextView selectedRange](self, "selectedRange"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "altText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)ICTextView;
    -[ICTextView selectedText](&v10, sel_selectedText);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)didEndTextSearchOperation
{
  id v2;

  -[ICBaseTextView editorController](self, "editorController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showOrHideSearchPatternHighlightsIfNecessary");

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  id v8;
  BOOL v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  -[ICBaseTextView tapGestureRecognizer](self, "tapGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {
    -[ICBaseTextView editorController](self, "editorController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "ignoresTaps");

    if ((v7 & 1) != 0)
      goto LABEL_6;
  }
  else
  {

  }
  v12.receiver = self;
  v12.super_class = (Class)ICTextView;
  if (!-[ICBaseTextView gestureRecognizerShouldBegin:](&v12, sel_gestureRecognizerShouldBegin_, v4))
  {
    v9 = 0;
    goto LABEL_9;
  }
  -[ICBaseTextView tapGestureRecognizer](self, "tapGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v4)
  {
    -[ICTextView attachmentViewTappedByGesture:](self, "attachmentViewTappedByGesture:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10 == 0;

    goto LABEL_9;
  }
LABEL_6:
  v9 = 1;
LABEL_9:

  return v9;
}

- (void)startEditingForTapGesture:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "locationOfTouch:inView:", 0, self);
  -[ICTextView closestPositionToPoint:](self, "closestPositionToPoint:");
  v4 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v4;
  if (v4)
  {
    -[ICTextView textRangeFromPosition:toPosition:](self, "textRangeFromPosition:toPosition:", v4, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      -[ICTextView setSelectedTextRange:](self, "setSelectedTextRange:", v5);

  }
  -[ICBaseTextView editorController](self, "editorController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startEditing");

}

- (void)keyboardDidBeginDictation:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[ICTextView TTTextStorageOptional](self, "TTTextStorageOptional", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsPausingUndoActions:", 1);

  objc_opt_class();
  -[ICTextView inputAccessoryView](self, "inputAccessoryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "hide");
}

- (void)dictationControllerDidPause:(id)a3
{
  void *v4;
  id v5;

  -[ICTextView TTTextStorageOptional](self, "TTTextStorageOptional", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsPausingUndoActions:", 0);

  -[ICTextView TTTextStorageOptional](self, "TTTextStorageOptional");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "breakUndoCoalescing");

}

- (void)dictationControllerDidResume:(id)a3
{
  id v3;

  -[ICTextView TTTextStorageOptional](self, "TTTextStorageOptional", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsPausingUndoActions:", 1);

}

- (void)dictationControllerDidFinish:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[ICTextView TTTextStorageOptional](self, "TTTextStorageOptional", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsPausingUndoActions:", 0);

  objc_opt_class();
  -[ICTextView inputAccessoryView](self, "inputAccessoryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "showWithDelay:", 0.0);
}

- (void)userTitleHiddenStateDidChange:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICTextView userTitleView](self, "userTitleView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[ICTextView updateOverscrollItemFrames](self, "updateOverscrollItemFrames");
}

- (BOOL)showCompatibilityBannerWithParentViewController:(id)a3
{
  id v4;
  void *v5;
  ICNoteEditorCompatibilityBannerView *v6;
  ICNoteEditorCompatibilityBannerView *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[ICTextView compatibilityBannerView](self, "compatibilityBannerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = [ICNoteEditorCompatibilityBannerView alloc];
    v7 = -[ICNoteEditorCompatibilityBannerView initWithFrame:parentViewController:](v6, "initWithFrame:parentViewController:", v4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[ICTextView setCompatibilityBannerView:](self, "setCompatibilityBannerView:", v7);

    -[ICTextView compatibilityBannerView](self, "compatibilityBannerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAutoresizingMask:", 5);

    -[ICTextView compatibilityBannerView](self, "compatibilityBannerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTextView addSubview:](self, "addSubview:", v9);

  }
  return v5 == 0;
}

- (BOOL)shouldUpdateVisibleSupplementalViewsInLayoutSubviews
{
  if (-[ICTextView isScrolling](self, "isScrolling")
    || (-[ICTextView _isAnimatingScrollTest](self, "_isAnimatingScrollTest") & 1) != 0)
  {
    return 0;
  }
  else
  {
    return -[ICTextView _freezeTextContainerSize](self, "_freezeTextContainerSize") ^ 1;
  }
}

- (void)hideOverlappingAttachmentViewsIfNecessary
{
  void *v3;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD aBlock[4];
  id v29;
  uint64_t v30;
  uint64_t v31;

  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    if (-[ICTextView needsHideOverlappingAttachmentViews](self, "needsHideOverlappingAttachmentViews"))
    {
      objc_opt_class();
      -[ICTextView layoutManager](self, "layoutManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICTextView bounds](self, "bounds");
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v12 = v11;
      -[ICTextView textContainer](self, "textContainer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v4, "glyphRangeForBoundingRectWithoutAdditionalLayout:inTextContainer:", v13, v6, v8, v10, v12);
      v16 = v15;

      v17 = objc_msgSend(v4, "characterRangeForGlyphRange:actualGlyphRange:", v14, v16, 0);
      v19 = v18;
      v20 = v17 + v18;
      -[ICTextView textStorage](self, "textStorage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "length") - v20;

      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __55__ICTextView_hideOverlappingAttachmentViewsIfNecessary__block_invoke;
      aBlock[3] = &unk_1EA7DEFA0;
      v30 = v17;
      v31 = v19;
      v29 = v4;
      v23 = v4;
      v24 = _Block_copy(aBlock);
      -[ICTextView textStorage](self, "textStorage");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *MEMORY[0x1E0DC10F8];
      objc_msgSend(v25, "enumerateAttribute:inRange:options:usingBlock:", *MEMORY[0x1E0DC10F8], 0, v17, 0x100000, v24);

      -[ICTextView textStorage](self, "textStorage");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "enumerateAttribute:inRange:options:usingBlock:", v26, v20, v22, 0x100000, v24);

      -[ICTextView setNeedsHideOverlappingAttachmentViews:](self, "setNeedsHideOverlappingAttachmentViews:", 0);
    }
  }
}

void __55__ICTextView_hideOverlappingAttachmentViewsIfNecessary__block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  id v7;
  NSUInteger length;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  id v15;
  NSRange v16;

  v7 = a2;
  if (v7)
  {
    v15 = v7;
    v16.location = a3;
    v16.length = a4;
    length = NSIntersectionRange(*(NSRange *)(a1 + 40), v16).length;
    v7 = v15;
    if (!length)
    {
      objc_opt_class();
      ICDynamicCast();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "viewProviderForTextAttachment:characterIndex:", v9, a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        objc_msgSend(*(id *)(a1 + 32), "viewForTextAttachmentNoCreate:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v11, "window");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        v14 = objc_msgSend(v11, "isHidden");

        if ((v14 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
          objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
          objc_msgSend(v11, "setHidden:", 1);
          objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
        }
      }

      v7 = v15;
    }
  }

}

- (BOOL)canBecomeFirstResponder
{
  unsigned int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  BOOL v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ICTextView;
  v3 = -[ICBaseTextView canBecomeFirstResponder](&v13, sel_canBecomeFirstResponder);
  -[ICBaseTextView editorController](self, "editorController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "modalPresentationStyle");
  if (v3 && (v7 = v6, !-[ICTextView shouldAvoidBecomingFirstResponder](self, "shouldAvoidBecomingFirstResponder")))
  {
    -[ICBaseTextView editorController](self, "editorController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "note");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = v7 == 5;
    else
      v11 = 1;
    v8 = !v11;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)becomeFirstResponder
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v10;

  if (-[ICTextView shouldAvoidBecomingFirstResponder](self, "shouldAvoidBecomingFirstResponder"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    self->_isBecomingFirstResponder = 1;
    objc_msgSend(MEMORY[0x1E0D63A58], "sharedState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extendDeauthenticationTimer");

    v10.receiver = self;
    v10.super_class = (Class)ICTextView;
    v3 = -[ICBaseTextView becomeFirstResponder](&v10, sel_becomeFirstResponder);
    -[ICBaseTextView editorController](self, "editorController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewControllerManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICTextView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "ic_hasCompactSize"))
    {
      if ((objc_msgSend(v6, "isPrimaryContentVisible") & 1) != 0)
        v8 = 1;
      else
        v8 = objc_msgSend(v6, "isSupplementaryContentVisible");
    }
    else
    {
      v8 = 0;
    }

    if ((-[ICTextView isSelectable](self, "isSelectable") & 1) == 0 && v3 && (v8 & 1) == 0)
      -[ICTextView setEditable:](self, "setEditable:", 1);
    -[ICBaseTextView icaxClearCaches](self, "icaxClearCaches");
    self->_isBecomingFirstResponder = 0;

  }
  return v3;
}

uint64_t __34__ICTextView_resignFirstResponder__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "icaxUpdateLinkRanges");
}

- (id)_nextKeyResponder
{
  void *v3;
  void *v4;

  -[ICTextView nextResponderOverride](self, "nextResponderOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICTextView nextResponderOverride](self, "nextResponderOverride");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)selectionSupportsFindInNote
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  -[ICTextView textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICTextView selectedRange](self, "selectedRange");
  v5 = *MEMORY[0x1E0DC10F8];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__ICTextView_selectionSupportsFindInNote__block_invoke;
  v10[3] = &unk_1EA7DEFC8;
  v10[4] = &v11;
  v10[5] = &v15;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v5, v4, v6, 0, v10);

  if (*((_BYTE *)v12 + 24))
  {
    v7 = 1;
  }
  else if (*((_BYTE *)v16 + 24))
  {
    -[ICTextView selectedRange](self, "selectedRange");
    v7 = v8 == 1;
  }
  else
  {
    v7 = 0;
  }
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  return v7;
}

void __41__ICTextView_selectionSupportsFindInNote__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  char isKindOfClass;
  id v9;

  v7 = a2;
  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    v9 = v7;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = v9;
    if ((isKindOfClass & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      *a5 = 1;
    }
  }

}

- (id)singleSelectedAttachment
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = -[ICTextView selectedRange](self, "selectedRange");
  v5 = 0;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL && v4 == 1)
  {
    v6 = v3;
    -[ICTextView textStorage](self, "textStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v5 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v8;

  }
  return v5;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a4;
  -[ICTextView nextResponderOverride](self, "nextResponderOverride");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v16.receiver = self;
    v16.super_class = (Class)ICTextView;
    -[ICTextView targetForAction:withSender:](&v16, sel_targetForAction_withSender_, a3, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTextView singleSelectedAttachment](self, "singleSelectedAttachment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if ((ICInternalSettingsIsTextKit2Enabled() & 1) != 0)
      {
        -[ICBaseTextView icTextLayoutManager](self, "icTextLayoutManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "viewIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "existingAttachmentViewForIdentifier:", v14);
        v10 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[ICBaseTextView icLayoutManager](self, "icLayoutManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "viewForTextAttachment:", v12);
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }

      if (v10
        && objc_msgSend(v10, "canPerformAction:withSender:", a3, v6)
        && !objc_msgSend(v11, "canPerformAction:withSender:", a3, v6))
      {
        goto LABEL_14;
      }

    }
    v10 = v11;
LABEL_14:

    goto LABEL_15;
  }
  -[ICTextView nextResponderOverride](self, "nextResponderOverride");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "canPerformAction:withSender:", a3, v6);

  if (v9)
  {
    -[ICTextView nextResponderOverride](self, "nextResponderOverride");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
LABEL_15:

  return v10;
}

- (void)resetContentOffset:(CGPoint)a3
{
  double y;
  double x;
  _BOOL8 v6;
  objc_super v7;

  y = a3.y;
  x = a3.x;
  v6 = -[ICTextView disableContentOffsetChanges](self, "disableContentOffsetChanges");
  -[ICTextView setDisableContentOffsetChanges:](self, "setDisableContentOffsetChanges:", 1);
  v7.receiver = self;
  v7.super_class = (Class)ICTextView;
  -[ICTextView setContentOffset:](&v7, sel_setContentOffset_, x, y);
  -[ICTextView setDisableContentOffsetChanges:](self, "setDisableContentOffsetChanges:", v6);
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  char v8;
  id v9;
  objc_super v10;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[ICBaseTextView editorController](self, "editorController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isPreviewingAttachmentFromNote") & 1) != 0)
  {

  }
  else
  {
    v8 = -[ICTextView isDragging](self, "isDragging");

    if ((v8 & 1) == 0)
    {
      v10.receiver = self;
      v10.super_class = (Class)ICTextView;
      -[ICTextView setContentOffset:animated:](&v10, sel_setContentOffset_animated_, v4, x, y);
    }
  }
}

- (void)scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  CGFloat v14;
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
  double v26;
  double v27;
  double v28;
  CGRect rect;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    if (-[ICTextView isFirstResponder](self, "isFirstResponder"))
    {
      v10 = -[ICTextView selectedRange](self, "selectedRange");
      -[ICTextView textStorage](self, "textStorage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "length");

      if (v10 == v12)
      {
        -[ICTextView layoutManager](self, "layoutManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "extraLineFragmentRect");
        rect.origin.x = v14;
        v16 = v15;
        v18 = v17;
        v20 = v19;
        -[ICTextView textContainerInset](self, "textContainerInset");
        v22 = v21;
        -[ICTextView textContainerInset](self, "textContainerInset");
        v24 = v23;
        v30.origin.x = rect.origin.x;
        v30.origin.y = v16;
        v30.size.width = v18;
        v30.size.height = v20;
        v31 = CGRectOffset(v30, v22, v24);
        v25 = v31.origin.x;
        v26 = v31.origin.y;
        v27 = v31.size.width;
        v28 = v31.size.height;

        v32.origin.x = x;
        v32.origin.y = y;
        v32.size.width = width;
        v32.size.height = height;
        v33.origin.x = v25;
        v33.origin.y = v26;
        v33.size.width = v27;
        v33.size.height = v28;
        if (CGRectContainsRect(v32, v33))
        {
          x = v25;
          y = v26;
          width = v27;
          height = v28;
        }
      }
    }
  }
  *(_QWORD *)&rect.origin.y = self;
  *(_QWORD *)&rect.size.width = ICTextView;
  -[CGFloat scrollRectToVisible:animated:]((objc_super *)&rect.origin.y, sel_scrollRectToVisible_animated_, v4, x, y, width, height);
}

- (void)setEmbeddedScrollViews:(id)a3
{
  NSSet *v4;
  NSSet *embeddedScrollViews;
  CGPoint v6;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  embeddedScrollViews = self->_embeddedScrollViews;
  self->_embeddedScrollViews = v4;

  v6 = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_lastProposedContentOffset = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_distanceConsumedByEmbeddedScrollViews = v6;
}

id __31__ICTextView_setContentOffset___block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)ICTextView;
  return objc_msgSendSuper2(&v2, sel_setContentOffset_, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __32__ICTextView__updateContentSize__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int IsTextKit2Enabled;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "editorController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "visibleRange");
  v5 = v4;

  IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  v7 = *(void **)(a1 + 32);
  if (IsTextKit2Enabled)
  {
    objc_msgSend(v7, "textLayoutManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ic_textRangeForRange:", v3, v5);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "textLayoutManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidateLayoutForRange:", v10);

  }
  else
  {
    objc_msgSend(v7, "layoutManager");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidateDisplayForCharacterRange:", v3, v5);
  }

}

- (double)maxYContentOffset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[ICTextView contentSize](self, "contentSize");
  v4 = v3;
  -[ICTextView bounds](self, "bounds");
  v6 = v5;
  -[ICTextView contentInset](self, "contentInset");
  return v4 - (v6 - v7);
}

- (CGPoint)clippedContentOffset:(CGPoint)a3
{
  double y;
  CGFloat x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[ICTextView contentInset](self, "contentInset");
  v7 = -v6;
  -[ICTextView maxYContentOffset](self, "maxYContentOffset");
  if (v8 >= v7)
    v9 = v8;
  else
    v9 = v7;
  if (y <= v9)
  {
    if (y < v7)
      v9 = v7;
    else
      v9 = y;
  }
  v10 = x;
  result.y = v9;
  result.x = v10;
  return result;
}

- (void)setClippedContentOffset:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v11;

  -[ICTextView clippedContentOffset:](self, "clippedContentOffset:", a3.x, a3.y);
  v5 = v4;
  v7 = v6;
  -[ICTextView contentOffset](self, "contentOffset");
  if (v5 != v9 || v7 != v8)
  {
    v11.receiver = self;
    v11.super_class = (Class)ICTextView;
    -[ICTextView setContentOffset:](&v11, sel_setContentOffset_, v5, v7);
  }
}

- (void)select:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  if (!-[ICTextView selectedRange](self, "selectedRange"))
    goto LABEL_5;
  objc_opt_class();
  -[ICTextView textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ICTextView selectedRange](self, "selectedRange");
  objc_msgSend(v6, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], v7 - 1, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {

LABEL_5:
    v10.receiver = self;
    v10.super_class = (Class)ICTextView;
    -[ICBaseTextView select:](&v10, sel_select_, v4);
    goto LABEL_6;
  }
  v9 = (void *)v8;
  -[ICTextView setSelectedRange:](self, "setSelectedRange:", -[ICTextView selectedRange](self, "selectedRange") - 1, 1);

LABEL_6:
}

- (void)resetUndoManager
{
  id v2;

  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetUndoManager");

}

- (void)undoManagerDidOpenUndoGroup:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  -[ICBaseTextView TTTextStorage](self, "TTTextStorage", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isPausingUndoActions"))
  {
    -[ICTextView undoManager](self, "undoManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "groupingLevel");

    if (v5 < 2)
      return;
    -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "breakUndoCoalescing");
  }

}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  objc_super v16;

  v8 = a3;
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    v16.receiver = self;
    v16.super_class = (Class)ICTextView;
    -[ICTextView positionFromPosition:inDirection:offset:](&v16, sel_positionFromPosition_inDirection_offset_, v8, a4, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    -[ICTextView layoutManager](self, "layoutManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLineHeightIncludeParagraphSpacing:", 1);

    v15.receiver = self;
    v15.super_class = (Class)ICTextView;
    -[ICTextView positionFromPosition:inDirection:offset:](&v15, sel_positionFromPosition_inDirection_offset_, v8, a4, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    -[ICTextView layoutManager](self, "layoutManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLineHeightIncludeParagraphSpacing:", 0);

  }
  return v9;
}

- (CGRect)caretRectForPosition:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat v33;
  objc_super v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect result;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v34.receiver = self;
  v34.super_class = (Class)ICTextView;
  -[ICBaseTextView caretRectForPosition:](&v34, sel_caretRectForPosition_, a3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (-[ICBaseTextView isDraggingChecklistItem](self, "isDraggingChecklistItem")
    && -[ICBaseTextView isDraggingOverChecklistItem](self, "isDraggingOverChecklistItem"))
  {
    -[ICBaseTextView trackedParagraphCurrentlyUnderDraggedChecklist](self, "trackedParagraphCurrentlyUnderDraggedChecklist");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICChecklistDragUtilities insertionRectForTrackedTodoParagraph:drawAbove:inTextView:](ICChecklistDragUtilities, "insertionRectForTrackedTodoParagraph:drawAbove:inTextView:", v12, -[ICBaseTextView shouldDropChecklistAbove](self, "shouldDropChecklistAbove"), self);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    v39 = *(CGRect *)*(_QWORD *)&MEMORY[0x1E0C9D648];
    v35.origin.x = v14;
    v35.origin.y = v16;
    v35.size.width = v18;
    v35.size.height = v20;
    y = v39.origin.y;
    v33 = *MEMORY[0x1E0C9D648];
    height = v39.size.height;
    width = v39.size.width;
    if (!CGRectEqualToRect(v35, *MEMORY[0x1E0C9D648]))
    {
      -[ICTextView lastDragInsertionRect](self, "lastDragInsertionRect");
      v40.origin.x = v21;
      v40.origin.y = v22;
      v40.size.width = v23;
      v40.size.height = v24;
      v36.origin.x = v14;
      v36.origin.y = v16;
      v36.size.width = v18;
      v36.size.height = v20;
      if (!CGRectEqualToRect(v36, v40))
      {
        -[ICBaseTextView checklistDragFeedbackGenerator](self, "checklistDragFeedbackGenerator");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "selectionChanged");

        v11 = v20;
        v9 = v18;
        v7 = v16;
        v5 = v14;
      }
    }
    v37.origin.x = v14;
    v37.origin.y = v16;
    v37.size.width = v18;
    v37.size.height = v20;
    v41.origin.y = y;
    v41.origin.x = v33;
    v41.size.height = height;
    v41.size.width = width;
    if (!CGRectEqualToRect(v37, v41))
    {
      v11 = v20;
      v9 = v18;
      v7 = v16;
      v5 = v14;
    }
  }
  -[ICTextView setLastDragInsertionRect:](self, "setLastDragInsertionRect:", v5, v7, v9, v11, *(_QWORD *)&height, *(_QWORD *)&width, *(_QWORD *)&y, *(_QWORD *)&v33);
  v26 = v5;
  v27 = v7;
  v28 = v9;
  v29 = v11;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (BOOL)attachmentViewUnderTouches:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;

  v4 = a3;
  if (attachmentViewUnderTouches__onceToken != -1)
    dispatch_once(&attachmentViewUnderTouches__onceToken, &__block_literal_global_5);
  if (attachmentViewUnderTouches__supportsForceTouch
    && objc_msgSend(v4, "count")
    && (objc_msgSend(v4, "anyObject"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "type"),
        v5,
        !v6))
  {
    objc_msgSend(v4, "anyObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "locationInView:", self);
    v11 = v10;
    v13 = v12;

    -[ICTextView textAttachmentAtPoint:](self, "textAttachmentAtPoint:", v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __41__ICTextView_attachmentViewUnderTouches___block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  attachmentViewUnderTouches__supportsForceTouch = result;
  return result;
}

- (BOOL)isSearchResultView:(id)a3
{
  id v4;
  ICTextView *v5;
  ICTextView *v6;
  ICTextView *v7;
  BOOL v8;
  ICTextView *v9;
  ICTextView *v10;

  v4 = a3;
  if (-[ICTextView containsView:](self, "containsView:", v4))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(v4, "superview"),
          v5 = (ICTextView *)objc_claimAutoreleasedReturnValue(),
          v5,
          v5 == self))
    {
      v8 = 1;
    }
    else
    {
      v6 = (ICTextView *)v4;
      v7 = v6;
      v8 = 0;
      if (v6 && v6 != self)
      {
        while (1)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[ICTextView superview](v7, "superview");
            v9 = (ICTextView *)objc_claimAutoreleasedReturnValue();

            if (v9 == self)
              break;
          }
          -[ICTextView superview](v7, "superview");
          v10 = (ICTextView *)objc_claimAutoreleasedReturnValue();

          v8 = 0;
          if (v10)
          {
            v7 = v10;
            if (v10 != self)
              continue;
          }
          goto LABEL_15;
        }
        v8 = 1;
      }
      v10 = v7;
LABEL_15:

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  objc_super v17;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ICTextView;
  -[ICBaseTextView hitTest:withEvent:](&v17, sel_hitTest_withEvent_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ICTextView isSearchResultView:](self, "isSearchResultView:", v8))
  {
    -[ICTextView containerViewForAttachments](self, "containerViewForAttachments");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertPoint:fromView:", self, x, y);
    v11 = v10;
    v13 = v12;

    -[ICTextView containerViewForAttachments](self, "containerViewForAttachments");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hitTest:withEvent:", v7, v11, v13);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = v8;
  }

  return v15;
}

- (id)textAttachmentAtPoint:(CGPoint)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;

  -[ICTextView characterRangeAtPoint:](self, "characterRangeAtPoint:", a3.x, a3.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_4;
  -[ICTextView beginningOfDocument](self, "beginningOfDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (double)-[ICTextView offsetFromPosition:toPosition:](self, "offsetFromPosition:toPosition:", v6, v5);

  -[ICTextView textStorage](self, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], (unint64_t)v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_4:
    v9 = 0;
  }

  return v9;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v6 = a4;
  v7 = a3;
  -[ICTextView setTouchesCurrentlyOnAttachmentView:](self, "setTouchesCurrentlyOnAttachmentView:", -[ICTextView attachmentViewUnderTouches:](self, "attachmentViewUnderTouches:", v7));
  -[ICBaseTextView editorController](self, "editorController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "authorHighlightsController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAllowsAnimations:", 0);

  v11.receiver = self;
  v11.super_class = (Class)ICTextView;
  -[ICBaseTextView touchesBegan:withEvent:](&v11, sel_touchesBegan_withEvent_, v7, v6);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  -[ICTextView setTouchesCurrentlyOnAttachmentView:](self, "setTouchesCurrentlyOnAttachmentView:", -[ICTextView attachmentViewUnderTouches:](self, "attachmentViewUnderTouches:", v7));
  v8.receiver = self;
  v8.super_class = (Class)ICTextView;
  -[ICBaseTextView touchesMoved:withEvent:](&v8, sel_touchesMoved_withEvent_, v7, v6);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICTextView;
  -[ICBaseTextView touchesEnded:withEvent:](&v8, sel_touchesEnded_withEvent_, a3, a4);
  -[ICTextView setTouchesCurrentlyOnAttachmentView:](self, "setTouchesCurrentlyOnAttachmentView:", 0);
  -[ICBaseTextView editorController](self, "editorController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "authorHighlightsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsAnimations:", 1);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICTextView;
  -[ICBaseTextView touchesCancelled:withEvent:](&v8, sel_touchesCancelled_withEvent_, a3, a4);
  -[ICTextView setTouchesCurrentlyOnAttachmentView:](self, "setTouchesCurrentlyOnAttachmentView:", 0);
  -[ICBaseTextView editorController](self, "editorController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "authorHighlightsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsAnimations:", 1);

}

- (BOOL)isPreviewing
{
  int v3;
  objc_super v5;

  if (-[ICTextView touchesCurrentlyOnAttachmentView](self, "touchesCurrentlyOnAttachmentView"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = objc_msgSend(MEMORY[0x1E0DC3E50], "instancesRespondToSelector:", sel_isPreviewing);
    if (v3)
    {
      v5.receiver = self;
      v5.super_class = (Class)ICTextView;
      LOBYTE(v3) = -[ICBaseTextView isPreviewing](&v5, sel_isPreviewing);
    }
  }
  return v3;
}

- (id)_targetedPreviewForTextInteractableItem:(id)a3 dismissing:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a4;
  v6 = a3;
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    -[ICBaseTextView icLayoutManager](self, "icLayoutManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShouldIgnoreCachedOriginUpdates:", 1);

  }
  v11.receiver = self;
  v11.super_class = (Class)ICTextView;
  -[ICTextView _targetedPreviewForTextInteractableItem:dismissing:](&v11, sel__targetedPreviewForTextInteractableItem_dismissing_, v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    -[ICBaseTextView icLayoutManager](self, "icLayoutManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShouldIgnoreCachedOriginUpdates:", 0);

  }
  return v8;
}

- (void)setSelectedRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  objc_super v10;

  length = a3.length;
  location = a3.location;
  -[ICBaseTextView editorController](self, "editorController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isPreviewingAttachmentFromNote");

  if ((v7 & 1) == 0)
  {
    objc_opt_class();
    -[ICTextView textStorage](self, "textStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "isFixing") & 1) == 0)
      -[ICBaseTextView endHeadingRenameCommittingMarkedText:](self, "endHeadingRenameCommittingMarkedText:", 1);
    objc_msgSend(v9, "setIsSelectingText:", 1);
    v10.receiver = self;
    v10.super_class = (Class)ICTextView;
    -[ICTextView setSelectedRange:](&v10, sel_setSelectedRange_, location, length);
    objc_msgSend(v9, "setIsSelectingText:", 0);

  }
}

- (void)setSelectedTextRange:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  -[ICBaseTextView editorController](self, "editorController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPreviewingAttachmentFromNote");

  if ((v6 & 1) == 0)
  {
    objc_opt_class();
    -[ICTextView textStorage](self, "textStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v8, "isFixing") & 1) == 0)
      -[ICBaseTextView endHeadingRenameCommittingMarkedText:](self, "endHeadingRenameCommittingMarkedText:", 1);
    objc_msgSend(v8, "setIsSelectingText:", 1);
    v10.receiver = self;
    v10.super_class = (Class)ICTextView;
    -[ICTextView setSelectedTextRange:](&v10, sel_setSelectedTextRange_, v4);
    objc_msgSend(v8, "setHasEditedCharactersAfterTextSelection:", 0);
    objc_msgSend(v8, "breakUndoCoalescing");
    objc_msgSend(v8, "setIsSelectingText:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("ICTextViewSelectedTextRangeDidChangeNotification"), self);

  }
}

- (BOOL)touchesShouldCancelInContentView:(id)a3
{
  ICTextView *v4;
  ICTextView *v5;
  ICTextView *v6;
  ICTextView *v7;
  unsigned __int8 v8;
  objc_super v10;

  v4 = (ICTextView *)a3;
  v5 = v4;
  v6 = v4;
  if (!v4 || (v6 = v4, v4 == self))
  {
LABEL_7:
    v10.receiver = self;
    v10.super_class = (Class)ICTextView;
    v8 = -[ICTextView touchesShouldCancelInContentView:](&v10, sel_touchesShouldCancelInContentView_, v5);
    v7 = v6;
  }
  else
  {
    v7 = v4;
    while ((objc_opt_respondsToSelector() & 1) == 0)
    {
      -[ICTextView superview](v7, "superview");
      v6 = (ICTextView *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = v6;
        if (v6 != self)
          continue;
      }
      goto LABEL_7;
    }
    v8 = -[ICTextView scrollViewShouldCancelTouchesForThisView](v7, "scrollViewShouldCancelTouchesForThisView");
  }

  return v8;
}

- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v6 = a4;
  objc_opt_class();
  -[ICTextView textStorage](self, "textStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsResettingBaseWritingDirection:", 1);

  v11.receiver = self;
  v11.super_class = (Class)ICTextView;
  -[ICTextView setBaseWritingDirection:forRange:](&v11, sel_setBaseWritingDirection_forRange_, a3, v6);

  objc_opt_class();
  -[ICTextView textStorage](self, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIsResettingBaseWritingDirection:", 0);

}

- (void)scrollRangeToVisible:(_NSRange)a3 consideringInsets:(BOOL)a4 animated:(BOOL)a5 inSearchableString:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  NSUInteger length;
  NSUInteger location;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a5;
  v7 = a4;
  length = a3.length;
  location = a3.location;
  v18 = a6;
  -[ICBaseTextView editorController](self, "editorController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "note");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "textRangeForSearchRange:inSearchableString:", location, length, v18);
  v15 = v14;

  if (v15)
    -[ICTextView ic_scrollRangeToVisible:consideringInsets:animated:](self, "ic_scrollRangeToVisible:consideringInsets:animated:", v13, v15, v7, v6);
  objc_msgSend(v18, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D63D70], location, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[ICTextView findableForAttachment:](self, "findableForAttachment:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scrollToRange:inFindableString:", location, length, v18);

  }
}

- (id)findableForAttachment:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0D64AD0], "textAttachmentWithBaseAttachment:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if ((objc_msgSend(v4, "containsFindableText") & 1) == 0)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "textAttachment.containsFindableText", "-[ICTextView findableForAttachment:]", 1, 0, CFSTR("Text attachment must contain findable text"));
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      objc_opt_class();
      ICCheckedDynamicCast();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        v9 = 0;
        goto LABEL_11;
      }
      -[ICBaseTextView icTextLayoutManager](self, "icTextLayoutManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "tableViewControllerForAttachment:createIfNeeded:", v6, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      ICProtocolCast();
      v9 = 0;
    }
    else
    {
      objc_opt_class();
      -[ICTextView textContainer](self, "textContainer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "layoutManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ICCheckedDynamicCast();
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "viewControllerForTextAttachment:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      ICProtocolCast();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

LABEL_11:
    goto LABEL_12;
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (void)makeTextWritingDirectionLeftToRight:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICTextView;
  -[ICBaseTextView makeTextWritingDirectionLeftToRight:](&v9, sel_makeTextWritingDirectionLeftToRight_, v4);
  -[ICTextView ic_selectedRanges](self, "ic_selectedRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__ICTextView_makeTextWritingDirectionLeftToRight___block_invoke;
  v7[3] = &unk_1EA7DF010;
  v8 = v4;
  v6 = v4;
  -[ICBaseTextView ic_enumerateTableAttachmentViewControllersInRanges:usingBlock:](self, "ic_enumerateTableAttachmentViewControllersInRanges:usingBlock:", v5, v7);

}

uint64_t __50__ICTextView_makeTextWritingDirectionLeftToRight___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "makeTextWritingDirectionLeftToRight:", *(_QWORD *)(a1 + 32));
}

- (void)makeTextWritingDirectionRightToLeft:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICTextView;
  -[ICBaseTextView makeTextWritingDirectionRightToLeft:](&v9, sel_makeTextWritingDirectionRightToLeft_, v4);
  -[ICTextView ic_selectedRanges](self, "ic_selectedRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__ICTextView_makeTextWritingDirectionRightToLeft___block_invoke;
  v7[3] = &unk_1EA7DF010;
  v8 = v4;
  v6 = v4;
  -[ICBaseTextView ic_enumerateTableAttachmentViewControllersInRanges:usingBlock:](self, "ic_enumerateTableAttachmentViewControllersInRanges:usingBlock:", v5, v7);

}

uint64_t __50__ICTextView_makeTextWritingDirectionRightToLeft___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "makeTextWritingDirectionRightToLeft:", *(_QWORD *)(a1 + 32));
}

- (void)toggleBoldface:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICTextView;
  -[ICBaseTextView toggleBoldface:](&v9, sel_toggleBoldface_, v4);
  -[ICTextView ic_selectedRanges](self, "ic_selectedRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__ICTextView_toggleBoldface___block_invoke;
  v7[3] = &unk_1EA7DF010;
  v8 = v4;
  v6 = v4;
  -[ICBaseTextView ic_enumerateTableAttachmentViewControllersInRanges:usingBlock:](self, "ic_enumerateTableAttachmentViewControllersInRanges:usingBlock:", v5, v7);

}

uint64_t __29__ICTextView_toggleBoldface___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "toggleBoldface:", *(_QWORD *)(a1 + 32));
}

- (void)toggleItalics:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICTextView;
  -[ICBaseTextView toggleItalics:](&v9, sel_toggleItalics_, v4);
  -[ICTextView ic_selectedRanges](self, "ic_selectedRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __28__ICTextView_toggleItalics___block_invoke;
  v7[3] = &unk_1EA7DF010;
  v8 = v4;
  v6 = v4;
  -[ICBaseTextView ic_enumerateTableAttachmentViewControllersInRanges:usingBlock:](self, "ic_enumerateTableAttachmentViewControllersInRanges:usingBlock:", v5, v7);

}

uint64_t __28__ICTextView_toggleItalics___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "toggleItalics:", *(_QWORD *)(a1 + 32));
}

- (void)toggleUnderline:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICTextView;
  -[ICBaseTextView toggleUnderline:](&v9, sel_toggleUnderline_, v4);
  -[ICTextView ic_selectedRanges](self, "ic_selectedRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__ICTextView_toggleUnderline___block_invoke;
  v7[3] = &unk_1EA7DF010;
  v8 = v4;
  v6 = v4;
  -[ICBaseTextView ic_enumerateTableAttachmentViewControllersInRanges:usingBlock:](self, "ic_enumerateTableAttachmentViewControllersInRanges:usingBlock:", v5, v7);

}

uint64_t __30__ICTextView_toggleUnderline___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "toggleUnderline:", *(_QWORD *)(a1 + 32));
}

- (void)toggleStrikethrough
{
  void *v3;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICTextView;
  -[ICBaseTextView toggleStrikethrough](&v5, sel_toggleStrikethrough);
  -[ICTextView ic_selectedRanges](self, "ic_selectedRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__ICTextView_toggleStrikethrough__block_invoke;
  v4[3] = &unk_1EA7DF010;
  v4[4] = self;
  -[ICBaseTextView ic_enumerateTableAttachmentViewControllersInRanges:usingBlock:](self, "ic_enumerateTableAttachmentViewControllersInRanges:usingBlock:", v3, v4);

}

uint64_t __33__ICTextView_toggleStrikethrough__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "toggleStrikethrough:", *(_QWORD *)(a1 + 32));
}

- (void)updateTextViewForDidChange
{
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  if (-[ICTextView isSettingStyleWithStyleUI](self, "isSettingStyleWithStyleUI"))
  {
    -[ICBaseTextView typingAttributes](self, "typingAttributes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (_QWORD *)MEMORY[0x1E0D63928];
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D63928]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[ICBaseTextView internalTypingAttributes](self, "internalTypingAttributes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "mutableCopy");

      objc_msgSend(v7, "setObject:forKey:", v5, *v4);
      -[ICBaseTextView setInternalTypingAttributes:](self, "setInternalTypingAttributes:", v7);

    }
  }
  v8.receiver = self;
  v8.super_class = (Class)ICTextView;
  -[ICBaseTextView updateTextViewForDidChange](&v8, sel_updateTextViewForDidChange);
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  objc_super v11;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[ICTextView setIsInsertingTextFromKeyboardInput:](self, "setIsInsertingTextFromKeyboardInput:", 1);
  v11.receiver = self;
  v11.super_class = (Class)ICTextView;
  LOBYTE(v5) = -[ICTextView keyboardInput:shouldInsertText:isMarkedText:](&v11, sel_keyboardInput_shouldInsertText_isMarkedText_, v9, v8, v5);

  -[ICTextView setIsInsertingTextFromKeyboardInput:](self, "setIsInsertingTextFromKeyboardInput:", 0);
  return v5;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  char v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  char v24;
  void *v25;
  unint64_t v26;
  void *v27;
  NSUInteger length;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  char v39;
  objc_super v40;
  _QWORD v41[4];
  id v42;
  uint64_t *v43;
  char v44;
  _QWORD v45[6];
  char v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  NSRange v51;
  NSRange v52;

  v6 = a3;
  v7 = a4;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 1;
  if (objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode"))
  {
    v8 = objc_msgSend(v7, "_modifierFlags");
    objc_msgSend(v7, "_unmodifiedInput");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[ICTextView selectedRange](self, "selectedRange");
    v12 = v11;
    if (objc_msgSend(v9, "length"))
    {
      v13 = objc_msgSend(v7, "_isKeyDown");
      v14 = v12 ? 0 : v13;
      if (v14 == 1)
      {
        v15 = *MEMORY[0x1E0DC4E10];
        if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC4E10]) & 1) != 0)
        {
          if ((v8 & 0xFFFFFFFFFFF7FFFFLL) == 0)
            goto LABEL_14;
        }
        else
        {
          v16 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC4E28]);
          if ((v8 & 0xFFFFFFFFFFF7FFFFLL) != 0)
            v17 = 0;
          else
            v17 = v16;
          if ((v17 & 1) != 0)
          {
LABEL_14:
            -[ICTextView textStorage](self, "textStorage");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "attributesAtIndex:effectiveRange:", v10, 0);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v19, "objectForKey:", *MEMORY[0x1E0DC1178]);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v20;
            if (v20)
            {
              v22 = objc_msgSend(v20, "baseWritingDirection");
              v23 = objc_msgSend(v9, "isEqualToString:", v15);
              v24 = v23;
              if ((((v22 != 1) ^ v23) & 1) != 0)
              {
                -[ICTextView textStorage](self, "textStorage");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v25, "length");

                if (v10 >= v26)
                  goto LABEL_27;
LABEL_20:
                if (v10 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  -[ICTextView textStorage](self, "textStorage");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v52.length = objc_msgSend(v27, "length");
                  v51.location = v10;
                  v51.length = 1;
                  v52.location = 0;
                  length = NSIntersectionRange(v51, v52).length;

                  if (length != 1)
                    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "NSIntersectionRange(testRange, NSMakeRange(0, self.textStorage.length)).length == 1", "-[ICTextView pressesBegan:withEvent:]", 1, 0, CFSTR("test range must be within bounds"));
                  if (ICInternalSettingsIsTextKit2Enabled())
                  {
                    -[ICBaseTextView icTextLayoutManager](self, "icTextLayoutManager");
                    v29 = (id)objc_claimAutoreleasedReturnValue();
                    v45[0] = MEMORY[0x1E0C809B0];
                    v45[1] = 3221225472;
                    v45[2] = __37__ICTextView_pressesBegan_withEvent___block_invoke;
                    v45[3] = &unk_1EA7DF038;
                    v46 = v24;
                    v45[4] = self;
                    v45[5] = &v47;
                    objc_msgSend(v29, "enumerateAttachmentViewsInRange:usingBlock:", v10, 1, v45);
                  }
                  else
                  {
                    objc_opt_class();
                    -[ICTextView layoutManager](self, "layoutManager");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    ICDynamicCast();
                    v31 = (void *)objc_claimAutoreleasedReturnValue();

                    v41[0] = MEMORY[0x1E0C809B0];
                    v41[1] = 3221225472;
                    v41[2] = __37__ICTextView_pressesBegan_withEvent___block_invoke_2;
                    v41[3] = &unk_1EA7DF038;
                    v29 = v31;
                    v44 = v24;
                    v42 = v29;
                    v43 = &v47;
                    objc_msgSend(v29, "enumerateAttachmentViewsInRange:usingBlock:", v10, 1, v41);

                  }
                }
                goto LABEL_27;
              }
              if (v10)
              {
                --v10;
                goto LABEL_20;
              }
            }
LABEL_27:

          }
        }
      }
    }
    -[ICBaseTextView editorController](self, "editorController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "linkAcceleratorController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v33, "isShowing") || !objc_msgSend(v7, "_isKeyDown"))
      goto LABEL_41;
    *((_BYTE *)v48 + 24) = 0;
    v34 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC4DA0]);
    v35 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC4D90]);
    v36 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC4E30]);
    v37 = objc_msgSend(v9, "isEqualToString:", CFSTR("\r"));
    v38 = objc_msgSend(v9, "isEqualToString:", CFSTR("\t"));
    if (v34)
    {
      objc_msgSend(v33, "hideAccelerator");
LABEL_41:

      goto LABEL_42;
    }
    if (v35)
    {
      v39 = objc_msgSend(v33, "handleArrowDown");
    }
    else if (v36)
    {
      v39 = objc_msgSend(v33, "handleArrowUp");
    }
    else
    {
      if ((v37 | v38) != 1)
        goto LABEL_40;
      v39 = objc_msgSend(v33, "handleUseCurrentSuggestion");
    }
    if ((v39 & 1) != 0)
      goto LABEL_41;
    objc_msgSend(v33, "hideAccelerator");
LABEL_40:
    *((_BYTE *)v48 + 24) = 1;
    goto LABEL_41;
  }
LABEL_42:
  if (*((_BYTE *)v48 + 24))
  {
    v40.receiver = self;
    v40.super_class = (Class)ICTextView;
    -[ICTextView pressesBegan:withEvent:](&v40, sel_pressesBegan_withEvent_, v6, v7);
  }
  _Block_object_dispose(&v47, 8);

}

void __37__ICTextView_pressesBegan_withEvent___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "attachmentType");

  if (v5 == 12)
  {
    objc_msgSend(*(id *)(a1 + 32), "icTextLayoutManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    ICCheckedDynamicCast();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tableViewControllerForAttachment:createIfNeeded:", v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "moveIntoTableWithDirection:", *(_BYTE *)(a1 + 48) == 0);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

  }
}

void __37__ICTextView_pressesBegan_withEvent___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "attachmentType");

  if (v5 == 12)
  {
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "viewControllerForTextAttachment:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "moveIntoTableWithDirection:", *(_BYTE *)(a1 + 48) == 0);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

  }
}

- (void)clampTextView
{
  id v2;

  -[ICTextView scrollClampingControllerDelayedRelease](self, "scrollClampingControllerDelayedRelease");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clamp");

}

- (void)unclampTextView
{
  id v2;

  -[ICTextView scrollClampingControllerDelayedRelease](self, "scrollClampingControllerDelayedRelease");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unclamp");

}

- (void)_scrollToCaretIfNeeded
{
  objc_super v3;

  if (-[ICTextView shouldAutoScroll](self, "shouldAutoScroll"))
  {
    v3.receiver = self;
    v3.super_class = (Class)ICTextView;
    -[ICTextView _scrollToCaretIfNeeded](&v3, sel__scrollToCaretIfNeeded);
  }
}

- (void)_updatePanGesture
{
  objc_super v3;

  -[ICTextView setIsUpdatingPanGesture:](self, "setIsUpdatingPanGesture:", 1);
  v3.receiver = self;
  v3.super_class = (Class)ICTextView;
  -[ICTextView _updatePanGesture](&v3, sel__updatePanGesture);
  -[ICTextView setIsUpdatingPanGesture:](self, "setIsUpdatingPanGesture:", 0);
}

- (void)authorHighlightsControllerWillPerformHighlightUpdates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D64908]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "document");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v9)
    -[ICTextView setIsPerformingHighlightUpdates:](self, "setIsPerformingHighlightUpdates:", 1);

}

- (void)authorHighlightsControllerDidPerformHighlightUpdates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D64908]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "document");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "document");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v10)
    dispatchMainAfterDelay();

}

uint64_t __67__ICTextView_authorHighlightsControllerDidPerformHighlightUpdates___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsPerformingHighlightUpdates:", 0);
}

- (void)splitViewAnimatedTransitionWillBegin:(id)a3
{
  id v4;
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
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  _QWORD v23[5];
  id v24;

  v4 = a3;
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    objc_opt_class();
    objc_msgSend(v4, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICBaseTextView editorController](self, "editorController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewControllerManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "mainSplitViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v4, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ICSplitViewControllerPredictedDetailSizeUserInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "transitionCoordinator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mainSplitViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v14 && objc_msgSend(v9, "displayMode") != 3 && v13)
    {

      if (v12)
      {
        v15 = objc_msgSend(v13, "completionCurve");
        objc_msgSend(v13, "transitionDuration");
        v17 = v16;
        objc_msgSend(v13, "transitionDuration");
        v19 = v18;
        objc_msgSend(v13, "percentComplete");
        v21 = v17 - v19 * v20;
        v22 = (void *)MEMORY[0x1E0DC3F10];
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __51__ICTextView_splitViewAnimatedTransitionWillBegin___block_invoke;
        v23[3] = &unk_1EA7DD498;
        v23[4] = self;
        v24 = v12;
        objc_msgSend(v22, "transitionWithView:duration:options:animations:completion:", self, v15 | 0x500000, v23, 0, v21);

      }
    }
    else
    {

    }
  }

}

uint64_t __51__ICTextView_splitViewAnimatedTransitionWillBegin___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(*(id *)(a1 + 32), "frame");
  v3 = v2;
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 40), "CGSizeValue");
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 40), "CGSizeValue");
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", v3, v5, v7, v8);
}

- (void)splitViewAnimatedTransitionEnded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[ICTextView window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rootViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v7 == v9)
  {
    -[ICTextView updateLayoutMargins](self, "updateLayoutMargins");
    v8 = v9;
  }

}

- (BOOL)isPaperLinkBarShowingOrWillShow
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[ICBaseTextView icDelegate](self, "icDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[ICBaseTextView icDelegate](self, "icDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPaperLinkBarShowing");

  return v6;
}

- (id)attachmentViewTappedByGesture:(id)a3
{
  id v4;
  ICTextView *v5;
  ICTextView *v6;
  ICTextView *v7;

  v4 = a3;
  if (!objc_msgSend(v4, "numberOfTouches"))
  {
LABEL_13:
    v6 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v4, "locationOfTouch:inView:", 0, self);
  -[ICTextView hitTest:withEvent:](self, "hitTest:withEvent:", 0);
  v5 = (ICTextView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || v5 == self)
  {
    v7 = v5;
LABEL_12:

    goto LABEL_13;
  }
  while (1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
    NSClassFromString(CFSTR("PaperKit.PaperTextAttachmentView"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
    -[ICTextView superview](v6, "superview");
    v7 = (ICTextView *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v6 = v7;
      if (v7 != self)
        continue;
    }
    goto LABEL_12;
  }
LABEL_14:

  return v6;
}

- (void)registerForTraitChanges
{
  void *v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)-[ICTextView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v3, sel_updateOverscrollItemFrames);

}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v5;
  id v6;
  char isKindOfClass;
  BOOL v8;

  v5 = a4;
  v6 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v8 = 0;
  if ((isKindOfClass & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v8 = 1;
  }

  return v8;
}

- (void)inProcessUndoPanGesture:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "state") == 1)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[ICTextView collectScrollViews](self, "collectScrollViews", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v9, "panGestureRecognizer");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEnabled");

          if (v11)
          {
            objc_msgSend(v9, "panGestureRecognizer");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setEnabled:", 0);

            objc_msgSend(v9, "panGestureRecognizer");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setEnabled:", 1);

          }
          objc_msgSend(v9, "pinchGestureRecognizer");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEnabled");

          if (v15)
          {
            objc_msgSend(v9, "pinchGestureRecognizer");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setEnabled:", 0);

            objc_msgSend(v9, "pinchGestureRecognizer");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setEnabled:", 1);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v6);
    }

  }
}

- (id)collectScrollViews
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICTextViewCollectScrollViews(self, v3);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  void *v27;
  objc_super v29;
  CGRect v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) != 0)
    goto LABEL_8;
  -[ICBaseTextView editorController](self, "editorController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isInkPickerShowing") & 1) == 0)
  {

LABEL_8:
    v29.receiver = self;
    v29.super_class = (Class)ICTextView;
    -[ICTextView pointerInteraction:regionForRequest:defaultRegion:](&v29, sel_pointerInteraction_regionForRequest_defaultRegion_, v8, v9, v10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v12 = objc_msgSend(MEMORY[0x1E0DC3AC8], "prefersPencilOnlyDrawing");

  if ((v12 & 1) != 0)
    goto LABEL_8;
  -[ICTextView layoutManager](self, "layoutManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTextView textStorage](self, "textStorage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "glyphIndexForCharacterAtIndex:", objc_msgSend(v14, "length") - 1);

  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_8;
  -[ICTextView layoutManager](self, "layoutManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v15, 0);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  objc_msgSend(v9, "location");
  v26 = v25;
  v30.origin.x = v18;
  v30.origin.y = v20;
  v30.size.width = v22;
  v30.size.height = v24;
  v27 = 0;
  if (v26 <= CGRectGetMaxY(v30))
    goto LABEL_8;
LABEL_9:

  return v27;
}

- (void)textControllerDidHandleSpecialCaseEditing:(id)a3
{
  id v4;

  -[ICTextView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textViewDidChange:", self);

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Note"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityIdentifier
{
  return CFSTR("Note");
}

- (BOOL)_accessibilityBeginUndoableTextInsertion
{
  void *v2;

  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIsPerformingAccessibilityUndoableTextInsertion:", 1);

  return 1;
}

- (BOOL)_accessibilityEndUndoableTextInsertion
{
  void *v2;

  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIsPerformingAccessibilityUndoableTextInsertion:", 0);

  return 1;
}

- (id)_icaxUnfilteredAttributedString
{
  void *v2;
  void *v3;

  -[ICBaseTextView TTTextStorage](self, "TTTextStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_icaxUnfilteredAttributedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)handleAccessibilityDarkerSystemColorsStatusDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];

  -[ICTextView textStorage](self, "textStorage", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DC1160];
  -[ICTextView textStorage](self, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__ICTextView_handleAccessibilityDarkerSystemColorsStatusDidChange___block_invoke;
  v8[3] = &unk_1EA7DDC18;
  v8[4] = self;
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v7, 0, v8);

}

void __67__ICTextView_handleAccessibilityDarkerSystemColorsStatusDidChange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "editorController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "styleText:inExactRange:fixModelAttributes:", v10, a3, a4, 0);

  }
}

- (void)setUserTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_userTitleView, a3);
}

- (void)setDateView:(id)a3
{
  objc_storeStrong((id *)&self->_dateView, a3);
}

- (void)setCompatibilityBannerView:(id)a3
{
  objc_storeStrong((id *)&self->_compatibilityBannerView, a3);
}

- (CALayer)topSplitLayer
{
  return self->_topSplitLayer;
}

- (void)setTopSplitLayer:(id)a3
{
  objc_storeStrong((id *)&self->_topSplitLayer, a3);
}

- (CALayer)bottomSplitLayer
{
  return self->_bottomSplitLayer;
}

- (void)setBottomSplitLayer:(id)a3
{
  objc_storeStrong((id *)&self->_bottomSplitLayer, a3);
}

- (UIResponder)nextResponderOverride
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_nextResponderOverride);
}

- (void)setNextResponderOverride:(id)a3
{
  objc_storeWeak((id *)&self->_nextResponderOverride, a3);
}

- (BOOL)shouldAvoidBecomingFirstResponder
{
  return self->_shouldAvoidBecomingFirstResponder;
}

- (void)setShouldAvoidBecomingFirstResponder:(BOOL)a3
{
  self->_shouldAvoidBecomingFirstResponder = a3;
}

- (BOOL)shouldRubberBand
{
  return self->_shouldRubberBand;
}

- (void)setShouldRubberBand:(BOOL)a3
{
  self->_shouldRubberBand = a3;
}

- (CGPoint)rubberBandContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_rubberBandContentOffset.x;
  y = self->_rubberBandContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setRubberBandContentOffset:(CGPoint)a3
{
  self->_rubberBandContentOffset = a3;
}

- (NSArray)draggingSnapPoints
{
  return self->_draggingSnapPoints;
}

- (void)setDraggingSnapPoints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 3128);
}

- (BOOL)isBecomingFirstResponder
{
  return self->_isBecomingFirstResponder;
}

- (BOOL)isInsertingTextFromKeyboardInput
{
  return self->_isInsertingTextFromKeyboardInput;
}

- (void)setIsInsertingTextFromKeyboardInput:(BOOL)a3
{
  self->_isInsertingTextFromKeyboardInput = a3;
}

- (void)setIsPerformingHighlightUpdates:(BOOL)a3
{
  self->_isPerformingHighlightUpdates = a3;
}

- (BOOL)isSettingStyleWithStyleUI
{
  return self->_isSettingStyleWithStyleUI;
}

- (void)setIsSettingStyleWithStyleUI:(BOOL)a3
{
  self->_isSettingStyleWithStyleUI = a3;
}

- (BOOL)isDisplayingEditableContent
{
  return self->_displayingEditableContent;
}

- (CATransformLayer)splitLayerContainer
{
  return self->_splitLayerContainer;
}

- (void)setSplitLayerContainer:(id)a3
{
  objc_storeStrong((id *)&self->_splitLayerContainer, a3);
}

- (BOOL)touchesCurrentlyOnAttachmentView
{
  return self->_touchesCurrentlyOnAttachmentView;
}

- (void)setTouchesCurrentlyOnAttachmentView:(BOOL)a3
{
  self->_touchesCurrentlyOnAttachmentView = a3;
}

- (BOOL)isUpdatingPanGesture
{
  return self->_isUpdatingPanGesture;
}

- (void)setIsUpdatingPanGesture:(BOOL)a3
{
  self->_isUpdatingPanGesture = a3;
}

- (CGRect)lastDragInsertionRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_lastDragInsertionRect.origin.x;
  y = self->_lastDragInsertionRect.origin.y;
  width = self->_lastDragInsertionRect.size.width;
  height = self->_lastDragInsertionRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLastDragInsertionRect:(CGRect)a3
{
  self->_lastDragInsertionRect = a3;
}

- (BOOL)isSettingEditable
{
  return self->_isSettingEditable;
}

- (BOOL)needsHideOverlappingAttachmentViews
{
  return self->_needsHideOverlappingAttachmentViews;
}

- (NSMutableArray)highlightLayers
{
  return self->_highlightLayers;
}

- (void)setHighlightLayers:(id)a3
{
  objc_storeStrong((id *)&self->_highlightLayers, a3);
}

- (CGPoint)lastProposedContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastProposedContentOffset.x;
  y = self->_lastProposedContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastProposedContentOffset:(CGPoint)a3
{
  self->_lastProposedContentOffset = a3;
}

- (CGPoint)distanceConsumedByEmbeddedScrollViews
{
  double x;
  double y;
  CGPoint result;

  x = self->_distanceConsumedByEmbeddedScrollViews.x;
  y = self->_distanceConsumedByEmbeddedScrollViews.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setDistanceConsumedByEmbeddedScrollViews:(CGPoint)a3
{
  self->_distanceConsumedByEmbeddedScrollViews = a3;
}

- (ICTextFindingCoordinator)textFindingCoordinator
{
  return self->_textFindingCoordinator;
}

- (void)setTextFindingCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_textFindingCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFindingCoordinator, 0);
  objc_storeStrong((id *)&self->_highlightLayers, 0);
  objc_storeStrong((id *)&self->_scrollClampingControllerDelayedRelease, 0);
  objc_storeStrong((id *)&self->_splitLayerContainer, 0);
  objc_storeStrong((id *)&self->_embeddedScrollViews, 0);
  objc_storeStrong((id *)&self->_draggingSnapPoints, 0);
  objc_destroyWeak((id *)&self->_nextResponderOverride);
  objc_storeStrong((id *)&self->_bottomSplitLayer, 0);
  objc_storeStrong((id *)&self->_topSplitLayer, 0);
  objc_storeStrong((id *)&self->_compatibilityBannerView, 0);
  objc_storeStrong((id *)&self->_dateView, 0);
  objc_storeStrong((id *)&self->_userTitleView, 0);
}

void __77__ICTextView_performTextSearchWithQueryString_usingOptions_resultAggregator___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DD7B0000, a2, OS_LOG_TYPE_ERROR, "Error when trying to find in note: %@", (uint8_t *)&v2, 0xCu);
}

void __71__ICTextView_replaceAllOccurrencesOfQueryString_usingOptions_withText___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138412802;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_1DD7B0000, log, OS_LOG_TYPE_ERROR, "Unexpected error when trying to replace all occurrences of %@ with %@: %@", (uint8_t *)&v5, 0x20u);
}

- (void)setContentOffset:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DD7B0000, log, OS_LOG_TYPE_DEBUG, "Should lock content offset", v1, 2u);
}

- (void)applyEdgeInsets:(NSObject *)a1 .cold.1(NSObject *a1, double a2)
{
  void *v4;
  double v5;
  int v6;
  double v7;
  __int16 v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForBodyText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pointSize");
  v6 = 134218240;
  v7 = a2;
  v8 = 2048;
  v9 = a2 * v5;
  _os_log_debug_impl(&dword_1DD7B0000, a1, OS_LOG_TYPE_DEBUG, "Applying zoom factor: %g => %g", (uint8_t *)&v6, 0x16u);

}

@end
