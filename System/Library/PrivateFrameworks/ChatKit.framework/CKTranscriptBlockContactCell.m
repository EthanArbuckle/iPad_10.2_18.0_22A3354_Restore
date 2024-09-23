@implementation CKTranscriptBlockContactCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  uint64_t v24;
  _QWORD v25[2];

  v9 = a5;
  v25[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    IMLogHandleForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CKTranscriptBlockContactCell(CKChatItem) configureForChatItem:context:animated:animationDuration:animationCurve:].cold.1();

    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0D36350];
    v24 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Calling into configureForChatItem: with an unexpected type: %@"), objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 0, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "forceAutoBugCaptureWithSubType:errorPayload:type:context:", CFSTR("WrongChatItemForCKTranscriptCell"), v19, CFSTR("CKTranscriptBlockContactCell"), 0);

  }
  v23.receiver = self;
  v23.super_class = (Class)CKTranscriptBlockContactCell;
  -[CKTranscriptStampCell configureForChatItem:context:animated:animationDuration:animationCurve:](&v23, sel_configureForChatItem_context_animated_animationDuration_animationCurve_, v12, v13, v9, a7, a6);
  objc_msgSend(v12, "transcriptText");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptLabelCell setAttributedText:](self, "setAttributedText:", v21);

  if (!CKIsRunningInMessagesNotificationExtension() && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "transcriptButtonText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptBlockContactCell setAttributedButtonText:](self, "setAttributedButtonText:", v22);

  }
}

- (CKTranscriptBlockContactCell)initWithFrame:(CGRect)a3
{
  CKTranscriptBlockContactCell *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptBlockContactCell;
  v3 = -[CKTranscriptLabelCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "blockContactButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEditableCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v4);

    -[CKTranscriptBlockContactCell setBlockContactButton:](v3, "setBlockContactButton:", v4);
  }
  return v3;
}

- (void)layoutSubviewsForAlignmentContents
{
  void *v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  float v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  objc_super v31;
  CGRect v32;
  CGRect v33;

  v31.receiver = self;
  v31.super_class = (Class)CKTranscriptBlockContactCell;
  -[CKTranscriptStampCell layoutSubviewsForAlignmentContents](&v31, sel_layoutSubviewsForAlignmentContents);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptStampCell contentAlignmentRect](self, "contentAlignmentRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "transcriptBoldTextHeight");
  v13 = v12;
  -[CKTranscriptBlockContactCell blockContactButton](self, "blockContactButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sizeToFit");
  objc_msgSend(v14, "frame");
  v16 = v15;
  v18 = v17;
  v32.origin.x = v5;
  v32.origin.y = v7;
  v32.size.width = v9;
  v32.size.height = v11;
  v19 = CGRectGetMaxY(v32) - v18;
  -[CKEditableCollectionViewCell contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v21 = (CGRectGetWidth(v33) - v16) * 0.5;
  v22 = roundf(v21);

  objc_msgSend(v14, "setFrame:", v22, v19, v16, v18);
  -[CKTranscriptLabelCell label](self, "label");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptLabelCell label](self, "label");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[CKTranscriptLabelCell label](self, "label");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "attributedText");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      -[CKTranscriptLabelCell label](self, "label");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "attributedText");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "boundingRectWithSize:options:context:", 1, 0, v9, 1.79769313e308);
      v13 = v30;

    }
  }
  objc_msgSend(v23, "setNumberOfLines:", 0);
  objc_msgSend(v23, "setFrame:", v5, v19 - v13, v9, v13);

}

- (void)addFilter:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptBlockContactCell;
  v4 = a3;
  -[CKTranscriptStampCell addFilter:](&v8, sel_addFilter_, v4);
  -[CKTranscriptBlockContactCell blockContactButton](self, "blockContactButton", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentAlpha");
  v7 = v6;

  objc_msgSend(v5, "setAlpha:", v7);
}

- (void)clearFilters
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptBlockContactCell;
  -[CKTranscriptStampCell clearFilters](&v4, sel_clearFilters);
  -[CKTranscriptBlockContactCell blockContactButton](self, "blockContactButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

}

- (void)setAttributedButtonText:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CKTranscriptBlockContactCell attributedButtonText](self, "attributedButtonText");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[CKTranscriptBlockContactCell blockContactButton](self, "blockContactButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttributedTitle:forState:", v6, 0);

    -[CKTranscriptBlockContactCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSAttributedString)attributedButtonText
{
  void *v2;
  void *v3;

  -[CKTranscriptBlockContactCell blockContactButton](self, "blockContactButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedTitleForState:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

+ (id)blockContactButton
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transcriptButtonContentEdgeInsets");
  objc_msgSend(v2, "setContentEdgeInsets:");

  objc_msgSend(v2, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberOfLines:", 0);

  return v2;
}

- (UIButton)blockContactButton
{
  return self->_blockContactButton;
}

- (void)setBlockContactButton:(id)a3
{
  objc_storeStrong((id *)&self->_blockContactButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockContactButton, 0);
}

@end
