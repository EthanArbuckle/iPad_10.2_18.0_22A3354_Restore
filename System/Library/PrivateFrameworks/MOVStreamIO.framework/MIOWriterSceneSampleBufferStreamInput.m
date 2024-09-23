@implementation MIOWriterSceneSampleBufferStreamInput

- (MIOWriterSceneSampleBufferStreamInput)init
{
  objc_class *v3;
  void *v4;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("❌ ERROR: Do not call -[%@ init]."), v4);

  return 0;
}

@end
