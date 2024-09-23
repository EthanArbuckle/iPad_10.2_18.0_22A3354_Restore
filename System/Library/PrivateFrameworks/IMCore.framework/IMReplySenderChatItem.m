@implementation IMReplySenderChatItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[IMChatItem _item](self, "_item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSenderChatItem handle](self, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "_initWithItem:handle:", v5, v6);

  return v7;
}

- (id)_initWithItem:(id)a3 handle:(id)a4 threadIdentifier:(id)a5
{
  id v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)IMReplySenderChatItem;
  v9 = -[IMSenderChatItem _initWithItem:handle:](&v13, sel__initWithItem_handle_, a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    v11 = (void *)v9[10];
    v9[10] = v10;

  }
  return v9;
}

- (id)threadIdentifier
{
  return self->_threadIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
}

@end
