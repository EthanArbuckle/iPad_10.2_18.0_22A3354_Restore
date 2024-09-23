@implementation _NUAuxiliaryImageRenderResult

- (NUAuxiliaryImage)auxiliaryImage
{
  return (NUAuxiliaryImage *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAuxiliaryImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryImage, 0);
}

@end
