@implementation GKAutomatchPlayerInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)playerID
{
  return CFSTR("AutoMatchID");
}

- (id)alias
{
  return +[GCFLocalizedStrings AUTOMATCH_PLAYER](_TtC20GameCenterFoundation19GCFLocalizedStrings, "AUTOMATCH_PLAYER");
}

- (BOOL)isAutomatchPlayer
{
  return 1;
}

- (NSString)automatchPositionDisplayString
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_automatchPosition);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringFromNumber:numberStyle:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (int64_t)automatchPosition
{
  return self->_automatchPosition;
}

- (void)setAutomatchPosition:(int64_t)a3
{
  self->_automatchPosition = a3;
}

@end
