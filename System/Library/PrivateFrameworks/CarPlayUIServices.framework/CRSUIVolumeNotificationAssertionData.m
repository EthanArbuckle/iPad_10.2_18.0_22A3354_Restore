@implementation CRSUIVolumeNotificationAssertionData

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (BOOL)blockNotification
{
  return self->_blockNotification;
}

- (void)setBlockNotification:(BOOL)a3
{
  self->_blockNotification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
