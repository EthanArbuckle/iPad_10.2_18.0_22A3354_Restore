@implementation NSUUID(BMUtilities)

+ (id)bm_bootSessionUUID
{
  if (bm_bootSessionUUID_onceToken != -1)
    dispatch_once(&bm_bootSessionUUID_onceToken, &__block_literal_global_9);
  return (id)bm_bootSessionUUID__bootSessionUUID;
}

@end
