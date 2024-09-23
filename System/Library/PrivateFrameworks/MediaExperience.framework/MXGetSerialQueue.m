@implementation MXGetSerialQueue

void __MXGetSerialQueue_block_invoke()
{
  NSObject *v0;

  if (!gSerialQueue)
  {
    v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    gSerialQueue = (uint64_t)dispatch_queue_create("com.apple.coremedia.mediaexperience.iAmNotACQ", v0);
    MXSimulateCrash((uint64_t)"AudioControlQueue (ACQ) is being used before being set by AudioToolbox! Please file a radar"
                             " against 'MediaExperience Framework | All'");
  }
}

@end
