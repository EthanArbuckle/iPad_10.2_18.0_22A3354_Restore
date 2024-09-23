@implementation HKWorkoutLocationBundle

void __HKWorkoutLocationBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/LocationBundles/AppleWatchWorkout.bundle"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_226;
  _MergedGlobals_226 = v0;

}

@end
