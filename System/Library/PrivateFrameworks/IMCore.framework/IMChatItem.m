@implementation IMChatItem

- (BOOL)itemIsReply
{
  BOOL v3;
  void *v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 0;
  }
  if (-[IMChatItem isReplyContextPreview](self, "isReplyContextPreview"))
    return 0;
  -[IMChatItem threadIdentifier](self, "threadIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "length") != 0;

  return v3;
}

- (BOOL)itemIsReplyContextPreview
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[IMChatItem isReplyContextPreview](self, "isReplyContextPreview");
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0 && -[IMChatItem isReplyContextPreview](self, "isReplyContextPreview");
}

- (BOOL)itemIsThreadOriginator
{
  return -[IMChatItem itemIsThreadOriginatorWithThreadIdentifier:](self, "itemIsThreadOriginatorWithThreadIdentifier:", 0);
}

- (BOOL)itemIsThreadOriginatorWithThreadIdentifier:(id *)a3
{
  IMChatItem *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  IMChatItem *v9;
  uint64_t v10;
  id v11;

  if (-[IMChatItem isReplyContextPreview](self, "isReplyContextPreview"))
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = self;
      v10 = -[IMChatItem replyCount](v9, "replyCount");
      v7 = v10 != 0;
      if (!a3 || !v10)
        goto LABEL_11;
      IMCreateThreadIdentifierForRetractedMessagePartChatItem(v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    return 0;
  }
  v5 = self;
  v6 = -[IMChatItem replyCount](v5, "replyCount");
  v7 = v6 != 0;
  if (!a3 || !v6)
    goto LABEL_11;
  IMCreateThreadIdentifierForMessagePartChatItem(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v11 = objc_retainAutorelease(v8);
  *a3 = v11;

  v7 = 1;
LABEL_11:

  return v7;
}

- (id)threadGroupIdentifier
{
  IMChatItem *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  IMChatItem *v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = self;
    -[IMChatItem threadIdentifier](v3, "threadIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v5 = -[IMChatItem isReplyContextPreview](v3, "isReplyContextPreview");
      v6 = -[IMChatItem replyCount](v3, "replyCount");
      if ((v5 & 1) != 0 || v6)
      {
        IMCreateThreadIdentifierForMessagePartChatItem(v3);
        v7 = objc_claimAutoreleasedReturnValue();
LABEL_10:
        v4 = (void *)v7;
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = self;
    -[IMChatItem threadIdentifier](v8, "threadIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      if (-[IMChatItem replyCount](v8, "replyCount"))
      {
        IMCreateThreadIdentifierForRetractedMessagePartChatItem(v8);
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
LABEL_12:
      v4 = 0;
    }
LABEL_13:

    return v4;
  }
  v4 = 0;
  return v4;
}

- (BOOL)itemIsReplyCount
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)IMChatItem;
  -[IMChatItem description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), v4, self->_item);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithItem:", self->_item);
}

- (BOOL)canDelete
{
  return 0;
}

- (BOOL)canRetract
{
  return 0;
}

- (BOOL)canEditMessageText
{
  return 0;
}

- (BOOL)canReply
{
  return 0;
}

- (BOOL)supportsCommunicationSafety
{
  return 0;
}

- (void)setNeedsReloadForTransferStatusChangeWithType:(int64_t)a3
{
  if (a3 == 1)
  {
    if (!-[IMChatItem supportsCommunicationSafety](self, "supportsCommunicationSafety"))
      return;
    a3 = 1;
  }
  self->_fileTransferReloadStatus = a3;
}

- (NSString)itemGUID
{
  return (NSString *)-[IMItem guid](self->_item, "guid");
}

- (id)_initWithItem:(id)a3
{
  id v5;
  IMChatItem *v6;
  IMChatItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMChatItem;
  v6 = -[IMChatItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_item, a3);

  return v7;
}

- (id)_item
{
  return self->_item;
}

- (id)_parentItem
{
  return self->_item;
}

- (id)_timeStale
{
  return 0;
}

- (id)_timeAdded
{
  return 0;
}

- (NSString)balloonBundleID
{
  void *v2;
  void *v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "balloonBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isEditedMessageHistory
{
  return 0;
}

- (BOOL)isReplyContextPreview
{
  return 0;
}

- (NSString)threadIdentifier
{
  return 0;
}

- (int64_t)syndicationBehavior
{
  return 0;
}

- (BOOL)isHighlighted
{
  return 0;
}

- (int64_t)syndicationType
{
  return 0;
}

- (BOOL)wasDetonated
{
  return 0;
}

- (NSString)commSafetyTransferGUID
{
  return self->_commSafetyTransferGUID;
}

- (int64_t)fileTransferReloadStatus
{
  return self->_fileTransferReloadStatus;
}

- (IMItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_commSafetyTransferGUID, 0);
}

@end
