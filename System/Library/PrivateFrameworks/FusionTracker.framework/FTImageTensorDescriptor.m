@implementation FTImageTensorDescriptor

+ (id)descriptorWithName:(id)a3 size:(CGSize)a4 pixelFormat:(unsigned int)a5
{
  uint64_t v5;
  double height;
  double width;
  id v8;
  FTImageTensorDescriptor *v9;

  v5 = *(_QWORD *)&a5;
  height = a4.height;
  width = a4.width;
  v8 = a3;
  v9 = objc_alloc_init(FTImageTensorDescriptor);
  -[FTImageTensorDescriptor setName:](v9, "setName:", v8);
  -[FTImageTensorDescriptor setSize:](v9, "setSize:", width, height);
  -[FTImageTensorDescriptor setPixelFormat:](v9, "setPixelFormat:", v5);

  return v9;
}

+ (id)bgraImageWithName:(id)a3 size:(CGSize)a4
{
  objc_msgSend(a1, "descriptorWithName:size:pixelFormat:", a3, 1111970369, a4.width, a4.height);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)bgraSquareImageWithName:(id)a3 size:(double)a4
{
  objc_msgSend(a1, "bgraImageWithName:size:", a3, a4, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unsigned int)a3
{
  self->_pixelFormat = a3;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
