@implementation BWStillImageSemanticStyle

- (BWStillImageSemanticStyle)initWithSemanticStyle:(id)a3
{
  BWStillImageSemanticStyle *v4;
  float v5;
  float v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWStillImageSemanticStyle;
  v4 = -[BWStillImageSemanticStyle init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend(a3, "mappedToneBias");
    v4->_toneBias = v5;
    objc_msgSend(a3, "mappedWarmthBias");
    v4->_warmthBias = v6;
  }
  return v4;
}

- (float)toneBias
{
  return self->_toneBias;
}

- (void)setToneBias:(float)a3
{
  self->_toneBias = a3;
}

- (float)warmthBias
{
  return self->_warmthBias;
}

- (void)setWarmthBias:(float)a3
{
  self->_warmthBias = a3;
}

@end
