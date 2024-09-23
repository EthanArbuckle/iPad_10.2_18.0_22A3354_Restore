@implementation UIFont(CUIKWidgetFontUtils)

- (id)CUIKFontWithLocalizedSmallCaps:()CUIKWidgetFontUtils
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if ((a3 & 1) == 0)
    return a1;
  v5 = *MEMORY[0x1E0DC13D0];
  v14[0] = *MEMORY[0x1E0DC13D8];
  v4 = v14[0];
  v14[1] = v5;
  v15[0] = &unk_1E6ED6F30;
  v15[1] = &unk_1E6ED6F48;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v12[1] = v5;
  v13[0] = &unk_1E6ED6F60;
  v13[1] = &unk_1E6ED6F48;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "CUIKFontByApplyingFeatureSettings:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)CUIKFontWithAlternativePunctuation
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0DC13D0];
  v8[0] = *MEMORY[0x1E0DC13D8];
  v8[1] = v2;
  v9[0] = &unk_1E6ED6F78;
  v9[1] = &unk_1E6ED6F90;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "CUIKFontByApplyingFeatureSettings:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)CUIKFontByApplyingFeatureSettings:()CUIKWidgetFontUtils
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "fontDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0DC1380];
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "fontDescriptorByAddingAttributes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "fontWithDescriptor:size:", v7, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
