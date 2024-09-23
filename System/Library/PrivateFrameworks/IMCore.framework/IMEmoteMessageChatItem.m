@implementation IMEmoteMessageChatItem

- (NSAttributedString)text
{
  void *v2;
  void *v3;

  -[IMMessageChatItem message](self, "message");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (id)_initWithItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMEmoteMessageChatItem;
  v5 = -[IMChatItem _initWithItem:](&v9, sel__initWithItem_, v4);
  if (v5)
  {
    objc_msgSend(v4, "guid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)sub_1A2132A84();

    objc_msgSend(v5, "_setGUID:", v7);
  }

  return v5;
}

@end
