@implementation CKTranscriptSatelliteSuppressedNotificationCell

- (CKTranscriptSatelliteSuppressedNotificationCell)initWithFrame:(CGRect)a3
{
  CKTranscriptSatelliteSuppressedNotificationCell *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKTranscriptSatelliteSuppressedNotificationCell;
  v3 = -[CKTranscriptCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "satelliteNoNotificationTitleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEditableCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v4);

    -[CKTranscriptSatelliteSuppressedNotificationCell setSatelliteNoNotificationTitleLabel:](v3, "setSatelliteNoNotificationTitleLabel:", v4);
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
  return CFSTR("CKTranscriptSuppressedNotificationCell");
}

+ (id)satelliteNoNotificationTitleLabel
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
  v12.super_class = (Class)CKTranscriptSatelliteSuppressedNotificationCell;
  -[CKEditableCollectionViewCell layoutSubviewsForAlignmentContents](&v12, sel_layoutSubviewsForAlignmentContents);
  -[CKEditableCollectionViewCell contentAlignmentRect](self, "contentAlignmentRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKTranscriptSatelliteSuppressedNotificationCell satelliteNoNotificationTitleLabel](self, "satelliteNoNotificationTitleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

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
      v9.super_class = (Class)CKTranscriptSatelliteSuppressedNotificationCell;
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
  -[CKTranscriptSatelliteSuppressedNotificationCell _fadeInLabelAtStartTime:completion:](self, "_fadeInLabelAtStartTime:completion:", v4, v5 + v7);
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
  -[CKTranscriptSatelliteSuppressedNotificationCell satelliteNoNotificationTitleLabel](self, "satelliteNoNotificationTitleLabel");
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

  -[CKTranscriptSatelliteSuppressedNotificationCell satelliteNoNotificationTitleLabel](self, "satelliteNoNotificationTitleLabel");
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

- (void)_updateSatelliteNoNotificationTitleLabelAttributedTextAnimated:(BOOL)a3
{
  _BOOL4 v3;
  NSAttributedString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  NSAttributedString *v12;

  v3 = a3;
  v5 = self->_satelliteNoNotificationTitleLabelAttributedText;
  if (v5)
  {
    -[CKTranscriptSatelliteSuppressedNotificationCell satelliteNoNotificationTitleLabel](self, "satelliteNoNotificationTitleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v3)
    {
      v8 = (void *)MEMORY[0x1E0CEABB0];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __114__CKTranscriptSatelliteSuppressedNotificationCell__updateSatelliteNoNotificationTitleLabelAttributedTextAnimated___block_invoke;
      v10[3] = &unk_1E274A108;
      v11 = v6;
      v12 = v5;
      objc_msgSend(v8, "transitionWithView:duration:options:animations:completion:", v11, 5242880, v10, 0, 0.25);

    }
    else
    {
      -[CKTranscriptSatelliteSuppressedNotificationCell satelliteNoNotificationTitleLabel](self, "satelliteNoNotificationTitleLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAttributedText:", v5);

    }
  }

}

uint64_t __114__CKTranscriptSatelliteSuppressedNotificationCell__updateSatelliteNoNotificationTitleLabelAttributedTextAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAttributedText:", *(_QWORD *)(a1 + 40));
}

- (void)setSatelliteNoNotificationTitleLabelAttributedText:(id)a3
{
  NSAttributedString *v5;
  NSAttributedString *v6;

  v5 = (NSAttributedString *)a3;
  if (self->_satelliteNoNotificationTitleLabelAttributedText != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_satelliteNoNotificationTitleLabelAttributedText, a3);
    -[CKTranscriptSatelliteSuppressedNotificationCell _updateSatelliteNoNotificationTitleLabelAttributedTextAnimated:](self, "_updateSatelliteNoNotificationTitleLabelAttributedTextAnimated:", 0);
    v5 = v6;
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
  -[CKTranscriptSatelliteSuppressedNotificationCell satelliteNoNotificationTitleLabel](self, "satelliteNoNotificationTitleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = 0;
  objc_msgSend(v9, "setOpacity:", v10);
  -[CKTranscriptCell insertionBeginTime](self, "insertionBeginTime");
  objc_msgSend(v9, "convertTime:fromLayer:", 0);
  -[CKTranscriptSatelliteSuppressedNotificationCell animationWithKeyPath:beginTime:duration:fromValue:toValue:](self, "animationWithKeyPath:beginTime:duration:fromValue:toValue:", CFSTR("opacity"), &unk_1E2871420, &unk_1E2871430, v11 + a3, v7);
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

- (NSAttributedString)satelliteNoNotificationTitleLabelAttributedText
{
  return self->_satelliteNoNotificationTitleLabelAttributedText;
}

- (UILabel)satelliteNoNotificationTitleLabel
{
  return self->_satelliteNoNotificationTitleLabel;
}

- (void)setSatelliteNoNotificationTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_satelliteNoNotificationTitleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_satelliteNoNotificationTitleLabel, 0);
  objc_storeStrong((id *)&self->_satelliteNoNotificationTitleLabelAttributedText, 0);
}

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  NSObject *v14;
  objc_super v15;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15.receiver = self;
    v15.super_class = (Class)CKTranscriptSatelliteSuppressedNotificationCell;
    -[CKTranscriptCell configureForChatItem:context:animated:animationDuration:animationCurve:](&v15, sel_configureForChatItem_context_animated_animationDuration_animationCurve_, v12, v13, v9, a7, a6);
    objc_msgSend(v12, "satelliteNoNotificationTitleLabelAttributedText");
    v14 = objc_claimAutoreleasedReturnValue();
    -[CKTranscriptSatelliteSuppressedNotificationCell setSatelliteNoNotificationTitleLabelAttributedText:](self, "setSatelliteNoNotificationTitleLabelAttributedText:", v14);
  }
  else
  {
    IMLogHandleForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CKTranscriptSatelliteSuppressedNotificationCell(CKChatItem) configureForChatItem:context:animated:animationDuration:animationCurve:].cold.1();
  }

}

@end
