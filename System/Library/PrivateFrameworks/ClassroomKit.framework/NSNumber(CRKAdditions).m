@implementation NSNumber(CRKAdditions)

- (uint64_t)crk_featureBoolType
{
  if (objc_msgSend(a1, "BOOLValue"))
    return 1;
  else
    return 2;
}

+ (uint64_t)crk_featureBoolTypeFromNumber:()CRKAdditions
{
  if (a3)
    return objc_msgSend(a3, "crk_featureBoolType");
  else
    return 0;
}

@end
