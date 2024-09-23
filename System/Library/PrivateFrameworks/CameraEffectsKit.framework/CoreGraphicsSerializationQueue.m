@implementation CoreGraphicsSerializationQueue

void __CoreGraphicsSerializationQueue_block_invoke()
{
  void *v0;
  int v1;
  id v2;
  dispatch_queue_t v3;
  void *v4;
  NSObject *attr;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("MiroDisableCGSerialization"));

  if (v1)
  {
    attr = MEMORY[0x24BDAC9C0];
    v2 = MEMORY[0x24BDAC9C0];
  }
  else
  {
    attr = 0;
  }
  v3 = dispatch_queue_create("com.apple.VEiOSCommon.CGSerialization", attr);
  v4 = (void *)CoreGraphicsSerializationQueue_sCGSerializationQueue;
  CoreGraphicsSerializationQueue_sCGSerializationQueue = (uint64_t)v3;

}

@end
