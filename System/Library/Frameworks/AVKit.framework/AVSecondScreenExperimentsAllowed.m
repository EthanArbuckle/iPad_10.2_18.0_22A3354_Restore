@implementation AVSecondScreenExperimentsAllowed

uint64_t __AVSecondScreenExperimentsAllowed_block_invoke()
{
  uint64_t result;

  if (AVSecondScreenTVSupportEnabled_onceToken != -1)
    dispatch_once(&AVSecondScreenTVSupportEnabled_onceToken, &__block_literal_global_100);
  if (AVSecondScreenTVSupportEnabled_AVSecondScreenTVSupportEnabled)
    result = MGGetBoolAnswer();
  else
    result = 0;
  AVSecondScreenExperimentsAllowed_AVSecondScreenExperimentsAllowed = result;
  return result;
}

@end
