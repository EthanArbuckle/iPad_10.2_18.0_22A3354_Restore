@implementation LayoutConstants

void ___LayoutConstants_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[3];

  v44[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C944C0];
  v3 = a2;
  objc_msgSend(v2, "metricsWithDevice:identitySizeClass:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRoundingBehavior:", 3);
  v43[0] = &unk_1E86EEE10;
  v43[1] = &unk_1E86EEE28;
  v44[0] = &unk_1E86EF188;
  v44[1] = &unk_1E86EF198;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v5, 7.0);
  v7 = v6;

  objc_msgSend(v4, "scaledValue:withOverride:forSizeClass:", 0, 5.0, 5.25);
  v9 = v8;
  objc_msgSend(v4, "scaledValue:", 1.0);
  v11 = v10;
  objc_msgSend(v4, "scaledValue:", 2.5);
  v13 = v12;
  objc_msgSend(v4, "scaledValue:", 1.5);
  _LayoutConstants___constants = v14;
  *(_QWORD *)algn_1EF9AEC78 = v7;
  v41[0] = &unk_1E86EEE10;
  v41[1] = &unk_1E86EEE28;
  v42[0] = &unk_1E86EF1A8;
  v42[1] = &unk_1E86EF1B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v15, 33.0);
  qword_1EF9AEC80 = v16;

  qword_1EF9AEC88 = v11;
  unk_1EF9AEC90 = v13;
  qword_1EF9AEC98 = 0x4008000000000000;
  qword_1EF9AECA0 = v9;
  unk_1EF9AECA8 = xmmword_1CB9E1F90;
  unk_1EF9AECB8 = xmmword_1CB9E1FA0;
  unk_1EF9AECC8 = xmmword_1CB9E1FB0;
  qword_1EF9AECD8 = v7;
  v40[0] = &unk_1E86EF1C8;
  v40[1] = &unk_1E86EEE58;
  v39[0] = &unk_1E86EEE40;
  v39[1] = &unk_1E86EEE28;
  v39[2] = &unk_1E86EEE70;
  v40[2] = &unk_1E86EF1D8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v17, 63.0);
  qword_1EF9AECE0 = v18;

  qword_1EF9AECE8 = v11;
  unk_1EF9AECF0 = v13;
  qword_1EF9AECF8 = 0x4008000000000000;
  qword_1EF9AED00 = v9;
  unk_1EF9AED08 = xmmword_1CB9E1F90;
  unk_1EF9AED18 = xmmword_1CB9E1FA0;
  unk_1EF9AED28 = xmmword_1CB9E1FB0;
  qword_1EF9AED38 = 0x3FF8000000000000;
  CLKDialDiameterForDevice();
  v20 = v19;

  *(double *)&qword_1EF9AED40 = v20 * 0.5;
  objc_msgSend(v4, "scaledValue:", 0.75);
  qword_1EF9AED48 = v21;
  objc_msgSend(v4, "scaledValue:", 2.0);
  qword_1EF9AED50 = v22;
  v37[0] = &unk_1E86EEE40;
  v37[1] = &unk_1E86EEE28;
  v38[0] = &unk_1E86EF1E8;
  v38[1] = &unk_1E86EEE88;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v23, 13.0);
  qword_1EF9AED58 = v24;

  xmmword_1EF9AED60 = xmmword_1CB9E1F90;
  unk_1EF9AED70 = xmmword_1CB9E1FC0;
  xmmword_1EF9AED80 = xmmword_1CB9E1FD0;
  v35[0] = &unk_1E86EEE10;
  v35[1] = &unk_1E86EEE28;
  v36[0] = &unk_1E86EF1F8;
  v36[1] = &unk_1E86EF1F8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v25, 1.5);
  qword_1EF9AED90 = v26;

  v33[0] = &unk_1E86EEE10;
  v33[1] = &unk_1E86EEE28;
  v34[0] = &unk_1E86EF208;
  v34[1] = &unk_1E86EF218;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v27, 22.25);
  qword_1EF9AED98 = v28;

  v31[0] = &unk_1E86EEE10;
  v31[1] = &unk_1E86EEE28;
  v32[0] = &unk_1E86EF228;
  v32[1] = &unk_1E86EF228;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v29, 1.75);
  qword_1EF9AEDA0 = v30;

}

void ___LayoutConstants_block_invoke_0(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[6];
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = &unk_1E86EEF00;
  v5[1] = &unk_1E86EEF18;
  v6[0] = &unk_1E86EF2B8;
  v6[1] = &unk_1E86EF2C8;
  v5[2] = &unk_1E86EEF30;
  v5[3] = &unk_1E86EEF48;
  v6[2] = &unk_1E86EF2D8;
  v6[3] = &unk_1E86EF2E8;
  v5[4] = &unk_1E86EEF60;
  v5[5] = &unk_1E86EEF78;
  v6[4] = &unk_1E86EF2C8;
  v6[5] = &unk_1E86EF2D8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v3, 22.0);
  _LayoutConstants__constants_0 = v4;

  _LayoutConstants__constants_1 = 0x3FF8000000000000;
  _LayoutConstants__constants_2 = 0x4012000000000000;

}

void ___LayoutConstants_block_invoke_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRoundingBehavior:", 2);
  v6 = &unk_1E86EEF90;
  v7[0] = &unk_1E86EF2F8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v3, 30.0);
  _LayoutConstants_constants_0 = v4;

  objc_msgSend(v2, "setRoundingBehavior:", 1);
  objc_msgSend(v2, "scaledValue:", 1.0);
  _LayoutConstants_constants_1 = v5;

}

void ___LayoutConstants_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C944C0];
  v3 = a2;
  objc_msgSend(v2, "metricsWithDevice:identitySizeClass:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = &unk_1E86EEFA8;
  v9[1] = &unk_1E86EEFC0;
  v10[0] = &unk_1E86EF308;
  v10[1] = &unk_1E86EF318;
  v9[2] = &unk_1E86EEFD8;
  v9[3] = &unk_1E86EEFF0;
  v10[2] = &unk_1E86EF328;
  v10[3] = &unk_1E86EF338;
  v9[4] = &unk_1E86EF008;
  v9[5] = &unk_1E86EF020;
  v10[4] = &unk_1E86EF348;
  v10[5] = &unk_1E86EF358;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledValue:withOverrides:", v5, 76.0);
  *(_QWORD *)&_LayoutConstants__constants = v6;

  CLKRoundForDevice();
  v8 = v7;

  *((_QWORD *)&_LayoutConstants__constants + 1) = v8;
  xmmword_1EF9AF018 = xmmword_1CB9E28E0;
  qword_1EF9AF028 = 0;

}

void ___LayoutConstants_block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueCompact:regular:luxoCompact:luxoRegular:aloeCompact:aloeRegular:agave:avoniaCompact:avoniaRegular:", 0.0, 0.0, 4.0, 5.0, 4.0, 5.0, 5.0, 4.0, 0x4014000000000000);
  *(_QWORD *)&_LayoutConstants__constants_0 = v2;
  objc_msgSend(v12, "valueCompact:regular:luxoCompact:luxoRegular:aloeCompact:aloeRegular:agave:avoniaCompact:avoniaRegular:", 0.0, 0.0, 1.5, 2.0, 1.5, 2.0, 2.0, 1.5, 0x4000000000000000);
  *((_QWORD *)&_LayoutConstants__constants_0 + 1) = v3;
  objc_msgSend(v12, "valueCompact:regular:luxoCompact:luxoRegular:aloeCompact:aloeRegular:agave:avoniaCompact:avoniaRegular:", 0.0, 0.0, 3.5, 4.0, 4.0, 4.5, 4.5, 4.5, 0x4014000000000000);
  qword_1EF9AF070 = v4;
  objc_msgSend(v12, "valueCompact:regular:luxoCompact:luxoRegular:aloeCompact:aloeRegular:agave:avoniaCompact:avoniaRegular:", 0.0, 0.0, 1.0, 1.5, 1.0, 1.5, 1.5, 1.0, 0x3FF8000000000000);
  qword_1EF9AF078 = v5;
  *(_QWORD *)&xmmword_1EF9AF080 = 0x3FF8000000000000;
  objc_msgSend(v12, "valueCompact:regular:luxoCompact:luxoRegular:aloeCompact:aloeRegular:agave:avoniaCompact:avoniaRegular:", 0.0, 0.0, 16.0, 18.0, 17.5, 19.5, 20.0, 18.5, 0x4033000000000000);
  *((_QWORD *)&xmmword_1EF9AF080 + 1) = v6;
  objc_msgSend(v12, "valueCompact:regular:luxoCompact:luxoRegular:aloeCompact:aloeRegular:agave:avoniaCompact:avoniaRegular:", 0.0, 0.0, 30.5, 34.5, 33.0, 37.5, 38.5, 35.0, 0x4043000000000000);
  qword_1EF9AF090 = v7;
  objc_msgSend(v12, "valueCompact:regular:luxoCompact:luxoRegular:aloeCompact:aloeRegular:agave:avoniaCompact:avoniaRegular:", 0.0, 0.0, 34.5, 39.5, 38.0, 43.0, 44.0, 40.0, 0x4046000000000000);
  qword_1EF9AF098 = v8;
  objc_msgSend(v12, "valueCompact:regular:luxoCompact:luxoRegular:aloeCompact:aloeRegular:agave:avoniaCompact:avoniaRegular:", 0.0, 0.0, 6.0, 6.5, 6.5, 7.0, 7.5, 6.5, 0x401C000000000000);
  *(_QWORD *)&xmmword_1EF9AF0A0 = v9;
  *((_QWORD *)&xmmword_1EF9AF0A0 + 1) = 0x3FF0000000000000;
  objc_msgSend(v12, "valueCompact:regular:luxoCompact:luxoRegular:aloeCompact:aloeRegular:agave:avoniaCompact:avoniaRegular:", 0.0, 0.0, 3.0, 4.0, 3.0, 4.0, 4.0, 3.0, 0x4010000000000000);
  qword_1EF9AF0B0 = v10;
  objc_msgSend(v12, "valueCompact:regular:luxoCompact:luxoRegular:aloeCompact:aloeRegular:agave:avoniaCompact:avoniaRegular:", 0.0, 0.0, 1.0, 1.5, 1.0, 1.5, 1.5, 1.0, 0x3FF8000000000000);
  qword_1EF9AF0B8 = v11;
  xmmword_1EF9AF0C0 = xmmword_1CB9E2A00;
  qword_1EF9AF0D0 = 0x3FF8000000000000;

}

double ___LayoutConstants_block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double result;

  v2 = a2;
  v3 = objc_msgSend(v2, "sizeClass");
  objc_msgSend(v2, "screenScale");
  v5 = v4;

  v6 = 7.5;
  if (!v3)
    v6 = 6.5;
  result = v6 / v5;
  _LayoutConstants___constants_0 = *(_QWORD *)&result;
  _LayoutConstants___constants_1 = 0x4000000000000000;
  return result;
}

@end
