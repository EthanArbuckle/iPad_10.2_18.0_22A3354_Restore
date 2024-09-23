@implementation CKTranscriptBalloonCell

- (CKTranscriptBalloonCell)init
{
  CKTranscriptBalloonCell *v2;
  CKTranscriptBalloonCell *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKTranscriptBalloonCell;
  v2 = -[CKTranscriptBalloonCell init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CKTranscriptBalloonCell setMayReparentPluginViews:](v2, "setMayReparentPluginViews:", 1);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[CKBalloonView removeFromSuperview](self->_balloonView, "removeFromSuperview");
  CKBalloonViewReuse(self->_balloonView);
  v3.receiver = self;
  v3.super_class = (Class)CKTranscriptBalloonCell;
  -[CKPhoneTranscriptMessageCell dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptBalloonCell;
  -[CKTranscriptMessageCell description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptBalloonCell balloonView](self, "balloonView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ balloonView:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)isAudioMessage
{
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v3, "isRichAudioMessagesEnabled");

  -[CKTranscriptBalloonCell balloonView](self, "balloonView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v3) = objc_opt_isKindOfClass();

  return v3 & 1;
}

- (void)_ck_setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptBalloonCell;
  -[CKEditableCollectionViewCell _ck_setEditing:animated:](&v7, sel__ck_setEditing_animated_, a3, a4);
  -[CKTranscriptBalloonCell balloonView](self, "balloonView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", !v4);

}

- (void)applyLayoutAttributes:(id)a3
{
  id *v4;
  void *v5;
  _QWORD v6[5];
  objc_super v7;

  v4 = (id *)a3;
  if (!-[CKTranscriptCollectionViewLayoutAttributes isEqual:](self->_layoutAttributes, "isEqual:", v4))
  {
    v7.receiver = self;
    v7.super_class = (Class)CKTranscriptBalloonCell;
    -[CKTranscriptBalloonCell applyLayoutAttributes:](&v7, sel_applyLayoutAttributes_, v4);
    -[CKTranscriptBalloonCell setLayoutAttributes:](self, "setLayoutAttributes:", v4);
    if (v4)
    {
      v5 = (void *)objc_msgSend(v4[81], "mutableCopy");
      objc_msgSend(v5, "addObject:", v4);
      -[CKTranscriptBalloonCell setThreadGroupLayoutAttributes:](self, "setThreadGroupLayoutAttributes:", v5);

    }
    if (objc_msgSend(v4, "isInsertingReply"))
      -[CKTranscriptBalloonCell setInsertingReply:](self, "setInsertingReply:", 1);
    if (-[CKTranscriptCell suppressesAnimationsForLineUpdates](self, "suppressesAnimationsForLineUpdates"))
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __49__CKTranscriptBalloonCell_applyLayoutAttributes___block_invoke;
      v6[3] = &unk_1E274A208;
      v6[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v6);
    }
    else
    {
      -[CKTranscriptBalloonCell _updateLineForThreadGroupLayoutAttributes:](self, "_updateLineForThreadGroupLayoutAttributes:", self->_threadGroupLayoutAttributes);
    }
  }

}

uint64_t __49__CKTranscriptBalloonCell_applyLayoutAttributes___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLineForThreadGroupLayoutAttributes:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1024));
}

- (id)messageDisplayViewLayoutAttributesForMessageDisplayViewFrame:(CGRect)a3 inContainerFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  id v18;
  id WeakRetained;
  id v20;
  objc_super v22;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v22.receiver = self;
  v22.super_class = (Class)CKTranscriptBalloonCell;
  -[CKTranscriptMessageContentCell messageDisplayViewLayoutAttributesForMessageDisplayViewFrame:inContainerFrame:](&v22, sel_messageDisplayViewLayoutAttributesForMessageDisplayViewFrame_inContainerFrame_);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isExpressiveTextEnabled");

  if (v15 && (v16 = objc_loadWeakRetained((id *)&self->_textEffectsDelegate), v16, v16))
  {
    -[CKTranscriptBalloonCell balloonView](self, "balloonView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v18 = v17;
      WeakRetained = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);
      objc_msgSend(WeakRetained, "transcriptBalloonCell:layoutAttributesForTextBalloonView:messageDisplayViewFrame:inContainerFrame:proposedAttributes:", self, v18, v13, v11, v10, v9, v8, x, y, width, height);
      v20 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = v13;
    }

  }
  else
  {
    v20 = v13;
  }

  return v20;
}

- (void)layoutSubviewsForContents
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  objc_super v27;

  -[CKEditableCollectionViewCell contentAlignmentRect](self, "contentAlignmentRect");
  v4 = v3;
  -[CKEditableCollectionViewCell contentAlignmentInsets](self, "contentAlignmentInsets");
  -[CKEditableCollectionViewCell contentAlignmentInsets](self, "contentAlignmentInsets");
  v6 = v5;
  -[CKTranscriptMessageCell safeAreaInsets](self, "safeAreaInsets");
  v8 = v7;
  -[CKEditableCollectionViewCell contentAlignmentInsets](self, "contentAlignmentInsets");
  -[CKEditableCollectionViewCell contentAlignmentInsets](self, "contentAlignmentInsets");
  -[CKTranscriptMessageCell safeAreaInsets](self, "safeAreaInsets");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "forceMinTranscriptMarginInsets") & 1) != 0)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "minTranscriptMarginInsets");
    v12 = v11;

  }
  else
  {
    -[CKEditableCollectionViewCell marginInsets](self, "marginInsets");
    v12 = v13;
  }

  v14 = v4 - (v6 - v8);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contactPhotoTranscriptInsets");
  v17 = v12 + v16;

  self->_lineHorizontalOffset = v14 + v17;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "transcriptContactImageDiameter");
  v20 = v19;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "contactPhotoBalloonMargin");
  v23 = v20 + v22;

  -[CKTranscriptCell drawerPercentRevealed](self, "drawerPercentRevealed");
  v25 = v24;
  -[CKEditableCollectionViewCell contentAlignmentRect](self, "contentAlignmentRect");
  self->_lineHorizontalOffset = self->_lineHorizontalOffset - v25 * (v23 + v26);
  v27.receiver = self;
  v27.super_class = (Class)CKTranscriptBalloonCell;
  -[CKPhoneTranscriptMessageCell layoutSubviewsForContents](&v27, sel_layoutSubviewsForContents);
  -[CKTranscriptBalloonCell _updateLineForThreadGroupLayoutAttributes:](self, "_updateLineForThreadGroupLayoutAttributes:", self->_threadGroupLayoutAttributes);
}

- (void)layoutSubviewsForAlignmentContents
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  void *v20;
  double v21;
  double MaxX;
  double v23;
  objc_super v24;
  CGRect v25;

  v24.receiver = self;
  v24.super_class = (Class)CKTranscriptBalloonCell;
  -[CKTranscriptMessageContentCell layoutSubviewsForAlignmentContents](&v24, sel_layoutSubviewsForAlignmentContents);
  if (self->_quickActionButton)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "transcriptQuickActionButtonDiameter");
    v5 = v4;

    -[CKEditableCollectionViewCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v9 = v8 + floor((v7 - v5) * 0.5);

    -[CKTranscriptBalloonCell balloonView](self, "balloonView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    if (-[CKEditableCollectionViewCell orientation](self, "orientation"))
    {
      v19 = 0.0;
      if (-[CKEditableCollectionViewCell orientation](self, "orientation") != 2)
      {
LABEL_7:
        -[CKQuickActionButton setFrame:](self->_quickActionButton, "setFrame:", v19, v9, v5, v5);
        return;
      }
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "transcriptQuickActionButtonHorizontalSpacing");
      v19 = v12 - v5 - v21;
    }
    else
    {
      v25.origin.x = v12;
      v25.origin.y = v14;
      v25.size.width = v16;
      v25.size.height = v18;
      MaxX = CGRectGetMaxX(v25);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "transcriptQuickActionButtonHorizontalSpacing");
      v19 = MaxX + v23;
    }

    goto LABEL_7;
  }
}

- (void)performInsertion:(id)a3
{
  id v4;
  int64_t v5;
  objc_super v6;

  v4 = a3;
  v5 = -[CKTranscriptCell insertionType](self, "insertionType");
  if (-[CKTranscriptMessageCell isReplyContextPreview](self, "isReplyContextPreview") && v5)
  {
    -[CKTranscriptBalloonCell _animateReplyContextPreview:](self, "_animateReplyContextPreview:", v4);
  }
  else
  {
    switch(v5)
    {
      case 3:
        -[CKTranscriptBalloonCell _animateLowerBracketToLoop:](self, "_animateLowerBracketToLoop:", v4);
        break;
      case 2:
        -[CKTranscriptBalloonCell _animateLineExtension:](self, "_animateLineExtension:", v4);
        break;
      case 1:
        -[CKTranscriptBalloonCell _animateUpperBracket:](self, "_animateUpperBracket:", v4);
        break;
      default:
        -[CKTranscriptBalloonCell setInsertingReply:](self, "setInsertingReply:", 0);
        v6.receiver = self;
        v6.super_class = (Class)CKTranscriptBalloonCell;
        -[CKEditableCollectionViewCell performInsertion:](&v6, sel_performInsertion_, v4);
        break;
    }
  }

}

- (int64_t)insertionAnimationType
{
  unint64_t lineType;
  int64_t v4;

  lineType = self->_lineType;
  if (lineType == 1 || self->_lineIsExtended)
    return 2;
  v4 = 3;
  if (lineType != 5)
    v4 = 0;
  if (lineType == 2)
    return 1;
  else
    return v4;
}

- (double)insertionDurationForInsertionType:(int64_t)a3
{
  BOOL v5;
  double result;
  double v7;

  v5 = -[CKTranscriptMessageCell isReplyContextPreview](self, "isReplyContextPreview");
  result = 0.3;
  if (!v5 && a3 != 1)
  {
    if (a3 == 3)
    {
      return 1.1;
    }
    else if (a3 == 2)
    {
      -[CKTranscriptBalloonCell _createLineViewFrameForThreadGroupLayoutAttributes:](self, "_createLineViewFrameForThreadGroupLayoutAttributes:", self->_threadGroupLayoutAttributes, 0.3);
      return fmax(fmin(v7 * 0.0026 + 0.06868, 0.3), 0.1);
    }
    else
    {
      return 0.0;
    }
  }
  return result;
}

- (void)addFilter:(id)a3
{
  -[CKTranscriptBalloonCell addFilter:fromTriggeringMessage:](self, "addFilter:fromTriggeringMessage:", a3, 0);
}

- (void)addFilter:(id)a3 fromTriggeringMessage:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  id v15;

  v4 = a4;
  v15 = a3;
  -[CKTranscriptBalloonCell balloonView](self, "balloonView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prepareForDisplayIfNeeded");

  -[CKTranscriptBalloonCell balloonView](self, "balloonView");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = -[CKTranscriptBalloonCell animatingInDarkEffect](self, "animatingInDarkEffect");

    if (v9 || v4)
    {
      -[CKTranscriptBalloonCell balloonView](self, "balloonView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addFilter:", v15);

    }
  }
  -[CKTranscriptBalloonCell lineView](self, "lineView");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    v13 = -[CKTranscriptBalloonCell animatingInDarkEffect](self, "animatingInDarkEffect");

    if (v13)
    {
      -[CKTranscriptBalloonCell lineView](self, "lineView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addFilter:", v15);

    }
  }

}

- (void)clearFilters
{
  void *v3;
  void *v4;
  id v5;

  -[CKTranscriptBalloonCell balloonView](self, "balloonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearFilters");

  -[CKTranscriptBalloonCell lineView](self, "lineView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CKTranscriptBalloonCell lineView](self, "lineView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clearFilters");

  }
}

- (void)willLayoutDrawerLabelFrame:(CGRect *)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  __int128 v15;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  -[CKTranscriptBalloonCell balloonView](self, "balloonView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "balloonDescriptor");
  else
    v15 = 0u;

  if (BYTE9(v15))
  {
    objc_msgSend(v5, "balloonMaskTailSizeForTailShape:", 0);
    if (v8 > 0.0)
    {
      v9 = v8;
      -[CKEditableCollectionViewCell contentView](self, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "transform");
        v13 = v14;
      }
      else
      {
        v13 = 0.0;
      }

      a3->size.height = a3->size.height - v9 * v13;
    }
  }

}

- (void)setAnimationPauseReasons:(int64_t)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptBalloonCell;
  -[CKTranscriptMessageContentCell setAnimationPauseReasons:](&v7, sel_setAnimationPauseReasons_);
  -[CKTranscriptBalloonCell balloonView](self, "balloonView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInvisibleInkEffectPaused:", a3 != 0);

  -[CKTranscriptBalloonCell balloonView](self, "balloonView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAnimationPaused:", ((unint64_t)a3 >> 1) & 1);

}

- (CKBalloonSwipeController)balloonSwipeController
{
  CKBalloonSwipeController *balloonSwipeController;
  CKBalloonSwipeController *v4;
  CKBalloonSwipeController *v5;
  uint64_t v6;
  CKBalloonSwipeController *v7;
  CKBalloonSwipeController *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  balloonSwipeController = self->_balloonSwipeController;
  if (balloonSwipeController)
  {
    -[CKBalloonSwipeController setBalloonView:](balloonSwipeController, "setBalloonView:", self->_balloonView);
    v4 = self->_balloonSwipeController;
  }
  else
  {
    location = 0;
    objc_initWeak(&location, self);
    v5 = [CKBalloonSwipeController alloc];
    v6 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __49__CKTranscriptBalloonCell_balloonSwipeController__block_invoke;
    v12[3] = &unk_1E274C268;
    objc_copyWeak(&v13, &location);
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __49__CKTranscriptBalloonCell_balloonSwipeController__block_invoke_2;
    v10[3] = &unk_1E274C290;
    objc_copyWeak(&v11, &location);
    v7 = -[CKBalloonSwipeController initForCell:swipeCompletionHandler:swipeChangedHandler:](v5, "initForCell:swipeCompletionHandler:swipeChangedHandler:", self, v12, v10);
    v8 = self->_balloonSwipeController;
    self->_balloonSwipeController = v7;

    -[CKBalloonSwipeController setBalloonView:](self->_balloonSwipeController, "setBalloonView:", self->_balloonView);
    v4 = self->_balloonSwipeController;
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __49__CKTranscriptBalloonCell_balloonSwipeController__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "balloonCellDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "swipeToReplyLayoutOffset");
  objc_msgSend(v2, "transcriptBalloonCell:didEndBalloonSwipeWithDelta:swipeVelocity:", v3);

}

void __49__CKTranscriptBalloonCell_balloonSwipeController__block_invoke_2(uint64_t a1, double a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  id v8;

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "balloonCellDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v5, "transcriptBalloonCell:didTranslateBalloonByDelta:", v6, a2);

  v7 = objc_loadWeakRetained(v3);
  objc_msgSend(v7, "setNeedsLayout");

  v8 = objc_loadWeakRetained(v3);
  objc_msgSend(v8, "layoutIfNeeded");

}

- (void)setBalloonView:(id)a3
{
  CKBalloonView *v5;
  CKBalloonView **p_balloonView;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  CKBalloonView *v13;
  void *v14;
  void *v15;
  void *v16;
  CKBalloonView *v17;

  v5 = (CKBalloonView *)a3;
  p_balloonView = &self->_balloonView;
  if (self->_balloonView != v5)
  {
    v17 = v5;
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isExpressiveTextEnabled");

    if (v8)
    {
      -[CKBalloonView asTextBalloonView](*p_balloonView, "asTextBalloonView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTextEffectsDelegate:", 0);

    }
    -[CKBalloonView removeFromSuperview](*p_balloonView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_balloonView, a3);
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isExpressiveTextEnabled");

    if (v11)
    {
      -[CKBalloonView asTextBalloonView](*p_balloonView, "asTextBalloonView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTextEffectsDelegate:", self);

    }
    v13 = *p_balloonView;
    -[CKTranscriptBalloonCell balloonSwipeController](self, "balloonSwipeController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBalloonView:", v13);

    -[CKEditableCollectionViewCell contentView](self, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", *p_balloonView);

    -[CKTranscriptBalloonCell layer](self, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAllowsGroupOpacity:", -[CKBalloonView needsGroupOpacity](*p_balloonView, "needsGroupOpacity"));

    -[CKTranscriptBalloonCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v17;
  }

}

- (double)swipeToReplyLayoutOffset
{
  uint64_t v3;
  void *v4;
  double v5;
  void *v6;
  double v7;

  -[CKTranscriptBalloonCell layoutAttributes](self, "layoutAttributes");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3 || (v5 = *(double *)(v3 + 448), v5 <= 0.0))
  {
    -[CKTranscriptBalloonCell balloonSwipeController](self, "balloonSwipeController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "offsetDelta");
    v5 = v7;

  }
  return v5;
}

- (BOOL)allowsSwipeToReply
{
  BOOL v3;
  char v4;
  BOOL v5;

  v3 = -[CKTranscriptBalloonCell canInlineReply](self, "canInlineReply");
  v4 = -[CKTranscriptMessageCell isReplyContextPreview](self, "isReplyContextPreview");
  v5 = -[CKEditableCollectionViewCell isInReplyContext](self, "isInReplyContext");
  return v3 & ~v4 & ((v5 | -[CKTranscriptBalloonCell isAudioMessage](self, "isAudioMessage")) ^ 1);
}

- (BOOL)isPointInAllowedSwipingArea:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPoint v6;
  CGRect v7;

  y = a3.y;
  x = a3.x;
  -[CKTranscriptBalloonCell _swipeToReplySafeSwipeRect](self, "_swipeToReplySafeSwipeRect");
  v6.x = x;
  v6.y = y;
  return CGRectContainsPoint(v7, v6);
}

- (CGRect)_swipeToReplySafeSwipeRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;
  int v12;
  double v13;
  double v14;
  double v15;
  int v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  -[CKBalloonView frame](self->_balloonView, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[CKTranscriptBalloonCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v12 = -[CKEditableCollectionViewCell orientation](self, "orientation");
  v13 = v4 + -28.0;
  if (!v12)
    v13 = v4;
  v14 = v4 + 28.0;
  if (v12)
    v14 = v4;
  if (v11)
    v15 = v13;
  else
    v15 = v14;
  if (v8 < 156.0)
  {
    v16 = -[CKEditableCollectionViewCell orientation](self, "orientation");
    v17 = 0.0;
    if (v16)
      v17 = 156.0 - v8;
    v15 = v15 - v17;
    v8 = v8 + 156.0 - v8;
  }
  v18 = v15;
  v19 = v6;
  v20 = v8;
  v21 = v10;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (void)swipeToReplyGestureHandler:(id)a3
{
  double v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CKTranscriptCell drawerPercentRevealed](self, "drawerPercentRevealed");
  if (v4 <= 0.0)
  {
    -[CKTranscriptBalloonCell balloonSwipeController](self, "balloonSwipeController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "swipeToReplyGestureHandler:", v6);

  }
}

- (void)prepareForReuse
{
  void *v3;
  int v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  CKQuickActionButton *quickActionButton;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isExpressiveTextEnabled");

  if (v4)
  {
    -[CKTranscriptBalloonCell balloonView](self, "balloonView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[CKTranscriptBalloonCell balloonView](self, "balloonView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "textView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "allowsTextAnimations"))
        objc_msgSend(v8, "ck_invalidateAllAnimators");

    }
  }
  v20.receiver = self;
  v20.super_class = (Class)CKTranscriptBalloonCell;
  -[CKTranscriptCell prepareForReuse](&v20, sel_prepareForReuse);
  -[CKTranscriptBalloonCell setLayoutAttributes:](self, "setLayoutAttributes:", 0);
  -[CKTranscriptBalloonCell setThreadGroupLayoutAttributes:](self, "setThreadGroupLayoutAttributes:", 0);
  -[CKTranscriptBalloonCell setInsertingReply:](self, "setInsertingReply:", 0);
  -[CKTranscriptBalloonCell setLineType:](self, "setLineType:", 0);
  -[CKPhoneTranscriptMessageCell contactImageView](self, "contactImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v11) = 1.0;
  objc_msgSend(v10, "setOpacity:", v11);
  objc_msgSend(v10, "removeAllAnimations");
  -[CKTranscriptBalloonCell balloonView](self, "balloonView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v14) = 1.0;
  objc_msgSend(v13, "setOpacity:", v14);
  objc_msgSend(v13, "removeAllAnimations");
  -[CKTranscriptBalloonCell quickActionButton](self, "quickActionButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeFromSuperview");

  quickActionButton = self->_quickActionButton;
  self->_quickActionButton = 0;

  objc_msgSend(MEMORY[0x1E0D358C0], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "unregisterPhotoLibraryPersistenceManagerListener:", self);

  -[CKTranscriptBalloonCell setHasQueuedQuickActionButtonRemoval:](self, "setHasQueuedQuickActionButtonRemoval:", 0);
  -[CKTranscriptBalloonCell balloonView](self, "balloonView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setHidden:", 0);

  -[CKTranscriptBalloonCell balloonSwipeController](self, "balloonSwipeController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "prepareForReuse");

  -[CKTranscriptBalloonCell setBalloonCellDelegate:](self, "setBalloonCellDelegate:", 0);
}

- (void)setThreadGroupLayoutAttributes:(id)a3
{
  void *v5;
  char v6;
  NSArray *threadGroupLayoutAttributes;
  void *v8;
  void *v9;
  CKLineView *v10;
  CKLineView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  -[CKTranscriptBalloonCell threadGroupLayoutAttributes](self, "threadGroupLayoutAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v21, "isEqualToArray:", v5);

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_threadGroupLayoutAttributes, a3);
    threadGroupLayoutAttributes = self->_threadGroupLayoutAttributes;
    -[CKTranscriptBalloonCell lineView](self, "lineView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (threadGroupLayoutAttributes)
    {

      if (!v9)
      {
        v10 = [CKLineView alloc];
        v11 = -[CKLineView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        -[CKLineView lineShapeLayer](v11, "lineShapeLayer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setFillColor:", 0);

        -[CKLineView lineShapeLayer](v11, "lineShapeLayer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "theme");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "replyLineColor");
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v13, "setStrokeColor:", objc_msgSend(v16, "CGColor"));

        -[CKLineView lineShapeLayer](v11, "lineShapeLayer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "replyLineWidth");
        objc_msgSend(v17, "setLineWidth:");

        -[CKLineView lineShapeLayer](v11, "lineShapeLayer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setLineCap:", *MEMORY[0x1E0CD3010]);

        -[CKLineView lineShapeLayer](v11, "lineShapeLayer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setLineJoin:", *MEMORY[0x1E0CD3030]);

        -[CKTranscriptBalloonCell setLineView:](self, "setLineView:", v11);
        -[CKTranscriptBalloonCell addSubview:](self, "addSubview:", v11);

      }
    }
    else
    {
      objc_msgSend(v8, "removeFromSuperview");

      -[CKTranscriptBalloonCell setLineView:](self, "setLineView:", 0);
    }
    -[CKTranscriptBalloonCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_updateLineForThreadGroupLayoutAttributes:(id)a3
{
  id v4;
  BOOL v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v4 = a3;
  if (v4)
  {
    if (!self->_insertingReply)
    {
      v17 = v4;
      v5 = -[CKTranscriptCell shouldFreezeReplyDecorationsForTimestampReveal](self, "shouldFreezeReplyDecorationsForTimestampReveal");
      v4 = v17;
      if (!v5)
      {
        -[CKTranscriptBalloonCell _createLineViewFrameForThreadGroupLayoutAttributes:](self, "_createLineViewFrameForThreadGroupLayoutAttributes:", v17);
        v7 = v6;
        v9 = v8;
        v11 = v10;
        v13 = v12;
        -[CKLineView setFrame:](self->_lineView, "setFrame:");
        -[CKTranscriptBalloonCell _createLinePathForFrame:withThreadGroupLayoutAttributes:](self, "_createLinePathForFrame:withThreadGroupLayoutAttributes:", v17, v7, v9, v11, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKLineView lineShapeLayer](self->_lineView, "lineShapeLayer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_retainAutorelease(v14);
        objc_msgSend(v15, "setPath:", objc_msgSend(v16, "CGPath"));

        v4 = v17;
      }
    }
  }

}

- (CGRect)_createLineViewFrameForThreadGroupLayoutAttributes:(id)a3
{
  id v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CGFloat v18;
  CGFloat v19;
  void *v20;
  _QWORD *v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  CGFloat MidY;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  _BOOL4 v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGFloat v71;
  CGFloat v72;
  double v73;
  CGRect v74;
  CGRect v75;
  CGRect result;

  if (self->_lineView)
  {
    v4 = a3;
    -[CKEditableCollectionViewCell contentAlignmentRect](self, "contentAlignmentRect");
    v70.origin.x = v5;
    v70.origin.y = v6;
    v70.size.width = v7;
    v70.size.height = v8;
    objc_msgSend(v4, "firstObject");
    v9 = (CGFloat *)objc_claimAutoreleasedReturnValue();
    -[CGFloat frame](v9, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v9[44];
    v18 = v9[45];
    v71 = v9[46];
    v72 = v9[47];
    -[CGFloat chatItem](v9, "chatItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v21 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "frame");
    v68.origin.x = v22;
    v68.origin.y = v23;
    v68.size.width = v24;
    v68.size.height = v25;
    v69.origin.x = (CGFloat)v21[44];
    v69.origin.y = (CGFloat)v21[45];
    v69.size.width = (CGFloat)v21[46];
    v69.size.height = (CGFloat)v21[47];
    objc_msgSend(v21, "chatItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "transcriptContactImageDiameter");
    v73 = v28;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "replyLineViewVerticalPadding");
    v31 = v30;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "replyLineWidth");
    v34 = v33;

    v35 = objc_msgSend(v20, "itemIsFromMe");
    v36 = v11;
    v37 = v13;
    v38 = v15;
    v39 = v17;
    if (v35)
    {
      MidY = CGRectGetMidY(*(CGRect *)&v36);
      v74.origin.x = v19;
      v74.origin.y = v18;
      v74.size.width = v71;
      v74.size.height = v72;
      v41 = CGRectGetMidY(v74);
    }
    else
    {
      MidY = v31 + CGRectGetMaxY(*(CGRect *)&v36);
      v75.origin.x = v19;
      v75.origin.y = v18;
      v75.size.width = v71;
      v75.size.height = v72;
      v41 = v31 + CGRectGetMaxY(v75);
    }
    self->_lineViewReferenceY = MidY;
    v46 = v34;
    if (objc_msgSend(v26, "itemIsFromMe"))
    {
      v47 = v34 + 1.0;
      v48 = v47 + CGRectGetMidY(v68);
      v49 = v47 + CGRectGetMidY(v69);
      v50 = v47 + CGRectGetMidY(v70);
      v51 = -[CKTranscriptMessageCell chatEligibleForContactImage](self, "chatEligibleForContactImage");
      v52 = 0.0;
      if (v51)
        v52 = 1.0;
      v53 = v50 + v52;
      v54 = v73;
    }
    else
    {
      -[CKPhoneTranscriptMessageCell contactImageView](self, "contactImageView");
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      v54 = v73;
      if (v55)
      {
        v56 = v73 + v31;
        v48 = CGRectGetMaxY(v68) - v56;
        v49 = CGRectGetMaxY(v69) - v56;
        v53 = CGRectGetMaxY(v70) - v56 + 1.0;
      }
      else
      {
        v48 = CGRectGetMinY(v68) - v31;
        v49 = CGRectGetMinY(v69) - v31;
        v53 = CGRectGetMinY(v70) - v31;
      }
    }
    v57 = v48 - MidY;
    self->_lineViewExpansionFactor = v57 / (v49 - v41);
    v58 = v53 - v57;
    v59 = self->_lineHorizontalOffset + v54 * 0.5 - v46 * 0.5;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "replyLineViewMaxWidth");
    v62 = v61;

    if (CKMainScreenScale_once_12 != -1)
      dispatch_once(&CKMainScreenScale_once_12, &__block_literal_global_27);
    v63 = *(double *)&CKMainScreenScale_sMainScreenScale_12;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_12 == 0.0)
      v63 = 1.0;
    v42 = round(v59 * v63) / v63;
    v43 = round(v58 * v63) / v63;
    v44 = round(v62 * v63) / v63;
    v45 = round(v57 * v63) / v63;

  }
  else
  {
    v42 = *MEMORY[0x1E0C9D648];
    v43 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v44 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v45 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v64 = v42;
  v65 = v43;
  v66 = v44;
  v67 = v45;
  result.size.height = v67;
  result.size.width = v66;
  result.origin.y = v65;
  result.origin.x = v64;
  return result;
}

- (id)_createLinePathForFrame:(CGRect)a3 withThreadGroupLayoutAttributes:(id)a4
{
  double height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  NSArray *v17;
  NSArray *threadLineDescription;
  unint64_t v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  id *v30;
  _BOOL8 v31;
  id v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  CGRect v38;
  CGRect v39;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "replyLineWidth");
  v12 = v11;

  v13 = v12 * 0.5;
  v38.origin.x = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  v14 = CGRectGetHeight(v38);
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = height;
  v15 = CGRectGetWidth(v39);
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "moveToPoint:", v13, v13);
  -[CKTranscriptBalloonCell _lineDescriptionForThreadGroupLayoutAttributes:setLineType:](self, "_lineDescriptionForThreadGroupLayoutAttributes:setLineType:", v9, 1);
  v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  threadLineDescription = self->_threadLineDescription;
  self->_threadLineDescription = v17;

  if (-[NSArray count](self->_threadLineDescription, "count"))
  {
    v19 = 0;
    v20 = v14 - v13;
    v21 = v15 - v13;
    do
    {
      objc_msgSend(v9, "objectAtIndex:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndex:](self->_threadLineDescription, "objectAtIndex:", v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "unsignedIntegerValue");

      switch(v24)
      {
        case 1:
          if (self->_lineType != 3
            || (+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"),
                v25 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v25, "replyLineBracketRadius"),
                v27 = v26 * 1.52866,
                v25,
                v27 <= height))
          {
            if (v19)
            {
              -[NSArray objectAtIndex:](self->_threadLineDescription, "objectAtIndex:", v19 - 1);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v28, "unsignedIntegerValue");

            }
            else
            {
              v29 = 0;
            }
            v31 = v19 + 1 == -[NSArray count](self->_threadLineDescription, "count");
            v37 = v16;
            v30 = &v37;
            -[CKTranscriptBalloonCell _drawStraightLineForPath:withLayout:lineViewMaxY:isTerminal:prevLineSegmentType:](self, "_drawStraightLineForPath:withLayout:lineViewMaxY:isTerminal:prevLineSegmentType:", &v37, v22, v31, v29, v20);
            goto LABEL_13;
          }
          break;
        case 2:
          v36 = v16;
          v30 = &v36;
          -[CKTranscriptBalloonCell _drawUpperBracketForPath:withLayout:lineViewMaxX:lineViewMaxY:](self, "_drawUpperBracketForPath:withLayout:lineViewMaxX:lineViewMaxY:", &v36, v22, v21, v20);
          goto LABEL_13;
        case 3:
          v35 = v16;
          v30 = &v35;
          -[CKTranscriptBalloonCell _drawLowerBracketForPath:lineViewMaxX:lineViewMaxY:](self, "_drawLowerBracketForPath:lineViewMaxX:lineViewMaxY:", &v35, v21, v20);
          goto LABEL_13;
        case 4:
          v34 = v16;
          v30 = &v34;
          -[CKTranscriptBalloonCell _drawLoopForPath:withLayout:](self, "_drawLoopForPath:withLayout:", &v34, v22);
LABEL_13:
          v32 = *v30;

          v16 = v32;
          break;
        default:
          break;
      }

      ++v19;
    }
    while (v19 < -[NSArray count](self->_threadLineDescription, "count"));
  }

  return v16;
}

- (id)_lineDescriptionForThreadGroupLayoutAttributes:(id)a3 setLineType:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t *v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[3];
  uint64_t v24;
  _QWORD v25[4];
  _QWORD v26[5];
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 1;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x3032000000;
    v26[3] = __Block_byref_object_copy__10;
    v26[4] = __Block_byref_object_dispose__10;
    v27 = 0;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    v25[3] = 0;
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    v24 = 0;
    v24 = objc_msgSend(v6, "count");
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__10;
    v21 = __Block_byref_object_dispose__10;
    v22 = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __86__CKTranscriptBalloonCell__lineDescriptionForThreadGroupLayoutAttributes_setLineType___block_invoke;
    v9[3] = &unk_1E274C2B8;
    v11 = v23;
    v10 = v6;
    v12 = v26;
    v13 = &v32;
    v14 = &v28;
    v15 = v25;
    v16 = &v17;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v9);
    if (v4)
    {
      self->_lineType = v33[3];
      self->_lineIsExtended = *((_BYTE *)v29 + 24);
    }
    v7 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(v23, 8);
    _Block_object_dispose(v25, 8);
    _Block_object_dispose(v26, 8);

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
  }
  else
  {
    if (v4)
      self->_lineType = 0;
    v7 = (id)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

void __86__CKTranscriptBalloonCell__lineDescriptionForThreadGroupLayoutAttributes_setLineType___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char isKindOfClass;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id obj;

  objc_msgSend(a2, "chatItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    obj = v7;
    if ((unint64_t)(a3 + 1) >= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "chatItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) && objc_msgSend(obj, "itemIsFromMe"))
    {
      v10 = 2;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 2;
LABEL_33:
      v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v18);

      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v10;

      v7 = obj;
      goto LABEL_34;
    }
    if (v9)
    {
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if (objc_msgSend(obj, "itemIsFromMe")
          && (isKindOfClass & 1) == 0
          && (objc_msgSend(v9, "itemIsFromMe") & 1) == 0)
        {
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 5;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
          v10 = 4;
          goto LABEL_33;
        }
        v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
        v10 = 1;
        if (v12 != 4 && v12 != 2)
        {
          if (v12 != 1)
            goto LABEL_33;
          v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v10 = 1;
LABEL_30:
          *(_BYTE *)(v14 + 24) = 1;
          goto LABEL_33;
        }
LABEL_19:
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        goto LABEL_30;
      }
    }
    else
    {
      if ((objc_msgSend(obj, "itemIsFromMe") & 1) != 0)
      {
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v10 = 3;
        if (*(_QWORD *)(v15 + 24) == 2)
          v16 = 4;
        else
          v16 = 3;
        *(_QWORD *)(v15 + 24) = v16;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
        goto LABEL_33;
      }
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) && (objc_msgSend(obj, "itemIsFromMe") & 1) == 0)
      {
        v10 = 1;
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) != 1)
          goto LABEL_33;
        goto LABEL_19;
      }
    }
    v10 = 0;
    goto LABEL_33;
  }
  *a4 = 1;
LABEL_34:

}

- (void)_drawStraightLineForPath:(id *)a3 withLayout:(id)a4 lineViewMaxY:(double)a5 isTerminal:(BOOL)a6 prevLineSegmentType:(unint64_t)a7
{
  _BOOL4 v8;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  CGRect v17;

  v8 = a6;
  v16 = a4;
  if (a3)
  {
    objc_msgSend(*a3, "currentPoint");
    v14 = v13;
    v15 = v12;
    if (v8)
    {
      if (a7 != 2 || v12 + 5.0 < a5)
        goto LABEL_7;
    }
    else
    {
      objc_msgSend(v16, "frame");
      a5 = fmin(CGRectGetMidY(v17) - self->_lineViewReferenceY, a5);
      if (a5 > v15)
LABEL_7:
        objc_msgSend(*a3, "addLineToPoint:", v14, a5);
    }
  }

}

- (void)_drawUpperBracketForPath:(id *)a3 withLayout:(id)a4 lineViewMaxX:(double)a5 lineViewMaxY:(double)a6
{
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v20;
  CGRect v21;

  v20 = a4;
  if (a3)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "replyLineBracketRadius");
    v12 = v11;

    objc_msgSend(*a3, "currentPoint");
    v14 = v13;
    v16 = v15;
    objc_msgSend(*a3, "moveToPoint:", a5);
    objc_msgSend(*a3, "addCurveToPoint:controlPoint1:controlPoint2:", v14 + v12 * 0.631494, v16 + v12 * 0.0749114, v14 + v12 * 1.08849, v16, v14 + v12 * 0.868407, v16);
    objc_msgSend(*a3, "addCurveToPoint:controlPoint1:controlPoint2:", v14 + v12 * 0.0749114, v16 + v12 * 0.631494, v14 + v12 * 0.372824, v16 + v12 * 0.16906, v14 + v12 * 0.16906, v16 + v12 * 0.372824);
    v17 = fmin(a6, v16 + v12 * 1.52866);
    v18 = fmax(v17, v16 + v12 * 1.08849);
    if (v17 <= a6 && v18 <= a6 + 1.0)
    {
      objc_msgSend(*a3, "addCurveToPoint:controlPoint1:controlPoint2:", v14, v17, v14, v16 + v12 * 0.868407, v14, v18);
      objc_msgSend(v20, "frame");
      if (fmin(a6, CGRectGetMaxY(v21) - self->_lineViewReferenceY) > v17)
        objc_msgSend(*a3, "addLineToPoint:", v14);
    }
  }

}

- (void)_drawLowerBracketForPath:(id *)a3 lineViewMaxX:(double)a4 lineViewMaxY:(double)a5
{
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  if (a3)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "replyLineBracketRadius");
    v10 = v9;

    objc_msgSend(*a3, "currentPoint");
    v12 = v11;
    v14 = fmax(v13, a5 + v10 * -1.52866);
    objc_msgSend(*a3, "addLineToPoint:", v11, v14);
    objc_msgSend(*a3, "addCurveToPoint:controlPoint1:controlPoint2:", v12 + v10 * 0.0749114, a5 - v10 * 0.631494, v12, fmax(v14, a5 - v10 * 1.08849), v12, a5 - v10 * 0.868407);
    objc_msgSend(*a3, "addCurveToPoint:controlPoint1:controlPoint2:", v12 + v10 * 0.631494, a5 - v10 * 0.0749114, v12 + v10 * 0.16906, a5 - v10 * 0.372824, v12 + v10 * 0.372824, a5 - v10 * 0.16906);
    objc_msgSend(*a3, "addCurveToPoint:controlPoint1:controlPoint2:", a4, a5, v12 + v10 * 0.868407, a5, v12 + v10 * 1.08849, a5);
  }
}

- (void)_drawLoopForPath:(id *)a3 withLayout:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double lineViewExpansionFactor;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  if (a3)
  {
    v6 = a4;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textBalloonMinHeight");
    v9 = v8;
    v32 = v8;

    lineViewExpansionFactor = self->_lineViewExpansionFactor;
    v11 = fmax(lineViewExpansionFactor * -2.77777778 + 9.37777778, 3.5);
    objc_msgSend(v6, "frame");
    v12 = CGRectGetMidY(v35) - self->_lineViewReferenceY;
    v34 = v11 + v12;
    v13 = fmax(lineViewExpansionFactor * -1.11111111 + 4.41111111, 2.0);
    v14 = v13 * 0.3333;
    objc_msgSend(*a3, "currentPoint");
    v16 = v15;
    v33 = v13 * 0.8333 + v15;
    v17 = v11 + v13 + v15;
    objc_msgSend(v6, "frame");
    v18 = CGRectGetMinY(v36) - self->_lineViewReferenceY;
    objc_msgSend(v6, "frame");
    v19 = fmax(v18, CGRectGetMidY(v37) - self->_lineViewReferenceY - v9 * 0.5);
    v31 = v16;
    objc_msgSend(*a3, "addLineToPoint:", v16, v19);
    objc_msgSend(*a3, "addCurveToPoint:controlPoint1:controlPoint2:", v33, v12, v16, v19 + (v12 - v11 - v19) * 0.552285);
    v30 = v12 + v11 * 0.552285;
    objc_msgSend(*a3, "addCurveToPoint:controlPoint1:controlPoint2:", v17, v11 + v12);
    objc_msgSend(*a3, "addCurveToPoint:controlPoint1:controlPoint2:");
    objc_msgSend(*a3, "addCurveToPoint:controlPoint1:controlPoint2:", v17);
    objc_msgSend(*a3, "addCurveToPoint:controlPoint1:controlPoint2:", v33, v12, v17 - v11 * 0.552285, v12 - v11, v14 + v33, v12 - v11 * 0.552285);
    objc_msgSend(v6, "frame");
    v20 = CGRectGetMaxY(v38) - self->_lineViewReferenceY;
    objc_msgSend(v6, "frame");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;

    v39.origin.x = v22;
    v39.origin.y = v24;
    v39.size.width = v26;
    v39.size.height = v28;
    v29 = fmin(v20, CGRectGetMidY(v39) - self->_lineViewReferenceY + v32 * 0.5);
    objc_msgSend(*a3, "addCurveToPoint:controlPoint1:controlPoint2:", v31, v29, v33 - v14, v30, v31, v29 - (v29 - v34) * 0.552285);
  }
}

- (void)_animateReplyContextPreview:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  int v14;
  NSObject *v15;
  int v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t))a3;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  -[CKTranscriptBalloonCell layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptCell insertionBeginTime](self, "insertionBeginTime");
  objc_msgSend(v5, "convertTime:fromLayer:", 0);
  v7 = v6;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transcriptReplyPreviewContextContactAlpha");
  -[CKTranscriptBalloonCell _fadeInContactImageAlpha:atBeginTime:](self, "_fadeInContactImageAlpha:atBeginTime:");

  -[CKTranscriptBalloonCell balloonView](self, "balloonView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v10 = 1.0;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "replyPreviewBalloonAlpha");
    v10 = v12;

  }
  -[CKTranscriptBalloonCell _fadeInBalloonAlpha:atBeginTime:](self, "_fadeInBalloonAlpha:atBeginTime:", v10, v7);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "fullTranscriptLoggingEnabled");

  if (v14 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = 134217984;
      v17 = v7;
      _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "INSERTION: Reply Preview: Begin:%f", (uint8_t *)&v16, 0xCu);
    }

  }
  -[CKTranscriptBalloonCell setInsertingReply:](self, "setInsertingReply:", 0);
  if (v4)
    v4[2](v4, 1);

}

- (void)_animateUpperBracket:(id)a3
{
  void (**v4)(id, uint64_t);
  double v5;
  double v6;
  CKLineView **p_lineView;
  CKLineView *lineView;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  int v22;
  double v23;
  double v24;
  NSObject *v25;
  int v26;
  double v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t))a3;
  -[CKTranscriptCell insertionDuration](self, "insertionDuration");
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  p_lineView = &self->_lineView;
  lineView = self->_lineView;
  -[CKTranscriptBalloonCell _createLineViewFrameForThreadGroupLayoutAttributes:](self, "_createLineViewFrameForThreadGroupLayoutAttributes:", self->_threadGroupLayoutAttributes);
  -[CKLineView setFrame:](lineView, "setFrame:");
  -[CKLineView frame](self->_lineView, "frame");
  -[CKTranscriptBalloonCell _createLinePathForFrame:withThreadGroupLayoutAttributes:](self, "_createLinePathForFrame:withThreadGroupLayoutAttributes:", self->_threadGroupLayoutAttributes);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLineView lineShapeLayer](self->_lineView, "lineShapeLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_retainAutorelease(v9);
  objc_msgSend(v10, "setPath:", objc_msgSend(v11, "CGPath"));

  -[CKLineView lineShapeLayer](self->_lineView, "lineShapeLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0.0;
  objc_msgSend(v12, "setStrokeEnd:", 0.0);

  if (-[CKTranscriptCell insertingWithReplyPreview](self, "insertingWithReplyPreview"))
    v13 = 0.3;
  -[CKTranscriptBalloonCell layer](self, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptCell insertionBeginTime](self, "insertionBeginTime");
  objc_msgSend(v14, "convertTime:fromLayer:", 0);
  v16 = v13 + v15;

  -[CKTranscriptBalloonCell animationWithKeyPath:fromValue:toValue:beginTime:duration:timingFunctionName:](self, "animationWithKeyPath:fromValue:toValue:beginTime:duration:timingFunctionName:", CFSTR("strokeEnd"), &unk_1E2871140, &unk_1E2871150, *MEMORY[0x1E0CD3040], v16, v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLineView lineShapeLayer](*p_lineView, "lineShapeLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAnimation:forKey:", v17, CFSTR("lineStrokeEnd"));

  -[CKLineView lineShapeLayer](*p_lineView, "lineShapeLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setStrokeEnd:", 1.0);

  v20 = v6 + v16;
  -[CKTranscriptBalloonCell _fadeInContactImageAlpha:atBeginTime:](self, "_fadeInContactImageAlpha:atBeginTime:", 1.0, v6 + v16);
  -[CKTranscriptBalloonCell _fadeInBalloonAlpha:atBeginTime:](self, "_fadeInBalloonAlpha:atBeginTime:", 1.0, v6 + v16);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "fullTranscriptLoggingEnabled");

  if (v22)
  {
    -[CKTranscriptCell insertionBeginTime](self, "insertionBeginTime");
    v24 = v23;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = 134218752;
        v27 = v16;
        v28 = 2048;
        v29 = v6;
        v30 = 2048;
        v31 = v20 - v16;
        v32 = 2048;
        v33 = v20 + 0.3 - v24;
        _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "INSERTION: Upper Bracket: Begin:%f, Duration:%f, Fade:%f, Total:%f", (uint8_t *)&v26, 0x2Au);
      }

    }
  }
  -[CKTranscriptBalloonCell setInsertingReply:](self, "setInsertingReply:", 0);
  if (v4)
    v4[2](v4, 1);

}

- (void)_animateLineExtension:(id)a3
{
  void (**v4)(id, uint64_t);
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  NSUInteger v27;
  double v28;
  _BOOL4 v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  int v40;
  double v41;
  double v42;
  NSObject *v43;
  id v44;
  uint8_t buf[4];
  double v46;
  __int16 v47;
  double v48;
  __int16 v49;
  double v50;
  __int16 v51;
  double v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t))a3;
  -[CKTranscriptCell insertionDuration](self, "insertionDuration");
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  -[NSArray subarrayWithRange:](self->_threadGroupLayoutAttributes, "subarrayWithRange:", 0, -[NSArray count](self->_threadGroupLayoutAttributes, "count") - 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptBalloonCell _createLineViewFrameForThreadGroupLayoutAttributes:](self, "_createLineViewFrameForThreadGroupLayoutAttributes:", v7);
  v9 = v8;
  -[CKTranscriptBalloonCell _createLinePathForFrame:withThreadGroupLayoutAttributes:](self, "_createLinePathForFrame:withThreadGroupLayoutAttributes:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentPoint");
  v12 = v11;
  v14 = v13;
  -[CKTranscriptBalloonCell _createLineViewFrameForThreadGroupLayoutAttributes:](self, "_createLineViewFrameForThreadGroupLayoutAttributes:", self->_threadGroupLayoutAttributes);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[CKLineView setFrame:](self->_lineView, "setFrame:");
  v44 = v10;
  -[CKTranscriptBalloonCell _extendPath:withFrame:](self, "_extendPath:withFrame:", &v44, v16, v18, v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v44;

  -[CKLineView lineShapeLayer](self->_lineView, "lineShapeLayer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_retainAutorelease(v23);
  objc_msgSend(v25, "setPath:", objc_msgSend(v26, "CGPath"));

  v27 = -[NSArray count](self->_threadLineDescription, "count");
  v28 = 0.0;
  if (v27 >= 2)
    v28 = calculateLengthPercentageToPointInLine((const CGPath *)objc_msgSend(objc_retainAutorelease(v26), "CGPath"), v12, v14);
  v29 = v27 < 2;
  if (-[CKTranscriptCell insertingWithReplyPreview](self, "insertingWithReplyPreview"))
    v30 = 0.15;
  else
    v30 = 0.0;
  -[CKTranscriptBalloonCell layer](self, "layer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptCell insertionBeginTime](self, "insertionBeginTime");
  objc_msgSend(v31, "convertTime:fromLayer:", 0);
  v33 = v32;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v30 + v33;
  -[CKTranscriptBalloonCell animationWithKeyPath:fromValue:toValue:beginTime:duration:timingFunctionName:](self, "animationWithKeyPath:fromValue:toValue:beginTime:duration:timingFunctionName:", CFSTR("strokeEnd"), v34, &unk_1E2871150, *MEMORY[0x1E0CD3058], v35, v6);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKLineView lineShapeLayer](self->_lineView, "lineShapeLayer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addAnimation:forKey:", v36, CFSTR("lineStrokeEnd"));

  v38 = v6 + v35;
  if (v29)
  {
    -[CKTranscriptBalloonCell _fadeInBalloonAlpha:atBeginTime:](self, "_fadeInBalloonAlpha:atBeginTime:", 1.0, v6 + v35);
    -[CKTranscriptBalloonCell _fadeInContactImageAlpha:atBeginTime:](self, "_fadeInContactImageAlpha:atBeginTime:", 1.0, v6 + v35);
  }
  else
  {
    v38 = v38 + -0.1;
    -[CKTranscriptBalloonCell _fadeInBalloonAlpha:atBeginTime:](self, "_fadeInBalloonAlpha:atBeginTime:", 1.0, v38);
    -[CKTranscriptBalloonCell _slideContactImageWithTranslate:duration:beginTime:](self, "_slideContactImageWithTranslate:duration:beginTime:", v9 - v22, v6, v35);
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "fullTranscriptLoggingEnabled");

  if (v40)
  {
    -[CKTranscriptCell insertionBeginTime](self, "insertionBeginTime");
    v42 = v41;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218752;
        v46 = v35;
        v47 = 2048;
        v48 = v6;
        v49 = 2048;
        v50 = v38 - v35;
        v51 = 2048;
        v52 = v38 + 0.3 - v42;
        _os_log_impl(&dword_18DFCD000, v43, OS_LOG_TYPE_INFO, "INSERTION: Line Extension: Begin:%f, Duration:%f, Fade:%f, Total:%f", buf, 0x2Au);
      }

    }
  }
  -[CKTranscriptBalloonCell setInsertingReply:](self, "setInsertingReply:", 0);
  if (v4)
    v4[2](v4, 1);

}

- (void)_animateLowerBracketToLoop:(id)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double Height;
  void *v38;
  double v39;
  double v40;
  id v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  id v52;
  uint64_t v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  dispatch_time_t v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  _QWORD block[5];
  id v71;
  CGRect v72;

  v69 = a3;
  -[CKTranscriptCell insertionDuration](self, "insertionDuration");
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  -[NSArray subarrayWithRange:](self->_threadGroupLayoutAttributes, "subarrayWithRange:", 0, -[NSArray count](self->_threadGroupLayoutAttributes, "count") - 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptBalloonCell _createLineViewFrameForThreadGroupLayoutAttributes:](self, "_createLineViewFrameForThreadGroupLayoutAttributes:", v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "lastObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "chatItem");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKTranscriptBalloonCell balloonCellDelegate](self, "balloonCellDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "cellForChatItem:", v68);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "lastObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  v19 = v18;
  objc_msgSend(v67, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "presentationLayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "frame");
  v23 = v19 - v22;

  -[CKTranscriptBalloonCell _createLinePathForFrame:withThreadGroupLayoutAttributes:](self, "_createLinePathForFrame:withThreadGroupLayoutAttributes:", v6, v8, v10, v12, v14 - v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "currentPoint");
  v26 = v25;
  v28 = v27;
  -[CKTranscriptBalloonCell _createLineViewFrameForThreadGroupLayoutAttributes:](self, "_createLineViewFrameForThreadGroupLayoutAttributes:", self->_threadGroupLayoutAttributes);
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  -[CKLineView setFrame:](self->_lineView, "setFrame:");
  objc_msgSend(v6, "lastObject");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v72.origin.x = v30;
  v72.origin.y = v32;
  v72.size.width = v34;
  v72.size.height = v36;
  Height = CGRectGetHeight(v72);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "replyLineWidth");
  v40 = Height + v39 * -0.5;

  -[CKTranscriptBalloonCell _drawLowerBracketLoopForPath:withLayout:lineViewMaxY:](self, "_drawLowerBracketLoopForPath:withLayout:lineViewMaxY:", v24, v66, v40);
  v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v42 = calculateLengthPercentageToPointInLine((const CGPath *)objc_msgSend(v41, "CGPath"), v26, v28);
  -[CKLineView frame](self->_lineView, "frame");
  -[CKTranscriptBalloonCell _createLinePathForFrame:withThreadGroupLayoutAttributes:](self, "_createLinePathForFrame:withThreadGroupLayoutAttributes:", self->_threadGroupLayoutAttributes);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptBalloonCell layer](self, "layer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptCell insertionBeginTime](self, "insertionBeginTime");
  objc_msgSend(v44, "convertTime:fromLayer:", 0);
  v46 = v45;

  LODWORD(v47) = 1060424070;
  LODWORD(v48) = 995640528;
  LODWORD(v49) = 1047918333;
  LODWORD(v50) = 1065366638;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v47, v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_retainAutorelease(v41);
  v53 = objc_msgSend(v52, "CGPath");
  v54 = objc_retainAutorelease(v43);
  -[CKTranscriptBalloonCell animationWithKeyPath:fromValue:toValue:beginTime:duration:timingFunction:](self, "animationWithKeyPath:fromValue:toValue:beginTime:duration:timingFunction:", CFSTR("path"), v53, objc_msgSend(v54, "CGPath"), v51, v46, v5);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLineView lineShapeLayer](self->_lineView, "lineShapeLayer");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "addAnimation:forKey:", v55, CFSTR("linePath"));

  -[CKLineView lineShapeLayer](self->_lineView, "lineShapeLayer");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_retainAutorelease(v54);
  objc_msgSend(v57, "setPath:", objc_msgSend(v58, "CGPath"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v42);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptBalloonCell animationWithKeyPath:fromValue:toValue:beginTime:duration:timingFunction:](self, "animationWithKeyPath:fromValue:toValue:beginTime:duration:timingFunction:", CFSTR("strokeEnd"), v59, &unk_1E2871150, v51, v46, v5);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKLineView lineShapeLayer](self->_lineView, "lineShapeLayer");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "addAnimation:forKey:", v60, CFSTR("lineStrokeEnd"));

  -[CKLineView lineShapeLayer](self->_lineView, "lineShapeLayer");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setStrokeEnd:", 1.0);

  v63 = v5 + v46 + -0.25;
  -[CKTranscriptBalloonCell _fadeInContactImageAlpha:atBeginTime:](self, "_fadeInContactImageAlpha:atBeginTime:", 1.0, v63);
  -[CKTranscriptBalloonCell _fadeInBalloonAlpha:atBeginTime:](self, "_fadeInBalloonAlpha:atBeginTime:", 1.0, v63);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  v64 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CKTranscriptBalloonCell__animateLowerBracketToLoop___block_invoke;
  block[3] = &unk_1E274C2E0;
  block[4] = self;
  v71 = v69;
  v65 = v69;
  dispatch_after(v64, MEMORY[0x1E0C80D38], block);

}

uint64_t __54__CKTranscriptBalloonCell__animateLowerBracketToLoop___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setInsertingReply:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)_slideContactImageWithTranslate:(double)a3 duration:(double)a4 beginTime:(double)a5
{
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  void *v13;
  void *v14;
  void *v15;
  CATransform3D v16;
  CATransform3D v17;
  CATransform3D v18;

  -[CKPhoneTranscriptMessageCell contactImageView](self, "contactImageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = 0uLL;
  memset(&v18, 0, sizeof(v18));
  if (v10)
  {
    objc_msgSend(v10, "transform");
    v12 = 0uLL;
  }
  *(_OWORD *)&v17.m41 = v12;
  *(_OWORD *)&v17.m43 = v12;
  *(_OWORD *)&v17.m31 = v12;
  *(_OWORD *)&v17.m33 = v12;
  *(_OWORD *)&v17.m21 = v12;
  *(_OWORD *)&v17.m23 = v12;
  *(_OWORD *)&v17.m11 = v12;
  *(_OWORD *)&v17.m13 = v12;
  v16 = v18;
  CATransform3DTranslate(&v17, &v16, 0.0, a3, 0.0);
  v16 = v17;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v18;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptBalloonCell animationWithKeyPath:fromValue:toValue:beginTime:duration:timingFunctionName:](self, "animationWithKeyPath:fromValue:toValue:beginTime:duration:timingFunctionName:", CFSTR("transform"), v13, v14, *MEMORY[0x1E0CD3058], a5, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addAnimation:forKey:", v15, CFSTR("contactImageSlide"));
}

- (void)_fadeInContactImageAlpha:(double)a3 atBeginTime:(double)a4
{
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  id v12;

  -[CKPhoneTranscriptMessageCell contactImageView](self, "contactImageView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 0;
  objc_msgSend(v7, "setOpacity:", v8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptBalloonCell animationWithKeyPath:fromValue:toValue:beginTime:duration:timingFunctionName:](self, "animationWithKeyPath:fromValue:toValue:beginTime:duration:timingFunctionName:", CFSTR("opacity"), &unk_1E2871140, v9, *MEMORY[0x1E0CD3038], a4, 0.3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addAnimation:forKey:", v10, CFSTR("contactImageFadeIn"));
  *(float *)&v11 = a3;
  objc_msgSend(v7, "setOpacity:", v11);

}

- (void)_fadeInBalloonAlpha:(double)a3 atBeginTime:(double)a4
{
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  id v12;

  -[CKTranscriptBalloonCell balloonView](self, "balloonView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 0;
  objc_msgSend(v7, "setOpacity:", v8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptBalloonCell animationWithKeyPath:fromValue:toValue:beginTime:duration:timingFunctionName:](self, "animationWithKeyPath:fromValue:toValue:beginTime:duration:timingFunctionName:", CFSTR("opacity"), &unk_1E2871140, v9, *MEMORY[0x1E0CD3038], a4, 0.3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addAnimation:forKey:", v10, CFSTR("balloonFadeIn"));
  *(float *)&v11 = a3;
  objc_msgSend(v7, "setOpacity:", v11);

}

- (id)animationWithKeyPath:(id)a3 fromValue:(id)a4 toValue:(id)a5 beginTime:(double)a6 duration:(double)a7 timingFunctionName:(id)a8
{
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;

  v13 = (void *)MEMORY[0x1E0CD2710];
  v14 = a8;
  v15 = a5;
  v16 = a4;
  objc_msgSend(v13, "animationWithKeyPath:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFromValue:", v16);

  objc_msgSend(v17, "setToValue:", v15);
  objc_msgSend(v17, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v17, "setRemovedOnCompletion:", 1);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setTimingFunction:", v18);
  objc_msgSend(v17, "setBeginTime:", a6);
  objc_msgSend(v17, "setDuration:", a7);
  return v17;
}

- (id)animationWithKeyPath:(id)a3 fromValue:(id)a4 toValue:(id)a5 beginTime:(double)a6 duration:(double)a7 timingFunction:(id)a8
{
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v13 = (void *)MEMORY[0x1E0CD2710];
  v14 = a8;
  v15 = a5;
  v16 = a4;
  objc_msgSend(v13, "animationWithKeyPath:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFromValue:", v16);

  objc_msgSend(v17, "setToValue:", v15);
  objc_msgSend(v17, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v17, "setRemovedOnCompletion:", 1);
  objc_msgSend(v17, "setTimingFunction:", v14);

  objc_msgSend(v17, "setBeginTime:", a6);
  objc_msgSend(v17, "setDuration:", a7);
  return v17;
}

- (id)_drawLowerBracketLoopForPath:(id)a3 withLayout:(id)a4 lineViewMaxY:(double)a5
{
  id v8;
  CKLineView *lineView;
  id v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v8 = a3;
  lineView = self->_lineView;
  v10 = a4;
  -[CKLineView frame](lineView, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "replyLineWidth");
  v21 = v20;

  v22 = v21 * 0.5;
  v41.origin.x = v12;
  v41.origin.y = v14;
  v41.size.width = v16;
  v41.size.height = v18;
  v23 = v22 + CGRectGetWidth(v41) * 0.5;
  v24 = v8;
  objc_msgSend(v24, "currentPoint");
  v26 = v25 + -30.0;
  objc_msgSend(v24, "addCurveToPoint:controlPoint1:controlPoint2:", v23, v25 + -30.0, v27 + 15.0);
  v28 = v26 + 5.0;
  objc_msgSend(v10, "frame");
  v29 = CGRectGetMidY(v42) - self->_lineViewReferenceY + -10.0;
  objc_msgSend(v10, "frame");
  objc_msgSend(v24, "addCurveToPoint:controlPoint1:controlPoint2:", v22, CGRectGetMidY(v43) - self->_lineViewReferenceY, v22, v28, v22, v29);
  objc_msgSend(v10, "frame");
  v30 = CGRectGetMidY(v44) - self->_lineViewReferenceY + 15.0;
  objc_msgSend(v10, "frame");
  v31 = CGRectGetMaxY(v45) - self->_lineViewReferenceY + -15.0;
  objc_msgSend(v10, "frame");
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;

  v46.origin.x = v33;
  v46.origin.y = v35;
  v46.size.width = v37;
  v46.size.height = v39;
  objc_msgSend(v24, "addCurveToPoint:controlPoint1:controlPoint2:", v22, CGRectGetMaxY(v46) - self->_lineViewReferenceY, v22, v30, v22, v31);
  objc_msgSend(v24, "addLineToPoint:", v22, a5);

  return v24;
}

- (id)_extendPath:(id *)a3 withFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  CGRect v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "replyLineWidth");
  v11 = v10;

  v12 = v11 * -0.5;
  v13 = (void *)objc_msgSend(*a3, "copy");
  objc_msgSend(v13, "currentPoint");
  v15 = v14;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  objc_msgSend(v13, "addLineToPoint:", v15, CGRectGetHeight(v17) + v12);
  return v13;
}

- (void)_removeQuickActionButtonIfNeededAnimated:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  _QWORD v9[4];
  void (**v10)(_QWORD);
  _QWORD v11[5];
  _QWORD aBlock[5];

  v3 = a3;
  if (-[CKQuickActionButton isAnimating](self->_quickActionButton, "isAnimating"))
  {
    -[CKTranscriptBalloonCell setHasQueuedQuickActionButtonRemoval:](self, "setHasQueuedQuickActionButtonRemoval:", 1);
  }
  else if (self->_quickActionButton)
  {
    v5 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__CKTranscriptBalloonCell__removeQuickActionButtonIfNeededAnimated___block_invoke;
    aBlock[3] = &unk_1E274A208;
    aBlock[4] = self;
    v6 = (void (**)(_QWORD))_Block_copy(aBlock);
    v7 = v6;
    if (v3)
    {
      v8 = (void *)MEMORY[0x1E0CEABB0];
      v11[0] = v5;
      v11[1] = 3221225472;
      v11[2] = __68__CKTranscriptBalloonCell__removeQuickActionButtonIfNeededAnimated___block_invoke_2;
      v11[3] = &unk_1E274A208;
      v11[4] = self;
      v9[0] = v5;
      v9[1] = 3221225472;
      v9[2] = __68__CKTranscriptBalloonCell__removeQuickActionButtonIfNeededAnimated___block_invoke_3;
      v9[3] = &unk_1E274C308;
      v10 = v6;
      objc_msgSend(v8, "animateWithDuration:animations:completion:", v11, v9, 0.300000012);

    }
    else
    {
      v6[2](v6);
    }

  }
}

void __68__CKTranscriptBalloonCell__removeQuickActionButtonIfNeededAnimated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1008);
  *(_QWORD *)(v2 + 1008) = 0;

}

uint64_t __68__CKTranscriptBalloonCell__removeQuickActionButtonIfNeededAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setAlpha:", 0.0);
}

uint64_t __68__CKTranscriptBalloonCell__removeQuickActionButtonIfNeededAnimated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_addQuickActionButtonIfNeededAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  __objc2_class **v6;
  CKQuickActionButton *v7;
  CKQuickActionButton *quickActionButton;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v3 = a3;
  if (-[CKTranscriptBalloonCell hasQueuedQuickActionButtonRemoval](self, "hasQueuedQuickActionButtonRemoval"))
    -[CKTranscriptBalloonCell setHasQueuedQuickActionButtonRemoval:](self, "setHasQueuedQuickActionButtonRemoval:", 0);
  if (!self->_quickActionButton)
  {
    v5 = -[CKTranscriptBalloonCell isRichLink](self, "isRichLink");
    v6 = off_1E2733860;
    if (!v5)
      v6 = off_1E2733868;
    v7 = (CKQuickActionButton *)objc_alloc_init(*v6);
    quickActionButton = self->_quickActionButton;
    self->_quickActionButton = v7;

    -[CKQuickActionButton setAnimationDelegate:](self->_quickActionButton, "setAnimationDelegate:", self);
    -[CKQuickActionButton setDelegate:](self->_quickActionButton, "setDelegate:", self);
    if (v3)
    {
      -[CKQuickActionButton setAlpha:](self->_quickActionButton, "setAlpha:", 0.0);
      -[CKEditableCollectionViewCell contentView](self, "contentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", self->_quickActionButton);

      -[CKEditableCollectionViewCell contentView](self, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sendSubviewToBack:", self->_quickActionButton);

      -[CKTranscriptBalloonCell setNeedsLayout](self, "setNeedsLayout");
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __65__CKTranscriptBalloonCell__addQuickActionButtonIfNeededAnimated___block_invoke;
      v13[3] = &unk_1E274A208;
      v13[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v13, 0.300000012);
    }
    else
    {
      -[CKEditableCollectionViewCell contentView](self, "contentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", self->_quickActionButton);

      -[CKEditableCollectionViewCell contentView](self, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sendSubviewToBack:", self->_quickActionButton);

      -[CKTranscriptBalloonCell setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

uint64_t __65__CKTranscriptBalloonCell__addQuickActionButtonIfNeededAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setAlpha:", 1.0);
}

- (void)setCanShowQuickActionButton:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (!-[CKEditableCollectionViewCell isInReplyContext](self, "isInReplyContext")
    && self->_canShowQuickActionButton != v3)
  {
    self->_canShowQuickActionButton = v3;
    -[CKTranscriptBalloonCell updateQuickActionButtonVisibility](self, "updateQuickActionButtonVisibility");
  }
}

- (void)setSyndicationIdentifiers:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_syndicationIdentifiers != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_syndicationIdentifiers, a3);
    -[CKTranscriptBalloonCell updateQuickActionButtonVisibility](self, "updateQuickActionButtonVisibility");
    v5 = v6;
  }

}

- (void)updateQuickActionButtonVisibility
{
  _BOOL4 v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char v14;

  if (!-[CKTranscriptBalloonCell canShowQuickActionButton](self, "canShowQuickActionButton"))
    goto LABEL_11;
  if (-[CKTranscriptBalloonCell isRichLink](self, "isRichLink"))
  {
    v3 = 1;
  }
  else
  {
    v14 = 0;
    v4 = -[CKTranscriptBalloonCell numberOfMomentSharePhotos](self, "numberOfMomentSharePhotos");
    v5 = -[CKTranscriptBalloonCell numberOfMomentShareVideos](self, "numberOfMomentShareVideos") + v4;
    if (v5)
    {
      if (-[CKTranscriptBalloonCell numberOfMomentShareSavedAssets](self, "numberOfMomentShareSavedAssets") == v5)
      {
LABEL_11:
        -[CKTranscriptBalloonCell _removeQuickActionButtonIfNeededAnimated:](self, "_removeQuickActionButtonIfNeededAnimated:", 1);
        return;
      }
LABEL_8:
      -[CKTranscriptBalloonCell _addQuickActionButtonIfNeededAnimated:](self, "_addQuickActionButtonIfNeededAnimated:", 0);
      return;
    }
    objc_msgSend(MEMORY[0x1E0D358C0], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerPhotoLibraryPersistenceManagerListener:", self);
    -[CKTranscriptBalloonCell syndicationIdentifiers](self, "syndicationIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    objc_msgSend(MEMORY[0x1E0D358C0], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0C99E60];
    -[CKTranscriptBalloonCell syndicationIdentifiers](self, "syndicationIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "cachedCountOfSyndicationIdentifiersSavedToSystemPhotoLibrary:shouldFetchAndNotifyAsNeeded:didStartFetch:", v12, 1, &v14);

    v3 = v13 != v8;
    if (!v14)
    {
LABEL_10:
      if (!v3)
        goto LABEL_11;
      goto LABEL_8;
    }
  }
  if (-[CKTranscriptBalloonCell isRichLink](self, "isRichLink"))
    goto LABEL_10;
}

- (void)quickActionButtonWasTapped:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[CKTranscriptBalloonCell quickActionButtonTappedCallback](self, "quickActionButtonTappedCallback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CKTranscriptBalloonCell quickActionButtonTappedCallback](self, "quickActionButtonTappedCallback");
    v6 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v4);
  }
  else
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
      -[CKTranscriptBalloonCell quickActionButtonWasTapped:].cold.1((os_log_t)v6);
  }

}

- (void)quickActionButtonAnimationDidEnd:(id)a3
{
  if (-[CKTranscriptBalloonCell hasQueuedQuickActionButtonRemoval](self, "hasQueuedQuickActionButtonRemoval", a3))
    -[CKTranscriptBalloonCell _removeQuickActionButtonIfNeededAnimated:](self, "_removeQuickActionButtonIfNeededAnimated:", 1);
}

- (void)textBalloonViewWillLayoutSubviews:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);
    objc_msgSend(v5, "transcriptBalloonCell:willLayoutTextBalloonView:", self, v6);

  }
}

- (void)textBalloonViewDidLayoutSubviews:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);
    objc_msgSend(v5, "transcriptBalloonCell:didLayoutTextBalloonView:", self, v6);

  }
}

- (unint64_t)textBalloonViewAllowedLayoutActionForTextBalloonView:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  unint64_t v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);
    v7 = objc_msgSend(v6, "transcriptBalloonCell:allowedLayoutActionForTextBalloonView:", self, v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)textBalloonViewTextViewDidChangeRenderBounds:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);
    objc_msgSend(v5, "transcriptBalloonCell:didChangeRenderBoundsOfTextBalloonView:", self, v6);

  }
}

- (id)customTextRenderingDisplayLinkForTextBalloonViewTextView:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  void *v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);
    objc_msgSend(v6, "transcriptBalloonCell:customTextRenderingDisplayLinkForTextBalloonViewTextView:", self, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)textBalloonViewTextView:(id)a3 didChangeTextEffectPlaybackCandidateStatus:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;
  id v7;
  id v8;

  v4 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);
    objc_msgSend(v7, "transcriptBalloonCell:textBalloonView:didChangeTextEffectPlaybackCandidateStatus:", self, v8, v4);

  }
}

- (CKBalloonView)balloonView
{
  return self->_balloonView;
}

- (CKTranscriptBalloonCellDelegate)balloonCellDelegate
{
  return (CKTranscriptBalloonCellDelegate *)objc_loadWeakRetained((id *)&self->_balloonCellDelegate);
}

- (void)setBalloonCellDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_balloonCellDelegate, a3);
}

- (CKTranscriptBalloonCellTextEffectsDelegate)textEffectsDelegate
{
  return (CKTranscriptBalloonCellTextEffectsDelegate *)objc_loadWeakRetained((id *)&self->_textEffectsDelegate);
}

- (void)setTextEffectsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_textEffectsDelegate, a3);
}

- (BOOL)mayReparentPluginViews
{
  return self->_mayReparentPluginViews;
}

- (void)setMayReparentPluginViews:(BOOL)a3
{
  self->_mayReparentPluginViews = a3;
}

- (BOOL)isInsertingReply
{
  return self->_insertingReply;
}

- (void)setInsertingReply:(BOOL)a3
{
  self->_insertingReply = a3;
}

- (unint64_t)lineType
{
  return self->_lineType;
}

- (void)setLineType:(unint64_t)a3
{
  self->_lineType = a3;
}

- (BOOL)lineIsExtended
{
  return self->_lineIsExtended;
}

- (BOOL)animatingInDarkEffect
{
  return self->_animatingInDarkEffect;
}

- (void)setAnimatingInDarkEffect:(BOOL)a3
{
  self->_animatingInDarkEffect = a3;
}

- (BOOL)canInlineReply
{
  return self->_canInlineReply;
}

- (void)setCanInlineReply:(BOOL)a3
{
  self->_canInlineReply = a3;
}

- (BOOL)isRichLink
{
  return self->_isRichLink;
}

- (void)setIsRichLink:(BOOL)a3
{
  self->_isRichLink = a3;
}

- (NSArray)syndicationIdentifiers
{
  return self->_syndicationIdentifiers;
}

- (unint64_t)numberOfMomentShareSavedAssets
{
  return self->_numberOfMomentShareSavedAssets;
}

- (void)setNumberOfMomentShareSavedAssets:(unint64_t)a3
{
  self->_numberOfMomentShareSavedAssets = a3;
}

- (unint64_t)numberOfMomentSharePhotos
{
  return self->_numberOfMomentSharePhotos;
}

- (void)setNumberOfMomentSharePhotos:(unint64_t)a3
{
  self->_numberOfMomentSharePhotos = a3;
}

- (unint64_t)numberOfMomentShareVideos
{
  return self->_numberOfMomentShareVideos;
}

- (void)setNumberOfMomentShareVideos:(unint64_t)a3
{
  self->_numberOfMomentShareVideos = a3;
}

- (BOOL)canShowQuickActionButton
{
  return self->_canShowQuickActionButton;
}

- (id)quickActionButtonTappedCallback
{
  return self->_quickActionButtonTappedCallback;
}

- (void)setQuickActionButtonTappedCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1000);
}

- (CKQuickActionButton)quickActionButton
{
  return self->_quickActionButton;
}

- (CKTranscriptCollectionViewLayoutAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (void)setLayoutAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1016);
}

- (NSArray)threadGroupLayoutAttributes
{
  return self->_threadGroupLayoutAttributes;
}

- (NSArray)threadLineDescription
{
  return self->_threadLineDescription;
}

- (void)setThreadLineDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (CKLineView)lineView
{
  return self->_lineView;
}

- (void)setLineView:(id)a3
{
  objc_storeStrong((id *)&self->_lineView, a3);
}

- (double)lineHorizontalOffset
{
  return self->_lineHorizontalOffset;
}

- (void)setLineHorizontalOffset:(double)a3
{
  self->_lineHorizontalOffset = a3;
}

- (double)lineViewReferenceY
{
  return self->_lineViewReferenceY;
}

- (void)setLineViewReferenceY:(double)a3
{
  self->_lineViewReferenceY = a3;
}

- (double)lineViewExpansionFactor
{
  return self->_lineViewExpansionFactor;
}

- (void)setLineViewExpansionFactor:(double)a3
{
  self->_lineViewExpansionFactor = a3;
}

- (BOOL)hasQueuedQuickActionButtonRemoval
{
  return self->_hasQueuedQuickActionButtonRemoval;
}

- (void)setHasQueuedQuickActionButtonRemoval:(BOOL)a3
{
  self->_hasQueuedQuickActionButtonRemoval = a3;
}

- (void)setBalloonSwipeController:(id)a3
{
  objc_storeStrong((id *)&self->_balloonSwipeController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_balloonSwipeController, 0);
  objc_storeStrong((id *)&self->_lineView, 0);
  objc_storeStrong((id *)&self->_threadLineDescription, 0);
  objc_storeStrong((id *)&self->_threadGroupLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
  objc_storeStrong((id *)&self->_quickActionButton, 0);
  objc_storeStrong(&self->_quickActionButtonTappedCallback, 0);
  objc_storeStrong((id *)&self->_syndicationIdentifiers, 0);
  objc_destroyWeak((id *)&self->_textEffectsDelegate);
  objc_destroyWeak((id *)&self->_balloonCellDelegate);
  objc_storeStrong((id *)&self->_balloonView, 0);
}

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  void *v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  BOOL v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
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
  double v46;
  double v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  double v53;
  int v54;
  void *v55;
  void *v56;
  double v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD aBlock[4];
  id v65;
  CKTranscriptBalloonCell *v66;
  uint64_t v67;
  uint64_t v68;
  double v69;
  double v70;
  BOOL v71;
  objc_super v72;
  uint8_t buf[4];
  uint64_t v74;
  uint64_t v75;

  v9 = a5;
  v75 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v72.receiver = self;
  v72.super_class = (Class)CKTranscriptBalloonCell;
  -[CKTranscriptMessageContentCell configureForChatItem:context:animated:animationDuration:animationCurve:](&v72, sel_configureForChatItem_context_animated_animationDuration_animationCurve_, v12, v13, v9, a7, a6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v12, "itemIsReplyContextPreview") & 1) == 0)
    {
      -[CKTranscriptMessageCell setFailed:](self, "setFailed:", objc_msgSend(v12, "failed"));
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "stewieEnabled");

      if (v15)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v16 = objc_msgSend(v12, "stewieConversationID");
          v17 = objc_msgSend(v12, "failed");
          v18 = v16 >= 0 ? v17 : 0;
          if (v18 == 1)
          {
            objc_msgSend(v12, "message");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "messageSubject");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "length") == 0;

            if (!v21)
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 134217984;
                  v74 = v16;
                  _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "Disable failure button on initial Stewie start message for conversation ID: %ld", buf, 0xCu);
                }

              }
              -[CKTranscriptMessageCell setFailed:](self, "setFailed:", 0);
            }

          }
        }
      }
      if (objc_msgSend(v12, "isBlackholed"))
      {
        -[CKTranscriptMessageCell failureButton](self, "failureButton");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "theme");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "statusTextColor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setTintColor:", v26);

      }
    }
    v27 = (objc_class *)objc_msgSend(v12, "balloonViewClass");
    -[CKTranscriptBalloonCell balloonView](self, "balloonView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28 && (objc_class *)objc_opt_class() == v27)
    {
      v29 = v28;
    }
    else
    {
      CKBalloonViewForClass(v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKTranscriptBalloonCell setBalloonView:](self, "setBalloonView:", v29);
      if (v28)
      {
        objc_msgSend(v28, "frame");
        objc_msgSend(v29, "setFrame:");
      }

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v29, "configureForLocatingChatItem:", v12);
      goto LABEL_31;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v29, "configureForLocationShareOfferChatItem:", v12);
      goto LABEL_31;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v50 = v29;
        v51 = objc_msgSend(v50, "mayReparentPluginViews");
        objc_msgSend(v50, "setMayReparentPluginViews:", -[CKTranscriptBalloonCell mayReparentPluginViews](self, "mayReparentPluginViews"));
        objc_msgSend(v50, "configureForTranscriptPlugin:context:", v12, v13);
        objc_msgSend(v50, "setMayReparentPluginViews:", v51);

        -[CKTranscriptBalloonCell configureQuickActionButtonForChatItem:](self, "configureQuickActionButtonForChatItem:", v12);
        goto LABEL_31;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_31:
        objc_msgSend(v29, "frame");
        v32 = v31;
        v34 = v33;
        v36 = v35;
        v38 = v37;
        objc_msgSend(v12, "size");
        v40 = v39;
        v42 = v41;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (v40 != *MEMORY[0x1E0C9D820] || v42 != *(double *)(MEMORY[0x1E0C9D820] + 8)))
        {
          -[CKTranscriptBalloonCell bounds](self, "bounds");
          v45 = v44 / v40;
          v46 = 0.0;
          if (v40 == 0.0)
            v45 = 0.0;
          if (v42 != 0.0)
            v46 = v43 / v42;
          v47 = fmin(v45, v46);
          v40 = v40 * v47;
          v42 = v42 * v47;
        }
        if (v36 != v40 || v38 != v42)
        {
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __110__CKTranscriptBalloonCell_CKChatItem__configureForChatItem_context_animated_animationDuration_animationCurve___block_invoke;
          aBlock[3] = &unk_1E27569C0;
          v67 = v32;
          v68 = v34;
          v69 = v40;
          v70 = v42;
          v65 = v29;
          v66 = self;
          v71 = v9;
          v48 = _Block_copy(aBlock);
          v49 = v48;
          if (v9)
            objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", a7 << 16, v48, 0, a6, 0.0);
          else
            (*((void (**)(void *))v48 + 2))(v48);

        }
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v12, "balloonDescriptor");
        }
        else
        {
          v62 = 0u;
          v63 = 0u;
          v60 = 0u;
          v61 = 0u;
          v59 = 0u;
        }
        objc_msgSend(v52, "balloonMaskSizeWithBalloonDescriptor:", &v59);
        objc_msgSend(v29, "setWantsSkinnyMask:", v40 < v53, v59, v60, v61, v62, v63);

        v54 = objc_msgSend(v12, "itemIsReplyContextPreview");
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v55;
        if (v54)
          objc_msgSend(v55, "textReplyPreviewBalloonMinHeight");
        else
          objc_msgSend(v55, "textBalloonMinHeight");
        objc_msgSend(v29, "setWantsMultilineMask:", v42 > v57);

        -[CKTranscriptBalloonCell setCanInlineReply:](self, "setCanInlineReply:", objc_msgSend(v12, "canInlineReply"));
        goto LABEL_55;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v29, "configureForTUConversationChatItem:", v12);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v58 = v12;
            objc_msgSend(v29, "configureForMessagePart:", v58);
            -[CKTranscriptBalloonCell configureQuickActionButtonForChatItem:](self, "configureQuickActionButtonForChatItem:", v58);

          }
          else
          {
            objc_msgSend(v29, "configureForChatItem:", v12);
          }
        }
        goto LABEL_31;
      }
    }
    objc_msgSend(v29, "configureForTranscriptPlugin:", v12);
    goto LABEL_31;
  }
  IMLogHandleForCategory();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    -[CKTranscriptBalloonCell(CKChatItem) configureForChatItem:context:animated:animationDuration:animationCurve:].cold.1();

  -[CKTranscriptBalloonCell balloonView](self, "balloonView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "prepareForReuse");
LABEL_55:

}

uint64_t __110__CKTranscriptBalloonCell_CKChatItem__configureForChatItem_context_animated_animationDuration_animationCurve___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  result = objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
  if (*(_BYTE *)(a1 + 80))
    return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
  return result;
}

- (void)configureQuickActionButtonForChatItem:(id)a3
{
  void *v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  objc_msgSend(MEMORY[0x1E0D10788], "sharedSystemShellSwitcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isClarityBoardEnabled");

  if (CKIsRunningInMessagesViewService() || CKIsRunningInMessagesNotificationExtension())
    v6 = 0;
  else
    v6 = objc_msgSend(v20, "canPerformQuickAction") & (v5 ^ 1);
  objc_msgSend(v20, "IMChatItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "type");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.messages.URLBalloonProvider")))
  {
    objc_msgSend(v20, "IMChatItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v20, "IMChatItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKTranscriptBalloonCell setIsRichLink:](self, "setIsRichLink:", 0);
      -[CKTranscriptBalloonCell setNumberOfMomentShareSavedAssets:](self, "setNumberOfMomentShareSavedAssets:", objc_msgSend(v12, "numberOfMomentShareSavedAssets"));
      -[CKTranscriptBalloonCell setNumberOfMomentSharePhotos:](self, "setNumberOfMomentSharePhotos:", objc_msgSend(v12, "numberOfMomentSharePhotos"));
      -[CKTranscriptBalloonCell setNumberOfMomentShareVideos:](self, "setNumberOfMomentShareVideos:", objc_msgSend(v12, "numberOfMomentShareVideos"));

    }
    objc_opt_class();
    v13 = objc_opt_isKindOfClass();
    if ((v13 & v6) == 1)
    {
      objc_msgSend(v20, "layoutRecipe");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isLastItem");

    }
    else
    {
      v15 = v6 & ~v13;
    }
    v16 = (void *)MEMORY[0x1E0D358C0];
    objc_msgSend(v20, "message");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "IMChatItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "photosSyndicationIdentifiersForMessage:transcriptChatItem:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKTranscriptBalloonCell setSyndicationIdentifiers:](self, "setSyndicationIdentifiers:", v19);
    if (!v15)
      goto LABEL_9;
LABEL_16:
    v9 = -[CKTranscriptBalloonCell _isCommSafetyRestrictedForChatItem:](self, "_isCommSafetyRestrictedForChatItem:", v20) ^ 1;
    goto LABEL_17;
  }
  -[CKTranscriptBalloonCell setIsRichLink:](self, "setIsRichLink:", 1);
  -[CKTranscriptBalloonCell updateQuickActionButtonVisibility](self, "updateQuickActionButtonVisibility");
  if ((v6 & 1) != 0)
    goto LABEL_16;
LABEL_9:
  v9 = 0;
LABEL_17:
  -[CKTranscriptBalloonCell setCanShowQuickActionButton:](self, "setCanShowQuickActionButton:", v9);

}

- (BOOL)_isCommSafetyRestrictedForChatItem:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v3 = a3;
  if (objc_msgSend(v3, "supportsCommunicationSafety")
    && (objc_msgSend(v3, "commSafetyTransferGUID"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "length"),
        v4,
        v5))
  {
    objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "commSafetyTransferGUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transferForGUID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = +[CKCommSafetyHelper shouldDisableTranscriptCapabilitiesForFileTransfer:](CKCommSafetyHelper, "shouldDisableTranscriptCapabilitiesForFileTransfer:", v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)quickActionButtonWasTapped:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "Received quick save button tapped delegate callback, but quickActionButtonTappedCallback wasn't set on the cell.", v1, 2u);
}

@end
