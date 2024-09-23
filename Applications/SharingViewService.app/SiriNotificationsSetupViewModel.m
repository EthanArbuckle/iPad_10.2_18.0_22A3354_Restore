@implementation SiriNotificationsSetupViewModel

- (UIImage)contentImage
{
  return self->_contentImage;
}

- (void)setContentImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)dismissActionStyle
{
  return self->_dismissActionStyle;
}

- (void)setDismissActionStyle:(int64_t)a3
{
  self->_dismissActionStyle = a3;
}

- (NSString)dismissActionTitle
{
  return self->_dismissActionTitle;
}

- (void)setDismissActionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)primaryActionStyle
{
  return self->_primaryActionStyle;
}

- (void)setPrimaryActionStyle:(int64_t)a3
{
  self->_primaryActionStyle = a3;
}

- (NSString)primaryActionTitle
{
  return self->_primaryActionTitle;
}

- (void)setPrimaryActionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)primaryActionUsesLegacyStyling
{
  return self->_primaryActionUsesLegacyStyling;
}

- (void)setPrimaryActionUsesLegacyStyling:(BOOL)a3
{
  self->_primaryActionUsesLegacyStyling = a3;
}

- (BOOL)secondaryActionAvailable
{
  return self->_secondaryActionAvailable;
}

- (void)setSecondaryActionAvailable:(BOOL)a3
{
  self->_secondaryActionAvailable = a3;
}

- (int64_t)secondaryActionStyle
{
  return self->_secondaryActionStyle;
}

- (void)setSecondaryActionStyle:(int64_t)a3
{
  self->_secondaryActionStyle = a3;
}

- (NSString)secondaryActionTitle
{
  return self->_secondaryActionTitle;
}

- (void)setSecondaryActionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)secondaryActionUsesLegacyStyling
{
  return self->_secondaryActionUsesLegacyStyling;
}

- (void)setSecondaryActionUsesLegacyStyling:(BOOL)a3
{
  self->_secondaryActionUsesLegacyStyling = a3;
}

- (UIFont)subtitleFont
{
  return self->_subtitleFont;
}

- (void)setSubtitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleFont, a3);
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (void)setSubtitleText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
  objc_storeStrong((id *)&self->_titleColor, a3);
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_titleFont, a3);
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_subtitleFont, 0);
  objc_storeStrong((id *)&self->_secondaryActionTitle, 0);
  objc_storeStrong((id *)&self->_primaryActionTitle, 0);
  objc_storeStrong((id *)&self->_dismissActionTitle, 0);
  objc_storeStrong((id *)&self->_contentImage, 0);
}

@end
