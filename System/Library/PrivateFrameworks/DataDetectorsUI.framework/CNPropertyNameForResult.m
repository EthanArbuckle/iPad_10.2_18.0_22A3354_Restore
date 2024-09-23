@implementation CNPropertyNameForResult

void ___CNPropertyNameForResult_block_invoke()
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
  void *v10;
  _QWORD v11[9];
  _QWORD v12[10];

  v12[9] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C970C8];
  v1 = *MEMORY[0x1E0D1CA40];
  v11[0] = *MEMORY[0x1E0D1CB68];
  v11[1] = v1;
  v2 = *MEMORY[0x1E0C97098];
  v12[0] = v0;
  v12[1] = v2;
  v3 = *MEMORY[0x1E0C970B0];
  v4 = *MEMORY[0x1E0D1CB60];
  v11[2] = *MEMORY[0x1E0D1CBC8];
  v11[3] = v4;
  v5 = *MEMORY[0x1E0C970C0];
  v12[2] = v3;
  v12[3] = v5;
  v6 = *MEMORY[0x1E0C970A0];
  v7 = *MEMORY[0x1E0D1CA58];
  v11[4] = *MEMORY[0x1E0D1CA88];
  v11[5] = v7;
  v12[4] = v6;
  v12[5] = &stru_1E4259460;
  v8 = *MEMORY[0x1E0D1CB30];
  v11[6] = *MEMORY[0x1E0D1CA48];
  v11[7] = v8;
  v12[6] = &stru_1E4259460;
  v12[7] = &stru_1E4259460;
  v11[8] = *MEMORY[0x1E0D1CB10];
  v12[8] = &stru_1E4259460;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 9);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)_CNPropertyNameForResult_mapping;
  _CNPropertyNameForResult_mapping = v9;

}

@end
