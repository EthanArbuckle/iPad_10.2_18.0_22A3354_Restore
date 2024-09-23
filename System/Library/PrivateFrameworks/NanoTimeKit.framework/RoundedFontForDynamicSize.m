@implementation RoundedFontForDynamicSize

void ___RoundedFontForDynamicSize_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _OWORD v9[9];
  uint64_t v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v10 = 0;
  memset(v9, 0, sizeof(v9));
  _LayoutConstantsSmall(a2, (uint64_t)v9);
  v2 = (void *)*MEMORY[0x1E0C940A8];
  v11[0] = &unk_1E6CA12F0;
  v3 = v2;
  _MakeFont((uint64_t)v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v11[1] = &unk_1E6CA1278;
  _MakeFont((uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v11[2] = &unk_1E6CA1290;
  _MakeFont((uint64_t)v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)_RoundedFontForDynamicSize__roundedFonts;
  _RoundedFontForDynamicSize__roundedFonts = v7;

}

@end
