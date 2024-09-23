@implementation IMStewieSharingSummaryChatItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[IMChatItem _item](self, "_item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "_initWithItem:", v5);

  return v6;
}

- (id)_initWithItem:(id)a3 emergencyUserHandle:(id)a4 chat:(id)a5
{
  id v8;
  id v9;
  id v10;
  id *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)IMStewieSharingSummaryChatItem;
  v11 = -[IMChatItem _initWithItem:](&v16, sel__initWithItem_, v8);
  if (v11)
  {
    objc_msgSend(v8, "guid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)sub_1A2132A84();

    objc_msgSend(v11, "_setGUID:", v14);
    objc_storeStrong(v11 + 7, a4);
    objc_storeWeak(v11 + 8, v10);

  }
  return v11;
}

- (id)handle
{
  return self->_handle;
}

- (IMChat)chat
{
  return (IMChat *)objc_loadWeakRetained((id *)&self->_chat);
}

- (void)setChat:(id)a3
{
  objc_storeWeak((id *)&self->_chat, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chat);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
