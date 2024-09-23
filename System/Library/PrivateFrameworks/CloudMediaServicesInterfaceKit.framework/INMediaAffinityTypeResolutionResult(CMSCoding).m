@implementation INMediaAffinityTypeResolutionResult(CMSCoding)

+ (id)instanceFromCMSCoded:()CMSCoding
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  cmsSafeDictionary(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "cmsOptionalDictionaryForKey:", CFSTR("success"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "cmsOptionalStringForKey:", CFSTR("resolvedMediaAffinityType"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = INMediaAffinityTypeFromString(v7);

      objc_msgSend(MEMORY[0x24BDD9E30], "successWithResolvedMediaAffinityType:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

      goto LABEL_16;
    }
    objc_msgSend(v4, "cmsOptionalDictionaryForKey:", CFSTR("confirmationRequired"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "cmsOptionalStringForKey:", CFSTR("mediaAffinityTypeToConfirm"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = INMediaAffinityTypeFromString(v12);

      objc_msgSend(MEMORY[0x24BDD9E30], "confirmationRequiredWithMediaAffinityTypeToConfirm:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "cmsOptionalDictionaryForKey:", CFSTR("unsupported"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(MEMORY[0x24BDD9E30], "unsupported");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v4, "cmsOptionalDictionaryForKey:", CFSTR("needsValue"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(MEMORY[0x24BDD9E30], "needsValue");
          v14 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v4, "cmsOptionalDictionaryForKey:", CFSTR("notRequired"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v9)
          {
LABEL_14:

            goto LABEL_15;
          }
          objc_msgSend(MEMORY[0x24BDD9E30], "notRequired");
          v14 = objc_claimAutoreleasedReturnValue();
        }
      }
    }
    v9 = (void *)v14;
    goto LABEL_14;
  }
  v9 = 0;
LABEL_16:

  return v9;
}

@end
