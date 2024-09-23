@implementation PFCloudKitLogging

- (PFCloudKitLogging)init
{
  PFCloudKitLogging *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PFCloudKitLogging;
  v2 = -[PFCloudKitLogging init](&v7, sel_init);
  if (v2)
  {
    __ckLoggingOverride = 16;
    v3 = (void *)MEMORY[0x18D76B4E4]();
    v4 = +[_PFRoutines integerValueForOverride:]((uint64_t)_PFRoutines, (uint64_t)CFSTR("com.apple.CoreData.CloudKitDebug"));
    switch(v4)
    {
      case 1:
        v5 = 4;
        break;
      case 2:
        v5 = 3;
        break;
      case 3:
        v5 = 1;
        break;
      default:
        v5 = 16;
        break;
    }
    __ckLoggingOverride = v5;
    objc_autoreleasePoolPop(v3);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PFCloudKitLogging;
  -[PFCloudKitLogging dealloc](&v2, sel_dealloc);
}

+ (void)setCatastrophicLoggingLevel
{
  __ckLoggingOverride = 1;
}

@end
