@implementation CUIPSDLayerEffectColorOverlay

- (BOOL)updateLayerEffectPreset:(id)a3 error:(id *)a4
{
  CUIColor *v7;
  const CGFloat *Components;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSError *v12;
  NSErrorUserInfoKey v14;
  const __CFString *v15;

  v7 = -[CUIPSDLayerEffectColorOverlay color](self, "color");
  if (v7)
  {
    Components = CGColorGetComponents(-[CUIColor CGColor](-[CUIPSDLayerEffectColorOverlay color](self, "color"), "CGColor"));
    v9 = rint(*Components * 255.0);
    v10 = rint(Components[1] * 255.0);
    v11 = rint(Components[2] * 255.0);
    -[CUIPSDLayerEffectColorOverlay opacity](self, "opacity");
    objc_msgSend(a3, "addColorFillWithRed:green:blue:opacity:blendMode:tintable:", v9, v10, v11, 1852797549, 0);
  }
  else
  {
    v14 = NSLocalizedDescriptionKey;
    v15 = CFSTR("Color Overlay is missing color information");
    v12 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, -1, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    if (a4)
      *a4 = v12;
  }
  return v7 != 0;
}

- (CUIPSDLayerEffectColorOverlay)initWithEffectFromPreset:(id)a3 atIndex:(unsigned int)a4
{
  CUIPSDLayerEffectColorOverlay *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CUIPSDLayerEffectColorOverlay;
  v6 = -[CUIPSDLayerEffectColorOverlay init](&v8, sel_init);
  -[CUIPSDLayerEffectColorOverlay setColor:](v6, "setColor:", -[CUIPSDLayerEffectComponent _colorFromShapeEffectValue:](v6, "_colorFromShapeEffectValue:", objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 0, a4)));
  -[CUIPSDLayerEffectColorOverlay setOpacity:](v6, "setOpacity:", COERCE_DOUBLE(objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 2, a4)));
  -[CUIPSDLayerEffectColorOverlay setBlendMode:](v6, "setBlendMode:", 0);
  -[CUIPSDLayerEffectComponent setVisible:](v6, "setVisible:", 1);
  return v6;
}

- (CUIPSDLayerEffectColorOverlay)init
{
  CUIPSDLayerEffectColorOverlay *v2;
  CUIPSDLayerEffectColorOverlay *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUIPSDLayerEffectColorOverlay;
  v2 = -[CUIPSDLayerEffectColorOverlay init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CUIPSDLayerEffectComponent setName:](v2, "setName:", CFSTR("Color Overlay"));
  return v3;
}

- (unsigned)effectType
{
  return 1399801449;
}

- (id)description
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CUIPSDLayerEffectColorOverlay;
  v3 = -[CUIPSDLayerEffectColorOverlay description](&v7, sel_description);
  v4 = -[CUIPSDLayerEffectColorOverlay blendMode](self, "blendMode");
  -[CUIPSDLayerEffectColorOverlay opacity](self, "opacity");
  return objc_msgSend(v3, "stringByAppendingString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("blendMode: %d opacity: %f color: %@"), v4, v5, -[CUIColor description](-[CUIPSDLayerEffectColorOverlay color](self, "color"), "description")));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayerEffectColorOverlay;
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

@end
