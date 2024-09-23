@implementation CLKUIOrderedSuffixesForDevice

void __CLKUIOrderedSuffixesForDevice_block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(a2, "sizeClass");
  if (v2 > 8)
    v3 = 0;
  else
    v3 = (uint64_t)*(&off_1E86E00E8 + v2);
  v4 = (void *)CLKUIOrderedSuffixesForDevice___suffixes;
  CLKUIOrderedSuffixesForDevice___suffixes = v3;

}

@end
