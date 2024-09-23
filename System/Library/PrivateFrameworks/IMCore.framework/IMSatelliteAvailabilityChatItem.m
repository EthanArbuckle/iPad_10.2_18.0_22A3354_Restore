@implementation IMSatelliteAvailabilityChatItem

- (id)_initWithHandle:(id)a3
{
  id v5;
  id *v6;
  id *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IMSatelliteAvailabilityChatItem;
  v6 = -[IMChatItem _initWithItem:](&v11, sel__initWithItem_, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(v6 + 7, a3);
    objc_msgSend(v7[7], "ID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)sub_1A2132A84();

    objc_msgSend(v7, "_setGUID:", v9);
  }

  return v7;
}

- (IMHandle)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
