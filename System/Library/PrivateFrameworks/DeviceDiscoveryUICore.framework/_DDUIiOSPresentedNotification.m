@implementation _DDUIiOSPresentedNotification

- (DDUIApplicationInfo)applicationInfo
{
  return self->_applicationInfo;
}

- (void)setApplicationInfo:(id)a3
{
  objc_storeStrong((id *)&self->_applicationInfo, a3);
}

- (NSString)notificationID
{
  return self->_notificationID;
}

- (void)setNotificationID:(id)a3
{
  objc_storeStrong((id *)&self->_notificationID, a3);
}

- (NSString)remoteDeviceIdentifier
{
  return self->_remoteDeviceIdentifier;
}

- (void)setRemoteDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDeviceIdentifier, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_remoteDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationID, 0);
  objc_storeStrong((id *)&self->_applicationInfo, 0);
}

@end
