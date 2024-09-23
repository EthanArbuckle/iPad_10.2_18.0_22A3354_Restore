@implementation FigUserStackshotWithMessage

uint64_t __FigUserStackshotWithMessage_block_invoke()
{
  uint64_t result;

  result = FigGetCFPreferenceNumberWithDefault(CFSTR("take_stackshots"), CFSTR("com.apple.coremedia"), 1);
  FigUserStackshotWithMessage_stackshotsEnabled = result;
  return result;
}

@end
