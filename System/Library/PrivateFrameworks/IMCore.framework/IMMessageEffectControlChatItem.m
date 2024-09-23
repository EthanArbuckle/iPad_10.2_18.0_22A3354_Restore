@implementation IMMessageEffectControlChatItem

- (id)_initWithItem:(id)a3 effectStyleID:(id)a4 statusItemSequenceNumber:(unint64_t)a5
{
  id v9;
  id *v10;
  id *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IMMessageEffectControlChatItem;
  v10 = -[IMMessageStatusChatItem _initWithItem:statusType:time:count:expireStatusType:statusItemSequenceNumber:](&v13, sel__initWithItem_statusType_time_count_expireStatusType_statusItemSequenceNumber_, a3, 13, 0, 0, 0, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong(v10 + 15, a4);

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  -[IMMessageStatusChatItem messageItem](self, "messageItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithItem:effectStyleID:statusItemSequenceNumber:", v4, self->_effectStyleID, -[IMMessageStatusChatItem statusItemSequenceNumber](self, "statusItemSequenceNumber"));

  return v5;
}

- (id)copyWithStatusItemSequenceNumber:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[IMMessageStatusChatItem messageItem](self, "messageItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithItem:effectStyleID:statusItemSequenceNumber:", v5, self->_effectStyleID, a3);

  return v6;
}

- (NSString)effectStyleID
{
  return self->_effectStyleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectStyleID, 0);
}

@end
