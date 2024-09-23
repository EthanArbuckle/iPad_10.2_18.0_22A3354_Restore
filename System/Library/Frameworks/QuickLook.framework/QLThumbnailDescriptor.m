@implementation QLThumbnailDescriptor

+ (id)descriptorWithSize:(CGSize)a3 scaleFactor:(double)a4
{
  double height;
  double width;
  id v7;
  void *v8;

  height = a3.height;
  width = a3.width;
  v7 = objc_alloc_init((Class)a1);
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setSize:", width, height);
    objc_msgSend(v8, "setScaleFactor:", a4);
  }
  return v8;
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

- (void)setSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_size, &v3, 16, 1, 0);
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(double)a3
{
  self->_scaleFactor = a3;
}

@end
