@implementation NSString(AskPermission)

- (id)ap_percentEncodedString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD14A8], "URLHostAllowedCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
