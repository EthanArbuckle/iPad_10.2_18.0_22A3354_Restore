@implementation AVTAvatarActionButton

+ (id)buttonWithAction:(id)a3
{
  return +[AVTAvatarActionButton buttonWithType:primaryAction:](AVTAvatarActionButton, "buttonWithType:primaryAction:", 0, a3);
}

+ (id)defaultButtonWithAction:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[AVTAvatarActionButton buttonWithAction:](AVTAvatarActionButton, "buttonWithAction:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTUIFontRepository avatarActionButtonTitleFont](AVTUIFontRepository, "avatarActionButtonTitleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  return v3;
}

+ (id)destructiveButtonWithAction:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[AVTAvatarActionButton buttonWithAction:](AVTAvatarActionButton, "buttonWithAction:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTUIFontRepository avatarActionButtonTitleFont](AVTUIFontRepository, "avatarActionButtonTitleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  objc_msgSend(v3, "setIsDestructive:", 1);
  return v3;
}

- (AVTAvatarActionButton)initWithFrame:(CGRect)a3
{
  AVTAvatarActionButton *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVTAvatarActionButton;
  v3 = -[AVTAvatarActionButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[AVTUIColorRepository actionButtonBackgroundColor](AVTUIColorRepository, "actionButtonBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarActionButton setBackgroundColor:](v3, "setBackgroundColor:", v4);

    +[AVTUIColorRepository actionButtonTextColor](AVTUIColorRepository, "actionButtonTextColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarActionButton setTitleColor:forState:](v3, "setTitleColor:forState:", v5, 0);

    -[AVTAvatarActionButton _setContinuousCornerRadius:](v3, "_setContinuousCornerRadius:", 8.0);
  }
  return v3;
}

- (void)setIsDestructive:(BOOL)a3
{
  id v4;

  if (self->_isDestructive != a3)
  {
    self->_isDestructive = a3;
    if (a3)
      +[AVTUIColorRepository actionButtonDestructiveTextColor](AVTUIColorRepository, "actionButtonDestructiveTextColor");
    else
      +[AVTUIColorRepository actionButtonTextColor](AVTUIColorRepository, "actionButtonTextColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarActionButton setTitleColor:forState:](self, "setTitleColor:forState:", v4, 0);

  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AVTAvatarActionButton;
  -[AVTAvatarActionButton setHighlighted:](&v7, sel_setHighlighted_);
  if (v3)
    v5 = 0.2;
  else
    v5 = 1.0;
  -[AVTAvatarActionButton titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v5);

}

- (BOOL)isDestructive
{
  return self->_isDestructive;
}

@end
