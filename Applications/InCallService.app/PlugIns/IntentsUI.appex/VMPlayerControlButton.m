@implementation VMPlayerControlButton

+ (id)buttonWithState:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[VMPlayerControlButton buttonWithType:](VMPlayerControlButton, "buttonWithType:", 1));
  objc_msgSend(v4, "setBounds:", 0.0, 0.0, 40.0, 40.0);
  objc_msgSend(v4, "setPlayerState:", a3);
  objc_msgSend(v4, "setClipsToBounds:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v4, "setBackgroundColor:", v5);

  objc_msgSend(v4, "_setTouchInsets:", -40.0, -40.0, -40.0, -40.0);
  objc_msgSend(v4, "updateButtonGlyphImage");
  return v4;
}

- (void)setPlayerState:(unint64_t)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  if (-[VMPlayerControlButton playerState](self, "playerState") != a3
    || -[VMPlayerControlButton isEnabled](self, "isEnabled") != v4)
  {
    -[VMPlayerControlButton setPlayerState:](self, "setPlayerState:", a3);
    -[VMPlayerControlButton setEnabled:](self, "setEnabled:", v4);
    -[VMPlayerControlButton updateButtonGlyphImage](self, "updateButtonGlyphImage");
  }
}

- (void)updateButtonGlyphImage
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = -[VMPlayerControlButton playerState](self, "playerState");
  if (v3 == 1)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[UIImage voicemailPauseGlyphImage](UIImage, "voicemailPauseGlyphImage"));
  }
  else
  {
    if (v3)
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = objc_claimAutoreleasedReturnValue(+[UIImage voicemailPlayGlyphImage](UIImage, "voicemailPlayGlyphImage"));
  }
  v5 = (void *)v4;
LABEL_7:
  v6 = v5;
  -[VMPlayerControlButton setImage:forState:](self, "setImage:forState:", v5, 0);

}

- (unint64_t)playerState
{
  return self->_playerState;
}

- (void)setPlayerState:(unint64_t)a3
{
  self->_playerState = a3;
}

@end
