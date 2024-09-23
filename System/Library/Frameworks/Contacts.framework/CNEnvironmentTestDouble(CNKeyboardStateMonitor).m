@implementation CNEnvironmentTestDouble(CNKeyboardStateMonitor)

- (uint64_t)setKeyboardStateMonitor:()CNKeyboardStateMonitor
{
  return objc_msgSend(a1, "setValue:forKey:", a3, CFSTR("keyboard-state-monitor"));
}

@end
