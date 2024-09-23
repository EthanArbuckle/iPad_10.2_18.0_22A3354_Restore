@implementation CKTranscriptNotifyAnywayButtonCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  _BOOL8 v9;
  id v12;
  void *v13;
  objc_super v14;

  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKTranscriptNotifyAnywayButtonCell;
  v12 = a3;
  -[CKTranscriptCell configureForChatItem:context:animated:animationDuration:animationCurve:](&v14, sel_configureForChatItem_context_animated_animationDuration_animationCurve_, v12, a4, v9, a7, a6);
  objc_msgSend(v12, "transcriptText", v14.receiver, v14.super_class);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKTranscriptNotifyAnywayButtonCell setNotifyAnywayButtonAttributedText:](self, "setNotifyAnywayButtonAttributedText:", v13);
}

- (CKTranscriptNotifyAnywayButtonCell)initWithFrame:(CGRect)a3
{
  CKTranscriptNotifyAnywayButtonCell *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKTranscriptNotifyAnywayButtonCell;
  v3 = -[CKTranscriptCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "notifyAnywayButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEditableCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v4);

    -[CKTranscriptNotifyAnywayButtonCell setNotifyAnywayButton:](v3, "setNotifyAnywayButton:", v4);
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
  return CFSTR("CKTranscriptNotifyAnywayButtonCell");
}

+ (id)notifyAnywayButton
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transcriptButtonContentEdgeInsets");
  objc_msgSend(v2, "setContentEdgeInsets:");

  return v2;
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CKTranscriptNotifyAnywayButtonCell;
  -[CKEditableCollectionViewCell layoutSubviewsForAlignmentContents](&v19, sel_layoutSubviewsForAlignmentContents);
  -[CKEditableCollectionViewCell contentAlignmentRect](self, "contentAlignmentRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKTranscriptNotifyAnywayButtonCell notifyAnywayButton](self, "notifyAnywayButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = 1112014848;
  LODWORD(v13) = 1148846080;
  objc_msgSend(v11, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v8, v10, v12, v13);
  v15 = v14;
  v17 = v16;

  -[CKTranscriptNotifyAnywayButtonCell notifyAnywayButton](self, "notifyAnywayButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v4 + floor((v8 - v15) * 0.5), v6 + floor((v10 - v17) * 0.5), v15, v17);

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
      v9.super_class = (Class)CKTranscriptNotifyAnywayButtonCell;
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
  -[CKTranscriptNotifyAnywayButtonCell _fadeInLabelAtStartTime:completion:](self, "_fadeInLabelAtStartTime:completion:", v4, v5 + v7);
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
  -[CKTranscriptNotifyAnywayButtonCell notifyAnywayButton](self, "notifyAnywayButton");
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

  -[CKTranscriptNotifyAnywayButtonCell notifyAnywayButton](self, "notifyAnywayButton");
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

- (void)setNotifyAnywayButtonAttributedText:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CKTranscriptNotifyAnywayButtonCell notifyAnywayButtonAttributedText](self, "notifyAnywayButtonAttributedText");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[CKTranscriptNotifyAnywayButtonCell notifyAnywayButton](self, "notifyAnywayButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttributedTitle:forState:", v6, 0);

    -[CKTranscriptNotifyAnywayButtonCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSAttributedString)notifyAnywayButtonAttributedText
{
  void *v2;
  void *v3;

  -[CKTranscriptNotifyAnywayButtonCell notifyAnywayButton](self, "notifyAnywayButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedTitleForState:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
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
  -[CKTranscriptNotifyAnywayButtonCell notifyAnywayButton](self, "notifyAnywayButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = 0;
  objc_msgSend(v9, "setOpacity:", v10);
  -[CKTranscriptCell insertionBeginTime](self, "insertionBeginTime");
  objc_msgSend(v9, "convertTime:fromLayer:", 0);
  -[CKTranscriptNotifyAnywayButtonCell animationWithKeyPath:beginTime:duration:fromValue:toValue:](self, "animationWithKeyPath:beginTime:duration:fromValue:toValue:", CFSTR("opacity"), &unk_1E28716B0, &unk_1E28716C0, v11 + a3, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAnimation:forKey:", v12, CFSTR("buttonFadeIn"));
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

- (UIButton)notifyAnywayButton
{
  return self->_notifyAnywayButton;
}

- (void)setNotifyAnywayButton:(id)a3
{
  objc_storeStrong((id *)&self->_notifyAnywayButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifyAnywayButton, 0);
}

@end
