@implementation NSString(Localization)

- (id)localizedString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.DiagnosticsKit"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", a1, &stru_24F99B508, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
