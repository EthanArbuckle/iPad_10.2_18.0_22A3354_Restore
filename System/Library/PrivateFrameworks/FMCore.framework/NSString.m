@implementation NSString

uint64_t __42__NSString_FMCoreAdditions__fm_wifiToWLAN__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t result;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E82B1458);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fm_wifiToWLAN_stripWhitespaceWhitelist;
  fm_wifiToWLAN_stripWhitespaceWhitelist = v0;

  result = MGGetBoolAnswer();
  fm_wifiToWLAN___wapi = result;
  return result;
}

void __54__NSString_FMCoreAdditions__legacyAllowedCharacterSet__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v1, "removeCharactersInString:", CFSTR("!*'();:@&=+$,/?%#[]"));
  v2 = (void *)legacyAllowedCharacterSet_allowedCharSet;
  legacyAllowedCharacterSet_allowedCharSet = (uint64_t)v1;

}

@end
