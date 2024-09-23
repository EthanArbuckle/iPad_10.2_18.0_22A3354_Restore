@implementation BCConstants

+ (id)allowedAppleURNs
{
  if (qword_25529A5F8 != -1)
    dispatch_once(&qword_25529A5F8, &__block_literal_global_4);
  return (id)qword_25529A5F0;
}

void __31__BCConstants_allowedAppleURNs__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  id v6;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithObjects:", CFSTR("urn:biz:b15ed773-9eed-11e7-baa2-7b88b04daa8e"), 0);
  v1 = (void *)qword_25529A5F0;
  qword_25529A5F0 = v0;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "BOOLForKey:", CFSTR("AllowsInternalTestURIs")))
    v3 = CFPreferencesAppValueIsForced(CFSTR("AllowsInternalTestURIs"), (CFStringRef)*MEMORY[0x24BDBD580]) != 0;
  else
    v3 = 0;

  if ((MEMORY[0x22077FFD4]("+[BCConstants allowedAppleURNs]_block_invoke") & 1) != 0 || v3)
  {
    objc_msgSend((id)qword_25529A5F0, "setByAddingObjectsFromArray:", &unk_24E06AB48);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "copy");
    v5 = (void *)qword_25529A5F0;
    qword_25529A5F0 = v4;

  }
}

+ (BOOL)isRunningInMacCatalyst
{
  return 0;
}

+ (BOOL)isRunningInMac
{
  return 0;
}

@end
