@implementation BCSWiFiConfigurationActionPickerItem

- (UIImage)icon
{
  UIImage *icon;

  icon = self->_icon;
  if (icon)
    return icon;
  objc_msgSend(getUIImageClass(), "systemImageNamed:", CFSTR("wifi"));
  return (UIImage *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
}

@end
