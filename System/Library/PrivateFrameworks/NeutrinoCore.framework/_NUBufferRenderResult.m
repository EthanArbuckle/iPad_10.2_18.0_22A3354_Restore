@implementation _NUBufferRenderResult

- (NUBufferImage)image
{
  return (NUBufferImage *)objc_getProperty(self, a2, 32, 1);
}

- (void)setImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
