@implementation _NUVideoPropertiesResult

- (NUVideoProperties)properties
{
  return (NUVideoProperties *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
