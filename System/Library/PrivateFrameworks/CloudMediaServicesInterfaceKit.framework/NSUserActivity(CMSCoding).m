@implementation NSUserActivity(CMSCoding)

- (id)cmsCoded
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "activityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v2, "setValue:forKey:", v3, CFSTR("activityType"));
  objc_msgSend(a1, "expirationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "cmsCoded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setValue:forKey:", v6, CFSTR("expirationDate"));

  }
  objc_msgSend(a1, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(a1, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _userInfoValueToJSONValue(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setValue:forKey:", v10, CFSTR("userInfo"));

  }
  return v2;
}

+ (id)instanceFromCMSCoded:()CMSCoding
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  cmsSafeDictionary(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "cmsOptionalStringForKey:", CFSTR("activityType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "cmsOptionalStringForKey:", CFSTR("title"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1960]), "initWithActivityType:", v5);
      objc_msgSend(v4, "cmsOptionalDateForKey:", CFSTR("expirationDate"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setExpirationDate:", v8);

      objc_msgSend(v7, "setTitle:", v6);
      objc_msgSend(v4, "cmsOptionalDictionaryForKey:", CFSTR("userInfo"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        _JSONValueToUserInfoValue(v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setUserInfo:", v11);

      }
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
