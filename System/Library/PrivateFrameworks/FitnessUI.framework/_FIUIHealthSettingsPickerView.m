@implementation _FIUIHealthSettingsPickerView

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_FIUIHealthSettingsPickerView;
  -[_FIUIHealthSettingsPickerView layoutSubviews](&v3, sel_layoutSubviews);
  _changeSeparatorLineColors(self);
}

@end
