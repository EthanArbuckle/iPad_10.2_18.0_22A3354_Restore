@implementation CUIKOverlayCalendar

+ (id)overlayCalendarForCalendarIdentifier:(id)a3 timezone:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (v5 && objc_msgSend(v5, "length"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D48]), "initWithCalendarIdentifier:", v5);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0D3EFB0], "localeForCalendarID:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setLocale:", v8);

      objc_msgSend(v7, "setTimeZone:", v6);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)overlayCalendarPrefChanged
{
  ++s_overlayCalendarGeneration;
}

+ (id)overlayCalendarID
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D0C2C8], "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", *MEMORY[0x1E0D0BF38]);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (!objc_msgSend(MEMORY[0x1E0D3EFB0], "isLunarCalendarDefaultOn"))
      goto LABEL_4;
    v4 = (void *)MEMORY[0x1E0D3EFB0];
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredLunarCalendarForLocaleID:", v6);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v3)
LABEL_4:
      v3 = &stru_1E6EBAE30;
  }
  return v3;
}

+ (id)overlayCalendar
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (overlayCalendar_onceToken != -1)
    dispatch_once(&overlayCalendar_onceToken, &__block_literal_global_29);
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.mobilecal.overlayCalendarGeneration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "unsignedIntegerValue");
    v7 = s_overlayCalendarGeneration;
    if (v6 >= s_overlayCalendarGeneration)
      goto LABEL_11;
  }
  else
  {
    v7 = s_overlayCalendarGeneration;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("com.apple.mobilecal.overlayCalendarGeneration"));

  objc_msgSend((id)objc_opt_class(), "overlayCalendarID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D0C270], "activeTimeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CUIKOverlayCalendar overlayCalendarForCalendarIdentifier:timezone:](CUIKOverlayCalendar, "overlayCalendarForCalendarIdentifier:timezone:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("com.apple.mobilecal.overlayCalendar"));
  else
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("com.apple.mobilecal.overlayCalendar"));

LABEL_11:
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.mobilecal.overlayCalendar"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __38__CUIKOverlayCalendar_overlayCalendar__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v0 = *MEMORY[0x1E0C99720];
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", v0, 0, v1, &__block_literal_global_11_0);

  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", CFSTR("com.apple.calendar.TimeZoneChanged"), 0, v3, &__block_literal_global_11_0);

  v5 = *MEMORY[0x1E0D0BF40];
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", v5, 0, v6, &__block_literal_global_11_0);

}

void __38__CUIKOverlayCalendar_overlayCalendar__block_invoke_2()
{
  ++s_overlayCalendarGeneration;
}

@end
