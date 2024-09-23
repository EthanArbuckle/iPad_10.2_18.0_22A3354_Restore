@implementation UIFont(NAUIAdditions)

+ (id)naui_ultraLightMonospacedFontOfSize:()NAUIAdditions
{
  CTFontRef UIFontForLanguage;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontMenuTitleFontType|0x80, a1, 0);
  -[__CTFont fontDescriptor](UIFontForLanguage, "fontDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x24BEBB548];
  v4 = *MEMORY[0x24BEBB598];
  v14[0] = *MEMORY[0x24BEBB5A0];
  v3 = v14[0];
  v14[1] = v4;
  v15[0] = &unk_24D614C08;
  v15[1] = &unk_24D614C20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  v12[0] = v3;
  v12[1] = v4;
  v13[0] = &unk_24D614C38;
  v13[1] = &unk_24D614C50;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorByAddingAttributes:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v9, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NAUITextStyleDescriptor)naui_dynamicFontTextStyleDescriptor
{
  void *v2;
  void *v3;
  void *v4;
  NAUITextStyleDescriptor *v5;
  void *v6;
  NAUITextStyleDescriptor *v7;

  objc_msgSend(a1, "fontDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BEBB588]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = [NAUITextStyleDescriptor alloc];
    objc_msgSend(a1, "fontDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NAUITextStyleDescriptor initWithTextStyle:symbolicTraits:allowsAccessibilitySizes:allowsSmallSizes:](v5, "initWithTextStyle:symbolicTraits:allowsAccessibilitySizes:allowsSmallSizes:", v4, objc_msgSend(v6, "symbolicTraits"), 1, 1);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
