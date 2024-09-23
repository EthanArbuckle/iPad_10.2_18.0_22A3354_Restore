@implementation IMLocationUpdateSentChatItem

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

- (id)_initWithItem:(id)a3 chatIdentifier:(id)a4
{
  id v6;
  id v7;
  id *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMLocationUpdateSentChatItem;
  v8 = -[IMChatItem _initWithItem:](&v12, sel__initWithItem_, v6);
  if (v8)
  {
    objc_msgSend(v6, "guid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)sub_1A2132A84();

    objc_msgSend(v8, "_setGUID:", v10);
    objc_storeStrong(v8 + 7, a4);

  }
  return v8;
}

- (NSString)chatIdentifier
{
  return self->_chatIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatIdentifier, 0);
}

@end
