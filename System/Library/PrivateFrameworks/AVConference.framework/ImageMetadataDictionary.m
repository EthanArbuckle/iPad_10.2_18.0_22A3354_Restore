@implementation ImageMetadataDictionary

void __ImageMetadataDictionary_block_invoke()
{
  void *v0;
  id v1;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v1 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D48]), "initWithCalendarIdentifier:", CFSTR("en_US_POSIX"));
  ImageMetadataDictionary_sMarketingNameString = MGCopyAnswer();
  ImageMetadataDictionary_sProductVersion = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "operatingSystemVersionString");
  ImageMetadataDictionary_sDateTimeFormatter = (uint64_t)objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend((id)ImageMetadataDictionary_sDateTimeFormatter, "setTimeStyle:", 0);
  objc_msgSend((id)ImageMetadataDictionary_sDateTimeFormatter, "setDateStyle:", 0);
  objc_msgSend((id)ImageMetadataDictionary_sDateTimeFormatter, "setDateFormat:", CFSTR("yyyy:MM:dd HH:mm:ss"));
  objc_msgSend((id)ImageMetadataDictionary_sDateTimeFormatter, "setLocale:", v0);
  objc_msgSend((id)ImageMetadataDictionary_sDateTimeFormatter, "setCalendar:", v1);
  ImageMetadataDictionary_sSubsecTimeFormatter = (uint64_t)objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend((id)ImageMetadataDictionary_sSubsecTimeFormatter, "setTimeStyle:", 0);
  objc_msgSend((id)ImageMetadataDictionary_sSubsecTimeFormatter, "setDateStyle:", 0);
  objc_msgSend((id)ImageMetadataDictionary_sSubsecTimeFormatter, "setDateFormat:", CFSTR("SSS"));
  objc_msgSend((id)ImageMetadataDictionary_sSubsecTimeFormatter, "setLocale:", v0);
  objc_msgSend((id)ImageMetadataDictionary_sSubsecTimeFormatter, "setCalendar:", v1);

}

@end
