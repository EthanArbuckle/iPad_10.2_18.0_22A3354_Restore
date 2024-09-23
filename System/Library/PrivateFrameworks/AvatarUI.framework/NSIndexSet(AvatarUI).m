@implementation NSIndexSet(AvatarUI)

- (uint64_t)closestIndexToIndex:()AvatarUI greaterIndexesFirst:
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v7 = objc_msgSend(a1, "indexGreaterThanOrEqualToIndex:");
  v8 = objc_msgSend(a1, "indexLessThanOrEqualToIndex:", a3);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    v9 = v8;
  else
    v9 = v7;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    v10 = v7;
  else
    v10 = v8;
  if (a4)
    return v9;
  else
    return v10;
}

@end
