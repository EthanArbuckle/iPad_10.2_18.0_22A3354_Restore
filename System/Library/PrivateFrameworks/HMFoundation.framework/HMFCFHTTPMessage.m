@implementation HMFCFHTTPMessage

void __34___HMFCFHTTPMessage_dateFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_57;
  _MergedGlobals_57 = (uint64_t)v0;

  objc_msgSend((id)_MergedGlobals_57, "setDateFormat:", CFSTR("EEE, d MMM yyyy HH:mm:ss z"));
  v2 = (void *)_MergedGlobals_57;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US"));
  objc_msgSend(v2, "setLocale:", v3);

  v4 = (void *)_MergedGlobals_57;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("GMT"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v5);

}

@end
