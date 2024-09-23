@implementation IMMessageChatItem

- (IMMessage)message
{
  void *v2;
  void *v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMMessage *)v3;
}

- (BOOL)isFromMe
{
  void *v2;
  char v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFromMe");

  return v3;
}

- (BOOL)failed
{
  void *v2;
  BOOL v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "errorCode") != 0;

  return v3;
}

- (NSDate)time
{
  void *v2;
  void *v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "time");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (IMHandle)sender
{
  void *v2;
  void *v3;

  -[IMMessageChatItem message](self, "message");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMHandle *)v3;
}

- (BOOL)canReply
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  char v6;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMServiceImpl serviceWithInternalName:](IMServiceImpl, "serviceWithInternalName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (_QWORD *)MEMORY[0x1E0D38E18];
  if ((objc_msgSend(v4, "supportsCapability:", *MEMORY[0x1E0D38E18]) & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v4, "supportsReplicationCapability:", *v5);

  return v6;
}

@end
