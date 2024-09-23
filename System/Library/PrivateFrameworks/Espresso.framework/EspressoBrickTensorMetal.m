@implementation EspressoBrickTensorMetal

- (MTLTexture)texture
{
  return (MTLTexture *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTexture:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_texture, 0);
}

@end
