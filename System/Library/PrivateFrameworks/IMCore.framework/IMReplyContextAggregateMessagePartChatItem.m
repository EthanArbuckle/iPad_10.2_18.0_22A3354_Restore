@implementation IMReplyContextAggregateMessagePartChatItem

- (id)_initWithItem:(id)a3 parentItem:(id)a4 replyMessageGUID:(id)a5 replyIsFromMe:(BOOL)a6 messagePartRange:(_NSRange)a7 subparts:(id)a8
{
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  id v16;
  id *v17;
  void *v18;
  void *v19;
  objc_super v21;

  length = a7.length;
  location = a7.location;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v21.receiver = self;
  v21.super_class = (Class)IMReplyContextAggregateMessagePartChatItem;
  v17 = -[IMAggregateMessagePartChatItem _initWithItem:messagePartRange:subparts:](&v21, sel__initWithItem_messagePartRange_subparts_, v14, location, length, a8);
  if (v17)
  {
    objc_msgSend(v14, "guid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)sub_1A2132A84();

    objc_msgSend(v17, "_setGUID:", v19);
    objc_storeStrong(v17 + 25, a4);
    *((_BYTE *)v17 + 192) = a6;
    objc_storeStrong(v17 + 26, a5);

  }
  return v17;
}

- (BOOL)isReplyContextPreview
{
  return 1;
}

- (BOOL)canDelete
{
  return 0;
}

- (BOOL)supportsSuggestedActionsMenu
{
  return 0;
}

- (IMItem)_parentItem
{
  return self->_parentItem;
}

- (void)set_parentItem:(id)a3
{
  objc_storeStrong((id *)&self->_parentItem, a3);
}

- (BOOL)replyIsFromMe
{
  return self->_replyIsFromMe;
}

- (void)setReplyIsFromMe:(BOOL)a3
{
  self->_replyIsFromMe = a3;
}

- (NSString)replyMessageGUID
{
  return self->_replyMessageGUID;
}

- (void)setReplyMessageGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyMessageGUID, 0);
  objc_storeStrong((id *)&self->_parentItem, 0);
}

@end
