@implementation CUIPSDLayerEffectBevelEmboss

- (BOOL)updateLayerEffectPreset:(id)a3 error:(id *)a4
{
  const CGFloat *Components;
  uint64_t v8;
  uint64_t v9;
  const CGFloat *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  BOOL v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSErrorDomain v22;
  const __CFString **v23;
  NSErrorUserInfoKey *v24;
  NSError *v25;
  double v27;
  double v28;
  uint64_t v29;
  unsigned int v30;
  NSErrorUserInfoKey v31;
  const __CFString *v32;
  NSErrorUserInfoKey v33;
  const __CFString *v34;

  if (!-[CUIPSDLayerEffectBevelEmboss highlightColor](self, "highlightColor")
    || !-[CUIPSDLayerEffectBevelEmboss shadowColor](self, "shadowColor"))
  {
    v22 = NSCocoaErrorDomain;
    v33 = NSLocalizedDescriptionKey;
    v34 = CFSTR("Bevel is missing color information");
    v23 = &v34;
    v24 = &v33;
    goto LABEL_12;
  }
  if (-[CUIPSDLayerEffectBevelEmboss highlightBlendMode](self, "highlightBlendMode")
    && -[CUIPSDLayerEffectBevelEmboss highlightBlendMode](self, "highlightBlendMode") != 1
    || -[CUIPSDLayerEffectBevelEmboss shadowBlendMode](self, "shadowBlendMode")
    && -[CUIPSDLayerEffectBevelEmboss shadowBlendMode](self, "shadowBlendMode") != 1)
  {
    v22 = NSCocoaErrorDomain;
    v31 = NSLocalizedDescriptionKey;
    v32 = CFSTR("Bevel contains unsupported blend mode information");
    v23 = &v32;
    v24 = &v31;
LABEL_12:
    v25 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v22, -1, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v24, 1));
    v17 = 0;
    if (a4)
      *a4 = v25;
    return v17;
  }
  Components = CGColorGetComponents(-[CUIColor CGColor](-[CUIPSDLayerEffectBevelEmboss highlightColor](self, "highlightColor"), "CGColor"));
  v8 = rint(*Components * 255.0);
  v30 = rint(Components[1] * 255.0);
  v9 = rint(Components[2] * 255.0);
  v10 = CGColorGetComponents(-[CUIColor CGColor](-[CUIPSDLayerEffectBevelEmboss shadowColor](self, "shadowColor"), "CGColor"));
  v11 = rint(*v10 * 255.0);
  v12 = rint(v10[1] * 255.0);
  v13 = rint(v10[2] * 255.0);
  v14 = -[CUIPSDLayerEffectBevelEmboss blurSize](self, "blurSize");
  v15 = -[CUIPSDLayerEffectBevelEmboss softenSize](self, "softenSize");
  v16 = -[CUIPSDLayerEffectBevelEmboss direction](self, "direction");
  v17 = 1;
  if (v16 == 1231953952)
  {
    -[CUIPSDLayerEffectBevelEmboss highlightOpacity](self, "highlightOpacity");
    v19 = v27;
    -[CUIPSDLayerEffectBevelEmboss shadowOpacity](self, "shadowOpacity");
    v21 = v28;
    LODWORD(v29) = 1;
    goto LABEL_16;
  }
  if (v16 == 1333097504)
  {
    -[CUIPSDLayerEffectBevelEmboss highlightOpacity](self, "highlightOpacity");
    v19 = v18;
    -[CUIPSDLayerEffectBevelEmboss shadowOpacity](self, "shadowOpacity");
    v21 = v20;
    LODWORD(v29) = 0;
LABEL_16:
    objc_msgSend(a3, "addBevelEmbossWithHighlightColorRed:green:blue:opacity:shadowColorRed:green:blue:opacity:blur:soften:bevelStyle:", v8, v30, v9, v11, v12, v13, v19, v21, __PAIR64__(v15, v14), v29);
  }
  return v17;
}

- (CUIPSDLayerEffectBevelEmboss)initWithEffectFromPreset:(id)a3 atIndex:(unsigned int)a4
{
  CUIPSDLayerEffectBevelEmboss *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CUIPSDLayerEffectBevelEmboss;
  v6 = -[CUIPSDLayerEffectBevelEmboss init](&v8, sel_init);
  -[CUIPSDLayerEffectBevelEmboss setBlurSize:](v6, "setBlurSize:", objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 4, a4));
  -[CUIPSDLayerEffectBevelEmboss setSoftenSize:](v6, "setSoftenSize:", objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 8, a4));
  -[CUIPSDLayerEffectBevelEmboss setHighlightColor:](v6, "setHighlightColor:", -[CUIPSDLayerEffectComponent _colorFromShapeEffectValue:](v6, "_colorFromShapeEffectValue:", objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 0, a4)));
  -[CUIPSDLayerEffectBevelEmboss setHighlightOpacity:](v6, "setHighlightOpacity:", COERCE_DOUBLE(objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 2, a4)));
  -[CUIPSDLayerEffectBevelEmboss setShadowColor:](v6, "setShadowColor:", -[CUIPSDLayerEffectComponent _colorFromShapeEffectValue:](v6, "_colorFromShapeEffectValue:", objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 1, a4)));
  -[CUIPSDLayerEffectBevelEmboss setShadowOpacity:](v6, "setShadowOpacity:", COERCE_DOUBLE(objc_msgSend(a3, "valueForParameter:inEffectAtIndex:", 3, a4)));
  -[CUIPSDLayerEffectBevelEmboss setHighlightBlendMode:](v6, "setHighlightBlendMode:", 0);
  -[CUIPSDLayerEffectBevelEmboss setShadowBlendMode:](v6, "setShadowBlendMode:", 0);
  -[CUIPSDLayerEffectBevelEmboss setAngle:](v6, "setAngle:", 90);
  -[CUIPSDLayerEffectBevelEmboss setAltitude:](v6, "setAltitude:", 30);
  -[CUIPSDLayerEffectBevelEmboss setDirection:](v6, "setDirection:", 1231953952);
  -[CUIPSDLayerEffectComponent setVisible:](v6, "setVisible:", 1);
  return v6;
}

- (CUIPSDLayerEffectBevelEmboss)init
{
  CUIPSDLayerEffectBevelEmboss *v2;
  CUIPSDLayerEffectBevelEmboss *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUIPSDLayerEffectBevelEmboss;
  v2 = -[CUIPSDLayerEffectBevelEmboss init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CUIPSDLayerEffectComponent setName:](v2, "setName:", CFSTR("Bevel Emboss"));
  return v3;
}

- (unsigned)effectType
{
  return 1700946540;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayerEffectBevelEmboss;
  return objc_msgSend(-[CUIPSDLayerEffectBevelEmboss description](&v3, sel_description), "stringByAppendingString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("blurSize: %d softenSize: %d angle: %d altitude: %d highlightColor: %@ shadowColor: %@ (there are more properties...)"), -[CUIPSDLayerEffectBevelEmboss blurSize](self, "blurSize"), -[CUIPSDLayerEffectBevelEmboss softenSize](self, "softenSize"), -[CUIPSDLayerEffectBevelEmboss angle](self, "angle"), -[CUIPSDLayerEffectBevelEmboss altitude](self, "altitude"), -[CUIColor description](-[CUIPSDLayerEffectBevelEmboss highlightColor](self, "highlightColor"), "description"), -[CUIColor description](-[CUIPSDLayerEffectBevelEmboss shadowColor](self, "shadowColor"), "description")));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayerEffectBevelEmboss;
  -[CUIPSDLayerEffectComponent dealloc](&v3, sel_dealloc);
}

- (unint64_t)blurSize
{
  return self->_blurSize;
}

- (void)setBlurSize:(unint64_t)a3
{
  self->_blurSize = a3;
}

- (unint64_t)softenSize
{
  return self->_softenSize;
}

- (void)setSoftenSize:(unint64_t)a3
{
  self->_softenSize = a3;
}

- (signed)angle
{
  return self->_angle;
}

- (void)setAngle:(signed __int16)a3
{
  self->_angle = a3;
}

- (unint64_t)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(unint64_t)a3
{
  self->_altitude = a3;
}

- (unsigned)direction
{
  return self->_direction;
}

- (void)setDirection:(unsigned int)a3
{
  self->_direction = a3;
}

- (int)highlightBlendMode
{
  return self->_highlightBlendMode;
}

- (void)setHighlightBlendMode:(int)a3
{
  self->_highlightBlendMode = a3;
}

- (CUIColor)highlightColor
{
  return (CUIColor *)objc_getProperty(self, a2, 64, 1);
}

- (void)setHighlightColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (double)highlightOpacity
{
  return self->_highlightOpacity;
}

- (void)setHighlightOpacity:(double)a3
{
  self->_highlightOpacity = a3;
}

- (int)shadowBlendMode
{
  return self->_shadowBlendMode;
}

- (void)setShadowBlendMode:(int)a3
{
  self->_shadowBlendMode = a3;
}

- (CUIColor)shadowColor
{
  return (CUIColor *)objc_getProperty(self, a2, 88, 1);
}

- (void)setShadowColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (double)shadowOpacity
{
  return self->_shadowOpacity;
}

- (void)setShadowOpacity:(double)a3
{
  self->_shadowOpacity = a3;
}

@end
