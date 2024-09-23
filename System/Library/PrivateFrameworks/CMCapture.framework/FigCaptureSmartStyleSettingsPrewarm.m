@implementation FigCaptureSmartStyleSettingsPrewarm

dispatch_queue_t __FigCaptureSmartStyleSettingsPrewarm_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  result = dispatch_queue_create("com.apple.figcapture.smartstylesettings", v0);
  sFigCaptureSmartStyleQueue = (uint64_t)result;
  return result;
}

@end
