@implementation CLKFont

+ (id)systemFontOfSize:(double)a3
{
  return (id)objc_msgSend(a1, "systemFontOfSize:weight:", a3, *MEMORY[0x24BEBE268]);
}

+ (id)systemFontOfSize:(double)a3 weight:(double)a4
{
  uint64_t v4;
  objc_super v6;

  v4 = *MEMORY[0x24BEBE1C8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CLKFont;
  objc_msgSendSuper2(&v6, sel_systemFontOfSize_weight_design_, v4, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)systemFontOfSize:(double)a3 weight:(double)a4 design:(id)a5
{
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CLKFont;
  objc_msgSendSuper2(&v6, sel_systemFontOfSize_weight_design_, a5, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)fontWithDescriptor:(id)a3 size:(double)a4
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CLKFont;
  objc_msgSendSuper2(&v5, sel_fontWithDescriptor_size_, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)fontWithName:(id)a3 size:(double)a4
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CLKFont;
  objc_msgSendSuper2(&v5, sel_fontWithName_size_, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)compactSoftFontOfSize:(double)a3 weight:(double)a4
{
  return (id)objc_msgSend(a1, "systemFontOfSize:weight:design:", *MEMORY[0x24BDC4DF8], a3, a4);
}

+ (id)nonAccessibleSystemFontOfSize:(double)a3 weight:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "systemFontOfSize:weight:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x24BDC4D48];
  v14[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontDescriptorByAddingAttributes:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___CLKFont;
  objc_msgSendSuper2(&v12, sel_fontWithDescriptor_size_, v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)nonAccessibleCompactSoftFontOfSize:(double)a3 weight:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "compactSoftFontOfSize:weight:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x24BDC4D48];
  v14[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontDescriptorByAddingAttributes:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___CLKFont;
  objc_msgSendSuper2(&v12, sel_fontWithDescriptor_size_, v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (CLKFont)fontWithSize:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLKFont;
  -[CLKFont fontWithSize:](&v4, sel_fontWithSize_, a3);
  return (CLKFont *)(id)objc_claimAutoreleasedReturnValue();
}

@end
