@implementation MRRemoteControl

+ (id)sharedRemoteControl
{
  if (sharedRemoteControl_onceToken != -1)
    dispatch_once(&sharedRemoteControl_onceToken, &__block_literal_global_43);
  return (id)sharedRemoteControl__sharedRemoteControl;
}

void __38__MRRemoteControl_sharedRemoteControl__block_invoke()
{
  MRRemoteControl *v0;
  void *v1;

  v0 = objc_alloc_init(MRRemoteControl);
  v1 = (void *)sharedRemoteControl__sharedRemoteControl;
  sharedRemoteControl__sharedRemoteControl = (uint64_t)v0;

}

@end
