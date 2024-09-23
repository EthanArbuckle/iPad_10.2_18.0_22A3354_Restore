@implementation INAddMediaIntent(CMSCoding)

+ (id)instanceFromCMSCoded:()CMSCoding
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  cmsSafeDictionary(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v3, "cmsOptionalArrayOfDecodedClass:forKey:", objc_opt_class(), CFSTR("mediaItems"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cmsOptionalDecodedClass:forKey:", objc_opt_class(), CFSTR("mediaSearch"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cmsOptionalDecodedClass:forKey:", objc_opt_class(), CFSTR("mediaDestination"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9B88]), "initWithMediaItems:mediaSearch:mediaDestination:", v4, v5, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)cmsCoded
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&off_2553B8600;
  objc_msgSendSuper2(&v7, sel_cmsCoded);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", CFSTR("AddMediaIntent"), CFSTR("class"));
  objc_msgSend(a1, "mediaItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cmsSetOptionalCodedObject:forKey:", v3, CFSTR("mediaItems"));

  objc_msgSend(a1, "mediaSearch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cmsSetOptionalCodedObject:forKey:", v4, CFSTR("mediaSearch"));

  objc_msgSend(a1, "mediaDestination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cmsSetOptionalCodedObject:forKey:", v5, CFSTR("mediaDestination"));

  return v2;
}

@end
