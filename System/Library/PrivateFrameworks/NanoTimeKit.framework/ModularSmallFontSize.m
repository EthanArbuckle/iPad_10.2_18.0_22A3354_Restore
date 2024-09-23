@implementation ModularSmallFontSize

void ___ModularSmallFontSize_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[5];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v19[0] = &unk_1E6C9F028;
  v19[1] = &unk_1E6C9F040;
  v20[0] = &unk_1E6CA4DA8;
  v20[1] = &unk_1E6CA4DB8;
  v21[0] = &unk_1E6C9EFB0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v4, 41.5);
  objc_msgSend(v3, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v5;
  v21[1] = &unk_1E6C9EFC8;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 0, 33.0, 29.0);
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v7;
  v21[2] = &unk_1E6C9EFE0;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v17[0] = &unk_1E6C9F028;
  v17[1] = &unk_1E6C9F040;
  v18[0] = &unk_1E6CA4DC8;
  v18[1] = &unk_1E6CA4DD8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v9, 24.0);
  objc_msgSend(v8, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v10;
  v21[3] = &unk_1E6C9EFF8;
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 0, 20.0, 17.0);
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v12;
  v21[4] = &unk_1E6C9F010;
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "scaledValue:", 16.5);
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)_ModularSmallFontSize_sizes;
  _ModularSmallFontSize_sizes = v15;

}

@end
