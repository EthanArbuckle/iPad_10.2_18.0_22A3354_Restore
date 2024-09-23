@implementation ISResourceMetaData

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSNumber)dimension
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDimension:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSNumber)scale
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setScale:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)selectedVariant
{
  return self->_selectedVariant;
}

- (void)setSelectedVariant:(BOOL)a3
{
  self->_selectedVariant = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scale, 0);
  objc_storeStrong((id *)&self->_dimension, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
