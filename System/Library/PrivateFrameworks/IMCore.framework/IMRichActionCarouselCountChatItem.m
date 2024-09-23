@implementation IMRichActionCarouselCountChatItem

- (id)_initWithItem:(id)a3 selectedIndex:(int64_t)a4 totalCount:(int64_t)a5
{
  id v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IMRichActionCarouselCountChatItem;
  v9 = -[IMChatItem _initWithItem:](&v15, sel__initWithItem_, v8);
  if (v9)
  {
    objc_msgSend(v8, "guid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("rcc:"), "stringByAppendingString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setGUID:", v11);

    objc_msgSend(v8, "_senderHandle");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v9[7];
    v9[7] = v12;

    v9[8] = a4;
    v9[9] = a5;
  }

  return v9;
}

+ (id)richCardCountChatItemGUIDPrefix
{
  return CFSTR("rcc:");
}

- (id)handle
{
  return self->_handle;
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (int64_t)totalCount
{
  return self->_totalCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
