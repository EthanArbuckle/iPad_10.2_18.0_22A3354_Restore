@implementation LayoutConstantsModularSmall

void ___LayoutConstantsModularSmall_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scaledValue:withOverride:forSizeClass:", 0, 11.5, 10.5);
  *(_QWORD *)&_LayoutConstantsModularSmall___constants = v2;
  objc_msgSend(v7, "scaledValue:", 2.5);
  qword_1EF172A98 = v3;
  objc_msgSend(v7, "scaledSize:", 28.0, 28.0);
  *((_QWORD *)&_LayoutConstantsModularSmall___constants + 1) = v4;
  unk_1EF172A90 = v5;
  objc_msgSend(v7, "scaledValue:withOverride:forSizeClass:", 3, 21.0, 22.0);
  qword_1EF172AA0 = v6;

}

void ___LayoutConstantsModularSmall_block_invoke_0(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = &unk_1E6C9F028;
  v7[1] = &unk_1E6C9F040;
  v8[0] = &unk_1E6CA4DE8;
  v8[1] = &unk_1E6CA4DF8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v3, 36.0);
  *(_QWORD *)&_LayoutConstantsModularSmall___constants_0 = v4;

  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 0, 46.0, 39.5);
  *((_QWORD *)&_LayoutConstantsModularSmall___constants_0 + 1) = v5;
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 0, 48.0, 42.0);
  qword_1EF1741A8 = v6;
  unk_1EF1741B0 = v6;
  *(_QWORD *)&xmmword_1EF1741B8 = v6;
  *((_QWORD *)&xmmword_1EF1741B8 + 1) = v6;

}

void ___LayoutConstantsModularSmall_block_invoke_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C944C0];
  v3 = a2;
  objc_msgSend(v2, "metricsWithDevice:identitySizeClass:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NTKClockFaceLocalizedString(CFSTR("DATE_ALLOW_ALTERNATE_FONT_READABILITY_SMALL_MODULAR"), CFSTR("See note in strings file for this key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  CLKValueForDeviceMetrics();
  v8 = v7;

  *(_QWORD *)&_LayoutConstantsModularSmall_constants = v8;
  if ((v6 & 1) != 0)
  {
    v25[0] = &unk_1E6C9F1D8;
    v25[1] = &unk_1E6C9F1F0;
    v26[0] = &unk_1E6CA4EE8;
    v26[1] = &unk_1E6CA4EF8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scaledValue:withOverrides:", v9, 13.0);
    *(_QWORD *)&_LayoutConstantsModularSmall_constants = v10;

  }
  v11 = (_QWORD *)MEMORY[0x1E0DC1440];
  if (!v6)
    v11 = (_QWORD *)MEMORY[0x1E0DC1438];
  *((_QWORD *)&_LayoutConstantsModularSmall_constants + 1) = *v11;
  v23[0] = &unk_1E6C9F1D8;
  v23[1] = &unk_1E6C9F208;
  v24[0] = &unk_1E6CA4F08;
  v24[1] = &unk_1E6CA4F18;
  v23[2] = &unk_1E6C9F1F0;
  v24[2] = &unk_1E6CA4F28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v12, 19.5);
  qword_1EF174578 = v13;

  objc_msgSend(v4, "scaledValue:withOverride:forSizeClass:", 3, 24.0, 25.0);
  qword_1EF174570 = v14;
  v21[0] = &unk_1E6C9F1D8;
  v21[1] = &unk_1E6C9F208;
  v22[0] = &unk_1E6CA4F18;
  v22[1] = &unk_1E6CA4F38;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v15, 20.0);
  *(_QWORD *)&xmmword_1EF174580 = v16;

  v19[0] = &unk_1E6C9F1D8;
  v19[1] = &unk_1E6C9F1F0;
  v20[0] = &unk_1E6CA4F48;
  v20[1] = &unk_1E6CA4F58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v17, 50.0);
  *((_QWORD *)&xmmword_1EF174580 + 1) = v18;

}

void ___LayoutConstantsModularSmall_block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 16.5, 16.5);
  *(_QWORD *)&_LayoutConstantsModularSmall_constants_0 = v3;
  v31[0] = &unk_1E6CA1368;
  v31[1] = &unk_1E6CA1380;
  v32[0] = &unk_1E6CA5518;
  v32[1] = &unk_1E6CA5528;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v4, 10.5);
  *((_QWORD *)&_LayoutConstantsModularSmall_constants_0 + 1) = v5;

  qword_1EF175A88 = 0x3FF0000000000000;
  v29[0] = &unk_1E6CA1368;
  v29[1] = &unk_1E6CA1380;
  v30[0] = &unk_1E6CA5538;
  v30[1] = &unk_1E6CA5548;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v6, 12.0);
  qword_1EF175A90 = v7;

  v27[0] = &unk_1E6CA1368;
  v27[1] = &unk_1E6CA1398;
  v28[0] = &unk_1E6CA5558;
  v28[1] = &unk_1E6CA5558;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v8, 4.0);
  *(_QWORD *)&xmmword_1EF175A98 = v9;

  v25[0] = &unk_1E6CA1368;
  v25[1] = &unk_1E6CA1380;
  v26[0] = &unk_1E6CA5568;
  v26[1] = &unk_1E6CA5578;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v10, 5.0);
  *((_QWORD *)&xmmword_1EF175A98 + 1) = v11;

  v23[0] = &unk_1E6CA1368;
  v23[1] = &unk_1E6CA1380;
  v24[0] = &unk_1E6CA5588;
  v24[1] = &unk_1E6CA5598;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v12, 31.0);
  qword_1EF175AA8 = v13;

  v21[0] = &unk_1E6CA1368;
  v21[1] = &unk_1E6CA1380;
  v22[0] = &unk_1E6CA55A8;
  v22[1] = &unk_1E6CA55B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v14, 50.0);
  qword_1EF175AB0 = v15;

  v19[0] = &unk_1E6CA1368;
  v19[1] = &unk_1E6CA1380;
  v20[0] = &unk_1E6CA55C8;
  v20[1] = &unk_1E6CA5588;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v16, 22.0);
  *(_QWORD *)&xmmword_1EF175AB8 = v17;

  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 17.0, 17.0);
  *((_QWORD *)&xmmword_1EF175AB8 + 1) = v18;

}

@end
