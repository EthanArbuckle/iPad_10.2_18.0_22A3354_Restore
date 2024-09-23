@implementation NSString(HKAdditions)

- (uint64_t)hk_attributedStringPrefixedWithImage:()HKAdditions spacing:
{
  return objc_msgSend(a1, "hk_attributedStringPrefixedWithImage:baselineAdjusted:spacing:", 0.0, a3);
}

- (uint64_t)hk_attributedStringPrefixedWithImage:()HKAdditions spacing:attributes:
{
  return objc_msgSend(a1, "hk_attributedStringPrefixedWithImage:baselineAdjusted:spacing:attributes:", a3, (uint64_t)a5, a4, 0.0);
}

- (uint64_t)hk_attributedStringPrefixedWithImage:()HKAdditions baselineAdjusted:spacing:
{
  return objc_msgSend(a1, "hk_attributedStringPrefixedWithImage:baselineAdjusted:spacing:attributes:", a3, (uint64_t)a5, 0);
}

- (uint64_t)hk_attributedStringPrefixedWithImage:()HKAdditions baselineAdjusted:withAttributes:
{
  return objc_msgSend(a1, "hk_attributedStringPrefixedWithImage:baselineAdjusted:spacing:attributes:", a3, 0, a4);
}

- (id)hk_attributedStringPrefixedWithImage:()HKAdditions baselineAdjusted:spacing:attributes:
{
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  CGSize v33;

  v10 = a4;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (a2 < 0.0)
    {
      objc_msgSend(v10, "size");
      v14 = v13;
      objc_msgSend(v10, "size");
      v16 = v15 + a2;
      objc_msgSend(v10, "size");
      v18 = v17;
      objc_msgSend(v10, "size");
      v20 = v19 + a2;
      objc_msgSend(v10, "scale");
      v22 = v21;
      v33.width = v18;
      v33.height = v20;
      UIGraphicsBeginImageContextWithOptions(v33, 0, v22);
      objc_msgSend(v10, "drawInRect:", 0.0, 0.0, v14, v16);
      UIGraphicsGetImageFromCurrentImageContext();
      v23 = objc_claimAutoreleasedReturnValue();

      UIGraphicsEndImageContext();
      v10 = (id)v23;
    }
    v24 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
    objc_msgSend(v24, "setImage:", v10);
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "mutableCopy");

    if (a2 != 0.0)
    {
      v27 = *MEMORY[0x1E0DC1108];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addAttribute:value:range:", v27, v28, 0, 1);

    }
    objc_msgSend(v12, "addObject:", v26);
    if (a5 >= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3498], "hk_attributedStringForSpacing:", a5);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v29);

    }
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", a1, v11);
    objc_msgSend(v12, "addObject:", v30);

  }
  HKUIJoinAttributedStringsForLocale(v12);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (double)hk_boundingHeightWithWidth:()HKAdditions font:
{
  void *v6;
  id v7;
  void *v8;
  double Height;
  uint64_t v11;
  _QWORD v12[2];
  CGRect v13;

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = *MEMORY[0x1E0DC1138];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, a2, 3.40282347e38);
  Height = CGRectGetHeight(v13);

  return Height;
}

- (double)hk_boundingWidthWithHeight:()HKAdditions font:
{
  void *v6;
  id v7;
  void *v8;
  double Width;
  uint64_t v11;
  _QWORD v12[2];
  CGRect v13;

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = *MEMORY[0x1E0DC1138];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, 3.40282347e38, a2);
  Width = CGRectGetWidth(v13);

  return Width;
}

- (void)hk_drawInRect:()HKAdditions withAttributes:outlineWidth:outlineColor:context:
{
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v18 = a9;
  +[HKStringDrawing stringDrawingWithText:inRect:withAttributes:](HKStringDrawing, "stringDrawingWithText:inRect:withAttributes:", a1, a8, a2, a3, a4, a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStringDrawing drawStrings:outlineWidth:outlineColor:context:](HKStringDrawing, "drawStrings:outlineWidth:outlineColor:context:", v20, v18, a10, a6);

}

@end
