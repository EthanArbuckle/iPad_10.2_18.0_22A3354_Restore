@implementation NSArray(BMUtilities)

+ (id)bm_shuffledArrayWithArray:()BMUtilities
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") > 1)
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    v6 = objc_msgSend(v5, "count");
    v7 = v6 - 1;
    if (v6 != 1)
    {
      do
      {
        objc_msgSend(v5, "exchangeObjectAtIndex:withObjectAtIndex:", v7, arc4random_uniform(v7 + 1));
        --v7;
      }
      while (v7);
    }
    v4 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    v4 = (void *)objc_msgSend(v3, "copy");
  }

  return v4;
}

@end
