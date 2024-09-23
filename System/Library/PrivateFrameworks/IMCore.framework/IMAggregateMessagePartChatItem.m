@implementation IMAggregateMessagePartChatItem

- (id)replyContextPreviewChatItemForReply:(id)a3 chatContext:(id)a4
{
  id v5;
  IMReplyContextAggregateMessagePartChatItem *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v5 = a3;
  v6 = [IMReplyContextAggregateMessagePartChatItem alloc];
  -[IMChatItem _item](self, "_item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "guid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isFromMe");
  v10 = -[IMMessagePartChatItem messagePartRange](self, "messagePartRange");
  v12 = v11;
  -[IMAggregateMessagePartChatItem subparts](self, "subparts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[IMReplyContextAggregateMessagePartChatItem _initWithItem:parentItem:replyMessageGUID:replyIsFromMe:messagePartRange:subparts:](v6, "_initWithItem:parentItem:replyMessageGUID:replyIsFromMe:messagePartRange:subparts:", v7, v5, v8, v9, v10, v12, v13);

  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)IMAggregateMessagePartChatItem;
  -[IMTextMessagePartChatItem description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[[%@] subparts: %@]"), v4, self->_subparts);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = objc_alloc((Class)objc_opt_class());
  -[IMChatItem _item](self, "_item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IMMessagePartChatItem messagePartRange](self, "messagePartRange");
  v8 = (void *)objc_msgSend(v4, "_initWithItem:messagePartRange:subparts:", v5, v6, v7, self->_subparts);

  return v8;
}

- (id)_initWithItem:(id)a3 messagePartRange:(_NSRange)a4 subparts:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  objc_super v22;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "subject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v9, "subject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithString:", v13);

  }
  else
  {
    v14 = 0;
  }

  objc_msgSend(v9, "body");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22.receiver = self;
  v22.super_class = (Class)IMAggregateMessagePartChatItem;
  v16 = -[IMTextMessagePartChatItem _initWithItem:text:index:messagePartRange:subject:isShowingEditHistory:](&v22, sel__initWithItem_text_index_messagePartRange_subject_isShowingEditHistory_, v9, v15, 0, location, length, v14, 0);

  if (v16)
  {
    objc_msgSend(v9, "guid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)sub_1A2132A84();

    objc_msgSend(v16, "_setGUID:", v18);
    v19 = objc_msgSend(v10, "copy");
    v20 = (void *)v16[23];
    v16[23] = v19;

  }
  return v16;
}

- (BOOL)supportsSuggestedActionsMenu
{
  return 1;
}

- (NSArray)subparts
{
  return self->_subparts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subparts, 0);
}

@end
