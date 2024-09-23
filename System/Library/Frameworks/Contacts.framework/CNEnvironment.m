@implementation CNEnvironment

CNKeyboardStateMonitor *__61__CNEnvironment_CNKeyboardStateMonitor__keyboardStateMonitor__block_invoke()
{
  return +[CNKeyboardStateMonitor sharedMonitor](CNKeyboardStateMonitor, "sharedMonitor");
}

CNNicknameProvider *__43__CNEnvironment_Contacts__nicknameProvider__block_invoke()
{
  return +[CNNicknameProvider defaultProvider](CNNicknameProvider, "defaultProvider");
}

@end
