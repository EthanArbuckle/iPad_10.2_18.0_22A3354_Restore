@implementation WhitelistedNowPlayingKeysAndTypes

void ___WhitelistedNowPlayingKeysAndTypes_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[22];
  _QWORD v20[23];

  v20[22] = *MEMORY[0x1E0C80C00];
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = *MEMORY[0x1E0D4CA90];
  v19[0] = *MEMORY[0x1E0D4CA50];
  v19[1] = v6;
  v20[0] = v1;
  v20[1] = v1;
  v7 = *MEMORY[0x1E0D4CB40];
  v19[2] = *MEMORY[0x1E0D4CAA0];
  v19[3] = v7;
  v20[2] = v0;
  v20[3] = v0;
  v8 = *MEMORY[0x1E0D4C980];
  v19[4] = *MEMORY[0x1E0D4C968];
  v19[5] = v8;
  v20[4] = v0;
  v20[5] = v0;
  v9 = *MEMORY[0x1E0D4CAD0];
  v19[6] = *MEMORY[0x1E0D4CAD8];
  v19[7] = v9;
  v20[6] = v4;
  v20[7] = v1;
  v10 = *MEMORY[0x1E0D4CAB0];
  v19[8] = *MEMORY[0x1E0D4CB58];
  v19[9] = v10;
  v20[8] = v1;
  v20[9] = v1;
  v11 = *MEMORY[0x1E0D4CB90];
  v19[10] = *MEMORY[0x1E0D4CB88];
  v19[11] = v11;
  v20[10] = v1;
  v20[11] = v1;
  v12 = *MEMORY[0x1E0D4CA30];
  v19[12] = *MEMORY[0x1E0D4CB80];
  v19[13] = v12;
  v20[12] = v4;
  v20[13] = v0;
  v13 = *MEMORY[0x1E0D4C9C0];
  v19[14] = *MEMORY[0x1E0D4C9C8];
  v19[15] = v13;
  v20[14] = v0;
  v20[15] = v2;
  v14 = *MEMORY[0x1E0D4CA18];
  v19[16] = *MEMORY[0x1E0D4C9F0];
  v19[17] = v14;
  v20[16] = v2;
  v20[17] = v1;
  v15 = *MEMORY[0x1E0D4CB38];
  v19[18] = *MEMORY[0x1E0D4CA20];
  v19[19] = v15;
  v20[18] = v1;
  v20[19] = v5;
  v16 = *MEMORY[0x1E0D4CB08];
  v19[20] = *MEMORY[0x1E0D4C9E0];
  v19[21] = v16;
  v20[20] = v3;
  v20[21] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 22);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)_WhitelistedNowPlayingKeysAndTypes_schema;
  _WhitelistedNowPlayingKeysAndTypes_schema = v17;

}

@end
