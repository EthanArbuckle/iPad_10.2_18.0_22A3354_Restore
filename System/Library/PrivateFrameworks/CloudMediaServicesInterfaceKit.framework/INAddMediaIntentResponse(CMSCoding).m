@implementation INAddMediaIntentResponse(CMSCoding)

+ (id)instanceFromCMSCoded:()CMSCoding
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  cmsSafeDictionary(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "cmsOptionalStringForKey:", CFSTR("code"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = INAddMediaIntentResponseCodeFromString(v5);

    objc_msgSend(v4, "cmsOptionalDecodedClass:forKey:", objc_opt_class(), CFSTR("userActivity"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9B90]), "initWithCode:userActivity:", v6, v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)cmsCoded
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&off_2553B87E0;
  objc_msgSendSuper2(&v8, sel_cmsCoded);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", CFSTR("AddMediaIntentResponse"), CFSTR("class"));
  objc_msgSend(a1, "userActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "cmsCoded");
  else
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("userActivity"));

  INAddMediaIntentResponseCodeToString(objc_msgSend(a1, "code"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("code"));

  return v2;
}

@end
