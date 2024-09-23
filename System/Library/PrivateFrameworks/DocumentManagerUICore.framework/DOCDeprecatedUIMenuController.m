@implementation DOCDeprecatedUIMenuController

+ (NSString)willShowMenuNotification
{
  return (NSString *)(id)*MEMORY[0x24BDF7BB8];
}

+ (NSString)willHideMenuNotification
{
  return (NSString *)(id)*MEMORY[0x24BDF7BB0];
}

+ (DOCDeprecatedUIMenuControllerMethods)shared
{
  return (DOCDeprecatedUIMenuControllerMethods *)objc_msgSend(MEMORY[0x24BDF6BB0], "sharedMenuController");
}

@end
