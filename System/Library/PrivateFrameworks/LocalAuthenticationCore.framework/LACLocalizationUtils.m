@implementation LACLocalizationUtils

+ (BOOL)isLocalizationKey:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("__LAC_LOCALIZATION_KEY__"));
}

+ (id)encodeLocalizationKey:(id)a3
{
  return (id)objc_msgSend(a1, "encodeLocalizationKey:shouldUseDeviceVariant:", a3, 0);
}

+ (id)encodeLocalizationKey:(id)a3 shouldUseDeviceVariant:(BOOL)a4
{
  const __CFString *v4;

  v4 = &stru_2510C57B8;
  if (a4)
    v4 = CFSTR("__LAC_LOCALIZATION_DEVICE_VARIANT__");
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("__LAC_LOCALIZATION_KEY__"), v4, a3);
}

+ (id)decodeLocalizationKeyFromString:(id)a3 shouldUseDeviceVariant:(BOOL *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;

  v6 = a3;
  if (objc_msgSend(a1, "isLocalizationKey:", v6))
  {
    if (a4)
      *a4 = 0;
    objc_msgSend(v6, "substringFromIndex:", objc_msgSend(CFSTR("__LAC_LOCALIZATION_KEY__"), "length"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(a1, "_shouldUseDeviceVariantForKey:", v7) & 1) != 0)
    {
      if (a4)
        *a4 = 1;
      objc_msgSend(v7, "substringFromIndex:", objc_msgSend(CFSTR("__LAC_LOCALIZATION_DEVICE_VARIANT__"), "length"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v7;
    }
    v9 = v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)_shouldUseDeviceVariantForKey:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("__LAC_LOCALIZATION_DEVICE_VARIANT__"));
}

@end
