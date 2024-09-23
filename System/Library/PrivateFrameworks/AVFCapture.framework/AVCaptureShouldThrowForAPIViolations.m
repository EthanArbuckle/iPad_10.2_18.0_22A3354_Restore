@implementation AVCaptureShouldThrowForAPIViolations

uint64_t __AVCaptureShouldThrowForAPIViolations_block_invoke()
{
  uint64_t result;

  if (AVCaptureIsRunningInIOSAppOnMacEnvironment_onceToken != -1)
    dispatch_once(&AVCaptureIsRunningInIOSAppOnMacEnvironment_onceToken, &__block_literal_global_204);
  result = FigGetCFPreferenceNumberWithDefault();
  AVCaptureShouldThrowForAPIViolations_pardonAPIViolations = (_DWORD)result != 0;
  return result;
}

@end
