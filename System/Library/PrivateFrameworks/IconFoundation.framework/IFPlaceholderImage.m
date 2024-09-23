@implementation IFPlaceholderImage

- (IFPlaceholderImage)initWithImage:(id)a3
{
  id v5;
  id *v6;
  IFPlaceholderImage *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IFPlaceholderImage;
  v6 = -[IFImage _init](&v9, sel__init);
  v7 = (IFPlaceholderImage *)v6;
  if (v6)
    objc_storeStrong(v6 + 5, a3);

  return v7;
}

- (CGSize)size
{
  double v2;
  double v3;
  CGSize result;

  -[IFImage size](self->_image, "size");
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)iconSize
{
  double v2;
  double v3;
  CGSize result;

  -[IFImage iconSize](self->_image, "iconSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)scale
{
  double result;

  -[IFImage scale](self->_image, "scale");
  return result;
}

- (CGImage)CGImage
{
  return (CGImage *)-[IFImage CGImage](self->_image, "CGImage");
}

- (CGSize)minimumSize
{
  double v2;
  double v3;
  CGSize result;

  -[IFImage minimumSize](self->_image, "minimumSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)validationToken
{
  return -[IFImage validationToken](self->_image, "validationToken");
}

- (unint64_t)validationFlags
{
  unint64_t validationFlags;

  validationFlags = self->_validationFlags;
  return validationFlags | -[IFImage validationFlags](self->_image, "validationFlags") | 1;
}

- (BOOL)placeholder
{
  return -[IFPlaceholderImage validationFlags](self, "validationFlags") & 1;
}

- (void)setValidationFlags:(unint64_t)a3
{
  self->_validationFlags = a3;
}

- (IFImage)image
{
  return (IFImage *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
