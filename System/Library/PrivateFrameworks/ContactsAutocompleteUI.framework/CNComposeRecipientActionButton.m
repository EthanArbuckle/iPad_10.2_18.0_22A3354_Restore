@implementation CNComposeRecipientActionButton

- (BOOL)_supportsMacIdiom
{
  return 0;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (UIColor)buttonColor
{
  return (UIColor *)objc_getProperty(self, a2, 752, 1);
}

- (void)setButtonColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 752);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonColor, 0);
}

@end
