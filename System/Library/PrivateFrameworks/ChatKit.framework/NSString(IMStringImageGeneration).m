@implementation NSString(IMStringImageGeneration)

- (id)__ck_generateImageForFontSize:()IMStringImageGeneration imageGenerationScale:
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", a2 / a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "__ck_generateImageForFont:imageGenerationScale:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)__ck_generateImageForFont:()IMStringImageGeneration imageGenerationScale:
{
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];
  CGSize v16;

  v15[1] = *MEMORY[0x1E0C80C00];
  v14 = *MEMORY[0x1E0DC1138];
  v15[0] = a4;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "sizeWithAttributes:", v8);
  v16.width = v9 * a2;
  v16.height = v10 * a2;
  UIGraphicsBeginImageContextWithOptions(v16, 0, 0.0);
  objc_msgSend(a1, "drawAtPoint:withAttributes:", v8, 0.0, 0.0);
  UIGraphicsGetImageFromCurrentImageContext();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v11, "__ck_imageWithTrimmedTransparency");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
