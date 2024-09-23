@implementation NSArray(ENShuffle)

- (id)enRandomlyShuffled
{
  void *v2;
  void *v3;

  if ((unint64_t)objc_msgSend(a1, "count") > 1)
  {
    v3 = (void *)objc_msgSend(a1, "mutableCopy");
    objc_msgSend(v3, "enRandomlyShuffle");
    v2 = (void *)objc_msgSend(v3, "copy");

  }
  else
  {
    v2 = (void *)objc_msgSend(a1, "copy");
  }
  return v2;
}

@end
