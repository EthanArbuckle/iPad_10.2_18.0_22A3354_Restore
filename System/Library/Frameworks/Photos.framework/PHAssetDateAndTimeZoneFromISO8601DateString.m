@implementation PHAssetDateAndTimeZoneFromISO8601DateString

void __PHAssetDateAndTimeZoneFromISO8601DateString_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(-|\\+)(\\d\\d):(\\d\\d)$"), 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)PHAssetDateAndTimeZoneFromISO8601DateString_timeZoneSuffixWithColonsRegex;
  PHAssetDateAndTimeZoneFromISO8601DateString_timeZoneSuffixWithColonsRegex = v0;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(-|\\+)(\\d\\d)(\\d\\d)$"), 0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)PHAssetDateAndTimeZoneFromISO8601DateString_timeZoneSuffixRegex;
  PHAssetDateAndTimeZoneFromISO8601DateString_timeZoneSuffixRegex = v2;

}

@end
