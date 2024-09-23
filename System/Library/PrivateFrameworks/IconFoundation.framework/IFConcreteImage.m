@implementation IFConcreteImage

- (BOOL)placeholder
{
  return self->_validationFlags & 1;
}

- (CGSize)minimumSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_minimumSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)dealloc
{
  CGImage *CGImage;
  objc_super v4;

  CGImage = self->_CGImage;
  if (CGImage)
    CFRelease(CGImage);
  v4.receiver = self;
  v4.super_class = (Class)IFConcreteImage;
  -[IFConcreteImage dealloc](&v4, sel_dealloc);
}

- (CGImage)CGImage
{
  CGImage *v3;
  CGImage *CGImage;

  v3 = +[IFImage escapingCGImageWithCGImage:](IFImage, "escapingCGImageWithCGImage:", self->_CGImage);
  CGImage = self->_CGImage;
  if (v3 != CGImage)
  {
    CFAutorelease(CGImage);
    CFRetain(v3);
    self->_CGImage = v3;
  }
  return v3;
}

- (CGSize)iconSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_iconSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)size
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_size, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_validationFlags = self->_validationFlags & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IFConcreteImage;
  return -[IFImage _init](&v3, sel__init);
}

- (IFConcreteImage)initWithCGImage:(CGImage *)a3 scale:(double)a4
{
  IFConcreteImage *v6;
  IFConcreteImage *v7;
  CGImage *v8;
  CGFloat v9;
  size_t Height;
  CGFloat v11;
  size_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)IFConcreteImage;
  v6 = -[IFImage _init](&v14, sel__init);
  v7 = v6;
  if (v6)
  {
    if (a3)
    {
      v8 = (CGImage *)CFRetain(a3);
      v7->_CGImage = v8;
      v9 = (double)CGImageGetWidth(v8) / a4;
      Height = CGImageGetHeight(v7->_CGImage);
      v7->_size.width = v9;
      v7->_size.height = (double)Height / a4;
      v7->_scale = a4;
      v7->_minimumSize = (CGSize)*MEMORY[0x1E0C9D820];
      v7->_placeholder = 0;
      v7->_validationFlags = 0;
      v11 = (double)CGImageGetWidth(a3) / a4;
      v12 = CGImageGetHeight(a3);
      v7->_iconSize.width = v11;
      v7->_iconSize.height = (double)v12 / a4;
    }
    else
    {
      v6->_iconSize = (CGSize)*MEMORY[0x1E0C9D820];
    }
  }
  return v7;
}

- (CGImage)_CGImage
{
  return self->_CGImage;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  CGImage *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = objc_alloc_init((Class)objc_opt_class());
  if (-[IFConcreteImage CGImage](self, "CGImage"))
  {
    v5 = -[IFConcreteImage CGImage](self, "CGImage");
    v4[5] = v5;
    CFRetain(v5);
  }
  -[IFConcreteImage size](self, "size");
  v4[8] = v6;
  v4[9] = v7;
  -[IFConcreteImage scale](self, "scale");
  v4[6] = v8;
  return v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<IFImage 0x%lx>  CGImage: %@"), self, self->_CGImage);
}

- (unint64_t)validationFlags
{
  return self->_validationFlags;
}

- (void)setValidationFlags:(unint64_t)a3
{
  self->_validationFlags = a3;
}

- (void)setMinimumSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_minimumSize, &v3, 16, 1, 0);
}

- (void)setIconSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_iconSize, &v3, 16, 1, 0);
}

@end
