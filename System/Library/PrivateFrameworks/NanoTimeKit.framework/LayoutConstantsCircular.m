@implementation LayoutConstantsCircular

void ___LayoutConstantsCircular_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[2];
  _QWORD v42[3];

  v42[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = &unk_1E6C9F100;
  v41[1] = &unk_1E6C9F118;
  v42[0] = &unk_1E6CA4E48;
  v42[1] = &unk_1E6CA4E48;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v3, 9.0);
  *(_QWORD *)&_LayoutConstantsCircular___constantsGraphicCircular = v4;

  v39[0] = &unk_1E6C9F100;
  v39[1] = &unk_1E6C9F118;
  v40[0] = &unk_1E6CA4E48;
  v40[1] = &unk_1E6CA4E48;
  v39[2] = &unk_1E6C9F130;
  v40[2] = &unk_1E6CA4E58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v5, 16.0);
  *((_QWORD *)&_LayoutConstantsCircular___constantsGraphicCircular + 1) = v6;

  v37[0] = &unk_1E6C9F100;
  v37[1] = &unk_1E6C9F118;
  v38[0] = &unk_1E6CA4E48;
  v38[1] = &unk_1E6CA4E48;
  v37[2] = &unk_1E6C9F130;
  v38[2] = &unk_1E6CA4E68;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v7, 32.0);
  qword_1EF1743D8 = v8;

  v35[0] = &unk_1E6C9F100;
  v35[1] = &unk_1E6C9F118;
  v36[0] = &unk_1E6CA4E48;
  v36[1] = &unk_1E6CA4E48;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v9, 8.0);
  qword_1EF1743E0 = v10;

  v33[0] = &unk_1E6C9F100;
  v33[1] = &unk_1E6C9F118;
  v34[0] = &unk_1E6CA4E48;
  v34[1] = &unk_1E6CA4E48;
  v33[2] = &unk_1E6C9F130;
  v34[2] = &unk_1E6CA4E78;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v11, 6.0);
  *(_QWORD *)&xmmword_1EF1743E8 = v12;

  v31[0] = &unk_1E6C9F100;
  v31[1] = &unk_1E6C9F118;
  v32[0] = &unk_1E6CA4E48;
  v32[1] = &unk_1E6CA4E48;
  v31[2] = &unk_1E6C9F130;
  v32[2] = &unk_1E6CA4E88;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v13, 40.0);
  *((_QWORD *)&xmmword_1EF1743E8 + 1) = v14;

  v29[0] = &unk_1E6C9F100;
  v29[1] = &unk_1E6C9F118;
  v30[0] = &unk_1E6CA4E48;
  v30[1] = &unk_1E6CA4E48;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v15, 1.0);
  qword_1EF1743F8 = v16;

  v27[0] = &unk_1E6C9F100;
  v27[1] = &unk_1E6C9F118;
  v28[0] = &unk_1E6CA4E48;
  v28[1] = &unk_1E6CA4E48;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v17, 4.0);
  qword_1EF174400 = v18;

  v25[0] = &unk_1E6C9F100;
  v25[1] = &unk_1E6C9F118;
  v26[0] = &unk_1E6CA4E48;
  v26[1] = &unk_1E6CA4E48;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v19, 1.0);
  *(_QWORD *)&xmmword_1EF174408 = v20;

  v23[0] = &unk_1E6C9F100;
  v23[1] = &unk_1E6C9F118;
  v24[0] = &unk_1E6CA4E48;
  v24[1] = &unk_1E6CA4E48;
  v23[2] = &unk_1E6C9F130;
  v24[2] = &unk_1E6CA4E98;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v21, 2.0);
  *((_QWORD *)&xmmword_1EF174408 + 1) = v22;

}

@end
