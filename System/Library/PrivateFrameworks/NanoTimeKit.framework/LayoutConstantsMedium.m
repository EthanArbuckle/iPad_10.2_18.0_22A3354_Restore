@implementation LayoutConstantsMedium

void ___LayoutConstantsMedium_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _OWORD v25[3];
  __int128 v26;
  __int128 v27;
  __int128 v28;
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
  _QWORD v41[3];

  v41[2] = *MEMORY[0x1E0C80C00];
  v29 = 0;
  v27 = 0u;
  v28 = 0u;
  v26 = 0u;
  memset(v25, 0, sizeof(v25));
  v23 = 0u;
  v24 = 0u;
  v22 = 0u;
  v2 = a2;
  _LayoutConstantsSmall(v2, (uint64_t)&v22);
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", v2, 2, v22, v23, v24, *(_QWORD *)&v25[0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = &unk_1E6CA12C0;
  v40[1] = &unk_1E6CA12D8;
  v41[0] = &unk_1E6CA5358;
  v41[1] = &unk_1E6CA5368;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:withOverrides:", v4, 19.0);
  qword_1EF175800 = v5;

  objc_msgSend(v3, "scaledValue:withOverride:forSizeClass:", 0, 30.5, 26.5);
  *(_QWORD *)&xmmword_1EF175808 = v6;
  v7 = NTKCircularMediumComplicationDiameter(v2);

  *((double *)&xmmword_1EF175808 + 1) = v7;
  objc_msgSend(v3, "scaledValue:", 3.0);
  qword_1EF175818 = v8;
  unk_1EF175820 = *(_OWORD *)((char *)v25 + 8);
  v38[0] = &unk_1E6CA12C0;
  v38[1] = &unk_1E6CA12D8;
  v39[0] = &unk_1E6CA5378;
  v39[1] = &unk_1E6CA5388;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:withOverrides:", v9, 38.0);
  *((_QWORD *)&xmmword_1EF175828 + 1) = v10;

  objc_msgSend(v3, "scaledValue:withOverride:forSizeClass:", 0, 38.0, 32.0);
  qword_1EF175838 = v11;
  v36[0] = &unk_1E6CA12C0;
  v36[1] = &unk_1E6CA12D8;
  v37[0] = &unk_1E6CA5398;
  v37[1] = &unk_1E6CA53A8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:withOverrides:", v12, 30.0);
  qword_1EF175840 = v13;

  v34[0] = &unk_1E6CA12C0;
  v34[1] = &unk_1E6CA12D8;
  v35[0] = &unk_1E6CA53B8;
  v35[1] = &unk_1E6CA53C8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:withOverrides:", v14, 27.5);
  *(_QWORD *)&_LayoutConstantsMedium___mediumConstants = v15;

  *((_QWORD *)&_LayoutConstantsMedium___mediumConstants + 1) = _LayoutConstantsMedium___mediumConstants;
  objc_msgSend(v3, "scaledValue:withOverride:forSizeClass:", 0, 26.0, 22.5);
  qword_1EF1757F8 = v16;
  xmmword_1EF175848 = v26;
  unk_1EF175858 = v27;
  v32[0] = &unk_1E6CA12C0;
  v32[1] = &unk_1E6CA12D8;
  v33[0] = &unk_1E6CA53D8;
  v33[1] = &unk_1E6CA53B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:withOverrides:", v17, 20.0);
  *(_QWORD *)&xmmword_1EF175868 = v18;

  v30[0] = &unk_1E6CA12C0;
  v30[1] = &unk_1E6CA12D8;
  v31[0] = &unk_1E6CA53E8;
  v31[1] = &unk_1E6CA53F8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:withOverrides:", v19, 15.0);
  *((_QWORD *)&xmmword_1EF175868 + 1) = v20;

  objc_msgSend(v3, "scaledValue:withOverride:forSizeClass:", 3, 11.5, 13.0);
  qword_1EF175878 = v21;

}

@end
