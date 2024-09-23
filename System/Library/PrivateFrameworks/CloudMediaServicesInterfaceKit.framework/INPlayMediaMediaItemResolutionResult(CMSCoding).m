@implementation INPlayMediaMediaItemResolutionResult(CMSCoding)

+ (id)instanceFromCMSCoded:()CMSCoding
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  objc_super v19;

  cmsSafeDictionary(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("unsupported"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("reason"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = (void *)MEMORY[0x24BDD9F70];
      if (v8)
      {
        v11 = v8;
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("loginRequired")) & 1) != 0)
        {
          v12 = 1;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("subscriptionRequired")) & 1) != 0)
        {
          v12 = 2;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("unsupportedMediaType")) & 1) != 0)
        {
          v12 = 3;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("explicitContentSettings")) & 1) != 0)
        {
          v12 = 4;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("cellularDataSettings")) & 1) != 0)
        {
          v12 = 5;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("restrictedContent")) & 1) != 0)
        {
          v12 = 6;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("serviceUnavailable")) & 1) != 0)
        {
          v12 = 7;
        }
        else if (objc_msgSend(v11, "isEqualToString:", CFSTR("regionRestriction")))
        {
          v12 = 8;
        }
        else
        {
          v12 = 7;
        }

        objc_msgSend(v10, "unsupportedForReason:", v12);
        v16 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD9F70], "unsupported");
        v16 = objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_32;
    }
    objc_msgSend(v5, "cmsOptionalDictionaryForKey:", CFSTR("needsValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(MEMORY[0x24BDD9F70], "needsValue");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "cmsOptionalDictionaryForKey:", CFSTR("notRequired"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        v19.receiver = a1;
        v19.super_class = (Class)&off_2553BA060;
        objc_msgSendSuper2(&v19, sel_instanceFromCMSCoded_, v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          v13 = 0;
LABEL_33:

          goto LABEL_34;
        }
        v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDD9F70]), "initWithMediaItemResolutionResult:", v9);
LABEL_32:
        v13 = (void *)v16;
        goto LABEL_33;
      }
      objc_msgSend(MEMORY[0x24BDD9F70], "notRequired");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v13 = (void *)v15;
LABEL_34:

    goto LABEL_35;
  }
  v13 = 0;
LABEL_35:

  return v13;
}

@end
