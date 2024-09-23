@implementation IMReplyContextTextMessagePartChatItem

- (id)_initWithItem:(id)a3 parentItem:(id)a4 replyMessageGUID:(id)a5 replyIsFromMe:(BOOL)a6 text:(id)a7 index:(int64_t)a8 messagePartRange:(_NSRange)a9 subject:(id)a10
{
  id v15;
  id v16;
  id *v17;
  void *v18;
  void *v19;
  char v21;
  _BOOL4 v22;
  char v23;
  id v24;
  objc_super v25;

  v22 = a6;
  v15 = a3;
  v24 = a4;
  v16 = a5;
  v25.receiver = self;
  v25.super_class = (Class)IMReplyContextTextMessagePartChatItem;
  v21 = 0;
  v17 = -[IMTextMessagePartChatItem _initWithItem:text:index:messagePartRange:subject:isShowingEditHistory:](&v25, sel__initWithItem_text_index_messagePartRange_subject_isShowingEditHistory_, v15, a7, a8, a9.location, a9.length, a10, v21);
  if (v17)
  {
    objc_msgSend(v15, "guid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)sub_1A2132A84();

    objc_msgSend(v17, "_setGUID:", v19);
    objc_storeStrong(v17 + 24, a4);
    *((_BYTE *)v17 + 184) = v23;
    objc_storeStrong(v17 + 25, a5);

  }
  return v17;
}

- (id)_initWithItem:(id)a3 parentItem:(id)a4 replyMessageGUID:(id)a5 replyIsFromMe:(BOOL)a6 text:(id)a7 index:(int64_t)a8 messagePartRange:(_NSRange)a9 subject:(id)a10 shouldDisplayLink:(BOOL)a11
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
  v25.super_class = (Class)IMReplyContextTextMessagePartChatItem;
  v18 = -[IMTextMessagePartChatItem _initWithItem:text:index:messagePartRange:subject:shouldDisplayLink:isShowingEditHistory:](&v25, sel__initWithItem_text_index_messagePartRange_subject_shouldDisplayLink_isShowingEditHistory_, v16, a7, a8, a9.location, a9.length, a10, a11);
  if (v18)
  {
    objc_msgSend(v16, "guid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)sub_1A2132A84();

    objc_msgSend(v18, "_setGUID:", v20);
    objc_storeStrong(v18 + 24, a4);
    *((_BYTE *)v18 + 184) = a6;
    objc_storeStrong(v18 + 25, obj);

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
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyMessageGUID, 0);
  objc_storeStrong((id *)&self->_parentItem, 0);
}

@end
