@implementation PLImageFormat(PHAdoptionUtilities)

- (uint64_t)sizeWithFallBackSize:()PHAdoptionUtilities
{
  return objc_msgSend(a1, "size");
}

- (uint64_t)contentMode
{
  return objc_msgSend(a1, "dimensionsReferToShortSide");
}

@end
