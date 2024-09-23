@implementation INIntentResolutionResult(CMSCoding)

+ (id)instanceFromCMSCoded:()CMSCoding
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  cmsSafeDictionary(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (instanceFromCMSCoded__onceToken != -1)
      dispatch_once(&instanceFromCMSCoded__onceToken, &__block_literal_global_382);
    objc_msgSend(v4, "cmsOptionalStringForKey:", CFSTR("class"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5
      && (v6 = (id)objc_msgSend((id)instanceFromCMSCoded__classmap, "objectForKey:", v5)) != 0)
    {
      objc_msgSend(v6, "instanceFromCMSCoded:", v3);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "cmsOptionalDictionaryForKey:", CFSTR("needsValue"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(MEMORY[0x24BDD9DD8], "needsValue");
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v4, "cmsOptionalDictionaryForKey:", CFSTR("notRequired"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(MEMORY[0x24BDD9DD8], "notRequired");
          v7 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v4, "cmsOptionalDictionaryForKey:", CFSTR("unsupported"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v9)
          {
LABEL_15:

            goto LABEL_16;
          }
          objc_msgSend(MEMORY[0x24BDD9DD8], "unsupported");
          v7 = objc_claimAutoreleasedReturnValue();
        }
      }
    }
    v9 = (void *)v7;
    goto LABEL_15;
  }
  v9 = 0;
LABEL_16:

  return v9;
}

- (void)cmsCoded
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "resolutionResultCode");
  if ((unint64_t)(v1 - 1) > 4)
    return &unk_24E1D8630;
  else
    return *(&off_24E1CCCD8 + v1 - 1);
}

@end
