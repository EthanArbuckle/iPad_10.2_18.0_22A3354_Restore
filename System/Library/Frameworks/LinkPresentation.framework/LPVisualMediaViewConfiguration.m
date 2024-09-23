@implementation LPVisualMediaViewConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  LPVisualMediaViewConfiguration *v4;
  LPVisualMediaViewConfiguration *v5;

  v4 = +[LPVisualMediaViewConfiguration allocWithZone:](LPVisualMediaViewConfiguration, "allocWithZone:", a3);
  if (v4)
  {
    -[LPVisualMediaViewConfiguration setDisablePlayback:](v4, "setDisablePlayback:", -[LPVisualMediaViewConfiguration disablePlayback](self, "disablePlayback"));
    -[LPVisualMediaViewConfiguration setDisablePlaybackControls:](v4, "setDisablePlaybackControls:", -[LPVisualMediaViewConfiguration disablePlaybackControls](self, "disablePlaybackControls"));
    -[LPVisualMediaViewConfiguration setDisableAutoPlay:](v4, "setDisableAutoPlay:", -[LPVisualMediaViewConfiguration disableAutoPlay](self, "disableAutoPlay"));
    -[LPVisualMediaViewConfiguration setAllowsLoadingMediaWithAutoPlayDisabled:](v4, "setAllowsLoadingMediaWithAutoPlayDisabled:", -[LPVisualMediaViewConfiguration allowsLoadingMediaWithAutoPlayDisabled](self, "allowsLoadingMediaWithAutoPlayDisabled"));
    -[LPVisualMediaViewConfiguration fullScreenTransitionCornerRadius](self, "fullScreenTransitionCornerRadius");
    -[LPVisualMediaViewConfiguration setFullScreenTransitionCornerRadius:](v4, "setFullScreenTransitionCornerRadius:");
    v5 = v4;
  }

  return v4;
}

- (BOOL)disablePlayback
{
  return self->_disablePlayback;
}

- (void)setDisablePlayback:(BOOL)a3
{
  self->_disablePlayback = a3;
}

- (BOOL)disablePlaybackControls
{
  return self->_disablePlaybackControls;
}

- (void)setDisablePlaybackControls:(BOOL)a3
{
  self->_disablePlaybackControls = a3;
}

- (BOOL)disableAutoPlay
{
  return self->_disableAutoPlay;
}

- (void)setDisableAutoPlay:(BOOL)a3
{
  self->_disableAutoPlay = a3;
}

- (BOOL)allowsLoadingMediaWithAutoPlayDisabled
{
  return self->_allowsLoadingMediaWithAutoPlayDisabled;
}

- (void)setAllowsLoadingMediaWithAutoPlayDisabled:(BOOL)a3
{
  self->_allowsLoadingMediaWithAutoPlayDisabled = a3;
}

- (double)fullScreenTransitionCornerRadius
{
  return self->_fullScreenTransitionCornerRadius;
}

- (void)setFullScreenTransitionCornerRadius:(double)a3
{
  self->_fullScreenTransitionCornerRadius = a3;
}

@end
