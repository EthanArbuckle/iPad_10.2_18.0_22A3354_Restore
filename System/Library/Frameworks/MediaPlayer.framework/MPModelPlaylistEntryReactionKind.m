@implementation MPModelPlaylistEntryReactionKind

+ (id)identityKind
{
  return +[MPModelKind kindWithModelClass:](MPModelKind, "kindWithModelClass:", objc_opt_class());
}

- (id)humanDescription
{
  return CFSTR("playlist entry reaction");
}

@end
