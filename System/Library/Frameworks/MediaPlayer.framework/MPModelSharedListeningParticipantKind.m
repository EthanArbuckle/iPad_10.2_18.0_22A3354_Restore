@implementation MPModelSharedListeningParticipantKind

- (id)humanDescription
{
  return CFSTR("shared listening participant");
}

+ (id)identityKind
{
  return +[MPModelKind kindWithModelClass:](MPModelKind, "kindWithModelClass:", objc_opt_class());
}

@end
