@implementation NTKSubmitSelectedFace

void __NTKSubmitSelectedFace_block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  __CFString *v3;
  __CFString *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  NTKAnalyticsValueForFace(*(void **)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  v3 = CFSTR("ntk_unknown");
  if (v1)
    v3 = (__CFString *)v1;
  v4 = v3;

  v6 = CFSTR("selectedFace");
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  AnalyticsSendEvent();
}

@end
