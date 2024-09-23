@implementation LAUIPearlGlyphStaticConfiguration

- (LAUIPearlGlyphStaticConfiguration)init
{

  return 0;
}

+ (id)createDefaultConfiguration
{
  id result;
  objc_super v8;

  result = [LAUIPearlGlyphStaticConfiguration alloc];
  if (result)
  {
    v8.receiver = result;
    v8.super_class = (Class)LAUIPearlGlyphStaticConfiguration;
    result = objc_msgSendSuper2(&v8, sel_init);
    if (result)
    {
      *((_QWORD *)result + 1) = 0;
      *((_QWORD *)result + 2) = 0;
      __asm { FMOV            V0.2D, #1.0 }
      *(_OWORD *)((char *)result + 24) = _Q0;
    }
  }
  return result;
}

- (__n128)_init
{
  char *v1;
  __n128 result;
  objc_super v7;

  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)LAUIPearlGlyphStaticConfiguration;
    v1 = (char *)objc_msgSendSuper2(&v7, sel_init);
    if (v1)
    {
      *((_QWORD *)v1 + 1) = 0;
      *((_QWORD *)v1 + 2) = 0;
      __asm { FMOV            V0.2D, #1.0 }
      *(__n128 *)(v1 + 24) = result;
    }
  }
  return result;
}

+ (id)createSystemApertureConfiguration
{
  LAUIPearlGlyphStaticConfiguration *v2;
  char *v3;
  void *v4;
  objc_super v11;

  v2 = [LAUIPearlGlyphStaticConfiguration alloc];
  if (v2)
  {
    v11.receiver = v2;
    v11.super_class = (Class)LAUIPearlGlyphStaticConfiguration;
    v3 = objc_msgSendSuper2(&v11, sel_init);
    v4 = v3;
    if (v3)
    {
      *((_QWORD *)v3 + 1) = 0;
      *((_QWORD *)v3 + 2) = 0;
      __asm { FMOV            V0.2D, #1.0 }
      *(_OWORD *)(v3 + 24) = _Q0;
    }
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v4, "setPathStyle:", 1);
  objc_msgSend(v4, "setLineThicknessScale:", 1.190476);
  return v4;
}

- (int64_t)initialStyle
{
  return self->_initialStyle;
}

- (void)setInitialStyle:(int64_t)a3
{
  self->_initialStyle = a3;
}

- (int64_t)pathStyle
{
  return self->_pathStyle;
}

- (void)setPathStyle:(int64_t)a3
{
  self->_pathStyle = a3;
}

- (double)lineThicknessScale
{
  return self->_lineThicknessScale;
}

- (void)setLineThicknessScale:(double)a3
{
  self->_lineThicknessScale = a3;
}

- (double)checkmarkThicknessScale
{
  return self->_checkmarkThicknessScale;
}

- (void)setCheckmarkThicknessScale:(double)a3
{
  self->_checkmarkThicknessScale = a3;
}

@end
