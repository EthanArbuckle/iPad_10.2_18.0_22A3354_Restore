@implementation KeyValuePairFromIdentifierForKey

uint64_t __KeyValuePairFromIdentifierForKey_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "componentsSeparatedByString:", CFSTR(":"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));
  return v5;
}

@end
