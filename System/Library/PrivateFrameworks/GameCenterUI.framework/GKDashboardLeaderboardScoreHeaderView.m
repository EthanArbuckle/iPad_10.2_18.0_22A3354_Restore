@implementation GKDashboardLeaderboardScoreHeaderView

+ (double)defaultHeight
{
  return 31.0;
}

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKDashboardLeaderboardScoreHeaderView;
  -[GKDashboardLeaderboardScoreHeaderView awakeFromNib](&v3, sel_awakeFromNib);
  -[GKDashboardLeaderboardScoreHeaderView setClipsToBounds:](self, "setClipsToBounds:", 0);
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTimeScope:(int64_t)a3
{
  -[GKTimeScopeButton setTimeScope:](self->_timeScopeButton, "setTimeScope:", a3);
}

- (int64_t)timeScope
{
  return -[GKTimeScopeButton timeScope](self->_timeScopeButton, "timeScope");
}

- (void)timeScopePressed:(id)a3
{
  SEL timeScopeAction;

  if (self->_timeScopeTarget)
  {
    timeScopeAction = self->_timeScopeAction;
    if (timeScopeAction)
      objc_msgSend(self->_timeScopeTarget, "_gkPerformSelector:withObject:", timeScopeAction, self->_timeScopeButton);
  }
}

- (id)timeScopeTarget
{
  return self->_timeScopeTarget;
}

- (void)setTimeScopeTarget:(id)a3
{
  self->_timeScopeTarget = a3;
}

- (SEL)timeScopeAction
{
  return self->_timeScopeAction;
}

- (void)setTimeScopeAction:(SEL)a3
{
  self->_timeScopeAction = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  self->_titleLabel = (UILabel *)a3;
}

- (GKTimeScopeButton)timeScopeButton
{
  return self->_timeScopeButton;
}

- (void)setTimeScopeButton:(id)a3
{
  self->_timeScopeButton = (GKTimeScopeButton *)a3;
}

@end
