@implementation AXAuditObjectTransportPropertyEntry

- (NSString)transportKey
{
  return self->_transportKey;
}

- (void)setTransportKey:(id)a3
{
  objc_storeStrong((id *)&self->_transportKey, a3);
}

- (id)localValueToTransportValue
{
  return self->_localValueToTransportValue;
}

- (void)setLocalValueToTransportValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)populateLocalObjectWithTransportValue
{
  return self->_populateLocalObjectWithTransportValue;
}

- (void)setPopulateLocalObjectWithTransportValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_populateLocalObjectWithTransportValue, 0);
  objc_storeStrong(&self->_localValueToTransportValue, 0);
  objc_storeStrong((id *)&self->_transportKey, 0);
}

@end
