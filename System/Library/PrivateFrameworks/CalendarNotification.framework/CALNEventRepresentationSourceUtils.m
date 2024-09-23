@implementation CALNEventRepresentationSourceUtils

+ (void)setEventRepresentationDictionary:(id)a3 onNotificationContent:(id)a4
{
  objc_msgSend(a4, "setUserInfoValue:forKey:", a3, *MEMORY[0x24BDC7600]);
}

@end
