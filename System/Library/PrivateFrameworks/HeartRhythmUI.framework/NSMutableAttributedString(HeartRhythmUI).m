@implementation NSMutableAttributedString(HeartRhythmUI)

+ (id)hrui_bulletedString:()HeartRhythmUI textStyle:
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(CFSTR("• "), "stringByAppendingString:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A80]), "initForTextStyle:", v5);
  objc_msgSend(v7, "scaledValueForValue:", 12.0);
  v9 = v8;
  objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  v12 = objc_alloc(MEMORY[0x24BDF6780]);
  v13 = (void *)objc_msgSend(v12, "initWithTextAlignment:location:options:", 4, MEMORY[0x24BDBD1B8], v9);
  v22[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTabStops:", v14);

  objc_msgSend(v7, "scaledValueForValue:", 4.0);
  objc_msgSend(v11, "setParagraphSpacingBefore:");
  objc_msgSend(v11, "setDefaultTabInterval:", v9);
  objc_msgSend(v11, "setFirstLineHeadIndent:", 0.0);
  objc_msgSend(v11, "setHeadIndent:", v9);
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = *MEMORY[0x24BDF65F8];
  v20[0] = *MEMORY[0x24BDF6628];
  v20[1] = v16;
  v21[0] = v11;
  v21[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v6);
  objc_msgSend(v18, "addAttributes:range:", v17, 0, objc_msgSend(v6, "length"));

  return v18;
}

+ (id)hrui_attributedStringForText:()HeartRhythmUI style:color:boldText:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = (void *)MEMORY[0x24BDF6A70];
  v13 = a4;
  objc_msgSend(v12, "preferredFontForTextStyle:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "hk_preferredFontForTextStyle:symbolicTraits:", v13, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = *MEMORY[0x24BDF65F8];
  v22[0] = *MEMORY[0x24BDF6600];
  v22[1] = v16;
  v23[0] = v10;
  v23[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:attributes:", v9, v17);
  if (v11)
  {
    v19 = objc_msgSend(v9, "localizedStandardRangeOfString:", v11);
    if (v20 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v18, "addAttribute:value:range:", v16, v15, v19, v20);
  }

  return v18;
}

@end
