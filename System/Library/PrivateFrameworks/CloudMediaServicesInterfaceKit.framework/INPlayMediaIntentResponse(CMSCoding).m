@implementation INPlayMediaIntentResponse(CMSCoding)

+ (id)instanceFromCMSCoded:()CMSCoding
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  cmsSafeDictionary(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "cmsOptionalDictionaryForKey:", CFSTR("nowPlayingInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cmsOptionalDecodedClass:forKey:", objc_opt_class(), CFSTR("userActivity"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cmsOptionalStringForKey:", CFSTR("code"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = INPlayMediaIntentResponseCodeFromString(v7);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9F68]), "initWithCode:userActivity:", v8, v6);
    objc_msgSend(v9, "setNowPlayingInfo:", v5);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)cmsCoded
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&off_2553B8250;
  objc_msgSendSuper2(&v9, sel_cmsCoded);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", CFSTR("PlayMediaIntentResponse"), CFSTR("class"));
  objc_msgSend(a1, "nowPlayingInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("nowPlayingInfo"));
  objc_msgSend(a1, "userActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "cmsCoded");
  else
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("userActivity"));

  INPlayMediaIntentResponseCodeToString(objc_msgSend(a1, "code"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("code"));

  return v2;
}

@end
