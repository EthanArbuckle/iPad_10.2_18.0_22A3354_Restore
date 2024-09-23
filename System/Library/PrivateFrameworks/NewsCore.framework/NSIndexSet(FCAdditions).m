@implementation NSIndexSet(FCAdditions)

- (uint64_t)fc_countOfContiguousIndexesGreaterThanOrEqualToIndex:()FCAdditions
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = 0;
  if (objc_msgSend(a1, "containsIndex:"))
  {
    v6 = a3 + 1;
    do
      v7 = v6 + v5++;
    while ((objc_msgSend(a1, "containsIndex:", v7) & 1) != 0);
  }
  return v5;
}

- (uint64_t)fc_countOfContiguousIndexesLessThanIndex:()FCAdditions
{
  uint64_t v5;
  char v6;

  if (!a3)
    return 0;
  v5 = 1;
  do
    v6 = objc_msgSend(a1, "containsIndex:", a3 + v5-- - 2);
  while ((v6 & 1) != 0);
  return -v5;
}

- (uint64_t)fc_enclosingRange
{
  uint64_t v2;

  if (objc_msgSend(a1, "firstIndex") == 0x7FFFFFFFFFFFFFFFLL)
    v2 = 0;
  else
    v2 = objc_msgSend(a1, "firstIndex");
  if (objc_msgSend(a1, "lastIndex") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a1, "lastIndex");
  return v2;
}

- (BOOL)fc_isContiguous
{
  unint64_t v2;
  unint64_t v3;

  v2 = objc_msgSend(a1, "firstIndex");
  do
  {
    v3 = v2;
    if (v2 == 0x7FFFFFFFFFFFFFFFLL)
      break;
    v2 = objc_msgSend(a1, "indexGreaterThanIndex:", v2);
  }
  while (v2 == 0x7FFFFFFFFFFFFFFFLL || v2 <= v3 + 1);
  return v3 == 0x7FFFFFFFFFFFFFFFLL;
}

- (id)fc_indexSetWithGapsInRange:()FCAdditions
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 < a3 + a4)
  {
    do
    {
      if ((objc_msgSend(a1, "containsIndex:", a3) & 1) == 0)
        objc_msgSend(v7, "addIndex:", a3);
      ++a3;
      --a4;
    }
    while (a4);
  }
  return v7;
}

- (void)fc_enumerateGapsInRange:()FCAdditions usingBlock:
{
  id v8;
  id v9;

  v8 = a5;
  objc_msgSend(a1, "fc_indexSetWithGapsInRange:", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enumerateRangesUsingBlock:", v8);

}

@end
