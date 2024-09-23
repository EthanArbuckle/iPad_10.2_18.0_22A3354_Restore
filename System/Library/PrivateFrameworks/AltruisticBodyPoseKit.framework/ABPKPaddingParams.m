@implementation ABPKPaddingParams

- (ABPKPaddingParams)initWithInputResolution:(CGSize)a3 andOutputResolution:(CGSize)a4
{
  double height;
  double width;
  double v6;
  double v7;
  ABPKPaddingParams *v8;
  ABPKPaddingParams *v9;
  float v10;
  float v11;
  float v12;
  double v13;
  float v14;
  float v15;
  float v16;
  float v17;
  unsigned int v18;
  float v19;
  unsigned int v20;
  ABPKPaddingParams *v21;
  objc_super v23;

  height = a4.height;
  width = a4.width;
  v6 = a3.height;
  v7 = a3.width;
  v23.receiver = self;
  v23.super_class = (Class)ABPKPaddingParams;
  v8 = -[ABPKPaddingParams init](&v23, sel_init);
  v9 = v8;
  if (v8)
  {
    v10 = v6;
    v11 = v7 / v10;
    v12 = height;
    v13 = v12;
    v14 = width / v13;
    if (v11 == v14)
    {
      *(_QWORD *)&v8->_offsetHeight = 0;
      v8->_height = height;
      v8->_width = width;
      v15 = v13 / v6;
      v8->_scale = v15;
    }
    else if (v11 <= v14)
    {
      v19 = v13 / v6;
      v8->_scale = v19;
      v20 = (v7 * v19) & 0xFFFFFFFE;
      v8->_height = height;
      v8->_width = v20;
      v8->_offsetHeight = 0;
      v8->_offsetWidth = ((width - (double)v20) * 0.5);
    }
    else
    {
      v16 = width;
      v17 = v16 / v7;
      v8->_scale = v17;
      v18 = (v6 * v17) & 0xFFFFFFFE;
      v8->_height = v18;
      v8->_width = width;
      *(_QWORD *)&v8->_offsetHeight = ((height - (double)v18) * 0.5);
    }
    v21 = v8;
  }

  return v9;
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

- (float)scale
{
  return self->_scale;
}

- (void)setScale:(float)a3
{
  self->_scale = a3;
}

@end
