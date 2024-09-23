@implementation CKTranscriptStampCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  _BOOL8 v9;
  id v12;
  void *v13;
  objc_super v14;

  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKTranscriptStampCell;
  v12 = a3;
  -[CKTranscriptCell configureForChatItem:context:animated:animationDuration:animationCurve:](&v14, sel_configureForChatItem_context_animated_animationDuration_animationCurve_, v12, a4, v9, a7, a6);
  objc_msgSend(v12, "transcriptText", v14.receiver, v14.super_class);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKTranscriptStampCell setAttributedText:](self, "setAttributedText:", v13);
}

+ (id)createStampTextView
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CKTranscriptStampCell.m"), 21, CFSTR("Subclasses must implement createStampTextView"));

  return 0;
}

- (void)setAttributedText:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKTranscriptStampCell.m"), 26, CFSTR("Subclasses must implement setAttributedText:"));

}

- (NSAttributedString)attributedText
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKTranscriptStampCell.m"), 30, CFSTR("Subclasses must implement attributedText"));

  return 0;
}

- (CKTranscriptStampCell)initWithFrame:(CGRect)a3
{
  CKTranscriptStampCell *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKTranscriptStampCell;
  v3 = -[CKTranscriptCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "createStampTextView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEditableCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v4);

    -[CKTranscriptStampCell setStampTextView:](v3, "setStampTextView:", v4);
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
  return CFSTR("TS");
}

- (void)layoutSubviewsForContents
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
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
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
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)CKTranscriptStampCell;
  -[CKEditableCollectionViewCell layoutSubviewsForContents](&v43, sel_layoutSubviewsForContents);
  -[CKTranscriptStampCell contentAlignmentRect](self, "contentAlignmentRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[CKTranscriptStampCell wantsContactImageLayout](self, "wantsContactImageLayout"))
  {
    if (!-[CKEditableCollectionViewCell orientation](self, "orientation"))
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "transcriptContactImageDiameter");
      v13 = v12;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "contactPhotoBalloonMargin");
      v42 = v13 + v15;

      -[CKEditableCollectionViewCell marginInsets](self, "marginInsets");
      v39 = v17;
      v40 = v16;
      v41 = v18;
      v38 = v19;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "balloonTranscriptInsets");
      v22 = v21;
      v24 = v23;
      v36 = v25;
      v37 = v26;

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "contactPhotoTranscriptInsets");
      v29 = v28;
      v31 = v30;
      v34 = v33;
      v35 = v32;

      -[CKEditableCollectionViewCell setContentAlignmentRect:](self, "setContentAlignmentRect:", v24 + v42 + v4 - (v39 + v24) + v39 + v31, v22 + v6 - (v40 + v22) + v40 + v29 + 0.0, v8 + v39 + v24 + v38 + v37 - (v39 + v31 + v38 + v34) - (v42 + 0.0) - (v24 + v37), v10 + v40 + v22 + v41 + v36 - (v40 + v29 + v41 + v35) - (v22 + v36));
    }
  }
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
  v12.super_class = (Class)CKTranscriptStampCell;
  -[CKEditableCollectionViewCell layoutSubviewsForAlignmentContents](&v12, sel_layoutSubviewsForAlignmentContents);
  -[CKTranscriptStampCell contentAlignmentRect](self, "contentAlignmentRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKTranscriptStampCell stampTextView](self, "stampTextView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (CGRect)contentAlignmentRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGRect result;

  v20.receiver = self;
  v20.super_class = (Class)CKTranscriptStampCell;
  -[CKEditableCollectionViewCell contentAlignmentRect](&v20, sel_contentAlignmentRect);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (!-[CKEditableCollectionViewCell orientation](self, "orientation")
    && -[CKTranscriptStampCell wantsOffsetForReplyLine](self, "wantsOffsetForReplyLine"))
  {
    v11 = -[CKTranscriptStampCell wantsContactImageLayout](self, "wantsContactImageLayout");
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
      objc_msgSend(v12, "replyLineViewContactImageLayoutHorizontalPadding");
    else
      objc_msgSend(v12, "replyLineViewHorizontalPadding");
    v15 = v14;

    v4 = v4 + v15;
  }
  v16 = v4;
  v17 = v6;
  v18 = v8;
  v19 = v10;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
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
      v9.super_class = (Class)CKTranscriptStampCell;
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
  -[CKTranscriptStampCell _fadeInLabelAtStartTime:completion:](self, "_fadeInLabelAtStartTime:completion:", v4, v5 + v7);
LABEL_11:

}

- (void)setOrientation:(char)a3
{
  int v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKTranscriptStampCell;
  -[CKEditableCollectionViewCell setOrientation:](&v9, sel_setOrientation_);
  -[CKTranscriptStampCell stampTextView](self, "stampTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = 4;
  if (v3 == 2)
    v7 = 8;
  if (v3)
    v8 = v7;
  else
    v8 = 7;
  objc_msgSend(v5, "setContentMode:", v8);

}

- (void)addFilter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  v4 = a3;
  -[CKTranscriptStampCell stampTextView](self, "stampTextView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsGroupBlending:", 0);
  objc_msgSend(v5, "setAllowsGroupOpacity:", 0);
  objc_msgSend(v4, "textCompositingFilter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCompositingFilter:", v6);

  objc_msgSend(v4, "contentAlpha");
  v8 = v7;

  objc_msgSend(v9, "setAlpha:", v8);
}

- (void)clearFilters
{
  void *v2;
  id v3;

  -[CKTranscriptStampCell stampTextView](self, "stampTextView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllowsGroupBlending:", 1);
  objc_msgSend(v2, "setAllowsGroupOpacity:", 1);
  objc_msgSend(v2, "setCompositingFilter:", 0);
  objc_msgSend(v3, "setAlpha:", 1.0);

}

- (void)setWantsContactImageLayout:(BOOL)a3
{
  if (self->_wantsContactImageLayout != a3)
  {
    self->_wantsContactImageLayout = a3;
    -[CKTranscriptStampCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setWantsOffsetForReplyLine:(BOOL)a3
{
  if (self->_wantsOffsetForReplyLine != a3)
  {
    self->_wantsOffsetForReplyLine = a3;
    -[CKTranscriptStampCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKTranscriptStampCell;
  -[CKTranscriptCell prepareForReuse](&v3, sel_prepareForReuse);
  -[CKTranscriptStampCell setWantsOffsetForReplyLine:](self, "setWantsOffsetForReplyLine:", 0);
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
  -[CKTranscriptStampCell stampTextView](self, "stampTextView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = 0;
  objc_msgSend(v9, "setOpacity:", v10);
  -[CKTranscriptCell insertionBeginTime](self, "insertionBeginTime");
  objc_msgSend(v9, "convertTime:fromLayer:", 0);
  -[CKTranscriptStampCell animationWithKeyPath:beginTime:duration:fromValue:toValue:](self, "animationWithKeyPath:beginTime:duration:fromValue:toValue:", CFSTR("opacity"), &unk_1E2871690, &unk_1E28716A0, v11 + a3, v7);
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

- (id)debugBorderColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "greenColor");
}

- (BOOL)wantsContactImageLayout
{
  return self->_wantsContactImageLayout;
}

- (BOOL)wantsOffsetForReplyLine
{
  return self->_wantsOffsetForReplyLine;
}

- (BOOL)isRetractionStamp
{
  return self->_isRetractionStamp;
}

- (void)setIsRetractionStamp:(BOOL)a3
{
  self->_isRetractionStamp = a3;
}

- (UIView)stampTextView
{
  return self->_stampTextView;
}

- (void)setStampTextView:(id)a3
{
  objc_storeStrong((id *)&self->_stampTextView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stampTextView, 0);
}

@end
