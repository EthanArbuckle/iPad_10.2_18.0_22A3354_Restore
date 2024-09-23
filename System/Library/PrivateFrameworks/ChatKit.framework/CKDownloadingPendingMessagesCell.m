@implementation CKDownloadingPendingMessagesCell

- (CKDownloadingPendingMessagesCell)initWithFrame:(CGRect)a3
{
  CKDownloadingPendingMessagesCell *v3;
  CKDownloadingPendingMessagesView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKDownloadingPendingMessagesCell;
  v3 = -[CKTranscriptCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(CKDownloadingPendingMessagesView);
    -[CKEditableCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v4);

    -[CKDownloadingPendingMessagesCell setPendingMessagesContentView:](v3, "setPendingMessagesContentView:", v4);
  }
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
  v12.super_class = (Class)CKDownloadingPendingMessagesCell;
  -[CKEditableCollectionViewCell layoutSubviewsForAlignmentContents](&v12, sel_layoutSubviewsForAlignmentContents);
  -[CKEditableCollectionViewCell contentAlignmentRect](self, "contentAlignmentRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKDownloadingPendingMessagesCell pendingMessagesContentView](self, "pendingMessagesContentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)setPendingMessageCountAttributedText:(id)a3
{
  NSAttributedString *v5;
  NSAttributedString **p_pendingMessageCountAttributedText;
  void *v7;
  NSAttributedString *v8;

  v5 = (NSAttributedString *)a3;
  p_pendingMessageCountAttributedText = &self->_pendingMessageCountAttributedText;
  if (self->_pendingMessageCountAttributedText != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_pendingMessageCountAttributedText, a3);
    -[CKDownloadingPendingMessagesCell pendingMessagesContentView](self, "pendingMessagesContentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateMessageCountWith:", *p_pendingMessageCountAttributedText);

    v5 = v8;
  }

}

- (NSAttributedString)pendingMessageCountAttributedText
{
  return self->_pendingMessageCountAttributedText;
}

- (unint64_t)totalSatelliteMessageCount
{
  return self->_totalSatelliteMessageCount;
}

- (void)setTotalSatelliteMessageCount:(unint64_t)a3
{
  self->_totalSatelliteMessageCount = a3;
}

- (CKDownloadingPendingMessagesView)pendingMessagesContentView
{
  return self->_pendingMessagesContentView;
}

- (void)setPendingMessagesContentView:(id)a3
{
  objc_storeStrong((id *)&self->_pendingMessagesContentView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingMessagesContentView, 0);
  objc_storeStrong((id *)&self->_pendingMessageCountAttributedText, 0);
}

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  uint64_t v9;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __CFString *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v9 = a5;
  v12 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CKDownloadingPendingMessagesCell;
  -[CKTranscriptCell configureForChatItem:context:animated:animationDuration:animationCurve:](&v26, sel_configureForChatItem_context_animated_animationDuration_animationCurve_, v12, a4, v9, a7, a6);
  objc_msgSend(v12, "IMChatItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v9) = objc_opt_isKindOfClass();

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v12, "IMChatItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "pendingIncomingSatelliteMessageCount");
    -[CKDownloadingPendingMessagesCell setTotalSatelliteMessageCount:](self, "setTotalSatelliteMessageCount:", objc_msgSend(v14, "totalSatelliteMessageCount"));
    v16 = -[CKDownloadingPendingMessagesCell totalSatelliteMessageCount](self, "totalSatelliteMessageCount") - v15 + 1;
    v17 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("NUMBER_OF_REMAINING_PENDING_MESSAGES"), &stru_1E276D870, CFSTR("ChatKit-CarrierPigeon"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringWithFormat:", v19, v16, -[CKDownloadingPendingMessagesCell totalSatelliteMessageCount](self, "totalSatelliteMessageCount"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "userInterfaceLayoutDirection");

    if (v22 == 1)
      v23 = CFSTR("\u200F");
    else
      v23 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v23, "stringByAppendingString:", v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v24);
    -[CKDownloadingPendingMessagesCell setPendingMessageCountAttributedText:](self, "setPendingMessageCountAttributedText:", v25);

  }
}

@end
