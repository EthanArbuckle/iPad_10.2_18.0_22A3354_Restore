@implementation NSObject(UserNotifications)

- (uint64_t)un_safeBoolValue
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(a1, "BOOLValue");
  else
    return 0;
}

@end
