@implementation NSMutableArray(Shuffling)

- (unint64_t)shuffle
{
  unint64_t result;
  unint64_t v3;
  uint32_t v4;
  uint64_t v5;
  unsigned int v6;

  result = objc_msgSend(a1, "count");
  v3 = result - 2;
  if (result >= 2)
  {
    v4 = result;
    v5 = 0;
    v6 = 0;
    do
    {
      result = objc_msgSend(a1, "exchangeObjectAtIndex:withObjectAtIndex:", v5, arc4random_uniform(v4--) + v6);
      v5 = ++v6;
    }
    while (v3 >= v6);
  }
  return result;
}

- (uint64_t)shuffleWithSeed:()Shuffling
{
  uint64_t result;
  unsigned int v6;
  uint64_t v7;

  result = objc_msgSend(a1, "count");
  v6 = result;
  if ((int)result >= 2)
  {
    srand(a3);
    v7 = v6 - 1;
    do
      result = objc_msgSend(a1, "exchangeObjectAtIndex:withObjectAtIndex:", v7--, rand() % v6--);
    while ((_DWORD)v7);
  }
  return result;
}

@end
