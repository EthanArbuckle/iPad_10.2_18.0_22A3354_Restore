@implementation INDateComponentsRange(CMSCoding)

- (id)cmsCoded
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 3);
  objc_msgSend(a1, "startDateComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cmsCoded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cmsSetOptionalObject:forKey:", v4, CFSTR("startDateComponents"));

  objc_msgSend(a1, "endDateComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cmsCoded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cmsSetOptionalObject:forKey:", v6, CFSTR("endDateComponents"));

  objc_msgSend(a1, "recurrenceRule");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cmsCoded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cmsSetOptionalObject:forKey:", v8, CFSTR("recurrenceRule"));

  return v2;
}

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
    objc_msgSend(v3, "cmsOptionalDecodedClass:forKey:", objc_opt_class(), CFSTR("startDateComponents"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cmsOptionalDecodedClass:forKey:", objc_opt_class(), CFSTR("endDateComponents"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cmsOptionalDecodedClass:forKey:", objc_opt_class(), CFSTR("recurranceRule"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9C98]), "initWithStartDateComponents:endDateComponents:recurrenceRule:", v4, v5, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
