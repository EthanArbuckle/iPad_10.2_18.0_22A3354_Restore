@implementation _NUAuxiliaryPropertiesResult

- (BOOL)canPropagateOriginalAuxiliaryData
{
  return self->_canPropagateOriginalAuxiliaryData;
}

- (void)setCanPropagateOriginalAuxiliaryData:(BOOL)a3
{
  self->_canPropagateOriginalAuxiliaryData = a3;
}

- (NUImageProperties)properties
{
  return (NUImageProperties *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
