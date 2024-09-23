@implementation IMSatelliteSuppressedNotificationChatItem

- (id)_initWithHandle:(id)a3
{
  id v5;
  id *v6;
  id *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMSatelliteSuppressedNotificationChatItem;
  v6 = -[IMChatItem _initWithItem:](&v9, sel__initWithItem_, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong(v6 + 7, a3);

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
