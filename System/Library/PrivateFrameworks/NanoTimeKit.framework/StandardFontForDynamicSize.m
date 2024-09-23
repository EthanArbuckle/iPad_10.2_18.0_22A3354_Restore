@implementation StandardFontForDynamicSize

void ___StandardFontForDynamicSize_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _OWORD v7[9];
  uint64_t v8;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v8 = 0;
  memset(v7, 0, sizeof(v7));
  _LayoutConstantsSmall(a2, (uint64_t)v7);
  v9[0] = &unk_1E6CA12F0;
  _MakeFont(0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  v9[1] = &unk_1E6CA1278;
  _MakeFont(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  v9[2] = &unk_1E6CA1290;
  _MakeFont(0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_StandardFontForDynamicSize__standardFonts;
  _StandardFontForDynamicSize__standardFonts = v5;

}

@end
