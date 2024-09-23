@implementation HKClinicalSampleAccountProvider

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (HKClinicalSampleAccountProviderGateway)gateway
{
  return self->_gateway;
}

- (void)setGateway:(id)a3
{
  objc_storeStrong((id *)&self->_gateway, a3);
}

- (int64_t)minCompatibleAPIVersion
{
  return self->_minCompatibleAPIVersion;
}

- (void)setMinCompatibleAPIVersion:(int64_t)a3
{
  self->_minCompatibleAPIVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gateway, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
