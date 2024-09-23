@implementation IMMessageReplyCountChatItem

- (id)_initWithItem:(id)a3 parentItem:(id)a4 threadIdentifier:(id)a5 replyMessageGUID:(id)a6 replyIsFromMe:(BOOL)a7 count:(unint64_t)a8 statusItemSequenceNumber:(unint64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id obj;
  BOOL v29;
  objc_super v30;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v30.receiver = self;
  v30.super_class = (Class)IMMessageReplyCountChatItem;
  v19 = -[IMMessageStatusChatItem _initWithItem:statusType:time:count:expireStatusType:statusItemSequenceNumber:](&v30, sel__initWithItem_statusType_time_count_expireStatusType_statusItemSequenceNumber_, v15, 16, 0, a8, 0, a9);
  if (v19)
  {
    objc_msgSend(v15, "guid");
    v29 = a7;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringValue");
    obj = a6;
    v22 = v16;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)sub_1A2132A84();

    v16 = v22;
    objc_msgSend(v19, "_setGUID:", v24);
    objc_storeStrong(v19 + 16, a4);
    v25 = objc_msgSend(v17, "copy");
    v26 = v19[17];
    v19[17] = (id)v25;

    objc_storeStrong(v19 + 18, obj);
    *((_BYTE *)v19 + 120) = v29;

  }
  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  -[IMMessageStatusChatItem messageItem](self, "messageItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithItem:parentItem:threadIdentifier:replyMessageGUID:replyIsFromMe:count:statusItemSequenceNumber:", v4, self->_parentItem, self->_threadIdentifier, self->_replyMessageGUID, self->_replyIsFromMe, -[IMMessageStatusChatItem count](self, "count"), -[IMMessageStatusChatItem statusItemSequenceNumber](self, "statusItemSequenceNumber"));

  return v5;
}

- (id)copyWithStatusItemSequenceNumber:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[IMMessageStatusChatItem messageItem](self, "messageItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithItem:parentItem:threadIdentifier:replyMessageGUID:replyIsFromMe:count:statusItemSequenceNumber:", v5, self->_parentItem, self->_threadIdentifier, self->_replyMessageGUID, self->_replyIsFromMe, -[IMMessageStatusChatItem count](self, "count"), a3);

  return v6;
}

- (IMItem)_parentItem
{
  return self->_parentItem;
}

- (void)set_parentItem:(id)a3
{
  objc_storeStrong((id *)&self->_parentItem, a3);
}

- (id)threadIdentifier
{
  return self->_threadIdentifier;
}

- (BOOL)replyIsFromMe
{
  return self->_replyIsFromMe;
}

- (NSString)replyMessageGUID
{
  return self->_replyMessageGUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyMessageGUID, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_parentItem, 0);
}

@end
