@implementation CKPinnedConversationTapbackBubbleActivityItem

- (CKPinnedConversationTapbackBubbleActivityItem)initWithMessage:(id)a3 contentScale:(double)a4 attachedContactItemIdentifier:(id)a5
{
  id v9;
  id v10;
  CKPinnedConversationTapbackBubbleActivityItem *v11;
  CKPinnedConversationTapbackBubbleActivityItem *v12;
  uint64_t v13;
  NSString *attachedContactItemIdentifier;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CKPinnedConversationTapbackBubbleActivityItem;
  v11 = -[CKPinnedConversationTapbackBubbleActivityItem init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_message, a3);
    v12->_activityItemContentScale = a4;
    v13 = objc_msgSend(v10, "copy");
    attachedContactItemIdentifier = v12->_attachedContactItemIdentifier;
    v12->_attachedContactItemIdentifier = (NSString *)v13;

  }
  return v12;
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
  return -[CKPinnedConversationTapbackBubble initWithActivityItem:]([CKPinnedConversationTapbackBubble alloc], "initWithActivityItem:", self);
}

- (NSString)attachedContactItemIdentifier
{
  return self->_attachedContactItemIdentifier;
}

- (double)activityItemContentScale
{
  return self->_activityItemContentScale;
}

- (IMMessage)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_attachedContactItemIdentifier, 0);
}

@end
