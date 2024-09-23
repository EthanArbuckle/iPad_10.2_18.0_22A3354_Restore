@implementation AAUIDefaultFetchDescriptors

void ___AAUIDefaultFetchDescriptors_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[7];

  v7[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97450], "descriptorForRequiredKeys");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x1E0C96708];
  v7[0] = v0;
  v7[1] = v1;
  v2 = *MEMORY[0x1E0C96778];
  v7[2] = *MEMORY[0x1E0C96688];
  v7[3] = v2;
  objc_msgSend(MEMORY[0x1E0C97548], "descriptorForRequiredKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[4] = v3;
  objc_msgSend(MEMORY[0x1E0C97450], "descriptorForRequiredKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[5] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 6);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_AAUIDefaultFetchDescriptors_fetchDescriptors;
  _AAUIDefaultFetchDescriptors_fetchDescriptors = v5;

}

@end
