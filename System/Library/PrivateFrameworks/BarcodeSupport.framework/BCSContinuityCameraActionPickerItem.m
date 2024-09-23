@implementation BCSContinuityCameraActionPickerItem

- (id)icon
{
  return (id)objc_msgSend(getUIImageClass(), "_systemImageNamed:", CFSTR("appletv.fill"));
}

@end
