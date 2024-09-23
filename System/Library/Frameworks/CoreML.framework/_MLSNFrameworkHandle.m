@implementation _MLSNFrameworkHandle

- (_MLSNFrameworkHandle)init
{
  _MLSNFrameworkHandle *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_MLSNFrameworkHandle;
  v2 = -[_MLSNFrameworkHandle init](&v4, sel_init);
  if (v2)
    dlopen("/System/Library/Frameworks/SoundAnalysis.framework/SoundAnalysis", 4);
  return v2;
}

+ (id)sharedHandle
{
  if (sharedHandle_onceToken != -1)
    dispatch_once(&sharedHandle_onceToken, &__block_literal_global_686);
  return (id)sharedHandle_singleton;
}

@end
