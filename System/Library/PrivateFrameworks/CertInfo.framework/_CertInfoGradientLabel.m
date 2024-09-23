@implementation _CertInfoGradientLabel

- (_CertInfoGradientLabel)initWithTrusted:(BOOL)a3
{
  _BOOL4 v3;
  _CertInfoGradientLabel *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  NSString *text;
  uint64_t v11;
  UIFont *font;
  uint64_t v13;
  UIImage *checkImage;
  const __CFString *v15;
  id v16;
  CGColorSpace *Pattern;
  __int128 v18;
  double v19;
  CGPattern *v20;
  CGAffineTransform v22;
  objc_super v23;
  CGAffineTransform v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x24BDAC8D0];
  v23.receiver = self;
  v23.super_class = (Class)_CertInfoGradientLabel;
  v4 = -[_CertInfoGradientLabel initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CertInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v3)
      v8 = CFSTR("TRUSTED");
    else
      v8 = CFSTR("NOT_TRUSTED");
    objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24C813780, CFSTR("CertInfo"));
    v9 = objc_claimAutoreleasedReturnValue();
    text = v4->_text;
    v4->_text = (NSString *)v9;

    objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 15.0);
    v11 = objc_claimAutoreleasedReturnValue();
    font = v4->_font;
    v4->_font = (UIFont *)v11;

    -[_CertInfoGradientLabel setBackgroundColor:](v4, "setBackgroundColor:", 0);
    -[_CertInfoGradientLabel setOpaque:](v4, "setOpaque:", 0);
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("TrustedCheckmark"), v5);
      v13 = objc_claimAutoreleasedReturnValue();
      checkImage = v4->_checkImage;
      v4->_checkImage = (UIImage *)v13;

      v15 = CFSTR("TrustedTextGradient");
    }
    else
    {
      v15 = CFSTR("NotTrustedTextGradient");
    }
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", v15, v5);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (objc_msgSend(v16, "CGImage"))
    {
      Pattern = CGColorSpaceCreatePattern(0);
      objc_msgSend(v16, "scale");
      memset(&v22, 0, sizeof(v22));
      v18 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      *(_OWORD *)&v24.a = *MEMORY[0x24BDBD8B8];
      *(_OWORD *)&v24.c = v18;
      *(_OWORD *)&v24.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
      CGAffineTransformScale(&v22, &v24, 1.0 / v19, -1.0 / v19);
      v24 = v22;
      v20 = (CGPattern *)CGPatternCreateWithImage2();
      *(_OWORD *)&v24.a = xmmword_20DB03FD0;
      *(_OWORD *)&v24.c = unk_20DB03FE0;
      v4->_patternColor = CGColorCreateWithPattern(Pattern, v20, &v24.a);
      if (Pattern)
        CFRelease(Pattern);
      if (v20)
        CFRelease(v20);
    }

  }
  return v4;
}

- (void)dealloc
{
  CGColor *patternColor;
  objc_super v4;

  patternColor = self->_patternColor;
  if (patternColor)
    CFRelease(patternColor);
  v4.receiver = self;
  v4.super_class = (Class)_CertInfoGradientLabel;
  -[_CertInfoGradientLabel dealloc](&v4, sel_dealloc);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIImage *checkImage;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[NSString _legacy_sizeWithFont:constrainedToSize:lineBreakMode:](self->_text, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", self->_font, 4, *(double *)(MEMORY[0x24BDBF028] + 16), *(double *)(MEMORY[0x24BDBF028] + 24));
  v5 = v4;
  v7 = v6;
  checkImage = self->_checkImage;
  if (checkImage)
  {
    -[UIImage size](checkImage, "size");
    v5 = v5 + v9 + 2.0;
  }
  v10 = v5;
  v11 = v7;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  double v5;
  double v6;
  double v7;
  UIImage *checkImage;
  double v9;
  double v10;
  double v11;
  double v12;
  UIImage *v13;
  double v14;
  double v15;
  _OWORD v16[2];
  uint64_t v17;
  CGSize v18;

  v17 = *MEMORY[0x24BDAC8D0];
  CurrentContext = UIGraphicsGetCurrentContext();
  -[_CertInfoGradientLabel bounds](self, "bounds");
  v7 = v6;
  checkImage = self->_checkImage;
  if (checkImage)
  {
    -[UIImage size](checkImage, "size");
    v10 = v9;
    v12 = v11;
    v13 = self->_checkImage;
    -[_CertInfoGradientLabel bounds](self, "bounds");
    -[UIImage drawAtPoint:](v13, "drawAtPoint:", 0.0, (v14 - v12) * 0.5);
    v15 = v10 + 2.0;
  }
  else
  {
    v15 = v5;
  }
  v16[0] = xmmword_20DB03FF0;
  v16[1] = unk_20DB04000;
  CGContextSetFillColor(CurrentContext, (const CGFloat *)v16);
  -[NSString _legacy_drawAtPoint:withFont:](self->_text, "_legacy_drawAtPoint:withFont:", self->_font, v15, v7);
  CGContextSetFillColorWithColor(CurrentContext, self->_patternColor);
  CGContextSaveGState(CurrentContext);
  v18.width = v15;
  v18.height = v7;
  CGContextSetPatternPhase(CurrentContext, v18);
  -[NSString _legacy_drawAtPoint:withFont:](self->_text, "_legacy_drawAtPoint:withFont:", self->_font, v15, v7);
  CGContextRestoreGState(CurrentContext);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkImage, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
