@implementation NSDate(MFDateUtils_Private)

+ (id)mf_copyLenientDateInCommonFormatsWithString:()MFDateUtils_Private
{
  __CFString *v3;
  uint64_t v4;
  CFIndex v5;
  CFIndex v6;
  CFIndex v7;
  __CFString *MutableCopy;
  id v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  id v14;
  void *v15;
  char **v16;
  uint64_t v17;
  NSObject *v19;
  id v20;
  int v22;
  __CFString *v23;
  uint64_t v24;
  CFRange v25;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = -[__CFString length](v3, "length");
  if (v4)
  {
    v6 = -[__CFString rangeOfString:options:](v3, "rangeOfString:options:", CFSTR("UT"), 12);
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = v5;
      MutableCopy = CFStringCreateMutableCopy(0, v4 + 1, v3);
      v25.location = v6;
      v25.length = v7;
      CFStringReplace(MutableCopy, v25, CFSTR("UTC"));

      v3 = MutableCopy;
    }
    v9 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "ef_posixLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLocale:", v10);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDefaultDate:", v11);

    v12 = &commonFormats;
    while (1)
    {
      objc_msgSend(v9, "setDateFormat:", *v12);
      objc_msgSend(v9, "dateFromString:", v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        break;
      ++v12;

      if (v12 >= (_QWORD *)&otherFormats)
      {
        v14 = objc_alloc_init(MEMORY[0x1E0CB3578]);
        objc_msgSend(v14, "setFormatterBehavior:", 1040);
        objc_msgSend(v14, "setLenient:", 1);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setDefaultDate:", v15);

        objc_msgSend(v14, "dateFromString:", v3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          v16 = (char **)&off_1E5AA15C0;
          do
          {
            objc_msgSend(v9, "setDateFormat:", *(v16 - 1));
            objc_msgSend(v9, "dateFromString:", v3);
            v17 = objc_claimAutoreleasedReturnValue();
            v13 = (void *)v17;
            if (v17)
              break;
          }
          while (v16++ < kDayStrs);
          if (!v17)
          {
            MFLogGeneral();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              v22 = 138412290;
              v23 = v3;
              _os_log_impl(&dword_1ABB13000, v19, OS_LOG_TYPE_INFO, "Unable to parse date (%@)", (uint8_t *)&v22, 0xCu);
            }

            v13 = 0;
          }
        }
        break;
      }
    }
    v20 = v13;

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

@end
