@implementation NEVPNProtocolPlugin

- (NSString)pluginType
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginType, 0);
}

@end
