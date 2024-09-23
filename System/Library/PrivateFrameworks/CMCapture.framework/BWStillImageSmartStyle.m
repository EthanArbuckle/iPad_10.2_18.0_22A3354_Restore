@implementation BWStillImageSmartStyle

- (BWStillImageSmartStyle)initWithSmartStyle:(id)a3
{
  BWStillImageSmartStyle *v4;
  float v5;
  float v6;
  float v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BWStillImageSmartStyle;
  v4 = -[BWStillImageSmartStyle init](&v9, sel_init);
  if (v4)
  {
    v4->_cast = (NSString *)objc_msgSend((id)objc_msgSend(a3, "cast"), "copy");
    objc_msgSend(a3, "intensity");
    v4->_intensity = v5;
    objc_msgSend(a3, "toneBias");
    v4->_toneBias = v6;
    objc_msgSend(a3, "colorBias");
    v4->_colorBias = v7;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageSmartStyle;
  -[BWStillImageSmartStyle dealloc](&v3, sel_dealloc);
}

- (NSString)cast
{
  return self->_cast;
}

- (void)setCast:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (float)intensity
{
  return self->_intensity;
}

- (void)setIntensity:(float)a3
{
  self->_intensity = a3;
}

- (float)toneBias
{
  return self->_toneBias;
}

- (void)setToneBias:(float)a3
{
  self->_toneBias = a3;
}

- (float)colorBias
{
  return self->_colorBias;
}

- (void)setColorBias:(float)a3
{
  self->_colorBias = a3;
}

@end
