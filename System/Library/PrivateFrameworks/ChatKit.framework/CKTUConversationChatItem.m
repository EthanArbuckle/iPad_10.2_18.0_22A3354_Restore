@implementation CKTUConversationChatItem

- (BOOL)canCopy
{
  return 0;
}

- (BOOL)canForward
{
  return 0;
}

- (BOOL)canSendAsTextMessage
{
  return 0;
}

- (BOOL)canInlineReply
{
  return 0;
}

- (BOOL)canAttachStickers
{
  return 0;
}

- (BOOL)canSendTapbacks
{
  return 0;
}

- (id)message
{
  return 0;
}

- (id)messageItem
{
  return 0;
}

- (int64_t)stewieConversationID
{
  return 0;
}

- (Class)balloonViewClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldCacheSize
{
  return 0;
}

- (void)configureBalloonView:(id)a3
{
  objc_msgSend(a3, "configureForTUConversationChatItem:", self);
}

- (id)time
{
  void *v2;
  void *v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "time");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sender
{
  void *v2;
  void *v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "conversationInitiator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (char)color
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1E0D35818];
  -[CKTUConversationChatItem faceTimeConversation](self, "faceTimeConversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "conversationIsAVLessSharePlay:", v3);

  if ((_DWORD)v2)
    return -1;
  else
    return 7;
}

- (NSUUID)tuConversationUUID
{
  void *v2;
  void *v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tuConversationUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (id)faceTimeConversation
{
  void *v2;
  void *v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tuConversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isSendersUnknown
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isSenderUnknown"))
  {
    objc_msgSend(v2, "chatContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasResponded") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (unint64_t)conversationAVMode
{
  void *v2;
  unint64_t v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "conversationAVMode");

  return v3;
}

- (BOOL)isSenderUnknown
{
  return self->_senderUnknown;
}

@end
