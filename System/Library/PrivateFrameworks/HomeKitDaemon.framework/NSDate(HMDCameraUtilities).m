@implementation NSDate(HMDCameraUtilities)

- (id)hmd_snapshotFileName
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "hmd_snapshotFileNameDateFormatter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)hmd_snapshotFileNameDateFormatter
{
  if (hmd_snapshotFileNameDateFormatter_onceToken != -1)
    dispatch_once(&hmd_snapshotFileNameDateFormatter_onceToken, &__block_literal_global_45194);
  return (id)hmd_snapshotFileNameDateFormatter_dateFormatter;
}

+ (id)hmd_dateFromSnapshotFileName:()HMDCameraUtilities
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "hmd_snapshotFileNameDateFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
