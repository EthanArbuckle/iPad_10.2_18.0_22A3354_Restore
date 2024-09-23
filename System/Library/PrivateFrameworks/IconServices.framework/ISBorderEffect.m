@implementation ISBorderEffect

- (ISBorderEffect)initWithLineWidth:(double)a3 color:(id)a4
{
  id v7;
  ISBorderEffect *v8;
  ISBorderEffect *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ISBorderEffect;
  v8 = -[ISBorderEffect init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_lineWidth = a3;
    objc_storeStrong((id *)&v8->_color, a4);
  }

  return v9;
}

- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  id v26;
  ISBorderEffect *v27;
  uint64_t v28;
  uint64_t v29;

  v26 = a3;
  v6 = a4;
  -[IFColor ciColor](self->_color, "ciColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v25 = v8;
  v9 = 0;
  if ((int)self->_lineWidth < 1)
  {
    v22 = v8;
  }
  else
  {
    v10 = 0;
    v29 = *MEMORY[0x1E0C9E1C0];
    v27 = self;
    v28 = *MEMORY[0x1E0C9E258];
    v11 = *MEMORY[0x1E0C9E1F8];
    v12 = v8;
    v13 = *MEMORY[0x1E0C9E190];
    do
    {
      objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CUIInnerGlowOrShadowFilter"), v25);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:", 0.0, 0.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setValue:forKey:", v15, CFSTR("inputOffset"));

      objc_msgSend(v14, "setValue:forKey:", v7, v29);
      objc_msgSend(v14, "setValue:forKey:", &unk_1E5816628, v28);
      objc_msgSend(v14, "setValue:forKey:", &unk_1E5816638, CFSTR("inputRange"));
      objc_msgSend(v14, "setValue:forKey:", v12, v11);
      v16 = v14;

      objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CISourceOverCompositing"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "outputImage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "setValue:forKey:", v18, v11);
      objc_msgSend(v17, "setValue:forKey:", v12, v13);
      v19 = v17;
      objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CISourceInCompositing"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "outputImage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "setValue:forKey:", v21, v11);
      objc_msgSend(v20, "setValue:forKey:", v12, v13);
      v9 = v20;
      objc_msgSend(v9, "outputImage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      ++v10;
      v12 = v22;
    }
    while (v10 < (int)v27->_lineWidth);
  }
  if (v26)
  {
    objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CISourceOverCompositing"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setValue:forKey:", v22, *MEMORY[0x1E0C9E1F8]);
    objc_msgSend(v23, "setValue:forKey:", v26, *MEMORY[0x1E0C9E190]);

    v9 = v23;
  }

  return v9;
}

- (IFColor)color
{
  return (IFColor *)objc_getProperty(self, a2, 8, 1);
}

- (void)setColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
