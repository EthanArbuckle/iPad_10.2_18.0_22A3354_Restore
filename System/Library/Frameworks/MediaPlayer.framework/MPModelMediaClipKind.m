@implementation MPModelMediaClipKind

- (id)humanDescription
{
  return CFSTR("media clip");
}

+ (id)identityKind
{
  return +[MPModelKind kindWithModelClass:](MPModelKind, "kindWithModelClass:", objc_opt_class());
}

@end
