@implementation INIntent(CMSCoding)

- (id)cmsCoded
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("identifier"));
  objc_msgSend(a1, "intentDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("intentDescription"));
  objc_msgSend(v2, "setObject:forKey:", CFSTR("Intent"), CFSTR("class"));

  return v2;
}

+ (id)instanceFromCMSCoded:()CMSCoding
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  cmsSafeDictionary(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "cmsOptionalStringForKey:", CFSTR("class"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "isEqualToString:", CFSTR("PlayMediaIntent")))
    {
      objc_msgSend(MEMORY[0x24BDD9F60], "instanceFromCMSCoded:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
