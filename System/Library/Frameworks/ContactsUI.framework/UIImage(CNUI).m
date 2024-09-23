@implementation UIImage(CNUI)

+ (id)cnui_userActionSymbolImageForActionType:()CNUI scale:withColor:compatibleWithTextStyle:
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v9 = (void *)MEMORY[0x1E0D13DA8];
  v10 = a6;
  v11 = a5;
  objc_msgSend(v9, "symbolImageNameForActionType:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cnui_symbolImageNamed:scale:withColor:useFixedSize:compatibleWithTextStyle:", v12, 2, v11, 1, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)cnui_userActionOutlinedSymbolImageForActionType:()CNUI scale:withColor:
{
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v7 = *MEMORY[0x1E0DC4A88];
  v8 = (void *)MEMORY[0x1E0D13DA8];
  v9 = a5;
  objc_msgSend(v8, "symbolOulinedImageNameForActionType:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cnui_symbolImageNamed:scale:withColor:useFixedSize:compatibleWithTextStyle:", v10, 2, v9, 1, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (uint64_t)cnui_symbolImageNamed:()CNUI scale:withColor:useFixedSize:compatibleWithTextStyle:
{
  return objc_msgSend(a1, "cnui_symbolImageNamed:scale:weight:withColor:useFixedSize:compatibleWithTextStyle:", a3, a4, 0, a5, a6, a7);
}

+ (id)cnui_symbolImageNamed:()CNUI scale:weight:withColor:useFixedSize:compatibleWithTextStyle:
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v13 = a3;
  v14 = a6;
  v15 = a8;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
  {
    v16 = 0;
  }
  else
  {
    if (a7)
    {
      objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x1E0DC4918]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:compatibleWithTraitCollection:", v15, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0DC3888];
      objc_msgSend(v18, "pointSize");
      objc_msgSend(v19, "configurationWithPointSize:weight:scale:", a5, a4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", v15, a4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", v13, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v21;
    if (v14)
    {
      objc_msgSend(v21, "imageWithTintColor:", v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "imageWithRenderingMode:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v16;
}

+ (id)cnui_imageNamed:()CNUI
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0DC3870];
  v4 = a3;
  CNContactsUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)cnui_symbolImageForTransportType:()CNUI withColor:
{
  uint64_t v5;
  id v6;
  void *v7;
  id v9;

  if (a3 == 6)
  {
    v5 = *MEMORY[0x1E0DC4A88];
    v6 = a4;
    objc_msgSend(a1, "cnui_symbolImageNamed:scale:withColor:useFixedSize:compatibleWithTextStyle:", CFSTR("staroflife.fill"), 3, v6, 1, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = a4;
    objc_msgSend(a1, "cnui_actionTypeForTransportType:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "cnui_userActionSymbolImageForActionType:scale:withColor:", v6, 2, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (uint64_t)cnui_userActionSymbolImageForActionType:()CNUI scale:withColor:
{
  return objc_msgSend(a1, "cnui_userActionSymbolImageForActionType:scale:withColor:compatibleWithTextStyle:", a3, a4, a5, *MEMORY[0x1E0DC4A88]);
}

+ (id)cnui_actionTypeForTransportType:()CNUI
{
  uint64_t v3;
  id v4;

  v3 = a3 - 1;
  if ((unint64_t)(a3 - 1) <= 6 && ((0x5Fu >> v3) & 1) != 0)
    v4 = **((id **)&unk_1E20501A0 + v3);
  else
    v4 = 0;
  return v4;
}

+ (id)cnui_roundedNavButtonPlatterImage
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3870], "cnui_imageNamed:", CFSTR("contact-card-nav-button-platter"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageWithAlignmentRectInsets:", 0.0, 4.0, 0.0, 4.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (uint64_t)cnui_CGImageSnapshot
{
  CGImage *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGColorSpace *DeviceRGB;
  CGContext *v8;
  CGImageRef Image;
  CGImageRef v10;
  CGRect v12;

  if (!objc_msgSend(a1, "ioSurface"))
    return objc_msgSend(objc_retainAutorelease(a1), "CGImage");
  v2 = (CGImage *)UICreateCGImageFromIOSurface();
  objc_msgSend(a1, "size");
  v4 = v3;
  objc_msgSend(a1, "size");
  v6 = v5;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v8 = CGBitmapContextCreate(0, (unint64_t)v4, (unint64_t)v6, 8uLL, vcvtd_n_u64_f64(v4, 2uLL), DeviceRGB, 1u);
  v12.origin.x = 0.0;
  v12.origin.y = 0.0;
  v12.size.width = v4;
  v12.size.height = v6;
  CGContextDrawImage(v8, v12, v2);
  Image = CGBitmapContextCreateImage(v8);
  v10 = Image;
  if (Image)
    CFAutorelease(Image);
  if (v2)
    CFRelease(v2);
  CGColorSpaceRelease(DeviceRGB);
  if (v8)
    CFRelease(v8);
  return (uint64_t)v10;
}

+ (id)cnui_templateImageNamed:()CNUI withTint:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v6 = a3;
  v7 = a4;
  if (cnui_templateImageNamed_withTint__cn_once_token_1 != -1)
    dispatch_once(&cnui_templateImageNamed_withTint__cn_once_token_1, &__block_literal_global_61677);
  v8 = (id)cnui_templateImageNamed_withTint__cn_once_object_1;
  v9 = v8;
  if (v6)
  {
    objc_msgSend(v8, "objectForKey:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(a1, "cnui_imageNamed:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "imageWithRenderingMode:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setObject:forKey:", v10, v6);
    }
    if (v7)
    {
      objc_msgSend(v10, "imageWithTintColor:", v7);
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v12;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)cnui_tintedImageNamed:()CNUI withTint:
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a4;
  objc_msgSend(a1, "cnui_imageNamed:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "imageWithTintColor:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v7;
  }
  v10 = v9;

  return v10;
}

+ (id)cnui_imageWithDataPreservingScale:()CNUI
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0DC3870];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "_initWithData:preserveScale:", v4, 1);

  return v5;
}

+ (id)cnui_symbolImageForContactCardChevron
{
  void *v2;
  void *v3;

  +[CNUIColorRepository contactCardChevronImageColor](CNUIColorRepository, "contactCardChevronImageColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cnui_symbolImageForContactCardChevronWithColor:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (uint64_t)cnui_symbolImageForContactCardChevronWithColor:()CNUI
{
  return objc_msgSend(a1, "cnui_symbolImageNamed:scale:weight:withColor:useFixedSize:compatibleWithTextStyle:", CFSTR("chevron.forward"), 1, 7, a3, 1, *MEMORY[0x1E0DC4A88]);
}

+ (id)cnui_symbolImageForDynamicallySizedContactCardChevron
{
  void *v2;
  void *v3;

  +[CNUIColorRepository contactCardChevronImageColor](CNUIColorRepository, "contactCardChevronImageColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cnui_symbolImageForDynamicallySizedContactCardChevronWithColor:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (uint64_t)cnui_symbolImageForDynamicallySizedContactCardChevronWithColor:()CNUI
{
  return objc_msgSend(a1, "cnui_symbolImageNamed:scale:weight:withColor:useFixedSize:compatibleWithTextStyle:", CFSTR("chevron.forward"), 1, 7, a3, 0, *MEMORY[0x1E0DC4A88]);
}

+ (id)cnui_symbolImageForUnknownNumberContactCardChevron
{
  void *v2;
  void *v3;

  +[CNUIColorRepository contactCardChevronImageColor](CNUIColorRepository, "contactCardChevronImageColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cnui_symbolImageForUnknownNumberContactCardChevronWithColor:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (uint64_t)cnui_symbolImageForUnknownNumberContactCardChevronWithColor:()CNUI
{
  return objc_msgSend(a1, "cnui_symbolImageNamed:scale:weight:withColor:useFixedSize:compatibleWithTextStyle:", CFSTR("chevron.up.chevron.down"), 1, 7, a3, 0, *MEMORY[0x1E0DC4A88]);
}

+ (id)cnui_symbolImageForNavigationListChevron
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3870];
  +[CNUIColorRepository navigationListDisclosureImageColor](CNUIColorRepository, "navigationListDisclosureImageColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "cnui_symbolImageNamed:scale:weight:withColor:useFixedSize:compatibleWithTextStyle:", CFSTR("chevron.down"), 1, 7, v1, 0, *MEMORY[0x1E0DC4A88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)cnui_symbolImageForContactCardMenuChevron
{
  void *v2;
  void *v3;

  +[CNUIColorRepository contactCardChevronImageColor](CNUIColorRepository, "contactCardChevronImageColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cnui_symbolImageNamed:scale:weight:withColor:useFixedSize:compatibleWithTextStyle:", CFSTR("chevron.up.chevron.down"), 1, 7, v2, 0, *MEMORY[0x1E0DC4A88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)cnui_carPlayUserActionSymbolImageForActionType:()CNUI
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D13DA8], "symbolImageNameForActionType:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cnui_symbolImageNamed:scale:withColor:useFixedSize:compatibleWithTextStyle:", v2, 2, 0, 1, *MEMORY[0x1E0DC4A90]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (uint64_t)cnui_symbolImageNamed:()CNUI scale:withColor:useFixedSize:
{
  return objc_msgSend(a1, "cnui_symbolImageNamed:scale:withColor:useFixedSize:compatibleWithTextStyle:", a3, a4, a5, a6, *MEMORY[0x1E0DC4A88]);
}

@end
