@implementation INUpdateMediaAffinityIntent(CMSCoding)

+ (id)instanceFromCMSCoded:()CMSCoding
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  cmsSafeDictionary(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v3, "cmsOptionalArrayOfDecodedClass:forKey:", objc_opt_class(), CFSTR("mediaItems"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cmsOptionalDecodedClass:forKey:", objc_opt_class(), CFSTR("mediaSearch"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cmsOptionalStringForKey:", CFSTR("affinityType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = INMediaAffinityTypeFromString(v6);

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA2A0]), "initWithMediaItems:mediaSearch:affinityType:", v4, v5, v7);
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
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&off_2553B8BA0;
  objc_msgSendSuper2(&v7, sel_cmsCoded);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", CFSTR("UpdateMediaAffinityIntent"), CFSTR("class"));
  objc_msgSend(a1, "mediaItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cmsSetOptionalCodedObject:forKey:", v3, CFSTR("mediaItems"));

  objc_msgSend(a1, "mediaSearch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cmsSetOptionalCodedObject:forKey:", v4, CFSTR("mediaSearch"));

  INMediaAffinityTypeToString(objc_msgSend(a1, "affinityType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cmsSetOptionalObject:forKey:", v5, CFSTR("affinityType"));

  return v2;
}

@end
