@implementation UIFont(FUSausageFontSupport)

+ (uint64_t)fu_sausageFontOfSize:()FUSausageFontSupport
{
  return objc_msgSend(a1, "_fu_sausageFontOfSize:fontWeight:centeredColons:", 0, a3, *MEMORY[0x24BEBB608]);
}

+ (id)_fu_sausageFontOfSize:()FUSausageFontSupport fontWeight:centeredColons:
{
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:design:", *MEMORY[0x24BDC4DF0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    NSLog(CFSTR("Unable to load rounded font"));
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a4)
      return v6;
    goto LABEL_3;
  }
  if (a4)
  {
LABEL_3:
    objc_msgSend(v6, "fu_fontWithCenteredColons");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  return v6;
}

- (id)fu_fontWithCenteredColons
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBB520], "fu_alternateColonsFeatureSetting");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "fu_fontByApplyingFeatureSettings:toFont:", v3, a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)fu_alternateColonsFeatureSetting
{
  uint64_t v0;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BEBB598];
  v2[0] = *MEMORY[0x24BEBB5A0];
  v2[1] = v0;
  v3[0] = &unk_24CF4FD70;
  v3[1] = &unk_24CF4FDA0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)fu_fontByApplyingFeatureSettings:()FUSausageFontSupport toFont:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(a4, "fontDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BEBB548];
  v12[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontDescriptorByAddingAttributes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v8, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (uint64_t)fu_mediumSausageFontOfSize:()FUSausageFontSupport
{
  return objc_msgSend(a1, "_fu_sausageFontOfSize:fontWeight:centeredColons:", 0, a3, *MEMORY[0x24BEBB600]);
}

+ (id)fu_systemFontOfSize:()FUSausageFontSupport centeredColons:
{
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3)
  {
    objc_msgSend(v4, "fu_fontWithCenteredColons");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return v5;
}

+ (uint64_t)fu_mediumFontOfSize:()FUSausageFontSupport
{
  return objc_msgSend(a1, "fu_mediumFontOfSize:centeredColons:", 0);
}

+ (id)fu_mediumFontOfSize:()FUSausageFontSupport centeredColons:
{
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", a1, *MEMORY[0x24BEBB600]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4)
  {
    objc_msgSend(v5, "fu_fontWithCenteredColons");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  return v6;
}

- (id)fu_fontWithSize:()FUSausageFontSupport
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "fontDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v3, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)fu_fontWithStraightSidedNumbers
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BEBB598];
  v7[0] = *MEMORY[0x24BEBB5A0];
  v7[1] = v2;
  v8[0] = &unk_24CF4FD70;
  v8[1] = &unk_24CF4FD88;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "fu_fontByApplyingFeatureSettings:toFont:", v4, a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fu_monospacedFont
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_class();
  v3 = *MEMORY[0x24BEBB598];
  v8[0] = *MEMORY[0x24BEBB5A0];
  v8[1] = v3;
  v9[0] = &unk_24CF4FDA0;
  v9[1] = &unk_24CF4FDB8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fu_fontByApplyingFeatureSettings:toFont:", v5, a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)fu_smallCapsFont
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_class();
  v3 = *MEMORY[0x24BEBB598];
  v8[0] = *MEMORY[0x24BEBB5A0];
  v8[1] = v3;
  v9[0] = &unk_24CF4FDD0;
  v9[1] = &unk_24CF4FDE8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fu_fontByApplyingFeatureSettings:toFont:", v5, a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)fu_shortSlashFont
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_class();
  v3 = *MEMORY[0x24BEBB598];
  v8[0] = *MEMORY[0x24BEBB5A0];
  v8[1] = v3;
  v9[0] = &unk_24CF4FE00;
  v9[1] = &unk_24CF4FDB8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fu_fontByApplyingFeatureSettings:toFont:", v5, a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (uint64_t)fu_sausageFontOfSize:()FUSausageFontSupport centeredColons:
{
  return objc_msgSend(a1, "_fu_sausageFontOfSize:fontWeight:centeredColons:", 1, a3, *MEMORY[0x24BEBB608]);
}

+ (uint64_t)fu_lightSausageFontOfSize:()FUSausageFontSupport
{
  return objc_msgSend(a1, "fu_lightSausageFontOfSize:centeredColons:", 0);
}

+ (uint64_t)fu_lightSausageFontOfSize:()FUSausageFontSupport centeredColons:
{
  return objc_msgSend(a1, "_fu_sausageFontOfSize:fontWeight:centeredColons:", a3, *MEMORY[0x24BEBB5F8]);
}

+ (uint64_t)fu_semiboldSausageFontOfSize:()FUSausageFontSupport
{
  return objc_msgSend(a1, "_fu_sausageFontOfSize:fontWeight:centeredColons:", 0, a3, *MEMORY[0x24BEBB610]);
}

+ (uint64_t)fu_boldSausageFontOfSize:()FUSausageFontSupport
{
  return objc_msgSend(a1, "_fu_sausageFontOfSize:fontWeight:centeredColons:", 0, a3, *MEMORY[0x24BEBB5E8]);
}

+ (uint64_t)fu_heavySausageFontOfSize:()FUSausageFontSupport
{
  return objc_msgSend(a1, "_fu_sausageFontOfSize:fontWeight:centeredColons:", 0, a3, *MEMORY[0x24BEBB5F0]);
}

+ (id)_fu_sausageFontOfSize:()FUSausageFontSupport fontWeight:
{
  void *v2;

  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:design:", *MEMORY[0x24BDC4DF0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    NSLog(CFSTR("Unable to load rounded font"));
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

+ (id)fu_bodyShortFont
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BEBE1D0], 0x8000, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v0, 0.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)fu_bodyEmphasizeFont
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BEBE1D0], 2, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v0, 0.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (uint64_t)fu_fontWithSizeFittingString:()FUSausageFontSupport withinWidth:
{
  return objc_msgSend(a1, "fu_fontWithSizeFittingString:withinWidth:accountForGlyphOffset:", a3, 0);
}

- (id)fu_fontWithSizeFittingString:()FUSausageFontSupport withinWidth:accountForGlyphOffset:
{
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a1;
  v10 = v9;
  if (a2 > 2.22044605e-16)
  {
    objc_msgSend(v9, "pointSize");
    v12 = v11 * 0.5;
    objc_msgSend(v10, "pointSize");
    if (v13 >= v12)
    {
      v16 = *MEMORY[0x24BEBB360];
      while (1)
      {
        v17 = 0.0;
        if (a5)
          v17 = FIUILeftOffsetForFontAndString(v10, v8);
        v23 = v16;
        v24[0] = v10;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "sizeWithAttributes:", v18);
        v20 = v17 + v19;

        if (v20 <= a2)
          break;
        objc_msgSend(v10, "pointSize");
        objc_msgSend(v10, "fu_fontWithSize:", v21 * 0.9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "pointSize");
        v10 = v14;
        if (v22 < v12)
          goto LABEL_4;
      }
    }
  }
  v14 = v10;
LABEL_4:

  return v14;
}

@end
