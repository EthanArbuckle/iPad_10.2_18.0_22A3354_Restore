@implementation NSError

void __61__NSError_BRFPAdditions___br_getFileProviderDomainErrorCode___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[12];
  _QWORD v9[12];
  _QWORD v10[17];
  _QWORD v11[17];
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = &unk_1E3DC26C0;
  v12[1] = &unk_1E3DC26F0;
  v13[0] = &unk_1E3DC26D8;
  v13[1] = &unk_1E3DC2708;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_br_getFileProviderDomainErrorCode__cocoaErrorToFPError;
  _br_getFileProviderDomainErrorCode__cocoaErrorToFPError = v0;

  v10[0] = &unk_1E3DC2720;
  v10[1] = &unk_1E3DC2750;
  v11[0] = &unk_1E3DC2738;
  v11[1] = &unk_1E3DC2768;
  v10[2] = &unk_1E3DC2780;
  v10[3] = &unk_1E3DC2798;
  v11[2] = &unk_1E3DC2768;
  v11[3] = &unk_1E3DC2768;
  v10[4] = &unk_1E3DC27B0;
  v10[5] = &unk_1E3DC27E0;
  v11[4] = &unk_1E3DC27C8;
  v11[5] = &unk_1E3DC27F8;
  v10[6] = &unk_1E3DC2810;
  v10[7] = &unk_1E3DC2840;
  v11[6] = &unk_1E3DC2828;
  v11[7] = &unk_1E3DC2858;
  v10[8] = &unk_1E3DC2870;
  v10[9] = &unk_1E3DC28A0;
  v11[8] = &unk_1E3DC2888;
  v11[9] = &unk_1E3DC28B8;
  v10[10] = &unk_1E3DC28D0;
  v10[11] = &unk_1E3DC28E8;
  v11[10] = &unk_1E3DC28B8;
  v11[11] = &unk_1E3DC26D8;
  v10[12] = &unk_1E3DC2900;
  v10[13] = &unk_1E3DC2930;
  v11[12] = &unk_1E3DC2918;
  v11[13] = &unk_1E3DC2948;
  v11[14] = &unk_1E3DC2948;
  v10[14] = &unk_1E3DC2960;
  v10[15] = &unk_1E3DC2978;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *MEMORY[0x1E0CAAB70]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[15] = v2;
  v10[16] = &unk_1E3DC2990;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *MEMORY[0x1E0CAAB68]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[16] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 17);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_br_getFileProviderDomainErrorCode__clouddocsErrorToFPError;
  _br_getFileProviderDomainErrorCode__clouddocsErrorToFPError = v4;

  v8[0] = &unk_1E3DC29A8;
  v8[1] = &unk_1E3DC29C0;
  v9[0] = &unk_1E3DC26D8;
  v9[1] = &unk_1E3DC26D8;
  v8[2] = &unk_1E3DC29D8;
  v8[3] = &unk_1E3DC29F0;
  v9[2] = &unk_1E3DC26D8;
  v9[3] = &unk_1E3DC2738;
  v8[4] = &unk_1E3DC2A08;
  v8[5] = &unk_1E3DC27C8;
  v9[4] = &unk_1E3DC2768;
  v9[5] = &unk_1E3DC2768;
  v8[6] = &unk_1E3DC2A20;
  v8[7] = &unk_1E3DC2A38;
  v9[6] = &unk_1E3DC2708;
  v9[7] = &unk_1E3DC26D8;
  v8[8] = &unk_1E3DC2A50;
  v8[9] = &unk_1E3DC27F8;
  v9[8] = &unk_1E3DC26D8;
  v9[9] = &unk_1E3DC26D8;
  v8[10] = &unk_1E3DC2A68;
  v8[11] = &unk_1E3DC2A80;
  v9[10] = &unk_1E3DC26D8;
  v9[11] = &unk_1E3DC26D8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 12);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)_br_getFileProviderDomainErrorCode__cloudKitErrorToFPError;
  _br_getFileProviderDomainErrorCode__cloudKitErrorToFPError = v6;

}

void __66__NSError_BRFPAdditions___br_populateUserInfoDictWithDomain_code___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("BRUnderlyingItemKey");
  v10[0] = *MEMORY[0x1E0CAAB58];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_br_populateUserInfoDictWithDomain_code__brUserInfoKeyToFPUserInfoKey;
  _br_populateUserInfoDictWithDomain_code__brUserInfoKeyToFPUserInfoKey = v0;

  v7 = CFSTR("BRUnderlyingItemIdentifierKey");
  v5 = &unk_1E3DC2750;
  v6 = *MEMORY[0x1E0CAAB60];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_br_populateUserInfoDictWithDomain_code__brUserInfoKeyToBRErrorCodeFPUserInfoKeyMap;
  _br_populateUserInfoDictWithDomain_code__brUserInfoKeyToBRErrorCodeFPUserInfoKeyMap = v3;

}

void __66__NSError_BRFPAdditions___br_populateUserInfoDictWithDomain_code___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v6);

}

void __66__NSError_BRFPAdditions___br_populateUserInfoDictWithDomain_code___block_invoke_3(id *a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(a1[4], "objectForKey:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1[5], "code"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v5, v8);

  }
}

@end
