@implementation NSDate(Goodies)

- (id)mf_replyPrefixForSender:()Goodies
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  __CFDateFormatter *v11;
  __CFString *StringWithDate;
  NSObject *v13;
  __CFDateFormatter *v14;
  __CFString *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint8_t v36[16];
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(CFSTR("ja_JP_TRADITIONAL"), "caseInsensitiveCompare:", v6);

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("ja"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;

      v5 = v10;
    }

  }
  v11 = CFDateFormatterCreate(0, (CFLocaleRef)v5, kCFDateFormatterMediumStyle, kCFDateFormatterNoStyle);
  if (v11)
  {
    StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate(0, v11, a1);
    CFRelease(v11);
  }
  else
  {
    MFLogGeneral();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4F90000, v13, OS_LOG_TYPE_DEFAULT, "#Warning failed to create date formatter", buf, 2u);
    }

    StringWithDate = 0;
  }
  v14 = CFDateFormatterCreate(0, (CFLocaleRef)v5, kCFDateFormatterNoStyle, kCFDateFormatterShortStyle);
  if (v14)
  {
    v15 = (__CFString *)CFDateFormatterCreateStringWithDate(0, v14, a1);
    CFRelease(v14);
  }
  else
  {
    MFLogGeneral();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v36 = 0;
      _os_log_impl(&dword_1A4F90000, v16, OS_LOG_TYPE_DEFAULT, "#Warning failed to create time formatter", v36, 2u);
    }

    v15 = 0;
  }
  v17 = v4;
  objc_msgSend(v17, "emailAddressValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "displayName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    v21 = v19;
  }
  else
  {
    objc_msgSend(v17, "stringValue");
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  v22 = v21;

  v23 = v17;
  objc_msgSend(v23, "emailAddressValue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "simpleAddress");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    v27 = v25;
  }
  else
  {
    objc_msgSend(v23, "stringValue");
    v27 = (id)objc_claimAutoreleasedReturnValue();
  }
  v28 = v27;

  v29 = v23;
  if (v22)
  {
    v29 = v23;
    if (v28)
    {
      v29 = v23;
      if ((objc_msgSend(v22, "isEqual:", v28) & 1) == 0)
      {
        v30 = (void *)MEMORY[0x1E0CB3940];
        MFLookupLocalizedString(CFSTR("REPLY_ATTRIBUTION_SENDER"), CFSTR("%@ <%@>"), CFSTR("Message"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringWithFormat:", v31, v22, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  v32 = 0;
  if (StringWithDate && v15)
  {
    v33 = (void *)MEMORY[0x1E0CB3940];
    MFLookupLocalizedString(CFSTR("REPLY_ATTRIBUTION"), CFSTR("On %@, at %@, %@ wrote:\n\n"), CFSTR("Delayed"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringWithFormat:", v34, StringWithDate, v15, v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v32;
}

@end
