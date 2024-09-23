@implementation NTKWhistlerAnalogColorPalette

- (NTKWhistlerAnalogColorPalette)initWithDevice:(id)a3
{
  id v5;
  NTKWhistlerAnalogColorPalette *v6;
  NTKWhistlerAnalogColorPalette *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKWhistlerAnalogColorPalette;
  v6 = -[NTKWhistlerAnalogColorPalette init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (id)handStrokeColorForColorPalette:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor", a3);
}

- (id)handFillColorForColorPalette:(id)a3
{
  if (objc_msgSend(a3, "isWhiteColor"))
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)secondHandColorForColorPalette:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isMulticolor") & 1) != 0
    || (objc_msgSend(v3, "isBlackColor") & 1) != 0
    || objc_msgSend(v3, "isWhiteColor"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "primaryColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (id)hourTicksColorForColorPalette:(id)a3
{
  if (objc_msgSend(a3, "isWhiteColor"))
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)minuteTicksColorForColorPalette:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "isWhiteColor"))
  {
    NTKColorWithRGBA(150, 150, 150, 1.0);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v3, "isBlackColor"))
    {
      objc_msgSend(v3, "primaryColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "colorWithAlphaComponent:", 0.5);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.4, 1.0);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_7:

  return v5;
}

- (id)dialFillColorForColorPalette:(id)a3
{
  if (objc_msgSend(a3, "isWhiteColor"))
    NTKColorWithRGBA(229, 229, 229, 1.0);
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)bezelTextColorForColorPalette:(id)a3
{
  id v3;
  void *v4;
  double v5;
  int v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "isWhiteColor"))
  {
    v4 = (void *)MEMORY[0x1E0DC3658];
    v5 = 0.15;
  }
  else
  {
    v6 = objc_msgSend(v3, "isBlackColor");
    v4 = (void *)MEMORY[0x1E0DC3658];
    if (v6)
      v5 = 0.85;
    else
      v5 = 0.944444444;
  }
  objc_msgSend(v4, "colorWithWhite:alpha:", v5, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)platterTextColorForColorPalette:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "isWhiteColor"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v3, "isBlackColor"))
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.9, 1.0);
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (id)complicationForegroundColorPalette:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "isWhiteColor"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v3, "isBlackColor"))
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.9, 1.0);
    else
      objc_msgSend(v3, "primaryColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

@end
