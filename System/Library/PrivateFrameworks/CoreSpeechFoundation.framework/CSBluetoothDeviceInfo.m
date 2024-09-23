@implementation CSBluetoothDeviceInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

- (NSString)address
{
  return self->_address;
}

- (BOOL)supportDoAP
{
  return self->_supportDoAP;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setSupportDoAP:(BOOL)a3
{
  self->_supportDoAP = a3;
}

- (BOOL)supportMph
{
  return self->_supportMph;
}

- (void)setSupportMph:(BOOL)a3
{
  self->_supportMph = a3;
}

- (BOOL)isTemporaryPairedNotInContacts
{
  return self->_isTemporaryPairedNotInContacts;
}

- (void)setIsTemporaryPairedNotInContacts:(BOOL)a3
{
  self->_isTemporaryPairedNotInContacts = a3;
}

@end
