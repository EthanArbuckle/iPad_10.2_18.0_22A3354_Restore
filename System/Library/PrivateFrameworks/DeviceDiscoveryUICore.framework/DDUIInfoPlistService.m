@implementation DDUIInfoPlistService

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p; identifier: \"%@\"; usageDescription: \"%@\"; deviceTypes: %llx>"),
               objc_opt_class(),
               self,
               self->_identifier,
               self->_usageDescription,
               self->_deviceTypes);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)usageDescription
{
  return self->_usageDescription;
}

- (void)setUsageDescription:(id)a3
{
  objc_storeStrong((id *)&self->_usageDescription, a3);
}

- (unsigned)deviceTypes
{
  return self->_deviceTypes;
}

- (void)setDeviceTypes:(unsigned int)a3
{
  self->_deviceTypes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageDescription, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
