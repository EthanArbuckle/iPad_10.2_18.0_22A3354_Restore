@implementation NSDictionary(CMSCoding)

- (id)cmsCoded
{
  void *v2;
  id v3;
  _QWORD v5[4];
  id v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __35__NSDictionary_CMSCoding__cmsCoded__block_invoke;
  v5[3] = &unk_24E1CC9B0;
  v3 = v2;
  v6 = v3;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v5);

  return v3;
}

+ (id)instanceFromCMSCoded:()CMSCoding
{
  void *v3;
  void *v4;
  void *v5;

  cmsSafeDictionary(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = (void *)objc_msgSend(v3, "copy");
  else
    v5 = 0;

  return v5;
}

@end
