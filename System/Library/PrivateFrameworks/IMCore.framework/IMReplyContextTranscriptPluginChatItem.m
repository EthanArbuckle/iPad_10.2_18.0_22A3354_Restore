@implementation IMReplyContextTranscriptPluginChatItem

- (id)_initWithItem:(id)a3 parentItem:(id)a4 replyMessageGUID:(id)a5 replyIsFromMe:(BOOL)a6 initialPayload:(id)a7 index:(int64_t)a8 messagePartRange:(_NSRange)a9 parentChatHasKnownParticipants:(BOOL)a10 chatContext:(id)a11
{
  id v16;
  id v17;
  id v18;
  id *v19;
  void *v20;
  void *v21;
  id obj;
  id v26;
  objc_super v27;

  v16 = a3;
  v26 = a4;
  obj = a5;
  v17 = a5;
  v18 = a11;
  v27.receiver = self;
  v27.super_class = (Class)IMReplyContextTranscriptPluginChatItem;
  v19 = -[IMTranscriptPluginChatItem _initWithItem:initialPayload:index:messagePartRange:parentChatHasKnownParticipants:](&v27, sel__initWithItem_initialPayload_index_messagePartRange_parentChatHasKnownParticipants_, v16, a7, a8, a9.location, a9.length, a10);
  if (v19)
  {
    objc_msgSend(v16, "guid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)sub_1A2132A84();

    objc_msgSend(v19, "_setGUID:", v21);
    objc_msgSend(v19, "setChatContext:", v18);
    objc_storeStrong(v19 + 27, a4);
    *((_BYTE *)v19 + 200) = a6;
    objc_storeStrong(v19 + 28, obj);
    objc_storeStrong(v19 + 26, a3);

  }
  return v19;
}

- (BOOL)isReplyContextPreview
{
  return 1;
}

- (BOOL)canDelete
{
  return 0;
}

- (IMMessageItem)messageItem
{
  return self->_messageItem;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyMessageGUID, 0);
  objc_storeStrong((id *)&self->_parentItem, 0);
  objc_storeStrong((id *)&self->_messageItem, 0);
}

@end
