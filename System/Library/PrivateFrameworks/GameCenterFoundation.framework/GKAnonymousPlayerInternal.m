@implementation GKAnonymousPlayerInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)playerID
{
  return CFSTR("AnonymousID");
}

- (id)alias
{
  return +[GCFLocalizedStrings ANONYMOUS_PLAYER_NICKNAME](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ANONYMOUS_PLAYER_NICKNAME");
}

- (BOOL)isAnonymousPlayer
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "isMemberOfClass:", objc_opt_class());

  return v4;
}

@end
