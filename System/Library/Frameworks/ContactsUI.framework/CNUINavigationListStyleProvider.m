@implementation CNUINavigationListStyleProvider

+ (CNUINavigationListStyle)phoneStyle
{
  return (CNUINavigationListStyle *)objc_alloc_init(CNUIPhoneNavigationListStyleProvider);
}

+ (CNUINavigationListStyle)carPlayStyle
{
  return (CNUINavigationListStyle *)objc_alloc_init(CNUICarPlayNavigationListStyleProvider);
}

@end
