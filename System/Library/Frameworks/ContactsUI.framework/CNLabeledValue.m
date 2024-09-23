@implementation CNLabeledValue

void __56__CNLabeledValue_UIAdditions__builtinLabelsForProperty___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[14];
  _QWORD v20[2];
  _QWORD v21[4];
  _QWORD v22[4];
  _QWORD v23[10];
  _QWORD v24[5];
  _QWORD v25[6];

  v25[5] = *MEMORY[0x1E0C80C00];
  v24[0] = *MEMORY[0x1E0C967C0];
  v1 = *MEMORY[0x1E0C97070];
  v23[0] = *MEMORY[0x1E0C96FF8];
  v0 = v23[0];
  v23[1] = v1;
  v2 = *MEMORY[0x1E0C97008];
  v23[2] = *MEMORY[0x1E0C97058];
  v23[3] = v2;
  v3 = *MEMORY[0x1E0C97020];
  v23[4] = *MEMORY[0x1E0C97028];
  v23[5] = v3;
  v4 = *MEMORY[0x1E0C97050];
  v23[6] = *MEMORY[0x1E0C97010];
  v23[7] = v4;
  v5 = *MEMORY[0x1E0C97000];
  v23[8] = *MEMORY[0x1E0C97038];
  v23[9] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v6;
  v24[1] = *MEMORY[0x1E0C966A8];
  v22[0] = v0;
  v22[1] = v1;
  v22[2] = *MEMORY[0x1E0C96FF0];
  v22[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v7;
  v24[2] = *MEMORY[0x1E0C968A0];
  v21[0] = *MEMORY[0x1E0C97068];
  v21[1] = v0;
  v21[2] = v1;
  v21[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v8;
  v24[3] = *MEMORY[0x1E0C96690];
  v20[0] = *MEMORY[0x1E0C96FE8];
  v20[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v9;
  v24[4] = *MEMORY[0x1E0C96840];
  v10 = *MEMORY[0x1E0C96BB8];
  v19[0] = *MEMORY[0x1E0C96D08];
  v19[1] = v10;
  v11 = *MEMORY[0x1E0C969D8];
  v19[2] = *MEMORY[0x1E0C96D90];
  v19[3] = v11;
  v12 = *MEMORY[0x1E0C96E58];
  v19[4] = *MEMORY[0x1E0C96E08];
  v19[5] = v12;
  v13 = *MEMORY[0x1E0C96A28];
  v19[6] = *MEMORY[0x1E0C96AF0];
  v19[7] = v13;
  v14 = *MEMORY[0x1E0C96E78];
  v19[8] = *MEMORY[0x1E0C96BF8];
  v19[9] = v14;
  v15 = *MEMORY[0x1E0C96958];
  v19[10] = *MEMORY[0x1E0C96DE8];
  v19[11] = v15;
  v19[12] = *MEMORY[0x1E0C96D00];
  v19[13] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 5);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)builtinLabelsForProperty__labelsForProperty;
  builtinLabelsForProperty__labelsForProperty = v17;

}

void __44__CNLabeledValue_UIAdditions__defaultLabels__block_invoke()
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
  void *v14;
  _QWORD v15[27];

  v15[26] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C96FF8];
  v15[0] = *MEMORY[0x1E0C97000];
  v15[1] = v0;
  v1 = *MEMORY[0x1E0C97058];
  v15[2] = *MEMORY[0x1E0C97070];
  v15[3] = v1;
  v2 = *MEMORY[0x1E0C97028];
  v15[4] = *MEMORY[0x1E0C97008];
  v15[5] = v2;
  v3 = *MEMORY[0x1E0C97010];
  v15[6] = *MEMORY[0x1E0C97020];
  v15[7] = v3;
  v4 = *MEMORY[0x1E0C97038];
  v15[8] = *MEMORY[0x1E0C97050];
  v15[9] = v4;
  v5 = *MEMORY[0x1E0C97068];
  v15[10] = *MEMORY[0x1E0C96FF0];
  v15[11] = v5;
  v6 = *MEMORY[0x1E0C96BB8];
  v15[12] = *MEMORY[0x1E0C96FE8];
  v15[13] = v6;
  v7 = *MEMORY[0x1E0C96D90];
  v15[14] = *MEMORY[0x1E0C96D08];
  v15[15] = v7;
  v8 = *MEMORY[0x1E0C96E08];
  v15[16] = *MEMORY[0x1E0C969D8];
  v15[17] = v8;
  v9 = *MEMORY[0x1E0C96AF0];
  v15[18] = *MEMORY[0x1E0C96E58];
  v15[19] = v9;
  v10 = *MEMORY[0x1E0C96BF8];
  v15[20] = *MEMORY[0x1E0C96A28];
  v15[21] = v10;
  v11 = *MEMORY[0x1E0C96DE8];
  v15[22] = *MEMORY[0x1E0C96E78];
  v15[23] = v11;
  v12 = *MEMORY[0x1E0C96D00];
  v15[24] = *MEMORY[0x1E0C96958];
  v15[25] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 26);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)defaultLabels_labels;
  defaultLabels_labels = v13;

}

ABAddressBookRef __42__CNLabeledValue_UIAdditions__addressBook__block_invoke()
{
  ABAddressBookRef result;

  result = ABAddressBookCreateWithOptions(0, 0);
  addressBook_ab = (uint64_t)result;
  return result;
}

@end
