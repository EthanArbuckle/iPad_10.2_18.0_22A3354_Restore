@implementation HFMutableColorPalette

- (void)setColor:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint8_t buf[16];

  v6 = a3;
  -[HFColorPalette colors](self, "colors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a4)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[HFColorPalette colors](self, "colors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Attempting to set a color outside of the allotted %@ slots"), v11);

  }
  v12 = -[HFColorPalette _isNaturalLightPalette](self, "_isNaturalLightPalette");
  if (a4 || !v12)
  {
    if (objc_msgSend(v6, "isNaturalLightColor"))
    {
      NSLog(CFSTR("You can't set the Natural Light color."));
    }
    else
    {
      -[HFColorPalette rawColors](self, "rawColors");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "mutableCopy");

      objc_msgSend(v15, "setObject:atIndexedSubscript:", v6, a4);
      -[HFColorPalette setRawColors:](self, "setRawColors:", v15);

    }
  }
  else
  {
    HFLogForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "Ignoring attempt to change the color position reservered for the natural light swatch.", buf, 2u);
    }

  }
}

@end
