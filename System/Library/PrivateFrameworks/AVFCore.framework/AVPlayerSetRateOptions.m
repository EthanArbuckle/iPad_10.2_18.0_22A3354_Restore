@implementation AVPlayerSetRateOptions

- (AVPlayerSetRateOptions)init
{
  AVPlayerSetRateOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVPlayerSetRateOptions;
  result = -[AVPlayerSetRateOptions init](&v3, sel_init);
  result->_preferCoordinatedPlaybackBehavior = 0;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AVPlayerSetRateOptions *v4;

  v4 = -[AVPlayerSetRateOptions init](+[AVPlayerSetRateOptions allocWithZone:](AVPlayerSetRateOptions, "allocWithZone:", a3), "init");
  -[AVPlayerSetRateOptions setPreferCoordinatedPlaybackBehavior:](v4, "setPreferCoordinatedPlaybackBehavior:", -[AVPlayerSetRateOptions preferCoordinatedPlaybackBehavior](self, "preferCoordinatedPlaybackBehavior"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[AVPlayerSetRateOptions preferCoordinatedPlaybackBehavior](self, "preferCoordinatedPlaybackBehavior");
  return v5 ^ objc_msgSend(a3, "preferCoordinatedPlaybackBehavior") ^ 1;
}

- (BOOL)preferCoordinatedPlaybackBehavior
{
  return self->_preferCoordinatedPlaybackBehavior;
}

- (void)setPreferCoordinatedPlaybackBehavior:(BOOL)a3
{
  self->_preferCoordinatedPlaybackBehavior = a3;
}

@end
