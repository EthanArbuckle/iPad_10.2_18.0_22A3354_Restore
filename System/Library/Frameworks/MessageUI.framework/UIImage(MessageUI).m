@implementation UIImage(MessageUI)

+ (uint64_t)mf_symbolConfigurationForView:()MessageUI
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "_mf_symbolConfigurationForView:imageSymbolType:", a3, objc_msgSend(MEMORY[0x1E0DC3870], "mf_imageSymbolTypeForView:"));
}

+ (id)_mf_symbolConfigurationForView:()MessageUI imageSymbolType:
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0DC3870], "mf_symbolImageFontTextStyleForView:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(MEMORY[0x1E0DC3870], "mf_symbolImageScaleForView:", a3);
  v9 = objc_msgSend(MEMORY[0x1E0DC3870], "mf_symbolImageWeightForView:", a3);
  v10 = objc_msgSend(MEMORY[0x1E0DC3870], "mf_symbolicTraitsForView:", a3);
  objc_msgSend(MEMORY[0x1E0DC3870], "mf_symbolImageCapAtContentSizeCategoryForView:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mf_symbolConfigurationForImageSymbolType:textStyle:scale:weight:traits:maximumContentSizeCategory:", a4, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)mf_systemImageNamed:()MessageUI forView:
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0DC3870], "mf_symbolImageFontTextStyleForView:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(MEMORY[0x1E0DC3870], "mf_symbolImageScaleForView:", a4);
  v8 = objc_msgSend(MEMORY[0x1E0DC3870], "mf_symbolImageWeightForView:", a4);
  v9 = objc_msgSend(MEMORY[0x1E0DC3870], "mf_imageSymbolTypeForView:", a4);
  v10 = objc_msgSend(MEMORY[0x1E0DC3870], "mf_symbolicTraitsForView:", a4);
  objc_msgSend(MEMORY[0x1E0DC3870], "mf_symbolImageCapAtContentSizeCategoryForView:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "_mf_systemImageNamed:textStyle:scale:weight:imageSymbolType:traits:maximumContentSizeCategory:", v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (uint64_t)mf_symbolicTraitsForView:()MessageUI
{
  void *v4;
  NSString *v5;
  BOOL IsAccessibilityCategory;
  void *v7;
  unsigned int v9;

  objc_msgSend(a1, "mf_symbolImageCapAtContentSizeCategoryForView:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);
  v7 = (void *)*MEMORY[0x1E0DC4938];

  if (a3 == 9 || a3 == 22)
    v9 = 2;
  else
    v9 = 0;
  if (IsAccessibilityCategory && v4 != v7)
    return 0;
  else
    return v9;
}

+ (id)mf_symbolImageCapAtContentSizeCategoryForView:()MessageUI
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = (id)*MEMORY[0x1E0DC4938];
  v5 = a3 - 9;
  if ((unint64_t)(a3 - 9) <= 9 && ((0x24Fu >> v5) & 1) != 0)
  {
    v6 = **((id **)&unk_1E5A69E60 + v5);

    v4 = v6;
  }
  return v4;
}

+ (uint64_t)mf_symbolImageWeightForView:()MessageUI
{
  uint64_t v3;

  v3 = 9;
  if (((1 << a3) & 0x400007) == 0)
    v3 = 0;
  if (a3 <= 0x16)
    return v3;
  else
    return 0;
}

+ (uint64_t)mf_symbolImageScaleForView:()MessageUI
{
  if (a3 > 0x18)
    return 2;
  else
    return qword_1ABAA1018[a3];
}

+ (id)mf_symbolImageFontTextStyleForView:()MessageUI
{
  id v4;
  id *v5;
  id v6;

  v4 = (id)*MEMORY[0x1E0DC4A88];
  v5 = (id *)MEMORY[0x1E0DC4B50];
  switch(a3)
  {
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0x13uLL:
      v5 = (id *)MEMORY[0x1E0DC4B10];
      goto LABEL_6;
    case 0xDuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
      return v4;
    case 0xEuLL:
      goto LABEL_6;
    case 0x14uLL:
      v5 = (id *)MEMORY[0x1E0DC4AB8];
      goto LABEL_6;
    default:
      if (a3 >= 2)
        return v4;
LABEL_6:
      v6 = *v5;

      v4 = v6;
      return v4;
  }
}

+ (uint64_t)mf_imageSymbolTypeForView:()MessageUI
{
  if ((unint64_t)(a3 - 9) > 0xF)
    return 0;
  else
    return qword_1ABAA10E0[a3 - 9];
}

+ (id)_mf_systemImageNamed:()MessageUI textStyle:scale:weight:imageSymbolType:traits:maximumContentSizeCategory:
{
  id v15;
  void *v16;
  void *v17;

  v15 = a3;
  objc_msgSend(a1, "mf_symbolConfigurationForImageSymbolType:textStyle:scale:weight:traits:maximumContentSizeCategory:", a7, a4, a5, a6, a8, a9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)mf_symbolConfigurationForImageSymbolType:()MessageUI textStyle:scale:weight:traits:maximumContentSizeCategory:
{
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v13 = a4;
  v14 = a8;
  if (!a6)
  {
    if ((_DWORD)a7)
    {
      MEMORY[0x1AF4327B0](v13, a7);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", v16, a5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
      v13 = v16;
      goto LABEL_14;
    }
    v17 = (void *)*MEMORY[0x1E0DC4A88];
    if (v13)
      v17 = v13;
    v16 = v17;

    objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a3 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "_defaultContentSizeCategory");
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3 != 2)
      {
LABEL_12:
        CTFontDescriptorGetTextStyleSize();
        objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 0, a5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_13;
      }
      MFUIContentSizeCategoryMin(v18, v14);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    v21 = (void *)v20;

    v19 = v21;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", v13, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v15;
}

+ (id)mf_imageWithColor:()MessageUI size:
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  double v14;
  double v15;

  v7 = a5;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", a1, a2);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __45__UIImage_MessageUI__mf_imageWithColor_size___block_invoke;
  v12[3] = &unk_1E5A69E40;
  v9 = v7;
  v13 = v9;
  v14 = a1;
  v15 = a2;
  objc_msgSend(v8, "imageWithActions:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)mf_systemImageNamed:()MessageUI textStyle:scale:
{
  objc_msgSend(a1, "mf_systemImageNamed:textStyle:scale:weight:", a3, a4, a5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)mf_systemImageNamed:()MessageUI textStyle:scale:weight:
{
  objc_msgSend(a1, "mf_systemImageNamed:textStyle:scale:weight:maximumContentSizeCategory:", a3, a4, a5, a6, *MEMORY[0x1E0DC4938]);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)mf_systemImageNamed:()MessageUI textStyle:scale:weight:maximumContentSizeCategory:
{
  objc_msgSend(a1, "_mf_systemImageNamed:textStyle:scale:weight:imageSymbolType:traits:maximumContentSizeCategory:", a3, a4, a5, a6, 2, 0, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)mf_assistantBarSystemImageNamed:()MessageUI
{
  objc_msgSend(MEMORY[0x1E0DC3870], "_mf_systemImageNamed:textStyle:scale:weight:imageSymbolType:traits:maximumContentSizeCategory:", a3, *MEMORY[0x1E0DC4A88], 3, 0, 1, 0, *MEMORY[0x1E0DC4938]);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)mf_largeContentSizeImageNamed:()MessageUI
{
  void *v0;
  double v1;
  double v2;
  double v3;
  double v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "size");
  if (v1 > 0.0 && v2 > 0.0)
  {
    if (v1 >= v2)
    {
      if (v1 <= v2)
      {
        v3 = 75.0;
        v4 = 75.0;
      }
      else
      {
        v4 = 75.0;
        v3 = v2 * 75.0 / v1;
      }
    }
    else
    {
      v3 = 75.0;
      v4 = v1 * 75.0 / v2;
    }
    objc_msgSend(v0, "imageByPreparingThumbnailOfSize:", v4, v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v0 = (void *)v5;
  }
  return v0;
}

+ (id)mf_imageWithImage:()MessageUI scaledToSize:
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  CGSize v19;

  v7 = a5;
  objc_msgSend(v7, "size");
  v9 = v8;
  objc_msgSend(v7, "size");
  v11 = a2 / v10;
  if (a1 / v9 >= v11)
    v12 = v11;
  else
    v12 = a1 / v9;
  objc_msgSend(v7, "size");
  v14 = v13;
  objc_msgSend(v7, "size");
  v16 = v15;
  v19.width = a1;
  v19.height = a2;
  UIGraphicsBeginImageContextWithOptions(v19, 0, 0.0);
  objc_msgSend(v7, "drawInRect:", (a1 - v12 * v14) * 0.5, (a2 - v12 * v16) * 0.5);
  UIGraphicsGetImageFromCurrentImageContext();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v17;
}

+ (double)mf_scaledImageLayoutValue:()MessageUI forView:
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  objc_msgSend(MEMORY[0x1E0DC3870], "mf_symbolImageFontTextStyleForView:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(MEMORY[0x1E0DC3870], "mf_imageSymbolTypeForView:", a4);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_scaledValueForValue:", a1);
    a1 = v12;
    goto LABEL_5;
  }
  if (v7 == 2)
  {
    v8 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(MEMORY[0x1E0DC3870], "mf_symbolImageCapAtContentSizeCategoryForView:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_preferredFontForTextStyle:maximumContentSizeCategory:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_scaledValueForValue:", a1);
    a1 = v11;

LABEL_5:
  }

  return a1;
}

@end
