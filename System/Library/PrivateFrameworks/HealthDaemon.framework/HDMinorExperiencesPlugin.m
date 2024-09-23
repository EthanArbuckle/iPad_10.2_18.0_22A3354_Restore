@implementation HDMinorExperiencesPlugin

- (NSString)pluginIdentifier
{
  return (NSString *)CFSTR("com.apple.health.MinorExperiencesPlugin");
}

- (id)extensionForHealthDaemon:(id)a3
{
  return 0;
}

- (id)extensionForProfile:(id)a3
{
  id v3;
  HDMinorExperiencesProfileExtension *v4;

  v3 = a3;
  if (objc_msgSend(v3, "profileType") == 1)
    v4 = -[HDMinorExperiencesProfileExtension initWithProfile:]([HDMinorExperiencesProfileExtension alloc], "initWithProfile:", v3);
  else
    v4 = 0;

  return v4;
}

@end
