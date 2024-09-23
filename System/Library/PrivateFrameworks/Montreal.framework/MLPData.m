@implementation MLPData

- (unsigned)label
{
  return self->_label;
}

- (void)setLabel:(unsigned int)a3
{
  self->_label = a3;
}

- (NSData)oneHot
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOneHot:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSData)pixels
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPixels:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSData)classDist
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setClassDist:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classDist, 0);
  objc_storeStrong((id *)&self->_pixels, 0);
  objc_storeStrong((id *)&self->_oneHot, 0);
}

@end
