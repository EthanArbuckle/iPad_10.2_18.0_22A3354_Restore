@implementation ISDropShaddowEffect

- (ISDropShaddowEffect)init
{
  char *v2;
  ISDropShaddowEffect *v3;
  uint64_t v4;
  IFColor *color;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ISDropShaddowEffect;
  v2 = -[ISDropShaddowEffect init](&v7, sel_init);
  v3 = (ISDropShaddowEffect *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 40) = xmmword_1AA977460;
    *(_OWORD *)(v2 + 8) = xmmword_1AA977470;
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithWhite:alpha:", 0.0, 0.5);
    color = v3->_color;
    v3->_color = (IFColor *)v4;

    v3->_spread = 0.0;
  }
  return v3;
}

- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4
{
  double scale;
  IFColor *color;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;

  scale = self->_scale;
  color = self->_color;
  v7 = a4;
  -[IFColor ciColor](color, "ciColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CUIOuterGlowOrShadowFilter"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", scale);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v10, *MEMORY[0x1E0C9E258]);

  v11 = (void *)MEMORY[0x1E0C9DDF8];
  -[ISDropShaddowEffect offset](self, "offset");
  v13 = scale * v12;
  -[ISDropShaddowEffect offset](self, "offset");
  objc_msgSend(v11, "vectorWithX:Y:", v13, scale * v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v15, CFSTR("inputOffset"));

  objc_msgSend(v9, "setValue:forKey:", v8, *MEMORY[0x1E0C9E1C0]);
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[ISDropShaddowEffect blur](self, "blur");
  objc_msgSend(v16, "numberWithDouble:", scale * v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v18, CFSTR("inputSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", scale);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v19, CFSTR("inputRange"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", scale * self->_spread);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v20, CFSTR("inputSpread"));

  v21 = *MEMORY[0x1E0C9E1F8];
  objc_msgSend(v9, "setValue:forKey:", v7, *MEMORY[0x1E0C9E1F8]);
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CISourceOverCompositing"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setValue:forKey:", v7, v21);

  objc_msgSend(v9, "outputImage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setValue:forKey:", v23, *MEMORY[0x1E0C9E190]);

  return v22;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (CGSize)offset
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_offset, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setOffset:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_offset, &v3, 16, 1, 0);
}

- (double)blur
{
  return self->_blur;
}

- (void)setBlur:(double)a3
{
  self->_blur = a3;
}

- (double)spread
{
  return self->_spread;
}

- (void)setSpread:(double)a3
{
  self->_spread = a3;
}

- (IFColor)color
{
  return (IFColor *)objc_getProperty(self, a2, 32, 1);
}

- (void)setColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
