@implementation CKExpirableMessageChatItem

- (BOOL)canCopy
{
  _BOOL4 v3;
  objc_super v5;

  if (-[CKMessagePartChatItem isFromMe](self, "isFromMe")
    || (v3 = -[CKExpirableMessageChatItem isSaved](self, "isSaved")))
  {
    v5.receiver = self;
    v5.super_class = (Class)CKExpirableMessageChatItem;
    LOBYTE(v3) = -[CKAttachmentMessagePartChatItem canCopy](&v5, sel_canCopy);
  }
  return v3;
}

- (BOOL)canForward
{
  _BOOL4 v3;
  objc_super v5;

  if (-[CKMessagePartChatItem isFromMe](self, "isFromMe")
    || (v3 = -[CKExpirableMessageChatItem isSaved](self, "isSaved")))
  {
    v5.receiver = self;
    v5.super_class = (Class)CKExpirableMessageChatItem;
    LOBYTE(v3) = -[CKAttachmentMessagePartChatItem canForward](&v5, sel_canForward);
  }
  return v3;
}

- (BOOL)canExport
{
  _BOOL4 v3;
  objc_super v5;

  if (-[CKMessagePartChatItem isFromMe](self, "isFromMe")
    || (v3 = -[CKExpirableMessageChatItem isSaved](self, "isSaved")))
  {
    v5.receiver = self;
    v5.super_class = (Class)CKExpirableMessageChatItem;
    LOBYTE(v3) = -[CKAttachmentMessagePartChatItem canExport](&v5, sel_canExport);
  }
  return v3;
}

- (BOOL)canSendAsTextMessage
{
  return 0;
}

- (BOOL)isPlayed
{
  void *v2;
  char v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPlayed");

  return v3;
}

- (BOOL)isSaved
{
  void *v2;
  char v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSaved");

  return v3;
}

@end
