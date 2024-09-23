@implementation SOSCCCredentialQueue

void __SOSCCCredentialQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.SOSCredentialsQueue", 0);
  v1 = (void *)SOSCCCredentialQueue_credQueue;
  SOSCCCredentialQueue_credQueue = (uint64_t)v0;

}

@end
