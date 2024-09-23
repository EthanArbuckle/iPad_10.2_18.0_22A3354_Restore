@implementation HFValueSetStringProviderWithMap

id __HFValueSetStringProviderWithMap_block_invoke_3(uint64_t a1, uint64_t a2)
{
  __CFString *v2;
  __CFString *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("HFCharacteristicValueUnknownString");
  _HFLocalizedStringWithDefaultValue(v2, v2, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __HFValueSetStringProviderWithMap_block_invoke_2()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ED379E10;
  qword_1ED379E10 = v0;

}

@end
