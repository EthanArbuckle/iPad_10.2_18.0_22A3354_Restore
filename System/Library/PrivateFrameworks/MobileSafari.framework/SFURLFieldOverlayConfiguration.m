@implementation SFURLFieldOverlayConfiguration

- (SFURLFieldOverlayConfiguration)initWithIdentifier:(id)a3
{
  id v4;
  SFURLFieldOverlayConfiguration *v5;
  SFURLFieldOverlayConfiguration *v6;
  NSArray *buttonItems;
  uint64_t v8;
  NSString *identifier;
  SFURLFieldOverlayConfiguration *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFURLFieldOverlayConfiguration;
  v5 = -[SFURLFieldOverlayConfiguration init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    buttonItems = v5->_buttonItems;
    v5->_buttonItems = (NSArray *)MEMORY[0x1E0C9AA60];

    v8 = objc_msgSend(v4, "copy");
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v8;

    v10 = v6;
  }

  return v6;
}

- (NSArray)buttonItems
{
  return self->_buttonItems;
}

- (void)setButtonItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)placeFirstButtonInLeadingEdge
{
  return self->_placeFirstButtonInLeadingEdge;
}

- (void)setPlaceFirstButtonInLeadingEdge:(BOOL)a3
{
  self->_placeFirstButtonInLeadingEdge = a3;
}

- (BOOL)prefersSecondaryText
{
  return self->_prefersSecondaryText;
}

- (void)setPrefersSecondaryText:(BOOL)a3
{
  self->_prefersSecondaryText = a3;
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (void)setPrimaryTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_primaryTextColor, a3);
}

- (UIColor)prominentButtonBackgroundColor
{
  return self->_prominentButtonBackgroundColor;
}

- (void)setProminentButtonBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_prominentButtonBackgroundColor, a3);
}

- (UIColor)prominentButtonTextColor
{
  return self->_prominentButtonTextColor;
}

- (void)setProminentButtonTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_prominentButtonTextColor, a3);
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (void)setSecondaryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (UIColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (void)setSecondaryTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTextColor, a3);
}

- (BOOL)shouldTextShrinkToFit
{
  return self->_shouldTextShrinkToFit;
}

- (void)setShouldTextShrinkToFit:(BOOL)a3
{
  self->_shouldTextShrinkToFit = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (UIColor)themeColor
{
  return self->_themeColor;
}

- (void)setThemeColor:(id)a3
{
  objc_storeStrong((id *)&self->_themeColor, a3);
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_themeColor, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_prominentButtonTextColor, 0);
  objc_storeStrong((id *)&self->_prominentButtonBackgroundColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_buttonItems, 0);
}

@end
