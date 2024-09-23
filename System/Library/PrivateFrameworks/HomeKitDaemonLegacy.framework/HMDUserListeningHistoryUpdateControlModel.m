@implementation HMDUserListeningHistoryUpdateControlModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_179908 != -1)
    dispatch_once(&hmbProperties_onceToken_179908, &__block_literal_global_179909);
  return (id)hmbProperties__properties_179910;
}

void __58__HMDUserListeningHistoryUpdateControlModel_hmbProperties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("accessories");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)hmbProperties__properties_179910;
  hmbProperties__properties_179910 = v1;

}

@end
