@implementation WFHealthKitReadableWorkoutActivityTypes

void __WFHealthKitReadableWorkoutActivityTypes_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)WFHealthKitReadableWorkoutActivityTypes_readableTypes;
  WFHealthKitReadableWorkoutActivityTypes_readableTypes = (uint64_t)&unk_24F93C2D0;

  objc_msgSend((id)WFHealthKitReadableWorkoutActivityTypes_readableTypes, "sortedArrayUsingSelector:", sel_localizedStandardCompare_);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)WFHealthKitReadableWorkoutActivityTypes_readableTypes;
  WFHealthKitReadableWorkoutActivityTypes_readableTypes = v1;

}

@end
