@implementation CCItemField(CCSignificantLocationSubPremise_type)

- (uint64_t)significantLocationSubPremiseType
{
  uint64_t result;

  LODWORD(result) = objc_msgSend(a1, "uint32Value");
  if (result >= 5)
    return 0;
  else
    return result;
}

@end
