@implementation NSDate(Goodies)

- (uint64_t)mf_descriptionForMimeHeaders
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v2, "setDateFormat:", CFSTR("EEE, d MMM yyyy HH:mm:ss ZZ"));
  objc_msgSend(v2, "setLocale:", objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX")));
  return objc_msgSend(v2, "stringFromDate:", a1);
}

- (uint64_t)mf_replyPrefixForSender:()Goodies
{
  CFLocaleRef v5;
  CFLocaleRef v6;
  const __CFLocale *v7;
  __CFDateFormatter *v8;
  __CFDateFormatter *v9;
  __CFString *StringWithDate;
  NSObject *v11;
  __CFDateFormatter *v12;
  __CFDateFormatter *v13;
  __CFString *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t v21[16];
  uint8_t buf[16];

  v5 = CFLocaleCopyCurrent();
  if (!objc_msgSend(CFSTR("ja_JP_TRADITIONAL"), "caseInsensitiveCompare:", MEMORY[0x1CAA350F4]()))
  {
    v6 = CFLocaleCreate(0, CFSTR("ja"));
    if (v6)
    {
      v7 = v6;

      v5 = v7;
    }
  }
  v8 = CFDateFormatterCreate(0, v5, kCFDateFormatterMediumStyle, kCFDateFormatterNoStyle);
  if (v8)
  {
    v9 = v8;
    StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate(0, v8, a1);
    CFRelease(v9);
  }
  else
  {
    v11 = MFLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C8839000, v11, OS_LOG_TYPE_DEFAULT, "#Warning failed to create date formatter", buf, 2u);
    }
    StringWithDate = 0;
  }
  v12 = CFDateFormatterCreate(0, v5, kCFDateFormatterNoStyle, kCFDateFormatterShortStyle);
  if (v12)
  {
    v13 = v12;
    v14 = (__CFString *)CFDateFormatterCreateStringWithDate(0, v12, a1);
    CFRelease(v13);
  }
  else
  {
    v15 = MFLogGeneral();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1C8839000, v15, OS_LOG_TYPE_DEFAULT, "#Warning failed to create time formatter", v21, 2u);
    }
    v14 = 0;
  }
  v16 = (void *)objc_msgSend(a3, "mf_addressComment");
  v17 = objc_msgSend(a3, "mf_uncommentedAddress");
  if (v16)
  {
    v18 = v17;
    if (v17)
    {
      if ((objc_msgSend(v16, "isEqual:", v17) & 1) == 0)
        a3 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("REPLY_ATTRIBUTION_SENDER"), (uint64_t)CFSTR("%@ <%@>"), 0), v16, v18);
    }
  }
  v19 = 0;
  if (StringWithDate && v14)
    v19 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("REPLY_ATTRIBUTION"), (uint64_t)CFSTR("On %@, at %@, %@ wrote:\n\n"), CFSTR("Delayed")), StringWithDate, v14, a3);

  return v19;
}

@end
