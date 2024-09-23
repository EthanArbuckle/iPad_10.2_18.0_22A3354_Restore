@implementation CKPinnedConversationSummaryBubbleActivityItem

- (CKPinnedConversationSummaryBubbleActivityItem)initWithMessage:(id)a3 chat:(id)a4 contentScale:(double)a5 attachedContactItemIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  CKPinnedConversationSummaryBubbleActivityItem *v14;
  CKPinnedConversationSummaryBubbleActivityItem *v15;
  uint64_t v16;
  NSString *attachedContactItemIdentifier;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CKPinnedConversationSummaryBubbleActivityItem;
  v14 = -[CKPinnedConversationSummaryBubbleActivityItem init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_message, a3);
    objc_storeStrong((id *)&v15->_chat, a4);
    v15->_activityItemContentScale = a5;
    v16 = objc_msgSend(v13, "copy");
    attachedContactItemIdentifier = v15->_attachedContactItemIdentifier;
    v15->_attachedContactItemIdentifier = (NSString *)v16;

  }
  return v15;
}

- (CKPinnedConversationSummaryBubbleActivityItem)initWithSummaryText:(id)a3
{
  id v5;
  CKPinnedConversationSummaryBubbleActivityItem *v6;
  CKPinnedConversationSummaryBubbleActivityItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKPinnedConversationSummaryBubbleActivityItem;
  v6 = -[CKPinnedConversationSummaryBubbleActivityItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_summaryText, a3);

  return v7;
}

- (NSString)activityItemIdentifier
{
  return (NSString *)-[IMMessage guid](self->_message, "guid");
}

- (BOOL)activityItemAppearsWithAnimation
{
  return 1;
}

- (BOOL)activityItemDisappearsWithAnimation
{
  return 1;
}

- (id)activityItemView
{
  return -[CKPinnedConversationSummaryBubble initWithSummaryBubbleActivityItem:]([CKPinnedConversationSummaryBubble alloc], "initWithSummaryBubbleActivityItem:", self);
}

- (NSString)attachedContactItemIdentifier
{
  return self->_attachedContactItemIdentifier;
}

- (id)summaryLabelFontForContentScale:(int64_t)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;

  if (a3 == 1)
  {
    v3 = (id)*MEMORY[0x1E0CEB590];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "conversationListPinnedConversationPreviewFontSizeOverrideLarge");
  }
  else
  {
    if (a3)
    {
      v3 = 0;
      v6 = 0.0;
      goto LABEL_7;
    }
    v3 = (id)*MEMORY[0x1E0CEB558];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "conversationListPinnedConversationPreviewFontSizeOverrideStandard");
  }
  v6 = v5;

LABEL_7:
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v3, 0x8000, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)summaryLabelTextColorForUserInterfaceStyle:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;

  if ((unint64_t)a3 >= 2)
  {
    if (a3 != 2)
      return 0;
    v3 = (void *)MEMORY[0x1E0CEA478];
    v4 = 0.9;
    v5 = 1.0;
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0CEA478];
    v4 = 0.8;
    v5 = 0.0;
  }
  objc_msgSend(v3, "colorWithWhite:alpha:", v5, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)summaryAttributedStringForContentScale:(int64_t)a3 userInterfaceStyle:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;

  -[CKPinnedConversationSummaryBubbleActivityItem summaryLabelFontForContentScale:](self, "summaryLabelFontForContentScale:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPinnedConversationSummaryBubbleActivityItem summaryLabelTextColorForUserInterfaceStyle:](self, "summaryLabelTextColorForUserInterfaceStyle:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v6, "fontDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fontDescriptorWithSymbolicTraits:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fontWithDescriptor:size:", v10, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "theme");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "meMentionTextColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKPinnedConversationSummaryBubbleActivityItem message](self, "message");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPinnedConversationSummaryBubbleActivityItem chat](self, "chat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "__ck_previewTextWithChat:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPinnedConversationSummaryBubbleActivityItem summaryText](self, "summaryText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[CKPinnedConversationSummaryBubbleActivityItem summaryText](self, "summaryText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v19;
    v17 = v20;
  }
  else
  {
    +[CKMentionsUtilities attributedStringByHighlightingMentionsInAttributedString:withFont:textColor:mentionFont:mentionColor:](CKMentionsUtilities, "attributedStringByHighlightingMentionsInAttributedString:withFont:textColor:mentionFont:mentionColor:", v17, v6, v7, v11, v14);
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v20;

  return v21;
}

- (double)activityItemContentScale
{
  return self->_activityItemContentScale;
}

- (IMMessage)message
{
  return self->_message;
}

- (IMChat)chat
{
  return self->_chat;
}

- (NSAttributedString)summaryText
{
  return self->_summaryText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryText, 0);
  objc_storeStrong((id *)&self->_chat, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_attachedContactItemIdentifier, 0);
}

@end
