@implementation AVSecondScreenDebugHUDEnabled

void __AVSecondScreenDebugHUDEnabled_block_invoke()
{
  char v0;

  if (AVSecondScreenExperimentsAllowed_onceToken != -1)
    dispatch_once(&AVSecondScreenExperimentsAllowed_onceToken, &__block_literal_global_117);
  v0 = AVSecondScreenExperimentsAllowed_AVSecondScreenExperimentsAllowed;
  if (AVSecondScreenExperimentsAllowed_AVSecondScreenExperimentsAllowed)
    v0 = CFPreferencesGetAppBooleanValue(CFSTR("enableSecondScreenHUD"), CFSTR("com.apple.avkit"), 0) != 0;
  AVSecondScreenDebugHUDEnabled__Enabled = v0;
}

@end
