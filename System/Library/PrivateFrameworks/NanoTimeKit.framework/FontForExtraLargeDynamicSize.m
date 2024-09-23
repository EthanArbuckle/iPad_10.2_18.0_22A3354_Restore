@implementation FontForExtraLargeDynamicSize

void ___FontForExtraLargeDynamicSize_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  v17[0] = &unk_1E6C9EFB0;
  v2 = a2;
  v3 = _ModularSmallFontSize(4, v2);
  v4 = *MEMORY[0x1E0DC1430];
  ___FontForExtraLargeDynamicSize_block_invoke_2(v3, 3.5, *MEMORY[0x1E0DC1430]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  v17[1] = &unk_1E6C9EFC8;
  v6 = _ModularSmallFontSize(3, v2);
  ___FontForExtraLargeDynamicSize_block_invoke_2(v6, 3.5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v7;
  v17[2] = &unk_1E6C9EFE0;
  v8 = _ModularSmallFontSize(2, v2);
  v9 = *MEMORY[0x1E0DC1440];
  ___FontForExtraLargeDynamicSize_block_invoke_2(v8, 3.5, *MEMORY[0x1E0DC1440]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v10;
  v17[3] = &unk_1E6C9EFF8;
  v11 = _ModularSmallFontSize(1, v2);
  ___FontForExtraLargeDynamicSize_block_invoke_2(v11, 3.5, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v12;
  v17[4] = &unk_1E6C9F010;
  v13 = _ModularSmallFontSize(0, v2);

  ___FontForExtraLargeDynamicSize_block_invoke_2(v13, 3.5, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)_FontForExtraLargeDynamicSize_fonts;
  _FontForExtraLargeDynamicSize_fonts = v15;

}

id ___FontForExtraLargeDynamicSize_block_invoke_2(double a1, double a2, double a3)
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", a1 * a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CLKFontWithAlternativePunctuation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
