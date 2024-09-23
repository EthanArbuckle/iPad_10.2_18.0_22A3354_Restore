@implementation FIUIUserHasExistingPreKincaidMoveGoal

BOOL __FIUIUserHasExistingPreKincaidMoveGoal_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "sourceRevision");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "operatingSystemVersion");
  v4 = HKNSOperatingSystemVersionCompare() == -1;

  return v4;
}

@end
