@implementation CURangingSample

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return NSPrintF((uint64_t)"DA %@, Md %@, RSSI %d, Ch %d", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)self->_deviceAddress);
}

- (int)channel
{
  return self->_channel;
}

- (void)setChannel:(int)a3
{
  self->_channel = a3;
}

- (NSData)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setDeviceAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)rawRSSI
{
  return self->_rawRSSI;
}

- (void)setRawRSSI:(int)a3
{
  self->_rawRSSI = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceAddress, 0);
}

@end
