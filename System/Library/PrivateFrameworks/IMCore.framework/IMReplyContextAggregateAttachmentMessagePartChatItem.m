@implementation IMReplyContextAggregateAttachmentMessagePartChatItem

- (id)_initWithItem:(id)a3 parentItem:(id)a4 replyMessageGUID:(id)a5 replyIsFromMe:(BOOL)a6 text:(id)a7 index:(int64_t)a8 messagePartRange:(_NSRange)a9 transferGUIDs:(id)a10 chatContext:(id)a11
{
  id v16;
  id v17;
  id *v18;
  void *v19;
  void *v20;
  id obj;
  id v24;
  objc_super v25;

  v16 = a3;
  obj = a5;
  v24 = a4;
  v17 = a5;
  v25.receiver = self;
  v25.super_class = (Class)IMReplyContextAggregateAttachmentMessagePartChatItem;
  v18 = -[IMAggregateAttachmentMessagePartChatItem _initWithItem:text:index:messagePartRange:transferGUIDs:chatContext:](&v25, sel__initWithItem_text_index_messagePartRange_transferGUIDs_chatContext_, v16, a7, a8, a9.location, a9.length, a10, a11);
  if (v18)
  {
    objc_msgSend(v16, "guid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)sub_1A2132A84();

    objc_msgSend(v18, "_setGUID:", v20);
    objc_storeStrong(v18 + 29, a4);
    *((_BYTE *)v18 + 224) = a6;
    objc_storeStrong(v18 + 30, obj);

  }
  return v18;
}

- (id)_initWithItem:(id)a3 parentItem:(id)a4 replyMessageGUID:(id)a5 replyIsFromMe:(BOOL)a6 text:(id)a7 index:(int64_t)a8 messagePartRange:(_NSRange)a9 transferGUIDs:(id)a10 chatContext:(id)a11 visibleAssociatedMessageChatItems:(id)a12
{
  id v16;
  id v17;
  id *v18;
  void *v19;
  void *v20;
  id obj;
  id v24;
  id v26;
  objc_super v27;

  v16 = a3;
  obj = a4;
  v26 = a4;
  v24 = a5;
  v17 = a5;
  v27.receiver = self;
  v27.super_class = (Class)IMReplyContextAggregateAttachmentMessagePartChatItem;
  v18 = -[IMAggregateAttachmentMessagePartChatItem _initWithItem:text:index:messagePartRange:transferGUIDs:chatContext:visibleAssociatedMessageChatItems:](&v27, sel__initWithItem_text_index_messagePartRange_transferGUIDs_chatContext_visibleAssociatedMessageChatItems_, v16, a7, a8, a9.location, a9.length, a10, a11, a12);
  if (v18)
  {
    objc_msgSend(v16, "guid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)sub_1A2132A84();

    objc_msgSend(v18, "_setGUID:", v20);
    objc_storeStrong(v18 + 29, obj);
    *((_BYTE *)v18 + 224) = a6;
    objc_storeStrong(v18 + 30, v24);

  }
  return v18;
}

- (BOOL)isReplyContextPreview
{
  return 1;
}

- (BOOL)canDelete
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyMessageGUID, 0);
  objc_storeStrong((id *)&self->_parentItem, 0);
}

@end
