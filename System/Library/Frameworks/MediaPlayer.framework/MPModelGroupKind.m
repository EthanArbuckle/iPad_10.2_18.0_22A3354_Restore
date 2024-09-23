@implementation MPModelGroupKind

- (id)humanDescription
{
  return CFSTR("group");
}

+ (id)identityKind
{
  return +[MPModelKind kindWithModelClass:](MPModelKind, "kindWithModelClass:", objc_opt_class());
}

@end
