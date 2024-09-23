@implementation LayoutConstantsSmall

void ___LayoutConstantsSmall_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRoundingBehavior:", 3);
  v8[0] = &unk_1E6C9E4D0;
  v8[1] = &unk_1E6C9E4E8;
  v9[0] = &unk_1E6CA4528;
  v9[1] = &unk_1E6CA4538;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v3, 2.5);
  _LayoutConstantsSmall___constants_0 = v4;

  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 2.0, 2.5);
  _LayoutConstantsSmall___constants_1 = v5;
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 0, 29.0, 26.0);
  _LayoutConstantsSmall___constants_2 = v6;
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 1.75, 2.25);
  _LayoutConstantsSmall___constants_3 = v7;

}

void ___LayoutConstantsSmall_block_invoke_0(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 14.5, 16.5);
  qword_1EF1758B0 = v3;
  v42[0] = &unk_1E6CA12C0;
  v42[1] = &unk_1E6CA12D8;
  v43[0] = &unk_1E6CA5408;
  v43[1] = &unk_1E6CA5418;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v4, 23.0);
  *(_QWORD *)&xmmword_1EF1758B8 = v5;

  v40[0] = &unk_1E6CA12C0;
  v40[1] = &unk_1E6CA12D8;
  v41[0] = &unk_1E6CA5418;
  v41[1] = &unk_1E6CA5428;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v6, 32.0);
  *((_QWORD *)&xmmword_1EF1758B8 + 1) = v7;

  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 0, 2.5, 2.0);
  qword_1EF1758C8 = v8;
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 22.0, 23.0);
  qword_1EF1758D0 = v9;
  v38[0] = &unk_1E6CA12C0;
  v38[1] = &unk_1E6CA12D8;
  v39[0] = &unk_1E6CA5438;
  v39[1] = &unk_1E6CA5448;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v10, 10.0);
  *(_QWORD *)&xmmword_1EF1758D8 = v11;

  v36[0] = &unk_1E6CA12C0;
  v36[1] = &unk_1E6CA12D8;
  v37[0] = &unk_1E6CA5398;
  v37[1] = &unk_1E6CA5458;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v12, 29.0);
  *((_QWORD *)&xmmword_1EF1758D8 + 1) = v13;

  v34[0] = &unk_1E6CA12C0;
  v34[1] = &unk_1E6CA12D8;
  v35[0] = &unk_1E6CA53B8;
  v35[1] = &unk_1E6CA53C8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v14, 28.0);
  qword_1EF1758E8 = v15;

  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 0, 23.0, 20.0);
  qword_1EF1758F0 = v16;
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 0, 21.5, 19.0);
  *(_QWORD *)&_LayoutConstantsSmall___smallConstants = v17;
  v32[0] = &unk_1E6CA12C0;
  v32[1] = &unk_1E6CA12D8;
  v33[0] = &unk_1E6CA5468;
  v33[1] = &unk_1E6CA5478;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v18, 20.5);
  *((_QWORD *)&_LayoutConstantsSmall___smallConstants + 1) = v19;

  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 0, 19.0, 16.5);
  qword_1EF1758A8 = v20;
  __asm { FMOV            V0.2D, #-7.0 }
  xmmword_1EF1758F8 = _Q0;
  unk_1EF175908 = _Q0;
  v30[0] = &unk_1E6CA12C0;
  v30[1] = &unk_1E6CA12D8;
  v31[0] = &unk_1E6CA5488;
  v31[1] = &unk_1E6CA53D8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v26, 17.0);
  *(_QWORD *)&xmmword_1EF175918 = v27;

  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 0, 13.0, 11.0);
  *((_QWORD *)&xmmword_1EF175918 + 1) = v28;
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 0, 9.0, 8.5);
  qword_1EF175928 = v29;

}

@end
