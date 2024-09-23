@implementation NSLocale(ATXExtras)

+ (uint64_t)atx_usesTwelveHourClock
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "atx_usesTwelveHourClockWithLocaleIdentifier:", v3);

  return v4;
}

+ (BOOL)atx_usesTwelveHourClockWithLocaleIdentifier:()ATXExtras
{
  void *v0;
  id v1;
  void *v2;
  unint64_t v3;
  uint64_t v4;
  char v5;
  int v6;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v1, "setLocale:", v0);
  objc_msgSend(v1, "setDateStyle:", 0);
  objc_msgSend(v1, "setTimeStyle:", 1);
  objc_msgSend(v1, "dateFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = objc_msgSend(v2, "characterAtIndex:", v3);
      if (v6 == 104 || v6 == 75)
      {
        v4 += (v5 & 1) == 0;
      }
      else if (v6 == 39)
      {
        v5 ^= 1u;
      }
      ++v3;
    }
    while (v3 < objc_msgSend(v2, "length"));
  }
  else
  {
    v4 = 0;
  }

  return v4 != 0;
}

@end
