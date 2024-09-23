@implementation CertInfoGradientLabel

- (void)dealloc
{
  CGColor *patternColor;
  objc_super v4;

  patternColor = self->_patternColor;
  if (patternColor)
    CFRelease(patternColor);
  v4.receiver = self;
  v4.super_class = (Class)CertInfoGradientLabel;
  -[CertInfoGradientLabel dealloc](&v4, sel_dealloc);
}

- (UIFont)font
{
  UIFont *font;

  font = self->_font;
  if (font)
    return font;
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 17.0);
  return (UIFont *)(id)objc_claimAutoreleasedReturnValue();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  NSString *text;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  text = self->_text;
  -[CertInfoGradientLabel font](self, "font", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString _legacy_sizeWithFont:constrainedToSize:lineBreakMode:](text, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v4, 4, *(double *)(MEMORY[0x24BDBF028] + 16), *(double *)(MEMORY[0x24BDBF028] + 24));
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)setGradient:(id)a3
{
  UIImage *v5;
  UIImage **p_gradient;
  CGColor *patternColor;
  CGColorSpace *Pattern;
  __int128 v9;
  double v10;
  CGPattern *v11;
  CGAffineTransform v12;
  CGAffineTransform v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = (UIImage *)a3;
  p_gradient = &self->_gradient;
  if (self->_gradient != v5)
  {
    objc_storeStrong((id *)&self->_gradient, a3);
    patternColor = self->_patternColor;
    if (patternColor)
      CFRelease(patternColor);
    self->_patternColor = 0;
    if (-[UIImage CGImage](*p_gradient, "CGImage"))
    {
      Pattern = CGColorSpaceCreatePattern(0);
      -[UIImage scale](*p_gradient, "scale");
      memset(&v12, 0, sizeof(v12));
      v9 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      *(_OWORD *)&v13.a = *MEMORY[0x24BDBD8B8];
      *(_OWORD *)&v13.c = v9;
      *(_OWORD *)&v13.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
      CGAffineTransformScale(&v12, &v13, 1.0 / v10, -1.0 / v10);
      v13 = v12;
      v11 = (CGPattern *)CGPatternCreateWithImage2();
      *(_OWORD *)&v13.a = xmmword_20DB03F30;
      *(_OWORD *)&v13.c = unk_20DB03F40;
      self->_patternColor = CGColorCreateWithPattern(Pattern, v11, &v13.a);
      if (Pattern)
        CFRelease(Pattern);
      if (v11)
        CFRelease(v11);
    }
  }

}

- (CGColor)_patternColor
{
  return self->_patternColor;
}

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _OWORD v11[2];
  uint64_t v12;
  CGSize v13;

  v12 = *MEMORY[0x24BDAC8D0];
  CurrentContext = UIGraphicsGetCurrentContext();
  -[CertInfoGradientLabel text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertInfoGradientLabel font](self, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertInfoGradientLabel bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  v11[0] = xmmword_20DB03F50;
  v11[1] = unk_20DB03F60;
  CGContextSetFillColor(CurrentContext, (const CGFloat *)v11);
  objc_msgSend(v5, "_legacy_drawAtPoint:withFont:", v6, v8, v10);
  CGContextSetFillColorWithColor(CurrentContext, -[CertInfoGradientLabel _patternColor](self, "_patternColor"));
  CGContextSaveGState(CurrentContext);
  v13.width = v8;
  v13.height = v10;
  CGContextSetPatternPhase(CurrentContext, v13);
  objc_msgSend(v5, "_legacy_drawAtPoint:withFont:", v6, v8, v10);
  CGContextRestoreGState(CurrentContext);

}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (UIImage)gradient
{
  return self->_gradient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradient, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
