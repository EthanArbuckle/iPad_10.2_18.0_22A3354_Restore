@implementation NSString(formDataEncoding)

- (id)formEncodedString
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-._* "));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("+"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)formDecodedString
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR("%20"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByRemovingPercentEncoding");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
