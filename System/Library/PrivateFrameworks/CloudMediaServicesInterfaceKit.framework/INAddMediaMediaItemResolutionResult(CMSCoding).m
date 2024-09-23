@implementation INAddMediaMediaItemResolutionResult(CMSCoding)

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
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  objc_super v20;

  cmsSafeDictionary(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("success"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v20.receiver = a1;
      v20.super_class = (Class)&off_2553BA250;
      objc_msgSendSuper2(&v20, sel_instanceFromCMSCoded_, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD9BA0]), "initWithMediaItemResolutionResult:", v7);
LABEL_5:
        v9 = (void *)v8;
LABEL_34:

        goto LABEL_35;
      }
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
        v13 = (void *)MEMORY[0x24BDD9BA0];
        if (v11)
        {
          v14 = v11;
          if ((objc_msgSend(v14, "isEqualToString:", CFSTR("loginRequired")) & 1) != 0)
          {
            v15 = 1;
          }
          else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("subscriptionRequired")) & 1) != 0)
          {
            v15 = 2;
          }
          else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("unsupportedMediaType")) & 1) != 0)
          {
            v15 = 3;
          }
          else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("explicitContentSettings")) & 1) != 0)
          {
            v15 = 4;
          }
          else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("cellularDataSettings")) & 1) != 0)
          {
            v15 = 5;
          }
          else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("restrictedContent")) & 1) != 0)
          {
            v15 = 6;
          }
          else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("serviceUnavailable")) & 1) != 0)
          {
            v15 = 7;
          }
          else if (objc_msgSend(v14, "isEqualToString:", CFSTR("regionRestriction")))
          {
            v15 = 8;
          }
          else
          {
            v15 = 7;
          }

          objc_msgSend(v13, "unsupportedForReason:", v15);
          v17 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD9BA0], "unsupported");
          v17 = objc_claimAutoreleasedReturnValue();
        }
        v9 = (void *)v17;

        goto LABEL_34;
      }
      objc_msgSend(v5, "cmsOptionalDictionaryForKey:", CFSTR("needsValue"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(MEMORY[0x24BDD9BA0], "needsValue");
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_5;
      }
      objc_msgSend(v5, "cmsOptionalDictionaryForKey:", CFSTR("notRequired"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(MEMORY[0x24BDD9BA0], "notRequired");
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_5;
      }
    }
    v9 = 0;
    goto LABEL_34;
  }
  v9 = 0;
LABEL_35:

  return v9;
}

@end
