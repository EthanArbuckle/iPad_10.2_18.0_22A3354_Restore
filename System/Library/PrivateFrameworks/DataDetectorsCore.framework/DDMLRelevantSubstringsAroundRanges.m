@implementation DDMLRelevantSubstringsAroundRanges

BOOL __DDMLRelevantSubstringsAroundRanges_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "rangeValue");
  v6 = objc_msgSend(v4, "rangeValue");

  return v6 < v5;
}

@end
