@implementation CUIPSDLayerEffectInnerGlow

- (BOOL)updateLayerEffectPreset:(id)a3 error:(id *)a4
{
  CUIColor *v7;
  const CGFloat *Components;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  NSError *v13;
  NSErrorUserInfoKey v15;
  const __CFString *v16;

  v7 = -[CUIPSDLayerEffectInnerGlow color](self, "color");
  if (v7)
  {
    Components = CGColorGetComponents(-[CUIColor CGColor](-[CUIPSDLayerEffectInnerGlow color](self, "color"), "CGColor"));
    v9 = rint(*Components * 255.0);
    v10 = rint(Components[1] * 255.0);
    v11 = rint(Components[2] * 255.0);
    v12 = -[CUIPSDLayerEffectInnerGlow blurSize](self, "blurSize");
    -[CUIPSDLayerEffectInnerGlow opacity](self, "opacity");
    objc_msgSend(a3, "addInnerGlowWithColorRed:green:blue:opacity:blur:blendMode:", v9, v10, v11, v12, 1852797549);
  }
  else
  {
    v15 = NSLocalizedDescriptionKey;
    v16 = CFSTR("Inner Glow is missing color information");
    v13 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, -1, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    if (a4)
      *a4 = v13;
  }
  return v7 != 0;
}

- (CUIPSDLayerEffectInnerGlow)initWithEffectFromPreset:(id)a3 atIndex:(unsigned int)a4
{
  CUIPSDLayerEffectInnerGlow *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CUIPSDLayerEffectInnerGlow;
  v6 = -[CUIPSDLayerEffectInnerGlow init](&v8, sel_init);
  -[CUIPSDLayerEffectInnerGlow setColor:](v6, "setColor:", -[CUIPSDLayerEffectComponent _colorFromShapeEffectValue:](v6, "_colorFromShapeEffectValue:", objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 0, a4)));
  -[CUIPSDLayerEffectInnerGlow setOpacity:](v6, "setOpacity:", COERCE_DOUBLE(objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 2, a4)));
  -[CUIPSDLayerEffectInnerGlow setBlurSize:](v6, "setBlurSize:", objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 4, a4));
  -[CUIPSDLayerEffectInnerGlow setBlendMode:](v6, "setBlendMode:", 0);
  -[CUIPSDLayerEffectInnerGlow setBlendMode:](v6, "setBlendMode:", 0);
  -[CUIPSDLayerEffectComponent setVisible:](v6, "setVisible:", 1);
  return v6;
}

- (CUIPSDLayerEffectInnerGlow)init
{
  CUIPSDLayerEffectInnerGlow *v2;
  CUIPSDLayerEffectInnerGlow *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUIPSDLayerEffectInnerGlow;
  v2 = -[CUIPSDLayerEffectInnerGlow init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CUIPSDLayerEffectComponent setName:](v2, "setName:", CFSTR("Inner Glow"));
  return v3;
}

- (unsigned)effectType
{
  return 1232226156;
}

- (id)description
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CUIPSDLayerEffectInnerGlow;
  v3 = -[CUIPSDLayerEffectInnerGlow description](&v7, sel_description);
  v4 = -[CUIPSDLayerEffectInnerGlow blendMode](self, "blendMode");
  -[CUIPSDLayerEffectInnerGlow opacity](self, "opacity");
  return objc_msgSend(v3, "stringByAppendingString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("blendMode: %d opacity: %f color: %@ blurSize: %d"), v4, v5, -[CUIColor description](-[CUIPSDLayerEffectInnerGlow color](self, "color"), "description"), -[CUIPSDLayerEffectInnerGlow blurSize](self, "blurSize")));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayerEffectInnerGlow;
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

@end
