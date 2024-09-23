@implementation IMNumberChangedChatItem

- (id)_initWithItem:(id)a3 senderHandle:(id)a4
{
  id v6;
  id v7;
  id *v8;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMNumberChangedChatItem;
  v8 = -[IMChatItem _initWithItem:](&v14, sel__initWithItem_, v6);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(v8 + 7, a4);
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "guid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@%@"), CFSTR("nc:"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "_setGUID:", v12);
  }

  return v9;
}

- (NSString)sender
{
  return self->_sender;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sender, 0);
}

@end
