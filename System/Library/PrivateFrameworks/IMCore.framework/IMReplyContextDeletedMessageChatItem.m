@implementation IMReplyContextDeletedMessageChatItem

- (id)_initWithReplyItem:(id)a3 threadIdentifier:(id)a4 replyMessageGUID:(id)a5 replyIsFromMe:(BOOL)a6 deletedMessageIsFromMe:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  objc_super v19;

  v7 = a7;
  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v19.receiver = self;
  v19.super_class = (Class)IMReplyContextDeletedMessageChatItem;
  v15 = -[IMChatItem _initWithItem:](&v19, sel__initWithItem_, v12);
  if (v15)
  {
    objc_msgSend(v12, "guid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)sub_1A2132A84();

    objc_msgSend(v15, "_setGUID:", v17);
    objc_msgSend(v15, "set_parentItem:", v12);
    objc_msgSend(v15, "setReplyIsFromMe:", v8);
    objc_msgSend(v15, "setDeletedMessageIsFromMe:", v7);
    objc_msgSend(v15, "setReplyMessageGUID:", v14);

  }
  return v15;
}

- (BOOL)isFromMe
{
  return self->_deletedMessageIsFromMe;
}

- (BOOL)deletedMessageIsFromMe
{
  return self->_deletedMessageIsFromMe;
}

- (void)setDeletedMessageIsFromMe:(BOOL)a3
{
  self->_deletedMessageIsFromMe = a3;
}

@end
