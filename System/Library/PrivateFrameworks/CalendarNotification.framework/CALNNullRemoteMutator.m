@implementation CALNNullRemoteMutator

+ (CALNNullRemoteMutator)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1)
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_12);
  return (CALNNullRemoteMutator *)(id)sharedInstance_sharedInstance_4;
}

void __39__CALNNullRemoteMutator_sharedInstance__block_invoke()
{
  CALNNullRemoteMutator *v0;
  void *v1;

  v0 = objc_alloc_init(CALNNullRemoteMutator);
  v1 = (void *)sharedInstance_sharedInstance_4;
  sharedInstance_sharedInstance_4 = (uint64_t)v0;

}

- (BOOL)deleteEvent:(id)a3 withSpan:(int64_t)a4
{
  return 0;
}

@end
