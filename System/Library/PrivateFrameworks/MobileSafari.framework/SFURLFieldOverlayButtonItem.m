@implementation SFURLFieldOverlayButtonItem

- (UIAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (int64_t)theme
{
  return self->_theme;
}

- (void)setTheme:(int64_t)a3
{
  self->_theme = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
}

@end
