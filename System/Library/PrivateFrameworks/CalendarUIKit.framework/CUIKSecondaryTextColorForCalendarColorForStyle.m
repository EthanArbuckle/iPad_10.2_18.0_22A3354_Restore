@implementation CUIKSecondaryTextColorForCalendarColorForStyle

void __CUIKSecondaryTextColorForCalendarColorForStyle_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  float v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(MEMORY[0x1E0D0C368], "getDebugColorNumberForPreference:dark:", *MEMORY[0x1E0D0C058], 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "floatValue");
    v6 = v5;
  }
  else
  {
    v6 = 0.25;
  }
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v12, "colorWithAlphaComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKBlendColorsSourceOver(v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

void __CUIKSecondaryTextColorForCalendarColorForStyle_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  float v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v3 = (void *)MEMORY[0x1E0D0C368];
  v4 = *MEMORY[0x1E0D0C058];
  v5 = a2;
  objc_msgSend(v3, "getDebugColorNumberForPreference:dark:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v6;
  if (v6)
  {
    objc_msgSend(v6, "floatValue");
    v8 = v7;
  }
  else
  {
    v8 = 0.2;
  }
  CUIKAdjustedColorForColor(*(void **)(a1 + 32), *(_QWORD *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorWithAlphaComponent:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  CUIKBlendColorsSourceOver(v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

}

@end
