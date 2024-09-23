@implementation SpringFactory

+ (id)sharedFactory
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__SpringFactory_sharedFactory__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedFactory_onceToken != -1)
    dispatch_once(&sharedFactory_onceToken, block);
  return (id)sharedFactory___sharedFactory;
}

void __30__SpringFactory_sharedFactory__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedFactory___sharedFactory;
  sharedFactory___sharedFactory = (uint64_t)v1;

}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  return _createSpringOfBasicAnimationDependingOnDebugState(a4, 0);
}

- (id)_timingFunctionForAnimation
{
  double v2;
  double v3;
  double v4;
  double v5;

  return _createTimingFunction(0, v2, v3, v4, v5);
}

@end
