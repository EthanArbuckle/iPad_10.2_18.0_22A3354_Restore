@implementation COTimerManager(Home)

+ (id)hf_TimerManagerForAccessory:()Home
{
  id v3;
  _HFTimerConnectionProvider *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(_HFTimerConnectionProvider);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D148E8]), "initForAccessory:withConnectionProvider:", v3, v4);

  return v5;
}

@end
