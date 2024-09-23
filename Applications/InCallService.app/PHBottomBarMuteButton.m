@implementation PHBottomBarMuteButton

- (PHBottomBarMuteButton)initWithConfiguration:(id)a3
{
  id v5;
  PHBottomBarMuteButton *v6;
  PHBottomBarMuteButton *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHBottomBarMuteButton;
  v6 = -[PHBottomBarButton initWithConfiguration:](&v9, "initWithConfiguration:", v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_muteButtonConfiguration, a3);
    -[PHBottomBarMuteButton updateButtonAnimated:](v7, "updateButtonAnimated:", 0);
  }

  return v7;
}

- (void)_performSetSelected:(BOOL)a3
{
  -[PHBottomBarMuteButton updateButtonAnimated:](self, "updateButtonAnimated:", 1);
}

- (void)_performSetHighlighted:(BOOL)a3
{
  -[PHBottomBarMuteButton updateButtonAnimated:](self, "updateButtonAnimated:", 1);
}

- (void)_performSetEnabled:(BOOL)a3
{
  -[PHBottomBarMuteButton updateButtonAnimated:](self, "updateButtonAnimated:", 1);
}

- (void)updateButtonAnimated:(BOOL)a3
{
  double v3;
  _QWORD v4[5];

  v3 = 0.170000002;
  if (!a3)
    v3 = 0.0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000648E4;
  v4[3] = &unk_100284898;
  v4[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v4, v3);
}

- (void)updateButtonColor
{
  uint64_t v3;
  unsigned int v4;
  void *v5;
  void *v6;
  id v7;

  if (-[PHBottomBarMuteButton isSelected](self, "isSelected"))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[PHBottomBarMuteButton muteButtonConfiguration](self, "muteButtonConfiguration"));
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectedColor"));
  }
  else
  {
    v4 = -[PHBottomBarMuteButton isHighlighted](self, "isHighlighted");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarMuteButton muteButtonConfiguration](self, "muteButtonConfiguration"));
    v7 = v5;
    if (v4)
      v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "highlightedColor"));
    else
      v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "backgroundColor"));
  }
  v6 = (void *)v3;
  -[PHBottomBarButton setBackgroundColor:](self, "setBackgroundColor:", v3);

}

- (void)updateIcon
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = -[PHBottomBarMuteButton isSelected](self, "isSelected");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarMuteButton muteButtonConfiguration](self, "muteButtonConfiguration"));
  v5 = v4;
  if ((v3 & 1) != 0)
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedIcon"));
  else
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "icon"));
  v7 = (id)v6;

  -[PHBottomBarMuteButton setImage:forStates:](self, "setImage:forStates:", v7, 0);
}

- (PHBottomBarButtonConfiguration)muteButtonConfiguration
{
  return self->_muteButtonConfiguration;
}

- (void)setMuteButtonConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_muteButtonConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_muteButtonConfiguration, 0);
}

@end
