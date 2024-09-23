@implementation NTKSubmitError

void __NTKSubmitError_block_invoke(uint64_t a1)
{
  __CFString *v1;
  uint64_t v2;
  void *v3;
  __CFString *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v1 = CFSTR("ntk_unknown");
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
    v1 = *(__CFString **)(a1 + 32);
  v6[0] = CFSTR("error");
  v6[1] = v2;
  v7[0] = v2;
  v7[1] = v1;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = v1;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  AnalyticsSendEvent();
}

@end
