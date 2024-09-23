@implementation NSCalendar(IntentsFoundation)

+ (id)if_currentCalendarWithLanguageCode:()IntentsFoundation
{
  id v3;
  void *v4;
  void *v5;
  const __CFAllocator *v6;
  void *v7;
  const __CFDictionary *ComponentsFromLocaleIdentifier;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    objc_msgSend(v4, "locale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ComponentsFromLocaleIdentifier = CFLocaleCreateComponentsFromLocaleIdentifier(v6, (CFLocaleIdentifier)objc_msgSend(v7, "localeIdentifier"));

    CFDictionaryGetValue(ComponentsFromLocaleIdentifier, CFSTR("numbers"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(ComponentsFromLocaleIdentifier);
    v10 = (void *)MEMORY[0x1E0C99DC8];
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@@numbers=%@"), v3, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localeWithLocaleIdentifier:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setLocale:", v12);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setLocale:", v11);
    }

  }
  return v5;
}

@end
