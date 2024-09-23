@implementation UIFont(ClockKitUtilities)

- (id)CLKFontWithLocalizedSmallCaps
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  if (!CLKSmallCapsAllowed())
    return a1;
  v3 = *MEMORY[0x24BEBE1A0];
  v12[0] = *MEMORY[0x24BEBE1B0];
  v2 = v12[0];
  v12[1] = v3;
  v13[0] = &unk_24CC176E0;
  v13[1] = &unk_24CC176F8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  v10[1] = v3;
  v11[0] = &unk_24CC17710;
  v11[1] = &unk_24CC176F8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "CLKFontByApplyingFeatureSettings:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)CLKFontWithLocalizedLowerCaseSmallCaps
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  if (!CLKSmallCapsAllowed())
    return a1;
  v2 = *MEMORY[0x24BEBE1A0];
  v8[0] = *MEMORY[0x24BEBE1B0];
  v8[1] = v2;
  v9[0] = &unk_24CC17710;
  v9[1] = &unk_24CC176F8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "CLKFontByApplyingFeatureSettings:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)CLKFontWithMonospacedNumbers
{
  void *v2;
  void *v3;

  _MonospaceNumbersFeatureSettings();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "CLKFontByApplyingFeatureSettings:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)CLKFontWithAlternativePunctuation
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BEBE1A0];
  v8[0] = *MEMORY[0x24BEBE1B0];
  v8[1] = v2;
  v9[0] = &unk_24CC17758;
  v9[1] = &unk_24CC17740;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "CLKFontByApplyingFeatureSettings:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)CLKFontWithStraightSix
{
  return objc_msgSend(a1, "CLKFontWithStylisticSet:", 1);
}

- (id)CLKFontWithStylisticSet:()ClockKitUtilities
{
  void *v4;
  void *v5;

  _StylisticSet(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "CLKFontByApplyingFeatureSettings:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)CLKFontWithRareLigaturesAndStylisticSet:()ClockKitUtilities
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BEBE1A0];
  v13[0] = *MEMORY[0x24BEBE1B0];
  v13[1] = v5;
  v14[0] = &unk_24CC176F8;
  v14[1] = &unk_24CC17770;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _StylisticSet(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "CLKFontByApplyingFeatureSettings:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)CLKFontWithLooplessThaiFallback
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "fontDescriptor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDC4D00];
  v7[0] = &unk_24CC176B0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fontDescriptorByAddingAttributes:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "fontWithDescriptor:size:", v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)CLKFontByApplyingFeatureSettings:()ClockKitUtilities
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "fontDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BEBE188];
  v11[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "fontDescriptorByAddingAttributes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "fontWithDescriptor:size:", v7, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
