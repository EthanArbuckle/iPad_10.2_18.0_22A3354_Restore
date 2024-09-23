@implementation IMAggregateAttachmentMessagePartChatItem

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)IMAggregateAttachmentMessagePartChatItem;
  -[IMAttachmentMessagePartChatItem description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[[%@] transferGUIDs: %@]"), v4, self->_transferGUIDs);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)replyContextPreviewChatItemForReply:(id)a3 chatContext:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v18;
  IMReplyContextAggregateAttachmentMessagePartChatItem *v19;

  v5 = a3;
  v19 = [IMReplyContextAggregateAttachmentMessagePartChatItem alloc];
  -[IMChatItem _item](self, "_item");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "guid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isFromMe");
  -[IMMessagePartChatItem text](self, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[IMMessagePartChatItem index](self, "index");
  v10 = -[IMMessagePartChatItem messagePartRange](self, "messagePartRange");
  v12 = v11;
  -[IMAggregateAttachmentMessagePartChatItem transferGUIDs](self, "transferGUIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTranscriptChatItem chatContext](self, "chatContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[IMReplyContextAggregateAttachmentMessagePartChatItem _initWithItem:parentItem:replyMessageGUID:replyIsFromMe:text:index:messagePartRange:transferGUIDs:chatContext:](v19, "_initWithItem:parentItem:replyMessageGUID:replyIsFromMe:text:index:messagePartRange:transferGUIDs:chatContext:", v18, v5, v6, v7, v8, v9, v10, v12, v13, v14);

  -[IMAggregateAttachmentMessagePartChatItem aggregateAttachmentParts](self, "aggregateAttachmentParts");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAggregateAttachmentParts:", v16);

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *transferGUIDs;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = objc_alloc((Class)objc_opt_class());
  -[IMChatItem _item](self, "_item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessagePartChatItem text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IMMessagePartChatItem index](self, "index");
  v8 = -[IMMessagePartChatItem messagePartRange](self, "messagePartRange");
  v10 = v9;
  transferGUIDs = self->_transferGUIDs;
  -[IMTranscriptChatItem chatContext](self, "chatContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMMessagePartChatItem visibleAssociatedMessageChatItems](self, "visibleAssociatedMessageChatItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v4, "_initWithItem:text:index:messagePartRange:transferGUIDs:chatContext:visibleAssociatedMessageChatItems:", v5, v6, v7, v8, v10, transferGUIDs, v12, v13);

  -[IMAggregateAttachmentMessagePartChatItem aggregateAttachmentParts](self, "aggregateAttachmentParts");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAggregateAttachmentParts:", v15);

  return v14;
}

- (BOOL)isAttachmentContiguousWithChatItem:(id)a3
{
  return 0;
}

- (id)_initWithItem:(id)a3 text:(id)a4 index:(int64_t)a5 messagePartRange:(_NSRange)a6 transferGUIDs:(id)a7 chatContext:(id)a8
{
  return -[IMAggregateAttachmentMessagePartChatItem _initWithItem:text:index:messagePartRange:transferGUIDs:chatContext:visibleAssociatedMessageChatItems:](self, "_initWithItem:text:index:messagePartRange:transferGUIDs:chatContext:visibleAssociatedMessageChatItems:", a3, a4, a5, a6.location, a6.length, a7, a8, 0);
}

- (id)_initWithItem:(id)a3 text:(id)a4 index:(int64_t)a5 messagePartRange:(_NSRange)a6 transferGUIDs:(id)a7 chatContext:(id)a8 visibleAssociatedMessageChatItems:(id)a9
{
  NSUInteger length;
  NSUInteger location;
  id v15;
  id v16;
  id v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  objc_super v26;

  length = a6.length;
  location = a6.location;
  v15 = a3;
  v16 = a7;
  v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)IMAggregateAttachmentMessagePartChatItem;
  v18 = -[IMMessagePartChatItem _initWithItem:text:index:messagePartRange:visibleAssociatedMessageChatItems:](&v26, sel__initWithItem_text_index_messagePartRange_visibleAssociatedMessageChatItems_, v15, a4, a5, location, length, a9);
  if (v18)
  {
    objc_msgSend(v15, "guid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)sub_1A2132A84();

    objc_msgSend(v18, "_setGUID:", v20);
    v21 = objc_msgSend(v16, "copy");
    v22 = (void *)v18[26];
    v18[26] = v21;

    objc_msgSend(v18, "setChatContext:", v17);
    v23 = (void *)v18[26];
    if (!v23 || !objc_msgSend(v23, "count"))
    {
      IMLogHandleForCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        sub_1A2196BA0(v18, v24);

    }
  }

  return v18;
}

- (BOOL)supportsSuggestedActionsMenu
{
  return 0;
}

- (NSArray)transferGUIDs
{
  return self->_transferGUIDs;
}

- (NSArray)aggregateAttachmentParts
{
  return self->_aggregateAttachmentParts;
}

- (void)setAggregateAttachmentParts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregateAttachmentParts, 0);
  objc_storeStrong((id *)&self->_transferGUIDs, 0);
}

@end
