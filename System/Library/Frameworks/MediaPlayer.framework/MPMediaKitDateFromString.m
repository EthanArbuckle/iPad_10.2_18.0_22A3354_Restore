@implementation MPMediaKitDateFromString

uint64_t ___MPMediaKitDateFromString_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v0 = objc_opt_new();
  v1 = (void *)_MPMediaKitDateFromString_mediaKitDateFormatter;
  _MPMediaKitDateFromString_mediaKitDateFormatter = v0;

  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MPMediaKitDateFromString_mediaKitDateFormatter, "setTimeZone:", v2);

  return objc_msgSend((id)_MPMediaKitDateFromString_mediaKitDateFormatter, "setFormatOptions:", 275);
}

@end
