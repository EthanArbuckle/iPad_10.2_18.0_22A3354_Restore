@implementation NSData(HKBase64URLEncoding)

- (id)hk_base64URLEncodedString
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "base64EncodedStringWithOptions:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR("-"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("="), &stru_24D54C670);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
