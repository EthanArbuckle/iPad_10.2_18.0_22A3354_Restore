@implementation UIFont(MTUIFonts)

+ (id)mtui_defaultTimeDesignatorFont
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(a1, "mtui_defaultTimeDesignatorFontSize");
  objc_msgSend(v1, "systemFontOfSize:weight:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mtui_fontByAddingAttributes:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)mtui_fontByAddingAttributes:()MTUIFonts
{
  char v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return a1;
  v4 = a3;
  objc_msgSend(a1, "fontDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "pointSize");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDC4D80]);

  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = (_QWORD *)MEMORY[0x24BDF7780];
  v11 = (uint64_t *)MEMORY[0x24BDF7778];
  if ((v4 & 1) != 0)
  {
    v12 = *MEMORY[0x24BDF7778];
    v21[0] = *MEMORY[0x24BDF7780];
    v21[1] = v12;
    v22[0] = &unk_24F019668;
    v22[1] = &unk_24F019680;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v13);

  }
  if ((v4 & 2) != 0)
  {
    v14 = *v11;
    v19[0] = *v10;
    v19[1] = v14;
    v20[0] = &unk_24F019698;
    v20[1] = &unk_24F0196B0;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v15);

  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDF7748]);
  objc_msgSend(v5, "fontDescriptorByAddingAttributes:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v16, 0.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (double)mtui_defaultTimeDesignatorFontSize
{
  return 37.0;
}

+ (id)mtui_thinTimeFont
{
  void *v2;
  void *CopyOfSystemUIFontWithGrade;

  objc_msgSend(a1, "mtui_defaultTimeFontSize");
  objc_msgSend(a1, "mtui_thinTimeFontOfSize:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CopyOfSystemUIFontWithGrade = (void *)CTFontCreateCopyOfSystemUIFontWithGrade();

  return CopyOfSystemUIFontWithGrade;
}

+ (CTFontRef)mtui_thinTimeFontOfSize:()MTUIFonts
{
  return CTFontCreateUIFontForLanguage(kCTFontMenuItemFontType|0x80, a1, 0);
}

+ (double)mtui_defaultTimeFontSize
{
  return 60.0;
}

+ (CTFontRef)mtui_lightTimeFontOfSize:()MTUIFonts
{
  return CTFontCreateUIFontForLanguage(kCTFontMiniEmphasizedSystemFontType|0x60, a1, 0);
}

+ (id)mtui_lightTimeFont
{
  void *v2;
  void *CopyOfSystemUIFontWithGrade;

  objc_msgSend(a1, "mtui_defaultTimeFontSize");
  objc_msgSend(a1, "mtui_lightTimeFontOfSize:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CopyOfSystemUIFontWithGrade = (void *)CTFontCreateCopyOfSystemUIFontWithGrade();

  return CopyOfSystemUIFontWithGrade;
}

- (uint64_t)mtui_fontByAddingTimeFontAttributes
{
  return objc_msgSend(a1, "mtui_fontByAddingAttributes:", 1);
}

@end
