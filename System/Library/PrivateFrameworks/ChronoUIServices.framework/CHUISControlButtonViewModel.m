@implementation CHUISControlButtonViewModel

- (CHUISControlButtonViewModel)initWithIconView:(id)a3
{
  id v5;
  CHUISControlButtonViewModel *v6;
  CHUISControlButtonViewModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHUISControlButtonViewModel;
  v6 = -[CHUISControlButtonViewModel init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_iconView, a3);

  return v7;
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (void)setIsAnimating:(BOOL)a3
{
  self->_isAnimating = a3;
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UIColor)tint
{
  return self->_tint;
}

- (void)setTint:(id)a3
{
  objc_storeStrong((id *)&self->_tint, a3);
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)actionHint
{
  return self->_actionHint;
}

- (void)setActionHint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isRedacted
{
  return self->_redacted;
}

- (void)setRedacted:(BOOL)a3
{
  self->_redacted = a3;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (BOOL)isLauncher
{
  return self->_launcher;
}

- (void)setLauncher:(BOOL)a3
{
  self->_launcher = a3;
}

- (BOOL)hasError
{
  return self->_hasError;
}

- (void)setHasError:(BOOL)a3
{
  self->_hasError = a3;
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (void)setAccessibilityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (CHUISControlIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_actionHint, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_tint, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

@end
