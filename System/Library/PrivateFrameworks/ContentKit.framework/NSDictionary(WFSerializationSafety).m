@implementation NSDictionary(WFSerializationSafety)

- (id)wfObjectOfClass:()WFSerializationSafety forKey:
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "objectForKey:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WFTypeCheckObject(v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)wfObjectOfClass:()WFSerializationSafety forKeyPath:
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "valueForKeyPath:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WFTypeCheckObject(v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
