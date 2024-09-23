@implementation AXDeviceSupportsLiveCaptionsInFaceTime

uint64_t __AXDeviceSupportsLiveCaptionsInFaceTime_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "primaryLanguage");
}

@end
