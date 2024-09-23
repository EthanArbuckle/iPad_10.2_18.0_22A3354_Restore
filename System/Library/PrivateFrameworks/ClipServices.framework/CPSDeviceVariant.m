@implementation CPSDeviceVariant

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setOsVersion:(id)a3
{
  objc_storeStrong((id *)&self->_osVersion, a3);
}

- (NSString)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (NSNumber)size
{
  return self->_size;
}

- (void)setSize:(id)a3
{
  objc_storeStrong((id *)&self->_size, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
}

@end
