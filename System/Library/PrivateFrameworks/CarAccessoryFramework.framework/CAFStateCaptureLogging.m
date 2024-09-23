@implementation CAFStateCaptureLogging

void __CAFStateCaptureLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.caraccessoryframework", "StateCapture");
  v1 = (void *)CAFStateCaptureLogging_facility;
  CAFStateCaptureLogging_facility = (uint64_t)v0;

}

@end
