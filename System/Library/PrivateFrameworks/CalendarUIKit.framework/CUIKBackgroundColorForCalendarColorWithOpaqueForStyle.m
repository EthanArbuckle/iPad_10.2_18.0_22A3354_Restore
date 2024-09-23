@implementation CUIKBackgroundColorForCalendarColorWithOpaqueForStyle

void __CUIKBackgroundColorForCalendarColorWithOpaqueForStyle_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  float v8;
  double v9;
  double v10;
  float v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v3 = *(_QWORD *)(a1 + 48);
  v4 = (void *)MEMORY[0x1E0D0C368];
  v5 = *MEMORY[0x1E0D0C038];
  v6 = a2;
  objc_msgSend(v4, "getDebugColorNumberForPreference:dark:", v5, v3 == 2);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D0C368], "getDebugColorNumberForPreference:dark:", *MEMORY[0x1E0D0C040], v3 == 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v19, "floatValue");
    v9 = v8;
  }
  else
  {
    v9 = dbl_1B8BA46A0[v3 == 2];
  }
  v10 = dbl_1B8BA46B0[v3 == 2];
  if (*(_BYTE *)(a1 + 56))
    v10 = 1.0;
  if (v7)
  {
    objc_msgSend(v7, "floatValue", v10);
    v10 = v11;
  }
  v12 = 0.8;
  if (v3 != 2)
    v12 = v10;
  if (*(_BYTE *)(a1 + 57))
    v13 = v12;
  else
    v13 = v10;
  objc_msgSend(*(id *)(a1 + 32), "colorWithAlphaComponent:", v9, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKBlendColorsSourceOver(v6, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "colorWithAlphaComponent:", v13);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v16;

}

@end
