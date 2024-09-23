@implementation NSString(MOEventCategory)

- (uint64_t)associatedEventPermission
{
  if ((objc_msgSend(a1, "isEqualToString:", MOEventBundleSourceTypeContact) & 1) != 0)
    return 10;
  if ((objc_msgSend(a1, "isEqualToString:", MOEventBundleSourceTypeMedia) & 1) != 0)
    return 4;
  if ((objc_msgSend(a1, "isEqualToString:", MOEventBundleSourceTypePeopleContext) & 1) != 0)
    return 23;
  if ((objc_msgSend(a1, "isEqualToString:", MOEventBundleSourceTypePhoto) & 1) != 0)
    return 5;
  if ((objc_msgSend(a1, "isEqualToString:", MOEventBundleSourceTypeThirdPartyMedia) & 1) != 0)
    return 4;
  if ((objc_msgSend(a1, "isEqualToString:", MOEventBundleSourceTypeStateOfMind) & 1) != 0)
    return 24;
  if ((objc_msgSend(a1, "isEqualToString:", MOEventBundleSourceTypeVisitLocation) & 1) != 0)
    return 1;
  if (objc_msgSend(a1, "isEqualToString:", MOEventBundleSourceTypeActivity))
    return 2;
  return 0;
}

@end
