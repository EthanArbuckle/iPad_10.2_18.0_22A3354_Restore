@implementation NSString(SFExtras)

- (uint64_t)sf_asResultPlacement
{
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("top")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("bottom")) & 1) != 0)
    return 2;
  if (objc_msgSend(a1, "isEqualToString:", CFSTR("tophit")))
    return 3;
  return 0;
}

- (uint64_t)sf_asTextAlignment
{
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("left")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("center")) & 1) != 0)
    return 1;
  if (objc_msgSend(a1, "isEqualToString:", CFSTR("right")))
    return 2;
  return 0;
}

- (uint64_t)sf_asButtonAlignment
{
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("left")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("top")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("bottom")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("right")) & 1) != 0)
    return 4;
  if (objc_msgSend(a1, "isEqualToString:", CFSTR("center")))
    return 5;
  return 0;
}

- (uint64_t)sf_asImageAlignment
{
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("left")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("top")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("bottom")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("right")) & 1) != 0)
    return 3;
  if (objc_msgSend(a1, "isEqualToString:", CFSTR("center")))
    return 4;
  return 0;
}

- (uint64_t)sf_asColumnAlignment
{
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("left")) & 1) != 0)
    return 0;
  if (objc_msgSend(a1, "isEqualToString:", CFSTR("right")))
    return 2;
  return 0;
}

@end
