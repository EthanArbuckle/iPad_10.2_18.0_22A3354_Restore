@implementation CUNetInterfaceInfo

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)ipv4String
{
  return self->_ipv4String;
}

- (void)setIpv4String:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ipv4String, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
}

@end
