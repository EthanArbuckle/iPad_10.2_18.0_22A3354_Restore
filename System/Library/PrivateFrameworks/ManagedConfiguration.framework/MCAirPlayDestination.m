@implementation MCAirPlayDestination

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceID, a3);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_storeStrong((id *)&self->_password, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end
