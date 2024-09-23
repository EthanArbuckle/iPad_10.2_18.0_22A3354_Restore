@implementation AFUIAutoFillPopoverControllerOSLogFacility

void __AFUIAutoFillPopoverControllerOSLogFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AutoFillUI", "AFUIAutoFillPopoverController");
  v1 = (void *)AFUIAutoFillPopoverControllerOSLogFacility_logFacility;
  AFUIAutoFillPopoverControllerOSLogFacility_logFacility = (uint64_t)v0;

}

@end
