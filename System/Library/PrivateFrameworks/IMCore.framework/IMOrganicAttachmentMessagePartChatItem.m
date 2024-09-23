@implementation IMOrganicAttachmentMessagePartChatItem

- (id)_initWithAttachmentMessagePartChatItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "_item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "index");
  v8 = objc_msgSend(v4, "messagePartRange");
  v10 = v9;
  objc_msgSend(v4, "transferGUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chatContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visibleAssociatedMessageChatItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[IMAttachmentMessagePartChatItem _initWithItem:text:index:messagePartRange:transferGUID:chatContext:visibleAssociatedMessageChatItems:](self, "_initWithItem:text:index:messagePartRange:transferGUID:chatContext:visibleAssociatedMessageChatItems:", v5, v6, v7, v8, v10, v11, v12, v13);
  return v14;
}

- (id)layoutGroupIdentifier
{
  void *v2;
  void *v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "guid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isAttachmentContiguousWithChatItem:(id)a3
{
  return 0;
}

- (BOOL)supportsSuggestedActionsMenu
{
  return 0;
}

@end
