@implementation IMGroupTitleChangeChatItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[IMChatItem _item](self, "_item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "_initWithItem:sender:", v5, self->_sender);

  return v6;
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_initWithItem:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  id *v8;
  id *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IMGroupTitleChangeChatItem;
  v8 = -[IMChatItem _initWithItem:](&v13, sel__initWithItem_, v6);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(v8 + 8, a4);
    *((_BYTE *)v9 + 56) = objc_msgSend(v6, "errorCode") != 0;
    objc_msgSend(v6, "guid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)sub_1A2132A84();

    objc_msgSend(v9, "_setGUID:", v11);
  }

  return v9;
}

- (IMHandle)sender
{
  return self->_sender;
}

- (BOOL)failed
{
  return self->_failed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sender, 0);
}

@end
