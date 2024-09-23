@implementation CUIPSDLayerEffectOuterGlow

- (BOOL)updateLayerEffectPreset:(id)a3 error:(id *)a4
{
  CUIColor *v7;
  const CGFloat *Components;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  NSError *v14;
  NSErrorUserInfoKey v16;
  const __CFString *v17;

  v7 = -[CUIPSDLayerEffectOuterGlow color](self, "color");
  if (v7)
  {
    Components = CGColorGetComponents(-[CUIColor CGColor](-[CUIPSDLayerEffectOuterGlow color](self, "color"), "CGColor"));
    v9 = rint(*Components * 255.0);
    v10 = rint(Components[1] * 255.0);
    v11 = rint(Components[2] * 255.0);
    v12 = -[CUIPSDLayerEffectOuterGlow blurSize](self, "blurSize");
    v13 = -[CUIPSDLayerEffectOuterGlow spread](self, "spread");
    -[CUIPSDLayerEffectOuterGlow opacity](self, "opacity");
    objc_msgSend(a3, "addOuterGlowWithColorRed:green:blue:opacity:blur:spread:", v9, v10, v11, v12, v13);
  }
  else
  {
    v16 = NSLocalizedDescriptionKey;
    v17 = CFSTR("Outer Glow is missing color information");
    v14 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, -1, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
    if (a4)
      *a4 = v14;
  }
  return v7 != 0;
}

- (CUIPSDLayerEffectOuterGlow)initWithEffectFromPreset:(id)a3 atIndex:(unsigned int)a4
{
  CUIPSDLayerEffectOuterGlow *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CUIPSDLayerEffectOuterGlow;
  v6 = -[CUIPSDLayerEffectOuterGlow init](&v8, sel_init);
  -[CUIPSDLayerEffectOuterGlow setColor:](v6, "setColor:", -[CUIPSDLayerEffectComponent _colorFromShapeEffectValue:](v6, "_colorFromShapeEffectValue:", objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 0, a4)));
  -[CUIPSDLayerEffectOuterGlow setOpacity:](v6, "setOpacity:", COERCE_DOUBLE(objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 2, a4)));
  -[CUIPSDLayerEffectOuterGlow setBlurSize:](v6, "setBlurSize:", objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 4, a4));
  -[CUIPSDLayerEffectOuterGlow setSpread:](v6, "setSpread:", objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 9, a4));
  -[CUIPSDLayerEffectOuterGlow setBlendMode:](v6, "setBlendMode:", 0);
  -[CUIPSDLayerEffectComponent setVisible:](v6, "setVisible:", 1);
  return v6;
}

- (CUIPSDLayerEffectOuterGlow)init
{
  CUIPSDLayerEffectOuterGlow *v2;
  CUIPSDLayerEffectOuterGlow *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUIPSDLayerEffectOuterGlow;
  v2 = -[CUIPSDLayerEffectOuterGlow init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CUIPSDLayerEffectComponent setName:](v2, "setName:", CFSTR("Outer Glow"));
  return v3;
}

- (unsigned)effectType
{
  return 1332889452;
}

- (id)description
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CUIPSDLayerEffectOuterGlow;
  v3 = -[CUIPSDLayerEffectOuterGlow description](&v7, sel_description);
  v4 = -[CUIPSDLayerEffectOuterGlow blendMode](self, "blendMode");
  -[CUIPSDLayerEffectOuterGlow opacity](self, "opacity");
  return objc_msgSend(v3, "stringByAppendingString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("blendMode: %d opacity: %f color: %@ blurSize: %d spread: %d"), v4, v5, -[CUIColor description](-[CUIPSDLayerEffectOuterGlow color](self, "color"), "description"), -[CUIPSDLayerEffectOuterGlow blurSize](self, "blurSize"), -[CUIPSDLayerEffectOuterGlow spread](self, "spread")));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayerEffectOuterGlow;
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
