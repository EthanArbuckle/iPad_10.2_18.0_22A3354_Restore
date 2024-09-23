@implementation NSString(ECEmailAddressConvertible)

- (id)stringValue
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a1, "emailAddressValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)objc_msgSend(a1, "copy");
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", &stru_1E7124200, &stru_1E7123500);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (ECEmailAddress)emailAddressValue
{
  return +[ECEmailAddress emailAddressWithString:](ECEmailAddress, "emailAddressWithString:", a1);
}

@end
