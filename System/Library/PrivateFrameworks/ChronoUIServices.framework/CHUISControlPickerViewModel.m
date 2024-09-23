@implementation CHUISControlPickerViewModel

- (CHUISControlPickerViewModel)initWithIconView:(id)a3
{
  id v5;
  CHUISControlPickerViewModel *v6;
  CHUISControlPickerViewModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHUISControlPickerViewModel;
  v6 = -[CHUISControlPickerViewModel init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_state = 0;
    objc_storeStrong((id *)&v6->_iconView, a3);
  }

  return v7;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
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

- (NSString)currentValue
{
  return self->_currentValue;
}

- (void)setCurrentValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UIColor)currentTint
{
  return self->_currentTint;
}

- (void)setCurrentTint:(id)a3
{
  objc_storeStrong((id *)&self->_currentTint, a3);
}

- (NSArray)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
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
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_currentTint, 0);
  objc_storeStrong((id *)&self->_currentValue, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
