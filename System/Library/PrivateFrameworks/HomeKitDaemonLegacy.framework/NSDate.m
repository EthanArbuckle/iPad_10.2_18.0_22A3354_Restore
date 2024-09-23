@implementation NSDate

uint64_t __63__NSDate_HMDCameraUtilities__hmd_snapshotFileNameDateFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)hmd_snapshotFileNameDateFormatter_dateFormatter;
  hmd_snapshotFileNameDateFormatter_dateFormatter = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)hmd_snapshotFileNameDateFormatter_dateFormatter, "setLocale:", v2);

  return objc_msgSend((id)hmd_snapshotFileNameDateFormatter_dateFormatter, "setDateFormat:", CFSTR("yyyy_MM_dd_HH_mm_ss_SSS_ZZZ"));
}

@end
