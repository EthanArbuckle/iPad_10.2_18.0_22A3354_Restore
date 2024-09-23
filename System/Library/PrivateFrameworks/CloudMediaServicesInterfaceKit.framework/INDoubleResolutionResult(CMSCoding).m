@implementation INDoubleResolutionResult(CMSCoding)

+ (id)instanceFromCMSCoded:()CMSCoding
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;

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
        v11 = 0;
        goto LABEL_10;
      }
      v9 = (void *)MEMORY[0x24BDD9CE8];
      objc_msgSend(v7, "doubleValue");
      objc_msgSend(v9, "successWithResolvedValue:");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "cmsOptionalDictionaryForKey:", CFSTR("confirmationRequired"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v12;
      if (v12)
      {
        v13 = (void *)MEMORY[0x24BDD9CE8];
        objc_msgSend(v12, "cmsOptionalNumberForKey:", CFSTR("valueToConfirm"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "confirmationRequiredWithValueToConfirm:", v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_10;
      }
      objc_msgSend(v4, "cmsOptionalDictionaryForKey:", CFSTR("unsupported"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(MEMORY[0x24BDD9CE8], "unsupported");
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v4, "cmsOptionalDictionaryForKey:", CFSTR("needsValue"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(MEMORY[0x24BDD9CE8], "needsValue");
          v10 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v4, "cmsOptionalDictionaryForKey:", CFSTR("notRequired"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v11)
            goto LABEL_10;
          objc_msgSend(MEMORY[0x24BDD9CE8], "notRequired");
          v10 = objc_claimAutoreleasedReturnValue();
        }
      }
    }
    v11 = (void *)v10;
LABEL_10:

    goto LABEL_11;
  }
  v11 = 0;
LABEL_11:

  return v11;
}

@end
