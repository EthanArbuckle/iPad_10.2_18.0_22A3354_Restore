@implementation NSObject(LegacyModelObjectProviding)

- (id)musicKit_sanitizedLegacyModelObject
{
  id v2;

  getMPModelObjectClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = a1;
  else
    v2 = 0;
  return v2;
}

@end
