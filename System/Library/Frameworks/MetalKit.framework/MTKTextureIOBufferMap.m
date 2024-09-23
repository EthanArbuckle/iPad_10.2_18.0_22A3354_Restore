@implementation MTKTextureIOBufferMap

- (MTKTextureIOBufferMap)initWithContents:(void *)a3
{
  MTKTextureIOBufferMap *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTKTextureIOBufferMap;
  result = -[MTKTextureIOBufferMap init](&v5, sel_init);
  if (result)
    result->_bytes = a3;
  return result;
}

- (void)bytes
{
  return self->_bytes;
}

@end
