@implementation ABPKCropParams

- (ABPKCropParams)initWithInputResolution:(CGSize)a3 andOutputResolution:(CGSize)a4
{
  double height;
  double width;
  CGFloat v6;

  height = a3.height;
  width = a3.width;
  v6 = a3.width / height;
  *(float *)&v6 = v6;
  return -[ABPKCropParams initWithAspectRatio:andInputResolution:](self, "initWithAspectRatio:andInputResolution:", v6, width);
}

- (ABPKCropParams)initWithAspectRatio:(float)a3 andInputResolution:(CGSize)a4
{
  double height;
  double width;
  ABPKCropParams *v7;
  ABPKCropParams *v8;
  float v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  ABPKCropParams *v13;
  objc_super v15;

  height = a4.height;
  width = a4.width;
  v15.receiver = self;
  v15.super_class = (Class)ABPKCropParams;
  v7 = -[ABPKCropParams init](&v15, sel_init);
  v8 = v7;
  if (v7)
  {
    v9 = width / height;
    if (v9 == a3)
    {
      *(_QWORD *)&v7->_offsetHeight = 0;
      v7->_height = height;
      v10 = 20;
    }
    else if (v9 <= a3)
    {
      v12 = (float)((float)width / a3);
      v7->_height = v12;
      v7->_width = width;
      v7->_offsetWidth = 0;
      if ((v12 & 1) != 0)
        v7->_height = --v12;
      width = (height - (double)v12) * 0.5;
      v10 = 8;
    }
    else
    {
      v11 = (float)((float)height * a3);
      v7->_height = height;
      v7->_width = v11;
      v7->_offsetHeight = 0;
      if ((v11 & 1) != 0)
        v7->_width = --v11;
      width = (width - (double)v11) * 0.5;
      v10 = 12;
    }
    *(_DWORD *)((char *)&v7->super.isa + v10) = width;
    v13 = v7;
  }

  return v8;
}

- (unsigned)offsetHeight
{
  return self->_offsetHeight;
}

- (void)setOffsetHeight:(unsigned int)a3
{
  self->_offsetHeight = a3;
}

- (unsigned)offsetWidth
{
  return self->_offsetWidth;
}

- (void)setOffsetWidth:(unsigned int)a3
{
  self->_offsetWidth = a3;
}

- (unsigned)height
{
  return self->_height;
}

- (void)setHeight:(unsigned int)a3
{
  self->_height = a3;
}

- (unsigned)width
{
  return self->_width;
}

- (void)setWidth:(unsigned int)a3
{
  self->_width = a3;
}

@end
