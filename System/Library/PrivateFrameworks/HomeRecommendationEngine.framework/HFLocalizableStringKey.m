@implementation HFLocalizableStringKey

id __61__HFLocalizableStringKey_HREAdditions__hre_localizationBlock__block_invoke()
{
  if (_block_invoke_na_once_token_376_7 != -1)
    dispatch_once(&_block_invoke_na_once_token_376_7, &__block_literal_global_2_5);
  return (id)_block_invoke_na_once_object_376_7;
}

void __61__HFLocalizableStringKey_HREAdditions__hre_localizationBlock__block_invoke_2()
{
  void *v0;

  v0 = (void *)_block_invoke_na_once_object_376_7;
  _block_invoke_na_once_object_376_7 = (uint64_t)&__block_literal_global_4;

}

id __61__HFLocalizableStringKey_HREAdditions__hre_localizationBlock__block_invoke_3(uint64_t a1, void *a2)
{
  return HREOptionalLocalizedString(a2);
}

@end
