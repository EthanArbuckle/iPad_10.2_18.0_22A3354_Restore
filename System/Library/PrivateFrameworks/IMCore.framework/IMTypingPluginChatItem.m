@implementation IMTypingPluginChatItem

- (NSString)type
{
  return -[IMBalloonPluginDataSource bundleID](self->_dataSource, "bundleID");
}

- (id)_initWithItem:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMTypingPluginChatItem;
  v8 = -[IMTypingChatItem _initWithItem:](&v14, sel__initWithItem_, v6);
  if (v8)
  {
    objc_msgSend(v6, "guid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)sub_1A2132A84();

    objc_msgSend(v8, "_setGUID:", v10);
    objc_msgSend(v8, "setDataSource:", v7);
    objc_msgSend(v6, "typingIndicatorIcon");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v8[7];
    v8[7] = v11;

  }
  return v8;
}

- (NSData)typingIndicatorIcon
{
  return self->_typingIndicatorIcon;
}

- (IMBalloonPluginDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_typingIndicatorIcon, 0);
}

@end
