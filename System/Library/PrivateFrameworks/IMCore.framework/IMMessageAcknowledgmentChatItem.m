@implementation IMMessageAcknowledgmentChatItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc((Class)objc_opt_class());
  -[IMChatItem _item](self, "_item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAssociatedMessageChatItem sender](self, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAssociatedMessageChatItem tapback](self, "tapback");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "_initWithItem:sender:tapback:", v5, v6, v7);

  return v8;
}

- (id)_initWithItem:(id)a3 sender:(id)a4 tapback:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v8 = a5;
  v9 = -[IMAssociatedMessageChatItem _initWithItem:sender:](self, "_initWithItem:sender:", a3, a4);
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "setTapback:", v8);
    v12 = 10;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v10, "_setGeometryDescriptor:", &v12);
  }

  return v10;
}

- (BOOL)isEqualToTapback:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;

  v4 = a3;
  v5 = -[IMAssociatedMessageChatItem associatedMessageType](self, "associatedMessageType");
  if (v5 != objc_msgSend(v4, "associatedMessageType"))
    goto LABEL_6;
  if (-[IMAssociatedMessageChatItem associatedMessageType](self, "associatedMessageType") != 2006)
    goto LABEL_5;
  -[IMAssociatedMessageChatItem associatedMessageEmoji](self, "associatedMessageEmoji");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "associatedMessageEmoji");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7
    || (-[IMAssociatedMessageChatItem associatedMessageEmoji](self, "associatedMessageEmoji"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "associatedMessageEmoji"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "isEqual:", v9),
        v9,
        v8,
        (v10 & 1) != 0))
  {
LABEL_5:
    v11 = 1;
  }
  else
  {
LABEL_6:
    v11 = 0;
  }

  return v11;
}

- (BOOL)containsTransferGUID:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[IMMessageAcknowledgmentChatItem fileTransferGUIDs](self, "fileTransferGUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (NSArray)fileTransferGUIDs
{
  void *v2;
  void *v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileTransferGUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)supportsCommunicationSafety
{
  return 1;
}

- (id)commSafetyTransferGUID
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[IMAssociatedMessageChatItem tapback](self, "tapback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[IMAssociatedMessageChatItem tapback](self, "tapback");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transferGUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (IMMessage)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

@end
