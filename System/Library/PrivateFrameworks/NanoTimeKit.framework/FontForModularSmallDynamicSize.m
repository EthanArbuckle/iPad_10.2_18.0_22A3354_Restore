@implementation FontForModularSmallDynamicSize

void ___FontForModularSmallDynamicSize_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v10[0] = &unk_1E6C9EFB0;
  v2 = a2;
  _ModularSmallFontSize(4, v2);
  ___FontForModularSmallDynamicSize_block_invoke_2();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = &unk_1E6C9EFC8;
  _ModularSmallFontSize(3, v2);
  ___FontForModularSmallDynamicSize_block_invoke_2();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = &unk_1E6C9EFE0;
  _ModularSmallFontSize(2, v2);
  ___FontForModularSmallDynamicSize_block_invoke_2();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = &unk_1E6C9EFF8;
  _ModularSmallFontSize(1, v2);
  ___FontForModularSmallDynamicSize_block_invoke_2();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v10[4] = &unk_1E6C9F010;
  _ModularSmallFontSize(0, v2);

  ___FontForModularSmallDynamicSize_block_invoke_2();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)_FontForModularSmallDynamicSize_fonts;
  _FontForModularSmallDynamicSize_fonts = v8;

}

id ___FontForModularSmallDynamicSize_block_invoke_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "CLKFontWithAlternativePunctuation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
