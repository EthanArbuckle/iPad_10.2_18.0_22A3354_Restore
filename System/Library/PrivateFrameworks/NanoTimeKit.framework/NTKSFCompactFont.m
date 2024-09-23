@implementation NTKSFCompactFont

+ (id)numericFontOfSize:(double)a3 weight:(double)a4
{
  return +[NTKSFCompactFont fontOfType:size:weight:](NTKSFCompactFont, "fontOfType:size:weight:", 1, a3, a4);
}

+ (id)numericSoftFontOfSize:(double)a3 weight:(double)a4
{
  return +[NTKSFCompactFont fontOfType:size:weight:](NTKSFCompactFont, "fontOfType:size:weight:", 2, a3, a4);
}

+ (id)numericRoundedFontOfSize:(double)a3 weight:(double)a4
{
  return +[NTKSFCompactFont fontOfType:size:weight:](NTKSFCompactFont, "fontOfType:size:weight:", 3, a3, a4);
}

+ (id)fontOfType:(int64_t)a3 size:(double)a4 weight:(double)a5
{
  _BOOL4 IsBoldTextEnabled;
  double v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v10 = *MEMORY[0x1E0DC1448];
  if (*MEMORY[0x1E0DC1448] == a5)
    v10 = *MEMORY[0x1E0DC1420];
  if (IsBoldTextEnabled)
    a5 = v10;
  if (fontOfType_size_weight__onceToken != -1)
    dispatch_once(&fontOfType_size_weight__onceToken, &__block_literal_global_151);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("t%ld-s%f-w%f"), a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)fontOfType_size_weight____fontCache, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = v12;
  }
  else
  {
    switch(a3)
    {
      case 3:
        +[NTKSFCompactFontLoader sfCompactNumericRoundedFontDescriptor](NTKSFCompactFontLoader, "sfCompactNumericRoundedFontDescriptor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = CFSTR("SF Compact Rounded Numeric");
        break;
      case 2:
        +[NTKSFCompactFontLoader sfCompactNumericSoftFontDescriptor](NTKSFCompactFontLoader, "sfCompactNumericSoftFontDescriptor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = CFSTR("SF Compact Soft");
        break;
      case 1:
        +[NTKSFCompactFontLoader sfCompactNumericFontDescriptor](NTKSFCompactFontLoader, "sfCompactNumericFontDescriptor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = CFSTR("SF Compact Numeric");
        break;
      default:
        v14 = 0;
        v15 = 0;
        break;
    }
    objc_msgSend(v14, "fontAttributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

    v24 = *MEMORY[0x1E0DC1458];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0DC13C0]);

    objc_msgSend(v17, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0DC1388]);
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0DC1378]);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC1358]), "initWithFontAttributes:", v17);

    v23.receiver = a1;
    v23.super_class = (Class)&OBJC_METACLASS___NTKSFCompactFont;
    objc_msgSendSuper2(&v23, sel_fontWithDescriptor_size_, v20, a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)fontOfType_size_weight____fontCache, "setObject:forKey:", v21, v11);
    v13 = v21;

  }
  return v13;
}

void __43__NTKSFCompactFont_fontOfType_size_weight___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)fontOfType_size_weight____fontCache;
  fontOfType_size_weight____fontCache = (uint64_t)v0;

}

@end
