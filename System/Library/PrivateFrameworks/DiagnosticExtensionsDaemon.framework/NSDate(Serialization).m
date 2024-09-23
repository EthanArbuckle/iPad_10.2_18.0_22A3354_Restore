@implementation NSDate(Serialization)

- (id)serialize
{
  void *v2;
  void *v3;

  formatter();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_dateWithString:()Serialization
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  formatter();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFromString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
