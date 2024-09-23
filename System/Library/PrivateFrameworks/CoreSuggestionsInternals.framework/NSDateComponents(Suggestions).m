@implementation NSDateComponents(Suggestions)

+ (id)sg_dateComponentsFromISO8601String:()Suggestions
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  char *v7;
  char *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  tm v23;

  v3 = &stru_1E7DB83A8;
  if (a3)
    v3 = a3;
  v4 = v3;
  memset(&v23, 0, sizeof(v23));
  v5 = (void *)objc_opt_new();
  v6 = objc_retainAutorelease(v4);
  v7 = strptime_l((const char *)-[__CFString UTF8String](v6, "UTF8String"), "%FT%H:%M:%S", &v23, 0);
  if (v7)
  {
    v8 = v7;
    v9 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", &stru_1E7DB83A8) & 1) == 0)
    {
      if (objc_msgSend(v10, "characterAtIndex:", 0) == 90)
      {
        objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setTimeZone:", v11);
      }
      else
      {
        if (objc_msgSend(v10, "length") == 6)
        {
          objc_msgSend(v10, "substringToIndex:", 3);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "substringFromIndex:", 4);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringByAppendingString:", v13);
          v14 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v14;
        }
        if (objc_msgSend(v10, "length", *(_QWORD *)&v23.tm_sec) == 3)
        {
          objc_msgSend(v10, "stringByAppendingString:", CFSTR("00"));
          v15 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v15;
        }
        if (objc_msgSend(v10, "length") != 5)
          goto LABEL_16;
        objc_msgSend(v10, "substringToIndex:", 3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "integerValue");

        objc_msgSend(v10, "substringToIndex:", 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "substringFromIndex:", 3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringByAppendingString:", v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = objc_msgSend(v11, "integerValue");
        objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 60 * (v20 + 60 * v17));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setTimeZone:", v21);

      }
    }
LABEL_16:
    objc_msgSend(v5, "setHour:", v23.tm_hour, *(_QWORD *)&v23.tm_sec);
    objc_msgSend(v5, "setMinute:", v23.tm_min);
    objc_msgSend(v5, "setSecond:", v23.tm_sec);

    objc_autoreleasePoolPop(v9);
    goto LABEL_17;
  }
  memset(&v23, 0, sizeof(v23));
  if (strptime_l((const char *)-[__CFString UTF8String](objc_retainAutorelease(v6), "UTF8String"), "%F", &v23, 0))
  {
LABEL_17:
    objc_msgSend(v5, "setYear:", v23.tm_year + 1900);
    objc_msgSend(v5, "setMonth:", v23.tm_mon + 1);
    objc_msgSend(v5, "setDay:", v23.tm_mday);
    goto LABEL_18;
  }

  v5 = 0;
LABEL_18:

  return v5;
}

@end
