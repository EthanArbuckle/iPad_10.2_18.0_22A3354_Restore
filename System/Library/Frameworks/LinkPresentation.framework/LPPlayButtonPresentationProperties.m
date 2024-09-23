@implementation LPPlayButtonPresentationProperties

- (UIColor)accentColor
{
  return self->_accentColor;
}

- (void)setAccentColor:(id)a3
{
  objc_storeStrong((id *)&self->_accentColor, a3);
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accentColor, 0);
}

@end
