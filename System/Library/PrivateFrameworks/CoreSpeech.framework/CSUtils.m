@implementation CSUtils

uint64_t __46__CSUtils_Statistics__distributionDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "doubleValue");
  v6 = v5;
  objc_msgSend(v4, "doubleValue");
  v8 = v7;

  if (v6 < v8)
    return -1;
  else
    return v6 > v8;
}

@end
