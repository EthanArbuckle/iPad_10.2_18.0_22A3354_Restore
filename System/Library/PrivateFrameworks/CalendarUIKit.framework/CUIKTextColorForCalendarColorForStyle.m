@implementation CUIKTextColorForCalendarColorForStyle

void __CUIKTextColorForCalendarColorForStyle_block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(MEMORY[0x1E0D0C368], "getDebugColorNumberForPreference:dark:", *MEMORY[0x1E0D0C0A0], 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "floatValue");
    v6 = v5;
  }
  else
  {
    v6 = 0.5;
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

@end
