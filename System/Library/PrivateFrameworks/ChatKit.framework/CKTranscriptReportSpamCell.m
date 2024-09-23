@implementation CKTranscriptReportSpamCell

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
  int v23;
  void *v24;
  objc_super v25;
  uint64_t v26;
  _QWORD v27[2];

  v9 = a5;
  v27[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    IMLogHandleForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CKTranscriptReportSpamCell(CKChatItem) configureForChatItem:context:animated:animationDuration:animationCurve:].cold.1();

    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0D36350];
    v26 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Calling into configureForChatItem: with an unexpected type: %@"), objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 0, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "forceAutoBugCaptureWithSubType:errorPayload:type:context:", CFSTR("WrongChatItemForCKTranscriptCell"), v19, CFSTR("CKTranscriptReportSpamCell"), 0);

  }
  if (!CKIsRunningInMacCatalyst())
  {
    v25.receiver = self;
    v25.super_class = (Class)CKTranscriptReportSpamCell;
    -[CKTranscriptStampCell configureForChatItem:context:animated:animationDuration:animationCurve:](&v25, sel_configureForChatItem_context_animated_animationDuration_animationCurve_, v12, v13, v9, a7, a6);
    objc_msgSend(v12, "transcriptText");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptLabelCell setAttributedText:](self, "setAttributedText:", v21);

    if (CKIsRunningInMessagesNotificationExtension()
      || (objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          v23 = objc_msgSend(v22, "isSatelliteConnectionActive"),
          v22,
          v23))
    {
      -[CKTranscriptReportSpamCell reportSpamButton](self, "reportSpamButton");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setHidden:", 1);
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_10:
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[CKTranscriptReportSpamCell setShowReportSMSSpam:](self, "setShowReportSMSSpam:", objc_msgSend(v12, "showReportSMSSpam"));
        goto LABEL_12;
      }
      objc_msgSend(v12, "transcriptButtonText");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKTranscriptReportSpamCell setAttributedButtonText:](self, "setAttributedButtonText:", v24);
    }

    goto LABEL_10;
  }
LABEL_12:

}

- (CKTranscriptReportSpamCell)initWithFrame:(CGRect)a3
{
  CKTranscriptReportSpamCell *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UILabel *internalPhishingWarningLabel;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKTranscriptReportSpamCell;
  v3 = -[CKTranscriptLabelCell initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    if (!CKIsRunningInMacCatalyst())
    {
      objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "transcriptLabelAccessoryButtonConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setConfiguration:", v6);

      -[CKEditableCollectionViewCell contentView](v3, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", v4);

      -[CKTranscriptReportSpamCell setReportSpamButton:](v3, "setReportSpamButton:", v4);
    }
    if (IMShouldHandleInternalPhishingAttempts())
    {
      objc_msgSend((id)objc_opt_class(), "internalPhishingWarningLabel");
      v8 = objc_claimAutoreleasedReturnValue();
      internalPhishingWarningLabel = v3->_internalPhishingWarningLabel;
      v3->_internalPhishingWarningLabel = (UILabel *)v8;

      -[CKEditableCollectionViewCell contentView](v3, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", v3->_internalPhishingWarningLabel);

    }
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[CKTranscriptReportSpamCell layoutSizeForWidth:applyLayout:](self, "layoutSizeForWidth:applyLayout:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviewsForAlignmentContents
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptReportSpamCell;
  -[CKTranscriptStampCell layoutSubviewsForAlignmentContents](&v4, sel_layoutSubviewsForAlignmentContents);
  -[CKTranscriptStampCell contentAlignmentRect](self, "contentAlignmentRect");
  -[CKTranscriptReportSpamCell layoutSizeForWidth:applyLayout:](self, "layoutSizeForWidth:applyLayout:", 1, v3);
}

- (CGSize)layoutSizeForWidth:(double)a3 applyLayout:(BOOL)a4
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UILabel *internalPhishingWarningLabel;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double MaxY;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  CGFloat v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  CGFloat v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double r2;
  double v73;
  double v74;
  double v75;
  CGSize result;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptStampCell contentAlignmentRect](self, "contentAlignmentRect");
  v8 = v7;
  v10 = v9;
  v11 = (double *)MEMORY[0x1E0C9D648];
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  objc_msgSend(v6, "phishingWarningEdgeInsets");
  v74 = v16;
  internalPhishingWarningLabel = self->_internalPhishingWarningLabel;
  v70 = v8;
  if (internalPhishingWarningLabel)
  {
    v18 = v14;
    v19 = v15;
    -[UILabel attributedText](internalPhishingWarningLabel, "attributedText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "boundingRectWithSize:options:context:", 1, 0, a3 - (v18 + v19), 1.79769313e308);
    v22 = v21;
    v24 = v23;

    v25 = v8 + floor((v10 - v22) * 0.5);
    v26 = 0.0;
  }
  else
  {
    v25 = *v11;
    v26 = v11[1];
    v24 = v12;
    v22 = v13;
  }
  -[CKTranscriptLabelCell label](self, "label");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTranscriptLabelCell label](self, "label");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[CKTranscriptLabelCell label](self, "label");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "attributedText");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      -[CKTranscriptLabelCell label](self, "label");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "attributedText");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "boundingRectWithSize:options:context:", 1, 0, a3, 1.79769313e308);
      v13 = v34;
      v12 = v35;

    }
  }
  v78.origin.x = v25;
  v78.origin.y = v26;
  v78.size.width = v22;
  v78.size.height = v24;
  MaxY = CGRectGetMaxY(v78);
  v37 = 0.0;
  if (v24 > 0.0)
    v37 = v74;
  v73 = v25;
  v75 = v26;
  v38 = v37 + MaxY;
  v39 = v12;
  v40 = v13;
  v69 = v24;
  r2 = v22;
  v41 = v70 + floor((v10 - v13) * 0.5);
  objc_msgSend(v27, "setNumberOfLines:", 0);
  -[CKTranscriptReportSpamCell reportSpamButton](self, "reportSpamButton");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "sizeThatFits:", a3, 1.79769313e308);
  v44 = v43;
  v68 = v45;
  v46 = v70 + floor((v10 - v43) * 0.5);
  v79.origin.x = v41;
  v79.origin.y = v38;
  v79.size.width = v13;
  v79.size.height = v39;
  v47 = CGRectGetMaxY(v79);
  objc_msgSend(v42, "configuration");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "background");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "cornerRadius");
  v51 = v47 + v50 * 0.5;

  if (a4)
  {
    v52 = v69;
    -[UILabel setFrame:](self->_internalPhishingWarningLabel, "setFrame:", v73, v75, r2, v69);
    objc_msgSend(v27, "setFrame:", v41, v38, v40, v39);
    v71 = v41;
    v53 = v38;
    v54 = v40;
    v55 = v68;
    objc_msgSend(v42, "setFrame:", v46, v51, v44, v68);
    objc_msgSend(v42, "__ck_ensureMinimumTouchInsets");
    v56 = v46;
    v57 = v39;
    v58 = v53;
    v41 = v71;
  }
  else
  {
    v56 = v46;
    v57 = v39;
    v58 = v38;
    v54 = v13;
    v55 = v68;
    v52 = v69;
  }
  v59 = v41;
  v60 = v54;
  v61 = v51;
  v62 = v44;
  v63 = v55;
  v80 = CGRectUnion(*(CGRect *)(&v58 - 1), *(CGRect *)&v56);
  v82.origin.x = v73;
  v82.origin.y = v75;
  v82.size.width = r2;
  v82.size.height = v52;
  v81 = CGRectUnion(v80, v82);
  v64 = 0.0;
  if (44.0 - v55 > 0.0)
    v64 = (44.0 - v55) * 0.5;
  v65 = v81.size.height + v64;

  v66 = a3;
  v67 = v65;
  result.height = v67;
  result.width = v66;
  return result;
}

- (void)addFilter:(id)a3
{
  id v4;
  void *v5;
  UILabel *internalPhishingWarningLabel;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CKTranscriptReportSpamCell;
  -[CKTranscriptStampCell addFilter:](&v7, sel_addFilter_, v4);
  -[CKTranscriptReportSpamCell reportSpamButton](self, "reportSpamButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentAlpha");
  objc_msgSend(v5, "setAlpha:");
  internalPhishingWarningLabel = self->_internalPhishingWarningLabel;
  if (internalPhishingWarningLabel)
  {
    objc_msgSend(v4, "contentAlpha");
    -[UILabel setAlpha:](internalPhishingWarningLabel, "setAlpha:");
  }

}

- (void)clearFilters
{
  void *v3;
  UILabel *internalPhishingWarningLabel;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKTranscriptReportSpamCell;
  -[CKTranscriptStampCell clearFilters](&v5, sel_clearFilters);
  -[CKTranscriptReportSpamCell reportSpamButton](self, "reportSpamButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);
  internalPhishingWarningLabel = self->_internalPhishingWarningLabel;
  if (internalPhishingWarningLabel)
    -[UILabel setAlpha:](internalPhishingWarningLabel, "setAlpha:", 1.0);

}

- (void)setAttributedButtonText:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CKTranscriptReportSpamCell attributedButtonText](self, "attributedButtonText");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[CKTranscriptReportSpamCell reportSpamButton](self, "reportSpamButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttributedTitle:forState:", v6, 0);

    -[CKTranscriptReportSpamCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSAttributedString)attributedButtonText
{
  void *v2;
  void *v3;

  -[CKTranscriptReportSpamCell reportSpamButton](self, "reportSpamButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedTitleForState:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

+ (id)internalPhishingWarningLabel
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CEA700]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v4, "setNumberOfLines:", 0);
  objc_msgSend(v4, "setTextAlignment:", 1);
  objc_msgSend(a1, "internalPhishingWarning");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributedText:", v5);

  return v4;
}

+ (NSAttributedString)internalPhishingWarning
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "phishingWarningTextAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationPreferringMulticolor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("exclamationmark.triangle.fill"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentWithImage:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttachment:attributes:", v6, v3);
  v8 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(CFSTR(" "), "stringByAppendingString:", *MEMORY[0x1E0D39570]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithString:attributes:", v9, v3);

  objc_msgSend(v7, "appendAttributedString:", v10);
  return (NSAttributedString *)v7;
}

- (void)prepareForReuse
{
  int v3;
  UILabel *internalPhishingWarningLabel;
  void *v5;
  int v6;
  UILabel *v7;
  UILabel *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKTranscriptReportSpamCell;
  -[CKTranscriptStampCell prepareForReuse](&v9, sel_prepareForReuse);
  v3 = IMShouldHandleInternalPhishingAttempts();
  internalPhishingWarningLabel = self->_internalPhishingWarningLabel;
  if (internalPhishingWarningLabel && (v3 & 1) == 0)
  {
    -[UILabel removeFromSuperview](self->_internalPhishingWarningLabel, "removeFromSuperview");
    v5 = self->_internalPhishingWarningLabel;
    self->_internalPhishingWarningLabel = 0;
LABEL_9:

    -[CKTranscriptReportSpamCell setNeedsLayout](self, "setNeedsLayout");
    return;
  }
  if (internalPhishingWarningLabel)
    v6 = 0;
  else
    v6 = v3;
  if (v6 == 1)
  {
    objc_msgSend((id)objc_opt_class(), "internalPhishingWarningLabel");
    v7 = (UILabel *)objc_claimAutoreleasedReturnValue();
    v8 = self->_internalPhishingWarningLabel;
    self->_internalPhishingWarningLabel = v7;

    -[CKEditableCollectionViewCell contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", self->_internalPhishingWarningLabel);
    goto LABEL_9;
  }
}

- (UIButton)reportSpamButton
{
  return self->_reportSpamButton;
}

- (void)setReportSpamButton:(id)a3
{
  objc_storeStrong((id *)&self->_reportSpamButton, a3);
}

- (BOOL)showReportSMSSpam
{
  return self->_showReportSMSSpam;
}

- (void)setShowReportSMSSpam:(BOOL)a3
{
  self->_showReportSMSSpam = a3;
}

- (UILabel)internalPhishingWarningLabel
{
  return self->_internalPhishingWarningLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalPhishingWarningLabel, 0);
  objc_storeStrong((id *)&self->_reportSpamButton, 0);
}

@end
