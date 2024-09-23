@implementation NSDictionary(KeyComparison)

- (uint64_t)cam_compareKey:()KeyComparison withDictionary:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v8, "isEqual:", v9);
  return v10;
}

@end
