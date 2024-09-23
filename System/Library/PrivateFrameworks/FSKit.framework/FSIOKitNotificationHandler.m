@implementation FSIOKitNotificationHandler

- (FSBlockDeviceResource)resource
{
  return (FSBlockDeviceResource *)objc_loadWeakRetained((id *)&self->_resource);
}

- (void)setResource:(id)a3
{
  objc_storeWeak((id *)&self->_resource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_resource);
}

@end
