@implementation ANUtils

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1)
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_3);
  return isInternalBuild_isInternal;
}

uint64_t __26__ANUtils_isInternalBuild__block_invoke()
{
  uint64_t result;

  result = os_variant_allows_internal_security_policies();
  isInternalBuild_isInternal = result;
  return result;
}

+ (NSDateFormatter)an_dateFormatterForFilename
{
  if (an_dateFormatterForFilename_onceToken != -1)
    dispatch_once(&an_dateFormatterForFilename_onceToken, &__block_literal_global_2);
  return (NSDateFormatter *)(id)an_dateFormatterForFilename_dateFormatter;
}

uint64_t __38__ANUtils_an_dateFormatterForFilename__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)an_dateFormatterForFilename_dateFormatter;
  an_dateFormatterForFilename_dateFormatter = (uint64_t)v0;

  v2 = (void *)an_dateFormatterForFilename_dateFormatter;
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en-US"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  return objc_msgSend((id)an_dateFormatterForFilename_dateFormatter, "setDateFormat:", CFSTR("yyyy_MM_dd-HHmmss.SSS"));
}

+ (BOOL)isHomeAppInstalled
{
  __CFString *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  const __CFString *v9;
  __int16 v10;
  __CFString *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = CFSTR("com.apple.Home");
  v7 = 0;
  objc_msgSend(MEMORY[0x24BDC1540], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v2, 0, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (v4)
  {
    if (ANLogHandleUtils_once != -1)
      dispatch_once(&ANLogHandleUtils_once, &__block_literal_global_23);
    v5 = (id)ANLogHandleUtils_logger;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      v9 = &stru_24D370F00;
      v10 = 2112;
      v11 = v2;
      v12 = 2112;
      v13 = v3;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_2156FF000, v5, OS_LOG_TYPE_ERROR, "%@Failed to look up bundle record for bundleID (%@), Record: %@ Error: %@", buf, 0x2Au);
    }

  }
  return v3 != 0;
}

+ (double)machTimeToSeconds:(unint64_t)a3
{
  unint64_t v3;

  if (machTimeToSeconds__onceToken != -1)
    dispatch_once(&machTimeToSeconds__onceToken, &__block_literal_global_10);
  LODWORD(v3) = dword_254DE1584;
  return (double)(machTimeToSeconds___timeBaseInfo * a3) / ((double)v3 * 1000000000.0);
}

uint64_t __29__ANUtils_machTimeToSeconds___block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&machTimeToSeconds___timeBaseInfo);
}

+ (unint64_t)secondsToMachTime:(double)a3
{
  if (secondsToMachTime__onceToken != -1)
    dispatch_once(&secondsToMachTime__onceToken, &__block_literal_global_11);
  return (unint64_t)((float)*(unsigned int *)algn_254DE1594
                          * a3
                          * (float)(1000000000.0 / (float)secondsToMachTime___timeBaseInfo));
}

uint64_t __29__ANUtils_secondsToMachTime___block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&secondsToMachTime___timeBaseInfo);
}

@end
