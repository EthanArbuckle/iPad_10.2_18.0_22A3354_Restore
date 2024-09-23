@implementation CKTranscriptSMSSpamCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  _BOOL8 v9;
  id v12;
  void *v13;
  objc_super v14;

  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKTranscriptSMSSpamCell;
  v12 = a3;
  -[CKTranscriptStampCell configureForChatItem:context:animated:animationDuration:animationCurve:](&v14, sel_configureForChatItem_context_animated_animationDuration_animationCurve_, v12, a4, v9, a7, a6);
  objc_msgSend(v12, "transcriptText", v14.receiver, v14.super_class);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKTranscriptLabelCell setAttributedText:](self, "setAttributedText:", v13);
}

- (CKTranscriptSMSSpamCell)initWithFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptSMSSpamCell;
  return -[CKTranscriptLabelCell initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
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
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CKTranscriptSMSSpamCell;
  -[CKTranscriptStampCell layoutSubviewsForAlignmentContents](&v20, sel_layoutSubviewsForAlignmentContents);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transcriptBoldTextHeight");
  v5 = v4;
  -[CKTranscriptLabelCell label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfLines:", 0);
  -[CKTranscriptStampCell contentAlignmentRect](self, "contentAlignmentRect");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CKTranscriptLabelCell label](self, "label");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[CKTranscriptLabelCell label](self, "label");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "attributedText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[CKTranscriptLabelCell label](self, "label");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "attributedText");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "boundingRectWithSize:options:context:", 1, 0, v12, 1.79769313e308);
      v5 = v19;

    }
  }
  objc_msgSend(v6, "setFrame:", v8, v10, v12, v5);

}

- (void)addFilter:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKTranscriptSMSSpamCell;
  -[CKTranscriptStampCell addFilter:](&v3, sel_addFilter_, a3);
}

- (void)clearFilters
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CKTranscriptSMSSpamCell;
  -[CKTranscriptStampCell clearFilters](&v2, sel_clearFilters);
}

- (NSAttributedString)attributedButtonText
{
  return self->_attributedButtonText;
}

- (void)setAttributedButtonText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 848);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedButtonText, 0);
}

@end
