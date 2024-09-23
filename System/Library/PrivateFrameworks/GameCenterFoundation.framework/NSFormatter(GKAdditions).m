@implementation NSFormatter(GKAdditions)

- (void)_gkUpdateLocale
{
  void *v1;
  void *v2;
  id v3;

  v3 = a1;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 != v1)
    objc_msgSend(v3, "setLocale:", v1);

}

@end
