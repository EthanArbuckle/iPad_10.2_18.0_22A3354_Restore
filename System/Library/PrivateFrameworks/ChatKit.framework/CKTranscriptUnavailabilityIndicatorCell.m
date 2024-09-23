@implementation CKTranscriptUnavailabilityIndicatorCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  objc_super v17;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17.receiver = self;
    v17.super_class = (Class)CKTranscriptUnavailabilityIndicatorCell;
    -[CKTranscriptCell configureForChatItem:context:animated:animationDuration:animationCurve:](&v17, sel_configureForChatItem_context_animated_animationDuration_animationCurve_, v12, v13, v9, a7, a6);
    objc_msgSend(v12, "unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptUnavailabilityIndicatorCell setUnavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton:](self, "setUnavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton:", v14);

    objc_msgSend(v12, "unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptUnavailabilityIndicatorCell setUnavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton:](self, "setUnavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton:", v15);

    -[CKTranscriptUnavailabilityIndicatorCell setDisplayingNotifyAnywayButton:](self, "setDisplayingNotifyAnywayButton:", objc_msgSend(v12, "displayNotifyAnywayButton"));
    objc_msgSend(v12, "imUnavailabilityIndicatorChatItem");
    v16 = objc_claimAutoreleasedReturnValue();
    -[NSObject addUnavailabilityIndicatorChatItemDelegate:](v16, "addUnavailabilityIndicatorChatItemDelegate:", self);
  }
  else
  {
    IMLogHandleForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CKTranscriptUnavailabilityIndicatorCell(CKChatItem) configureForChatItem:context:animated:animationDuration:animationCurve:].cold.1();
  }

}

- (CKTranscriptUnavailabilityIndicatorCell)initWithFrame:(CGRect)a3
{
  CKTranscriptUnavailabilityIndicatorCell *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKTranscriptUnavailabilityIndicatorCell;
  v3 = -[CKTranscriptCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "unavailableTitleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEditableCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v4);

    -[CKTranscriptUnavailabilityIndicatorCell setUnavailableTitleLabel:](v3, "setUnavailableTitleLabel:", v4);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transcriptTextVibrancyEffect");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEditableCollectionViewCell setEffect:](v3, "setEffect:", v7);

  }
  return v3;
}

+ (id)reuseIdentifier
{
  return CFSTR("CKTranscriptUnavailabilityIndicatorCell");
}

- (void)displayNotifyAnywayButtonStateChanged:(id)a3
{
  -[CKTranscriptUnavailabilityIndicatorCell setDisplayingNotifyAnywayButton:](self, "setDisplayingNotifyAnywayButton:", objc_msgSend(a3, "displayNotifyAnywayButton"));
}

+ (id)unavailableTitleLabel
{
  id v2;
  void *v3;

  v2 = objc_alloc(MEMORY[0x1E0CEA700]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v3, "setNumberOfLines:", 0);
  objc_msgSend(v3, "setContentMode:", 4);
  objc_msgSend(v3, "setTextAlignment:", 1);
  return v3;
}

- (void)layoutSubviewsForAlignmentContents
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKTranscriptUnavailabilityIndicatorCell;
  -[CKEditableCollectionViewCell layoutSubviewsForAlignmentContents](&v12, sel_layoutSubviewsForAlignmentContents);
  -[CKEditableCollectionViewCell contentAlignmentRect](self, "contentAlignmentRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKTranscriptUnavailabilityIndicatorCell unavailableTitleLabel](self, "unavailableTitleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)setDisplayingNotifyAnywayButton:(BOOL)a3
{
  if (self->_displayingNotifyAnywayButton != a3)
  {
    self->_displayingNotifyAnywayButton = a3;
    -[CKTranscriptUnavailabilityIndicatorCell _updateUnavailableTitleLabelAttributedTextAnimated:](self, "_updateUnavailableTitleLabelAttributedTextAnimated:", 1);
  }
}

- (void)performInsertion:(id)a3
{
  id v4;
  double v5;
  int64_t v6;
  double v7;
  double v8;
  objc_super v9;

  v4 = a3;
  v5 = 0.0;
  if (!-[CKTranscriptCell insertingBeforeReplyPreview](self, "insertingBeforeReplyPreview"))
  {
    if (-[CKTranscriptCell insertingWithReplyPreview](self, "insertingWithReplyPreview"))
      v5 = 0.3;
    else
      v5 = 0.0;
  }
  v6 = -[CKTranscriptCell insertionType](self, "insertionType");
  if ((unint64_t)(v6 - 1) >= 2)
  {
    if (v6 != 3)
    {
      v9.receiver = self;
      v9.super_class = (Class)CKTranscriptUnavailabilityIndicatorCell;
      -[CKEditableCollectionViewCell performInsertion:](&v9, sel_performInsertion_, v4);
      goto LABEL_11;
    }
    -[CKTranscriptCell insertionDuration](self, "insertionDuration");
    v7 = v8 + -0.25;
  }
  else
  {
    -[CKTranscriptCell insertionDuration](self, "insertionDuration");
  }
  -[CKTranscriptUnavailabilityIndicatorCell _fadeInLabelAtStartTime:completion:](self, "_fadeInLabelAtStartTime:completion:", v4, v5 + v7);
LABEL_11:

}

- (void)addFilter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;

  v4 = a3;
  -[CKTranscriptUnavailabilityIndicatorCell unavailableTitleLabel](self, "unavailableTitleLabel");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsGroupBlending:", 0);

  objc_msgSend(v11, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsGroupOpacity:", 0);

  objc_msgSend(v11, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textCompositingFilter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCompositingFilter:", v8);

  objc_msgSend(v4, "contentAlpha");
  v10 = v9;

  objc_msgSend(v11, "setAlpha:", v10);
}

- (void)clearFilters
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[CKTranscriptUnavailabilityIndicatorCell unavailableTitleLabel](self, "unavailableTitleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllowsGroupBlending:", 1);

  objc_msgSend(v5, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsGroupOpacity:", 1);

  objc_msgSend(v5, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompositingFilter:", 0);

  objc_msgSend(v5, "setAlpha:", 1.0);
}

- (void)_updateUnavailableTitleLabelAttributedTextAnimated:(BOOL)a3
{
  _BOOL4 v3;
  int *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a3;
  if (self->_displayingNotifyAnywayButton)
    v5 = &OBJC_IVAR___CKTranscriptUnavailabilityIndicatorCell__unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton;
  else
    v5 = &OBJC_IVAR___CKTranscriptUnavailabilityIndicatorCell__unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton;
  v6 = *(id *)((char *)&self->super.super.super.super.super.super.super.isa + *v5);
  if (v6)
  {
    -[CKTranscriptUnavailabilityIndicatorCell unavailableTitleLabel](self, "unavailableTitleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v3)
    {
      v9 = (void *)MEMORY[0x1E0CEABB0];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __94__CKTranscriptUnavailabilityIndicatorCell__updateUnavailableTitleLabelAttributedTextAnimated___block_invoke;
      v11[3] = &unk_1E274A108;
      v12 = v7;
      v13 = v6;
      objc_msgSend(v9, "transitionWithView:duration:options:animations:completion:", v12, 5242880, v11, 0, 0.25);

    }
    else
    {
      -[CKTranscriptUnavailabilityIndicatorCell unavailableTitleLabel](self, "unavailableTitleLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAttributedText:", v6);

    }
  }

}

uint64_t __94__CKTranscriptUnavailabilityIndicatorCell__updateUnavailableTitleLabelAttributedTextAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAttributedText:", *(_QWORD *)(a1 + 40));
}

- (void)setUnavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton:(id)a3
{
  NSAttributedString *v5;

  v5 = (NSAttributedString *)a3;
  if (self->_unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton != v5)
  {
    objc_storeStrong((id *)&self->_unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton, a3);
    if (self->_displayingNotifyAnywayButton)
      -[CKTranscriptUnavailabilityIndicatorCell _updateUnavailableTitleLabelAttributedTextAnimated:](self, "_updateUnavailableTitleLabelAttributedTextAnimated:", 0);
  }

}

- (void)setUnavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton:(id)a3
{
  NSAttributedString *v5;
  NSAttributedString *v6;

  v5 = (NSAttributedString *)a3;
  if (self->_unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton, a3);
    v5 = v6;
    if (!self->_displayingNotifyAnywayButton)
    {
      -[CKTranscriptUnavailabilityIndicatorCell _updateUnavailableTitleLabelAttributedTextAnimated:](self, "_updateUnavailableTitleLabelAttributedTextAnimated:", 0);
      v5 = v6;
    }
  }

}

- (void)_fadeInLabelAtStartTime:(double)a3 completion:(id)a4
{
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  int v15;
  void (**v16)(id, uint64_t);

  v16 = (void (**)(id, uint64_t))a4;
  -[CKTranscriptCell insertionDuration](self, "insertionDuration");
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  -[CKTranscriptUnavailabilityIndicatorCell unavailableTitleLabel](self, "unavailableTitleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = 0;
  objc_msgSend(v9, "setOpacity:", v10);
  -[CKTranscriptCell insertionBeginTime](self, "insertionBeginTime");
  objc_msgSend(v9, "convertTime:fromLayer:", 0);
  -[CKTranscriptUnavailabilityIndicatorCell animationWithKeyPath:beginTime:duration:fromValue:toValue:](self, "animationWithKeyPath:beginTime:duration:fromValue:toValue:", CFSTR("opacity"), &unk_1E2871670, &unk_1E2871680, v11 + a3, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAnimation:forKey:", v12, CFSTR("labelFadeIn"));
  LODWORD(v13) = 1.0;
  objc_msgSend(v9, "setOpacity:", v13);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "fullTranscriptLoggingEnabled");

  if (v15 && _IMWillLog())
    _IMAlwaysLog();
  if (v16)
    v16[2](v16, 1);

}

- (id)animationWithKeyPath:(id)a3 beginTime:(double)a4 duration:(double)a5 fromValue:(id)a6 toValue:(id)a7
{
  void *v11;
  id v12;
  id v13;
  void *v14;

  v11 = (void *)MEMORY[0x1E0CD2710];
  v12 = a7;
  v13 = a6;
  objc_msgSend(v11, "animationWithKeyPath:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFromValue:", v13);

  objc_msgSend(v14, "setToValue:", v12);
  objc_msgSend(v14, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v14, "setRemovedOnCompletion:", 1);
  objc_msgSend(v14, "setBeginTime:", a4);
  objc_msgSend(v14, "setDuration:", a5);
  return v14;
}

- (NSAttributedString)unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton
{
  return self->_unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton;
}

- (NSAttributedString)unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton
{
  return self->_unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton;
}

- (BOOL)displayingNotifyAnywayButton
{
  return self->_displayingNotifyAnywayButton;
}

- (UILabel)unavailableTitleLabel
{
  return self->_unavailableTitleLabel;
}

- (void)setUnavailableTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_unavailableTitleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unavailableTitleLabel, 0);
  objc_storeStrong((id *)&self->_unavailableTitleLabelAttributedTextWhenNotDisplayingNotifyAnywayButton, 0);
  objc_storeStrong((id *)&self->_unavailableTitleLabelAttributedTextWhenDisplayingNotifyAnywayButton, 0);
}

@end
