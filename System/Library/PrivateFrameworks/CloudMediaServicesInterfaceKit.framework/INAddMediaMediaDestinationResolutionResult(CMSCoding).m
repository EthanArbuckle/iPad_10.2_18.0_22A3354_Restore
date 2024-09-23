@implementation INAddMediaMediaDestinationResolutionResult(CMSCoding)

+ (id)instanceFromCMSCoded:()CMSCoding
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  cmsSafeDictionary(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("success"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v15.receiver = a1;
      v15.super_class = (Class)&off_2553BA390;
      objc_msgSendSuper2(&v15, sel_instanceFromCMSCoded_, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        v9 = 0;
        goto LABEL_15;
      }
      v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD9B98]), "initWithMediaDestinationResolutionResult:", v7);
    }
    else
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("unsupported"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v10;
      if (v10)
      {
        objc_msgSend(v10, "objectForKey:", CFSTR("reason"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
          objc_msgSend(MEMORY[0x24BDD9B98], "unsupportedForReason:", INAddMediaMediaDestinationUnsupportedReasonFromString(v11));
        else
          objc_msgSend(MEMORY[0x24BDD9B98], "unsupported");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_15;
      }
      objc_msgSend(v5, "cmsOptionalDictionaryForKey:", CFSTR("needsValue"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDD9B98], "needsValue");
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v5, "cmsOptionalDictionaryForKey:", CFSTR("notRequired"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
          goto LABEL_15;
        objc_msgSend(MEMORY[0x24BDD9B98], "notRequired");
        v8 = objc_claimAutoreleasedReturnValue();
      }
    }
    v9 = (void *)v8;
LABEL_15:

    goto LABEL_16;
  }
  v9 = 0;
LABEL_16:

  return v9;
}

@end
