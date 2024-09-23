@implementation MPModelRadioStationKind

+ (id)identityKind
{
  return +[MPModelKind kindWithModelClass:](MPModelKind, "kindWithModelClass:", objc_opt_class());
}

- (id)humanDescription
{
  return CFSTR("radio station");
}

@end
