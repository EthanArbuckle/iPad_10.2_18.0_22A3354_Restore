@implementation INMediaItem(CMSCoding)

+ (id)instanceFromCMSCoded:()CMSCoding
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  cmsSafeDictionary(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "cmsOptionalStringForKey:", CFSTR("identifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cmsOptionalStringForKey:", CFSTR("title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cmsOptionalStringForKey:", CFSTR("type"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = INMediaItemTypeFromString(v7);

    objc_msgSend(v4, "cmsOptionalDecodedClass:forKey:", objc_opt_class(), CFSTR("artwork"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cmsOptionalStringForKey:", CFSTR("artist"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9E50]), "initWithIdentifier:title:type:artwork:artist:", v5, v6, v8, v9, v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)cmsCoded
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cmsSetOptionalObject:forKey:", v3, CFSTR("identifier"));

  INMediaItemTypeToString(objc_msgSend(a1, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cmsSetOptionalObject:forKey:", v4, CFSTR("type"));

  return v2;
}

@end
