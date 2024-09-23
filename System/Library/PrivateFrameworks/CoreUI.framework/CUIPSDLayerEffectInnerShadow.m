@implementation CUIPSDLayerEffectInnerShadow

- (BOOL)updateLayerEffectPreset:(id)a3 error:(id *)a4
{
  CUIColor *v7;
  const CGFloat *Components;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  double v14;
  NSError *v15;
  uint64_t v17;
  NSErrorUserInfoKey v18;
  const __CFString *v19;

  v7 = -[CUIPSDLayerEffectInnerShadow color](self, "color");
  if (v7)
  {
    Components = CGColorGetComponents(-[CUIColor CGColor](-[CUIPSDLayerEffectInnerShadow color](self, "color"), "CGColor"));
    v9 = rint(*Components * 255.0);
    v10 = rint(Components[1] * 255.0);
    v11 = rint(Components[2] * 255.0);
    v12 = -[CUIPSDLayerEffectInnerShadow blurSize](self, "blurSize");
    v13 = -[CUIPSDLayerEffectInnerShadow distance](self, "distance");
    -[CUIPSDLayerEffectInnerShadow opacity](self, "opacity");
    LODWORD(v17) = 1852797549;
    objc_msgSend(a3, "addInnerShadowWithColorRed:green:blue:opacity:blur:offset:angle:blendMode:", v9, v10, v11, v12, v13, -[CUIPSDLayerEffectInnerShadow angle](self, "angle"), v14, v17);
  }
  else
  {
    v18 = NSLocalizedDescriptionKey;
    v19 = CFSTR("Inner Shadow is missing color information");
    v15 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, -1, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
    if (a4)
      *a4 = v15;
  }
  return v7 != 0;
}

- (CUIPSDLayerEffectInnerShadow)initWithEffectFromPreset:(id)a3 atIndex:(unsigned int)a4
{
  CUIPSDLayerEffectInnerShadow *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CUIPSDLayerEffectInnerShadow;
  v6 = -[CUIPSDLayerEffectInnerShadow init](&v8, sel_init);
  -[CUIPSDLayerEffectInnerShadow setColor:](v6, "setColor:", -[CUIPSDLayerEffectComponent _colorFromShapeEffectValue:](v6, "_colorFromShapeEffectValue:", objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 0, a4)));
  -[CUIPSDLayerEffectInnerShadow setOpacity:](v6, "setOpacity:", COERCE_DOUBLE(objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 2, a4)));
  -[CUIPSDLayerEffectInnerShadow setBlurSize:](v6, "setBlurSize:", objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 4, a4));
  -[CUIPSDLayerEffectInnerShadow setDistance:](v6, "setDistance:", objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 5, a4));
  -[CUIPSDLayerEffectInnerShadow setAngle:](v6, "setAngle:", (__int16)objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 6, a4));
  -[CUIPSDLayerEffectInnerShadow setBlendMode:](v6, "setBlendMode:", 0);
  -[CUIPSDLayerEffectComponent setVisible:](v6, "setVisible:", 1);
  return v6;
}

- (CUIPSDLayerEffectInnerShadow)init
{
  CUIPSDLayerEffectInnerShadow *v2;
  CUIPSDLayerEffectInnerShadow *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUIPSDLayerEffectInnerShadow;
  v2 = -[CUIPSDLayerEffectInnerShadow init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CUIPSDLayerEffectComponent setName:](v2, "setName:", CFSTR("Inner Shadow"));
  return v3;
}

- (unsigned)effectType
{
  return 1232229224;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayerEffectInnerShadow;
  -[CUIPSDLayerEffectComponent dealloc](&v3, sel_dealloc);
}

- (int)blendMode
{
  return self->_blendMode;
}

- (void)setBlendMode:(int)a3
{
  self->_blendMode = a3;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (CUIColor)color
{
  return (CUIColor *)objc_getProperty(self, a2, 40, 1);
}

- (void)setColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (signed)angle
{
  return self->_angle;
}

- (void)setAngle:(signed __int16)a3
{
  self->_angle = a3;
}

- (unint64_t)distance
{
  return self->_distance;
}

- (void)setDistance:(unint64_t)a3
{
  self->_distance = a3;
}

- (unint64_t)blurSize
{
  return self->_blurSize;
}

- (void)setBlurSize:(unint64_t)a3
{
  self->_blurSize = a3;
}

@end
