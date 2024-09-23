@implementation UIImage(PDFMarkupMenuUtilities)

+ (id)smallColorPotForColor:()PDFMarkupMenuUtilities withAccessibilityLabel:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("circle.fill"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "imageWithTintColor:renderingMode:", v5, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAccessibilityLabel:", v6);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)smallUnderlinePot
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("underline"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    v1 = v0;
    objc_msgSend(v0, "imageWithRenderingMode:", 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    PDFKitLocalizedString(CFSTR("Underline"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAccessibilityLabel:", v3);

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

+ (id)smallStrikeOutPot
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("strikethrough"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    v1 = v0;
    objc_msgSend(v0, "imageWithRenderingMode:", 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    PDFKitLocalizedString(CFSTR("Strikethrough"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAccessibilityLabel:", v3);

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

+ (id)largeColorPotForColor:()PDFMarkupMenuUtilities
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithSize:", 28.0, 28.0);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__UIImage_PDFMarkupMenuUtilities__largeColorPotForColor___block_invoke;
  v8[3] = &unk_24C25D378;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "imageWithActions:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_largePotWithSystemImageNamed:()PDFMarkupMenuUtilities
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v3 = (void *)MEMORY[0x24BDF6AE0];
  v4 = a3;
  objc_msgSend(v3, "configurationWithScale:", -1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "imageWithRenderingMode:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithSize:", 28.0, 28.0);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __65__UIImage_PDFMarkupMenuUtilities___largePotWithSystemImageNamed___block_invoke;
  v12[3] = &unk_24C25D378;
  v13 = v7;
  v9 = v7;
  objc_msgSend(v8, "imageWithActions:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (uint64_t)largeUnderlinePot
{
  return objc_msgSend(a1, "_largePotWithSystemImageNamed:", CFSTR("underline"));
}

+ (uint64_t)largeStrikeOutPot
{
  return objc_msgSend(a1, "_largePotWithSystemImageNamed:", CFSTR("strikethrough"));
}

@end
