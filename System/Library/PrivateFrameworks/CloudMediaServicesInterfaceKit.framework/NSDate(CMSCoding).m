@implementation NSDate(CMSCoding)

- (id)cmsCoded
{
  void *v2;
  void *v3;

  cmsDateFormatter();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)instanceFromCMSCoded:()CMSCoding
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  cmsDateFormatter();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFromString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
