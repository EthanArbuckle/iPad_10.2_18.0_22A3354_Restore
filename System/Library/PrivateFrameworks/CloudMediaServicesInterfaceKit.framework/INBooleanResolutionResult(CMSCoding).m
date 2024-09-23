@implementation INBooleanResolutionResult(CMSCoding)

+ (id)instanceFromCMSCoded:()CMSCoding
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
      objc_msgSend(v5, "cmsOptionalBoolForKey:", CFSTR("resolvedValue"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (!v7)
      {
        v10 = 0;
        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x24BDD9C10], "successWithResolvedValue:", objc_msgSend(v7, "BOOLValue"));
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "cmsOptionalDictionaryForKey:", CFSTR("confirmationRequired"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v11;
      if (v11)
      {
        v12 = (void *)MEMORY[0x24BDD9C10];
        objc_msgSend(v11, "cmsOptionalBoolForKey:", CFSTR("valueToConfirm"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "confirmationRequiredWithValueToConfirm:", v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_10;
      }
      objc_msgSend(v4, "cmsOptionalDictionaryForKey:", CFSTR("unsupported"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(MEMORY[0x24BDD9C10], "unsupported");
        v9 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v4, "cmsOptionalDictionaryForKey:", CFSTR("needsValue"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(MEMORY[0x24BDD9C10], "needsValue");
          v9 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v4, "cmsOptionalDictionaryForKey:", CFSTR("notRequired"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v10)
            goto LABEL_10;
          objc_msgSend(MEMORY[0x24BDD9C10], "notRequired");
          v9 = objc_claimAutoreleasedReturnValue();
        }
      }
    }
    v10 = (void *)v9;
LABEL_10:

    goto LABEL_11;
  }
  v10 = 0;
LABEL_11:

  return v10;
}

@end
