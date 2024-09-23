@implementation _CUTextureLink

- (void)setNamedTexture:(id)a3
{
  if (self->_namedTexture != a3)
    self->_namedTexture = (CUINamedTexture *)a3;
}

- (id)namedTexture
{
  return self->_namedTexture;
}

- (id)bufferAllocator
{
  return self->_bufferAllocator;
}

- (void)setBufferAllocator:(id)a3
{
  if (self->_bufferAllocator != a3)
    self->_bufferAllocator = (TXRBufferAllocator *)a3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CUTextureLink;
  -[_CUTextureLink dealloc](&v3, sel_dealloc);
}

- (id)provideTextureInfo
{
  return objc_msgSend(objc_msgSend(-[_CUTextureLink namedTexture](self, "namedTexture"), "_rendition"), "provideTextureInfo");
}

- (id)provideImageInfoAtLevel:(unint64_t)a3 element:(unint64_t)a4 face:(unint64_t)a5
{
  return objc_msgSend(objc_msgSend(-[_CUTextureLink namedTexture](self, "namedTexture"), "_rendition"), "provideImageInfoAtLevel:element:face:withBufferAllocator:", a3, a4, a5, -[_CUTextureLink bufferAllocator](self, "bufferAllocator"));
}

@end
