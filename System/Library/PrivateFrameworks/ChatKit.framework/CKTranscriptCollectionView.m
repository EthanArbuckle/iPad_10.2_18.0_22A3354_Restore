@implementation CKTranscriptCollectionView

- (CKTranscriptCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  CKTranscriptCollectionView *v4;
  CKTranscriptCollectionView *v5;
  void *v6;
  int v7;
  void *v8;
  NSCountedSet *v9;
  NSCountedSet *transcriptDynamicsDisabledReasons;
  NSCountedSet *v11;
  NSCountedSet *contentOffsetDisabledReasons;
  void *v13;
  int v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKTranscriptCollectionView;
  v4 = -[CKEditableCollectionView initWithFrame:collectionViewLayout:](&v17, sel_initWithFrame_collectionViewLayout_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    -[CKTranscriptCollectionView setPrefetchingEnabled:](v4, "setPrefetchingEnabled:", 0);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "forceMinTranscriptMarginInsets");

    if (v7)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "minTranscriptMarginInsets");
      -[CKEditableCollectionView setMarginInsets:](v5, "setMarginInsets:");

    }
    v9 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    transcriptDynamicsDisabledReasons = v5->_transcriptDynamicsDisabledReasons;
    v5->_transcriptDynamicsDisabledReasons = v9;

    v5->_transcriptScrollIntent = 6;
    v11 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    contentOffsetDisabledReasons = v5->_contentOffsetDisabledReasons;
    v5->_contentOffsetDisabledReasons = v11;

    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isSwipeToReplyEnabled");

    if (v14)
    {
      -[CKTranscriptCollectionView panGestureRecognizer](v5, "panGestureRecognizer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addTarget:action:", v5, sel_swipeToReplyGestureHandler_);

    }
  }
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  char v4;
  objc_super v5;

  -[CKTranscriptCollectionView needsScrollIntentEnforcementBlock](self, "needsScrollIntentEnforcementBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3
    || (-[CKTranscriptCollectionView isDecelerating](self, "isDecelerating") & 1) != 0
    || (-[CKTranscriptCollectionView isScrollAnimating](self, "isScrollAnimating") & 1) != 0
    || (-[CKTranscriptCollectionView isDragging](self, "isDragging") & 1) != 0)
  {
    goto LABEL_7;
  }
  v4 = -[CKTranscriptCollectionView isTracking](self, "isTracking");

  if ((v4 & 1) == 0)
  {
    -[CKTranscriptCollectionView needsScrollIntentEnforcementBlock](self, "needsScrollIntentEnforcementBlock");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(MEMORY[0x1E0C80D38], v3);
LABEL_7:

  }
  v5.receiver = self;
  v5.super_class = (Class)CKTranscriptCollectionView;
  -[CKTranscriptCollectionView layoutSubviews](&v5, sel_layoutSubviews);
}

- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews
{
  return 10;
}

- (void)setTranscriptScrollIntent:(int64_t)a3
{
  unint64_t transcriptScrollIntent;
  void *v6;
  void *v7;
  NSObject *v8;
  CKTranscriptHighlightedMessageScrollContext *highlightedMessageScrollContext;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  transcriptScrollIntent = self->_transcriptScrollIntent;
  if (transcriptScrollIntent != a3)
  {
    CKDebugNameForCKTranscriptScrollIntent(transcriptScrollIntent);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CKDebugNameForCKTranscriptScrollIntent(a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = 138543618;
      v11 = v6;
      v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Transcript scroll intent changing from %{public}@ to %{public}@", (uint8_t *)&v10, 0x16u);
    }

    self->_transcriptScrollIntent = a3;
    if (a3 != 2)
    {
      highlightedMessageScrollContext = self->_highlightedMessageScrollContext;
      self->_highlightedMessageScrollContext = 0;

    }
  }
}

- (void)enforceTranscriptScrollIntentWithAnimationProperties:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKTranscriptCollectionView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transcriptCollectionViewNeedsScrollIntentEnforced:withAnimationProperties:", self, v4);

}

- (void)setNeedsScrollIntentEnforced
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_18DFCD000, v0, v1, "setNeedsScrollIntentEnforced, already has an enforcement scheduled.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __58__CKTranscriptCollectionView_setNeedsScrollIntentEnforced__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  IMLogHandleForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __58__CKTranscriptCollectionView_setNeedsScrollIntentEnforced__block_invoke_cold_2();

  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setNeedsScrollIntentEnforcementBlock:", 0);
    +[CKScrollViewAnimationProperties systemDefaultScrollAnimation](CKScrollViewAnimationProperties, "systemDefaultScrollAnimation");
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "enforceTranscriptScrollIntentWithAnimationProperties:", v3);
  }
  else
  {
    IMLogHandleForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __58__CKTranscriptCollectionView_setNeedsScrollIntentEnforced__block_invoke_cold_1();
  }

}

- (void)setNeedsContentOffsetAdjustmentForNextContentSizeChange
{
  NSObject *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "setNeedsContentOffsetAdjustmentForNextContentSizeChange", v4, 2u);
    }

  }
  -[CKTranscriptCollectionView setAdjustContentOffsetForContentSizeChangeIfNeeded:](self, "setAdjustContentOffsetForContentSizeChangeIfNeeded:", 1);
}

- (void)invalidateNeedsContentOffsetAdjustmentForNextContentSizeChange
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[CKTranscriptCollectionView adjustContentOffsetForContentSizeChangeIfNeeded](self, "adjustContentOffsetForContentSizeChangeIfNeeded"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "invalidateNeedsContentOffsetAdjustmentForNextContentSizeChange -- Not previously invalidated", v4, 2u);
      }

    }
    -[CKTranscriptCollectionView setAdjustContentOffsetForContentSizeChangeIfNeeded:](self, "setAdjustContentOffsetForContentSizeChangeIfNeeded:", 0);
    -[CKTranscriptCollectionView setInsertScrollDelta:](self, "setInsertScrollDelta:", 0.0);
  }
}

- (void)beginHoldingContentOffsetUpdatesForReason:(id)a3
{
  NSCountedSet *v4;
  NSObject *v5;
  unint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  NSCountedSet *v9;
  const char *v10;
  NSCountedSet *contentOffsetDisabledReasons;
  int v12;
  NSCountedSet *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (NSCountedSet *)a3;
  IMLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v12 = 138543362;
    v13 = v4;
    _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "DISABLE: Content Offset changes for Reason: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  -[NSCountedSet addObject:](self->_contentOffsetDisabledReasons, "addObject:", v4);
  v6 = -[NSCountedSet count](self->_contentOffsetDisabledReasons, "count");
  IMLogHandleForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6 < 2)
  {
    if (v8)
    {
      contentOffsetDisabledReasons = self->_contentOffsetDisabledReasons;
      v12 = 138543362;
      v13 = contentOffsetDisabledReasons;
      v10 = "Content Offset changes are now disabled for one reason: %{public}@";
      goto LABEL_8;
    }
  }
  else if (v8)
  {
    v9 = self->_contentOffsetDisabledReasons;
    v12 = 138543362;
    v13 = v9;
    v10 = "Content Offset changes are now disabled for multiple reasons: %{public}@";
LABEL_8:
    _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v12, 0xCu);
  }

}

- (void)endHoldingContentOffsetUpdatesForReason:(id)a3
{
  NSCountedSet *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  NSCountedSet *contentOffsetDisabledReasons;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  int v13;
  NSCountedSet *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (NSCountedSet *)a3;
  IMLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v13 = 138543362;
    v14 = v4;
    _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "ENABLE: Content Offset changes for Reason: %{public}@", (uint8_t *)&v13, 0xCu);
  }

  -[NSCountedSet removeObject:](self->_contentOffsetDisabledReasons, "removeObject:", v4);
  v6 = -[NSCountedSet count](self->_contentOffsetDisabledReasons, "count");
  IMLogHandleForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      contentOffsetDisabledReasons = self->_contentOffsetDisabledReasons;
      v13 = 138543362;
      v14 = contentOffsetDisabledReasons;
      v10 = "Content Offset changes are still disabled for reasons: %{public}@";
      v11 = v7;
      v12 = 12;
LABEL_8:
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v13, v12);
    }
  }
  else if (v8)
  {
    LOWORD(v13) = 0;
    v10 = "Content Offset changes are now enabled";
    v11 = v7;
    v12 = 2;
    goto LABEL_8;
  }

}

- (void)endHoldingContentOffsetUpdatesForAllReasons
{
  NSObject *v2;
  uint8_t v3[16];

  -[NSCountedSet removeAllObjects](self->_contentOffsetDisabledReasons, "removeAllObjects");
  IMLogHandleForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Transcript scroll offset - ended holding updates ALL keys", v3, 2u);
  }

}

- (BOOL)isHoldingContentOffsetUpdates
{
  return !-[CKTranscriptCollectionView isTemporarilyOverridingContentOffsetRestriction](self, "isTemporarilyOverridingContentOffsetRestriction")&& -[NSCountedSet count](self->_contentOffsetDisabledReasons, "count") != 0;
}

- (void)performContentOffsetUpdateTemporarilyOverridingHoldStatus:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  NSCountedSet *contentOffsetDisabledReasons;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint8_t v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  v5 = -[NSCountedSet count](self->_contentOffsetDisabledReasons, "count");
  IMLogHandleForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (!v7)
      goto LABEL_7;
    contentOffsetDisabledReasons = self->_contentOffsetDisabledReasons;
    *(_DWORD *)v12 = 138543362;
    *(_QWORD *)&v12[4] = contentOffsetDisabledReasons;
    v9 = "Transcript scroll offset - temporarily overriding reasons: %{public}@";
    v10 = v6;
    v11 = 12;
  }
  else
  {
    if (!v7)
      goto LABEL_7;
    *(_WORD *)v12 = 0;
    v9 = "Transcript scroll offset - content offset is not currently disabled";
    v10 = v6;
    v11 = 2;
  }
  _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, v9, v12, v11);
LABEL_7:

  -[CKTranscriptCollectionView setIsTemporarilyOverridingContentOffsetRestriction:](self, "setIsTemporarilyOverridingContentOffsetRestriction:", 1);
  if (v4)
    v4[2](v4);
  -[CKTranscriptCollectionView setIsTemporarilyOverridingContentOffsetRestriction:](self, "setIsTemporarilyOverridingContentOffsetRestriction:", 0, *(_OWORD *)v12);

}

- (void)__ck_scrollToBottom:(BOOL)a3
{
  objc_super v5;

  if (!-[CKTranscriptCollectionView ignoresAutomaticScrollsTowardBottom](self, "ignoresAutomaticScrollsTowardBottom"))
  {
    if (a3)
    {
      -[CKTranscriptCollectionView setTranscriptScrollIntent:](self, "setTranscriptScrollIntent:", 6);
      v5.receiver = self;
      v5.super_class = (Class)CKTranscriptCollectionView;
      -[UIScrollView __ck_scrollToBottom:](&v5, sel___ck_scrollToBottom_, 1);
    }
    else
    {
      -[CKTranscriptCollectionView beginDisablingTranscriptDynamicsForReason:](self, "beginDisablingTranscriptDynamicsForReason:", CFSTR("ScrollToBottom"));
      -[CKTranscriptCollectionView setTranscriptScrollIntent:](self, "setTranscriptScrollIntent:", 6);
      v5.receiver = self;
      v5.super_class = (Class)CKTranscriptCollectionView;
      -[UIScrollView __ck_scrollToBottom:](&v5, sel___ck_scrollToBottom_, 0);
      -[CKTranscriptCollectionView endDisablingTranscriptDynamicsForReason:](self, "endDisablingTranscriptDynamicsForReason:", CFSTR("ScrollToBottom"));
    }
  }
}

- (void)scrollToBottomHidingMessageAtIndexPath:(id)a3 animationProperties:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (!-[CKTranscriptCollectionView ignoresAutomaticScrollsTowardBottom](self, "ignoresAutomaticScrollsTowardBottom"))
  {
    v7 = objc_msgSend(v6, "animationType");
    if (v8 || v7)
    {
      -[CKTranscriptCollectionView beginDisablingTranscriptDynamicsForReason:](self, "beginDisablingTranscriptDynamicsForReason:", CFSTR("ScrollTowardBottomHidingMessage"));
      -[UICollectionView __ck_bottomOffsetHidingIndexPath:](self, "__ck_bottomOffsetHidingIndexPath:", v8);
      -[CKTranscriptCollectionView setContentOffset:animationProperties:](self, "setContentOffset:animationProperties:", v6);
      -[CKTranscriptCollectionView endDisablingTranscriptDynamicsForReason:](self, "endDisablingTranscriptDynamicsForReason:", CFSTR("ScrollTowardBottomHidingMessage"));
    }
    else
    {
      -[UICollectionView __ck_bottomOffsetHidingIndexPath:](self, "__ck_bottomOffsetHidingIndexPath:", 0);
      -[CKTranscriptCollectionView setContentOffset:animationProperties:](self, "setContentOffset:animationProperties:", v6);
    }
  }

}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  NSObject *v8;
  double v9;
  double v10;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _BOOL8 v17;
  NSObject *v18;
  void *v19;
  objc_super v20;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  if (-[CKTranscriptCollectionView isHoldingContentOffsetUpdates](self, "isHoldingContentOffsetUpdates"))
  {
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CKTranscriptCollectionView setContentOffset:animated:].cold.1(x, y);

  }
  else
  {
    -[CKTranscriptCollectionView contentOffset](self, "contentOffset");
    if (v10 == x && v9 == y)
    {
      IMLogHandleForCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[CKTranscriptCollectionView setContentOffset:animated:].cold.2(x, y);

    }
    else
    {
      if (v4)
      {
        if (CKMainScreenScale_once_95 != -1)
          dispatch_once(&CKMainScreenScale_once_95, &__block_literal_global_241);
        v12 = *(double *)&CKMainScreenScale_sMainScreenScale_95;
        if (*(double *)&CKMainScreenScale_sMainScreenScale_95 == 0.0)
          v12 = 1.0;
        v13 = round(x * v12) / v12;
        v14 = round(y * v12) / v12;
        -[CKTranscriptCollectionView contentOffset](self, "contentOffset");
        v17 = v14 != v16 || v13 != v15;
      }
      else
      {
        v17 = 0;
      }
      -[CKTranscriptCollectionView delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "collectionViewWillProgrammaticallyScroll:animated:", self, v17);

      v20.receiver = self;
      v20.super_class = (Class)CKTranscriptCollectionView;
      -[CKTranscriptCollectionView setContentOffset:animated:](&v20, sel_setContentOffset_animated_, v4, x, y);
    }
  }
}

- (void)setContentOffset:(CGPoint)a3 animationProperties:(id)a4
{
  double y;
  double x;
  id v7;
  _BOOL4 v8;
  double v9;
  double v10;
  NSObject *v11;
  double v13;
  _BOOL4 v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  CABasicAnimation *v18;
  CABasicAnimation *v19;
  CABasicAnimation *transcriptCustomScrollAnimation;
  CABasicAnimation *v21;
  CABasicAnimation *v22;
  double v23;
  double v24;
  objc_super v25;
  objc_super v26;
  objc_super v27;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = -[CKTranscriptCollectionView isHoldingContentOffsetUpdates](self, "isHoldingContentOffsetUpdates");
  -[CKTranscriptCollectionView contentOffset](self, "contentOffset");
  if (v8)
  {
    IMLogHandleForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[CKTranscriptCollectionView setContentOffset:animationProperties:].cold.1(x, y);
  }
  else if (v9 == x && v10 == y)
  {
    IMLogHandleForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[CKTranscriptCollectionView setContentOffset:animationProperties:].cold.2(x, y);
  }
  else
  {
    if (CKMainScreenScale_once_95 != -1)
    {
      v23 = v9;
      v24 = v10;
      dispatch_once(&CKMainScreenScale_once_95, &__block_literal_global_241);
      v9 = v23;
      v10 = v24;
    }
    v13 = *(double *)&CKMainScreenScale_sMainScreenScale_95;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_95 == 0.0)
      v13 = 1.0;
    v14 = round(x * v13) / v13 != v9;
    v15 = round(y * v13) / v13 != v10 || v14;
    if (objc_msgSend(v7, "animationType", *(_QWORD *)&v23, *(_QWORD *)&v24))
      v16 = v15;
    else
      v16 = 0;
    -[CKTranscriptCollectionView delegate](self, "delegate");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject collectionViewWillProgrammaticallyScroll:animated:](v11, "collectionViewWillProgrammaticallyScroll:animated:", self, v16);
    v17 = objc_msgSend(v7, "animationType");
    switch(v17)
    {
      case 2:
        v26.receiver = self;
        v26.super_class = (Class)CKTranscriptCollectionView;
        -[CKTranscriptCollectionView setContentOffset:animated:](&v26, sel_setContentOffset_animated_, 1, x, y);
        break;
      case 1:
        objc_msgSend(v7, "caBasicAnimation");
        v18 = (CABasicAnimation *)objc_claimAutoreleasedReturnValue();
        v19 = self->_transcriptCustomScrollAnimation;
        transcriptCustomScrollAnimation = self->_transcriptCustomScrollAnimation;
        self->_transcriptCustomScrollAnimation = v18;
        v21 = v18;

        v25.receiver = self;
        v25.super_class = (Class)CKTranscriptCollectionView;
        -[CKTranscriptCollectionView setContentOffset:animated:](&v25, sel_setContentOffset_animated_, 1, x, y);
        v22 = self->_transcriptCustomScrollAnimation;
        self->_transcriptCustomScrollAnimation = v19;

        break;
      case 0:
        v27.receiver = self;
        v27.super_class = (Class)CKTranscriptCollectionView;
        -[CKTranscriptCollectionView setContentOffset:animated:](&v27, sel_setContentOffset_animated_, 0, x, y);
        break;
    }
  }

}

- (void)setContentOffset:(CGPoint)a3
{
  double y;
  double x;
  NSObject *v6;
  double v7;
  double v8;
  double v10;
  double v11;
  NSObject *v12;
  void *v13;
  objc_super v14;
  CGPoint v15;
  uint8_t buf[4];
  double v17;
  uint64_t v18;

  y = a3.y;
  x = a3.x;
  v18 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  if (-[CKTranscriptCollectionView isHoldingContentOffsetUpdates](self, "isHoldingContentOffsetUpdates"))
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[CKTranscriptCollectionView setContentOffset:].cold.1(x, y);

  }
  else
  {
    -[CKTranscriptCollectionView contentOffset](self, "contentOffset");
    if (v8 != x || v7 != y)
    {
      if (-[CKTranscriptCollectionView adjustContentOffsetForContentSizeChangeIfNeeded](self, "adjustContentOffsetForContentSizeChangeIfNeeded"))
      {
        -[CKTranscriptCollectionView contentOffset](self, "contentOffset");
        v11 = y - v10;
        if (v11 > 0.0)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              v17 = v11;
              _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "adjustContentOffsetForContentSizeChangeIfNeeded flag set, stashing scroll delta %.2f", buf, 0xCu);
            }

          }
          -[CKTranscriptCollectionView setInsertScrollDelta:](self, "setInsertScrollDelta:", v11);
        }
      }
      -[CKTranscriptCollectionView delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "collectionViewWillScroll:targetContentOffset:", self, &v15);

      v14.receiver = self;
      v14.super_class = (Class)CKTranscriptCollectionView;
      -[CKTranscriptCollectionView setContentOffset:](&v14, sel_setContentOffset_, v15.x, v15.y);
    }
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v15;
  void *v16;
  objc_super v17;
  UIEdgeInsets v18;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v18 = a3;
  -[CKTranscriptCollectionView contentInset](self, "contentInset");
  if (v11 != left || v8 != top || v10 != right || v9 != bottom)
  {
    -[CKTranscriptCollectionView delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "collectionViewWillInset:targetContentInset:", self, &v18);

    -[CKTranscriptCollectionView _setAutomaticContentOffsetAdjustmentEnabled:](self, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);
    v17.receiver = self;
    v17.super_class = (Class)CKTranscriptCollectionView;
    -[CKTranscriptCollectionView setContentInset:](&v17, sel_setContentInset_, v18.top, v18.left, v18.bottom, v18.right);
    -[CKTranscriptCollectionView setScrollIndicatorInsets:](self, "setScrollIndicatorInsets:", v18.top, v18.left, v18.bottom, v18.right);
    -[CKTranscriptCollectionView delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "collectionViewDidInset:", self);

  }
}

- (void)setContentSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  NSObject *v18;
  NSObject *v19;
  objc_super v20;
  uint8_t buf[4];
  double v22;
  uint64_t v23;

  height = a3.height;
  width = a3.width;
  v23 = *MEMORY[0x1E0C80C00];
  -[CKTranscriptCollectionView contentSize](self, "contentSize");
  if (v7 != width || v6 != height)
  {
    -[CKTranscriptCollectionView contentSize](self, "contentSize");
    v10 = v9;
    v20.receiver = self;
    v20.super_class = (Class)CKTranscriptCollectionView;
    -[CKTranscriptCollectionView setContentSize:](&v20, sel_setContentSize_, width, height);
    if (-[CKTranscriptCollectionView adjustContentOffsetForContentSizeChangeIfNeeded](self, "adjustContentOffsetForContentSizeChangeIfNeeded"))
    {
      -[CKTranscriptCollectionView contentOffset](self, "contentOffset");
      v12 = v11;
      v14 = v13;
      -[CKTranscriptCollectionView insertScrollDelta](self, "insertScrollDelta");
      v15 = height - v10;
      if (v16 != 0.0 && v15 < 0.0)
      {
        -[CKTranscriptCollectionView insertScrollDelta](self, "insertScrollDelta");
        v15 = v15 + v17;
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            v22 = v15;
            _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "setContentSize: insert op using stashed insert scroll delta to adjust to %.2f", buf, 0xCu);
          }

        }
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v22 = v15;
          _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "setContentSize: insert op adjusting contentOffset y by %.2f", buf, 0xCu);
        }

      }
      -[CKTranscriptCollectionView setContentOffset:](self, "setContentOffset:", v12, v14 + v15);
      -[CKTranscriptCollectionView invalidateNeedsContentOffsetAdjustmentForNextContentSizeChange](self, "invalidateNeedsContentOffsetAdjustmentForNextContentSizeChange");
    }
  }
}

- (id)_customScrollAnimation
{
  return self->_transcriptCustomScrollAnimation;
}

- (CGRect)targetFrameForItemAtIndexPath:(id)a3
{
  double *v3;
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
  CGRect result;

  -[CKTranscriptCollectionView layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", a3);
  v3 = (double *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3[44];
    v5 = v3[45];
    v6 = v3[46];
    v7 = v3[47];
  }
  else
  {
    objc_msgSend(v3, "frame");
    v4 = v8;
    v5 = v9;
    v6 = v10;
    v7 = v11;
  }

  v12 = v4;
  v13 = v5;
  v14 = v6;
  v15 = v7;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)reloadData
{
  NSObject *v2;
  void *v4;
  objc_super v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_ignoresReloadDataRequests)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        v6 = 136315138;
        v7 = "-[CKTranscriptCollectionView reloadData]";
        _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "%s IGNORING RELOAD DATA CALL", (uint8_t *)&v6, 0xCu);
      }

    }
  }
  else
  {
    if ((IMEnableModernTranscript() & 1) == 0)
    {
      -[CKTranscriptCollectionView collectionViewLayout](self, "collectionViewLayout");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "reloadData");

    }
    v5.receiver = self;
    v5.super_class = (Class)CKTranscriptCollectionView;
    -[CKTranscriptCollectionView reloadData](&v5, sel_reloadData);
  }
}

- (id)indexPathForItemAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  y = a3.y;
  x = a3.x;
  v15 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)CKTranscriptCollectionView;
  -[CKTranscriptCollectionView indexPathForItemAtPoint:](&v12, sel_indexPathForItemAtPoint_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "section") == 1)
  {
    -[CKTranscriptCollectionView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transcriptCollectionView:preferredIndexPathForAssociatedItemAtPoint:", self, x, y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && objc_msgSend(v8, "item") != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v9, "section") != 0x7FFFFFFFFFFFFFFFLL)
    {

      goto LABEL_11;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v14 = "-[CKTranscriptCollectionView indexPathForItemAtPoint:]";
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "%s: Did not find preferredIndexPath for associatedItem", buf, 0xCu);
      }

    }
  }
  v9 = v6;
LABEL_11:

  return v9;
}

- (id)indexPathForItemAtPoint:(CGPoint)a3 inSection:(int64_t)a4
{
  CGFloat y;
  CGFloat x;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  CGPoint v23;
  CGRect v24;

  y = a3.y;
  x = a3.x;
  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[CKTranscriptCollectionView indexPathsForVisibleItems](self, "indexPathsForVisibleItems", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v13, "section") == a4)
        {
          -[CKTranscriptCollectionView layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "frame");
          v23.x = x;
          v23.y = y;
          if (CGRectContainsPoint(v24, v23))
          {
            v15 = v13;

            goto LABEL_13;
          }

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_13:

  return v15;
}

- (void)beginDisablingTranscriptDynamicsForReason:(id)a3
{
  NSCountedSet *v4;
  NSObject *v5;
  NSObject *v6;
  NSCountedSet *transcriptDynamicsDisabledReasons;
  int v8;
  NSCountedSet *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (NSCountedSet *)a3;
  IMLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Beginning Disabling Transcript Dynamics for Reason: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  -[NSCountedSet addObject:](self->_transcriptDynamicsDisabledReasons, "addObject:", v4);
  if ((unint64_t)-[NSCountedSet count](self->_transcriptDynamicsDisabledReasons, "count") >= 2)
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      transcriptDynamicsDisabledReasons = self->_transcriptDynamicsDisabledReasons;
      v8 = 138543362;
      v9 = transcriptDynamicsDisabledReasons;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Transcript Dynamics are now disabled for multiple reasons: %{public}@", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)endDisablingTranscriptDynamicsForReason:(id)a3
{
  NSCountedSet *v4;
  NSObject *v5;
  NSObject *v6;
  NSCountedSet *transcriptDynamicsDisabledReasons;
  int v8;
  NSCountedSet *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (NSCountedSet *)a3;
  IMLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Ending Disabling Transcript Dynamics for Reason: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  -[NSCountedSet removeObject:](self->_transcriptDynamicsDisabledReasons, "removeObject:", v4);
  if (-[NSCountedSet count](self->_transcriptDynamicsDisabledReasons, "count"))
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      transcriptDynamicsDisabledReasons = self->_transcriptDynamicsDisabledReasons;
      v8 = 138543362;
      v9 = transcriptDynamicsDisabledReasons;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Transcript Dynamics are still disabled for reasons: %{public}@", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (BOOL)dynamicsDisabled
{
  return -[NSCountedSet count](self->_transcriptDynamicsDisabledReasons, "count") != 0;
}

- (void)swipeToReplyGestureHandler:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = objc_msgSend(v9, "state");
  if ((unint64_t)(v4 - 3) >= 3)
  {
    if (v4 == 2)
    {
      -[CKTranscriptCollectionView swipeTargetBalloonCell](self, "swipeTargetBalloonCell");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "swipeToReplyGestureHandler:", v9);

      -[CKTranscriptCollectionView _updateScrollingLockStateForRecognizer:](self, "_updateScrollingLockStateForRecognizer:", v9);
    }
    else if (v4 == 1)
    {
      +[CKSwipeToReplyRules balloonCellFromGestureRecognizer:inTranscriptCollectionView:](CKSwipeToReplyRules, "balloonCellFromGestureRecognizer:inTranscriptCollectionView:", v9, self);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        -[CKTranscriptCollectionView setSwipeTargetBalloonCell:](self, "setSwipeTargetBalloonCell:", v6);
      -[CKTranscriptCollectionView swipeTargetBalloonCell](self, "swipeTargetBalloonCell");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "swipeToReplyGestureHandler:", v9);

    }
  }
  else
  {
    -[CKTranscriptCollectionView swipeTargetBalloonCell](self, "swipeTargetBalloonCell");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "swipeToReplyGestureHandler:", v9);

    -[CKTranscriptCollectionView _updateScrollingLockStateForRecognizer:](self, "_updateScrollingLockStateForRecognizer:", v9);
    -[CKTranscriptCollectionView setSwipeTargetBalloonCell:](self, "setSwipeTargetBalloonCell:", 0);
  }

}

- (void)_updateScrollingLockStateForRecognizer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  _BOOL8 v10;
  id v11;

  v11 = a3;
  if (objc_msgSend(v11, "state") == 4
    || objc_msgSend(v11, "state") == 5
    || objc_msgSend(v11, "state") == 3
    || (-[CKTranscriptCollectionView swipeTargetBalloonCell](self, "swipeTargetBalloonCell"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    v10 = 1;
    v9 = v11;
  }
  else
  {
    -[CKTranscriptCollectionView swipeTargetBalloonCell](self, "swipeTargetBalloonCell");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "translationInView:", v6);
    v8 = v7;

    v9 = v11;
    v10 = v8 <= 0.0;
  }
  objc_msgSend(v9, "_setCanPanVertically:", v10);

}

- (BOOL)ignoresReloadDataRequests
{
  return self->_ignoresReloadDataRequests;
}

- (void)setIgnoresReloadDataRequests:(BOOL)a3
{
  self->_ignoresReloadDataRequests = a3;
}

- (BOOL)ignoresAutomaticScrollsTowardBottom
{
  return self->_ignoresAutomaticScrollsTowardBottom;
}

- (void)setIgnoresAutomaticScrollsTowardBottom:(BOOL)a3
{
  self->_ignoresAutomaticScrollsTowardBottom = a3;
}

- (int64_t)transcriptScrollIntent
{
  return self->_transcriptScrollIntent;
}

- (CKTranscriptHighlightedMessageScrollContext)highlightedMessageScrollContext
{
  return self->_highlightedMessageScrollContext;
}

- (void)setHighlightedMessageScrollContext:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedMessageScrollContext, a3);
}

- (CABasicAnimation)transcriptCustomScrollAnimation
{
  return self->_transcriptCustomScrollAnimation;
}

- (void)setTranscriptCustomScrollAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptCustomScrollAnimation, a3);
}

- (CKTranscriptBalloonCell)swipeTargetBalloonCell
{
  return self->_swipeTargetBalloonCell;
}

- (void)setSwipeTargetBalloonCell:(id)a3
{
  objc_storeStrong((id *)&self->_swipeTargetBalloonCell, a3);
}

- (NSCountedSet)transcriptDynamicsDisabledReasons
{
  return self->_transcriptDynamicsDisabledReasons;
}

- (void)setTranscriptDynamicsDisabledReasons:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptDynamicsDisabledReasons, a3);
}

- (NSCountedSet)contentOffsetDisabledReasons
{
  return self->_contentOffsetDisabledReasons;
}

- (void)setContentOffsetDisabledReasons:(id)a3
{
  objc_storeStrong((id *)&self->_contentOffsetDisabledReasons, a3);
}

- (BOOL)isTemporarilyOverridingContentOffsetRestriction
{
  return self->_isTemporarilyOverridingContentOffsetRestriction;
}

- (void)setIsTemporarilyOverridingContentOffsetRestriction:(BOOL)a3
{
  self->_isTemporarilyOverridingContentOffsetRestriction = a3;
}

- (id)needsScrollIntentEnforcementBlock
{
  return self->_needsScrollIntentEnforcementBlock;
}

- (void)setNeedsScrollIntentEnforcementBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 3408);
}

- (BOOL)adjustContentOffsetForContentSizeChangeIfNeeded
{
  return self->_adjustContentOffsetForContentSizeChangeIfNeeded;
}

- (void)setAdjustContentOffsetForContentSizeChangeIfNeeded:(BOOL)a3
{
  self->_adjustContentOffsetForContentSizeChangeIfNeeded = a3;
}

- (double)insertScrollDelta
{
  return self->_insertScrollDelta;
}

- (void)setInsertScrollDelta:(double)a3
{
  self->_insertScrollDelta = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_needsScrollIntentEnforcementBlock, 0);
  objc_storeStrong((id *)&self->_contentOffsetDisabledReasons, 0);
  objc_storeStrong((id *)&self->_transcriptDynamicsDisabledReasons, 0);
  objc_storeStrong((id *)&self->_swipeTargetBalloonCell, 0);
  objc_storeStrong((id *)&self->_transcriptCustomScrollAnimation, 0);
  objc_storeStrong((id *)&self->_highlightedMessageScrollContext, 0);
}

void __58__CKTranscriptCollectionView_setNeedsScrollIntentEnforced__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_18DFCD000, v0, v1, "Can't enforce transcriptScrollIntent, lost reference to self.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __58__CKTranscriptCollectionView_setNeedsScrollIntentEnforced__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_18DFCD000, v0, v1, "Enforcing transcriptScrollIntent", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setContentOffset:(double)a1 animated:(double)a2 .cold.1(double a1, double a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromCGPoint(*(CGPoint *)&a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_7(&dword_18DFCD000, v3, v4, "not scrolling %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)setContentOffset:(double)a1 animated:(double)a2 .cold.2(double a1, double a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromCGPoint(*(CGPoint *)&a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_1(&dword_18DFCD000, v3, v4, "not scrolling to %@ (animated: %@) because we're already at that point.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_13();
}

- (void)setContentOffset:(double)a1 animationProperties:(double)a2 .cold.1(double a1, double a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromCGPoint(*(CGPoint *)&a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_7(&dword_18DFCD000, v3, v4, "Not scrolling to %@ due to hold on content offset changes.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)setContentOffset:(double)a1 animationProperties:(double)a2 .cold.2(double a1, double a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromCGPoint(*(CGPoint *)&a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_1(&dword_18DFCD000, v3, v4, "Not scrolling to %@ (animation: %@) because we're already at that point.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_13();
}

- (void)setContentOffset:(double)a1 .cold.1(double a1, double a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromCGPoint(*(CGPoint *)&a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_7(&dword_18DFCD000, v3, v4, "not scrolling %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

@end
