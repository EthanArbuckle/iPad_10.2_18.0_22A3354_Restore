@implementation IMGroupActionChatItem

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

- (int64_t)actionType
{
  void *v2;
  int64_t v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "actionType");

  return v3;
}

- (NSArray)fileTransferGUIDs
{
  void *v2;
  void *v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileTransferGUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)_initWithItem:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  id *v8;
  id *v9;
  int v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)IMGroupActionChatItem;
  v8 = -[IMChatItem _initWithItem:](&v16, sel__initWithItem_, v6);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(v8 + 8, a4);
    *((_BYTE *)v9 + 56) = objc_msgSend(v6, "errorCode") != 0;
    v10 = objc_msgSend(v7, "isBusiness");
    v11 = CFSTR("a:");
    if (v10)
      v11 = CFSTR("ba:");
    v12 = v11;
    objc_msgSend(v6, "guid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)sub_1A2132A84();

    objc_msgSend(v9, "_setGUID:", v14);
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
