@implementation INMediaDestinationResolutionResult(CMSCoding)

+ (id)instanceFromCMSCoded:()CMSCoding
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  cmsSafeDictionary(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "cmsOptionalDictionaryForKey:", CFSTR("success"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "cmsOptionalDecodedClass:forKey:", objc_opt_class(), CFSTR("resolvedMediaDestination"));
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (void *)v6;
        objc_msgSend(MEMORY[0x24BDD9E48], "successWithResolvedMediaDestination:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

        goto LABEL_21;
      }
    }
    objc_msgSend(v4, "cmsOptionalDictionaryForKey:", CFSTR("disambiguation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v4, "cmsOptionalArrayOfClass:forKey:", objc_opt_class(), CFSTR("mediaDestinationsToDisambiguate"));
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        objc_msgSend(MEMORY[0x24BDD9E48], "disambiguationWithMediaDestinationsToDisambiguate:", v9);
        v11 = objc_claimAutoreleasedReturnValue();
LABEL_18:
        v8 = (void *)v11;
        goto LABEL_19;
      }
    }
    objc_msgSend(v4, "cmsOptionalDictionaryForKey:", CFSTR("confirmationRequired"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10
      && (objc_msgSend(v4, "cmsOptionalDecodedClass:forKey:", objc_opt_class(), CFSTR("mediaDestinationToConfirm")),
          (v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v13 = (void *)v12;
      objc_msgSend(MEMORY[0x24BDD9E48], "confirmationRequiredWithMediaDestinationToConfirm:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v4, "cmsOptionalDictionaryForKey:", CFSTR("unsupported"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(MEMORY[0x24BDD9E48], "unsupported");
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
      objc_msgSend(v4, "cmsOptionalDictionaryForKey:", CFSTR("needsValue"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(MEMORY[0x24BDD9E48], "needsValue");
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
      objc_msgSend(v4, "cmsOptionalDictionaryForKey:", CFSTR("notRequired"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(MEMORY[0x24BDD9E48], "notRequired");
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
    }
LABEL_19:

    goto LABEL_20;
  }
  v8 = 0;
LABEL_21:

  return v8;
}

@end
