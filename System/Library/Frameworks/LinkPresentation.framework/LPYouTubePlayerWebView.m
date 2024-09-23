@implementation LPYouTubePlayerWebView

- (BOOL)canBecomeFirstResponder
{
  objc_super v3;

  if (!*(&self->super.__hasActiveNowPlayingSession + 1))
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)LPYouTubePlayerWebView;
  return -[LPYouTubePlayerWebView canBecomeFirstResponder](&v3, sel_canBecomeFirstResponder);
}

- (BOOL)becomeFirstResponder
{
  objc_super v3;

  if (!*(&self->super.__hasActiveNowPlayingSession + 1))
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)LPYouTubePlayerWebView;
  return -[LPYouTubePlayerWebView becomeFirstResponder](&v3, sel_becomeFirstResponder);
}

- (BOOL)allowFirstResponder
{
  return *(&self->super.__hasActiveNowPlayingSession + 1);
}

- (void)setAllowFirstResponder:(BOOL)a3
{
  *(&self->super.__hasActiveNowPlayingSession + 1) = a3;
}

@end
