@implementation CNEnvironment(CNKeyboardStateMonitor)

- (uint64_t)keyboardStateMonitor
{
  return objc_msgSend(a1, "valueForKey:onCacheMiss:", CFSTR("keyboard-state-monitor"), &__block_literal_global_21);
}

@end
