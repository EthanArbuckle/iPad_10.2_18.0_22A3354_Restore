@implementation NTKAstronomyLayoutForDevice

void ___NTKAstronomyLayoutForDevice_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  int v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[3];
  _QWORD v19[3];
  void *v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = &unk_1E6CA1560;
  v24[1] = &unk_1E6CA1578;
  v25[0] = &unk_1E6CA5628;
  v25[1] = &unk_1E6CA5638;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constantValue:withOverrides:", v3, 0.0);
  *(float *)&v4 = v4;
  _NTKAstronomyLayoutForDevice_constants = LODWORD(v4);

  v22[0] = &unk_1E6CA1560;
  v22[1] = &unk_1E6CA1590;
  v23[0] = &unk_1E6CA5648;
  v23[1] = &unk_1E6CA5658;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v5, 16.0);
  *(float *)&v6 = v6;
  dword_1EF175C54 = LODWORD(v6);

  v20 = &unk_1E6CA15A8;
  v21 = &unk_1E6CA5628;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v7, 13.0);
  *(float *)&v8 = v8;
  dword_1EF175C68 = LODWORD(v8);

  v18[0] = &unk_1E6CA1560;
  v18[1] = &unk_1E6CA15A8;
  v19[0] = &unk_1E6CA5668;
  v19[1] = &unk_1E6CA5678;
  v18[2] = &unk_1E6CA15C0;
  v19[2] = &unk_1E6CA5688;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v9, 8.0);
  *(float *)&v10 = v10;
  dword_1EF175C58 = LODWORD(v10);

  *(float *)&v11 = *(float *)&dword_1EF175C58 + *(float *)&dword_1EF175C68 * 2.0;
  dword_1EF175C5C = v11;
  objc_msgSend(v2, "scaledValue:", 20.0);
  *(float *)&v12 = v12;
  dword_1EF175C60 = LODWORD(v12);
  objc_msgSend(v2, "scaledValue:", 16.0);
  *(float *)&v13 = v13;
  dword_1EF175C64 = LODWORD(v13);
  v16[0] = &unk_1E6CA1560;
  v16[1] = &unk_1E6CA1578;
  v17[0] = &unk_1E6CA5698;
  v17[1] = &unk_1E6CA5698;
  v16[2] = &unk_1E6CA1590;
  v16[3] = &unk_1E6CA15A8;
  v17[2] = &unk_1E6CA56A8;
  v17[3] = &unk_1E6CA56B8;
  v16[4] = &unk_1E6CA15C0;
  v17[4] = &unk_1E6CA56C8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v14, 6.0);
  qword_1EF175C70 = v15;

}

@end
