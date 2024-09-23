@implementation DNDState(Defaults)

+ (id)fallbackState
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc(MEMORY[0x1E0D1D748]);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v0, "initWithSuppressionState:activeModeAssertionMetadata:startDate:userVisibleTransitionDate:userVisibleTransitionLifetimeType:activeModeConfiguration:", 0, MEMORY[0x1E0C9AA60], v1, v2, 0, 0);

  return v3;
}

@end
