@implementation CKPinnedConversationRichLinkActivityItem

- (CKPinnedConversationRichLinkActivityItem)initWithMessage:(id)a3 chatContext:(id)a4 contentScale:(double)a5 attachedContactItemIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  CKPinnedConversationRichLinkActivityItem *v14;
  CKPinnedConversationRichLinkActivityItem *v15;
  uint64_t v16;
  NSString *attachedContactItemIdentifier;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CKPinnedConversationRichLinkActivityItem;
  v14 = -[CKPinnedConversationRichLinkActivityItem init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_message, a3);
    objc_storeStrong((id *)&v15->_chatContext, a4);
    v15->_activityItemContentScale = a5;
    v16 = objc_msgSend(v13, "copy");
    attachedContactItemIdentifier = v15->_attachedContactItemIdentifier;
    v15->_attachedContactItemIdentifier = (NSString *)v16;

  }
  return v15;
}

- (CKPinnedConversationRichLinkActivityItem)initWithLinkView:(id)a3
{
  id v5;
  CKPinnedConversationRichLinkActivityItem *v6;
  CKPinnedConversationRichLinkActivityItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKPinnedConversationRichLinkActivityItem;
  v6 = -[CKPinnedConversationRichLinkActivityItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_linkView, a3);

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
  return -[CKPinnedConversationRichLinkBubble initWithRichLinkActivityItem:]([CKPinnedConversationRichLinkBubble alloc], "initWithRichLinkActivityItem:", self);
}

- (NSString)attachedContactItemIdentifier
{
  return self->_attachedContactItemIdentifier;
}

- (id)linkPreviewContentView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  -[CKPinnedConversationRichLinkActivityItem message](self, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKPinnedConversationRichLinkActivityItem message](self, "message");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinnedConversationRichLinkActivityItem chatContext](self, "chatContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "richLinkDataSourceWithChatContext:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc(MEMORY[0x1E0CC11C8]);
    objc_msgSend(v6, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithURL:", v8);

    objc_msgSend(v6, "richLinkMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMetadata:", v10);

    objc_msgSend(v9, "_setPreferredSizeClass:", 7);
    objc_msgSend(v9, "_setApplyCornerRadius:", 0);
    objc_msgSend(v9, "_setDisableTapGesture:", 1);
    objc_msgSend(v9, "_setDisableAnimations:", 1);
    objc_msgSend(v9, "_setForceFlexibleWidth:", 1);

  }
  else
  {
    -[CKPinnedConversationRichLinkActivityItem linkView](self, "linkView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[CKPinnedConversationRichLinkActivityItem linkView](self, "linkView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v9;
}

- (double)activityItemContentScale
{
  return self->_activityItemContentScale;
}

- (IMMessage)message
{
  return self->_message;
}

- (IMChatContext)chatContext
{
  return self->_chatContext;
}

- (LPLinkView)linkView
{
  return self->_linkView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkView, 0);
  objc_storeStrong((id *)&self->_chatContext, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_attachedContactItemIdentifier, 0);
}

@end
