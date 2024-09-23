@implementation CUIPSDLayerEffectDropShadow

- (BOOL)updateLayerEffectPreset:(id)a3 error:(id *)a4
{
  CUIColor *v7;
  const CGFloat *Components;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  double v15;
  double v16;
  NSError *v17;
  uint64_t v19;
  NSErrorUserInfoKey v20;
  const __CFString *v21;

  v7 = -[CUIPSDLayerEffectDropShadow color](self, "color");
  if (v7)
  {
    Components = CGColorGetComponents(-[CUIColor CGColor](-[CUIPSDLayerEffectDropShadow color](self, "color"), "CGColor"));
    v9 = rint(*Components * 255.0);
    v10 = rint(Components[1] * 255.0);
    v11 = rint(Components[2] * 255.0);
    v12 = -[CUIPSDLayerEffectDropShadow blurSize](self, "blurSize");
    v13 = -[CUIPSDLayerEffectDropShadow distance](self, "distance");
    v14 = -[CUIPSDLayerEffectDropShadow spread](self, "spread");
    -[CUIPSDLayerEffectDropShadow opacity](self, "opacity");
    v16 = v15;
    LODWORD(v19) = -[CUIPSDLayerEffectDropShadow angle](self, "angle");
    objc_msgSend(a3, "addDropShadowWithColorRed:green:blue:opacity:blur:spread:offset:angle:", v9, v10, v11, v12, v14, v13, v16, v19);
  }
  else
  {
    v20 = NSLocalizedDescriptionKey;
    v21 = CFSTR("Drop Shadow is missing color information");
    v17 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, -1, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    if (a4)
      *a4 = v17;
  }
  return v7 != 0;
}

- (CUIPSDLayerEffectDropShadow)initWithEffectFromPreset:(id)a3 atIndex:(unsigned int)a4
{
  CUIPSDLayerEffectDropShadow *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CUIPSDLayerEffectDropShadow;
  v6 = -[CUIPSDLayerEffectDropShadow init](&v8, sel_init);
  -[CUIPSDLayerEffectDropShadow setColor:](v6, "setColor:", -[CUIPSDLayerEffectComponent _colorFromShapeEffectValue:](v6, "_colorFromShapeEffectValue:", objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 0, a4)));
  -[CUIPSDLayerEffectDropShadow setOpacity:](v6, "setOpacity:", COERCE_DOUBLE(objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 2, a4)));
  -[CUIPSDLayerEffectDropShadow setBlurSize:](v6, "setBlurSize:", objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 4, a4));
  -[CUIPSDLayerEffectDropShadow setSpread:](v6, "setSpread:", objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 9, a4));
  -[CUIPSDLayerEffectDropShadow setDistance:](v6, "setDistance:", objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 5, a4));
  -[CUIPSDLayerEffectDropShadow setAngle:](v6, "setAngle:", (__int16)objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 6, a4));
  -[CUIPSDLayerEffectDropShadow setBlendMode:](v6, "setBlendMode:", 0);
  -[CUIPSDLayerEffectComponent setVisible:](v6, "setVisible:", 1);
  return v6;
}

- (CUIPSDLayerEffectDropShadow)init
{
  CUIPSDLayerEffectDropShadow *v2;
  CUIPSDLayerEffectDropShadow *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUIPSDLayerEffectDropShadow;
  v2 = -[CUIPSDLayerEffectDropShadow init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CUIPSDLayerEffectComponent setName:](v2, "setName:", CFSTR("Drop Shadow"));
  return v3;
}

- (unsigned)effectType
{
  return 1148343144;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayerEffectDropShadow;
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

- (unint64_t)spread
{
  return self->_spread;
}

- (void)setSpread:(unint64_t)a3
{
  self->_spread = a3;
}

@end
