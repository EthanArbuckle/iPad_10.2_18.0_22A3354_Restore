@implementation NSURL(AskPermission)

- (id)ap_secureURL
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", a1, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setScheme:", CFSTR("https"));
  objc_msgSend(v1, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
