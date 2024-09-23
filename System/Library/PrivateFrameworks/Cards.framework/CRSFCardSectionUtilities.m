@implementation CRSFCardSectionUtilities

+ (id)cardSectionWithSFCardSection:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || objc_msgSend(v3, "conformsToProtocol:", &unk_2551159F8))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

@end
