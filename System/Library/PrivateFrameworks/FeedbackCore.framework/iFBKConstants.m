@implementation iFBKConstants

+ (void)initialize
{
  void *v2;
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___iFBKConstants;
  objc_msgSendSuper2(&v3, sel_initialize);
  +[FBKSharedConstants sharedUserDefaults](FBKSharedConstants, "sharedUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerDefaults:", MEMORY[0x24BDBD1B8]);

}

+ (id)currentiOSLegalDoc
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLForResource:withExtension:subdirectory:localization:", CFSTR("License"), CFSTR("rtf"), 0, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLForResource:withExtension:", CFSTR("License"), CFSTR("rtf"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (CGSize)bugFormPreferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 600.0;
  v3 = 800.0;
  result.height = v3;
  result.width = v2;
  return result;
}

@end
