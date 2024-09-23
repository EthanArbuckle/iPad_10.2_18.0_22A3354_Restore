@implementation SOSCCGetStatusObject

void __SOSCCGetStatusObject_block_invoke()
{
  SecSOSStatus *v0;
  void *v1;

  v0 = objc_alloc_init(SecSOSStatus);
  v1 = (void *)SOSCCGetStatusObject_control;
  SOSCCGetStatusObject_control = (uint64_t)v0;

}

@end
