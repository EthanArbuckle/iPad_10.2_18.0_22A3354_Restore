@implementation CBBLEServiceDataInfo

- (NSData)serviceData
{
  return self->_serviceData;
}

- (void)setServiceData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)serviceUUID16
{
  return self->_serviceUUID16;
}

- (void)setServiceUUID16:(unsigned __int16)a3
{
  self->_serviceUUID16 = a3;
}

- (BOOL)connectable
{
  return self->_connectable;
}

- (void)setConnectable:(BOOL)a3
{
  self->_connectable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceData, 0);
}

@end
