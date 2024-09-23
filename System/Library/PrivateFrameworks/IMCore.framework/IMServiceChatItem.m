@implementation IMServiceChatItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[IMChatItem _item](self, "_item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "_initWithItem:service:handle:", v5, self->_service, self->_handle);

  return v6;
}

- (id)_initWithItem:(id)a3 service:(id)a4 handle:(id)a5
{
  id v8;
  id v9;
  id v10;
  id *v11;
  id *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)IMServiceChatItem;
  v11 = -[IMChatItem _initWithItem:](&v27, sel__initWithItem_, v8);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(v11 + 8, a4);
    objc_storeStrong(v12 + 9, a5);
    objc_msgSend(v9, "name");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (__CFString *)v13;
    else
      v15 = &stru_1E4725068;
    v16 = v15;

    objc_msgSend(v10, "ID");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = (__CFString *)v17;
    else
      v19 = &stru_1E4725068;
    v20 = v19;

    objc_msgSend(v8, "guid");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
      v23 = (__CFString *)v21;
    else
      v23 = &stru_1E4725068;
    v24 = v23;

    v25 = (void *)sub_1A2132A84();
    objc_msgSend(v12, "_setGUID:", v25);

  }
  return v12;
}

- (IMServiceImpl)service
{
  return self->_service;
}

- (IMHandle)handle
{
  return self->_handle;
}

- (BOOL)isStewieSharingChat
{
  return self->_stewieSharingChat;
}

- (void)setStewieSharingChat:(BOOL)a3
{
  self->_stewieSharingChat = a3;
}

- (BOOL)isLiteServiceCapable
{
  return self->_liteServiceCapable;
}

- (void)setLiteServiceCapable:(BOOL)a3
{
  self->_liteServiceCapable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
