@implementation SiriNotificationsSetupModel

- (unsigned)deviceProductID
{
  return self->_deviceProductID;
}

- (void)setDeviceProductID:(unsigned int)a3
{
  self->_deviceProductID = a3;
}

- (BOOL)deviceSupportsInEarDetection
{
  return self->_deviceSupportsInEarDetection;
}

- (void)setDeviceSupportsInEarDetection:(BOOL)a3
{
  self->_deviceSupportsInEarDetection = a3;
}

- (BOOL)isUpsellFlow
{
  return self->_isUpsellFlow;
}

- (void)setIsUpsellFlow:(BOOL)a3
{
  self->_isUpsellFlow = a3;
}

- (BOOL)isSiriAllowedWhileLocked
{
  return self->_isSiriAllowedWhileLocked;
}

- (void)setIsSiriAllowedWhileLocked:(BOOL)a3
{
  self->_isSiriAllowedWhileLocked = a3;
}

- (NSString)localizedDeviceName
{
  return self->_localizedDeviceName;
}

- (void)setLocalizedDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)viewType
{
  return self->_viewType;
}

- (void)setViewType:(int64_t)a3
{
  self->_viewType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDeviceName, 0);
}

@end
