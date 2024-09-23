@implementation IMRichActionFooterChatItem

- (id)_initWithItem:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IMRichActionFooterChatItem;
  v5 = -[IMChatItem _initWithItem:](&v11, sel__initWithItem_, v4);
  if (v5)
  {
    objc_msgSend(v4, "guid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", CFSTR("IMRichActionFooter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setGUID:", v7);

    objc_msgSend(v4, "_senderHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v5[7];
    v5[7] = v8;

  }
  return v5;
}

- (BOOL)isFromMe
{
  void *v2;
  char v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFromMe");

  return v3;
}

- (id)handle
{
  return self->_handle;
}

- (NSString)extensionName
{
  return self->_extensionName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionName, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
