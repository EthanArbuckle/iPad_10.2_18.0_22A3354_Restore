@implementation NTKSubmitComplicationDescriptorCount

void __NTKSubmitComplicationDescriptorCount_block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 40);
  v5[0] = *(_QWORD *)(a1 + 32);
  v4[0] = CFSTR("clientIdentifier");
  v4[1] = CFSTR("numberOfEvents");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

@end
