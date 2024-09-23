@implementation MFDASearchCriterionConverterDelegate

void __97___MFDASearchCriterionConverterDelegate_messageCriterionConverter_predicateKeysForCriterionType___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[12];
  _QWORD v29[14];

  v29[12] = *MEMORY[0x1E0C80C00];
  v28[0] = &unk_1E4F6A048;
  v27 = *MEMORY[0x1E0D1C990];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v15;
  v28[1] = &unk_1E4F6A060;
  v26 = *MEMORY[0x1E0D1C9A0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v14;
  v28[2] = &unk_1E4F6A078;
  v25 = *MEMORY[0x1E0D1C958];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v0;
  v28[3] = &unk_1E4F6A090;
  v24 = *MEMORY[0x1E0D1C950];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v1;
  v28[4] = &unk_1E4F6A0A8;
  v23 = *MEMORY[0x1E0D1C978];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v2;
  v28[5] = &unk_1E4F6A0C0;
  v22 = *MEMORY[0x1E0D1C970];
  v3 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v4;
  v28[6] = &unk_1E4F6A0D8;
  v21 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[6] = v5;
  v28[7] = &unk_1E4F6A0F0;
  v20 = *MEMORY[0x1E0D1C960];
  v6 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[7] = v7;
  v28[8] = &unk_1E4F6A108;
  v19 = *MEMORY[0x1E0D1C968];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[8] = v8;
  v28[9] = &unk_1E4F6A120;
  v18 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[9] = v9;
  v28[10] = &unk_1E4F6A138;
  v17 = *MEMORY[0x1E0D1C998];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[10] = v10;
  v28[11] = &unk_1E4F6A150;
  v16 = *MEMORY[0x1E0D1C980];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[11] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 12);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)messageCriterionConverter_predicateKeysForCriterionType__converterKeyDictionary;
  messageCriterionConverter_predicateKeysForCriterionType__converterKeyDictionary = v12;

}

void __78___MFDASearchCriterionConverterDelegate__shouldConvertEqualsToContainsForKey___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[9];

  v6[8] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D1C970];
  v6[0] = *MEMORY[0x1E0D1C998];
  v6[1] = v0;
  v1 = *MEMORY[0x1E0D1C958];
  v6[2] = *MEMORY[0x1E0D1C950];
  v6[3] = v1;
  v2 = *MEMORY[0x1E0D1C988];
  v6[4] = *MEMORY[0x1E0D1C978];
  v6[5] = v2;
  v3 = *MEMORY[0x1E0D1C9A0];
  v6[6] = *MEMORY[0x1E0D1C990];
  v6[7] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 8);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_shouldConvertEqualsToContainsForKey___daKeys;
  _shouldConvertEqualsToContainsForKey___daKeys = v4;

}

@end
