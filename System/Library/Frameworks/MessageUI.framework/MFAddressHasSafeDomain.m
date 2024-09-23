@implementation MFAddressHasSafeDomain

id __MFAddressHasSafeDomain_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = a2;
  v3 = objc_msgSend(v2, "rangeOfString:", CFSTR("@"));
  v4 = v2;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v2, "substringFromIndex:", v3 + 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

BOOL __MFAddressHasSafeDomain_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "caseInsensitiveCompare:", *(_QWORD *)(a1 + 32)) == 0;
}

@end
