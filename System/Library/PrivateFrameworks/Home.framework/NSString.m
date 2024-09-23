@implementation NSString

void __35__NSString_HFAdditions__hf_isEmail__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF MATCHES %@"), CFSTR(".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_258;
  _MergedGlobals_258 = v0;

}

void __68__NSString_HFAdditions__hf_stringByTransformingFirstWordUsingBlock___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v9 = *(_QWORD *)(a1[5] + 8);
  *(_QWORD *)(v9 + 32) = a3;
  *(_QWORD *)(v9 + 40) = a4;
  (*(void (**)(void))(a1[4] + 16))();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  *a7 = 1;
}

uint64_t __57__NSString_HFAdditions__hf_stringByCapitalizingFirstWord__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedCapitalizedString");
}

uint64_t __56__NSString_HFAdditions__hf_stringByLowercasingFirstWord__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedLowercaseString");
}

@end
