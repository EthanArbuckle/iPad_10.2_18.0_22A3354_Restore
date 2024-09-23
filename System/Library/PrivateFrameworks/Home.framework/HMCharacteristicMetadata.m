@implementation HMCharacteristicMetadata

void __53__HMCharacteristicMetadata_HFAdditions__hf_isInteger__block_invoke_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB8730];
  v6[0] = *MEMORY[0x1E0CB8708];
  v6[1] = v1;
  v2 = *MEMORY[0x1E0CB8720];
  v6[2] = *MEMORY[0x1E0CB8718];
  v6[3] = v2;
  v6[4] = *MEMORY[0x1E0CB8728];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ED3791B0;
  qword_1ED3791B0 = v4;

}

@end
