@implementation NTKFaceColorScheme

- (id)initForDevice:(id)a3
{
  id v5;
  NTKFaceColorScheme *v6;
  NTKFaceColorScheme *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *colorsByUnit;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKFaceColorScheme;
  v6 = -[NTKFaceColorScheme init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    colorsByUnit = v7->_colorsByUnit;
    v7->_colorsByUnit = v8;

  }
  return v7;
}

+ (id)colorSchemeForDevice:(id)a3 withFaceColorPalette:(id)a4 units:(unint64_t)a5
{
  return +[NTKFaceColorScheme colorSchemeForDevice:withFaceColorPalette:foregroundColor:units:alternateHighlight:](NTKFaceColorScheme, "colorSchemeForDevice:withFaceColorPalette:foregroundColor:units:alternateHighlight:", a3, a4, 0, a5, 0);
}

+ (id)colorSchemeForDevice:(id)a3 withFaceColorPalette:(id)a4 foregroundColor:(id)a5 units:(unint64_t)a6 alternateHighlight:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  unsigned int v14;
  void *v15;
  char v16;
  char v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void (**v23)(void *, unint64_t);
  id v24;
  unint64_t v25;
  void *v26;
  BOOL v27;
  _QWORD aBlock[4];
  id v30;
  id v31;
  id v32;
  id v33;
  BOOL v34;
  char v35;
  char v36;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v13)
  {
    if (objc_msgSend(v12, "isMulticolor"))
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    else
      objc_msgSend(v12, "primaryColor");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v12, "isWhite"))
  {
    v14 = objc_msgSend(v12, "isMulticolor");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "isEqual:", v15);

    v14 = objc_msgSend(v12, "isMulticolor");
    if ((v16 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      goto LABEL_11;
    }
  }
  v17 = 1;
  NTKSecondaryForegroundGrayColor();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__NTKFaceColorScheme_colorSchemeForDevice_withFaceColorPalette_foregroundColor_units_alternateHighlight___block_invoke;
  aBlock[3] = &unk_1E6BD2650;
  v34 = a7;
  v19 = v18;
  v30 = v19;
  v20 = v13;
  v31 = v20;
  v21 = v12;
  v32 = v21;
  v35 = v17;
  v22 = v11;
  v33 = v22;
  v36 = v14;
  v23 = (void (**)(void *, unint64_t))_Block_copy(aBlock);
  v24 = -[NTKFaceColorScheme initForDevice:]([NTKFaceColorScheme alloc], "initForDevice:", v22);
  v25 = 1;
  do
  {
    if ((v25 & a6) != 0)
    {
      v23[2](v23, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_setColor:forUnit:", v26, v25);

    }
    v27 = v25 >= 0x201;
    v25 *= 2;
  }
  while (!v27);
  objc_msgSend(v24, "setMulticolorAlpha:", (double)v14);
  objc_msgSend(v24, "setContainsOverrideFaceColor:", objc_msgSend(v21, "isMulticolor"));
  objc_msgSend(v24, "setFaceColorPalette:", v21);

  return v24;
}

id __105__NTKFaceColorScheme_colorSchemeForDevice_withFaceColorPalette_foregroundColor_units_alternateHighlight___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = 0;
  if (a2 <= 63)
  {
    switch(a2)
    {
      case 1:
        v4 = *(_BYTE *)(a1 + 64) == 0;
        v5 = 32;
        v6 = 40;
        goto LABEL_18;
      case 2:
        v4 = *(_BYTE *)(a1 + 64) == 0;
        v5 = 40;
        v6 = 32;
LABEL_18:
        if (v4)
          v5 = v6;
        v7 = *(void **)(a1 + v5);
        goto LABEL_31;
      case 3:
      case 5:
      case 6:
      case 7:
        return v3;
      case 4:
        objc_msgSend(*(id *)(a1 + 48), "secondaryColor");
        v3 = (id)objc_claimAutoreleasedReturnValue();
        return v3;
      case 8:
        if (!*(_BYTE *)(a1 + 65))
          goto LABEL_29;
        objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
        v3 = (id)objc_claimAutoreleasedReturnValue();
        return v3;
      default:
        if (a2 == 16)
        {
          objc_msgSend(*(id *)(a1 + 48), "primaryShiftedColor");
          v3 = (id)objc_claimAutoreleasedReturnValue();
        }
        else if (a2 == 32)
        {
          objc_msgSend(*(id *)(a1 + 48), "secondaryShiftedColor");
          v3 = (id)objc_claimAutoreleasedReturnValue();
        }
        return v3;
    }
  }
  if (a2 <= 255)
  {
    if (a2 == 64)
    {
      if (!*(_BYTE *)(a1 + 66))
      {
        v7 = *(void **)(a1 + 32);
        goto LABEL_31;
      }
    }
    else
    {
      if (a2 != 128)
        return v3;
      if ((objc_msgSend(*(id *)(a1 + 48), "isZeus") & 1) != 0
        || objc_msgSend(*(id *)(a1 + 48), "isVictory"))
      {
        objc_msgSend(*(id *)(a1 + 48), "primaryColor");
        v3 = (id)objc_claimAutoreleasedReturnValue();
        return v3;
      }
    }
LABEL_27:
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  switch(a2)
  {
    case 256:
      goto LABEL_27;
    case 512:
      if ((objc_msgSend(*(id *)(a1 + 48), "isWhite") & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.45, 1.0);
        v3 = (id)objc_claimAutoreleasedReturnValue();
        return v3;
      }
LABEL_29:
      v7 = *(void **)(a1 + 40);
LABEL_31:
      v3 = v7;
      return v3;
    case 1024:
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v3;
}

+ (id)interpolationFrom:(id)a3 to:(id)a4 fraction:(double)a5
{
  return (id)objc_msgSend(a1, "interpolationFrom:to:fraction:brightenUnits:", a3, a4, 0, a5);
}

+ (id)interpolationFrom:(id)a3 to:(id)a4 fraction:(double)a5 brightenUnits:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  double v30;
  uint64_t v31;
  BOOL v32;
  void *v34;
  void *v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;

  v10 = a3;
  v11 = a4;
  v12 = objc_alloc((Class)a1);
  objc_msgSend(v10, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initForDevice:", v13);

  v15 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v10, "faceColors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "faceColors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v17;
  objc_msgSend(v17, "setByAddingObjectsFromArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = v19;
  objc_msgSend(v19, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFaceColors:", v20);

  if ((objc_msgSend(v10, "containsOverrideFaceColor") & 1) != 0)
    v21 = 1;
  else
    v21 = objc_msgSend(v11, "containsOverrideFaceColor");
  objc_msgSend(v14, "setContainsOverrideFaceColor:", v21);
  objc_msgSend(v10, "multicolorAlpha");
  objc_msgSend(v11, "multicolorAlpha");
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v14, "setMulticolorAlpha:");
  v22 = a5 + -0.5;
  if (a5 + -0.5 < 0.0)
    v22 = -(a5 + -0.5);
  v23 = (0.5 - v22) * 0.8;
  v24 = 1;
  do
  {
    objc_msgSend(v10, "_colorForUnit:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_colorForUnit:", v24);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (v25 && v26)
    {
      NTKInterpolateBetweenColors(v25, v26);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      if (!v28)
        goto LABEL_22;
    }
    else
    {
      if (!(v25 | v26))
      {
        v28 = 0;
        goto LABEL_22;
      }
      if (v25)
        v29 = (void *)v25;
      else
        v29 = (void *)v26;
      v28 = v29;
    }
    if ((v24 & a6) != 0)
    {
      v38 = 0.0;
      v39 = 0.0;
      v36 = 0;
      v37 = 0.0;
      objc_msgSend(v28, "getHue:saturation:brightness:alpha:", &v39, &v38, &v37, &v36);
      if (v23 + v37 <= 1.0)
        v30 = v23 + v37;
      else
        v30 = 1.0;
      v37 = v30;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v39, v38);
      v31 = objc_claimAutoreleasedReturnValue();

      v28 = (id)v31;
    }
LABEL_22:
    objc_msgSend(v14, "_setColor:forUnit:", v28, v24);

    v32 = v24 >= 0x201;
    v24 *= 2;
  }
  while (!v32);

  return v14;
}

+ (id)interpolationForDevice:(id)a3 fromFaceColorPalette:(id)a4 toFaceColorPalette:(id)a5 fraction:(double)a6 units:(unint64_t)a7 brightenUnits:(unint64_t)a8 overrideColor:(id)a9 alternateHighlight:(BOOL)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  int v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;

  v15 = a5;
  v16 = a9;
  v17 = a4;
  v18 = a3;
  LODWORD(a4) = objc_msgSend(v17, "isMulticolor");
  v19 = objc_msgSend(v15, "isMulticolor");
  if ((_DWORD)a4)
    v20 = v16;
  else
    v20 = 0;
  +[NTKFaceColorScheme colorSchemeForDevice:withFaceColorPalette:foregroundColor:units:alternateHighlight:](NTKFaceColorScheme, "colorSchemeForDevice:withFaceColorPalette:foregroundColor:units:alternateHighlight:", v18, v17, v20, a7, a10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    v22 = v16;
  else
    v22 = 0;
  +[NTKFaceColorScheme colorSchemeForDevice:withFaceColorPalette:foregroundColor:units:alternateHighlight:](NTKFaceColorScheme, "colorSchemeForDevice:withFaceColorPalette:foregroundColor:units:alternateHighlight:", v18, v15, v22, a7, a10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  +[NTKFaceColorScheme interpolationFrom:to:fraction:brightenUnits:](NTKFaceColorScheme, "interpolationFrom:to:fraction:brightenUnits:", v21, v23, a8, a6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (UIColor)foregroundColor
{
  return (UIColor *)-[NTKFaceColorScheme _colorForUnit:](self, "_colorForUnit:", 1);
}

- (UIColor)secondaryForegroundColor
{
  return (UIColor *)-[NTKFaceColorScheme _colorForUnit:](self, "_colorForUnit:", 2);
}

- (UIColor)backgroundColor
{
  return (UIColor *)-[NTKFaceColorScheme _colorForUnit:](self, "_colorForUnit:", 4);
}

- (UIColor)accentColor
{
  return (UIColor *)-[NTKFaceColorScheme _colorForUnit:](self, "_colorForUnit:", 8);
}

- (UIColor)shiftedForegroundColor
{
  return (UIColor *)-[NTKFaceColorScheme _colorForUnit:](self, "_colorForUnit:", 16);
}

- (UIColor)shiftedBackgroundColor
{
  return (UIColor *)-[NTKFaceColorScheme _colorForUnit:](self, "_colorForUnit:", 32);
}

- (UIColor)stackedImagesForegroundColor
{
  return (UIColor *)-[NTKFaceColorScheme _colorForUnit:](self, "_colorForUnit:", 64);
}

- (UIColor)tickColor
{
  return (UIColor *)-[NTKFaceColorScheme _colorForUnit:](self, "_colorForUnit:", 128);
}

- (UIColor)alternativeTickColor
{
  return (UIColor *)-[NTKFaceColorScheme _colorForUnit:](self, "_colorForUnit:", 256);
}

- (UIColor)activityTickColor
{
  return (UIColor *)-[NTKFaceColorScheme _colorForUnit:](self, "_colorForUnit:", 512);
}

- (UIColor)upNextTextColor
{
  return (UIColor *)-[NTKFaceColorScheme _colorForUnit:](self, "_colorForUnit:", 1024);
}

- (unint64_t)units
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allKeys](self->_colorsByUnit, "allKeys", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 |= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "unsignedIntegerValue");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  NTKFaceColorScheme *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  int v9;
  BOOL v10;
  BOOL v11;

  v4 = (NTKFaceColorScheme *)a3;
  if (v4 == self)
  {
LABEL_9:
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[NTKFaceColorScheme units](v4, "units");
      if (v5 == -[NTKFaceColorScheme units](self, "units"))
      {
        v6 = 1;
        while (1)
        {
          if ((-[NTKFaceColorScheme units](self, "units") & v6) != 0)
          {
            -[NTKFaceColorScheme _colorForUnit:](self, "_colorForUnit:", v6);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            -[NTKFaceColorScheme _colorForUnit:](v4, "_colorForUnit:", v6);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = objc_msgSend(v7, "isEqual:", v8);

            if (!v9)
              break;
          }
          v10 = v6 >= 0x201;
          v6 *= 2;
          if (v10)
            goto LABEL_9;
        }
      }
    }
    v11 = 0;
  }

  return v11;
}

- (void)_setColor:(id)a3 forUnit:(unint64_t)a4
{
  NSMutableDictionary *colorsByUnit;
  void *v7;
  id v8;

  v8 = a3;
  colorsByUnit = self->_colorsByUnit;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    -[NSMutableDictionary setObject:forKey:](colorsByUnit, "setObject:forKey:", v8, v7);
  else
    -[NSMutableDictionary removeObjectForKey:](colorsByUnit, "removeObjectForKey:", v7);

}

- (id)_colorForUnit:(unint64_t)a3
{
  NSMutableDictionary *colorsByUnit;
  void *v4;
  void *v5;

  colorsByUnit = self->_colorsByUnit;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](colorsByUnit, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NTKFaceColorPalette)faceColorPalette
{
  return self->_faceColorPalette;
}

- (void)setFaceColorPalette:(id)a3
{
  objc_storeStrong((id *)&self->_faceColorPalette, a3);
}

- (CLKDevice)device
{
  return self->_device;
}

- (BOOL)containsOverrideFaceColor
{
  return self->_containsOverrideFaceColor;
}

- (void)setContainsOverrideFaceColor:(BOOL)a3
{
  self->_containsOverrideFaceColor = a3;
}

- (double)multicolorAlpha
{
  return self->_multicolorAlpha;
}

- (void)setMulticolorAlpha:(double)a3
{
  self->_multicolorAlpha = a3;
}

- (NSArray)faceColors
{
  return self->_faceColors;
}

- (void)setFaceColors:(id)a3
{
  objc_storeStrong((id *)&self->_faceColors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceColors, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_faceColorPalette, 0);
  objc_storeStrong((id *)&self->_colorsByUnit, 0);
}

@end
