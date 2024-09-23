@implementation NSNumber(SFExtras)

- (uint64_t)sf_asRowAlignment
{
  uint64_t result;

  result = objc_msgSend(a1, "integerValue");
  if ((unint64_t)(result + 1) >= 3)
    return 0;
  else
    return result;
}

- (uint64_t)sf_asTopHit
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "unsignedIntegerValue");
  if (v1 == 2)
    return 2;
  else
    return v1 == 1;
}

@end
