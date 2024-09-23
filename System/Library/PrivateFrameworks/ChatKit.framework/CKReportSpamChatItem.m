@implementation CKReportSpamChatItem

- (unint64_t)layoutType
{
  return 22;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  CKTranscriptReportSpamCell *sizingCell;
  CKTranscriptReportSpamCell *v8;
  CKTranscriptReportSpamCell *v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  sizingCell = self->_sizingCell;
  if (!sizingCell)
  {
    v8 = objc_alloc_init(CKTranscriptReportSpamCell);
    v9 = self->_sizingCell;
    self->_sizingCell = v8;

    sizingCell = self->_sizingCell;
  }
  -[CKTranscriptReportSpamCell configureForChatItem:context:animated:animationDuration:animationCurve:](sizingCell, "configureForChatItem:context:animated:animationDuration:animationCurve:", self, 0, 0, 3, 0.0);
  -[CKTranscriptReportSpamCell sizeThatFits:](self->_sizingCell, "sizeThatFits:", width, height);
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)loadTranscriptText
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transcriptEmphasizedFontAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CKReportSpamChatItem isGroupChat](self, "isGroupChat"))
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3498]);
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("REPORT_SPAM_GROUP_STATUS");
  }
  else
  {
    v9 = -[CKReportSpamChatItem isBusinessChat](self, "isBusinessChat");
    v5 = objc_alloc(MEMORY[0x1E0CB3498]);
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v9)
      v8 = CFSTR("REPORT_SPAM_BUSINESS_STATUS");
    else
      v8 = CFSTR("REPORT_SPAM_STATUS");
  }
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1E276D870, CFSTR("ChatKit"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v5, "initWithString:attributes:", v10, v4);

  return v11;
}

- (id)transcriptTextForSpam:(BOOL)a3
{
  void *v5;
  const __CFString *v6;
  _BOOL4 v7;
  void *v8;

  if (!-[CKReportSpamChatItem isGroupChat](self, "isGroupChat"))
  {
    v7 = -[CKReportSpamChatItem isBusinessChat](self, "isBusinessChat");
    CKFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (!a3)
      {
        v6 = CFSTR("REPORT_SPAM_BUSINESS_STATUS");
        goto LABEL_10;
      }
    }
    else if (!a3)
    {
      v6 = CFSTR("REPORT_SPAM_STATUS");
      goto LABEL_10;
    }
LABEL_8:
    v6 = CFSTR("REPORTED_SPAM_STATUS");
    goto LABEL_10;
  }
  CKFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    goto LABEL_8;
  v6 = CFSTR("REPORT_SPAM_GROUP_STATUS");
LABEL_10:
  objc_msgSend(v5, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSAttributedString)transcriptButtonText
{
  NSAttributedString *transcriptButtonText;
  void *v4;
  void *v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  NSAttributedString *v12;
  NSAttributedString *v13;

  transcriptButtonText = self->_transcriptButtonText;
  if (!transcriptButtonText)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerTranscriptButtonTextAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[CKReportSpamChatItem showReportSMSSpam](self, "showReportSMSSpam"))
    {
      v6 = -[CKReportSpamChatItem hasMultipleMessages](self, "hasMultipleMessages");
      v7 = objc_alloc(MEMORY[0x1E0CB3498]);
      CKFrameworkBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v6)
        v10 = CFSTR("REPORT_SPAM_SMS_BUTTON_TITLE_ALL");
      else
        v10 = CFSTR("REPORT_SPAM_SMS_BUTTON_TITLE_SINGULAR");
    }
    else
    {
      v7 = objc_alloc(MEMORY[0x1E0CB3498]);
      CKFrameworkBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("REPORT_SPAM_BUTTON_TITLE");
    }
    objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E276D870, CFSTR("ChatKit"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (NSAttributedString *)objc_msgSend(v7, "initWithString:attributes:", v11, v5);
    v13 = self->_transcriptButtonText;
    self->_transcriptButtonText = v12;

    transcriptButtonText = self->_transcriptButtonText;
  }
  return transcriptButtonText;
}

- (NSAttributedString)internalPhishingWarning
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "phishingWarningTextAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x1E0CB3498]);
  v5 = (void *)objc_msgSend(v4, "initWithString:attributes:", *MEMORY[0x1E0D39570], v3);

  return (NSAttributedString *)v5;
}

- (BOOL)isGroupChat
{
  void *v2;
  char v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isGroupMessage");

  return v3;
}

- (BOOL)hasMultipleMessages
{
  void *v2;
  char v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasMultipleMessages");

  return v3;
}

- (BOOL)showReportSMSSpam
{
  void *v2;
  char v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showReportSMSSpam");

  return v3;
}

- (BOOL)isBusinessChat
{
  void *v2;
  char v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBusinessChat");

  return v3;
}

- (void)setTranscriptButtonText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (CKTranscriptReportSpamCell)sizingCell
{
  return self->_sizingCell;
}

- (void)setSizingCell:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizingCell, 0);
  objc_storeStrong((id *)&self->_transcriptButtonText, 0);
}

@end
