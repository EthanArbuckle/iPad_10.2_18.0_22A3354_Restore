@implementation NSDateFormatter

void __76__NSDateFormatter_RemoteManagementModel__rmmodel_sharedRFC3339DateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_opt_new();
  v1 = (void *)rmmodel_sharedRFC3339DateFormatter_rfcFormatter;
  rmmodel_sharedRFC3339DateFormatter_rfcFormatter = v0;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)rmmodel_sharedRFC3339DateFormatter_rfcFormatter, "setLocale:", v2);

  objc_msgSend((id)rmmodel_sharedRFC3339DateFormatter_rfcFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZZZZZ"));
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)rmmodel_sharedRFC3339DateFormatter_rfcFormatter, "setTimeZone:", v3);

}

@end
